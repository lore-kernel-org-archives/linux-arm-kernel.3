Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E741D778AC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 18:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZS1VP6COkKjKYZmCvco4g4510UVwVXjW35gfix/QdJA=; b=nnsEfq9dLfDRnoCaRsjcinUTNJ
	PK4SlHWlMQp3r5KZGwNtu8XXqvl+w5fCKWMI/teKowk/hQkjrlGkAQHKgRmi3NQsCgBvWEoYXSXJ6
	hRYNSBYNmCw+UrCZrMCsZL4gbGRW/xb86eHxZpPudmFVWfS2/x6SIFttL2FZO5PZwNSK2bD/+2dpJ
	sBlWWqnceEH/7Z2btRadNpcmVyAsTl+NswQ5vvysESBYh197u84Vx/sxZBh2DdWErClx0OwYsNV21
	wtbeR5SX2KJEZEIT9FTJif/mR3zhZFz4zMwQfoU8IsfzfOw519/7/8497rPb8PWT8xmUBifWC1Gw5
	2U1B/Urg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjMM0-00000009NFN-0WbU;
	Fri, 23 Jan 2026 18:57:56 +0000
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjMLy-00000009NEm-1EDC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 18:57:55 +0000
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-93f56804894so1844384241.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 10:57:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769194672; cv=none;
        d=google.com; s=arc-20240605;
        b=UHTTv+Eugp2JjCwahLfqQiab2Tg5gIDeLcUbiF7GR734863bS+tNbsDw5Xy80iv+sR
         jBv/nDFOvImUrrk2huNsy2gvPElohBSZ79OiU0S6Bx+yc/gV050Cjx2dd8qPX9H010Yt
         tfAYGljYC53SXc78ZnkmR3qikFKtKKPqk2Z09rhExe3+N1sCSlLDBIhHS6Qgc+D82qMJ
         YrTkN8JCVjR/1KUpjBNSm2BRX+XJWWda/X7BFJTFm6hI3wVDJvPqEQAsBVNnUwy86Atf
         H8I3NoXAdmmWNCPTy6cgIRAusVj9OC3pdqMTJw1eJ6uTDkaze0fESwTsT5wjaZX7iA4j
         6KNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZS1VP6COkKjKYZmCvco4g4510UVwVXjW35gfix/QdJA=;
        fh=67MYya2Ja6wdFa5OOJT7NjMYh47NZBr1sgfknfTP1Z8=;
        b=Q7dMEEAP8OmtBYtylmSo/TpjSsEMi4NffiPIcSBOpjR2YnZ14rAQ+itOn6MDS1qshX
         IHFO4Zl+cD1ECpUnyecMZ5SAM9Wt15976IanGzz+XpwrwMpUwisd/f8pvZ/WmNJIg5nT
         DvuC43sUmbO0MIbJF8aaOgE6mEWEWJZnCs5BYjXMscw4UY3ramvKYvQovUsnj4Hq88JO
         0dkyHjHgYHxGGTGcnNTv8gmN9I2BKmekfW3mjqnnJkBg7OOGMgqHYS62yENTxsm+sLSl
         7ErHYpk+IQ1sNuHkBq+8ncHEv+lYzUBuxBlb1k1Asz+MCVHcFblfOS1QhxKquwMFlmYG
         8dcQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769194672; x=1769799472; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZS1VP6COkKjKYZmCvco4g4510UVwVXjW35gfix/QdJA=;
        b=MLBaHLgMzYDTa3puHoNV92Vc2l32+5dS9KZPbfLCp9ul86qJlQU+E+ymlxiCTB3Nt8
         kCqP23ZBiDq4XZi+MdLeb/sZlNOIxr3mRiF7trfMhhBTOfQMXS+Ur4gNDE6DT3T1V42S
         MVBmGvEdSXduyunf4zHs88vSDQ3w+p29j8KZoUo3DYHEbHy50Uyayu67VzIHyQzIDd0U
         IstwraUmDYjCDi1ixAjQml/AbIcaTh7IRCpQ9h5ZJLV3VfKKVjeAokwNpuBPSQRQ5PGk
         KcKSz1kzDYnbLPVaRNqESCJQKQ4GSps698BoNUh2faua2NCq1diUu3wQyp1l+H3YOyiy
         /azA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769194672; x=1769799472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZS1VP6COkKjKYZmCvco4g4510UVwVXjW35gfix/QdJA=;
        b=tEptcGVfVzLhHEVKsPthtduuCdurtWh3rIYi3n7Szl5i5KuD6q41KDYZAOotJqYN7i
         SLMNsLRz+E8RDQaHWVsj/kPYvc/3+ZoTPlzXPI7Foa3WJQfeud0FkaBugL6fTKWn1b1I
         v9rOyWEOQuvLlYf7e8aHyB8Ynxsau2sKBhQt57WO0EAqFfRfORrC9eoYJHd0qsvsAf/D
         8aBvI9MuBrUm7K9D4BYSJ20i/VgcK4xK6G25fzM9zX/14xqpzpBju15Nl+hZyTLtjhQN
         QKOQgG/1utKakTxIjIr5k38ZK72Qz1FXEegw2SqE0oudHNeOrnTUHPME5ms9kh3GknYo
         Z33A==
X-Forwarded-Encrypted: i=1; AJvYcCULU9nBH9b+tY2NT3p4HpLfyWELI41T88xmtpZqkWYWv3LygADLuOegtkJkP6i1sFGaI6YPVOPvj/K9XzpS5ev6@lists.infradead.org
X-Gm-Message-State: AOJu0YzxUefIkV85wFsX3T9dNe78hwqaH51gLstefzAF+qGG29YVE+vb
	qXLPlmRTtvigThJKw4lqrZ2RLZNp+IKwjG30uEGuKEVIyXSyTSYVm1ByoPK9DLQKltAYwLY7NNR
	3UGPo+Rf64rBShsJQLOqOUT432Pb9Y4U7JrTPrQ30V8DLBA1OMUO19fryoe4=
X-Gm-Gg: AZuq6aKWVo5+wBF2qCo0Wztqtxc4E6uUIFoJ7573ihBL7V/2L0LpX1jTcbi+yDn17GM
	1hdAJ57nmTvwM8Dq8Z4hIvmLrZP+l75MyCHwDLRBWK5AkWXT4zMQqtCJ/34tYSNIU5ci0PA6HLG
	W4Swf8uNc2uz2yTNYRtyprmNN5nj/EqpPyBOiAro4mCfHDZ2WIvwru3eWxgMd/w/m2NZXDjqSqW
	pETlgpcfJsC2B59eiJuX4PsjE9unU3KEA+bRqzTCDHyYejG35uHqfagsi6F47OjtX1igRwFaNMl
	ySoWHnpjR/SlsOagYLWlf5IEPA==
X-Received: by 2002:a05:6102:dd1:b0:5ef:2457:8011 with SMTP id
 ada2fe7eead31-5f54bc628a1mr1369126137.21.1769194671879; Fri, 23 Jan 2026
 10:57:51 -0800 (PST)
MIME-Version: 1.0
References: <20251217101125.91098-1-steven.price@arm.com> <20251217101125.91098-23-steven.price@arm.com>
In-Reply-To: <20251217101125.91098-23-steven.price@arm.com>
From: Alper Gun <alpergun@google.com>
Date: Fri, 23 Jan 2026 10:57:38 -0800
X-Gm-Features: AZwV_QhZYPGr8z6s2H9r2lNS2DnUjwnSFq4bTCqpFEvFz2mvBWHpQWX_DZm5pNo
Message-ID: <CABpDEumQ=62nZ_xEN6oMHw=J+6ps=Gy=1vx8i=6Hz+BacO1Ymg@mail.gmail.com>
Subject: Re: [PATCH v12 22/46] arm64: RMI: Create the realm descriptor
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, 
	Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve <vannapurve@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_105754_351988_7AD41B0D 
X-CRM114-Status: GOOD (  27.18  )
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

On Wed, Dec 17, 2025 at 2:13=E2=80=AFAM Steven Price <steven.price@arm.com>=
 wrote:
>
> Creating a realm involves first creating a realm descriptor (RD). This
> involves passing the configuration information to the RMM. Do this as
> part of realm_ensure_created() so that the realm is created when it is
> first needed.
>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> New patch for v12
> ---
>  arch/arm64/kvm/rmi.c | 117 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 115 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
> index b51e68e56d56..18edc7eeb5fa 100644
> --- a/arch/arm64/kvm/rmi.c
> +++ b/arch/arm64/kvm/rmi.c
> @@ -500,6 +500,106 @@ static void realm_unmap_shared_range(struct kvm *kv=
m,
>                              start, end);
>  }
>
> +/* Calculate the number of s2 root rtts needed */
> +static int realm_num_root_rtts(struct realm *realm)
> +{
> +       unsigned int ipa_bits =3D realm->ia_bits;
> +       unsigned int levels =3D 4 - get_start_level(realm);
> +       unsigned int sl_ipa_bits =3D levels * (RMM_PAGE_SHIFT - 3) +
> +                                  RMM_PAGE_SHIFT;
> +
> +       if (sl_ipa_bits >=3D ipa_bits)
> +               return 1;
> +
> +       return 1 << (ipa_bits - sl_ipa_bits);
> +}
> +
> +static int realm_create_rd(struct kvm *kvm)
> +{
> +       struct realm *realm =3D &kvm->arch.realm;
> +       struct realm_params *params =3D realm->params;
> +       void *rd =3D NULL;
> +       phys_addr_t rd_phys, params_phys;
> +       size_t pgd_size =3D kvm_pgtable_stage2_pgd_size(kvm->arch.mmu.vtc=
r);
> +       int i, r;
> +       int rtt_num_start;
> +
> +       realm->ia_bits =3D VTCR_EL2_IPA(kvm->arch.mmu.vtcr);
> +       rtt_num_start =3D realm_num_root_rtts(realm);
> +
> +       if (WARN_ON(realm->rd || !realm->params))
> +               return -EEXIST;
> +
> +       if (pgd_size / RMM_PAGE_SIZE < rtt_num_start)
> +               return -EINVAL;
> +
> +       rd =3D (void *)__get_free_page(GFP_KERNEL);
> +       if (!rd)
> +               return -ENOMEM;
> +
> +       rd_phys =3D virt_to_phys(rd);
> +       if (rmi_granule_delegate(rd_phys)) {
> +               r =3D -ENXIO;
> +               goto free_rd;
> +       }
> +
> +       for (i =3D 0; i < pgd_size; i +=3D RMM_PAGE_SIZE) {
> +               phys_addr_t pgd_phys =3D kvm->arch.mmu.pgd_phys + i;
> +
> +               if (rmi_granule_delegate(pgd_phys)) {
> +                       r =3D -ENXIO;
> +                       goto out_undelegate_tables;
> +               }
> +       }
> +
> +       params->s2sz =3D VTCR_EL2_IPA(kvm->arch.mmu.vtcr);
> +       params->rtt_level_start =3D get_start_level(realm);
> +       params->rtt_num_start =3D rtt_num_start;
> +       params->rtt_base =3D kvm->arch.mmu.pgd_phys;
> +       params->vmid =3D realm->vmid;

I don't see a way to configure rpv and hash_algo anymore. I assume they
are gone for a minimal userspace interface. Will there be a way to set
them going forward?

> +
> +       params_phys =3D virt_to_phys(params);
> +
> +       if (rmi_realm_create(rd_phys, params_phys)) {
> +               r =3D -ENXIO;
> +               goto out_undelegate_tables;
> +       }
> +
> +       if (WARN_ON(rmi_rec_aux_count(rd_phys, &realm->num_aux))) {
> +               WARN_ON(rmi_realm_destroy(rd_phys));
> +               r =3D -ENXIO;
> +               goto out_undelegate_tables;
> +       }
> +
> +       realm->rd =3D rd;
> +       WRITE_ONCE(realm->state, REALM_STATE_NEW);
> +       /* The realm is up, free the parameters.  */
> +       free_page((unsigned long)realm->params);
> +       realm->params =3D NULL;
> +
> +       return 0;
> +
> +out_undelegate_tables:
> +       while (i > 0) {
> +               i -=3D RMM_PAGE_SIZE;
> +
> +               phys_addr_t pgd_phys =3D kvm->arch.mmu.pgd_phys + i;
> +
> +               if (WARN_ON(rmi_granule_undelegate(pgd_phys))) {
> +                       /* Leak the pages if they cannot be returned */
> +                       kvm->arch.mmu.pgt =3D NULL;
> +                       break;
> +               }
> +       }
> +       if (WARN_ON(rmi_granule_undelegate(rd_phys))) {
> +               /* Leak the page if it isn't returned */
> +               return r;
> +       }
> +free_rd:
> +       free_page((unsigned long)rd);
> +       return r;
> +}
> +
>  static int realm_unmap_private_page(struct realm *realm,
>                                     unsigned long ipa,
>                                     unsigned long *next_addr)
> @@ -803,8 +903,21 @@ static int realm_init_ipa_state(struct kvm *kvm,
>
>  static int realm_ensure_created(struct kvm *kvm)
>  {
> -       /* Provided in later patch */
> -       return -ENXIO;
> +       int ret;
> +
> +       switch (kvm_realm_state(kvm)) {
> +       case REALM_STATE_NONE:
> +               break;
> +       case REALM_STATE_NEW:
> +               return 0;
> +       case REALM_STATE_DEAD:
> +               return -ENXIO;
> +       default:
> +               return -EBUSY;
> +       }
> +
> +       ret =3D realm_create_rd(kvm);
> +       return ret;
>  }
>
>  static int set_ripas_of_protected_regions(struct kvm *kvm)
> --
> 2.43.0
>

