Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E605CC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 01:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=73dgZbebrLU8zYg1FAZPFQA33fxb43EZn3LSBSzNaM8=; b=1+8R/sueGeAj0NepYOQujPKed3
	P2F1+WCgNOup1i3Z7Ie0lCHu589T475DzU8b7dDFcfGE1JN2Z7vQ56CBWqQ+xZpJl8ZSyB1IW3tVF
	SVQW5Nc2ZLP7MDBFV75wW6N1utTcNQ2z1fhGHhS9OxTPX3mdurgSJOITrfwwNOKALM/ihpV6EFkf4
	D3T5PDvkY3r+32wVxerxalAKkVsLllSFTuqIBdiDp0S7+owxSseTlc6n3mKO7TimCD4otRps5GpL9
	3YpZjbGTO3IhNqFgSAJRPl+yIkOsQWFSMPbe1j2emsHZW3P7DrWXTvlrRfaKIbjN/QCbX3a8itMDk
	JCDIwajw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhf3T-00000004oF9-4APZ;
	Fri, 01 Aug 2025 01:59:31 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhf0u-00000004nwy-2nvR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 01:56:53 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-24070ef9e2eso79125ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 18:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754013411; x=1754618211; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73dgZbebrLU8zYg1FAZPFQA33fxb43EZn3LSBSzNaM8=;
        b=Uve/YbG+tE0N+OdZSkQZnxebZOvsTUPy43FxRiGx7krL+mkR3/At+WE25VUaVCXoSo
         +UNhkOdPhMVHi0KN5MkIMr53mPUTQvVW8kEutAQAY27uOoBB12uYfEzs/FYbf3xpfIbP
         QH3ZuGIflv/zV5BjECGvxe459NbpuFYnJrDZOxZeRpt7bSe8MnD4lYC47JTMMPqJQo4b
         q8rZHtaxazYwlj+RrhF/Xa7m3wsHHo7wDPiJ4aBagbdlKLGj5v0T5SqDq3JU4aG0PD40
         mr6Kz+oBqvyDgUfIMXv+cwwIU+9eAMvwWmCWNjdwcKL6ARD1TVCRnbGzmdnVa0dXH701
         2lyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754013411; x=1754618211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=73dgZbebrLU8zYg1FAZPFQA33fxb43EZn3LSBSzNaM8=;
        b=EVYS83n1ohnhJrJiCPGocPiawFa+LBrfG9SGSGSwHTynRNj6HSmaIA5TjSA5DT+KCQ
         W3glhXsPWgXK1IgNuM6ERyXsOofWB5d3DrYL8HuTe/xdgBK8FRBQm6hthypX92fahSWK
         YGgyyYx+9vXSlHUtSfqi89h0v4mZGqRAPCCvu2TL+zxrxzFIB8ofcOP/yydGtHRzZAJU
         8x+5SpFW2d/7yQDthUHyhqgRKxOKP5mdV4ehIOLWR9Lng6Yu932sOOral4KBdguXO0uj
         Vzsa/1y0G5VM8dDWcoJ3TI0ZAXpQ+cuctm1PgxdeAiCVPKkOwTolntraqnFh+Zzgz3yL
         ne/g==
X-Forwarded-Encrypted: i=1; AJvYcCXpjotYFiA+SadZfLN77B9AxP4lwiTkyfpoSE0PjkzFIoMBaTk2zqTvwNgRi+5lZ1RwCGvOyZgJCyhJUkIrEe9t@lists.infradead.org
X-Gm-Message-State: AOJu0YzD3idcEPTBdt+cjXimf9xVg78pdHaQ4t4QBiJXFnhoGbB8pxlJ
	sHcbPmTzads4ZEPLsys3ThF+xMQNQ01WqUj/sSZaBvyAAzjbw5HW9uyA/u7C+vb030j3rdQVzm2
	L0PRr8KVzR+lUGAGe8f3kj5MbNmW5cu6VngjiOj65
X-Gm-Gg: ASbGnctt1MQZeC3IEFMU51qL5CvN1efpNwP5YJUfCHaol3JDSCwb8Iclghxc8cnb7Zd
	V+2p1cJgPNMgc44ZFP0xaAJXbk6nyyEELrFVU2vjDeHzl+RIgmAzveTDgH323NHcAJxmWlygL4C
	LeGc9SLsAO64QOot8Lvf3AJvlRznBJDIPaanuI6VsKHyqRUvZzo+heeUC3u9yJUamSYWOahJZmr
	NpOGuMHqy3zK00oV5LDQoN09taZmQgApf2b/g==
X-Google-Smtp-Source: AGHT+IGvZgypmLXLSq3N1f77JjImJFtH643iQZJ6JC8/AqrHkOHoDRMIuJnZGr/f0hMyS1/ZxzAo17cEHgxEVEja0es=
X-Received: by 2002:a17:902:d490:b0:240:48f4:40fd with SMTP id
 d9443c01a7336-2422a435a05mr1308475ad.19.1754013410954; Thu, 31 Jul 2025
 18:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250611104844.245235-1-steven.price@arm.com> <20250611104844.245235-20-steven.price@arm.com>
In-Reply-To: <20250611104844.245235-20-steven.price@arm.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Thu, 31 Jul 2025 18:56:38 -0700
X-Gm-Features: Ac12FXzyEE-6rAkSbBh6dTxzQhEIIz_vo5j0_DPiuqgwWpPvKvjM24zs36qca7o
Message-ID: <CAGtprH-on3JdsHx-DyjN_z_5Z6HJoSQjJpA5o5_V6=rygMSbtQ@mail.gmail.com>
Subject: Re: [PATCH v9 19/43] arm64: RME: Allow populating initial contents
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_185652_711468_6FDBFF2E 
X-CRM114-Status: GOOD (  21.76  )
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

On Wed, Jun 11, 2025 at 3:59=E2=80=AFAM Steven Price <steven.price@arm.com>=
 wrote:
>
> +static int realm_create_protected_data_page(struct realm *realm,
> +                                           unsigned long ipa,
> +                                           kvm_pfn_t dst_pfn,
> +                                           kvm_pfn_t src_pfn,
> +                                           unsigned long flags)
> +{
> +       unsigned long rd =3D virt_to_phys(realm->rd);
> +       phys_addr_t dst_phys, src_phys;
> +       bool undelegate_failed =3D false;
> +       int ret, offset;
> +
> +       dst_phys =3D __pfn_to_phys(dst_pfn);
> +       src_phys =3D __pfn_to_phys(src_pfn);
> +
> +       for (offset =3D 0; offset < PAGE_SIZE; offset +=3D RMM_PAGE_SIZE)=
 {
> +               ret =3D realm_create_protected_data_granule(realm,
> +                                                         ipa,
> +                                                         dst_phys,
> +                                                         src_phys,
> +                                                         flags);
> +               if (ret)
> +                       goto err;
> +
> +               ipa +=3D RMM_PAGE_SIZE;
> +               dst_phys +=3D RMM_PAGE_SIZE;
> +               src_phys +=3D RMM_PAGE_SIZE;
> +       }
> +
> +       return 0;
> +
> +err:
> +       if (ret =3D=3D -EIO) {
> +               /* current offset needs undelegating */
> +               if (WARN_ON(rmi_granule_undelegate(dst_phys)))
> +                       undelegate_failed =3D true;
> +       }
> +       while (offset > 0) {
> +               ipa -=3D RMM_PAGE_SIZE;
> +               offset -=3D RMM_PAGE_SIZE;
> +               dst_phys -=3D RMM_PAGE_SIZE;
> +
> +               rmi_data_destroy(rd, ipa, NULL, NULL);
> +
> +               if (WARN_ON(rmi_granule_undelegate(dst_phys)))
> +                       undelegate_failed =3D true;
> +       }
> +
> +       if (undelegate_failed) {
> +               /*
> +                * A granule could not be undelegated,
> +                * so the page has to be leaked
> +                */
> +               get_page(pfn_to_page(dst_pfn));

I would like to point out that the support for in-place conversion
with guest_memfd using hugetlb pages [1] is under discussion.

As part of the in-place conversion, the policy we are routing for is
to avoid any "refcounts" from KVM on folios supplied by guest_memfd as
in-place conversion works by splitting and merging folios during
memory conversion as per discussion at LPC [2].

The best way to avoid further use of this page with huge page support
around would be either:
1) Explicitly Inform guest_memfd of a particular pfn being in use by
KVM without relying on page refcounts or
2) Set the page as hwpoisoned. (Needs further discussion)

This page refcounting strategy will have to be revisited depending on
which series lands first. That being said, it would be great if ARM
could review/verify if the series [1] works for backing CCA VMs with
huge pages.

[1] https://lore.kernel.org/kvm/cover.1747264138.git.ackerleytng@google.com=
/
[2] https://lpc.events/event/18/contributions/1764/

> +       }
> +
> +       return -ENXIO;
> +}
> +
> +static int populate_region(struct kvm *kvm,
> +                          phys_addr_t ipa_base,
> +                          phys_addr_t ipa_end,
> +                          unsigned long data_flags)
> +{
> +       struct realm *realm =3D &kvm->arch.realm;
> +       struct kvm_memory_slot *memslot;
> +       gfn_t base_gfn, end_gfn;
> +       int idx;
> +       phys_addr_t ipa =3D ipa_base;
> +       int ret =3D 0;
> +
> +       base_gfn =3D gpa_to_gfn(ipa_base);
> +       end_gfn =3D gpa_to_gfn(ipa_end);
> +
> +       idx =3D srcu_read_lock(&kvm->srcu);
> +       memslot =3D gfn_to_memslot(kvm, base_gfn);
> +       if (!memslot) {
> +               ret =3D -EFAULT;
> +               goto out;
> +       }
> +
> +       /* We require the region to be contained within a single memslot =
*/
> +       if (memslot->base_gfn + memslot->npages < end_gfn) {
> +               ret =3D -EINVAL;
> +               goto out;
> +       }
> +
> +       if (!kvm_slot_can_be_private(memslot)) {
> +               ret =3D -EPERM;
> +               goto out;
> +       }
> +
> +       while (ipa < ipa_end) {
> +               struct vm_area_struct *vma;
> +               unsigned long hva;
> +               struct page *page;
> +               bool writeable;
> +               kvm_pfn_t pfn;
> +               kvm_pfn_t priv_pfn;
> +               struct page *gmem_page;
> +
> +               hva =3D gfn_to_hva_memslot(memslot, gpa_to_gfn(ipa));
> +               vma =3D vma_lookup(current->mm, hva);
> +               if (!vma) {
> +                       ret =3D -EFAULT;
> +                       break;
> +               }
> +
> +               pfn =3D __kvm_faultin_pfn(memslot, gpa_to_gfn(ipa), FOLL_=
WRITE,
> +                                       &writeable, &page);

Is this assuming double backing of guest memory ranges? Is this logic
trying to simulate a shared fault?

Does memory population work with CCA if priv_pfn and pfn are the same?
I am curious how the memory population will work with in-place
conversion support available for guest_memfd files.

> +
> +               if (is_error_pfn(pfn)) {
> +                       ret =3D -EFAULT;
> +                       break;
> +               }
> +
> +               ret =3D kvm_gmem_get_pfn(kvm, memslot,
> +                                      ipa >> PAGE_SHIFT,
> +                                      &priv_pfn, &gmem_page, NULL);
> +               if (ret)
> +                       break;
> +
> +               ret =3D realm_create_protected_data_page(realm, ipa,
> +                                                      priv_pfn,
> +                                                      pfn,
> +                                                      data_flags);
> +
> +               kvm_release_page_clean(page);
> +
> +               if (ret)
> +                       break;
> +
> +               ipa +=3D PAGE_SIZE;
> +       }
> +
> +out:
> +       srcu_read_unlock(&kvm->srcu, idx);
> +       return ret;
> +}
> +

