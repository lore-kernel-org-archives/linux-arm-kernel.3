Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63038E9B36F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 13:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fOLqAucbTxyFo2M2jPSZSgGxwMASNxx4SIjrfDPlm+Q=; b=AIQB1hp2XqvB3LHQJiMJ0tawJf
	w98tt9HqK7xpH2V5FLkFJ7ncotg+S+406WUvR0iWrSLvBoKpbYXrgFX3mIhQ33Hc2REYaT2KcN498
	TeFGejiFEKB1+i/t6Aox5L7TB3NybX8AbViyLSyERC8+/BQwMruzFUAU3ZXH5aeeNIZxN6CfInH6J
	EAbPz93bCCBHQtabK6fOFaXb5Z/nfzdIr50XswmDRblMlkrOBQvnKsB2xNRRP/SPZqRtiAxoFpBpc
	vi1nM0m7KCEk1BK9wT/EVZD1OGjZogZ4cPV4oidkiFsrVTHh1k0OXidB6hQ0PWgoWF+I86VPvMsUn
	PcxLEE0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2yu-0000000D3vT-0JFB;
	Mon, 02 Mar 2026 13:06:40 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2ys-0000000D3ux-09lX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 13:06:39 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-5033b64256dso987901cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 05:06:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772456796; cv=none;
        d=google.com; s=arc-20240605;
        b=dEeJYTR3oOoj8qCprvMwW0zxBlyj5dWvojL8xikGmNXyqNYJGgrTXv/PT0Y7IBQufE
         9qfiVkJ5GmvHplFs/ghxwHn+CYqyHuCpWNn0SAZdyhIc9UKtKK1EAqdLxZ/8v0LWgoVO
         Etf9HP9azzznK2DAwHJXh690wQCZP0Fw0L8/U5rfIPjeYwdtPkr47BYAe084u1QjFJAj
         TKzIrrF0LZf74lSJnYdY76XA8ogToGLkDR/YP/DG2VDuktFVbc6Iy/lKBrYq1SXTZe18
         wBXHHBcf8RHVRY7z+BitI6LBIM7fgUoZ6iy18sG8vi0qXS0PcjJNSc8ViacqzMhd8CLi
         kiRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fOLqAucbTxyFo2M2jPSZSgGxwMASNxx4SIjrfDPlm+Q=;
        fh=VFXcUrr3kGurp0SuF0YJGl5pPwUAd9HYetUbgSB3cYw=;
        b=MA6EEzd+attOwCBIwek/b7WCOidO+AAQcHDkiNV8Nhv/23VfIgGc3eYJdLfJl7hqW2
         wt3PF16zIh4J1IgP6cYx7Jz55j3/GdCnhSWiU3xKhHTYEjhNfgS7UM3WmFc5SUhYB64S
         T7IgLIrSijVaSl+VcX33GWxWTGiB2EYbnH+2CI6C32F3IIMIrbIx4apDc27jg0vNvLFN
         uONdcTZyUNA1AYyPGwH2o7+JUNkztf/oZI7k/4UUQB3Pkf56JChU6vlDbGXWuq5mzl2S
         x68rVHtGH8M+Dt+SQPWc0sXFBLh+Vi6i7RcJkC24Bl8HTLV987iQ3Dm3CpSgft/A0a/J
         1+qg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772456796; x=1773061596; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fOLqAucbTxyFo2M2jPSZSgGxwMASNxx4SIjrfDPlm+Q=;
        b=q8hn0VNLpvdANal22g9y0goI+2eiPGdsJS8WwgvAJhmrxkAAggoHqv7xdA1SKQBumx
         JzsySG8zWTWchao06/kbk2hz9Gu7DlcuJDJiotefo/mJUlBN6ONmfclZwkfhzqaCSIfA
         oDSMdLQPNgbJ2yqz73oTq1VZt1EWw/Zx6MnZ+GLiEL9flI3x3yCLQDZvI0eDAtw7pN8K
         /OYIq2jMTfAo5za+HiHJIFJGBCa+OLCWf7vwI61oGYv3vX/YSr4U/XLTtxwsN6pVFhk0
         YL9YCiHx4Yp/q6MwQWWaYnNvb34C8CUTvqtO8N8EKnfDZCG5ddh4zLOJYLvudiAAZvZ5
         Ce5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772456796; x=1773061596;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOLqAucbTxyFo2M2jPSZSgGxwMASNxx4SIjrfDPlm+Q=;
        b=p3UL4UoixpxQMImqVLSan8uqFFYaauVzr7/R6B2PwfH+FWpw/5w8JykRRb2A70jB3t
         iSKTDA1fzxUq1hFOudUisbB7LBPobGGpNVoP8QkNwP+sNIEUtU6awrRqbYGkvwXdc7nM
         6eIZKensYJo8VxSDG7VApfim+KpK2d0CQoK1aIay1BRzcHUWRcRbkin73mEBYvMDlaxq
         3H3KBwJ/Cx4I+CRdCx1e9mO1v+vWFniJZTJ3Tynqfn+Axj3kqqATtqh98EjqR1Gpuume
         8dBkilpQBN4UQlW7PzJP9qdJeVyO0AzBMwUZ3oG3uWqmtmvfKy06N46NlOlYMQd0zPxP
         3luA==
X-Gm-Message-State: AOJu0Yz/IkSVv2BXHISdDkb8ENGOA2MzPcSOuOhBl8rqOC7wr8jllvFa
	TwJwDiZrlSeKxfiuZxNpQZqExuq3hnHLT4AOsD2wFZhuSntrVWZI2xDFoCey8msaF1FGse8MrhS
	V8cmFKMMAUR0yt+yZ3bLeXIFyOsLuhyaSksVzU8nN
X-Gm-Gg: ATEYQzwwB/7ohZ5sMiJwDkPKPrNvjM7rfjkU/rIlN/HlfPd8K0EdyM8GWpAYms92prN
	c7Xk/YDT68hHHersRkXuoVDuyfyjJ4ukNsCY/LoFQPIjepLOF0P1pd/12Uu1OqzXxjMSfcePRK/
	gsaZ3kv5UH8J9lWWasHYKH2zT84nia0nd8I2XtV9vG2EvXpeSQSCtr9JDc4msvbW3wEa9OudcMp
	iZq9SRKFIvBmS256hm5qi2ZqSqx9Fl/LVqEc9BIgnRWyLHKLefLGrG1yrUca+uNGOMkyxsiMdQH
	o2H97ytc
X-Received: by 2002:ac8:5995:0:b0:4ff:cb72:7c03 with SMTP id
 d75a77b69052e-507617532dcmr20454061cf.3.1772456794178; Mon, 02 Mar 2026
 05:06:34 -0800 (PST)
MIME-Version: 1.0
References: <20260302115653.1517326-1-maz@kernel.org> <20260302115653.1517326-2-maz@kernel.org>
In-Reply-To: <20260302115653.1517326-2-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 2 Mar 2026 13:05:56 +0000
X-Gm-Features: AaiRm51GlBX_MdTsrU5yy6eWmhXvo8Y7KaIHzBtRUyZRbvOgDA3XLnU851PASag
Message-ID: <CA+EHjTwYhdjfmZxyW4yjfOaokNdVGkHB1h6Qb9O-4D_3f1a-Jw@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] arm64: Skip update of an idreg field affected by
 an override
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_050638_084940_B135C1F7 
X-CRM114-Status: GOOD (  18.21  )
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

Hi Marc,

On Mon, 2 Mar 2026 at 11:57, Marc Zyngier <maz@kernel.org> wrote:
>
> When computing the new value od an idreg that contains a field

nit: od->of

> affected by an override, do not update that particular field.
>
> The value computed at init-time must be kept as-is, as that's
> what the user has asked for, for better or worse.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


> ---
>  arch/arm64/kernel/cpufeature.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index c31f8e17732a3..28fc77443ccd3 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -1224,6 +1224,13 @@ static void update_cpu_ftr_reg(struct arm64_ftr_reg *reg, u64 new)
>                 s64 ftr_cur = arm64_ftr_value(ftrp, reg->sys_val);
>                 s64 ftr_new = arm64_ftr_value(ftrp, new);
>
> +               /*
> +                * Don't alter the initial value that has been forced
> +                * by an override.
> +                */
> +               if ((reg->override->mask & arm64_ftr_mask(ftrp)) == arm64_ftr_mask(ftrp))
> +                       continue;
> +
>                 if (ftr_cur == ftr_new)
>                         continue;
>                 /* Find a safe value */
> --
> 2.47.3
>

