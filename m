Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E49C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 00:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LqZ3rHUmVe6G0p0/31oKw+qMwbPcZALS7DvYpljMN9M=; b=jD44m40ABMMBhnRu30wNXPjxvi
	TSHljowhMR4lWSMNgrbsq4/UPJZHSoJ5GYs2qCzzuj71FYSqFRZGRxx8tESG/FpuYMfxR4T5/b2YT
	EWbnscF40tqK/S/ThX8oEWYH0ydyOdrC/XzoQCEarknazGtCEtLJP3N6LgsMseMD+2N7u5CyHI9E/
	MwaqOMbOQbxiJdrso4zRotF0jHG69PUCN3pZRx9ZOTPJ1c5dKoRgtqY+7jQsV1SH/aKy083H9RVbD
	Bhp3dwW0iXn9Kcoi8dcStBmtrtBXVMP/gJP+GbT5CsNjDe9Drgqvb03mbK1IJ0+J87Orj9WFnrmQL
	HvF6U9Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uguJp-00000000LwP-1fGz;
	Wed, 30 Jul 2025 00:05:17 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugtQv-00000000GED-323i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 23:08:34 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-237f8d64263so3708005ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 16:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753830512; x=1754435312; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LqZ3rHUmVe6G0p0/31oKw+qMwbPcZALS7DvYpljMN9M=;
        b=Q6VMGM3RIIH+3+12y5zf1f/XTXtyMN17QfiwLgQ5eTQr+HAfehp1EkY6NkFWDW2Pqw
         JHMb/FxRfESeBv67vg8niozMFP8b9IauZd6seIBokiExykcqk5SNf15Pp9POmqeoGGl6
         jmeFxJNEDR5aHnBVik3QS4hFek43F60uPW3OhZLZw7EXDkuQw1w+SJ1Mmjl1tIkm5P3v
         YzrEWGTtrbg+OJJ0zYyNptF9FLB85hvgPAf0O0HZzrTfi/+qSk7BLgG0A0lswMHtTWfp
         p2OBeWW8onV5QMsV/LtdJmdWKO0jx2znRf/DNENztE1ENVhFCvRJEiY4+4LG1N76Zv0y
         v4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753830512; x=1754435312;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LqZ3rHUmVe6G0p0/31oKw+qMwbPcZALS7DvYpljMN9M=;
        b=HH9ZNndNbLfRi6V9CEU/Hvwm8X8mIF1eCMxSR2BU+W3bKqyoRwYNrnBr216LmCTrxZ
         NtsTGtZqdrmTZtIHs66BnkJGs+7jSDoexcIbxpW4y4bEVYoKJUDRN3T/ZGVxHYrbXiTr
         U3FzFyAevIyOyAY+LaKZBIabwBr9/KlQtVtMv4n1Ql/1eHQIaKlh+e2uQdWMmn41d8SI
         AP744btwUjtNj3I9eJ5Z+h5FVkfSAI5uJBDPZUQm2tuekppKQH1k9Egp7TrickQxH2S5
         xHaALl8fsCKsCuXuHeq9leFTwzBkb1NMmnLkAoXKUzAbmGx7LSW3/fZxrYUFBnUkRDFX
         IbZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMOWvhmxGE17ghkvjHeoEm/5f5vVq76XdNB3EgJdRPsIyylKn0uuNYohcbxVeZmj6wKUIJnmWtzrd+P1FDdSSp@lists.infradead.org
X-Gm-Message-State: AOJu0Ywjs+u1uLLd04uUKWGbzIc3C/SPLx9sSEc98XJ2/4ORdnWH+1bA
	zFkzt4aP2D1yRrqs2JuhV8u0oUAA90DvBYuWEcGl4xZeHD8wVdpgBRjjO6lblndpmlJ39yJ+YnK
	h5Gwv7A==
X-Google-Smtp-Source: AGHT+IEyEA4YX1TwqE1OHkPIShxbjzy59E1nb5MsO32y1ZAQO9ZQMLAuLwnLMldTTuOlaQTIYiJv0rnX0uU=
X-Received: from pjpo16.prod.google.com ([2002:a17:90a:9f90:b0:31f:1dad:d0a4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:fc45:b0:240:3915:99d8
 with SMTP id d9443c01a7336-24096b2f983mr14218495ad.47.1753830512332; Tue, 29
 Jul 2025 16:08:32 -0700 (PDT)
Date: Tue, 29 Jul 2025 16:08:30 -0700
In-Reply-To: <e45806c6ae3eef2c707f0c3886cb71015341741b.camel@intel.com>
Mime-Version: 1.0
References: <20250729193341.621487-1-seanjc@google.com> <20250729193341.621487-3-seanjc@google.com>
 <1d9d6e35ebf4658bbe48e6273eefff3267759519.camel@intel.com>
 <aIlRONVnWJiVbcCv@google.com> <e45806c6ae3eef2c707f0c3886cb71015341741b.camel@intel.com>
Message-ID: <aIlUbpQlYqaSO6wr@google.com>
Subject: Re: [PATCH 2/5] KVM: TDX: Exit with MEMORY_FAULT on unexpected
 pending S-EPT Violation
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, Vishal Annapurve <vannapurve@google.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	Adrian Hunter <adrian.hunter@intel.com>, "maz@kernel.org" <maz@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "nik.borisov@suse.com" <nik.borisov@suse.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_160833_760654_91DB1F25 
X-CRM114-Status: GOOD (  17.25  )
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

On Tue, Jul 29, 2025, Rick P Edgecombe wrote:
> On Tue, 2025-07-29 at 15:54 -0700, Sean Christopherson wrote:
> > > The vm_dead was added because mirror EPT will KVM_BUG_ON() if there i=
s an
> > > attempt to set the mirror EPT entry when it is already present. And t=
he
> > > unaccepted memory access will trigger an EPT violation for a mirror P=
TE
> > > that is already set. I think this is a better solution irrespective o=
f
> > > the vm_dead changes.
> >=20
> > In that case, this change will expose KVM to the KVM_BUG_ON(), because =
nothing
> > prevents userspace from re-running the vCPU.=C2=A0
>=20
> If userspace runs the vCPU again then an EPT violation gets triggered aga=
in,
> which again gets kicked out to userspace. The new check will prevent it f=
rom
> getting into the fault handler, right?

Yes?  But I'm confused about why you mentioned vm_dead, and why you're call=
ing
this a "new check".  This effectively does two things: drops kvm_vm_dead() =
and
switches from EOI =3D> EFAULT.  _If_ setting vm_dead was necessary, then we=
 have a
problem.

I assume by "The vm_dead was added" you really mean "forcing an exit to use=
rspace",
and that kvm_vm_dead()+EIO was a somewhat arbitrary way of forcing an exit?

> >  Which KVM_BUG_ON() exactly gets hit?
>=20
> Should be:
>=20
> static int __must_check set_external_spte_present(struct kvm *kvm, tdp_pt=
ep_t
> sptep,
> 						 gfn_t gfn, u64 old_spte,
> 						 u64 new_spte, int level)
> {
> 	bool was_present =3D is_shadow_present_pte(old_spte);
> 	bool is_present =3D is_shadow_present_pte(new_spte);
> 	bool is_leaf =3D is_present && is_last_spte(new_spte, level);
> 	kvm_pfn_t new_pfn =3D spte_to_pfn(new_spte);
> 	int ret =3D 0;
>=20
> 	KVM_BUG_ON(was_present, kvm);

Yeah, I don't see how that can be reach in this scenario.=20

