Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4305CFD88F6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 10:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oX0osco4zt+YO7jQlRuz/PukjnHOmVE7FLgSU6O4vqQ=; b=Ob/aK5TiKg/JpoPA0TpbgYuxrO
	GzfGjHgM+T5NQArEvW2xbMJh6FNFuTDbRxrYT1Ho5FrZGAR9E1exCUsrJ//AbgR+SYcPdpOd5CNZt
	xlGgPQd2fCru59dQm6QS5T5qDfygh+A0OfwmDfUJU9yDeiBuV2+Ln/hk78b0/0SzC2cSgu+eJXzlD
	Zmqz4W0GrgYDJXlpJrdKlsIVa2Q5OfrDNhS/94FBmVWEyxgzWagLCxoGQGRsK8xr/3BjN7vJQkupx
	uvg7RI82NapHQlA0HFfNOqcw7UMIcsZSKcltIDVSxg89zkmOWz6iuQi2UqPQfYoNRm29jh7EqsmpM
	0ahFkmvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Gc0-0000000BNy2-2b2n;
	Wed, 11 Mar 2026 10:16:20 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Gby-0000000BNxM-1Nef
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 10:16:19 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-509062d829dso410631cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 03:16:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773224177; cv=none;
        d=google.com; s=arc-20240605;
        b=A8fvmXU9R93NJP8aMP90UYHxgoIJ2D4hxyvD+ZxWdKrN+Mazh3AQY43KHPvKeyjMXC
         YhUSsZ3EmPt3b92O+dl6iwggfJuRgCDZ7ah72ECmTbygggwK/rB9+Vejg+P/DdrL2U8d
         mM7aDB8pHMS8rD6joJNBzQ5xON3DWAJRMqZXi5NaXY1Yw5YY/SPV1V7L5i2uipA6Y6xA
         ibspUNGxplWVzMWL4zY2k4xXokBH686VVUOQpLekne2TrYzKvnfTIb4oh04GvszCrawO
         PoN9h1rn2lOoiRC10Uk9srAcEdJIuP5xDBFtDQ0K8TrUIb5rUoF9anyL1jisWl5etGkZ
         caFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oX0osco4zt+YO7jQlRuz/PukjnHOmVE7FLgSU6O4vqQ=;
        fh=L0h80zMpkBtuLkyJbuuY0s7luNzPbLREnuY5x00etKs=;
        b=YeiXfeiCpU7rnaqUjsAVtkCROcevTaM6GFyTnX4sos2kThbTi130CxymdADxbd+nB3
         lZrLi6Z+UI4mGGZdw8nPqGgz670AIspsVcYb5VnFx/i4HTdh3erle85wHA36T/NYtKzJ
         uEBUGfTlp82xIQH+3fRyjn9oNABFoZbJKKSXtqUk25Em/hzUpA/dMvynKZjU5sPter3F
         PYSBXjBBH76lu70WHVJjCHwwDWwwggZT1gBe4Ly2XoZt+u0wK/WoHKiMSbQ3dMyfeq43
         zOsNAhdrX5W3opvEEDyh6uMlx03dwuTa6Cvx1rdb+yUJVoDMsdPcI7FRgF5wHlm017yh
         s+uA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773224177; x=1773828977; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oX0osco4zt+YO7jQlRuz/PukjnHOmVE7FLgSU6O4vqQ=;
        b=CE1tPQVEyw+9+Tg17u8wZ4u174Cm2HRaGK8So/zwkDKmsIkC2IMpXq6tnZupqZqSBg
         Ji2JN8oEWdirdRuIfvVEhuFwbaLkGsU+uoF7Fd6fzRtTOgGfKMy8gFlv5ZmP/2BypO0s
         iZmxQTpqzAbnmGFNcRTOwymVMC7nfImN7HYlO6LMjn5T61rvDIAdZFk0wtWO6vpVAQ9q
         S0PfPH53OBaMQzyNWAE973hKD/PqloUZDKqDLwkeRJadcec/zTbUDnFk+9+DN6ceaIkQ
         N9lHmlmUW4t4ZljIehjQWkyNwDDakhIRStZvSbBc/yWK5xB6lGr/Om+YzVHl31Tdciv6
         jsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773224177; x=1773828977;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oX0osco4zt+YO7jQlRuz/PukjnHOmVE7FLgSU6O4vqQ=;
        b=Zug6mw1lh77UoWX0Qc7EKk6UTsmt+F9je9O6sG5jgAJRDuJmEid832JKsbr6t8dDaG
         YeGPFt3osHXmcRDV3RP2hrgPHhX6TxBefSHvP7ReyC4Xqpg3OJSDA7OrrApU0upoNkck
         v5g1CiH5P44BJhn7guepHbSTl2yLbP0FNyTvw2j81flm+IuWR6aNhBjfdkd6s3jPQO2j
         g/QZW1cCp4lwkP19dD7QMYohjuedd7HEpRVmRSNHNL2Q2YU5W64cD/VktJ4qhyzxOJZ9
         o5OE4wd/Ph5RU7a3VInMfA/cizR7w86KEnHOFfBQYbYpFy+OeAUczWrlTaDpqVdgzw9w
         JH+g==
X-Forwarded-Encrypted: i=1; AJvYcCVlZC/Uvu/NS0AJ38P2yt2Bd6+16snciYWGvwUNP0HaOx+q88txZSMrcAgLUF9QsQbvOAkF+7FzkR7OumTzwWR2@lists.infradead.org
X-Gm-Message-State: AOJu0YwCslX7JwwuUP3JXxWH5FGu+SuwiEmN9veesyzL6mMw2kYuCQX2
	TrR2zlynYyDsh7+3KeA4SyWDW9v2yh6dxAcbr/nC0gvgiW12R6psXgbPTpiPmGcvdfAdin43e3m
	sf0sK1AWmyfYNhQcWyweWL7jDWryRAobQr8CiNL5l
X-Gm-Gg: ATEYQzwyefr4q7VR7w/x/Ez4eRVrYSlvc0S8KUYRLRxw4WjcAjgoQpmCidHTIRm/eCG
	41dk9TWxggxiks3YYpysPnmHhhABN5ixfVmnob40EA9Qm/QcUxhr2xHjdSE3y1U4NSwBItP+IN6
	jn43CG+Y/SeXH522jf0yW9qjhak1CQOPuBFb4+q7HN3luEdVDBcmee3Z8VuOD3w0Iph3WzbFrkc
	4mWdWP7aXM9tv0uVTTAxlsvwQIHAmJQ9zKZxTaLtO/oG2hlK5aWHE2S6p2DEN10coh1aKTYuycQ
	WtruF4d9e5KG4z+HRnjE0iRkDE1nzTHYyuZlqg==
X-Received: by 2002:a05:622a:190d:b0:509:2cd4:b705 with SMTP id
 d75a77b69052e-50938183523mr11750721cf.4.1773224176634; Wed, 11 Mar 2026
 03:16:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260305144351.17071-1-will@kernel.org> <20260305144351.17071-3-will@kernel.org>
In-Reply-To: <20260305144351.17071-3-will@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 11 Mar 2026 10:15:39 +0000
X-Gm-Features: AaiRm522OYTO4Z5oXSIsWNgqKROWgEipfiQnlhS80N_B-LAEswBJVDHD3G64CEI
Message-ID: <CA+EHjTx4T9AZkvBkJbdsqkw=joNuj1vGQ+d4xqGLsMNpKzXuLw@mail.gmail.com>
Subject: Re: [PATCH v3 02/36] KVM: arm64: Move handle check into pkvm_pgtable_stage2_destroy_range()
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Quentin Perret <qperret@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Mostafa Saleh <smostafa@google.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_031618_375714_512972AD 
X-CRM114-Status: GOOD (  20.83  )
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

On Thu, 5 Mar 2026 at 14:44, Will Deacon <will@kernel.org> wrote:
>
> When pKVM is enabled, a VM has a 'handle' allocated by the hypervisor
> in kvm_arch_init_vm() and released later by kvm_arch_destroy_vm().
>
> Consequently, the only time __pkvm_pgtable_stage2_unmap() can run into
> an uninitialised 'handle' is on the kvm_arch_init_vm() failure path,
> where we destroy the empty stage-2 page-table if we fail to allocate a
> handle.
>
> Move the handle check into pkvm_pgtable_stage2_destroy_range(), which
> will additionally handle protected VMs in subsequent patches.
>
> Signed-off-by: Will Deacon <will@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  arch/arm64/kvm/pkvm.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index d7a0f69a9982..7797813f4dbe 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -329,9 +329,6 @@ static int __pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 start, u64 e
>         struct pkvm_mapping *mapping;
>         int ret;
>
> -       if (!handle)
> -               return 0;
> -
>         for_each_mapping_in_range_safe(pgt, start, end, mapping) {
>                 ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn,
>                                         mapping->nr_pages);
> @@ -347,6 +344,12 @@ static int __pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 start, u64 e
>  void pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
>                                         u64 addr, u64 size)
>  {
> +       struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
> +       pkvm_handle_t handle = kvm->arch.pkvm.handle;
> +
> +       if (!handle)
> +               return;
> +
>         __pkvm_pgtable_stage2_unmap(pgt, addr, addr + size);
>  }
>
> --
> 2.53.0.473.g4a7958ca14-goog
>

