Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95C2CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 23:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hANv7xEJBy7S5lh8h/UQF87h23G6mY0gbFBLav72O2Q=; b=sIYaGuPqmX5QCxN/gqwXRQfNm2
	CjfGn5Y9Q1sVT98VqrZ13h3sOiX6ddDA6Sgb0j7jOVuAYyDOf3ttAnZgwQj2meCLiDtUNlzqB+zdQ
	jwdFeYqpQ+BxtoXsgDJ6MFBMT1Idtvq8iWVJjxYVXJS2Q01eMufaGmj3HXPeit61E7lu3GIqf+znx
	NdbryNqm+lHBFjt6SloqmF3JlECmZyZPKaYqBVYu+5byFjcoNYlOE858XcMH4WEDMjfkl/hwkhAM5
	iQav5t0UdOWYVAVAwnqbqsOkRw4LfyEFeGk0vL1D4Jd3LyeUC0OQkpSy+OMch1inH93kzG+7xgmQf
	W8kqLjHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEcG8-000000059LH-0t9q;
	Thu, 30 Oct 2025 23:40:48 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEcG3-000000059Jn-44S3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 23:40:45 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-781171fe1c5so1554688b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 16:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761867642; x=1762472442; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hANv7xEJBy7S5lh8h/UQF87h23G6mY0gbFBLav72O2Q=;
        b=aQHhujZNkrYlJ62Nx4qs5RFuV2+c+S17Gi53th1eADFUK4+m2/15JnSqXYN+IsNaly
         ixkGIKUM2fjJNVHw/28t76SMb7vYI1wJG5Rmh8q6E6JMVcD5hy9IsXpRdUBG+QKzgv8V
         amlE/i7veAGsAm3/Mhf+t+n7tdbuRY6AEoZu54AgYR7pOP4tilbaKjw352mU4nn/4tT5
         iJ8qRxuS8zBszHyeno9PMDBHGIEQtA2jLKU5NEoQBjJ/tcdDXFHQU+LBlZEXQDzEdVGb
         4jLgtftVm7wCCIUNM9gj6LhJ6Ew6lZBSipjKY//kOTsfmVBHbjH6ZxFzK64Y+3cMPUHG
         b2ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761867642; x=1762472442;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hANv7xEJBy7S5lh8h/UQF87h23G6mY0gbFBLav72O2Q=;
        b=wa0XeIcIihO8nQsfZ8+pNS9LtarfXlKKCzNWBxSLIHrMNSu4Jx8GGu3p9zIaKY86x4
         slO9IGfje8vu7AsTFEFSlMeB9vG+5IsiZK4PHm/hzpKpFUT8LV2nef7fcwCL2KLzYtIS
         5lG/0rEHvo5A+xa7sCHWa/APQhe1Qi1KLEQihErIUyrCKQIrYstPs5RY8OaZLUTg2avG
         morn1eLLg+O8paZYMQ8VQ5ULWXnrLYC8ijCougf6JOJ576COwb+9LOlddt6Gup6B5UrX
         bpR7l/I+g7VwuKjGOch3V1uOt7PN8tfeEpj8va3GPIbL9qi9cCfToiilgndOuhj69Jzo
         OAZw==
X-Forwarded-Encrypted: i=1; AJvYcCV6c8Tx9pyaWSmLJ9FiUFcsKNcu2W65eueV6EVpaBRrQjVRoFEx7Vc+84Ei384dLbkCKq0fMStgWlNj2KbBetm0@lists.infradead.org
X-Gm-Message-State: AOJu0YzP8taB957DGL9S2QdBMW6O/Rnj4JsN7nzdHUh4mdmclpk1WK7y
	Wio47D7r0wn2UzftpicFfsuxSi1BPzKzKpSYzuqhiH5mJhi21+rZzBm2gGL9L4Be7IPDFqmI5xR
	P/qhN6A==
X-Google-Smtp-Source: AGHT+IH6kktSpJB8uW8dOccHej0bRJlF9t4mdGsOdXoLRdKSPbgGpCfMdKkfH5SPES5/Onbr9IfT7/Ky4i8=
X-Received: from pfbhm7.prod.google.com ([2002:a05:6a00:6707:b0:77e:40c7:d12e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3996:b0:7a4:460e:f86a
 with SMTP id d2e1a72fcca58-7a7796c8a99mr1645968b3a.25.1761867642073; Thu, 30
 Oct 2025 16:40:42 -0700 (PDT)
Date: Thu, 30 Oct 2025 16:40:40 -0700
In-Reply-To: <6572689b28a76bd95bc653b1fc1131fa57ed7669.camel@intel.com>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com> <20251030200951.3402865-13-seanjc@google.com>
 <6572689b28a76bd95bc653b1fc1131fa57ed7669.camel@intel.com>
Message-ID: <aQP3eJmLTHscDoI4@google.com>
Subject: Re: [PATCH v4 12/28] KVM: TDX: WARN if mirror SPTE doesn't have full
 RWX when creating S-EPT mapping
From: Sean Christopherson <seanjc@google.com>
To: Kai Huang <kai.huang@intel.com>
Cc: "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>, 
	"maz@kernel.org" <maz@kernel.org>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, 
	"pjw@kernel.org" <pjw@kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"kas@kernel.org" <kas@kernel.org>, "maobibo@loongson.cn" <maobibo@loongson.cn>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, 
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, 
	"zhaotianrui@loongson.cn" <zhaotianrui@loongson.cn>, "anup@brainfault.org" <anup@brainfault.org>, 
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Yan Y Zhao <yan.y.zhao@intel.com>, 
	"michael.roth@amd.com" <michael.roth@amd.com>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, Vishal Annapurve <vannapurve@google.com>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_164044_116884_7AB0E33A 
X-CRM114-Status: GOOD (  15.74  )
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

On Thu, Oct 30, 2025, Kai Huang wrote:
> On Thu, 2025-10-30 at 13:09 -0700, Sean Christopherson wrote:
> > Pass in the mirror_spte to kvm_x86_ops.set_external_spte() to provide
> > symmetry with .remove_external_spte(), and assert in TDX that the mirro=
r
> > SPTE is shadow-present with full RWX permissions (the TDX-Module doesn'=
t
> > allow the hypervisor to control protections).
> >=20
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
>=20
> Reviewed-by: Kai Huang <kai.huang@intel.com>
>=20
> [...]
>=20
> >  static int tdx_sept_set_private_spte(struct kvm *kvm, gfn_t gfn,
> > -				     enum pg_level level, kvm_pfn_t pfn)
> > +				     enum pg_level level, u64 mirror_spte)
> >  {
> >  	struct kvm_tdx *kvm_tdx =3D to_kvm_tdx(kvm);
> > +	kvm_pfn_t pfn =3D spte_to_pfn(mirror_spte);
> > =20
> >  	/* TODO: handle large pages. */
> >  	if (KVM_BUG_ON(level !=3D PG_LEVEL_4K, kvm))
> >  		return -EIO;
> > =20
> > +	WARN_ON_ONCE(!is_shadow_present_pte(mirror_spte) ||
> > +		     (mirror_spte & VMX_EPT_RWX_MASK) !=3D VMX_EPT_RWX_MASK);
> > +
>=20
> Nit:=C2=A0
>=20
> I am a little bit confused about when to use WARN_ON_ONCE() and
> KVM_BUG_ON(). :-)

Very loosely: WARN if there's a decent chance carrying on might be fine,
KVM_BUG_ON() if there's a good chance carrying on will crash the host and/o=
r
corrupt the guest, e.g. if KVM suspects a hardware/TDX-Module issue.

