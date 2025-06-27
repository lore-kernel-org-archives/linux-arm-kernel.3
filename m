Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E965C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 17:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9FA9bMKxVeb5yQVsUVm+jp/IZZQX6CQBPJL+CqLfVAg=; b=oJJqENf1EI+yVuWmm0PMkaeOmA
	Y3byrVptnhk6jbNos28zYmfUM53SjljokCiTl3qLo9ufP1kX3dB07hcZhgpPsg1XwTw8fC2WdAI/t
	EVYdiGbUZp7g8r0hpoSCTv0u599yfoQiu4FKlLn9fUSCuusAQ7M/uIZ0w9rzIX6boim+xJF58cOsc
	m3KIV2gsVrGI8EC85P8TUSrRDVn5Z26DflGqq49PGbJRDyJoRlXyBsXVY2waBUJ8fFuYV9rVJMvnX
	azldN3HeHGzwTyXuYkGsQdizAe6W1V4PyLVxsKmwRryZgfLFxz/gQxzRrsrqCwb1LCRkTz4xkM6dE
	7BEo5zUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVCwu-0000000FQ0O-3BCy;
	Fri, 27 Jun 2025 17:33:16 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBw2-0000000FGdL-0Hey
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 16:28:19 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-40af40aeef6so751510b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 09:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751041696; x=1751646496; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9FA9bMKxVeb5yQVsUVm+jp/IZZQX6CQBPJL+CqLfVAg=;
        b=kwq4RzYl3X+2EwL9Nly8rnuK2DMJ8FvGBctgselmr8uf8HDaOdVRCHUP/jMMU5F0Ts
         qLvW66LuXCW/IqLcjZmG4PdguoqOY7vA/+XdzyK5kojFvMf+uZGGJtsWtrKpU/gZH0DT
         mj1cYZYL5ERxcXRr7ZsDcSk1z5TpLM0Ef9DixSeCreuDA3mqZUWn6zg+dI31iWaHHUHh
         es43JvONFJVu4xxaWaDtnDwNS5OvSSKIUhKOmBDCCckWbAL1pZEARy7ZGF8vtubnXwVY
         gDzVRZEtA9o7dPs3NvisuCcGgfh7p0XsVsqgZ65BEEBMWr5yjRYHFxluoMoiHOr5JqBM
         mbjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751041696; x=1751646496;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9FA9bMKxVeb5yQVsUVm+jp/IZZQX6CQBPJL+CqLfVAg=;
        b=BilnrL19wpLY8xNW/K+LvMvqokAsQMAE79DDikXJik2/zs99NPW8DIh788YQs9xa/v
         r6K/PAlYmuqfby/RY5z7BgNJkKFXWljGmaZQclAEWBw31AqQMZ2fILDy0OY0L+C3Az1u
         rXZP3L48R6F8pOcQVWiiRh7tFO5BTzH7AIynW5ice0a512Te1zNh2tciHdHEG0U4xDK/
         0c/TlsKOxX1zLVEWyGoFJNrj2XN/fwo9jgyexsmrVz+prQJo2bZW3KFwNiYXcXtk9+3+
         KEaVOdKh/hAApPiza47CdZQXb/s2uPGCmHJsAnj2F4QLtexLzVklNrWV9+Iild+Qf8Qb
         d+3A==
X-Forwarded-Encrypted: i=1; AJvYcCVBvec7aGTu/Le5zvtP0xxv0+XbTe1QgHFpz2rppVBm84HdhNS5uuK09kLBz/W1a9AZVykoBYROtrbD8VunWLep@lists.infradead.org
X-Gm-Message-State: AOJu0Yw99iAlf6MHCoMFteyiXOcL26oF7zH/mFfQIBhdQbj2lcynJ5dy
	l6qPzI2HknRJEblZOKKLictekrXuzjn6u5ySmstdjEmARMCyfDbQZlST5nlVGNjPr1h7O9pR/aD
	BKVj7EAZB1q8fx2qg3Xt9W+QLnmtqEXUz2MqOKbZr0g==
X-Gm-Gg: ASbGncu6lItdFgXuGW47j4VlJUgSRKPDrAn2Jek4DgQTXW+XenkaKbw8jcEgo6kufka
	wlTXw+Ao1RSVHPaUzGqU5b8YplCFF8G1V148HfbemcuGc/ZxjF5qjJrWaJXmwSanFhfC/ihBk40
	e0aXT1prg3kqhE0lFN0/B5RVGurnJZg2rLPZAKRaMGSmrL
X-Google-Smtp-Source: AGHT+IHG27gv9karbj1NOogatAO2BrlEvYrLEtmFNeu9XKhGpRsgm/m1RTB+hY9Q08ptcJZaTLUxxE8Xd6aHQ2a8Oic=
X-Received: by 2002:a05:6871:588a:b0:2d9:45b7:8ffc with SMTP id
 586e51a60fabf-2efed430597mr2254424fac.3.1751041696545; Fri, 27 Jun 2025
 09:28:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250314-ufs-dma-coherent-v1-0-bdf9f9be2919@linaro.org> <20250314-ufs-dma-coherent-v1-1-bdf9f9be2919@linaro.org>
In-Reply-To: <20250314-ufs-dma-coherent-v1-1-bdf9f9be2919@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 27 Jun 2025 17:28:05 +0100
X-Gm-Features: Ac12FXykTIPEyZRenrTTVdLWukedtCGjmkjr6e-4BGSc71M9daw1mwCSL7G-obU
Message-ID: <CADrjBPqdr1NEd+W4ATJ-6Xi36y8Gi_=81LsFNtY_s2-pBPagFA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: exynos: gs101: ufs: add dma-coherent property
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
	Bart Van Assche <bvanassche@acm.org>, "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, 
	kernel-team@android.com, willmcvicker@google.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_092818_112761_7E7956B9 
X-CRM114-Status: GOOD (  11.31  )
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

Hi Krzysztof,

On Fri, 14 Mar 2025 at 15:38, Peter Griffin <peter.griffin@linaro.org> wrote:
>
> ufs-exynos driver configures the sysreg shareability as
> cacheable for gs101 so we need to set the dma-coherent
> property so the descriptors are also allocated cacheable.
>
> This fixes the UFS stability issues we have seen with
> the upstream UFS driver on gs101.
>
> Fixes: 4c65d7054b4c ("arm64: dts: exynos: gs101: Add ufs and ufs-phy dt nodes")
> Cc: stable@vger.kernel.org
> Suggested-by: Will McVicker <willmcvicker@google.com>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Friendly ping about this patch :)

Peter

