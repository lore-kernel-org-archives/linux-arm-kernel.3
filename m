Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFFA9D5B16E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 13:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z14iaSBvakTbRSriw9RW3Psn7q2YVJ2taWiysxJXMkI=; b=xpS/rf3mPnvLXukVbSGPLFDiQa
	25/g4GtKGcVRvG+QVipilJkMghWe1iWyWAnVmr76Z9paFmI9fDSsx8hYLkOuKjuhZhFpjkMeZF3NN
	RZolz49dqpWV9R6e5Pg2mpXHRG4L4op9FgXzfmZCwg52y880rucb3ff7IKInHX7YO4oBYW2gUbLNp
	JF/m1U6U50BLMUwEU5tmV0XBW4rmBHy0VqC+twgOsjpQMv5I6RXlqqvag1jrpZQ6DSMnDx0VaDudo
	MTIKJYdACORl7D2LPM+uy3DWReRPOMgjoZeTDjzEfPsv72/I1lTd/D6gq2+3STJiZlgiuW9M3WKlN
	LFJbQpcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV8s9-00000003hbI-48Ld;
	Mon, 15 Dec 2025 13:44:22 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV8s6-00000003hZf-0ZcF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 13:44:19 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-4ee243b98caso1843611cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 05:44:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765806257; cv=none;
        d=google.com; s=arc-20240605;
        b=BcQgUzz0KRxyrjaMHKqLpCkc+OecJL6Chwck7j8o2UJKfeDn1h0q64Pig7GVGsvhL7
         lu/A04zPNK8ONvH/BpaUzqP+S/fID899d2d7q8srxTYEHRn2X45oJR6t43k19huoRkmT
         kGyNXzjuQgPRJeA4Hkzp0wRwGBBaG7jDqS3edynOWJ8RxsoEdohXkTaUAKAOJWx+fffe
         giAxypYZV85m9ibam8nimvNatXui/ld0mfWxvTYtQpCSycUjec93LJl+3f42K7hgF0OQ
         xVJ/9KdvRpysGsVP66ziT1HAFz+hDG8v0uomljuXmqWbIkg3Lyytv0aKp60npBswu8Bp
         1jMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=z14iaSBvakTbRSriw9RW3Psn7q2YVJ2taWiysxJXMkI=;
        fh=o5PbI5rsdKGbqSsCBaiJHTeLepiENa/SjKpAXoJUQhE=;
        b=fQbhCRDa7dK10x11ZMwDAA0rHvrUlnUhpNFk5tSdwkUw8QjZ/x8vnmF3iW3ED/8EeL
         EQe0XZgmj58gAQAUIZD4Iaa81b8Xde5V43AJRVeqVyS9/55jM0MWyDpKMm0O+EIAhpX/
         5E7HR0b3+n1rg1qLo/E1z8ARXFUCF8ewqjR2Z+yn/CsEhXLyMEpbt6QtQfyNVZfjMvse
         dULbkw5JbJUqZE8uq+7DzUm4h9GFIcFpT0PokKLDPx+sonaANuRYTACWjQZZLkCbrasA
         lMyjFgePqmqU3b8mu3vsyvqL8HPjr2VU5Vo7rreLgBYhiMEEIz0pgFrjwUp4Eht+9mI3
         OI8A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765806257; x=1766411057; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z14iaSBvakTbRSriw9RW3Psn7q2YVJ2taWiysxJXMkI=;
        b=iVWeaaaKFsZalzvlhazjTgdlhIO2MYRvJ6V7mlbQWkv86Ex98Hqxm4fIQ3F5T6S42b
         rbhsEX0P5ezSfZuW4OML0WMNjcZTKWfHQk2KeH4JLQi/qOffiKpRtxr4jV50ZujkGLmv
         gB/oLRmA8w9wUVnvYc+UFU3LwtsZrH8YzJ/6KeTRe8bJe17J4JPUuCiz8SGxYoIZ2TdS
         M1faG5lEmaFc/4Y6srYHf+X/pPYgpK0plVvHVwB+0+JsbeEppscYU7AXG8PGrhha7Mxu
         C5JlITeIqR3e6+2xurt0Fn6bqPq3RznNWwzT/mIMxlP3z9310FJ6zephQk84F43Fkyp7
         Lc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765806257; x=1766411057;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z14iaSBvakTbRSriw9RW3Psn7q2YVJ2taWiysxJXMkI=;
        b=r2cU9D5i550l3ytF4foNpu6/TLKmqysSz/T2pfmyl64gayg4w0GVS8mH/tn0bFn6TB
         NvMvO9KLenCl4gO43GNlKkzTLqbcFGb9JGUcJhBFfRWYRBCmug86DLbF8LYqq5Ef3i4R
         SbWJqJr6f7zVnH6qISBz32GgH/PubJk1fTv4wHd8dHKrUTKQq+sgT7eRPEyRCQvjjQKe
         pdOjn5ij60dx7q/1q9A90q9d8ezaCw+2RlcQu5UTdyLQXEU2ci0zCvSAJaYjGLKcMoFF
         P66ibUPaN95K3pDEYsyGufVOv6hGGomoVQrOsLgEnGonEO7p6wdaQVN0uBD+2fBeRPxx
         +h4w==
X-Forwarded-Encrypted: i=1; AJvYcCUe0xxg1sKaqAT6/1wATYZql1959ZDpwnYuqV0FRoRV9jqHFIVZG93jAFXVy8dC1v8ZOqc91IV++oI4rNIi24PU@lists.infradead.org
X-Gm-Message-State: AOJu0Yxphcrxd2Iywgo2DzBcpL3nh4JfPGyIUFGhQfqeuVmNdz0tPyp8
	3LHBNXPlQHFYhoIFER6+kL7ixH2BXZ8boq7re0bQhNjF7HPlqzqoJUskcem0/SLO5VKt8g8J/e9
	b/nliBL/8HCXV5JlxETLqNuNZW7ZCXj2epT587pXU
X-Gm-Gg: AY/fxX5H0+4R7OskMgdygSLiIMlE0J340WY+jiEo7gymNZEwELpVQsX+GXQCTMCTi5e
	sZwCZ/pYWkBj0agZetTJxxgVfUgmM5Enm4jkTj1Nu5gxVp+8Lal/hZD7MIfy8HkfWzwmEaBLUey
	AZ5wJU2TIhw43WroTdf9wldXPvbQ6D6LwRlRBf3W7lUcaUZPTMMX/KSPy+JDNT0aCQlYTynb3lF
	8niV2NN94D/9aD6+MUPqm/SgBdcgmzQWdzXj6lSOv/7y5420wdQ/NAFWj/Glx85DoRmz9ID
X-Google-Smtp-Source: AGHT+IG8mrjgb0PH7mXR+upNV1gkaIUUrVl2I1s9Je4zm7p3oJVmXi9AbHSsQyWlB8K3O5ElphjEKmXKH1yVjC7+JU8=
X-Received: by 2002:ac8:5f52:0:b0:4ed:ff77:1a86 with SMTP id
 d75a77b69052e-4f1dd5a7d3fmr21189951cf.18.1765806256280; Mon, 15 Dec 2025
 05:44:16 -0800 (PST)
MIME-Version: 1.0
References: <20251215114409.212512-1-alexandru.elisei@arm.com> <20251215114409.212512-4-alexandru.elisei@arm.com>
In-Reply-To: <20251215114409.212512-4-alexandru.elisei@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 15 Dec 2025 13:43:39 +0000
X-Gm-Features: AQt7F2oX_hM1FGOiORaSy7SZ-wHBNvacu3VXZu-02xL_kJfEZQ81XXFjfnewTlU
Message-ID: <CA+EHjTz2rZ1ebh8PP_f8DkJ=zqF_yjHQPgtQXxFjCsvifGD1bw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] KVM: arm64: Remove extra argument for __pvkm_host_{share,unshare}_hyp()
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, qperret@google.com, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_054418_182226_DDD0A0E7 
X-CRM114-Status: GOOD (  15.35  )
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

On Mon, 15 Dec 2025 at 11:44, Alexandru Elisei <alexandru.elisei@arm.com> wrote:
>
> __pvkm_host_share_hyp() and __pkvm_host_unshare_hyp() both have one
> parameter, the pfn, not two. Even though correctness isn't impacted because
> the SMCCC handlers pass the first argument and ignore the second one, let's
> call the functions with the proper number of arguments.
>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

>  arch/arm64/kvm/mmu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 48d7c372a4cd..124404eb208d 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -497,7 +497,7 @@ static int share_pfn_hyp(u64 pfn)
>         this->count = 1;
>         rb_link_node(&this->node, parent, node);
>         rb_insert_color(&this->node, &hyp_shared_pfns);
> -       ret = kvm_call_hyp_nvhe(__pkvm_host_share_hyp, pfn, 1);
> +       ret = kvm_call_hyp_nvhe(__pkvm_host_share_hyp, pfn);
>  unlock:
>         mutex_unlock(&hyp_shared_pfns_lock);
>
> @@ -523,7 +523,7 @@ static int unshare_pfn_hyp(u64 pfn)
>
>         rb_erase(&this->node, &hyp_shared_pfns);
>         kfree(this);
> -       ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_hyp, pfn, 1);
> +       ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_hyp, pfn);
>  unlock:
>         mutex_unlock(&hyp_shared_pfns_lock);
>
> --
> 2.52.0
>

