Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF78CD2502E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 15:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u9tlCA9knL0IStS5phUmbSTagUiA37UZn8AuPtV/EJg=; b=n/MJ71u0aAaRAKjI5Ba4OAwkkV
	usj4iSMYdsRTHmZFb7BvXwaTNJvvGEXUrWCnQp8wZlrYTuYmqNXniEcBn3Pwd0GiqGlLMziPnm+Gi
	en1MIogR8U+ppmDP1d7VLCbzD+jJu41ZShs+sNM6gNQg+DmnqP7cb2DSSjocQWlI5+tqhaC8A8HkS
	T033uyR9c1/eovbbP5KHttJ9iOwAGnzUtzbc66MjSqhNHv/4RGFXCQi/LAkAAE5/KUDAUIobJqKXV
	Zq+HF25nmoHxTpGJr2n03Qs4kYpQdzKMWVApu0Y8SbFHkc+Qi58arSJrsoMbHLs3vDf6hPfmaGuBZ
	3ZD6JbRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vffy8-00000007K5J-2dwV;
	Tue, 13 Jan 2026 15:06:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vffy2-00000007K4y-3o0A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 15:06:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1734260051;
	Tue, 13 Jan 2026 15:05:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FA37C116C6;
	Tue, 13 Jan 2026 15:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768316757;
	bh=Xf5PxXObJb1p8ordy+fY/duh24byIHYMJ9YaRb9qn1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m4ly5Q5TCjqSluQ9NvuxIe6iBKfTcKlHfDKbap6DpUAwMdMJaZxaEArYOcFiGrr2G
	 jPcu9HN8R7QvxvE9NDnJKrkrJk8iEHSWB9EFYCH5/PJkznz3O7rmVbGVxE0fPpxx9N
	 sns1RG6zenoH+IJAMiO5QrJmg4o2nM5cFh3hs3hfZpxkH/r3TBnJvaT5ZD6cpPmxlv
	 qly9AxWL5y99b0e6u2gU2GTDSB8baOQKcM04QPb97002/8Nr3SWYI9tkocOzPLMl1w
	 8iNsHcamIH3KmNI4IZprJdhMccZ0l03BHBOjDAxv+piXOMghIc0mrb0z6OtdH6O1PZ
	 PS3YjhZWCY+tw==
Date: Tue, 13 Jan 2026 15:05:52 +0000
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, robin.murphy@arm.com, joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, skolothumtho@nvidia.com,
	praan@google.com, xueshuai@linux.alibaba.com, smostafa@google.com
Subject: Re: [PATCH rc v5 1/4] iommu/arm-smmu-v3: Add update_safe bits to fix
 STE update sequence
Message-ID: <aWZfUNXEka3GBf9s@willie-the-truck>
References: <cover.1766093909.git.nicolinc@nvidia.com>
 <58f5af553fa7c3b5fd16f1eb13a81ae428f85678.1766093909.git.nicolinc@nvidia.com>
 <aV7OBrH-TDiGRblt@willie-the-truck>
 <20260108003646.GA537728@nvidia.com>
 <aWUY-f3kvM94z4qh@willie-the-truck>
 <20260112161010.GC812923@nvidia.com>
 <aWVETpwlx9Rhs8Kw@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWVETpwlx9Rhs8Kw@Asurada-Nvidia>
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

On Mon, Jan 12, 2026 at 10:58:22AM -0800, Nicolin Chen wrote:
> On Mon, Jan 12, 2026 at 12:10:10PM -0400, Jason Gunthorpe wrote:
> > Still, it seems easy enough to improve, do not add EATS to the safe
> > bits if either the current or new STE has S2S set. That will force a
> > V=0 and avoid the illegal STE. Nicolin?
> 
> Ack. I made the following changes:
> -----------------------------------------------------------------
> @@ -1083,7 +1083,8 @@ void arm_smmu_get_ste_used(const __le64 *ent, __le64 *used_bits)
>  EXPORT_SYMBOL_IF_KUNIT(arm_smmu_get_ste_used);
> 
>  VISIBLE_IF_KUNIT
> -void arm_smmu_get_ste_update_safe(__le64 *safe_bits)
> +void arm_smmu_get_ste_update_safe(const __le64 *cur, const __le64 *target,
> +                                 __le64 *safe_bits)
>  {
>         /*
>          * MEV does not meaningfully impact the operation of the HW, it only
> @@ -1097,13 +1098,22 @@ void arm_smmu_get_ste_update_safe(__le64 *safe_bits)
>         safe_bits[1] |= cpu_to_le64(STRTAB_STE_1_MEV);
> 
>         /*
> -        * EATS is used to reject and control the ATS behavior of the device. If
> -        * we are changing it away from 0 then we already trust the device to
> -        * use ATS properly and we have sequenced the device's ATS enable in PCI
> -        * config space to prevent it from issuing ATS while we are changing
> -        * EATS.
> +        * When a STE comes to change EATS the sequencing code in the attach
> +        * logic already will have the PCI cap for ATS disabled. Thus at this
> +        * moment we can expect that the device will not generate ATS queries
> +        * and so we don't care about the sequencing of EATS. The purpose of
> +        * EATS is to protect the system from hostile untrusted devices that
> +        * issue ATS when the PCI config space is disabled. However, if EATS
> +        * is being changed then we already must be trusting the device since
> +        * the EATS security block is being disabled.
> +        *
> +        *  Note: Since we moved the EATS update to the first phase, changing
> +        *  S2S and EATS might transiently set S2S=1 and EATS=1, resulting in
> +        *  a bad STE. See "5.2 Stream Table Entry". In such a case, we can't
> +        *  do a hitless update.
>          */
> -       safe_bits[1] |= cpu_to_le64(STRTAB_STE_1_EATS);
> +       if (!((cur[2] | target[2]) & cpu_to_le64(STRTAB_STE_2_S2S)))
> +               safe_bits[1] |= cpu_to_le64(STRTAB_STE_1_EATS);

I suppose we shouldn't ever see the case that they both have S2S, but
that's fine.

The spec also suggests that there's an additional illegal STE case w/
split-stage ATS (EATS_S1CHK) if Config != S1+S2.

I do wonder whether having all the hitless machinery alongside this
"safe" stuff is really overkill and we wouldn't be better off just
checking the cases that we actually care about rather than checking
architecturally and then subtracting the cases we don't care about.

Will

