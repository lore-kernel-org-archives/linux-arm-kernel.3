Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77CA0E9B37D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 13:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NYsmRJcAcMIsFoGcScC1fEs53MfSGQkBZ/HqjJdD1do=; b=K3/l3su5SVH2gOTsbjKyRZv8/f
	tYQSC7ThTR5AHATjewmTGA2PgedQeOmBLqJHC2e/c8qCSN4NGeqtBJWIk4m6nMozkam7fPdZw3cVI
	dBEHXJQri3WL6Uq6QWHSv4mYa/II1RSdhud3aEOuLnOBqNYgWhaDSQWcX1M+jWW8HKfg4gL1eY+if
	r7IOj6Lm5SMpNffpYJMCBG+6IU11kj7CfDIFtdwu/eQrNGEfYuOFLdmDlLUqg8TMq2LzUmgMsRWqy
	MmnH5t6kYpATbQ7SDslIOqXtnccJHMPKDNT3iQMKqLD3pGGBAbWYhn+8H2DazAPwEKMrDBtsOGRDX
	SWMzcN/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3Wp-0000000D8rA-1t5z;
	Mon, 02 Mar 2026 13:41:43 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3Wn-0000000D8ql-0kMG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 13:41:42 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-505d3baf1a7so946901cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 05:41:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772458900; cv=none;
        d=google.com; s=arc-20240605;
        b=h7wSWzkQDxL6zTx6ZPlpYQqTKd0oc8diRkCSr+e7tHLqTfNgqnHAHLOUag3BTmP++Y
         wkdo4pUb1qCn2l3E04H0QIues/QpiAI8sJsz9k97jKp0HsaDJQ60nchsvGhhlD0rZ+US
         a3c6qjXtxTOISfNvV72dwI40ye1FfD4jNUAZEDow1UmvKag+T2Ki2uF331hwVwKoseF6
         NiCDCFa57wFnOufu/htOgCneupOnWq06EbA7pcA6VY1L48LAHYQCDeQOzHdo2pXdN5Vg
         +YTH+YW8FH8Ah2PqrZcPxMtSjpFgeGzWmf70B4HS/0GTwXmJQkCVWXs5SdYk7l2aWxtC
         J9Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NYsmRJcAcMIsFoGcScC1fEs53MfSGQkBZ/HqjJdD1do=;
        fh=VFXcUrr3kGurp0SuF0YJGl5pPwUAd9HYetUbgSB3cYw=;
        b=HWKxeJujLxnxaWuBi3jRPWQ1BeN8Wxg4oV335o2QzIrHvlp49x9mUHFgGAxgKrGzNN
         nv5R6qYNRyKny7dUSInj9dC7f71NfcOxs42R3iAal58w3VmXbWK3FYLmfioUeDNsThhs
         b/ysd1d1Q+CDjidrJI2b0ZNew9jGx9KQLsgLVVlbaM1unVm24lY7w2uwkv+MImwT4hwN
         ZlDVjpALexxuWcJv8ufswX1z9aenKaM0fRLM305xBoTV9NgHc4mv7zI5mG1VPl9EUAmX
         MymItqvSHkD5V7vXuDq9+r7MM8tVKhbE61oOvnVzX2YcuE/cjgMSL95zSgqEg3eAnBxj
         tPSw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772458900; x=1773063700; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NYsmRJcAcMIsFoGcScC1fEs53MfSGQkBZ/HqjJdD1do=;
        b=RPeTC15hl3px5loLOi90WkVBu9xwpv6wGk/lhp3LfNdUf/V9cpo09tBklGNhmNL5tb
         GI675FpZ3X1KX2cibQDqgmLUzxZHcU/j6ij7kBo4Buup0bLfO4HXqcJ9OwZxvGwpu+Ia
         D356LGBvVLeGnTLqPZ8vpFgRbDTbVrYzO9Mqz4e8Pn8evncl4rC1a/FOSSYxin1cgQz4
         KRAjU8T5N7ZH9Sg1QBFkxpOb4pPEHSAb4P3bSu8qU02e2SOIB2AvHUgFKpuoZgOPUe9X
         3Kw3ktfBGzk01fnZp3Se3AIGSq6NOuDUpeh6B5lxUYGCkPsX2DpIxdHqsVUPQWR7V1UB
         47Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772458900; x=1773063700;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYsmRJcAcMIsFoGcScC1fEs53MfSGQkBZ/HqjJdD1do=;
        b=LYjlPpho0Wa0r5425jO7EiEGG4MeeapK8xgLdFUKot5OA5IKQht5cumX3MGZGhryA2
         rQDLkFwhiiG7UIB5pEsgeFmz2pKqh9cvzNWux9iiY4giSzfO0RgUCDbRviDWj1DRE5q6
         9NqaeBNnjZ6sKFz0E775g2gDPZjLk9LlOPCf8FdFsuQ9zWx/Otkeh0FYInZzrFZrJo4q
         Ki+3FpMbHV9duhxBjPk/9bmdVxFNM6h3UAWSBYVFe6E8cGYYM3u77no5C3rbBrfOzO/F
         hFmxiemmClmdSW5Inp0YiEPyEbKepB6jnEa5JP6zjcNXG8bLBOQiAK2b34R+IBsZihcD
         ZXPw==
X-Gm-Message-State: AOJu0YwlFpX8HJAZeetw2li5AuoKeR36bD2BzsycJqRpAEZWhDq1XlGj
	E1Nx58gVq1ncxHesO+rR9xXXiFEf82ng5fbSGU2V0bnotKvlrRnScjzYgNU609gEhX/6Iq1X47f
	xAS9zn45H44U84j5YBvY6PHQY7wqcYjlx/JDMkdnb
X-Gm-Gg: ATEYQzyE0i+0jQ3usuTYhH3UBmhvrxoqSZ8mSNFFJtnI4uvKkIFgdrggu1Yosteu+27
	9L5J3FmdO8vLtgC36/wSXnZpECAw+Ic1QA7kxZkbMOqN5p9b0oLVI8p+x8cTzp82OdinUOAIsVQ
	TcwhiUaQJSOfovn6LJJNLC9Xzr5YdDxwMHgOZDUjYx2e3jrl7x0RDRqZLZo9d9pfniAsF9AS+r0
	vK2JyqSjvfPbpxnl1mZI9k1QatB63bjtp5oQWS4dbbymokkW/Q7OZe/iOGJMV7Ra494yBPcpks8
	OnmX4EIl
X-Received: by 2002:ac8:5746:0:b0:4ed:ff79:e679 with SMTP id
 d75a77b69052e-5076186e697mr19981111cf.19.1772458899149; Mon, 02 Mar 2026
 05:41:39 -0800 (PST)
MIME-Version: 1.0
References: <20260302115653.1517326-1-maz@kernel.org> <20260302115653.1517326-3-maz@kernel.org>
In-Reply-To: <20260302115653.1517326-3-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 2 Mar 2026 13:41:02 +0000
X-Gm-Features: AaiRm52IOKVuzwHscJ5ASw0VIGWLHTbRWdjOZ5cjYVQDzmb7A0iR2ZLSC-C0T3I
Message-ID: <CA+EHjTyjzHu-b+rnkj6ZkJjFABtT-pHcNvK9McNESpL41Y7ZKQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] arm64: Add a helper setting a feature field to
 its safe value
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_054141_222065_B2E744A9 
X-CRM114-Status: GOOD (  18.22  )
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

Hi Marc.

On Mon, 2 Mar 2026 at 11:57, Marc Zyngier <maz@kernel.org> wrote:
>
> In order to make the code more readable, add a simple helper
> setting a given field to its safe value, and update the only
> user so far. More will be added later.
>
> Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad



> ---
>  arch/arm64/kernel/cpufeature.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 28fc77443ccd3..102c5bac4d502 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -926,6 +926,11 @@ static u64 arm64_ftr_set_value(const struct arm64_ftr_bits *ftrp, s64 reg,
>         return reg;
>  }
>
> +static u64 arm64_ftr_set_safe_value(const struct arm64_ftr_bits *ftrp, s64 reg)
> +{
> +       return arm64_ftr_set_value(ftrp, reg, ftrp->safe_val);
> +}
> +
>  s64 arm64_ftr_safe_value(const struct arm64_ftr_bits *ftrp, s64 new,
>                                 s64 cur)
>  {
> @@ -1066,9 +1071,8 @@ static void init_cpu_ftr_reg(u32 sys_reg, u64 new)
>                 if (ftrp->visible)
>                         user_mask |= ftr_mask;
>                 else
> -                       reg->user_val = arm64_ftr_set_value(ftrp,
> -                                                           reg->user_val,
> -                                                           ftrp->safe_val);
> +                       reg->user_val = arm64_ftr_set_safe_value(ftrp,
> +                                                                reg->user_val);
>         }
>
>         val &= valid_mask;
> --
> 2.47.3
>

