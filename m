Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E061D35697
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 10:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JvMIIZbSd7GJ9fTBCuvSnMcKyzbKcHEdp97Gn+39oUI=; b=WDgZq6AdLivx9SNWj2bvI3zdJa
	2VgxpMDTvQK4T9atIoosqXEwM5wz7ciibKfYpDWECuqa/OQ0Xmv6a4gTrBUUheG1VZOiSEiNz+c+y
	lZGdsGc2VOpzjqW5CAQerHVSOsc4lUknr705r2h7J8NSDUEyX+ufYmVyMQi1GKw0OB7a/9F7wun/7
	jjBXrR84tr6xRqw6+b8VwoQxTCcuCxzG76t/344N9m98b9M8BaaxsrvLfM7Jeh4bvL0YgxkCZv5ib
	/r6HTkABmzGMn/7ZecaqmDRzbtVZI9uotLKXvM3sKJ2XQalBVLq8tQ7/BZ/T0lzOjYqyv11mT7dtS
	VpoEx/ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2n5-0000000FpgS-1wgJ;
	Wed, 28 Jan 2026 10:28:51 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2n2-0000000FpfY-1fgd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 10:28:49 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-5033b0b6eabso285631cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 02:28:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769596127; cv=none;
        d=google.com; s=arc-20240605;
        b=f59IW7zStVHHGo7K138j2W4jb6iuK8UI5c745ieGb0K6RkBRqQjjjqtrfTtASQK9Vo
         VnRvgyQFz6QFgySXhh4Hnm7g5MiIa7A1gHY12Jdvh4LSLJeUqlWsWzvdgoZ4qcWEa5qV
         qvis9EGF9OAZ3Cwe9T5PkbyHWVW4AtR5/iHdtry4m1FpTaQc0fruNzdcsczbRyiaqMdK
         BxwwK16dJKEbq8J4OD2r+HfOPpd5JEWZnFWzyb11aAkc91oQ4f0nuYJnQBOdQcoq8+DZ
         I6OSk4ytD+qaKTq89eKXewH8VdZGylA2ZmFQoLheDPmSrngliBkKDrJ/+a96hn6hIhbV
         v4/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JvMIIZbSd7GJ9fTBCuvSnMcKyzbKcHEdp97Gn+39oUI=;
        fh=LU/HxO/piyDhlILCnXb8ukPVr7QrktOmXrXWzzjNR8g=;
        b=N/DfdIp+BSVS/txyxfiCMg9JS2lNl/MqjcHrOORZqzo0YJ8EQd2ze55YguYe4+e5zL
         l+Qws248iT1JoyAgNRArw/60fDJyBCJ9XouokK2FXceh7C07lf6Y++5EQAoFWn7TZyeq
         w33NIbCtimyEoNxOszP4EoXay7rhTf9rGu4Gb46N/ULAw5qYgrvUnwQ7aeOhjHqp8ebx
         q2ZsGkhPBsqi449DeveHBv9wfzi8s3Kk0Qk0+yhDxL304f6x08U68k/HSqtwi9MyXOXZ
         WayyaP2mpKEANkNM6Jq3k9R7dDFxPmcDcWKLVASkEbcOgLSDtJXFA7XqZiKzGpmFHAY3
         PvpQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769596127; x=1770200927; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JvMIIZbSd7GJ9fTBCuvSnMcKyzbKcHEdp97Gn+39oUI=;
        b=fw4RoqRvrNXt/622UBWt7GhLR+xuC+P7bOz/gUQctYXQqYz5tGWpO2z+v+uNWJopUD
         fTs46DDqQhVy6CyPeuf1t0uSdNlJ1rIoXOYmi5zk2CwmuHyPnMeejy1X/BQ7wYjwHQdd
         /tXteTLYBbCdafpNxppnyPuFtHj2/i32F+Uv+97irFroxNDF5RxgP202VoNBR+9EG1Xr
         a8DiRF2/2VPVtRO9Z2fHzHYVabZViafI5jmkVklsLU5aTlh2oaa+I5rL5KyeWt1/1jMm
         aE2L8ikFKHhYullYzrCQYO07LxIxgNmFstDpsibMJPFjpLAAtxJRAmabI1937AgtHIXZ
         m93Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769596127; x=1770200927;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JvMIIZbSd7GJ9fTBCuvSnMcKyzbKcHEdp97Gn+39oUI=;
        b=EZAFUB96RVLco3aHEEJUfDe+Lg56Vmyh2lAlGoKXdNtzY4C9kMqveh2eDfemZHEcFU
         z3eHQTqJSN1RE4gZT6lyY5uqUmFbUeHp8T8X7E+U00NRpSy6sPo/w1RVmvTQuoCkWssl
         DnxjU5wAx2TrfwP6A9HkJY/EJVVGq6rl4RTq0gQjk9KuPrx7An+9I1tE0nvyjiVO/WZ7
         Qo4OQfaravCrMvTp40a3JZ/zNShNz34N7WcCNY/vQ6ljkfzP+5ST/UeE7lRP9SmFk9PY
         7JzIIM3UN2eLM62lzMthHdeH/Gl/uo6RgjjCtWbU13VGRWz2tFWE0+ww982fmk3DSs2B
         OUxg==
X-Forwarded-Encrypted: i=1; AJvYcCXLHbOTvDEy3/d2ungzgfwcBMq9R5nqSjhVKm6CxACCoubFleyAdS9856Xto8eyVaAG9WvJc5TstrynCvaMemFD@lists.infradead.org
X-Gm-Message-State: AOJu0YyIJKMmo45je302YXb3vuaqHCS8QLc5LrukvUmsirmLeuLKai1l
	gpDpLr9x0iXvTCWt1fWF1sqi6foYBZEg+mwycQ8o1TwXjAB00/8jXtAuR31fmJqTWI3kvqJwUqT
	lh++bpAf/xaof3HfD09kQWn8LGL/2WSN2YG42MOpR
X-Gm-Gg: AZuq6aJXWXxhDAFrRMqMKcjmPJYz4W/NOdiP87zMMJ0Gv4NrttlG46I7w8+c7uGjzmG
	Pcw93fLJPpGmc+OF3HWx9MM9WRymIeNZBqSQ5oV2O7BTJt90nqzuq5LL7SmHGBjE3lGGYREMqUR
	O4dXdd9aFbScl9044MAYnkDjar/A49zN9hgX8HBZHQT/iidNLq/Uw4pZ3qt7KaZ7uviMl47az0Y
	BUzivE6P6ZsWI0C/G31QRe1kwekCBswLb8hBHpqJ1kmMeBk3eREf3P8FFQSiv5426zERGFjLeVt
	slCbNPiBzL1pbHYQSwoDridULQ==
X-Received: by 2002:ac8:5743:0:b0:503:4bc:c925 with SMTP id
 d75a77b69052e-5032f4dbbc4mr19998971cf.13.1769596126531; Wed, 28 Jan 2026
 02:28:46 -0800 (PST)
MIME-Version: 1.0
References: <20260119124629.2563-1-will@kernel.org> <20260119124629.2563-23-will@kernel.org>
In-Reply-To: <20260119124629.2563-23-will@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 28 Jan 2026 10:28:09 +0000
X-Gm-Features: AZwV_Qjs-WnEBIs4c2hvuOliOYVNdOz8-aWQ2TuJZEGeO7jiPDjVSORPKTi82lk
Message-ID: <CA+EHjTzJ2=195bc4RwiOUY9Nt48fkHE8Oju6q0RwO76Eeq52aA@mail.gmail.com>
Subject: Re: [PATCH v2 22/35] KVM: arm64: Change 'pkvm_handle_t' to u16
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Quentin Perret <qperret@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_022848_480087_A6F424DD 
X-CRM114-Status: GOOD (  20.32  )
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

On Mon, 19 Jan 2026 at 12:48, Will Deacon <will@kernel.org> wrote:
>
> 'pkvm_handle_t' doesn't need to be a 32-bit type and subsequent patches
> will rely on it being no more than 16 bits so that it can be encoded
> into a pte annotation.
>
> Change 'pkvm_handle_t' to a u16 and add a compile-type check that the
> maximum handle fits into the reduced type.
>
> Signed-off-by: Will Deacon <will@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  arch/arm64/include/asm/kvm_host.h | 2 +-
>  arch/arm64/kvm/hyp/nvhe/pkvm.c    | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 3191d10a2622..60a5c87b0a17 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -247,7 +247,7 @@ struct kvm_smccc_features {
>         unsigned long vendor_hyp_bmap_2; /* Function numbers 64-127 */
>  };
>
> -typedef unsigned int pkvm_handle_t;
> +typedef u16 pkvm_handle_t;
>
>  struct kvm_protected_vm {
>         pkvm_handle_t handle;
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index 9f0997150cf5..c5772417372d 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -223,6 +223,7 @@ static struct pkvm_hyp_vm **vm_table;
>
>  void pkvm_hyp_vm_table_init(void *tbl)
>  {
> +       BUILD_BUG_ON((u64)HANDLE_OFFSET + KVM_MAX_PVMS > (pkvm_handle_t)-1);
>         WARN_ON(vm_table);
>         vm_table = tbl;
>  }
> --
> 2.52.0.457.g6b5491de43-goog
>

