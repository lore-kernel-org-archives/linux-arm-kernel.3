Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D612CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 15:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NTRZmz9b45Hl2bTm1apFpY/NlVi3bfWcm6ULUt78zN4=; b=Lji93SJv9Em3tEmKVMTBgABhtA
	1jf/f2m2F+KKDoOuBb8wBkeSBSN7CcgbOfUN7DZsBoxfopoW1Bv7rvQFFYBAnST+EGOvMIYx1HfxM
	yACb8qY/f1AOlggGd+ckIhonueWoh6uog2yHKyxS29XNlOMH2ST0ShKjoVKQ7rdQ+wJlsPQtujZpr
	bSF9c4UNdVp4Gpsf05yJVwQN11j3GLL99H6twLxyaQWnv8/a8f5IB6uizzlJIE5JQZWWCENtb0tEE
	V9E0b8l2sjKWsFyWO5lgIJjahIpljUlWzsEE9OXf2z1Ag1IrM3rtXlkOXodyvzVUkL4JP+QsyIrFs
	UmR3nHhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7Zu-0000000HStZ-3VtT;
	Thu, 21 Aug 2025 15:51:50 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up3uH-0000000GpDP-1IFb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 11:56:38 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-55ce510e769so867670e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 04:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755777395; x=1756382195; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTRZmz9b45Hl2bTm1apFpY/NlVi3bfWcm6ULUt78zN4=;
        b=VrdEX4nojzg7aWbNyZtHPhxuXwlLOSntx0x7p2kqX8MsKCskn8aRjuwT2255X/4xaU
         2LCDx9xaMVVLUI/GuWBXMy62WXXI4f+Sy+2BeRzBbH3Xv0P+lnUsJV/31YyJMlFGb/pg
         JPtx+b3jR/YoWUKiyHcg8KA7MdEVo+C/vzjvsSCTE2YaCuMjYSSW+YTOC+OKITOMhAid
         nay32UeivToOfW5r3txsjELr6u8rdhGpZ/O5V0QMBunYlHZLk73IzoiIUQq10RbvhXxg
         CM7/GWImCIy6yohwjewzB8V0jqBMswVMQB+5k7hbK5F1ttKyxsefW7aQ/ZTJH63k5bqb
         d8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755777396; x=1756382196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NTRZmz9b45Hl2bTm1apFpY/NlVi3bfWcm6ULUt78zN4=;
        b=sCsSj8YukA4ZtUYDJj9hiAUD59qRRIkmO/VQN1epk75u0Jb+sa+rsuabdU/53X5e8V
         mE1xVUJLHHLqCYEB+WJvHhbLGjfdKc9R9FJfnQoVTdg0Vmvw9dA/j0y9EaKwEmuhXO13
         4vRo0w7ZiYEAbyQIcx3LDggGLPbYxo/bYTY+eHG19tk9zO9NmfNaMHpIqf/8AkTsyxH0
         89Kwjf6PiOfNwFNjQDqLic9CUyAhZGOnv6ZZ65y+fszDrAZr08wDirgNW/XsuFLAuAtP
         44tyxPozp8uEn6OyF/E3sIvu2lBgYgG3gzzUb3uSm2nRfOCEzcMhpVOwPeA21Oj2RtCx
         Rwww==
X-Forwarded-Encrypted: i=1; AJvYcCVofHt8may4f43hecrKdyiVoe5xKiNBH1pK7JxbRgNiNRkYEVjQ8sCUA3ZbygLXz3aQmw4C4JiqE/NnPaRk+9xb@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3paLCf/EwAbGr7jdTB5xbncscXjRcEMxy4TI509Gz3Gb5DXnJ
	1igUKij11BRY17InVKKrdMxEam9u/eAPfrMz073kaXwOZ/Lq4PTOPjFr8nc+4GeZvIImt4041yL
	lAfBFE0MjrLq4jAzsurLsNKnrLLNRi1+CQbxAwW1pKQ==
X-Gm-Gg: ASbGncu5N6By14r5WsKALNOSUndc/eEvtuVWwRJA33vZUcnS+6K4BoYSCY1Us7HCG0V
	gHa7tuBEVbgMT9VUs4A0WGiH170o4cgZL+yfoLcvKhJypIFSsADhsLw4eK0xKAoSFC9inyyzPQ8
	zMlujr9LzJPBLyzjZgK9x6zhUBW2ukpYVhevd7RuOobBjcV/BGN/sKgJL+H4pXa1C7LCHtXOP4A
	9/VAto=
X-Google-Smtp-Source: AGHT+IHLNT7GNgIK+Yc1AUKtRsJ+Pu3qxvF99KQLgmBORucS0GzpXEZZoUCuuB+z9QVIQwaQ+MKKQAluSVZweFngFeU=
X-Received: by 2002:a05:651c:54a:b0:332:57b8:92eb with SMTP id
 38308e7fff4ca-33549e7e81dmr7293611fa.10.1755777395492; Thu, 21 Aug 2025
 04:56:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com> <20250820171302.324142-14-ariel.dalessandro@collabora.com>
In-Reply-To: <20250820171302.324142-14-ariel.dalessandro@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Aug 2025 13:56:24 +0200
X-Gm-Features: Ac12FXxjp4iK3cFyWU_S6p_GaEq9BIq8dd_UPbgZlXscJTvrfMnMiNgyqvjOGHs
Message-ID: <CACRpkdbpKqKyebADj0xPFq3g0biPh-vm4d6C3sd8r0URyfyYRg@mail.gmail.com>
Subject: Re: [PATCH v1 13/14] dt-bindings: input/touchscreen: Convert MELFAS
 MIP4 Touchscreen to YAML
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
X-CRM114-CacheID: sfid-20250821_045637_346604_0F403333 
X-CRM114-Status: UNSURE (   9.24  )
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

Hi Ariel,

thanks for your patch!

On Wed, Aug 20, 2025 at 7:17=E2=80=AFPM Ariel D'Alessandro
<ariel.dalessandro@collabora.com> wrote:

> +  ce-gpios:
> +    description: GPIO connected to the CE (chip enable) pin of the chip
> +    maxItems: 1

Mention that this should always have the flag GPIO_ACTIVE_HIGH
as this is required by the hardware.

Unfortunately we have no YAML syntax for enforcing flags :/

With that fix:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

