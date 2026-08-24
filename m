Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE28C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 18:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XO7IN4C+8NrFxSN+X2KRtw6O/KbRqUgR1TA74zKM5gA=; b=i1ThMLjalNAhCXNrZMiMWCzHpj
	TxyqDRDdGTQQe6fTCtRVOTlJgz+JSzFr41HsG6XJJEn+mjlEEgIqUy2VuFj61pZzPlriUGMq5gxs6
	saiPzYZQzfkrtRTyRywRRFk/0ek8oZ/cKxiVnoE0LuFfxqUAl6xoyz/HeBBg5HDEh7fc3+XSwt0eA
	gvFVtbb0XxFTAxiKI/I8PYcNnerkC4okbMUSknktSyrYPcUDoC3WMkxL5tBowOlc32DssKYFPQoHI
	FNOmw5gJQ0A0S3WKoXeDGAMHEKeF//ePPDMqqtWUSUUaLLB2fqzTuMPFskowzj3SDGZjTrX11OdRt
	1ZCFwxJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyZXu-0000000HGsy-1PTJ;
	Mon, 24 Aug 2026 18:37:22 +0000
Received: from out-250.mta1.migadu.com ([2001:41d0:203:375::fa] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyZXr-0000000HGsA-0RjO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 18:37:20 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=z1eMC5A17e3WPWEyqxdEPWPA4oSgaXmtkR6wiU7W6FA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787596637; v=1; x=1788201437;
 b=mJXmk3jeZbI1SIcXfQv1vYZx5ckwop3z3niKPeeDVZVHZK+Ml9+4L0VJEZy3ird3/vq26WMD
 UknAGKXCx30aV5Y0/Wg6c9GHLM+fHASaX+hLVCRR8Dk4i6BP76MRWtttx1MERekwRa51Fz3MK45
 HcNpm9KCnzIdG635HRwdZ4hg=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from mail-lf1-f51.google.com (209.85.167.51)
	by smtp.migadu.com with ESMTPS id 2f0139afb1039777;
	Mon, 24 Aug 2026 18:37:06 +0000
X-Mizu-Trace-ID: 2f0139afb1039777
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b2a8173142so957e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 11:37:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrYDJpJi8bC1dlYb8TBJAeIbPsrT1mBy+TcBvR87cygBpnfsA8qC0sWx+p7myu7VpyX1QhOk3wz5tQaTBmWuZik@lists.infradead.org
X-Gm-Message-State: AFuF++ngfvqpVrKnJTbBYhaoc8sYaF/BVviNjEwIDRbE89hGQ61Bz/a5
	/vyFooRHCgeQfLqZevO6ZgeMIuhlXXEtT19JHNxNbdCfc+cC293BhIXnrslDtPGa5cOxV9tzc+b
	KjT//FIq44j5xIb3+855CSqBT3T0plGBEhwXrgQQi
X-Received: by 2002:a05:6512:68c:b0:5b2:a5e9:3aba with SMTP id
 2adb3069b0e04-5b49cf97240mr7768e87.6.1787596625703; Mon, 24 Aug 2026 11:37:05
 -0700 (PDT)
MIME-Version: 1.0
References: <20260824071004.504894-1-fuad.tabba@linux.dev> <aoxCk5lFQv6lFwHQ@willie-the-truck>
 <CA+EHjTy6Xh=eNg22fBdjPzZOZitzvcDX2L5zbSUFCsX1n6XobQ@mail.gmail.com> <aoxpG13UZfKJ2Rfu@willie-the-truck>
In-Reply-To: <aoxpG13UZfKJ2Rfu@willie-the-truck>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 24 Aug 2026 19:36:29 +0100
X-Gmail-Original-Message-ID: <CA+EHjTynGY1DFY=SP27MF=ioCQA4jnwnpJWCj1DLRqsqEyEUgA@mail.gmail.com>
X-Gm-Features: AcwNN1V9W7VHXq___zx5wU5QYK_PcNw-jBsBbWE1dTJRfIwYwTjUmk-5HFvXctg
Message-ID: <CA+EHjTynGY1DFY=SP27MF=ioCQA4jnwnpJWCj1DLRqsqEyEUgA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: Defer the GMID_EL1 read to {init,update}_cpu_features()
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Mark Brown <broonie@kernel.org>, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_113719_352272_FC2783C5 
X-CRM114-Status: GOOD (  33.16  )
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

On Mon, 24 Aug 2026 at 16:54, Will Deacon <will@kernel.org> wrote:
>
> On Mon, Aug 24, 2026 at 04:14:41PM +0100, Fuad Tabba wrote:
> > On Mon, 24 Aug 2026 at 14:09, Will Deacon <will@kernel.org> wrote:
> >
> > > > +     /*
> > > > +      * info->reg_gmid deferred to {init,update}_cpu_features because
> > > > +      * reading it traps to EL2 when MTE is disabled.
> > > > +      */
> > >
> > > I don't think we should defer this, as I've been actively doing the
> > > opposite for parallel CPU onlining (where the ID registers can be read
> > > concurrently by incoming CPUs to amortise the cost of a trap) and also
> > > for the RNG traps during early boot:
> > >
> > > https://lore.kernel.org/all/annJ0oDB2HObQC5j@willie-the-truck/
> > >
> > > If you look at the diff I sent in the thread above (I didn't get a
> > > reply), the idea is that __read_sysreg_by_encoding() reads from the ID
> > > register values stashed by cpuinfo_store_cpu(). So you could use that
> > > to check id_aa64pfr1 before reading gmid, as it will give you the
> > > sanitised view.
> >
> > I just did, but I don't think it'll work. The thing is,
> > __read_sysreg_by_encoding() gives the override-applied local value,
> > not the folded sys_val.
> >
> > arm64.nomte is a command-line override, so that works. But
> > CONFIG_ARM64_MTE=n sets none. Any gate would still need an explicit
> > IS_ENABLED(CONFIG_ARM64_MTE).
> >
> > That said, I don't have to defer it. I can keep the info->reg_gmid
> > read in __cpuinfo_store_cpu() and gate that read on the state that
> > arms the trap:
> >
> >         static inline bool gmid_el1_accessible(u64 pfr1)
> >         {
> >                 if (!IS_ENABLED(CONFIG_ARM64_MTE))
> >                         return false;
> >                 if (system_capabilities_finalized())
> >                         return system_supports_mte();
> >                 return id_aa64pfr1_mte(pfr1);
> >         }
> >
> >
> > TID5 is set from system_supports_mte() and only once capabilities are
> > finalised, so the local check is still correct before that. Gating on
> > system_supports_mte() keeps the different-physical-CPU case you want
> > to preserve working: if one re-onlines with MTE while the system view
> > has it folded off, the gate stays false and it won't read GMID_EL1.
>
> I still don't understand why you have system_supports_mte() here. If
> the CPU has MTE, the CONFIG option is enabled and the cmdline override
> isn't set, we can read GMID just fine on this CPU, regardless of the
> system capabilities.

I could gate on the local value with the override applied instead.

> > If you agree, I'll respin with that.
>
> I can't tell who's calling gmid_el1_accessible() so it's hard to tell
> whether I agree or not. May as well send a v3 though, so we can see what
> you have in mind!

Sending it now. Probably shorter than just describing it.

Cheers,
/fuad

> Will

