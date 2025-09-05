Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A587CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 05:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uyMA3OlxBR+8XDI4/fAiYBr3djQIzAJYAC/5TroND18=; b=XNiqgQI6BdKV6STk7L/TXjikh2
	P0vttUsvT/Q5ch2PeiowqT6v53QELZepK0hZLJ2MqM6+jdA9KqpAZxqnswqoXGpwGYi/Ie2j3Cnya
	nK1ckMbfULLnN5uqEBCAjT1Gxu+u4kQItkVQar0OikMsNhtpBayjC44T+kkRFgO/BzWFpVMxBJQYl
	UtKEs8pl5gNXB/3JPldsTlcGJCSNiT8n8cBbV0zmnj0o3E4KPWMLSJjogoBu2eSRtuhbAAG7IGm0K
	oT2dS9UjlAdAnHCoSKomhWpychc+DkKt6UaXAAVgYKjUisFxt/r4GzmTImHfpVigsEsa9anDytXHM
	Tm1XELEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuOgz-0000000Gtaq-2EQq;
	Fri, 05 Sep 2025 05:08:57 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuOeG-0000000Gsr0-2oEk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 05:06:09 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-333f918d71eso16481881fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 22:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757048767; x=1757653567; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uyMA3OlxBR+8XDI4/fAiYBr3djQIzAJYAC/5TroND18=;
        b=CHbw9B22nBW8RUBl7TedEn1IdNnM8PTUc6ZzEldycPKbgcsGlSUPx13LnXhg8cWv8T
         aQfBPTqz0LONIoEcoSaMpiROcufBev92f070kGclYysn8ItHbOD/U1uAJqK0ApUysQT+
         ANO+b+hrEkmf2rLmExwuKxiFvy1FY05iIazxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757048767; x=1757653567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uyMA3OlxBR+8XDI4/fAiYBr3djQIzAJYAC/5TroND18=;
        b=LC096I9zaBcGoJ5SLE2T03hd+a/AAJslod6JowEe8DgaGfX8pvxnn/mljQ2+VuCG5o
         gXWH0zpxXobUhJ8vB12//r5SDjC0n4s6bCXnc4k/Om1cxaK5pd2J+b/zMP3I2Un3JzF8
         wAq1A1iBz6P0zObwAbCk5/1nFHrtPMfv6rteOZHlkON5jwkb/jxVNe1Oew8ShJjg/2Aj
         xNV7gXV7Hq59ncYxnkTWZtL3hGybUya2TF1Q6HFkLks1NSmOLY2jR0MinUcGzC6lQeFA
         YoBT4HJOntitFudAjR9xv2LJMdw5L/Tuo9X9/aNkT2G+ot2OYivKNCAMaCKwiZhHJ2QS
         DCGg==
X-Forwarded-Encrypted: i=1; AJvYcCXX7Yq6OlwA2b9G3Ps9ruV/vaaFKpexC8cmrTLZ/75yhPhzazKWvFfllcUi5tjIRnCdXRQZZBhHtNiqicPhq7iY@lists.infradead.org
X-Gm-Message-State: AOJu0YzAZ0OtQKIaw4C2ArqnZCaawjr2Tl65X8mBo5wRCabp5h4N3Rt1
	mBETdDdKupMdhPmaLLi0aHNSCtpm08WEB+ECJ1uHLzeAckHvymAFy0T42HJVctqOdsMuJpxKYPl
	FoiVgJO0/b8evhlUK4CuDarjYWsZeljxLcW6SlTtc
X-Gm-Gg: ASbGnct6zhaT9LRYny3emoJQXNN+jWrNO59ABywvDwg0CAArylTtm1QJdhOWjvma8ma
	WYxKRD2RgIPkkzsZVRtX2RC1xa/6W57Dpy4BGl0JRikO0lIYFZOYQtiDjvEtgIUb2LCIoEhZhNZ
	Y/MLBzsRsTLzqskpJ0Zabt5j/Z/TWNDus+UM43/oFWsLoWSI6gimuKDiHRO6LnyRaUO3QWFF+QJ
	nyoECPoHudrp0WABcc/gOdbpQ3vgHZGdnI90w==
X-Google-Smtp-Source: AGHT+IHJjUpnhP9a9BCpvVLpzZvdmFRUDDu4oemMG1IXcZXVXfUhtp9wpdL0LzSmbU5jtUN4x+9LhikiWu80XNjJGfk=
X-Received: by 2002:a05:651c:2109:b0:336:d879:140f with SMTP id
 38308e7fff4ca-336d87916c1mr56567881fa.21.1757048766845; Thu, 04 Sep 2025
 22:06:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250829091913.131528-1-laura.nao@collabora.com> <20250829091913.131528-15-laura.nao@collabora.com>
In-Reply-To: <20250829091913.131528-15-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 5 Sep 2025 13:05:55 +0800
X-Gm-Features: Ac12FXzUw4mCbky5MPiHj8W2ByhD9sAje7rRwu3IY62BkDBlMB6KCGdwR2WWCfw
Message-ID: <CAGXv+5Fj9Hwmk2y_bZhGX0EUEY42tm3t0nTrjtV-sYhD_B-xVg@mail.gmail.com>
Subject: Re: [PATCH v5 14/27] clk: mediatek: Add MT8196 peripheral clock support
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, guangjie.song@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_220608_712740_FA85050A 
X-CRM114-Status: GOOD (  11.09  )
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

On Fri, Aug 29, 2025 at 5:21=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> Add support for the MT8196 peripheral clock controller, which provides
> clock gate control for dma/flashif/msdc/pwm/spi/uart.
>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Not sure why CLK_OPS_PARENT_ENABLE was removed, but it does seem like the
right thing to do, since this block is always on and doesn't require a
clock to be enabled before accessing the registers.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org> # CLK_OPS_PARENT_ENABLE chan=
ge

Note that I did not go through the bit definitions. I assume the other
Collabora folks did a good job of reviewing those.

