Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F15DC7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 10:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UCNaFIGajQZd3ssFKpijKio1+2oeXMW9tNpm1TIKxyM=; b=n9OdNpmiJqWbfF/Dnv3YPji7UT
	hNa9Je+Q00Sfls/EKcdWR7YhYaGaTcskDZnMAG8UDClqaP3XfrbhGnGhk0I14265z+M4Akb6IOxWc
	Z1rDrTFAqJb3x+SaVOBiXC537czui9Ef/o0aMs4CbxMxIvIy16r+enQ4PmlDML2kJ7fJrPcw5J5lL
	rpOdmM8Av3bYzu4sl39GpY6eeaUzWmjkRCsigK4bWn3HPfrDVSAbctVz7eNukAh9v8OX3W5TBWG8V
	ka2ahta9qGITj/uxQQyC80QEium7vke6nHBFfUolzsK7loAvQ97nL5M12R/+UBkTGriG3UB6+CGWb
	FRUfmsPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV5uS-0000000EBzh-0nJv;
	Fri, 27 Jun 2025 10:02:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV5s8-0000000EBdH-275b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 09:59:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 878591A00;
	Fri, 27 Jun 2025 02:59:34 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 61F2D3F58B;
	Fri, 27 Jun 2025 02:59:50 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Anirudh Rayabharam <anirudh@anirudhrb.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: smccc: support both conduits for getting hyp UUID
Date: Fri, 27 Jun 2025 10:59:47 +0100
Message-Id: <175101813277.203162.12125301148602551857.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250521094049.960056-1-anirudh@anirudhrb.com>
References: <20250521094049.960056-1-anirudh@anirudhrb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_025952_583304_1F318FDB 
X-CRM114-Status: UNSURE (   8.16  )
X-CRM114-Notice: Please train this message.
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

On Wed, 21 May 2025 09:40:48 +0000, Anirudh Rayabharam wrote:
> When Linux is running as the root partition under Microsoft Hypervisor
> (MSHV) a.k.a Hyper-V, smc is used as the conduit for smc calls.
> 
> Extend arm_smccc_hypervisor_has_uuid() to support this usecase. Use
> arm_smccc_1_1_invoke to retrieve and use the appropriate conduit instead
> of supporting only hvc.
> 
> [...]

Applied to sudeep.holla/linux (for-next/smccc/updates), thanks!

[1/1] firmware: smccc: support both conduits for getting hyp UUID
      https://git.kernel.org/sudeep.holla/c/1733432638f3
--
Regards,
Sudeep


