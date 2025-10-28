Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92DE5CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 19:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:References:In-Reply-To:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=62vvDBBB/rOaWpDgtEM9Rt/abCOhovCwo7YMTy41U/A=; b=iwEfGQ1dXeLhJBJuSXPxz6E1hG
	9lS+79MxhwCx+hxSOm0hTS0xjaODnprNP74xZPoW9CG5WahEPpwdX5838thfve3F98xk3vhWQfn4H
	CBTsbow8mZ6Rtv7ljDzv0TVZI0AXh2ZSJRJHT0K6LN4cHCNdsVM94e6FcVGDhOKUAgaWh/aGyK5v1
	Z2LHhOmH6E/yeHdXHgBAIzY+fMACj/6pBnZYYr/36zEcJu41l6b54Rdmxls5Y5d/h/Lw8/oWCk2vB
	+6wMwh6qwo3VDv6pP/fEP86taVsreM6sYIHRrtviC9NqSnGHPOY0E7KT8UgmsdFKQN0rfIHTgNlQJ
	lQGbYa2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDpad-0000000GZ8u-3leM;
	Tue, 28 Oct 2025 19:42:43 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDpaa-0000000GZ8C-2cd7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 19:42:41 +0000
Received: by mail-ej1-x644.google.com with SMTP id a640c23a62f3a-b3e7cc84b82so1031245066b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 12:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761680559; x=1762285359; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=62vvDBBB/rOaWpDgtEM9Rt/abCOhovCwo7YMTy41U/A=;
        b=C/QCUoveBmwpmT4jWH1cV4Xgua6B4zEWONvmyN6hoO6VdWCCRTjNgOHkfmDiUQnNre
         L0ZtENtHu57JvrloITuXPDtc2GxEmXLFPslccr0R1obidIFH6LyQ/iZlHY01AAwARupL
         yyFiQuRIuobUQdbe+nQOx0rPcN5D7eSVf5daxdO9hptCCxoVQueld0Xtkpqe/SEYC5Gm
         /tUFKtdq2+h30dDvU91PwtcD4tGr0lYpfdSYPiIEtXldlH33yCxA6P5Bsf248cJFZLYW
         alg+3aLrTJzATjnw61MC+zPp7q8zdcBoZCr2hMDFV2eyRnIvkKy5729GcSJpe+t/gRMm
         19wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761680559; x=1762285359;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=62vvDBBB/rOaWpDgtEM9Rt/abCOhovCwo7YMTy41U/A=;
        b=uhzi/iJrSqKX5VMJTAnXCMSmd8go6b2Q2aylrdfldohLbjNCnaNKRXD1S/kWcrKTBe
         JO0Fek7y4F4ZiR3zaC9kQjFj9PHRx5v9ZbWJjO6XDBCv0myRVmooh5rCw5z+uRQQDYhl
         LPkNDVaOnxgwCfy769kDz4PszoRNpY5u+4wdiaWUV3nBNJxCD1Zs9d5hxqKCoWwZNI1D
         DKCuVGbgVhDx8Qn67AEJosl0dxkC0EoGtHaJnEySRjszV4LzIuiWc7ZesGWJUQcv7AZ7
         PFXiFRdljjWkuVD0Aw0nZ9KipYWbky4N6Y1tLkGLIitkujPlt6rUgnyEI2DLgAGrM28X
         KXKw==
X-Forwarded-Encrypted: i=1; AJvYcCXuQSgTntfy2aAhFZNGwFYinN5RyATRoSVt1i8Uetpj3psCYxxJxM5lZb4sWOeCTgEUhjyhrslZPONIzKScclOo@lists.infradead.org
X-Gm-Message-State: AOJu0Ywo1Df6LR+3F/3zAHmQHyVl5ryDwH8JcLCRm+Yp5NnxI/DLaPNB
	BA0REUj06UYH7ipZttXQyq4075z6VxtMrtiaUgqabNr9/A5aPTZeYe7wb1XOfD4Vwra5l0sSTtx
	6briox6eB7vp1+1ArOpHAJ3KqVJn5omI=
X-Gm-Gg: ASbGnct9erxvV6bxI+j56Fj0b4pvA4WI2vodE9cbIuYiM8Ea1c1sbKIW4YK5fT49yNM
	6IVypg4rnB5fFvF5iNpE9rDGBzb/PJx5zNhozqOx8jMJFsYi6Dmktz9czgZlOn8d+i5SHRuSXVD
	clWHeqINT/5H0QnbfyD4dehhdO3KpLz0Uug+iuJG0HNoJgfIjZ86HgNiR3dz5OrNOjLDfj9wpux
	RNgYrqYnOLf0aAMmJ8LXl25ajwNQfhhxAG3mDJbKjwy4ZXbkIy/JBmRrZs=
X-Google-Smtp-Source: AGHT+IGuyzMZMoSUBcdluhWJ8z2U2NKreqWEsNAWWKSsPdZyGxxSF7LB6m8ffRoMaRK71OGRlbTX0MthE+/GR0ExXdY=
X-Received: by 2002:a17:907:9448:b0:b6d:4cdd:e375 with SMTP id
 a640c23a62f3a-b703d2dac74mr22693866b.11.1761680558394; Tue, 28 Oct 2025
 12:42:38 -0700 (PDT)
Received: from 724652696919 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Oct 2025 12:42:36 -0700
Received: from 724652696919 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Oct 2025 12:42:35 -0700
Mime-Version: 1.0
In-Reply-To: <20251028-haste-amusing-78c28e834b5b@spud>
References: <20251028-haste-amusing-78c28e834b5b@spud>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 28 Oct 2025 12:42:36 -0700
X-Gm-Features: AWmQ_blTfxgti-krwDFdX4C-MNUtu-qJWXUIoxjGku4ymfFwik-GWE6bubjvmIA
Message-ID: <CALj3r0haeTdNt7=cMqRa0i3j29P8e2oQ-TzsgZfCCG6cB0q=3A@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add NineTripod
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Dragan Simic <dsimic@manjaro.org>, 
	Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_124240_692504_DA8135A4 
X-CRM114-Status: GOOD (  13.97  )
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

One more thing:
I sent the v4 series of patches.
v3 is now outdated, although [1/3] of the patches are the same as v4 (

https://lore.kernel.org/all/20251026150358.1078453-1-coiaprant@gmail.com/

Thanks :)

2025-10-28 19:35 (GMT+00:00), Conor Dooley <conor@kernel.org> said:
> On Sun, Oct 26, 2025 at 10:36:44PM +0800, Coia Prant wrote:
> Add NineTripod to the vendor prefixes.
>
> Signed-off-by: Coia Prant
> ---
> Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> 1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index f1d188200..37687737e 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1124,6 +1124,8 @@ patternProperties:
> description: National Instruments
> "^nicera,.*":
> description: Nippon Ceramic Co., Ltd.
> +  "^ninetripod,.*":
> Why ninetripod instead of 9tripod? That's what the company uses and in
> the marketing fluff for the boards.
> +    description: Shenzhen 9Tripod Innovation and Development CO., LTD.
> "^nintendo,.*":
> description: Nintendo
> "^nlt,.*":
> --
> 2.47.3
>

