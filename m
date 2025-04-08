Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A8BC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 10:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zn/6dtRSmD12DHn/WcurOO3OYYcWh0CVpCPydGJtGts=; b=usI36rv+XIwOKDEZRmaqAIOq/p
	u4Ec5P5DNqy5ZV0pH6Mj1EwM21QvvGb0TGqpUEYH/lye1DFp1zpPubcKzpi5lltgqaGCjZj5EY9HG
	ZYU+luyaUABR4htVWBYI4iKhA/dEMu5FNvXDW/lUqHIOIod0H+xETly+kijEPJoyTGBE2CFD+WU+W
	mj8m15Pxedrs1UJHq4Vo6PMAPdiIOGKUQuBGTnFJDBUCAaBXUNpuuY00Kg2N2mPd76wP7p0J2mhaw
	bp3DxwFaqOVw5oTcvl2lPXN89De751FcRoFutwORWlxVk9maDOOMIXX/pVVnCAaIPPdc1DISi+lKJ
	5NceAfRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26ct-00000003lAU-2lPC;
	Tue, 08 Apr 2025 10:56:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u263b-00000003d1h-2tVZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 10:19:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 865AA1688;
	Tue,  8 Apr 2025 03:19:51 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 189753F6A8;
	Tue,  8 Apr 2025 03:19:49 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] firmware: arm_ffa: Skip Rx buffer ownership release if not acquired
Date: Tue,  8 Apr 2025 11:19:47 +0100
Message-Id: <174410739378.2542864.1959875761376742729.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250321115700.3525197-1-sudeep.holla@arm.com>
References: <20250321115700.3525197-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_031951_789657_F961E1AD 
X-CRM114-Status: GOOD (  10.75  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, 21 Mar 2025 11:57:00 +0000, Sudeep Holla wrote:
> Completion of the FFA_PARTITION_INFO_GET ABI transfers the ownership of
> the caller’s Rx buffer from the producer(typically partition mnager) to
> the consumer(this driver/OS). FFA_RX_RELEASE transfers the ownership
> from the consumer back to the producer.
> 
> However, when we set the flag to just return the count of partitions
> deployed in the system corresponding to the specified UUID while
> invoking FFA_PARTITION_INFO_GET, the Rx buffer ownership shouldn't be
> transferred to this driver. We must be able to skip transferring back
> the ownership to the partition manager when we request just to get the
> count of the partitions as the buffers are not acquired in this case.
> 
> [...]

Applied to sudeep.holla/linux (for-next/ffa/fixes), thanks!

[1/1] firmware: arm_ffa: Skip Rx buffer ownership release if not acquired
      https://git.kernel.org/sudeep.holla/c/4567bdaaaaa1
--
Regards,
Sudeep


