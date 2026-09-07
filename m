Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7826DC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 10:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+EdtUXRPFcuOXex6MwwCTkgFM3Iq6WJhMLb/D43pgaI=; b=1LbZyGWQfOvGii0ZWT3x9uBweH
	GeWXmz4GWe207v9h1Ci3YGxqoOB3aPe2DF/071ulU0NSIJKQMwNElmt5j7qj+yAXCfk6iFBEQsp8x
	3sDIo4zFkcdLb7ZUXibB6RDklElXQj4Ul3Uzw53EQqrNc9dW6uvW83Aeyd3P3aGs9EQy83FbXgx0U
	Pa8V5OEKsr1bzz/wLq6bbK+0NUCB/iFqkJuTn6A4RQcaGwDV8l6jVZ2lKh0CWl5pRVuJxESBTwOKk
	K5M7lINB7rO4fIgmSmo56zicBJFgsTIfEzfJkGXXGWN/HG/AppgGRbLzVEeOJVOdsRwfbKZyoGjE7
	gHvZ+BLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3WiU-00000006V2N-3mxy;
	Mon, 07 Sep 2026 10:36:46 +0000
Received: from out-40.mta1.migadu.com ([2001:41d0:203:375::28] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3WiQ-00000006V1X-0z5C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 10:36:45 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=knLSy+tAiOCBjiiSkaNUjr38e019JvyDKoSRtCD7jXc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788777400; v=1; x=1789382200;
 b=iyMOof7Pvy6wg2VkzREjxcMYjNsEeclp7fWL22uIxKwu2ZHW7AR+dFw4Y65M96k7Rwpk7XTt
 x7kFoend80i3V3whXlAS5PGSJZSdHcDOT+ggdURcAhlMC4Qho1AgBJESi0h60NhJd6GEhUMkC9+
 2OgzQPm8u3JZEny1EpE5CpOU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 2dce7dbb19c16629;
	Mon, 07 Sep 2026 10:36:40 +0000
X-Mizu-Trace-ID: 2dce7dbb19c16629
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384b7so6991e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 03:36:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByDEBWVDHST6MKkzKI/azGHGeDSS+TVUlAdt/3Pe4dnmTfZeRUXTTbpmAFGiuIImsNbpIa6ndE/M2yNP2MHMox8@lists.infradead.org
X-Gm-Message-State: AFuF++kuhH2gIfkRvFlkCcSAe6HjfrPXBFxBXp8DsASoW2/nrktI8ZkI
	16OELxZpjKoQsJCAuNYCLGFlJnOODeFAXGiolSxR0p052eg8xDLhBX0Dl5XTVPMrpaziHTkoeQN
	ilj/XECXd7eyi3eSHlPwFZSLaNxSmf2c4nUynxK0X
X-Received: by 2002:a05:6512:114d:b0:5b4:9dba:7401 with SMTP id
 2adb3069b0e04-5b74d456083mr154509e87.11.1788777394103; Mon, 07 Sep 2026
 03:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260904103131.627392-1-fuad.tabba@linux.dev> <966b103e-dc9e-479a-ba6c-e8e6727e1bd7@arm.com>
In-Reply-To: <966b103e-dc9e-479a-ba6c-e8e6727e1bd7@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 7 Sep 2026 11:35:57 +0100
X-Gmail-Original-Message-ID: <CA+EHjTy6kbVHKpW+jLHfdpMr16+OrGaCRyt_xEpP_6aQwKv5Yg@mail.gmail.com>
X-Gm-Features: AcwNN1WVZ2rRbHW0_CvMjthG_1fXG-hc0avpc71bJuZRUt-gMT5OfwZEJAwht6A
Message-ID: <CA+EHjTy6kbVHKpW+jLHfdpMr16+OrGaCRyt_xEpP_6aQwKv5Yg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: mpam: Document when to set arm64.nompam
To: Ben Horgan <ben.horgan@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	James Morse <james.morse@arm.com>, Xi Ruoyao <xry111@xry111.site>, Marc Zyngier <maz@kernel.org>, 
	Bradley Morgan <brads@mainlining.org>, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_033642_436521_940BE781 
X-CRM114-Status: GOOD (  39.36  )
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

Hi Ben,

On Mon, 7 Sept 2026 at 10:44, Ben Horgan <ben.horgan@arm.com> wrote:
>
> Hi Fuad,
>
> On 04/09/2026 11:31, Fuad Tabba wrote:
> > arm64.nompam skips the MPAM2_EL2 and MPAMHCR_EL2 writes in
> > finalise_el2_state and leaves the ARM64_MPAM cpucap unset. Where EL3
> > firmware has cleared MPAM3_EL3.TRAPLOWER, the EL2 trap controls are
> > left unwritten, at reset values that are UNKNOWN, and KVM still hides
> > MPAM from the guest but no longer enables the traps that stop a guest
> > from using it. KVM never saves or restores MPAM0_EL1 and MPAM1_EL1, so
> > what one guest writes reaches the next guest and the host. Nor can the
> > kernel make the EL2 writes unconditionally: they trap to EL3 on the
> > firmware the option exists for, and TRAPLOWER cannot be read below EL3.
> >
> > Say so in mpam.rst, and add the rule and a pointer to the
> > kernel-parameters entry.
> >
> > Suggested-by: Ben Horgan <ben.horgan@arm.com>
> > Link: https://lore.kernel.org/all/CA+EHjTxeWxZiuSmnKLGLxTBXP4oJT7-LuffbPAyCSZZ5TW=5Ew@mail.gmail.com/
> > Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> > ---
> >
> > Notes:
> >     Changes since v1, the first three from Ben Horgan's review:
> >      - Put arm64.nompam under a new "Command line parameters" section.
> >      - Separate MPAM3_EL3.MPAMEN from TRAPLOWER, which v1 conflated.
> >      - Add that KVM does not save or restore MPAM0_EL1 and MPAM1_EL1.
> >      - Drop "No functional change intended." from the commit message.
> >
> >     Bradley Morgan's Reviewed-by on v1 is not carried over: both
> >     paragraphs, the section heading and the commit message changed.
> >
> >     v1: https://lore.kernel.org/all/20260903084809.2027326-1-fuad.tabba@linux.dev/
> >
> >  .../admin-guide/kernel-parameters.txt         |  3 ++-
> >  Documentation/arch/arm64/mpam.rst             | 25 +++++++++++++++++++
> >  2 files changed, 27 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > index 68647ff4bdd24..e6d543de3cde5 100644
> > --- a/Documentation/admin-guide/kernel-parameters.txt
> > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > @@ -575,7 +575,8 @@ Kernel parameters
> >                       Set instructions support
> >
> >       arm64.nompam    [ARM64] Unconditionally disable Memory Partitioning And
> > -                     Monitoring support
> > +                     Monitoring support. Only for a machine that does not
> > +                     boot without it. See Documentation/arch/arm64/mpam.rst
> >
> >       arm64.nomte     [ARM64] Unconditionally disable Memory Tagging Extension
> >                       support
> > diff --git a/Documentation/arch/arm64/mpam.rst b/Documentation/arch/arm64/mpam.rst
> > index 67fe515ed501c..e66b1359d1282 100644
> > --- a/Documentation/arch/arm64/mpam.rst
> > +++ b/Documentation/arch/arm64/mpam.rst
> > @@ -87,6 +87,31 @@ The supported features are:
> >    MBWU monitors can be exposed to the user after support for more monitoring
> >    scopes is added to resctrl.
> >
> > +Command line parameters
> > +=======================
> > +
> > +arm64.nompam
> > +------------
> > +Firmware controls MPAM through two bits of MPAM3_EL3. MPAMEN enables
> > +it: while set, the PARTID and PMG in the MPAMn_ELx registers label the
> > +CPU's memory requests. TRAPLOWER, which resets to 1, traps accesses to
> > +the MPAM system registers from the lower exception levels to EL3.
> > +Firmware must clear it, or handle the trap and emulate MPAM as disabled.
> > +Where it does neither, the CPUs still advertise MPAM in the ID registers,
> > +the kernel's MPAM register accesses trap to EL3, and the boot fails.
> > +``arm64.nompam`` exists for that firmware: it makes the kernel treat the
> > +CPUs as not implementing MPAM, so no MPAM system register is accessed.
> > +Set it only on a machine that does not boot without it.
> > +
> > +It is not a way to turn MPAM off. Where firmware has cleared TRAPLOWER,
> > +the option leaves the trap controls in MPAM2_EL2 and MPAMHCR_EL2
> > +unwritten, and their reset values are UNKNOWN. KVM still hides MPAM from
> > +guests but no longer enables the traps that stop a guest from using it,
> > +so a guest may be able to read and write MPAM0_EL1 and MPAM1_EL1. KVM
>
> As you are listing registers, MPAMSM_EL1 can go here too.

I can respin a V3 with this added.

> Generally, I think this documentation change looks good now but holding off on a tag for the moment
> in case anything comes up from your MPAM trapping change [1].
>
> [1] https://lore.kernel.org/linux-arm-kernel/20260903160819.831518-1-fuad.tabba@linux.dev/

The trapping respin doesn't reach the nompam path: the override skips
the finalise_el2_state writes whether they clear the traps or set
them, so nothing here needs changing.

Cheers,
/fuad

>
> Thanks,
>
> Ben
>
> > +does not save or restore them, so what one guest writes is still there
> > +when the next guest runs on that CPU, and when the host does. With MPAMEN
> > +set, EL0 and EL1 requests then carry that PARTID and PMG.
> > +
> >  Reporting Bugs
> >  ==============
> >  If you are not seeing the counters or controls you expect please share the
>

