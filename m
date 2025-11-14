Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF17CD98F7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 00:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/TPA+SbvqNREHpFcNdmFscbiex0UCXC+hEdJT9/ovnQ=; b=vAuANmzIBqzXdGHGM/othY3SOT
	+bO1KsIE2bkKmltf56WETa86C/s0Kjmf05HpH+I3IK/42oowUSIjQ4oB3qSvabBZjMU1FSKgOec2d
	IhVt5RqKuofgojk56UTsWRBRQT5gcsl88447S/mqXi1+flbw3+GRSYlv4lxKibAqANjfkxJAREJDv
	pwrqsXa/8/qzrLjr7PeyROpmoo1KDmdQLyHRGuo6i1NfvY1SmYe8w5iSMw2De5wpxl3OOcTPCQHbM
	HQTVt0FUBrR4Et0wKxRzd9Ax6E+3i/UYHzNxovAOHTRMbietS9/+acWOzXYMfHyY4QwMET7Zl5wEf
	N9nWZFcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJi3C-0000000BMMR-1O4l;
	Fri, 14 Nov 2025 00:52:30 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJi39-0000000BMLP-3SsD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 00:52:28 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2956a694b47so17976295ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 16:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763081547; x=1763686347; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/TPA+SbvqNREHpFcNdmFscbiex0UCXC+hEdJT9/ovnQ=;
        b=Hws1GJC1LDlYzEoIEv6o81XJodcAuIMfjHJgCzLcVCnF3No9NIlCl733gI/qBMtM7S
         o9GpH9pZb6h7kXTgV+VMccQUiSj4bR3i39nnwwKUvgd4irydwuXz4wpb2A3jwJ4rDqqm
         rSC6EEukJQQJdfnTPoXCyZUfEDSsnzre7pp7KdHRgKb83xdpEfy7MKxv8V4z0juyzjYd
         BXncOsf3JF8mn23ts1oW5m5Ie1Sbbr746ItQpqgsRNSGufvbvrBnNHURRfzAzQbkoTv9
         WQs8IY2G+H8YPZP/WnwYOHgx52XIZswYGkikLDlSkhqmDy8bD/GdMFrx5tnpDr4+zwhe
         HDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763081547; x=1763686347;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/TPA+SbvqNREHpFcNdmFscbiex0UCXC+hEdJT9/ovnQ=;
        b=bQIKYAtcfffOO2O+qN1RaSj6w22Z66WFX+LBaxqKIRULtrWfB5vGbrg/AMYNd7thpA
         iYxqYK5+gxHeQ5bIZkc6O7nRU6gWp3Q5UK/PHlkncDBSqzB3wCkrlGMS/mcZzImEIQDo
         rFHneAtagS5/69+k2xmeQ7N147aalr18pUQ+3QAgkc+Cc3e04b+GnqHTGxmojUdcDyQa
         sDW+WQfo382WlTpCPEDL5addDeEyXsVCulVf5eYQ9Uyr2/X4jvaciWqT1f8AJqqLZOsD
         CuoYA18xjo8GayKwrn5Ro7DbvVXQu8/qlgxm8k0RISjIDbXwTRmeqLL/FAsd124PTjgO
         uAWA==
X-Forwarded-Encrypted: i=1; AJvYcCUFULN80bkigqvmBwRTYM3UXlTtcZT2USgCz7IyQBr84WTeo9d2Y2z2gehxuzXrcwEE72LOpzKHBY6pL+Is3BpN@lists.infradead.org
X-Gm-Message-State: AOJu0YxLygNF6l2d43PKaogHFhGMXzAi0j0g+0dk0g5DBHBbSO6p1OqV
	kuPEUh2OZagoDJPAYXgE/AIUhE/vrb+9n43kFes85JUUetryr73AZjcjh02FOmNiWqbaYfYPcEw
	D7L/uXw==
X-Google-Smtp-Source: AGHT+IGLVWzZcFvlcari672fVuzY1cTHp2qT0SnCsSIHeNMxH1YcSp/U/Uf2KDzI+67wEBxE6n1syvNyYxc=
X-Received: from plgz16.prod.google.com ([2002:a17:903:190:b0:296:18d:ea12])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:22c5:b0:295:2c8e:8e44
 with SMTP id d9443c01a7336-2986a76bc1dmr11720965ad.59.1763081546590; Thu, 13
 Nov 2025 16:52:26 -0800 (PST)
Date: Thu, 13 Nov 2025 16:52:25 -0800
In-Reply-To: <CALzav=eqv0Fh9pzaBgjZ-fehwFbD4YscoLQz0=o0TKQT_zLTwQ@mail.gmail.com>
Mime-Version: 1.0
References: <20250501183304.2433192-1-dmatlack@google.com> <aBPhs39MJz-rt_Ob@google.com>
 <CALzav=eqv0Fh9pzaBgjZ-fehwFbD4YscoLQz0=o0TKQT_zLTwQ@mail.gmail.com>
Message-ID: <aRZ9SQ_G2lsmXtur@google.com>
Subject: Re: [PATCH 00/10] KVM: selftests: Convert to kernel-style types
From: Sean Christopherson <seanjc@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@redhat.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Eric Auger <eric.auger@redhat.com>, 
	James Houghton <jthoughton@google.com>, Colin Ian King <colin.i.king@gmail.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_165227_863981_91B4489C 
X-CRM114-Status: GOOD (  18.18  )
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

On Fri, Oct 17, 2025, David Matlack wrote:
> On Thu, May 1, 2025 at 2:03=E2=80=AFPM Sean Christopherson <seanjc@google=
.com> wrote:
> > On Thu, May 01, 2025, David Matlack wrote:
> > > This series renames types across all KVM selftests to more align with
> > > types used in the kernel:
> > >
> > >   vm_vaddr_t -> gva_t
> > >   vm_paddr_t -> gpa_t
> >
> > 10000% on these.
> >
> > >   uint64_t -> u64
> > >   uint32_t -> u32
> > >   uint16_t -> u16
> > >   uint8_t  -> u8
> > >
> > >   int64_t -> s64
> > >   int32_t -> s32
> > >   int16_t -> s16
> > >   int8_t  -> s8
> >
> > I'm definitely in favor of these renames.  I thought I was the only one=
 that
> > tripped over the uintNN_t stuff; at this point, I've probably lost hour=
s of my
> > life trying to type those things out.
>=20
> What should the next step be here? I'd be happy to spin a new version
> whenever on whatever base commit you prefer.

Sorry for the slow reply, I've had this window sitting open for something l=
ike
two weeks.

My slowness is largely because I'm not sure how to land/approach this.  I'm=
 100%
in favor of the renames, it's the timing and coordination I'm unsure of.

In hindsight, it probably would have best to squeeze it into 6.18, so at le=
ast
the most recent LTS wouldn't generate conflicts all over the place.  The ne=
xt
best option would probably be to spin a new version, bribe Paolo to apply i=
t at
the end of the next merge window, and tag the whole thing for stable@ (mayb=
e
limited to 6.18+?) to minimize downstream pain.

