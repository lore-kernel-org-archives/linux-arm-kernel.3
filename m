Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC7AC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 11:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fwc929VBWUs8HNtC2JsbnDBcC7Mzm1uBJraV+rwzoKc=; b=u4IoxZ2s44M3Gg6ZT6zghqUdr4
	o8cKt6SrqbZmVW90K++40d5wvagagEks7tjmODY/BXhK3/rd4hVlT+Q64gsvT3+t6iws28gXDs2d1
	gvHKllK7kvEV769s/FzZGpao7VyuWEKSlQ5RmV8R7zjnuHBxrstUGcrC5c23BbAwiRrWcr2YQI6w2
	dLDt5IZlCmrDOGHOqj/okFJx40hrUUeldySTZelFauJHo/Xcb0AUZwIg5JabvACr4Sr4dsgEdlBPu
	EcolPftEX9ByD0Ak/pjFusz5G/gtc3qdc2FaGqvhSUNkffGvvfz+toKSHRT277POOQjPgOARRGHL9
	JbtgFHvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJLI-00000002ZZ0-0x2t;
	Mon, 27 Jul 2026 11:17:56 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJLF-00000002ZX2-46L5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 11:17:55 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4957eefd361so19515455e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 04:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785151072; x=1785755872; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fwc929VBWUs8HNtC2JsbnDBcC7Mzm1uBJraV+rwzoKc=;
        b=SGVwcB9xjh+LYfJ+twzag1bqf18ZTvlOnNzzwgpPC2hZiRsuY9layXETRO82Zxtu4v
         fpysntN9O0agK03HU/tzlWRXTM71kXy7w6NEtOrnue9erORf215Kb7rkcq3H0nsf/Bc1
         QaTQ8iLYUPmomrGmgzoH8c7n8qV+vNcgRSm/r4zthJQIGz4CmAywopUyWqGDHq6e9btv
         uZn2kJpE5BZIrcdF5UQ0zK2wGkOyf9h3qh4RFmmfGPUUdykiu8zMcV7nm76+wyMddkn4
         rSdQPIWcT6S7BT8so/ClODpakOd0kThg+npoqyyx1cOcN0FOCbUOvF91Vtfhp9NUKDw1
         9xFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785151072; x=1785755872;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fwc929VBWUs8HNtC2JsbnDBcC7Mzm1uBJraV+rwzoKc=;
        b=D+enXqpZjKxOSly1WBtPzNwy6dQUX9TN5b/yoBeGF9ur8KQOQxPoHqOZP856tqQOR9
         iMOOu0gCb/880jnzAPTvhp2Ytr4+Ze/yoXuSrWXkvYItVv3SO5HlCRt+g58eNB74bqkd
         aIMO89Uwo++86TVR3g8BrUr+wq6GAW/z+VauCFWbghQxrvvE7s/vCegjbVg/xYy8rWpV
         Ej3jfBSwySXtVchO+Wjds9dzLfziuhH+UR+d0ZefLCvUPLVxmVPspFkADVj424Y7s303
         qUMakL5kypxLyX88UndYUihIKVLIqiT/9sge+xkHa8LMZd9QecJ6carqscaVkB7LpLPM
         EnSw==
X-Gm-Message-State: AOJu0YxJHHNOTj3vpxMYA01S6ZBIM0mLMwFsv4R1fGPXjCbKUgliT972
	PRENFTXX5nyOXkAp8xshP5RlHnxcfisSOAjxgXK121Lmp0KH7Snm5pE0/bCm+Q+lHwc=
X-Gm-Gg: AR+sD12QRN7PMuWSmPVCSZVU1eIWLTurGm6dg+NqcmXySBofIFC/EGfjHCj8lzid+yd
	0ctfIoTSG++eIdiGKBPh9XR1XOApx4y5zhtuBjNYZg3zLFUG2OKwnFpyRsUOaGOxCwF43SwZ9yo
	3Z766qWjQJm4JhEnhUGBJHoB5fPRBxliM4Hq+loO5RUSZpZudmTX48sCE/SQsj2TCwjoZGcjqom
	lVC1wIrpZe9uffjQPiXC86iaR6CT8tP2VR/uVJTm11ell7esluo9dKdhqWiSEnbOinEhe+nZmd5
	R86iye9mI2IKGnYOZt2FdfQqSSi77Un8gKHCj39ww0Z15xl9GoYpulIRM9/GGdwPEeba1i8Yp96
	qNaByYhxqcd+sBIWwDC1NyTg+fzofpaYhy1NXjHt0NRZ3JlBCmtHMMAKLBcrJ4bx5HTD1SspqUu
	j/4+ZPBg==
X-Received: by 2002:a05:600c:4ec6:b0:493:e6f7:ad75 with SMTP id 5b1f17b1804b1-496b73c6dc9mr98804395e9.11.1785151072036;
        Mon, 27 Jul 2026 04:17:52 -0700 (PDT)
Received: from [10.1.1.59] ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c67339sm50401481f8f.31.2026.07.27.04.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 04:17:51 -0700 (PDT)
Message-ID: <4fc5f291e62b62f3445e1c72f00a23b01e04dce4.camel@linaro.org>
Subject: Re: [PATCH 4/8] arm64: dts: exynos: Re-order clocks and align
 continued properties
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Ivaylo
 Ivanov	 <ivo.ivanov.ivanov1@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin	 <peter.griffin@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Sam Protsenko
 <semen.protsenko@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Krzysztof Kozlowski	 <krzk@kernel.org>, linux-fsd@tesla.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 27 Jul 2026 12:18:09 +0100
In-Reply-To: <20260726-b4-dts-coding-style-strict-v1-4-e9e3e9879d05@oss.qualcomm.com>
References: <20260726-b4-dts-coding-style-strict-v1-0-e9e3e9879d05@oss.qualcomm.com>
	 <20260726-b4-dts-coding-style-strict-v1-4-e9e3e9879d05@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_041754_018634_C0FDBE05 
X-CRM114-Status: UNSURE (   8.93  )
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

On Sun, 2026-07-26 at 19:43 +0200, Krzysztof Kozlowski wrote:
> Trivial white-space only changes to adjust to DTS coding style
> (clocks-names should follow clocks) and fix dt-check-style strict
> warnings like:
>=20
> =C2=A0 [property-order] property 'clocks' out of canonical order (should =
sort before 'clock-names')
> =C2=A0 [continuation-alignment] continuation should align to column 39 (u=
nder < or ")
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> =C2=A0arch/arm64/boot/dts/exynos/exynos5433.dtsi | 282 ++++++++++++++----=
-----------
> =C2=A01 file changed, 141 insertions(+), 141 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

