Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FA0CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cbZwiukwDnHDrFq3wQYLcIHXlTy3luajkiLNTJ9nWiM=; b=4V8CVKq2XIWzqO4fmhtcrF6mQm
	/44ASlD9zbQI9H9VmQ+qZ+NpPfdZ6X+u2nTNclKTIJDT2L/RIj+zstCDWp1MPq13dYxEGLsBoXkIt
	2UPdjr5laaofjOALIo9KHtjOxumXoU1PVXm8EJZddAt1KtwlmUMlXH078rS1eWIJzTxxz4YiIIXiq
	BEDF7+UyJtfPDl2noUV10uRSu7FFJ7SdH+oZrZbiuSUi+MlxqLYOrCHKJRG/VseNL988jJDDNXtXC
	6L1je7BvxBNaKUMs/JoqyqhWYo4Tgju5Pda+tfVtYfOvzGTxW1QmFYb6oM5JIuOOI+LzZz76Vus8c
	Ta3bUiEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfNG-0000000135V-2YAk;
	Mon, 08 Sep 2025 17:09:50 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvbXd-0000000HEmc-0rEa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 13:04:18 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-336bbcebca9so32637271fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 06:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757336655; x=1757941455; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cbZwiukwDnHDrFq3wQYLcIHXlTy3luajkiLNTJ9nWiM=;
        b=LG9qxWmSGGga/p2DrPcLGK5KZUzdp7XSPre6pxyznhmVbJ9OvO2R+0OJv9retifgYp
         U8NSZ94sSl7WxMQFwamKhSE9d/zrBSvGeW2ORhsJSM3bQb2nIPBu5Pf9wu7P+Y7KIngv
         Xz5pksd+5lGQULkIxM12CGrauyeqFa1Ky7WKmzA5L2Iq98mUzyB4ntjAtU5b7s5lDLSj
         kixHO42UMivgrOfM0Zr6466fq/NpTc7/pPoEmHh2bkjwj+qWgGyc2Z94fXvurZGj2fpU
         NFhSnO5f1Ktn7aA8qCR4nuCx3GnJkb0y+Zp91qk9KKoh0aiClK+w17rIjxPMSiPb536r
         io4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757336655; x=1757941455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cbZwiukwDnHDrFq3wQYLcIHXlTy3luajkiLNTJ9nWiM=;
        b=m/ToEnEAbDMa8ExzKy+zXggpWFU/uD+gKJKMQwTKM2X2eE4QqqO61aZRamReOgD3mx
         X0/JQFLzvy4KEN1t/NWV+HtJ6IzbyvSI7bFX9g0Abk5FJg2sYmnvwPw2PuvRhQ5gJkxq
         O8/Nfjkob4NvfYvVcV+0hdVPXVuqx2gzGRn1++MgqzeoHtV5vbczN6CVq/Vur5+pcELZ
         4k2eh0aw4YLXE04w+sNNZBwTINzjF6+eKYc1WEXF7Rw0rBtaVvDwTyRbr5uuRodUirhA
         bIQPji+JGgj4F0HUvcNZ/6bxw/xr2xKVm5A29u2gmh5LHpuOjsttkKtMqkf+nLG5poCr
         wmHg==
X-Forwarded-Encrypted: i=1; AJvYcCUYA7M9NCkix0QNj0aI7sRHAjrSPGbUUYxSEWFnmblFs5g5Y6dfj6K571KvvMjBpRJSPgmYZJIRzPWRQ4j/51b/@lists.infradead.org
X-Gm-Message-State: AOJu0YzXX9HG0XikY+wEbcOciSu6qik249rEdJfl5qWk2+WoBIxIccfK
	clDQoD2yhbcckyhJ6axQKZ+2qiX90NGJPXGWdQrYgm2D9GNz/bedLUM4k/dOTxQ8mJ5K2aK2++o
	eZ7kzFEGmWCQwUr3U3KHL5MogATvqHUhlb15ImDCQ9Jc/pXNo8c/6
X-Gm-Gg: ASbGnctxn8esUKgnW1DY39c45nT8U8EEtD9NAUmZrxxndpv/3Ks7qJljFFFcwmQU4eK
	EYuZJw+Oz+BqvAi/0O3do3BALWe5nbHK5uPyNTlEvjdN7YwZ3O511IVQ6cS/2aBrLzztRhPeHVZ
	9+gJ+VT24eGZx1YxMoGap8APLTMuVQ2l9HogssXBOerydbVL+1i+HrD3w+KIowDyjekIrH5ReAx
	rfkYtI=
X-Google-Smtp-Source: AGHT+IGg4rogX0hb8M3wkRrCGyxcIS8n1x/nra5mMODdrlIDHhbHVFLHqNZGqHHGv1GU+9Sji/glMKNv4ydxz2WaN08=
X-Received: by 2002:a2e:a78a:0:b0:32c:a097:4140 with SMTP id
 38308e7fff4ca-33b485c2616mr21948241fa.0.1757336655209; Mon, 08 Sep 2025
 06:04:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250908113723.31559-1-ansuelsmth@gmail.com>
In-Reply-To: <20250908113723.31559-1-ansuelsmth@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 8 Sep 2025 15:04:04 +0200
X-Gm-Features: Ac12FXyaXKE0nskg1RjYMc8Puf3_DYZA9QjaZBlexnTSmjTh-Rk2P6swvJ94zgM
Message-ID: <CACRpkdYYYAeqZZg58-2De-gfJkovYxABssuRk4xrS5SAC5=YQg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: airoha: fix wrong MDIO function bitmaks
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_060417_454062_B3F4FECC 
X-CRM114-Status: GOOD (  13.67  )
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

On Mon, Sep 8, 2025 at 1:37=E2=80=AFPM Christian Marangi <ansuelsmth@gmail.=
com> wrote:

> With further testing with an attached Aeonsemi it was discovered that
> the pinctrl MDIO function applied the wrong bitmask. The error was
> probably caused by the confusing documentation related to these bits.
>
> Inspecting what the bootloader actually configure, the SGMII_MDIO_MODE
> is never actually set but instead it's set force enable to the 2 GPIO
> (gpio 1-2) for MDC and MDIO pin.
>
> Applying this configuration permits correct functionality of any
> externally attached PHY.
>
> Cc: stable@vger.kernel.org
> Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Patch applied, recorded Benjamins response as Acked-by.

Yours,
Linus Walleij

