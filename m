Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B60EBE9A05A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 19:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7nzRTwEHSgMv4mMzfmLgtt/ifpBsoDPTuW35fG6MjXM=; b=3m8wnIAXkb7jGgy+IKMxshvfAT
	DHynoAbpzS87HyB4+ZHuBOtqfGoUfmnDlbm2h+B3KUB/R5fTip+4Vmm8N8TVj28uwF+V3t6FrqBn1
	vwxDLPKmCmU3BvuyJx6tCg/Jvwk5M6SCsEpwB7Ow5t+xKZkHmK16ZFCxetfxnOxa+/IVA50/vyDZC
	b060RHsWFUId+ZHwXomQpeTNppt6OuT72MLLx/2gvFn/rKJpNkhj9HWsTYWYfeeCG1pBcD06zh446
	9tF/+zIYPgSlms4ZgoEfeVWmo642u6MF7W0nsQdg2xwybYYApUxMdVA8h3xI3lEEW70zAm7JPd/DN
	TAboBRqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt9MK-0000000Bogp-1EBr;
	Thu, 19 Feb 2026 19:06:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt9MH-0000000Bog4-3tnb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 19:06:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F154D339;
	Thu, 19 Feb 2026 11:06:33 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B866A3F7D8;
	Thu, 19 Feb 2026 11:06:39 -0800 (PST)
Date: Thu, 19 Feb 2026 19:06:38 +0000
From: Leo Yan <leo.yan@arm.com>
To: Will Deacon <will@kernel.org>
Cc: James Clark <james.clark@linaro.org>, Marc Zyngier <maz@kernel.org>,
	kvmarm@lists.linux.dev, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	Oliver Upton <oupton@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH] KVM: arm64: Disable TRBE Trace Buffer Unit when running
 in guest context
Message-ID: <20260219190638.GE136967@e132581.arm.com>
References: <20260216130959.19317-1-will@kernel.org>
 <86a4x8bw38.wl-maz@kernel.org>
 <d2f6877a-534d-4862-a61c-fb3cb5b96618@linaro.org>
 <aZNec3B0Iou9PYGw@willie-the-truck>
 <20260217141917.GA136967@e132581.arm.com>
 <aZSAsC1YI5_lK3e0@willie-the-truck>
 <20260217190121.GB136967@e132581.arm.com>
 <aZcWC25GE2iUKsNt@willie-the-truck>
 <20260219185800.GD136967@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219185800.GD136967@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_110642_023180_DF2A83F9 
X-CRM114-Status: UNSURE (   8.47  )
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

On Thu, Feb 19, 2026 at 06:58:03PM +0000, Leo Yan wrote:

[...]

> The flow for guest->host might be easy one, anyway, I try to summary for
> review:
> 
>   Restore TRFCR_EL1;
> 
>   // Ensure restored sysreg is visible
>   isb();
> 
>   // Enable trace buffer
>   TRBLIMITR_EL1.E = 0b1
> 
>   // Enable trace unit
>   TRCPRGCTLR.EN = 0b1
> 
>   if (2038923)
>      isb();

To strictly follow the SDEN, this ISB should be moved to immediately
after enabling the TRBLIMITR_EL1.E bit and before enabling the
TRCPRGCTLR.EN bit.

Sorry for spamming.

