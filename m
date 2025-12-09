Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0403D3B98A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 17:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RSI8Pxf1Wt9ews+8G0JZ3VLNAwMte4kHmIud1VFkk60=; b=DmULCeOohAtjosHH+rp8o04AE3
	bFfUHPKKjd63qLVl6llemperSpAN+krlefw6isi26tnqZFVPVlhgnamwbD1h9mWzN+5UbAvIh7Kxe
	a8R7jYBG0WzGYOzg/GNTSFsNaNBiRuUvYMvsyW9mtUKD2AFPyyo7VWGGN22qpV0DtlIdrgDn0QJce
	F4qAFEX53RvcwJwAiECr2k6NgXPajpODjqXSLLTOj1puKHjktnxBUpMUKndeFBkhWMNgad+db3i4l
	AmeZna+r48gNKdcZt0zqecgjsiFCMoJUCaLJHjzYMJv2k9TcO3j+lhidj3eOhIDceGPCSIgtucH4V
	z7LWIpUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT1eI-0000000EbfF-1Bxs;
	Tue, 09 Dec 2025 17:37:19 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT1eG-0000000EbeA-0Zxi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 17:37:17 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-343bf6ded5cso10806431a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 09:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765301835; x=1765906635; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RSI8Pxf1Wt9ews+8G0JZ3VLNAwMte4kHmIud1VFkk60=;
        b=278FBzCE+y5fA/HJuBFb4hdiwv6h+b2a8XBth8Q/sY88L5i9jbds7jCuT5UQTac0vb
         3KBXY6nwt03AW48xLzeB/83jUDeuAUhUj85cxqt8S37VnHT+Qzihc1agbS84WgKFkf1C
         KC5wguOhRzq2c/rZflmyKyij8kCMM1TbQ4VnNISTW4+l1CdS9cWc2TomeUtOJqiCH6HD
         c8x+vUj+0eZbMSgTTMtQpsV0EbznYjiszpP5PVkJVlGbknTYr9zERsatDQEuiks0JXCX
         dGlhR3u1mZsfz20iU5Tx8Ob5CQY/SmbbIXgpZApKOs8WeJES6n9RqyhTY9L7K8wdO0Of
         hHSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765301835; x=1765906635;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RSI8Pxf1Wt9ews+8G0JZ3VLNAwMte4kHmIud1VFkk60=;
        b=IP0c63fyA8osmRU1NVKFeV5LAIgilV7syNVwa97PDCLsbeQkNrPZQntQ77V2psePhV
         cYDX0gqqAnMEmrHVrX0DKXGGLEPcgBdvJa+GVeOB3zenjNJsW7IRkwVlA7yXI288RqSY
         ffZbS2hVjhbSQE/xW6NghPSzBxRNumckYC0KYZieMDpPsD+hWmlNutJxRItiItCIuwew
         FlY7GACtErrnVS4g4vlrjq0mepgJmnNNlX2pKwK3a8QYODOO3fVCBT04OT0Y1fnVjvqa
         A5Eo/FurQm+WbPD9f/7vBxNxL9bmgGyLZRnAU73heDLIuZje4znf5FFX9NhF5TIbNpIJ
         XQ6w==
X-Forwarded-Encrypted: i=1; AJvYcCWSWE4ZHxxAjhRKuh/qTF31627YUrEbuED/W8//y3cHG8J4P/UvyeBmhRK9o8ophff0gfbKLfADYSt9kBXsnXBT@lists.infradead.org
X-Gm-Message-State: AOJu0YyzwAvaRxVCCXF5xaQC3wkDELMyuh3zAo99lt1LS7rUJZojHUbt
	C/Khff4PevJgKCNu+9t3UEAIbcqtvsBDRnV/jpJvuRkEJ2+pCDcVRQIIQCC0E/HBqWw9U7+E3Os
	h24QOIQ==
X-Google-Smtp-Source: AGHT+IFtEkvOBWBmPhAZp6fiQBmIeByIj1WwkTuM0S6f9ba1kbmIBgBTopqxljhwYNgNIix+N66SAv3Sd14=
X-Received: from pjbnh9.prod.google.com ([2002:a17:90b:3649:b0:343:6cb7:a68e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1a8b:b0:343:f509:aa4a
 with SMTP id 98e67ed59e1d1-349a260a9d0mr9559247a91.36.1765301834531; Tue, 09
 Dec 2025 09:37:14 -0800 (PST)
Date: Tue, 9 Dec 2025 09:37:13 -0800
In-Reply-To: <2440b9bf-a2a1-4f66-94b2-71f47d62f3db@linux.intel.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com> <20251206001720.468579-38-seanjc@google.com>
 <2440b9bf-a2a1-4f66-94b2-71f47d62f3db@linux.intel.com>
Message-ID: <aTheSQb9fhXmZKw6@google.com>
Subject: Re: [PATCH v6 37/44] KVM: VMX: Dedup code for removing MSR from
 VMCS's auto-load list
From: Sean Christopherson <seanjc@google.com>
To: Dapeng Mi <dapeng1.mi@linux.intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Mingwei Zhang <mizhang@google.com>, Xudong Hao <xudong.hao@intel.com>, 
	Sandipan Das <sandipan.das@amd.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Manali Shukla <manali.shukla@amd.com>, Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_093716_174657_0E270A04 
X-CRM114-Status: GOOD (  29.30  )
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

On Mon, Dec 08, 2025, Dapeng Mi wrote:
>=20
> On 12/6/2025 8:17 AM, Sean Christopherson wrote:
> > Add a helper to remove an MSR from an auto-{load,store} list to dedup t=
he
> > msr_autoload code, and in anticipation of adding similar functionality =
for
> > msr_autostore.
> >
> > No functional change intended.
> >
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/x86/kvm/vmx/vmx.c | 31 ++++++++++++++++---------------
> >  1 file changed, 16 insertions(+), 15 deletions(-)
> >
> > diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> > index 52bcb817cc15..a51f66d1b201 100644
> > --- a/arch/x86/kvm/vmx/vmx.c
> > +++ b/arch/x86/kvm/vmx/vmx.c
> > @@ -1040,9 +1040,22 @@ static int vmx_find_loadstore_msr_slot(struct vm=
x_msrs *m, u32 msr)
> >  	return -ENOENT;
> >  }
> > =20
> > +static void vmx_remove_auto_msr(struct vmx_msrs *m, u32 msr,
> > +				unsigned long vmcs_count_field)
> > +{
> > +	int i;
> > +
> > +	i =3D vmx_find_loadstore_msr_slot(m, msr);
> > +	if (i < 0)
> > +		return;
> > +
> > +	--m->nr;
> > +	m->val[i] =3D m->val[m->nr];
>=20
> Sometimes the order of MSR writing does matter, e.g., PERF_GLOBAL_CTRL MS=
R
> should be written at last after all PMU MSR writing.

Hmm, no.  _If_ KVM were writing event selectors using the auto-load lists, =
then
KVM would need to bookend the event selector MSRs with PERF_GLOBAL_CTRL=3D0=
 and
PERF_GLOBAL_CTRL=3D<new context (guest vs. host)>.  E.g. so that guest PMC =
counts
aren't polluted with host events, and vice versa.

As things stand today, the only other MSRs are PEBS and the DS area configu=
ration
stuff, and kinda to my earlier point, KVM pre-zeroes MSR_IA32_PEBS_ENABLE a=
s part
of add_atomic_switch_msr() to ensure a quiescent period before VM-Enter.

Heh, and writing PERF_GLOBAL_CTRL last for that sequence might actually be
problematic.  E.g. load host PEBS with guest PERF_GLOBAL_CTRL active.

Anyways, I agree that this might be brittle, but this is all pre-existing b=
ehavior
so I don't want to tackle that here unless it's absolutely necessary.

Or wait, by "writing" do you mean "writing MSRs to memory", as opposed to "=
writing
values to MSRs"?  Regardless, I think my answer is the same: this isn't a p=
roblem
today, so I'd prefer to not shuffle the ordering unless it's absolutely nec=
essary.

> So directly moving the last MSR entry into cleared one could break the MS=
R
> writing sequence and may cause issue in theory.
>=20
> I know this won't really cause issue since currently vPMU won't use the M=
SR
> auto-load feature to save any PMU MSR, but it's still unsafe for future u=
ses.=C2=A0
>=20
> I'm not sure if it's worthy to do the strict MSR entry shift right now.
>
> Perhaps we could add a message to warn users at least.

Hmm, yeah, but I'm not entirely sure where/how best to document this.  Beca=
use
it's not just that vmx_remove_auto_msr() arbitrarily maniuplates the order,=
 e.g.
multiple calls to vmx_add_auto_msr() aren't guaranteed to provide ordering =
because
one or more MSRs may already be in the list.  And the "special" MSRs that c=
an be
switched via dedicated VMCS fields further muddy the waters.

So I'm tempted to not add a comment to the helpers, or even the struct fiel=
ds,
because unfortunately it's largely a "Here be dragons!" type warning. :-/

