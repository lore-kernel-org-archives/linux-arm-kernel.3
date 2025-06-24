Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDBFC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 19:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=udzULH8FCTamfLjlTHQSFGMImnGueeEOMWQkVYiecok=; b=pAhN36YAduY2MflNYZZhDJDEHE
	Tu62fc0dg0wvnu0GUszLpCTPA/c2X5VXYS1FLCBLfVo8edWsnsukiPdCpjiopOFv0yqBDCn18fNh+
	LTeJNUNG2Pi3t1L98LZi8HeJ6ufY/j4W/fjh1MUT/w1SxRHrkew/Rrv00jOUT5pZcJt+5v5esg8FG
	AsIxnJ0BYTmhWL0psZR3Ui83yEVplMBdD792S88J9XFyL6z3RNQeEMF//XWqTBE0rQ6LIVuldccAu
	+XDwyX3fXnrb+C8x3L1u+mwvnVF/vuialdY3ISSKtIV0Ij3Se+DwZO4gVaE4/jfWLwpKMY/toNl8x
	jOq/bSMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9je-00000006g6O-0KGo;
	Tue, 24 Jun 2025 19:55:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU6as-00000006H7m-2j2A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 16:33:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0B97F5C66F7;
	Tue, 24 Jun 2025 16:31:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E4EC4CEE3;
	Tue, 24 Jun 2025 16:33:54 +0000 (UTC)
Date: Tue, 24 Jun 2025 17:33:52 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, pcc@google.com, will@kernel.org,
	broonie@kernel.org, anshuman.khandual@arm.com, joey.gouly@arm.com,
	yury.khrustalev@arm.com, oliver.upton@linux.dev,
	frederic@kernel.org, akpm@linux-foundation.org, surenb@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v9 03/10] arm64/kvm: expose FEAT_MTE_TAGGED_FAR feature
 to guest
Message-ID: <aFrTcGt-g5sc-uv0@arm.com>
References: <20250618084513.1761345-1-yeoreum.yun@arm.com>
 <20250618084513.1761345-4-yeoreum.yun@arm.com>
 <86ldppc86c.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ldppc86c.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_093358_727817_93306699 
X-CRM114-Status: GOOD (  13.67  )
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

Hi Marc,

On Wed, Jun 18, 2025 at 05:43:07PM +0100, Marc Zyngier wrote:
> In general, please use a patch title format that matches the one used
> for the subsystem. For KVM, that'd be "KVM: arm64: Expose ..."/
[...]
> >  	case SYS_ID_AA64PFR2_EL1:
> > -		/* We only expose FPMR */
> > -		val &= ID_AA64PFR2_EL1_FPMR;
> > +		mask = ID_AA64PFR2_EL1_FPMR;
> > +
> > +		if (kvm_has_mte(vcpu->kvm))
> > +			mask |= ID_AA64PFR2_EL1_MTEFAR;
> > +
> > +		val &= mask;
> 
> I don't think there is a need for an extra variable, and you could
> follow the pattern established in this file by writing this as:
> 
> 	val &= (ID_AA64PFR2_EL1_FPMR |
> 		(kvm_has_mte(vcpu->kvm) ? ID_AA64PFR2_EL1_MTEFAR : 0));
> 
> Not a big deal though.

I can make the changes locally. Are you ok with the patch otherwise?

-- 
Catalin

