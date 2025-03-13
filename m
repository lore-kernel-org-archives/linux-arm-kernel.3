Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B7BC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 22:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FXnwyIrlYjRja8w5zbDnlPmt00MdMjTHLA8rcuJYBjc=; b=NCkv7PL8Hb1foVco4kIypul7Dp
	bfszEuG1rgrX0ldjPh+D/zJjh/XSOz8lD/gIegHxdt0dLq2r8saDe1+RetDLaZg6XKQU9Pt8cxUP7
	QcCCycfahx4Clcq/nhtWNd4Avi95lotMquDVNeEYiMZQRg5B/XTxqd42Z7XQTubYwJa1WVUBAlgej
	DHgMjUCw1GqErsk9cFA+jWO3MPf3mEzoANup23PHJHfhNkZZn32+lTn2tibxtSUiYQckGbwQgMOTy
	KE02zvUP26ZgsESg/XVPwbUPuJj+QsYT3DRTsYrZBdU2kSa8Y7Yudoa653PMjGe762Fxm9tNSzKU8
	a6DErk3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsqao-0000000CZd5-1g0r;
	Thu, 13 Mar 2025 21:59:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsqXz-0000000CZA9-3jw8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 21:57:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 978A25C5F6A;
	Thu, 13 Mar 2025 21:54:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E558C4CEDD;
	Thu, 13 Mar 2025 21:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741903019;
	bh=yrnuKSIDcUeOE2Ia1gcmbVXvf0a2OSMKLH8MMZOfz70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MdB5fPEKxtsJL0sOPHXAWUnzKZaCP3AAuMkuhxF/x3L4yspa+52lC+7dbyzFDmqVH
	 LbngK8rmVBIRjaRuK9ZCUWnSWBzCBREL02+NcqEZAzaNBinzPV9y6xJzu6IoJPgp7k
	 wLz5OO3J+ykcR6eEQ6nMyByPniqbD7GEGw4vyFTh7/mgfhppBuLuuMp34xtSSrWSFs
	 ddMikFcQrLI/HNS16/lDkRXZonCR7m+66KW5eIdxkKYvjNMsu185RBa5wK7x/xmpVh
	 J/Cg/ixquLhIQZjqI5NqQfN16ie0pY57IyRvSeOu9yZt3cJ2l39LRLXx9d/e76oeZY
	 p1FsEjlDwelUg==
Date: Thu, 13 Mar 2025 21:56:54 +0000
From: Will Deacon <will@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, robh@kernel.org,
	broonie@kernel.org, maz@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] arm64/sysreg: Fix unbalanced closing block
Message-ID: <20250313215652.GB8101@willie-the-truck>
References: <20250115162600.2153226-1-james.clark@linaro.org>
 <20250115162600.2153226-2-james.clark@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115162600.2153226-2-james.clark@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_145659_968727_16A761A5 
X-CRM114-Status: GOOD (  17.06  )
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

On Wed, Jan 15, 2025 at 04:25:55PM +0000, James Clark wrote:
> This is a sysreg block so close it with one. This doesn't make a
> difference to the output because the script only matches on the
> beginning of the word to close blocks which is correct by coincidence
> here.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  arch/arm64/tools/sysreg | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 762ee084b37c..bbe7df69da9c 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -2074,7 +2074,7 @@ EndEnum
>  Res0	4:2
>  Field	1	ExTRE
>  Field	0	E0TRE
> -EndSysregFields
> +EndSysreg
>  
>  Sysreg	SMPRI_EL1	3	0	1	2	4
>  Res0	63:4
> -- 
> 2.34.1

Acked-by: Will Deacon <will@kernel.org>

Will

