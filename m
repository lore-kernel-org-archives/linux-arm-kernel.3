Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEED4C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 10:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GaU7b11uch6HEVNCi/BIgaqFmQ/4amSpG/dObURRasQ=; b=WP+FTl5ZXrsXlXVlRaofruDeYG
	znkJ6p/4PJY94Q/Jm9tycbidFJCpaHrT8BmDljTv9oQpDc5wbhCYbLkBkekszGs7MEaGd8Qy9oM1k
	j9m7wAt/L3aCacU2sMUelpFF6JvySfnHWsaH2Gvd3tOwZJ8i4nidC5ejV2g64M3tZdR+OAdwhoi8Y
	3jmR8tfg+V07f+PAcs2rscgTWpHncv+BDTbKble+j8ivBxFH9bKrLqUTWLlHdeMRzT57bspEuwo4I
	ec0r1ooYrU77r18n+FesjaDQ1MQBoMpvxmEYVDGGu5Vgb16Fzr9MImNyhq60d8NEPjw80Sy94A037
	7zOyoPtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCyJB-00000000MEv-294l;
	Thu, 08 May 2025 10:16:53 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCyFY-00000000LrT-3gCl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 10:13:11 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-6f0c30a1cf8so14152886d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 03:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746699187; x=1747303987; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GaU7b11uch6HEVNCi/BIgaqFmQ/4amSpG/dObURRasQ=;
        b=P6LG8I1nzrSksfTI1YM/10FRiK8ONmjoe7D139o6u1OxQH024fSsHoMM+cCinj5src
         GZYQmTEhCs/roXkUEdg9HvHQ7kB4ip41XjO30yYtNQlRLU21Fb4c96++BpFPetBF+pJe
         6Fs6CT2EXhusUeDI38BvchiHF71QBYqT32Y442BIRYVhw/bkYNL7XArYaXecX57mrf+q
         gn/s3QMeOXz6lM8M1LDgFRK0as+wNZ36IsoqOc1X7Zoi/e6gAwya+L2v8a9cOWHpyjmR
         frc8lBVSEj3smXwGZO64WKom0rdFVJeGZWXKpIGPoNWjsPDxUPxYJ64aHruAumejf+of
         ps6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746699187; x=1747303987;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GaU7b11uch6HEVNCi/BIgaqFmQ/4amSpG/dObURRasQ=;
        b=Ir9osG7ki8MHXiNpKJ1SLPesEp79oPXPR5FHpKuX/vmajyQWQYY03dE9WAjN1ZuuqC
         7S5OypaRSllo9HcrlKK5/a9lpSAtaAJPQqsXG/MtakJwADRMMUrbT6m/Q44b/Xo1y3io
         HAJa3hETSyFc+p5EFv6arbpD5vW+qyW7y0K2jRaAuqPs79X0rM2VoLJOTFY4jrHzmAYF
         zOz9iFYrmpVTQFPXvg4ZiLdBZ9U8oeQbqK1DvHgGBn5VqwwLDy9m8zJm8fcvgh7l5tVZ
         buXVUZe1Nqq1z4IN/erNoGFni5IOYCnYxTZR8jjY99AzUkxCdI2MScm1t5GheMjqGJbT
         IX5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWVzGLhCN+3lBWjGj0uoydxp/eCGOviCHQ17LQujCDvHtRVyD82A/BxjthdcIdHYa9gD3WVNEERNGD0226RADbA@lists.infradead.org
X-Gm-Message-State: AOJu0YwFfEXDs/U68k/DeGLyTnHdLj4MY22GD4UjqUje5+pryvZGjGpp
	kv+IcUThWVLLMvx8bcZTP1SvdSssULh7SxVL7EiVDC8WCrRqYWzKFu25nnBPdUoQPetDfbdJ/Gh
	OUqk1LicuyKt5fyPV5bx1bZ1gmMU9RhlwTXY1NpTyWjyubYScGU0=
X-Gm-Gg: ASbGncv1LBdXFt0HrGhk9RV5+0sJv2X04+RL+8eWaHhW/eZA4p7tAAKAIeRnpA8Hdvc
	XfAWFmTs4PevpJpqzpNaiSCwRf6GMo8VwC1ICEAk2jvSEcNP8idHntE/+DU1kRnUgCSKjy9FIUf
	o+KKLLDl3zaHmRm4J1Sa5FsZ8=
X-Google-Smtp-Source: AGHT+IGHZuVXaUQ/u3XZJbuAZafur+n/lC9GK9G6Emz/GScjl53R/86ubfnNKLg/l/AxbJxOUCz0O2Jkui3OicdLBOk=
X-Received: by 2002:a05:6808:200a:b0:3f8:e55c:16ea with SMTP id
 5614622812f47-40378032892mr1579070b6e.24.1746699177190; Thu, 08 May 2025
 03:12:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250402233407.2452429-1-willmcvicker@google.com> <20250402233407.2452429-4-willmcvicker@google.com>
In-Reply-To: <20250402233407.2452429-4-willmcvicker@google.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 8 May 2025 11:12:46 +0100
X-Gm-Features: ATxdqUHvE3fzypmFP1S8IOQDU_RCSOzzbAgcVp5I5etYCYOISwNGGPhI-JRyTfE
Message-ID: <CADrjBPphh0DgdeFSAZ9WDNqUOE=C8XasoW_9Hq=p1Q8onZj+AQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] clocksource/drivers/exynos_mct: Set local timer
 interrupts as percpu
To: Will McVicker <willmcvicker@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan <saravanak@google.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Youngmin Nam <youngmin.nam@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_031308_918962_56062934 
X-CRM114-Status: GOOD (  10.46  )
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

On Thu, 3 Apr 2025 at 00:34, Will McVicker <willmcvicker@google.com> wrote:
>
> From: Hosung Kim <hosung0.kim@samsung.com>
>
> To allow the CPU to handle it's own clock events, we need to set the
> IRQF_PERCPU flag. This prevents the local timer interrupts from
> migrating to other CPUs.
>
> Signed-off-by: Hosung Kim <hosung0.kim@samsung.com>
> [Original commit from https://android.googlesource.com/kernel/gs/+/03267fad19f093bac979ca78309483e9eb3a8d16]
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

