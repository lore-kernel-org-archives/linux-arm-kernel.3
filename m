Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 603DED49205
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 09:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sCgDf9HmfpnPuFGw6HgxCSG4fFokGM5DQWc7VQ0OyAY=; b=NUbvP2eHwB6VZKOpk8wbBcqKt7
	90Fi/50DM1D8C+t6UR2NhmDDQs1DgSEDvg96HIoTYTAe2tnv4ncAjqilLusJPeI/3sR+jDN1ohSSf
	jXowh9iPkezoyXuX1Jt1U7vxPkng09hpct1LLzzCnIK3uMSoFOW32/6/eWwLK2Aa3FhJSCL3rkCxS
	XLGC1OYXLG+YrP/HambDob+sOPJXvZjzivgH1U4aAJeYKRxnC9+8295hemXhnt4V1J4CzlUJBJuxE
	QnuTHAbTQBagh86zWrzCJ7c2zNGdh2q9Nb8roFTVLQ3ci0u5ySY9mHVh/Ebtne34NT3nKxehq2uAa
	P1vrp4LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCyFy-00000008wsF-1yKq;
	Mon, 18 Nov 2024 09:41:18 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCyF3-00000008wjh-0ULx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 09:40:22 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-38231f84dccso1888015f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Nov 2024 01:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731922819; x=1732527619; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sCgDf9HmfpnPuFGw6HgxCSG4fFokGM5DQWc7VQ0OyAY=;
        b=UNrtI0p956xaMaybyWqZaboE9bWK6fKc/TEkV7Osywi+x4ltQXjIO7Da7CdtsLC/yi
         UWqO5kz4UtbTjReS9iU4rSU1e0V9T77PVMOdf/qx+Z2FMc9JXU7DJVqQI4cV9i3Bll0G
         vst5zbscm6qatXimSoZ4qUt70SVQQiHdpv7EroEDrLl0ttRxHzD4tvQFo2KR3L8njytC
         mB2t/CUcKPJKOy+GfYxz9vXRyx5JAYolyQwj2wamY5IKna2aKdVAMyzN9UGfzEHtzqkg
         gHqB5UVGkD4/16uzY0Msg/r+81GUVTzraVDkX3IoTm3e0tYEh/HKNidlfAcLW4ZvXh7V
         1Eug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731922819; x=1732527619;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sCgDf9HmfpnPuFGw6HgxCSG4fFokGM5DQWc7VQ0OyAY=;
        b=c7qh749K8H2jlEJxBzuFlpKzqotz1l9pKR4/yY769FWqHNi/fL+p0PRVwCCp5wdOnT
         WzqAEuRJGlSwgcjP6aDnqsk3wxTE/+GCkXoa6A2J4z7EV8KqQEOhLd5MpEzUcJYg0Tet
         EvJeWHrioL/Q6bTlijo0g0Wn23Vl3P6fw6yziO07jOHQhKW6naWjcfG4KflOnYirC9Cx
         RU7VHQngCG0G++KmqAO3zsf1psSWL1Yh3igPNgscV8EcDFITE9ilfHrDOBMVjq/07CW0
         fgAr6ix0NnQ2RQYFGK3375wKnv5yi9wRK460FW+zzpHrjn5+B5HfJYJaaMY2tmFk1d25
         rDYw==
X-Forwarded-Encrypted: i=1; AJvYcCWAR6Zf5w/oz+BgvzMlFXUG65YcsfsuDYHE1kUIG/WxodVbNSA02sEh0Lb2bbcU+ZowQ2anpmdpml23lQ4gSxaF@lists.infradead.org
X-Gm-Message-State: AOJu0Yxnx6IaydbbzVhkRtKsc+zEsaqUkjelINQsxaBStUOrkiuw5ZJI
	TMfOFceA5TdvM7IQmPO+uHBoGPfUtQXP19VZ/y/mb5Bdo2epG5bvn4424g5Vw0M=
X-Google-Smtp-Source: AGHT+IGHa7gc48NoS0q6ZGoDNAksIkFsU8teJxL7tX5AMyhsKg2Sq4IjQbIZKZWs65VOlUxgPKn/cw==
X-Received: by 2002:a05:6000:2c6:b0:374:c3e4:d6de with SMTP id ffacd0b85a97d-38225aa8607mr8472740f8f.41.1731922818924;
        Mon, 18 Nov 2024 01:40:18 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-382456ba017sm3220899f8f.97.2024.11.18.01.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 01:40:18 -0800 (PST)
Message-ID: <939800a57d356771b405de49bc198d33327b4fe8.camel@linaro.org>
Subject: Re: [PATCH] pinctrl: samsung: Fix irq handling if an error occurs
 in exynos_irq_demux_eint16_31()
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Krzysztof Kozlowski
 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
 <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org,  linux-samsung-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org
Date: Mon, 18 Nov 2024 09:40:17 +0000
In-Reply-To: <f148d823acfb3326a115bd49a0eed60f2345f909.1731844995.git.christophe.jaillet@wanadoo.fr>
References: <f148d823acfb3326a115bd49a0eed60f2345f909.1731844995.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_014021_159411_C2426AD2 
X-CRM114-Status: GOOD (  10.89  )
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

On Sun, 2024-11-17 at 13:03 +0100, Christophe JAILLET wrote:
> chained_irq_enter(() should be paired with a corresponding
> chained_irq_exit().
>=20
> Here, if clk_enable() fails, a early return occurs and chained_irq_exit()
> is not called.
>=20
> Add a new label and a goto for fix it.
>=20
> Fixes: f9c744747973 ("pinctrl: samsung: support a bus clock")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only.
>=20
> Review with care, irq handling is sometimes tricky...

Well spotted, thanks.

It looks like there is a similar problem in exynos_irq_request_resources()
in same file. It should likely call gpiochip_unlock_as_irq() if clk_enable(=
)
failed.

Care to fix that as well?

That said,

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>


Cheers,
Andre'


