Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D015BC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tq0JAILQnrwUNJlWo2imokvsNwFjJTOC1cGqEdpzsok=; b=iy9q9wKq3NJTWMiI3zD7AhrxRW
	rTbWmmrlXgVtEGtN7YmcWwBSHDjCeC9Y9aIdIDyZkHoKFIrRyUCw4NA7SGe20A1NjQa/Sucff9ddG
	b1uyIFVMUVxHlxKP71jvflp7E7C4Deedbpc2lcYwDmNcIKx7Epc6v8TusSWkaDvzN0YLWJC8JvTQS
	U+jyyoM941lZndrEbKbHhNZ7dBiOD7qcLar+D/0uQu+Tv9qDLxvdddhtZCVz6MfeESF7dRG81/CcQ
	2bBNIZbBX2dUxEFi+a5KzdGG/4/STXUB1Dtw7lXTHqYvgawUfiVOC+Xq32P2LUBGRb8H00nzO35aI
	cCZDSNLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy2F-00000000NTy-04fH;
	Tue, 25 Feb 2025 16:43:55 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmwvq-000000005Fq-05bp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 15:33:15 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-30761be8fa7so53565951fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 07:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740497592; x=1741102392; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tq0JAILQnrwUNJlWo2imokvsNwFjJTOC1cGqEdpzsok=;
        b=nMRI1HrwhDIcqXAtOpnNizmMuD7wJLQhC8cBAK788bApcwjpJgYOCfPR9XhyOmInJP
         FNTAT7JRszs1UzaWS2hVxxdpqkIrJKw+PWa5/g2FoB+U9rMm5HjS8bleCsTvlZ7WLMwN
         jJpGN4s58WV7hj4lJvJP76PEaxpoBN5lndpryzrKRywAz4tgc4JJerlfoe9J/klrdev3
         cg8p7+g5OywhGVNxW0Pd9A/uHCd/kJARQm1xkn1FOaXDTwDiYWsrr0uBupuxihmjsdfr
         eOO3zSOaveIF3kwEixKNN9tm1n0PEiVxYTSeBF+dUOudInnWFYPcykNNxhMOKEc0qZ3h
         g/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740497592; x=1741102392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tq0JAILQnrwUNJlWo2imokvsNwFjJTOC1cGqEdpzsok=;
        b=ivVGYRb9Z3HE1sUvfV2cBbrwesyIuJjGwT+OmMSGFF+bWOh7IIAfeMY3Vq7HDkv84T
         qIyo0O4hjeJ9st1IwOCUCiemx8WcKddEf1dOQbqmlCNW0tLkAW/OlXWDNH7sDv71bh2p
         Wcl0uiUwPZAfnWpoVX6u8df9maHnQhFHUzaTK6Vb8pjJ+0U1sRDj4YU/oWmeS+G6E/0H
         CaTtbmkCCKr38u10eZezG5UHteGx5qQ+3UFCQGxdR38AXyev/cA6KQmv2pxsYK6Xz9hB
         kt3rlLDdpOzH8JP/FswDzie3hqCHsDV4kHPPUixGPVTSIVwpbbvDLPD77ZCO3/ed/QOk
         IbFg==
X-Forwarded-Encrypted: i=1; AJvYcCX8xvv4b6SLXY2ePJADD/09bTuGeY53ZwaB9UgFIGQ2waDzyzFkIvpNXolYU5IXee4b+Wsrb+IEOx0Jsl8tI+eI@lists.infradead.org
X-Gm-Message-State: AOJu0Yxf/orWHedXqX4Wx8zBY5iYnViysbVXe401GFz7ANkeYYDZ+JsM
	XVRJdpveg75VWsewh0Lzd4rJ50AKsvWvG5b/s/FBeLf3rFK5exHk8u0mVwJ6KUV5I80jQABEb7f
	Alfq36l8BWE84sqXuRCPi1iy7TUaASl5f/VD3Lw==
X-Gm-Gg: ASbGncsyGhT8swa6NjMeWBNaWKKku1lRGz4MTnYixyBsbd96vCs0hqpoo1kc/ThZ9hB
	snp0dZxQv3duN5yuZt2vHjTlrV9nl9fFsFbmKaKGNL4O4Pf2czivDFf6i1J2nVeQJ1WHNCb1+07
	kKuKV4T3Q=
X-Google-Smtp-Source: AGHT+IGObra9Tx3ZHxqC0tnEIpcJ9EtsRQQnnThFPr2iy8wxSLtweQx5fZAZ2r60/7qKj5zUv2tlIOi/SsAuuP89YE8=
X-Received: by 2002:a2e:9583:0:b0:302:1fce:3938 with SMTP id
 38308e7fff4ca-30b7915f78dmr51951fa.11.1740497592318; Tue, 25 Feb 2025
 07:33:12 -0800 (PST)
MIME-Version: 1.0
References: <20250221180349.1413089-1-vincenzo.frascino@arm.com> <20250221180349.1413089-3-vincenzo.frascino@arm.com>
In-Reply-To: <20250221180349.1413089-3-vincenzo.frascino@arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 16:33:00 +0100
X-Gm-Features: AWEUYZlmYF-dBAz6Af0Nh3BXuPzjG8T7cjYs05yRSwlUmuQ4nt6ckOluFYjoK9Q
Message-ID: <CACRpkdYR7zCOfRcbixPbtupLue-QsaCCh5WyX-fGBk5zMQ15NA@mail.gmail.com>
Subject: Re: [PATCH v7 02/10] dt-bindings: arm: Add Morello compatibility
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jessica Clarke <jrtc27@jrtc27.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_073314_057410_C4B4999E 
X-CRM114-Status: GOOD (  11.28  )
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

On Fri, Feb 21, 2025 at 7:04=E2=80=AFPM Vincenzo Frascino
<vincenzo.frascino@arm.com> wrote:

> Add compatibility to Arm Morello System Development Platform.
>
> Note: Morello is at the same time the name of an Architecture [1], an SoC
> [2] and a Board [2].
> To distinguish in between Architecture/SoC and Board we refer to the firs=
t
> as arm,morello and to the second as arm,morello-sdp.
>
> [1] https://developer.arm.com/Architectures/Morello
> [2] https://www.morello-project.org/
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

