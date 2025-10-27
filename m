Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 893EACCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 18:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bO0HNahSQ0zli7kg4xL2kKu/rPaiGOzpKxwGHDcn9b4=; b=uvxvieSTF+/9XEWBDHyLIvsIeR
	h+NuwKU35d9sfk+B4Y8HgCp99J12EEH+O2o/u2l0joRALLoR2N3FvvjFUCTu0btKwc6cim+ewP5G6
	5MtkFwGID/FeKlCjiOYIYl54eLMtujZG5qAcghTm6+l/HupOXSwxe1KdqFcIg8nQzcNlfvpG4yioI
	qmH/8wXOGm0ogq1WBByzI41ys2U1IjHgHoVD5r1fAiVq1oGVTfcb8S2JwTuN6IsdQulvc6PQX5P7U
	U6UYzhRMNytBCtQj8sOofhcE+Ajej10uatKv2AWHtGnmImKrY4AWMKTp5DaF16zRyjXidfeTd6/82
	/OV5yOdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDRgF-0000000EWI9-11ZL;
	Mon, 27 Oct 2025 18:10:55 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDRgD-0000000EWH2-1861
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 18:10:54 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-33bcb779733so4316431a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 11:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761588652; x=1762193452; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bO0HNahSQ0zli7kg4xL2kKu/rPaiGOzpKxwGHDcn9b4=;
        b=1Og0Ub/H7o2Birmhj8bbqS/728j3jMYI0HMQFkTpgNnPYKOONW3q/lbNJt5iNz4tl7
         J2hsqtBUOBSUvWfiXThaG/UIVP6XDFQeslR1ZmrVBPOp7h7Dg/uE3Sl/8vxFU+vE6sWe
         iP2ssH1fHNxNsoNLKiNa6/X5Nr0ptoNLOvZmlL90BMcZqzBHMUunYixFohGUWovR2e5X
         o5KUCO1N3wxwbxPYDG/qZNF4TBvnzHjN/9kawGmCRGZq6kfoeugPQmTSLGODWKbsi54m
         WHvUNsWUKFgFca7E43zTmG8ERYnTc4Cv825ZxnHZjih+ct43aT+/dpENQ8jBDnZDWp2U
         tXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761588652; x=1762193452;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bO0HNahSQ0zli7kg4xL2kKu/rPaiGOzpKxwGHDcn9b4=;
        b=f26L6DmrOlJWpgvOriyfknSSzumSajH17xTLIysoZa5sqwU1B7RW6Hl/nOFe+HKT0u
         PV8bXRyluGd9DkmHpvArcXi7VQxSOTtbtUj2o/NLMayUaMcI2Pd/g/6TgxE9qHUfhwLq
         UwMIOz8LnBFPOzNSAWwXLsdBAag+99HJz5XBNvE69WNv9kOAjfwTAzdWgEHTHzbaU7eC
         0nOxmEMASsUqIruqg8OqyDY4MYUYEGMWWqlzYQBxzKFgxx1jjjw3P+SrU3IifubEFsRw
         hS+s5GwWA29yw5kQD+p/Wkoc3GhVKaID3OwmWCDjU4/LIZ3FHGG8BsmKV5zh3bU7abkr
         DPjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkQ7ormsGMSLjj8auHw6StCO2u0kEP2cyg6Afriqe/moKqFXq1Us5SvkrkZTo5NZLCl/al9rEnE3QzrD7Uzrzq@lists.infradead.org
X-Gm-Message-State: AOJu0YyyvMzm42+4ggVbTSzMgnpi6/rrgnNEfB2OELolNXbLd8itf+1L
	WPJFV/gv5e9WNk77jXOKs749TUtjaDzvWhHaUM19O69DGrnpp+NIYsu9EpoT100znjmx6vQ6Es8
	U3f88og==
X-Google-Smtp-Source: AGHT+IFYM0pQ56UGeUzsOnJj3+Ow3Uhx6HMXZ6WjKUcRvfRsyB3bsUItowqHfr7m0JixZWoiV89rDaaCMlA=
X-Received: from pjbrs15.prod.google.com ([2002:a17:90b:2b8f:b0:33b:51fe:1a73])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4f81:b0:32e:52aa:3973
 with SMTP id 98e67ed59e1d1-340279e5fc5mr862252a91.8.1761588651707; Mon, 27
 Oct 2025 11:10:51 -0700 (PDT)
Date: Mon, 27 Oct 2025 11:10:50 -0700
In-Reply-To: <77d8a0d9541ce3fc2b2c76b58add50d152b52e39.camel@intel.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-25-seanjc@google.com>
 <aPtOtzGLigbY0Vqw@yzhao56-desk.sh.intel.com> <aPuv8F8iDp3SLb9q@google.com>
 <aP86sdBZxXm5I17f@yzhao56-desk.sh.intel.com> <77d8a0d9541ce3fc2b2c76b58add50d152b52e39.camel@intel.com>
Message-ID: <aP-1qlTkmFUgTld-@google.com>
Subject: Re: [PATCH v3 24/25] KVM: TDX: Guard VM state transitions with "all"
 the locks
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: Yan Y Zhao <yan.y.zhao@intel.com>, 
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, 
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	"michael.roth@amd.com" <michael.roth@amd.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"x86@kernel.org" <x86@kernel.org>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, 
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, Vishal Annapurve <vannapurve@google.com>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, 
	"maobibo@loongson.cn" <maobibo@loongson.cn>, "maz@kernel.org" <maz@kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "anup@brainfault.org" <anup@brainfault.org>, 
	Kai Huang <kai.huang@intel.com>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>, 
	"pjw@kernel.org" <pjw@kernel.org>, "zhaotianrui@loongson.cn" <zhaotianrui@loongson.cn>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Ira Weiny <ira.weiny@intel.com>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, "kas@kernel.org" <kas@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_111053_303193_DD20F597 
X-CRM114-Status: GOOD (  23.06  )
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

On Mon, Oct 27, 2025, Rick P Edgecombe wrote:
> On Mon, 2025-10-27 at 17:26 +0800, Yan Zhao wrote:
> > > Ugh, I'd rather not?=C2=A0 Refresh me, what's the story with "v1"?=C2=
=A0 Are we now on
> > > v2?
> > No... We are now on v1.
> > As in [1], I found that TDX module changed SEAMCALL TDH_VP_INIT behavio=
r to
> > require exclusive lock on resource TDR when leaf_opcode.version > 0.
> >=20
> > Therefore, we moved KVM_TDX_INIT_VCPU to tdx_vcpu_unlocked_ioctl() in p=
atch
> > 22.
> >=20
> > [1] https://lore.kernel.org/all/aLa34QCJCXGLk%2Ffl@yzhao56-desk.sh.inte=
l.com/
>=20
> Looking at the PDF docs, TDR exclusive locking in version =3D=3D 1 is cal=
led out at
> least back to the oldest ABI docs I have (March 2024). Not sure about the
> assertion that the behavior changed, but if indeed this was documented, i=
t's a
> little bit our bad. We might consider being flexible around calling it a =
TDX ABI
> break?
>=20
> Sean, can you elaborate why taking mmu_lock is objectionable here, though=
?

It's not, I was just hoping we could avoid yet more complexity.

Assuming we do indeed need to take mmu_lock, can you send a patch that appl=
ies
on top?  I'm not planning on sending any of this to stable@, so I don't see=
 any
reason to try and juggle patches around.

> Note, myself (and I think Yan?) determined the locking by examining TDX m=
odule
> source. For myself, it's possible I misread the locking originally.
>=20
> Also, I'm not sure about switching gears at this point, but it makes me w=
onder
> about the previously discussed option of trying to just duplicate the TDX=
 locks
> on the kernel side.

Please no.  At best that will yield a pile of effectively useless code.  At=
 worst,
it will make us lazy and lead to real bugs because we don't propery guard t=
he *KVM*
flows that need exclusivity relative to what is going on in the TDX-Module.

> Or perhaps make some kind of debug time lockdep type thing to document/ch=
eck
> the assumptions in the kernel. Something along the lines of this patch, b=
ut
> to map the TDX locks to KVM locks or something. As we add more things (DP=
AMT,
> etc), it doesn't seem like the TDX locking is getting tamer...

Hmm, I like the idea, but actually getting meaningful coverage could be qui=
te
difficult.

