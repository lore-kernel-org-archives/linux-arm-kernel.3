Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A24CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 17:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sTsoW0ur76ePtMo7HcuL4NYZdCCENhkyANXlSBYjqrA=; b=mo2g0acpLYbKQtSc41IMkD5KZ7
	fjcllbbJuVwJgX3vHTWwqnbqv0PEdWzajpzyr3tBwcnTam2AqrVxt7dz41M1z59x0B03i3DOi/sxo
	EPpDztj0/nq4jubhc8th6mOQ2MylErGC4oMvKI3JS6nCrzcqbwqr3Crc2zE+8DlkLOAvtGi8zv43X
	gyohKwLIq8UhMVTcnogCmSPzrzbQUN66zm3rsIWb5v3fOqCiDZNEN57S9OffiyPxP3DfDTFCdz7b9
	y0aztFfnWvk4vNcpBZ0Uc/JAofMyeLhfRbip/ACV3o5/YbX1Lx8ZOtB8q599eYx+vVuRyyVR7eVAb
	9XgapXrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLJ3-0000000CJqZ-3BuR;
	Tue, 04 Nov 2025 17:58:57 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLJ1-0000000CJor-3Q49
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 17:58:57 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-294ecd3fdd4so69810855ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 09:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762279133; x=1762883933; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sTsoW0ur76ePtMo7HcuL4NYZdCCENhkyANXlSBYjqrA=;
        b=kBJsquQixHEtKG81CzFZIwQF9Kwr4vxTl+Y39pJJst6QVjxEgfvq+LU/Huay2thbdA
         WdyE5GMHsEP1U/DF1hlC+Bb3YeagFlIHV0N360WpvcecLqS+AtvIZdd8mH4JbNpE0tge
         kL/TDHm0vNJQHL4oPku6d5KvE0tod7lBvOSLdgCfcgGrc1hM06uXzTa8WsYllXcL/vcg
         7c7DSvFJ9ToIgI9+l2YEIlKE9eGbApJ+6q1OmdTQXkw5XoEqOjZFSYlhVh/VjuxZkh7f
         bcA/aAPxdE/RR/wGUjXCT9XWgIikMdsYKOcBiC6yW1TPoWVSxOBUjMwLiUBJ5RQTG/kM
         GPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279133; x=1762883933;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sTsoW0ur76ePtMo7HcuL4NYZdCCENhkyANXlSBYjqrA=;
        b=G/Adn5GVqsNdoK/P1RwDd9dmFu05G0CAzo+IVdUex0+o2i3k31Qiy7s1AmPUACg57a
         K1yQQjTK0sjTm0Oo5EFUNkPY3n7PEj5YVz7HD0xiguD6Pz4JL9V90Hs2UTag9u0ttBnd
         Dawk4IZZBcYbyvKHclyQsmSuAja47dP2GDuLQOAYGSS0Yc90G//447EF7saejerjVcHe
         KpThBG266qYMxy5XtsvxKbteQaI9KLDk8O5l4WY3x4E4F8RQfUrCWQ4uTue84AbyYwq+
         kv3N9caSg1T37nId3Au7lBemY8Q2DZV0W1btVxuBfvlhU5dz8SQgPQdML8/hfQgIm2gc
         Zh0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWjmskfpPxMfB9uJk9RB7KQRKQwBhV9yrAgtb+EsbgY8LTbg8Gw+4Yl0RorN648HzL3gHvoLXOCjzwKi1VvKH6x@lists.infradead.org
X-Gm-Message-State: AOJu0YzYZLe4jzJDeNvYO8QET0qBDn5NjO8QhcRBhcJbhXmflHpHoTi8
	0NDWhacmXswjhDmREfehiPshPKLsqiTRKn9szO5MDYEs9+cO2w0NfLN6x0eOt4YFwTHng+e+8+o
	aRWBkzA==
X-Google-Smtp-Source: AGHT+IHo6/KH4EkXGXP40ZLufzSsgW7yh9/qU70MiYfxQR70XqX2CyQgg6697l1DVe5Ug6vhYlNvwdh/uJA=
X-Received: from plok6.prod.google.com ([2002:a17:903:3bc6:b0:269:8ca7:6998])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f609:b0:295:4d97:84dd
 with SMTP id d9443c01a7336-2962adb8f9cmr4243385ad.51.1762279132506; Tue, 04
 Nov 2025 09:58:52 -0800 (PST)
Date: Tue, 4 Nov 2025 09:58:48 -0800
In-Reply-To: <725c68f2607ad2d4f742fd749ea517a98d669384.camel@intel.com>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com> <725c68f2607ad2d4f742fd749ea517a98d669384.camel@intel.com>
Message-ID: <aQo-2OQd8ktU0ygn@google.com>
Subject: Re: [PATCH v4 00/28] KVM: x86/mmu: TDX post-populate cleanups
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>, 
	"maz@kernel.org" <maz@kernel.org>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, 
	"pjw@kernel.org" <pjw@kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"kas@kernel.org" <kas@kernel.org>, "maobibo@loongson.cn" <maobibo@loongson.cn>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, 
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, 
	"zhaotianrui@loongson.cn" <zhaotianrui@loongson.cn>, "anup@brainfault.org" <anup@brainfault.org>, 
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Kai Huang <kai.huang@intel.com>, 
	Yan Y Zhao <yan.y.zhao@intel.com>, "michael.roth@amd.com" <michael.roth@amd.com>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, Vishal Annapurve <vannapurve@google.com>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_095855_846327_86471F46 
X-CRM114-Status: GOOD (  12.52  )
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

On Fri, Oct 31, 2025, Rick P Edgecombe wrote:
> On Thu, 2025-10-30 at 13:09 -0700, Sean Christopherson wrote:
> > v4:
> > =C2=A0- Collect reviews/acks.
> > =C2=A0- Add a lockdep assertion in kvm_tdp_mmu_map_private_pfn(). [Yan]
> > =C2=A0- Wrap kvm_tdp_mmu_map_private_pfn() with CONFIG_KVM_GUEST_MEMFD=
=3Dy. [test bot]
> > =C2=A0- Improve (or add) comments. [Kai, and probably others]
> > =C2=A0- s/spte/mirror_spte to make it clear what's being passed in
> > =C2=A0- Update set_external_spte() to take @mirror_spte as well. [Yan]
> > =C2=A0- Move the KVM_BUG_ON() on tdh_mr_extend() failure to the end. [R=
ick]
> > =C2=A0- Take "all" the locks in tdx_vm_ioctl(). [Kai]
> > =C2=A0- WARN if KVM attempts to map SPTEs into an invalid root. [Yan]
> > =C2=A0- Use tdx_flush_vp_on_cpu() instead of tdx_disassociate_vp() when=
 freeing
> > =C2=A0=C2=A0 a vCPU in VCPU_TD_STATE_UNINITIALIZED state. [Yan]
>=20
> Do you want someone to follow up with a v2 of this after the series lands=
? (with
> Binbin's verbiage comments incorporated)

Feel free to send a v2 now.  Or just reply to Binbin's mail with the update=
d
comment.

> https://lore.kernel.org/kvm/20251028002824.1470939-1-rick.p.edgecombe@int=
el.com/#t

