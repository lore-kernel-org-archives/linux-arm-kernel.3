Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86416E77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 09:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:To:From:Subject:
	Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=cAfbM0Jbk/gjeLLcZ5ja/lJYA1YUlZW4eHX0QXqR1cs=; b=Dup+kDmspJkzfBcLBGcE7Tn5c4
	o2gHiUYTpVtBAHTjtwdu/aC6hFeo0J2bYIRS+K9p7b5BcU7DOwiKkXDq+hzCHw7lN6tpwrKfeOZsQ
	NSBi19LrH0ScCX7EkfQ7P1/BH5Ag6NH9XjCdYaGLG7PK12NU78RIFVXPexKSNJxI0x0AFKySYaTzy
	ZLNScOBZrTqnkbFeXKp+V0xySHjaszrtvzywV7RDMu5ZWa1vHv7L7aL1ZwpEV6RYKpJ3SENWvpWix
	b/FeykKQH4n3z10AwCqUyIupZ3+7hWrvx1T6kCEpQ/veAIIOFD//EmjKODQcJNXaGvrfnK5NPjP5Y
	6Nlapy2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUN1d-0000000Gc72-37cp;
	Sun, 05 Jan 2025 09:34:25 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUN0S-0000000Gc1c-3r0O;
	Sun, 05 Jan 2025 09:33:14 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5401bd6cdb7so13904914e87.2;
        Sun, 05 Jan 2025 01:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736069590; x=1736674390; darn=lists.infradead.org;
        h=in-reply-to:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cAfbM0Jbk/gjeLLcZ5ja/lJYA1YUlZW4eHX0QXqR1cs=;
        b=IYiQto6S/52UcvPegWYlvLpsMxOcMakopF0v7drFIJ4nl0DjfIRq2XxZKAvc1D4RSo
         uFvqPEuVM9jFcz6pb559szdDgSskz93YM69wQWKUPwBx2TZA6pmvvCpi+QP8p0+g6+4j
         zDx/s49FJ/fL3+XyZxrhgO87WGJMtrAkM+o0bf/CrrvI51CUqO66nEoNCNkb+tTM/Bsi
         dgcy4j70lN49EsT/7VulrZFiQkOJbp5ORbyHVfp8nHoWHS6ZGAQAHZj4sH/6q/D+HQdG
         PKzTV4TE6anoLP8Cyy6qm23OjO2vDpImKQt98RIjFhRjTnCjneqsX7c3Sn5PJMLfLuAX
         biGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736069590; x=1736674390;
        h=in-reply-to:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cAfbM0Jbk/gjeLLcZ5ja/lJYA1YUlZW4eHX0QXqR1cs=;
        b=RMA1UlHeZtEmAVA/Fc6njjnBGAB+uAVLGqWjLdn9vbk15x7tcyaGLr8Mm0Z7xcy8eA
         yvKpA1Qs1u2mpIEMLejRXgre8zqhxms3JHj4t3CDqFvH1bqFyDltX/vFLCoOcH8MsYzU
         eB+jvh+qdH0n1fMZc670ZD+glyxd2fpIep10XGaPCkuAB0CMm/mY0PW9tq32A2aKx5Ny
         XlAFpFIGDC0EBd8YsCzH10xebD24XbU6emvrFXyow87urw/sBV2zmsFrFupsJ0nZ/Rgc
         oxRrFu+esNhv0LWOFWBTXv8FzWXrGhx5sTWR7d1t/xQi/RmP9MOQLJm1M3erzJg8U39E
         0g1g==
X-Forwarded-Encrypted: i=1; AJvYcCUS6MO1Y7m9R5iCgiFIzg6XWrNZNxqx1O7s2qR981lt8hmpDyNxz+etyC+RtJaxKuxd/+pAHvkCINxpclprmBg=@lists.infradead.org, AJvYcCWGj4cGwNOjI//CXuxLVkcCcXX2/z1ZQSl9MSy+MIlaXZ2JMnXh9p6UOx85hprNI1lhUDvwCtclBYrjZamtVdyW@lists.infradead.org
X-Gm-Message-State: AOJu0YwanCUqPUVLEwxzRftP1Ia8fvKGPCcLrjaB3T8JCOc0ladYp7KE
	pqD/P1QwEGriyxdy/2u8uDkaefyAnGlC1XneerRlLigOe9kLHYo=
X-Gm-Gg: ASbGnct8C1crQdp7/QfcTVr+W6L++s9RwEzdK9IqEXIIfI4HCaQgceukyDuBg7dNgps
	lsctmGzFzfvkDPpxPtjiYUMjheGfI5sdKVuczlsAwN4gX0RNHlso3tffMWF/nZku1ZCIsD94kHv
	3ViULcfl9DBXqlOz7tkCOyGL8PlMWQcecEqAeulAHKICebx9Lx48+pfkjvPOQ8i5m8n4Z0rdGqD
	hbWPpkap/BYbjJHYEfPrAN99p/uBmQYAncgGjkMCA==
X-Google-Smtp-Source: AGHT+IGXrFQ3c/4Xujd3mtsXoH+NCwI31P0XPVu0rR/SPGx4mopJY4igEbtUZxPjkGCE52fgrLrTlQ==
X-Received: by 2002:a05:6512:3a90:b0:53e:3a73:6ddc with SMTP id 2adb3069b0e04-5422953c384mr17544794e87.33.1736069590126;
        Sun, 05 Jan 2025 01:33:10 -0800 (PST)
Received: from localhost ([2a0e:e6c0:20d3:2100::1d])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238136dfsm4692186e87.160.2025.01.05.01.33.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 01:33:09 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 05 Jan 2025 12:33:09 +0300
Message-Id: <D6U1B36JH3HU.WQ8GEL7M3HRW@gmail.com>
Cc: <conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <heiko@sntech.de>,
 <ivan8215145640@gmail.com>, <krzk+dt@kernel.org>,
 <krzysztof.kozlowski@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH v4 0/2] arm64: dts: rockchip: Add BigTreeTech CB2 and
 Pi2
From: "Ivan Sergeev" <ivan8215145640@gmail.com>
To: <robh@kernel.org>
X-Mailer: aerc 0.18.2
In-Reply-To: <173558214299.2262675.7745978856834508715.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_013312_970922_37268F73 
X-CRM114-Status: UNSURE (   8.99  )
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

Preparing a v5, fixed the phy-supply for usb nodes, but I have questions
for the other warnings.

> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: /i2c@fe5c0000/ns=
2009@48: failed to match any schema with compatible: ['ti,tsc2007']
> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: /i2c@fe5c0=
000/ns2009@48: failed to match any schema with compatible: ['ti,tsc2007']

Using `grep -r 'ti,tsc2007' Documentation` I can find a schema file for
that `compatible` value: Documentation/devicetree/bindings/input/touchscree=
n/tsc2007.txt
Is it an invalid value or not a proper schema?

> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: wireless-bluetoo=
th: uart1-gpios: {'rockchip,pins': [[2, 13, 0, 187]]} is not of type 'array=
'
> 	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: touch: touch-gpi=
o: {'rockchip,pins': [[0, 13, 0, 189], [0, 14, 0, 187]]} is not of type 'ar=
ray'
> 	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: wireless-b=
luetooth: uart1-gpios: {'rockchip,pins': [[2, 13, 0, 187]]} is not of type =
'array'
> 	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: touch: tou=
ch-gpio: {'rockchip,pins': [[0, 13, 0, 189], [0, 14, 0, 187]]} is not of ty=
pe 'array'
> 	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#

I don't understand how these nodes differ in structure dcompared to
other pinctrl nodes. Am I missing somethign taht is causing this
warning?

