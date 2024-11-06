Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D66D59F52
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 17:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CbAZiRdyvGGSYMqngStZPW1TjaUlok6mPi+2oC7PgZ4=; b=Mf0UgD7wPbztnf+eKhsdFIn5gv
	CcKsYKWg58O+veSTs5t56c8cls+75Ndhm1LpH1FX06UBVTMq0OjciLHDSLFTECMbOrX3eejT3HwTu
	8oQ/mEjNSkscKwXo/uSwFXLYHRuVd6q0c2zryqd/VfQIOz7CXLhLmdvXOC918maLXjGQ5vg/6Ua2h
	qBbkOpOCZHD2X7ngdojmW7r7+Ggba6oCRuZZr61YANRqmTaF8VY+KwYuNtaVdRiD9YKRVS25LUNZC
	ktgOhfABRZ0BCs5IJR03mJ2GiVaYhkRbH5Js+lofrdF19+5KNOs0UJMSYCokZFYay563W6PdBDNCz
	4IchpwVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8jSd-0000000485J-3xwH;
	Wed, 06 Nov 2024 17:04:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8jNY-000000047DJ-3EBp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 16:59:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7437D5C0438;
	Wed,  6 Nov 2024 16:58:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85683C4CEC6;
	Wed,  6 Nov 2024 16:59:33 +0000 (UTC)
Date: Wed, 6 Nov 2024 16:59:31 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, ardb@kernel.org,
	broonie@kernel.org, maz@kernel.org, stable@vger.kernel.org,
	will@kernel.org
Subject: Re: [PATCH] arm64: Kconfig: Make SME depend on BROKEN for now
Message-ID: <Zyugcxz4Uu654ZvZ@arm.com>
References: <20241106164220.2789279-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106164220.2789279-1-mark.rutland@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_085936_871769_6BB8F230 
X-CRM114-Status: GOOD (  14.55  )
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

On Wed, Nov 06, 2024 at 04:42:20PM +0000, Mark Rutland wrote:
> Although support for SME was merged in v5.19, we've since uncovered a
> number of issues with the implementation, including issues which might
> corrupt the FPSIMD/SVE/SME state of arbitrary tasks. While there are
> patches to address some of these issues, ongoing review has highlighted
> additional functional problems, and more time is necessary to analyse
> and fix these.
> 
> For now, mark SME as BROKEN in the hope that we can fix things properly
> in the near future. As SME is an OPTIONAL part of ARMv9.2+, and there is
> very little extant hardware, this should not adversely affect the vast
> majority of users.
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: <stable@vger.kernel.org> # 5.19

I agree that's the best way forward given the proximity to final 6.12.
Let's hope we'll revert it shortly after. Thanks to both you and broonie
for continuing to dig into this.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

