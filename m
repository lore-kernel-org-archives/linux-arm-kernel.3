Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B42C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 19:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1CJyunyawRyT6NVPV+xNlT8gvGQUIX4y5MepeUtCuw=; b=lkT8kcrdTOkSm+o7ASdYYcgBJU
	qX3g934d1rgGl0GRKLcOrFA5MDhD6Ilkq2ez0UviCAfyRBH6mSnIx+A8jHbFvb5mGMvU91tq6Li9L
	c0OJu/NNwV2fxORN5AF1mTAlVraLTQFZ9+gbuscbxjlyA449rrTjm5gcY1NKNZdPGe8D8QFjwGVJU
	4YGey4y7ML+7H3mYkIFmqPVFC05ykqX7efkj7UWkDNuPmrmxxX60LPsKa+dW0TBMZXtT5gHDftJS/
	iDoDxnUCD6YsE2DpbV7JuFlcDBByyjGqK7NTeYwrhlBP5pCcqZ1CDEWV5aj1MWqWrjHhSQOnMw+q5
	0q/XPkvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x96TC-00000006RuY-34jg;
	Tue, 22 Sep 2026 19:48:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x96TB-00000006RuA-2Rs0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 19:48:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B784C60142;
	Tue, 22 Sep 2026 19:48:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0315F1F000FF;
	Tue, 22 Sep 2026 19:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790106480;
	bh=U1CJyunyawRyT6NVPV+xNlT8gvGQUIX4y5MepeUtCuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GXxgk9nb3AMRlzRpSB3wYHO6yWArv2HDQ1w2erqc4s7yG9CCe0LvgUwkI9/DaQL6E
	 OImjKa38Cw+4XNbVdMFIB5ULBb4rQiVXc8o7n+wtohOXxVvWoOgD6Aus+nNEBVbKoI
	 jpqmg41TeuGBrerAgcjQXmmPVYUwBil8Wlfz3baU85xvoXdSpC2DumJnMpDJ5G+Hdk
	 4xa8+Rvpi9A58i0a00tuyndk3sug05u1wSWQgecI9tBCgsPARtW2UGiHdOhywVRknB
	 rI3Xcu1Hgpfsf0YSlvuhZWkAXYWI1bYHz99CCftV0DDZnIfgj1CsGH+N/xV0h9sq6d
	 2Iwth7b/DfGAg==
Date: Tue, 22 Sep 2026 12:47:58 -0700
From: Oliver Upton <oupton@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Rob Herring <robh@kernel.org>, James Clark <james.clark@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Fuad Tabba <tabba@google.com>, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64/boot: Disable trapping of PMZR_EL0 writes to EL2
Message-ID: <arLbbtuRuOrxlh1Y@kernel.org>
References: <20260922181430.3532371-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922181430.3532371-1-fuad.tabba@linux.dev>
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

Hi Fuad,

On Tue, Sep 22, 2026 at 07:14:30PM +0100, Fuad Tabba wrote:
> @@ -426,6 +427,11 @@
>  	orr	x0, x0, #HDFGRTR2_EL2_nPMICNTR_EL0
>  	orr	x0, x0, #HDFGRTR2_EL2_nPMICFILTR_EL0
>  	orr	x0, x0, #HDFGRTR2_EL2_nPMUACR_EL1
> +	orr	x2, x2, #HDFGWTR2_EL2_nPMICNTR_EL0
> +	orr	x2, x2, #HDFGWTR2_EL2_nPMICFILTR_EL0
> +	orr	x2, x2, #HDFGWTR2_EL2_nPMUACR_EL1
> +	/* PMZR_EL0 is write-only, so it has no read trap to disable */
> +	orr	x2, x2, #HDFGWTR2_EL2_nPMZR_EL0

We can trim 3 instructions from this by using the read-trap bits as the
starting point for the write-trap bits, like below. It also makes clear
the point that most of our trap bits are symmetrical for read and write.

Thanks,
Oliver

diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index aa8ec9df8024..6c5d2cc4e6fa 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -418,6 +418,7 @@
 	b.lt	.Lskip_fgt2_\@
 
 	mov	x0, xzr
+	mov	x2, xzr
 	mrs	x1, id_aa64dfr0_el1
 	ubfx	x1, x1, #ID_AA64DFR0_EL1_PMUVer_SHIFT, #4
 	cmp	x1, #ID_AA64DFR0_EL1_PMUVer_V3P9
@@ -426,6 +427,9 @@
 	orr	x0, x0, #HDFGRTR2_EL2_nPMICNTR_EL0
 	orr	x0, x0, #HDFGRTR2_EL2_nPMICFILTR_EL0
 	orr	x0, x0, #HDFGRTR2_EL2_nPMUACR_EL1
+
+	/* PMZR_EL0 is write-only, so it has no read trap to disable */
+	orr	x2, x0, #HDFGWTR2_EL2_nPMZR_EL0
 .Lskip_pmuv3p9_\@:
 	/* If SPE is implemented, */
 	__spe_vers_imp .Lskip_spefds_\@, ID_AA64DFR0_EL1_PMSVer_IMP, x1
@@ -439,7 +443,7 @@
 
 .Lskip_spefds_\@:
 	msr_s   SYS_HDFGRTR2_EL2, x0
-	msr_s   SYS_HDFGWTR2_EL2, x0
+	msr_s   SYS_HDFGWTR2_EL2, x2
 	msr_s   SYS_HFGRTR2_EL2, xzr
 	msr_s   SYS_HFGWTR2_EL2, xzr
 	msr_s   SYS_HFGITR2_EL2, xzr

