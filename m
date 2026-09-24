Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCEEC9831E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 22:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9lTk9HKkaCEZkNbTtcdgRDBlqeemuAp3XPisqKa2/VE=; b=0Og8T3bxGNFlxXdWgx8Odk0JlT
	CLWU8y9LLx0Cf0hfwhJyGmCM9wi+jc/rFXtrFzql7b02UuJUzExCEd7jqvlZmSRI0ju99wC7Ke9bb
	+k9LOZcQOpfWZLchhTaWEBM+sCN7CUJo9MxURbglwBnGVXWH+91PK0nkS801YLd814UPcxY3h0PQn
	lKlEcC4ZGahjMdHH72VrvYWvHeS+qxKSJcatFEZCTsqG70dcDBmb6Q9KXhrMJ2fKFMx8fn14rQW1i
	/epQVezl11tHJ8lJWAeJHsVaKNEqVTuQTrXTKtq6aRfk1f/ALX33Xo0i8Heh/T3jAzBoL5GGseMfe
	/KBgf3BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9rwS-0000000CHiP-2hq5;
	Thu, 24 Sep 2026 22:29:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9rwQ-0000000CHiF-430V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 22:29:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F0EF7601DE;
	Thu, 24 Sep 2026 22:29:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0B1A1F000FF;
	Thu, 24 Sep 2026 22:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790288961;
	bh=9lTk9HKkaCEZkNbTtcdgRDBlqeemuAp3XPisqKa2/VE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Cm9MLLdMqefLdn0f4fB3SmLd0hLcSZ+vRIzYltU3WJeSP2uQBClxrlvCK52bKVzNH
	 RZxyrR5yNE2ldL3BfleuXHv4Eu3pJ5ywTr+S/+WBO3VYKtA2rTvgIkvPQ0M5ASmEeA
	 Js0blZ9LHCZGaFn0ec4UZ7aBSm9u1HVOMN56H87T/HDohCipgfL2pLWzS2gr1lpV3N
	 uhItfsNx0GBvwlGsmeeulP+Fzq2oMAxxPQDFNheAIpVyA/QcFnLpUA1+/Lybe/N3iK
	 bH30foLXBEjjJwX669zgjgrjONlko3Ynd9Z2ECo9yJDyEZTAMPOScqprzEzFKvibL5
	 aqFowxSQz1EWA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1x9rwN-0000000DEyP-27Eo;
	Thu, 24 Sep 2026 22:29:19 +0000
Date: Thu, 24 Sep 2026 23:29:18 +0100
Message-ID: <86h5je4729.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Mark Rutland <mark.rutland@arm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	David Hildenbrand <david@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Jack Thomson <jackabt@amazon.com>,
	Jack Thomson <jackabt.amazon@gmail.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Leo Soares Passos <Leo.Bras@arm.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	linux-s390@vger.kernel.org
Subject: Re: [PATCH v4 01/14] KVM: Allow architectures to disallow pre-fault
In-Reply-To: <arTdxHgk_3gGySOO@gremlin>
References: <20260923-kvm-arm-prefault-v4-0-d4b0b4dfa8c3@kernel.org>
	<20260923-kvm-arm-prefault-v4-1-d4b0b4dfa8c3@kernel.org>
	<CA+EHjTzDYSuBVEc+SMdDa41sq-ET=m_oWW0gL9dYf+AumPYPUg@mail.gmail.com>
	<arTdxHgk_3gGySOO@gremlin>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: ljs@kernel.org, fuad.tabba@linux.dev, catalin.marinas@arm.com, will@kernel.org, oupton@kernel.org, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, pbonzini@redhat.com, corbet@lwn.net, mark.rutland@arm.com, rdunlap@infradead.org, borntraeger@linux.ibm.com, frankja@linux.ibm.com, david@kernel.org, hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, svens@linux.ibm.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, skhan@linuxfoundation.org, shuah@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, jackabt@amazon.com, jackabt.amazon@gmail.com, alexandru.elisei@arm.com, vdonnefort@google.com, aneesh.kumar@kernel.org, seanjc@google.com, imbrenda@linux.ibm.com, Leo.Bras@arm.com, weilin.chang@arm.com, linux-s390@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

On Thu, 24 Sep 2026 09:22:47 +0100,
"Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:
> 
> On Wed, Sep 23, 2026 at 07:52:27PM +0100, Fuad Tabba wrote:
> > Hi Lorenzo,
> >
> > On Wed, 23 Sep 2026 16:15:44 +0100, "Lorenzo Stoakes (ARM)"
> > <ljs@kernel.org> wrote:
> > [...]
> > > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > [...]
> > > +int kvm_arch_pre_fault_allowed(struct kvm_vcpu *vcpu)
> > > +{
> > > +        if (!vcpu->kvm->arch.pre_fault_allowed)
> > > +                return -EOPNOTSUPP;
> > > +
> > > +        return 0;
> > > +}
> >
> > nit: the comment above the smp_rmb() in tdx_sept_map_leaf_spte() still
> > says pre_fault_allowed is read by kvm_arch_vcpu_pre_fault_memory(),
> > but after this patch it's read here.
> 
> Ack can fix up I need to respin!

I've updated the comment locally.

	M.

-- 
Without deviation from the norm, progress is not possible.

