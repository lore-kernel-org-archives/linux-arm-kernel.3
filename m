Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2628D1062895
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 12:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y2MGgBYTaEO28Ct4I8jS2apA/t/hDq2a42kL+JCrbEY=; b=NXf67t/uV5MhQW4eTC6ySkTpqv
	icMd+5vZrvyg1eY2Xbku8ggeNL7a8dlHwMbC5LtAaMbQ4Wnvupt14pCa7+7EvzoDiGRwjPSNs/qUR
	Ldxy2hTl1s8oDRcjsSQXF7C2+A8tUsWR3qTXSbd0Ad9p0Ndmslh5W/JfzxTCo9P7fVGGSClF4Cpnf
	ROnNzcRDxsmtbRcUDXrbufGQ/9IiNR5P9grtuejPlR2P+9NrVOx7g3CJE17Zp88rck93+gAi3Taw/
	mSkyJWYf2YsfyAAP/cGGi8T+bRstWZy3iWidM5fr1twQ7almihiBscAN0TzQNLOczgiu0X1uhad+n
	Ij7OdGRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0J0n-0000000BabS-3JeW;
	Wed, 11 Mar 2026 12:50:05 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0J0l-0000000Baam-3JC9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 12:50:04 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-509069a7a7fso571311cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 05:50:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773233402; cv=none;
        d=google.com; s=arc-20240605;
        b=ZKRipzg/VMGjm4fTh9FYzjB9o7coxUHi6EjDptTn7jqf5GTH6BmaS+tkUaLAnM/dd1
         hNeSp5zCMDoHHBOOX84vlA0o00n0sNYqY9CRbgCw1k/ZGmQTUpx1ARcQOGPJt9EqP2te
         J7kvdLg0iAHkcqYeVG8uYdWqqaqv2RICP9HUmGfKw6paKETel/C5yujngMq+MezAnjBD
         eRgDszj6t2jriqYmW7fkv/9ov9e5d6Lg1wOE47DEGUDWJCT03zp8x6oIGm3HsAswwV00
         iqpqCq7RFwQrqZj9Agbc8RvDfbCF5/IL4Auq+Se/qFbvD7lv5pUzfWzZLcJF21Dz/+c1
         M5aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=y2MGgBYTaEO28Ct4I8jS2apA/t/hDq2a42kL+JCrbEY=;
        fh=TOZqU04Bzk0mt10J08Or2poXsJY6IxkqEaX9t7SaC4g=;
        b=eBGsW1KDsi+1IF04OaERRxohqfteqnllkBS/xbjEG3DahInKuE6fL/HCRfKm3LaokW
         M5+Wj+yaGvv7us/RbPNxuaq9EsTf50ypA5e2dbSqjZjsC0aF0+fK+9ciFuIeOHTCTSQm
         HoHKvA1ysYj4iYFhN0UE7L3cyVPOEe1LPQzbxnMLgWqKGsjDpB8O1g8/dnQNywEx6SpF
         g9SAs26WUp6TZaoogLIOXQ0l1aqMbnTvYVBQB9nBYPEDtvdwYYLANGUIdXu21wnUcxZS
         DHSExXfAnS41I2YyohIDZROqAgUTxQzHsmL+K8tk41fDa0tdWnp0W9RWjVon15uSWpR4
         ctDA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773233402; x=1773838202; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y2MGgBYTaEO28Ct4I8jS2apA/t/hDq2a42kL+JCrbEY=;
        b=np4G2nt42j6alm/Grk+MAsB3qo+MYl/YV+iqoYFYjbtePdyi3uFuEfcWHcJbMnpieH
         3XLABDdzzX4/1ejx6ayqvW+UpQ4IJdqh41XEnhl3PIESmb+WESNxvsaELRwov0Mb8oGY
         aZInLzG9xI06PqglyhfSs0Ixq1TGcbJCjhVBJn6KjMZqQiFw+tGjhf2ZEQO50TLWJ6W2
         g/gi8i+YblqDPcr5+SBhJ6NqM+UxO4oiLD4PxqFQimY1RtLlVbDjs/N2K1Uu2cpWQfiW
         chQS//veoy3YGFy3d+wgoAF17ApG1/QGuEfvn3+X3Iwh3MRuYwaMXgJTh6PqimWZGn6c
         3a+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773233402; x=1773838202;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y2MGgBYTaEO28Ct4I8jS2apA/t/hDq2a42kL+JCrbEY=;
        b=FyRKk3p8F0JhPhrvyZzUyfmtjmbgmp6Ceqnjx2FzmP0oXtw9MPllDQCikVR9+Y/LEv
         ZexDRZL6QWsbUHN6fzyCXUNDiSOQRIB2Fp7BulFNqoT46EmYFHkrUjpET8IK5OGxplkZ
         Q4Mt1oH3gimmODZ2WfGKrLRMcKrGN4Sxey2V9qlCOluCkGsmynt+psIadmHSLxyTNPb7
         9ZYMkEGrl5pTd/rK7tCpaLsxX5AJxul3kK/kmn86mXmJ20n9HWsS3zO9A2yBXX4BREq2
         IgOESoaho8Mot6PUAFmMwlzsGkDpGUTPFrMaczyFBP1Rp6jIgaDbkbXVoTa3/rU0yUX5
         ZjtA==
X-Forwarded-Encrypted: i=1; AJvYcCX+z4a7Vjw6H6sSVhtTMYoLSdzr/fHIrtEm3W/tqEooW30Rc3xctOJNTfXZravaNwqg6vUXep9C8/GEtleImoEu@lists.infradead.org
X-Gm-Message-State: AOJu0YxkFCqBwlquEktFd+Koe3GqY0TbO4VyWAXFzf8ViasrK/ODu3cb
	z5c50VWBQdc2hKPAc+jC7oM2owwBu8mxLulsGtQyjXTE19yHPO2R1z7ay2y9A6QQB3YlZPcDGiR
	+kiiQpEz0VLVfpdeUW+aLH0l+WI9EH5NOps68mJJt
X-Gm-Gg: ATEYQzykWpTxWE7hPywhf3ahSdkR+b9KhF9FlkdTRgwC/ilN1mWPcTaGO2rJUhdq46d
	RQNKCBa6H9+oqrsskpPap55TiRyNWhahr2f+P68WaOcSUd7Nt+2HgYeACryOxXcT/Wmmbwv5Md0
	zCXIY9rB/gFPdDH3JIp0IwkvHwSQ3rxhAW3NvrXbnU9fgBJB+8BPo82sEWO5VlmMitye41RN9+J
	uxMQbQN3XCysbP55WLunwmZ3sKqEAaeabAzc3ajxBlXhRmYcEuOHMR4ELG4b1xPugeibEcFlW2d
	l8pxDL61oIqwZqGWQe2WEK3CchXpSQM2QQuRaw==
X-Received: by 2002:a05:622a:285:b0:509:15b6:f69f with SMTP id
 d75a77b69052e-509381899c3mr12930681cf.2.1773233401760; Wed, 11 Mar 2026
 05:50:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260305144351.17071-1-will@kernel.org> <20260305144351.17071-4-will@kernel.org>
In-Reply-To: <20260305144351.17071-4-will@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 11 Mar 2026 12:49:23 +0000
X-Gm-Features: AaiRm50zL21Iu6bgO6eh5nslf62hR-XP381uJXsn-8C7zkK1BYfoGCC_CzNKrWU
Message-ID: <CA+EHjTy3ipkQ+h2h5acbJSJHMe-aPw=Ai+g74vgRi3mRSK_Jvg@mail.gmail.com>
Subject: Re: [PATCH v3 03/36] KVM: arm64: Rename __pkvm_pgtable_stage2_unmap()
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Quentin Perret <qperret@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Mostafa Saleh <smostafa@google.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_055003_836912_6C6CA625 
X-CRM114-Status: GOOD (  18.34  )
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
> In preparation for adding support for protected VMs, where pages are
> donated rather than shared, rename __pkvm_pgtable_stage2_unmap() to
> __pkvm_pgtable_stage2_unshare() to make it clearer about what is going
> on.
>
> Signed-off-by: Will Deacon <will@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  arch/arm64/kvm/pkvm.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index 7797813f4dbe..42f6e50825ac 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -322,7 +322,7 @@ int pkvm_pgtable_stage2_init(struct kvm_pgtable *pgt, struct kvm_s2_mmu *mmu,
>         return 0;
>  }
>
> -static int __pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 start, u64 end)
> +static int __pkvm_pgtable_stage2_unshare(struct kvm_pgtable *pgt, u64 start, u64 end)
>  {
>         struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
>         pkvm_handle_t handle = kvm->arch.pkvm.handle;
> @@ -350,7 +350,7 @@ void pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
>         if (!handle)
>                 return;
>
> -       __pkvm_pgtable_stage2_unmap(pgt, addr, addr + size);
> +       __pkvm_pgtable_stage2_unshare(pgt, addr, addr + size);
>  }
>
>  void pkvm_pgtable_stage2_destroy_pgd(struct kvm_pgtable *pgt)
> @@ -386,7 +386,7 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
>                         return -EAGAIN;
>
>                 /* Remove _any_ pkvm_mapping overlapping with the range, bigger or smaller. */
> -               ret = __pkvm_pgtable_stage2_unmap(pgt, addr, addr + size);
> +               ret = __pkvm_pgtable_stage2_unshare(pgt, addr, addr + size);
>                 if (ret)
>                         return ret;
>                 mapping = NULL;
> @@ -409,7 +409,7 @@ int pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size)
>  {
>         lockdep_assert_held_write(&kvm_s2_mmu_to_kvm(pgt->mmu)->mmu_lock);
>
> -       return __pkvm_pgtable_stage2_unmap(pgt, addr, addr + size);
> +       return __pkvm_pgtable_stage2_unshare(pgt, addr, addr + size);
>  }
>
>  int pkvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
> --
> 2.53.0.473.g4a7958ca14-goog
>

