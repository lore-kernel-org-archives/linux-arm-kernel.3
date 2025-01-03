Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61382E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 11:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3u4oGWBQKjEPREELrdTT/cBTk6tLIvMbyFiElHLVLk=; b=eaacJhS80zqMW3EmumAddaie5K
	gA+Trgs8Bd/b+djDsfqdOXI+h3PCGiZ0mkxmPUDU5TtJLlANMlnGqAFANKFcK2XuQPSn0ATKTJFxS
	YRJRLR1Oo4Zw7P7RjVuXGe/noTSzDr0Mq60IJGNulUJgeWKBtdg1Wqkt8ak22aXuQlVLPv198YQ8d
	hK3g3ZK13oGZJxdMotbsuEbniJTYpTjM3/JzHvzQdgZBBzT5qRBZCeMn9M4OMRiFCbQNrXpD9J8Yk
	CU/REYoqlpEpM3r6ivHvai9eVII1Lsh7lN4+uQzqr/F5X/5U8Jz7QtClU9n63Rx8UK0AI4Cy9qcyC
	jh3xzwkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTfPL-0000000CmaS-3CBT;
	Fri, 03 Jan 2025 10:59:59 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTfO8-0000000CmTX-1IRa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 10:58:46 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-436281c8a38so86995565e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jan 2025 02:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1735901922; x=1736506722; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h3u4oGWBQKjEPREELrdTT/cBTk6tLIvMbyFiElHLVLk=;
        b=yvv+Yvo7/O98vcGgDyN9gaRrFYfwdUsB7eJhF09Xvr8mKcNTlh3IJvofv7eqdRfQfF
         kLgzvpGn9iDeJPPIOEkOyAPj6HtVN6R/eW06DTcPdaVl9TTkzF34gZpzIorhc3txxLd5
         kHNaWoLrQYhv8ThwlcM+zs9csV+DJvdja/TujzVN1ejrdUCqo4CkQK38TvSi5t/EIzHX
         Uf2F/vPRiLIl48CedImnOT444VH+KomvRXMZzNC1si4SFbZnjCGKZ2FmgPAfDb1KM4Ko
         +KoD6ckkzLZVt3bI0hsujaX3E/pvStfzDIJTFDoxykIZH0EHM3AZ2snbuz8hV3vWy8Wt
         Pkdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735901922; x=1736506722;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h3u4oGWBQKjEPREELrdTT/cBTk6tLIvMbyFiElHLVLk=;
        b=fRDTtbwZnEgx++Eoz5qHPY5Hpij/Baw40pBdrkVAgBq/fvtpP0mHD8KzXSsNh1araU
         gaO34s7U8eX/3mmAGtoxxBsMq0ySMst/oF/r///iwoeXKp2JN+R2PF5rYr2xaPqqRf2Z
         sWs/Y1OObWi7qOeQ9CHU0XZsQkJWMDfJccnmfBxQL5gCXKKALnJe3aBaMTLGvNh1s68f
         BWMEUcEaZ1E9GTClya7CwjWWoQ+Df6fdPQtU0fUmn9Y2qXJmRTSQg8LFgM/TT9NZY380
         PMwdb9VAHlooJbMpzeKFb4fgCvaAfjS/fc8IJ8dWI4SNarQUtOe9eeTNaI4TjjSchHUx
         5oIw==
X-Forwarded-Encrypted: i=1; AJvYcCX6gBd2Ba9x2u6YT+/H2vLCnkR+eEGAI3XS7Ia90HrApNHsZuUtvqZQpXX4EN158YbqdPKehbctD3eSUNlhRrJM@lists.infradead.org
X-Gm-Message-State: AOJu0YwJg4BK4ufZMTM9QR7bTxgINYlghEKxT+h8PWL53GPGq6bFrPIR
	h1tSajgotp/IQh9hVR/d78ch4nzmT7RrCClNcEzA6nQEBWXQuhUKVZ2n2YXnl7I=
X-Gm-Gg: ASbGnctWFNosiwsXswbFQvG5Rq8sQ4qdebUStMQ2xPIhDLLUwAZQ5fMoqD36ZRbnRYp
	GXq/MmsK/FfGL9WMNl5shfHfCGna2sDDpWGR5ToXVzVbAWZKNB3O4zSSG0FgGKPHLZn3KbW6oYV
	DMZ3quDIVjiPk3198TEDz03CGlesOJ9jlOmYPWl5dFkl3yN1qY8bZDULrLlrEk5y75KUcUhDLUv
	UG80aVhJBgBH2xsqefPOzehYVKp6QWFrSNwn50ddizDEGeIVaxAsZKqKDP92JyrCA==
X-Google-Smtp-Source: AGHT+IFjtv32f9kYfRVKeyGYT0IEP5Qw+m/gGOhzKk2Cr8BmmZ9Jl41YENFOU1sjQfF0nAEj/HJdsw==
X-Received: by 2002:a05:6000:4703:b0:38a:69a9:af91 with SMTP id ffacd0b85a97d-38a69a9b0a9mr1730131f8f.13.1735901920712;
        Fri, 03 Jan 2025 02:58:40 -0800 (PST)
Received: from localhost ([2a01:cb19:95ba:5000:d6dd:417f:52ac:335b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a28f17315sm35078406f8f.108.2025.01.03.02.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 02:58:40 -0800 (PST)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Val Packett <val@packett.cool>
Cc: Val Packett <val@packett.cool>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Fabien Parent
 <fparent@baylibre.com>, Alexandre Mergnat <amergnat@baylibre.com>, Amjad
 Ouled-Ameur <aouledameur@baylibre.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/3] mt6779-keypad: fix compatibles and add to mt8516
In-Reply-To: <20241225192631.25017-1-val@packett.cool>
References: <20241225192631.25017-1-val@packett.cool>
Date: Fri, 03 Jan 2025 11:58:39 +0100
Message-ID: <87jzbcnoyo.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_025844_354014_59E965D3 
X-CRM114-Status: GOOD (  15.63  )
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

Hi Val,

Thank you for the patches.

On mer., d=C3=A9c. 25, 2024 at 16:26, Val Packett <val@packett.cool> wrote:

> The mt8516 patch was previously sent in another series but rejected due
> to not using an mt8516 specific compatible - which the other usages
> of this driver (mt8183 and mt8365) weren't doing either.
>
> It's only fair to add the SoC-specific compatibles to all of them then :)
>
> Val Packett (3):
>   dt-bindings: mediatek,mt6779-keypad: add more compatibles
>   arm64: dts: mediatek: add per-SoC compatibles for keypad nodes
>   arm64: dts: mediatek: mt8516: add keypad node

For the series,

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

>
>  .../bindings/input/mediatek,mt6779-keypad.yaml        |  3 +++
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi              |  3 ++-
>  arch/arm64/boot/dts/mediatek/mt8365.dtsi              |  3 ++-
>  arch/arm64/boot/dts/mediatek/mt8516.dtsi              | 11 +++++++++++
>  4 files changed, 18 insertions(+), 2 deletions(-)
>
> --=20
> 2.47.1

