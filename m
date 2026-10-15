Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E7DCC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 13:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+eY/8SzCL1ecc1E0dSwRAQE+0x44i8QCx5GpklEFvyk=; b=yKTAM92UcBdFBK+/VEaHgpXHhS
	eA4OB2APBHYSaGrEY+qNUQBfwKSvcU7a3GMb3d5/dwQHWrZKfTQWeweBKze3EXlhlk9Sz+aRzvOGP
	ZHBJgB2dkSopA4bgv0W0VZZRXXl9uBeqycp49u7hDCef8cahj7w/lh4Xdf3WCrady76sYsMbjkF8G
	a3dbwVDUH6tPbc/FXdCCcTKLkckIDiV2urabZZ4ZhBaC88GsNYyFF17Ybszyqrv0X5IilHIsLXe/T
	8rdWlDA7xCOkqsqJHoNKP5DWBjJAunVpfgYZKaXFlcPv3frr2HLnHSMd+pcvMf49M/VHq7v5PqsDI
	qZtQHFxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHLR8-00000000FIF-1vQJ;
	Thu, 15 Oct 2026 13:23:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHLR5-00000000FHt-2e7S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 13:23:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E31FC60120;
	Thu, 15 Oct 2026 13:23:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 920001F000C4;
	Thu, 15 Oct 2026 13:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792070634;
	bh=+eY/8SzCL1ecc1E0dSwRAQE+0x44i8QCx5GpklEFvyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VA/+0ZyT1W/3GVjxBq/7MbPKIu8VyMVho+se3aTX141PFcM5oRFgngzOxri2VltNG
	 unQOfMVuVV5vlGLFeHUJ7hMTAiAnRVeQg6Wucwn5hGIpwLntLb+zTwpjpQSzUO66VJ
	 z0AP1U+H/PZBgS8EDZMGZn46xuncawpSQ7l3euLYagD8thprcM9jJoHkzXGaeZwSUT
	 zZZilFktQbjJGGoITO7eDDdq12O+aXr9/XFfKvjRJ2VmQk9PELyoYI4rqhnFqrkNRE
	 +eZUfj3YjybTTZN5JO661blh7+kSnrFuccsXZLWyfaFw4TAOHwnpDKUvczs0V1zYzS
	 j1+9h6bgp+Vbw==
Date: Thu, 15 Oct 2026 14:23:47 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, fuad.tabba@linux.dev, 
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	will@kernel.org, mark.rutland@arm.com, linux-perf-users@vger.kernel.org, 
	catalin.marinas@arm.com, james.clark@linaro.org
Subject: Re: [RFC PATCH v7 01/28] arm64/sysreg: Add the nVM field to
 PMBLIMITR_EL1
Message-ID: <atDOmDNrAwLNC8_h@gremlin>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
 <20260903160623.315525-2-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903160623.315525-2-alexandru.elisei@arm.com>
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

On Thu, Sep 03, 2026 at 05:05:56PM +0100, Alexandru Elisei wrote:
> Define PMBLIMITR_EL1.nVM, to be used by KVM.

I see that is defined in [0].

>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>

LGTM, matches the hardware spec and in line with other entries in the file,
so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  arch/arm64/tools/sysreg | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 94bf065c8ac7..a11a968eb707 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -3106,7 +3106,9 @@ EndSysreg
>
>  Sysreg	PMBLIMITR_EL1	3	0	9	10	0
>  Field	63:12	LIMIT
> -Res0	11:6
> +Res0	11:8

I can see from the diagram in the field descriptions section of [0] that 11->8
is res0...

> +Field	7	nVM

...and nVM is defined at bit 7...

> +Res0	6

...and res0 is at 6.

>  Field	5	PMFZ
>  Res0	4:3
>  Enum	2:1	FM

I also confirmed the existing fields are all correct too.

> --
> 2.43.0
>
>

--
Cheers, Lorenzo

[0]:https://support.arm.com/documentation/ddi0601/2026-09/AArch64-Registers/PMBLIMITR-EL1--Profiling-Buffer-Limit-Address-Register?lang=en

