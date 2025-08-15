Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81528CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 03:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b1bVscfxC4uFT/CEoA/bhRidOult40TJcVZcOy00MCI=; b=z0kS+9nVIeF0WWdy6b2ZXuTrrX
	LJKDEGu6d4VeBrxUbg1YC4n4eArRTVKjms7gSehrGJi2+k7VmiO7OeHABHr9m40rc9hFoL6Ts2M89
	MB7ZpTnlypC4wf2m3k4KVRjNDZIaOoWxWH6oqrbgB5MuxeCE9hn2SDCnRTcH5j66siN9e2eaQ4urZ
	5FPiBa8ITzYIX1oljULUHuNEF9pN/ZihF4FIgO1+OO2sus9weIvXCV43dQjevnMYx9BAfyWvree5b
	+TE+XIzzocMa4pUg7FRQTeI7GarUg7h0/9mZR1c/jMPaSv1DivHr1bQY1qn0e+3P7Hxih9T/ov4eO
	HJG4WP5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umlWl-00000001Lhc-0Xec;
	Fri, 15 Aug 2025 03:54:51 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umlLf-00000001K06-0Q8Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 03:43:24 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-55ce5287a47so1451705e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 20:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755229401; x=1755834201; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1bVscfxC4uFT/CEoA/bhRidOult40TJcVZcOy00MCI=;
        b=LPUwS4xPgo9KV8hRYUIFjC5BoxTkS8Iyt+CeMd+BJ4Ct+Bfqj/LG90o/N5ZOe6C3Am
         obL9rme7+s7kR9yr7wOvHC8jmDig/6yQ2RNXDNBopP9CPJaVYqLvghcQS6Rz/ZYhekmy
         AqvtqYWSRXda2aPOcsraz94SlUCXiARe1prUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755229401; x=1755834201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1bVscfxC4uFT/CEoA/bhRidOult40TJcVZcOy00MCI=;
        b=On+6m2cdA24+Kyg2xt352NuIMk2qoMDw3/1wZI6++I0hor4pstsxczCFDxQC9+QxRM
         Pu8DMiXAFJ33k6wdZ27P7RhmAlgpdHZi2lv5MyZwifM98s8GO26gPzhibEVK86NbY3jT
         nMdZS8tCW1AFCpP3jdHyZKW7naADHlzkyj0JJDnUnRpcTNFtRpHLfWc6sZ5XvhSx6NOP
         pavx0QRh2VPhRoc043f1doAOd/orsxTJKibup09eXVGDTnkkQn/6XsHPBq597V7eibrG
         XWJuwkbM5X5faPYrVvvBj2Yw59rG1Gz+PgGlPX4DxDaql+9hnyctfMn6G3sw4VyLOv2g
         LN3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXDRCllZVjGuSm9l65gFQuXLVX4FeFW2mCLyNx7MHOfvYagEIkbHXamxSAAvN7q2QTSQLD+Cas8ab10AVheQWRE@lists.infradead.org
X-Gm-Message-State: AOJu0YyNG3gIWZRobNmAoTmwPSFNq6wO+avz2BnR9D6gC633ng9uvCpV
	Pc2PuZihx0bQKPF6bhUqSR1R2MFrBU0+gPrbPAYjPlwX/hU1E0yMluLr9efru0UO0dcfb+DWojQ
	ePmgE/beNibYMgLyVGhbxB9deq46SZpZA32+/P0cg
X-Gm-Gg: ASbGncs2OOfse94Qu8IPN4Em6H+jqe5vx2whmSoC62yEsN6nIp0JVjmPrMyXqSlNGDj
	nuwXXAFIjH1bsywvibVVk3ZHe1LT6Suyz9XCgpaIkVQ2bewJD3/S6qyKyfKhHlKS9IldzE8k/4r
	eGSkXLHwAajo7I0SVvH9VwyKcUAAGr+/uHIzoPzPHsYGT/1TKHqsBZlEdheAAopALV/BK/9WZiQ
	ZKp7h5w9wBRiONDbMZDBlZqkv9oBmXN0pwN1g==
X-Google-Smtp-Source: AGHT+IEqCwdjtNotzKv7k6sNon11epPQ9Q7yaZt1pImrKpO8J5PSviVGiMjVATClFXgSR2SA/yoBT6p78Ov7Q+2gotM=
X-Received: by 2002:a05:6512:3e0d:b0:55b:84e7:e14a with SMTP id
 2adb3069b0e04-55ceeb42b0fmr131122e87.25.1755229401420; Thu, 14 Aug 2025
 20:43:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250805135447.149231-1-laura.nao@collabora.com> <20250805135447.149231-9-laura.nao@collabora.com>
In-Reply-To: <20250805135447.149231-9-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 15 Aug 2025 12:43:10 +0900
X-Gm-Features: Ac12FXzyZO_yczjiRVwJ_XiOUJ7K7LAiS8kN-QE11MKfkqUjTCK5j2sczcKt2tQ
Message-ID: <CAGXv+5FwV1YuBoefMAX1UvOd1=cg9Ld1ZawyNts1BR8YMezhKQ@mail.gmail.com>
Subject: Re: [PATCH v4 08/27] clk: mediatek: clk-mtk: Add MUX_DIV_GATE macro
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, guangjie.song@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com, =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_204323_144414_61643121 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
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

On Tue, Aug 5, 2025 at 10:55=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> On MT8196, some clocks use one register for parent selection and
> gating, and a separate register for frequency division. Since composite
> clocks can combine a mux, divider, and gate in a single entity, add a
> macro to simplify registration of such clocks by combining parent
> selection, frequency scaling, and enable control into one definition.
>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

