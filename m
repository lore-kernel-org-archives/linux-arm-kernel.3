Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5115EED630
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 17:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y2LHsCmAIp6K7mL6VLrkDIB2ev1RPKuedFqPCMtxwoQ=; b=aMeNBaT6lFkmdpW3Np0T0avCMg
	LvfTGfB3JimIUR2LF4MFCoLddTZfCs8G5HJuw09aIqcp4PDBG4yY0jrcCumofMNBei0z+BnUiVpum
	P/Mf55NXvc6nD+Q6o1TwSPvUcL8VEWYkTb0YSsy6MUXnnvzHgm02YxNkGg17d7oOiuoXd7VQLYiO5
	nj6vUieigTJGa0tvzRPVgqLxGUkoi0pjT+1zVt0bkW4yFGMpOrj6NiKSJ/rU+fOk+3ALQgnMC2Q3S
	82TLCfY5fshe53s5eUmrr30zYkDnzwHUcxPemUK4S0F95OPet8vhESXzCTYL0j/75GvnDzGbI46VK
	OP5kIwQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbMvk-00000007Q1u-2qJk;
	Thu, 01 Jan 2026 17:57:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbMve-00000007Q1S-0KpA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 17:57:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B8F4497;
	Thu,  1 Jan 2026 09:57:34 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D5E143F63F;
	Thu,  1 Jan 2026 09:57:39 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: cristian.marussi@arm.com,
	Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	mike.tipton@oss.qualcomm.com
Subject: Re: [PATCH 1/1] firmware: arm_scmi: Increase MAX_OPPS to 64
Date: Thu,  1 Jan 2026 17:57:36 +0000
Message-ID: <176729019292.118211.14540259893282155265.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014073454.461999-1-vivek.aknurwar@oss.qualcomm.com>
References: <20251014073454.461999-1-vivek.aknurwar@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_095742_154098_CE80C11C 
X-CRM114-Status: UNSURE (   6.00  )
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

On Tue, 14 Oct 2025 00:34:54 -0700, Vivek Aknurwar wrote:
> Some upcoming SoCs define more than 32 operating performance points (OPPs),
> exceeding the current SCMI protocol limit. Increase MAX_OPPS to 64
> (next power of 2) to support these configurations.
> 

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] firmware: arm_scmi: Increase MAX_OPPS to 64
      https://git.kernel.org/sudeep.holla/c/6c2fd7a71e7a
--
Regards,
Sudeep


