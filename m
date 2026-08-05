Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D1C8C55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 16:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:References:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dDxVaJA0qLhUpRmzRVBWfrwvszjITp7kHu2WvQfbt0A=; b=iOIWwlXFO3zY1n6vb1/ENWqsra
	BAC2aEwwt8foWRRkxJ9F4na3HUcHd+Aa7UY+kdTCOSC/k4kgiTA1HKU8X/H8kZhl3Z6X1FaHORzPi
	3y56+oGfImVYjuN+WrJ0xyFkr+cxkFBA5hf2tpCEjCEOnqwUonyEM3U2mpDNFEQDw22joeXdUmHSu
	zTxamoicY/fDdfNSBwep72NbL+5idLepwJEsl09vCr3z2SsXwFQQV9PuQ5OKA9CByN+3gqG+l8iji
	7fNgp0b+i9ke7gwsyad1lQJYoqZoeQNTy7km6Or81AvuYDBMHFVzQVGnTOe2Gm2HFRgzYZILhyM8d
	OFPh3MNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wre4p-00000004F20-48bo;
	Wed, 05 Aug 2026 16:02:43 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wre4n-00000004F1Q-3if3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 16:02:43 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-38e347638adso1285525a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 09:02:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785945761; cv=none;
        d=google.com; s=arc-20260327;
        b=DtY9E1etWkw5L7j3pfiwgFlkSgqlur4L+OBH06xKfjGeutgDEX1LN0vpR4axREe1lh
         cqy15yR7PZY+I2dh84JBGcMHHDblMSQ/gfQNuxpa+Ixsc6zgASw1AiQyafQ8wEAsCSoW
         Se+muS1O+ehcWD/EQUl1Fs64gyYpsNiiqNyv1R7e8bF3EbzfjpPQNw92ph0jdNvLp97K
         X4lVAa3AKfieH6HrYTSatIuZq+qR5Vu/8i3Mc5haECCu5p0nB8Kjjf/sz4qWTBmqrTqB
         kjIiqroMpVGPT+jc1DUAhsBUcTEaSyRGj6rdTUrFyFUFXkr5vwhsu+0q+t8oca2qJf57
         AuWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=dDxVaJA0qLhUpRmzRVBWfrwvszjITp7kHu2WvQfbt0A=;
        fh=SIV8t3xlr9UOsy1mp3lDM+3vowKLeoY5iWkTRMQ/A18=;
        b=reg95EJXbTWh5lljFdbLD4ssatRyH8/wT9ajSXLIUQt8K9BBRZK4mQbyPvBlirOf5n
         vjzztzS3dJp+4rYvmVWsr3efMYnHjttJnsiWXLkyjSWOScXPVgGNgNdl4DLeVmetGNO3
         DAT+XmAff1TPVooRqn6JaN4W9BcOn5YSSOiKWbsZLujbypTfvEtahTWq8Mu95IoHcTWV
         JpvhHIEEsvIeMKoOtkYlonjsfSidfJynhKIQZJt097dsjgDxc8ngmVUW6ckZcqJTaK4N
         APmp+fYDbVFvs5XZfKNTpk+G4QGtYtPAoQ26NlLyaRUbvBE3yoB5VDFj6IoeY5EXjzgK
         7jpA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785945761; x=1786550561; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dDxVaJA0qLhUpRmzRVBWfrwvszjITp7kHu2WvQfbt0A=;
        b=e6TpE6Qxwz2yDp4BIjwU9+tM+pYEGo2C7wAy58lrBOq9+EJoT3JhmEJjpF4eSmm2UP
         3fjCGxyquP5G82KGtgSXNMav0aERTcGzNHDQkRo6N5YweLxUfMDzVXq6qOGM/IcGo8re
         Vczfa8+24vW7MwXFVVkHDYl0IZ4JQFlh+REAqGJKPgrsNJk8k99x5wMJFBjRk+OT+Tra
         ZBP2JRmKw1iQyMimBzdeLQZ6iHLhYMdXPCSDXEdbKaXgTAmYb5HGaaqW6p1m+lSaornB
         C//y8fM51fp7jgMZBLvWJOV0YnhuFzZHaS636ywnnPZff6mH1IhCuTfaGkkBLMMCIYWE
         dp5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785945761; x=1786550561;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dDxVaJA0qLhUpRmzRVBWfrwvszjITp7kHu2WvQfbt0A=;
        b=kLQJOkjAo4V5Q2jfS3fIKz2DLMUOk53nDJKusCKgW9m+E55SRppfnWb01x2dopkS39
         IHwqswzf8clWz1tpJ6AjQjqibJiLVnF21U4Fcvoa57vEoXDOA8L2szVr3NGEQ78Hc5ED
         vCCExB05ctfQJ4QnAIpyKfCaJ6fespCcSjuC4h1lm9QXL3mdvycLr0gu2yH4penBgh22
         /uyQXRyImjBHpBvjd2xV0y9BQ3twJO5/0fKTMKa4xb9S2/guHNMadIfMX+7PzaoAR9fR
         JDDok8o/lkoOZYgHzPlijHWU4bhSGDe8G9oCV5DBRNrj4HPt0SadtnhYR9KQeQ59/AnF
         V01A==
X-Forwarded-Encrypted: i=1; AHgh+RqftshgyTfOHkpUXea3DSJ3mdPlRIEWM55bItoXvw1QMP2MTX+cpmDWPyBaavsV6rz9VqFLT/4a+u6h6wSt4asb@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1tjOwX+P8wrUtV7U1P6oApB2a8Apw269iLTIp9VQKji84D8bS
	VogvtObtIQ2NYWe/koffgbGN8/sJ7bsREBNNLVoO3xjNbB7oPLpgPa0XtQWXJzHeIKKKifYhCRN
	N6qPnbLJiU5uwaflwtuCxzDAgzCp0dEnTVIdnMftA
X-Gm-Gg: AR+sD13rhysZTf34FuSjsPE+OGiwylsgjy0reMy/nweQSjUZEkq2z2vVt/ZEyRJ7s8w
	bq+vekT3zhXIL3GXD4aaQrgnBDZo2b/guNc29CXL8eCv+bL1AM+36+E5W3wJpuzKWjm9UGA09A6
	63sVkmyvUDZq46CghwOa/7MvE9XsRZreUUdfz8/871azQXQ/WNOTYIvdlL/eme7WaM/Gn7LeCl/
	eYaKrK0eau0yWS97Dnk7BkNOM8Pv61CiyFbY2CElOwY3HjpRPXhdhxrx+ShrWHqNBAl1L1aMqml
	9F81pusmFNGjnYCTF2o00+pnBPuw79TSA1V+kxpTmrWEg6kYkkibXzPlQPqNiCyMgqUOBOh6OKT
	zwLIAFa3TKr3zozbYnWzBHTBRx4GlBUhRc1E=
X-Received: by 2002:a17:90a:dfcf:b0:38e:9045:babe with SMTP id
 98e67ed59e1d1-3903c5589ecmr8554536a91.7.1785945758439; Wed, 05 Aug 2026
 09:02:38 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Aug 2026 09:02:37 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Aug 2026 09:02:37 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260803134403.80630-25-steven.price@arm.com>
References: <20260803134403.80630-1-steven.price@arm.com> <20260803134403.80630-25-steven.price@arm.com>
MIME-Version: 1.0
Date: Wed, 5 Aug 2026 09:02:37 -0700
X-Gm-Features: AUfX_mzwYvzVqQkuKFkuAOMZ9a38FvddXqwH3nl4jjle1d5YB5Md9uRdePzF8HY
Message-ID: <CAEvNRgE5O4FcNQDHwh+DWsHH7gLs3qzm+L4ZQ9FHkt=WoTV2Hw@mail.gmail.com>
Subject: Re: [PATCH v16 24/45] KVM: arm64: Expose support for private memory
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_090241_925625_324D6027 
X-CRM114-Status: GOOD (  10.48  )
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

Steven Price <steven.price@arm.com> writes:

> Select KVM_GENERIC_MEMORY_ATTRIBUTES and provide the necessary support
> functions.
>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v14:
>  * Switch to guest_memfd in-place memory conversion and drop support
>    for KVM_VM_MEMORY_ATTRIBUTES.
>
> [...snip...]
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 15d42d1993bb..146c52f867c0 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -1510,6 +1510,8 @@ struct kvm *kvm_arch_alloc_vm(void);
>
>  #define vcpu_is_protected(vcpu)		kvm_vm_is_protected((vcpu)->kvm)
>
> +#define kvm_arch_has_private_mem(kvm) ((kvm)->arch.is_realm)
> +

Perhaps related to Fuad's question about pKVM and CCA state: would
conditioning this on is_realm mess up pKVM?

>  int kvm_arm_vcpu_finalize(struct kvm_vcpu *vcpu, int feature);
>  bool kvm_arm_vcpu_is_finalized(struct kvm_vcpu *vcpu);
>
> --
> 2.43.0

