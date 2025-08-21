Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A89CCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 15:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L7PbAw7tFxkqZThPb3yJ9U2UGY2pHnuSaci2IGV7yfc=; b=wDwrDLiqZz0gYPJZOE0LdAxNin
	Y1mojq2QDU2EOMbHThpdwlJqt4442LZfDpyyjfCD9N4pwEJhNrsoVC66gj/bbsShzk+MQ+EZi1eur
	TyEFbXePIRIuxV3ZKfPl4iNT8MN1bV3MhVahws6LI93N/TucQ+FKkEKf7XnEDlO2PRA8w2kGQYmZ1
	pSEIiICGkprR+qYasARU5gUWutdH8Qw0BkWMHuTPcWFJnJtSB5Iia+3QTWqm/LM/KHUPEZvJxUbe1
	i6FxV8ohpXGY8NdjPTrMcqNSCAE9a6ih/6pN4QdWMSJq5iIIis7P5SFszm430xdztOX8ESMVft28R
	V2pJkNag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7XJ-0000000HSOr-3z4K;
	Thu, 21 Aug 2025 15:49:10 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up3ri-0000000Gol2-10sj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 11:53:59 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-335360f9b6aso16795321fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 04:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755777236; x=1756382036; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L7PbAw7tFxkqZThPb3yJ9U2UGY2pHnuSaci2IGV7yfc=;
        b=m/C2IZTVjRqwYH++G4+yU2tM6Dj0aCPaDzwcxGDqqPcXMo1xK5eP0TXdfSAmkWEk/L
         BeNwqoYDLovOs2WjoG/rHQJyzGYt1QFF1kMXoinV1HqxQy3r+nc5saKbDsRYlfeULk10
         VpS+SyKjSUJLpFll+S+NBJv++AggwMy3CLTyYZyl1wwhq0i4qb55QopR/+5Ckq+vkupA
         V8crIx3A3NvZ7RiyIb+X0h4taNvHRzvLUYlTg+kzGBbPTesJc25LQ6UhfWpthGzMxBn9
         iTeayMjQNnTwFX3Vy2vkTJFJ5YUOaRK+6a1aFHorhTKl5tL8cBMPxx+WNV7Eh6awPKDl
         jpPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755777236; x=1756382036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L7PbAw7tFxkqZThPb3yJ9U2UGY2pHnuSaci2IGV7yfc=;
        b=SValqWw6kwhiFXfNqcoG3CT1z4ELiCVS2lkIrYaMbj9vpRyQCr2jYS5vp+6UMAy1wc
         EDzyyFybJ59ImKBeqO8bnX5F3pagYRqNKaFsSmf70HwutHY4zjeTI6TIHwlvHf1ceL85
         A3wYWypcy/tjthDkGEREHUySs/+7pIUTGp3tXrYIzP7u3Fiv49O3BOSriaZQoen0SNu5
         D70Hs0B3EMyP67r+ZaXlzkjg74bG5of6OLInVQtpMFBK2rQGXI/JMR89pOWeaoX1z5hS
         88DcLKn6PgDd1zEiXXJgOprlcABdcMAh9ZcIVgGTVG6ISLoEOHdNW1VGaoLfj5d1sgDn
         xnKg==
X-Forwarded-Encrypted: i=1; AJvYcCWntzAtShxMbhOLNLy50JSKYYpsgZtJGf3AjVn6LApG6/sj8fYQkcJcCo7VNEM/R92MWsWWQEBxjgwXtmaQP/c7@lists.infradead.org
X-Gm-Message-State: AOJu0YxyCtjDhllzYlTqEFggRNboCoErkrUg/KUDChIMmn/RWUevXy5b
	BERQemtpQNi6IpgTxOE0h8Cua13cBkQfEXWZdYQgjFATKFGMiy1da3qXJzXiLBs8b4PkV6Gb0LJ
	yk6vvmtjAnyAUu2E6ccJYYKQqFNZh1Hx6PQnuBG/4oA==
X-Gm-Gg: ASbGncsUupd+SaNBZ8meLU3S+IIOP58LiNa8se1a2b1EZiok9AeEG10VrP8Du9v+U6U
	2npQYBlC+q0A+npSFeKtHli6sp49ht2lGQBTJBMWlh0xDxp4VYfdq6bf5hi4HV3WkHOyfCxXd7w
	0U14PwAoXEnPv7zMKyEsMZNHmAy4leNavAbjDKlZl8napf2z6zYN5M42tUJvQ6vmtQOJvhExb1r
	bRGsag=
X-Google-Smtp-Source: AGHT+IFoewdvNuLwpOMDi7tPmb9FEQKLI5JEdERuyolhueuXHZ2+5KnKdkT/j3cc2QMbmt8jG7ipw7ObSBOoHSZHVLc=
X-Received: by 2002:a2e:a013:0:b0:332:2d5c:e171 with SMTP id
 38308e7fff4ca-3354a275fd8mr4061531fa.11.1755777236482; Thu, 21 Aug 2025
 04:53:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com> <20250820171302.324142-10-ariel.dalessandro@collabora.com>
In-Reply-To: <20250820171302.324142-10-ariel.dalessandro@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Aug 2025 13:53:45 +0200
X-Gm-Features: Ac12FXy1SuiUzS280qDRSJHcA_2jVr4y-FjGItB1ru8eWVK-JVnc9Ql5XGWxM9c
Message-ID: <CACRpkdbVqNpz2HiAz+_vFUkDy1TE6ZDxp6X2g9rRWAt4s=jRgw@mail.gmail.com>
Subject: Re: [PATCH v1 09/14] dt-bindings: pinctrl: mediatek,mt65xx-pinctrl:
 Allow gpio-line-names
To: "Ariel D'Alessandro" <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch, 
	andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com, 
	broonie@kernel.org, chunkuang.hu@kernel.org, ck.hu@mediatek.com, 
	conor+dt@kernel.org, davem@davemloft.net, dmitry.torokhov@gmail.com, 
	edumazet@google.com, flora.fu@mediatek.com, houlong.wei@mediatek.com, 
	jeesw@melfas.com, jmassot@collabora.com, kernel@collabora.com, 
	krzk+dt@kernel.org, kuba@kernel.org, 
	kyrie.wu@mediatek.corp-partner.google.com, lgirdwood@gmail.com, 
	louisalexis.eyraud@collabora.com, maarten.lankhorst@linux.intel.com, 
	matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com, 
	mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com, 
	robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch, 
	support.opensource@diasemi.com, tiffany.lin@mediatek.com, tzimmermann@suse.de, 
	yunfei.dong@mediatek.com, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-sound@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_045358_293482_8CCD303E 
X-CRM114-Status: UNSURE (   8.70  )
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

On Wed, Aug 20, 2025 at 7:16=E2=80=AFPM Ariel D'Alessandro
<ariel.dalessandro@collabora.com> wrote:

> Current, the DT bindings for MediaTek's MT65xx Pin controller is missing
> the gpio-line-names property, add it to the associated schema.
>
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

