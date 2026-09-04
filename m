Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2F7C79F83
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 08:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WpIOvIK2/IKeoBTyPS1FpXMOk28YALsYNxySmYWmBa0=; b=MwpmiZw5GMGyonscM3HkzNGFtw
	9X8sziOx27Y4jyeJiNPz82+tyxXF3ShGohUL7kDiNDsCl4xhI2oGAit3MFRNo3rGDGlyZ0vfu+/7r
	XH5KEOstIk1E0JmGJL5aVazmYAEpvmYdBlot8f6rGu0FQdzrm7DUaibpwsYrgg9MX+GZ275z/JFb2
	tcrOUNxYsk/xBiiAXX6gxsVNZqH7TUv67LcSjP8Qg5vxWQ1IEd9skb3XfEZLpL+CLFD8o6HGnQGqH
	zSAQR67wDpdOdtS/zYOF+E+FtL0ps5XTLCPr/Qu1HgPlXFwvgJIkHcNkZpfRiFnHvqDD17sc8wpZj
	ulr7M1qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PhM-00000001T0d-17Zw;
	Fri, 04 Sep 2026 08:55:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PhL-00000001T0V-33mO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 08:54:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0A19F60A74;
	Fri,  4 Sep 2026 08:54:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81D0C1F00A3D;
	Fri,  4 Sep 2026 08:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788512098;
	bh=WpIOvIK2/IKeoBTyPS1FpXMOk28YALsYNxySmYWmBa0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U8k5Itm+x/8FEuee+UDlCYMbyQoC9MEH9uY7DeCd/yWdxW5+Olbt8r3TiZFAmywCj
	 Dhh5XXm5KudyPYceHRdeZmOPreIe1u0O50XciqP/5Cl2VV+bdazxBDZOrDLgeYLhfW
	 AvCaRGpIwy4byAnl6pi1q35onn7+yczkm/inFgMcezZQAe3mRm0P5fqpxpJAy1NNFs
	 0Up1nSjH9435PPNwoGiPBj5YaRLjhlbp/NFVOXs9U0JEhjWKATJ4uDIGiZzs8aVJ8U
	 YCruon+cWiSo/OFqECQ2BuSziHTFpDpgeK8itYjZPPl4v10u37BlEEh22mJHkQqINf
	 VZ+iJTOvWS5ZA==
Date: Fri, 4 Sep 2026 09:54:51 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Peter Maydell <peter.maydell@linaro.org>, 
	Leonardo Bras <leo.bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
	Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 03/14] KVM: arm64: Manage GCS access and registers
 for guests
Message-ID: <apqA_SuoA6-TyHsS@gremlin>
References: <20260901-arm64-gcs-v20-0-f31750bdfadb@kernel.org>
 <20260901-arm64-gcs-v20-3-f31750bdfadb@kernel.org>
 <apmfx08vccSd2MXw@gremlin>
 <d2659ac3-2f00-4fc4-8f9e-0585691a4ba2@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2659ac3-2f00-4fc4-8f9e-0585691a4ba2@sirena.org.uk>
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

On Thu, Sep 03, 2026 at 09:41:26PM +0100, Mark Brown wrote:
> On Thu, Sep 03, 2026 at 07:13:17PM +0100, Lorenzo Stoakes (ARM) wrote:
> > On Tue, Sep 01, 2026 at 10:47:01PM +0100, Mark Brown wrote:
>
> > > GCS introduces a number of system registers, on systems with GCS we need
> > > to context switch them and expose them to VMMs to allow guests to use
> > > GCS.
>
> > > +				ctxt_sys_reg(ctxt, GCSCR_EL1)	= read_sysreg_el1(SYS_GCSCR);
> > > +			}
>
> > I had AI check this (and I think sashiko also hit on) it but this is a chain of:
>
> > 	ctxt_has_tcrx() -> ctxt_has_s1pie() -> ctx_has_gcs()
>
> > Is it correct to make the gcs stuff conditional on tcrx + s1pie + gcs?
>
> There are architectural dependencies which mean it is not valid to
> configure GCS without S1PIE, and S1PIE depends on TCRX.  I had

Ack yeah I think I note that elsewhere, so it reduces only to the 'users doing
weird stuff' case :)

> originally written the code without expressing this dependency but on a
> previous version Marc asked for this nesting as an optimisation.  Since
> it's about optimisastion adding checks that don't otherwise exist on the
> restore path would doubtless get the similar complaints.  Exactly the
> same concerns were raised on v19.

Could you implement the nesting the same in the cases where there is a bare
ctx_has_gcs() as an alternative?

So then it'd always be tcrx -> s1pie -> gcs everywhere and that'd resolve things
also and make things symmetric.

You could also I think express the dependency if it makes sense to.

>
> > And it seems like that feature depends on ctxt_has_tcrx() so _architecturally_
> > fine, but it doesn't seem like KVM enforces the dependency at all and so in
> > theory somebody could KVM_SET_ONE_REG a GCS, !S1PIE configuration.
>
> > And nicer to be consistent everywhere also I think (+ shut sashiko up! :)
>
> FWIW I do agree but I'm not sure how else to implement Marc's feedback
> here.

Ack sure of course.

>
> We could do checking of the ID registers at vCPU creation so we could
> avoid worrying about them in the fast path but there was also feedback
> about not doing that.  One idea I had was to generate feature

Could you possibly check in sanitise_id_aa64pfr1_el1(), something like:

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index fb2c9fd42e24..ba8780745987 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2193,7 +2193,8 @@ static u64 sanitise_id_aa64pfr1_el1(const struct kvm_vcpu *vcpu, u64 val)
 	      SYS_FIELD_GET(ID_AA64PFR0_EL1, RAS, pfr0) == ID_AA64PFR0_EL1_RAS_IMP))
 		val &= ~ID_AA64PFR1_EL1_RAS_frac;

-	if (!system_supports_gcs())
+	if (!system_supports_gcs() || !kvm_has_tcr2(vcpu->kvm) ||
+	    !kvm_has_s1pie(vcpu->kvm))
 		val &= ~ID_AA64PFR1_EL1_GCS;

 	val &= ~ID_AA64PFR1_EL1_SME;
--

And that way it slots in next to the system check?

> combination validation from the MRS, I think the main complaint was
> about open coding things rather than having the validation per se but
> ICBW.  Last I heard we were very near to having code for working with
> the MRS released which will help a lot with uses like that.  There is

Yeah that sounds like a really neat way of solving it! And a useful idea in
general.

> the possibility that people are relying on doing architecturally
> invalid configurations though.

Yeah, I guess it's possible somebody could think they could just set a single
register and use it or something.

>
> > And it seems like it makes it possible for a silly VMM which sets up the
> > registers wrong + some unfortunate guest behaviour -> oops via:
>
> > el1h_64_sync_handler() -> el1_gcs() -> do_el1_gcs()
>
> > Because the host's restore is skipped for s1pie=0, gcs=1, so a naughty guest can
> > set gcsr_el1.pcrsel=1 and some value in gcspr_el1, then the host will get a
> > mismatch and trigger the kernel die().
>
> Yes, that's possible.  GCSCR_EL1.EXLOCKEN would create similar issues.

Yeah :(

--
Cheers, Lorenzo

