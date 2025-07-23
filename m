Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA33C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 11:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ymp8NEpVvyDseXZYWN8c8ewcIRYFU5ldp7DE0o5dQsU=; b=boqfZz+lSDeqxQkiFuCAG8QPQy
	YB0od691ibxoCft9/fjykZvKFT1w69xtUtaOrBdRb8Fp8g+101KTvZY/rhI29Wcl7TVQDAwdZRshL
	gVYCdHFjeipVSdAKGVcqLk9dhFbqtICxQQGu77pxFE5kjy6g/oMfkurW9wg6HisJZxbzApFwchMCD
	Oo0ruykRRqpbnib2g0Q5LpZdgGGODT1FNUKeai4P4MRkIi+b0w+l3mrAcI2Q280tN26CnO3bOrkIc
	F6QPC/AlUNBwADjmPo3Nj5MpeCCmsiIw6truUQUUa+3mJyv4zAcEiFL2L8UoKlLA4uQMwxlSH16d9
	UwuamnKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueXp3-00000004pYV-1IXV;
	Wed, 23 Jul 2025 11:39:45 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueXmc-00000004pD7-0mEn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 11:37:15 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-710e344bbf9so62404747b3.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 04:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753270633; x=1753875433; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ymp8NEpVvyDseXZYWN8c8ewcIRYFU5ldp7DE0o5dQsU=;
        b=XZpfSJqzFmNL1dZ17ROjaV9D3dovJAl42hGsKCsXeYJTIn4Y2xHgOc30FN9/R0EFYM
         P5Q+gG3p5Vy0n7C/LMbAh/sZ21AZB0p4PcJVif9T64MePvpKboItVRxB6ruIBgDe/DAX
         JY77G85ZOELezPR8XeudYc6WmTzmtfrTAVwznjYN3TXdBh3ky/bTBHsY/p4Cj1HGp4FN
         k+sCw4C3k8yI+ADHrpTfiQj3zMEHrXHXMSRIZNJ7UmwRmxGJ/n/zdu266/0x2a5NezUD
         RJhR2fShdplP9HEbWkIIY3fJ2Cxe1cOM8wItTYpZyk3L2vL8DKc22TM8L5MvHCN1vfNz
         Gk4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753270633; x=1753875433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ymp8NEpVvyDseXZYWN8c8ewcIRYFU5ldp7DE0o5dQsU=;
        b=vmEHTzXMVfM9Re59dtH/MA2iWpH30MQR6w4cfZjNFNr7QDA8U2DFtXuHYogmq/Npv4
         s8/lrbcpaU2G+KPYFK2Yyytv9MCYhBDSuZw9GPZtyc5OcHX6rs/pCRpCUBYv4pfu9ME9
         R1IQ2IqZMRyhlhKqgFBUO6EywBrMgs/sBJVtE37meGuBstsKeNBuCbW6tnEQBwIROKU0
         dCv6tMbXqSbM1reVxzHtuFvOXj3Y7WWN4F2E+KEX8c3PZHafr5I7chrBdCvgynfJnSfR
         2LruxbvC5rPFV3o8lb7hj+8CYVILNrjQsYR5DKT683pZQsL7+NNeM25gtaaj/QaPt0uu
         JRiw==
X-Forwarded-Encrypted: i=1; AJvYcCXW4QcPeV7i97pMFQ88kzeVKqT8dgN2bliFk/NDgFB/AgnebYT07/woPyj40QpXnYtgT/V3dw8c7UBSl8APfsno@lists.infradead.org
X-Gm-Message-State: AOJu0YydeAi/P2b4iuO1vhLzQp3Ydn0vz3nNdUY7izUKCrQYxUHp8IyK
	Hmq15U5dSeuJy3rPNJs1ZA/tiwWzJ2zB1Ukgxx+GuSFtMkMXRzHkbcT7ESdptaIGhbgkSyzQVzQ
	Z3sopjIFJXMZvwgzqZB+IEW7ZDYy6LSiaGJjF9tokDQ==
X-Gm-Gg: ASbGnctJR8yY1fnVoHfsTUcJlEgBCMjPYIj2To1nUvo3w3JUfcmgigf7Ux5bdIF7JSs
	Y6T+zO26G6jVCRWiQxM0RrUDdC0/3f1jBvBNgQyLCdHdhxKsZAwmO5veU4+pzZd7xO8B3x2vG5v
	6DILHfvtePlGZwsPqT4PLtGlfGQHp5WU2R2No2XTRMOS71w6rb/qvVqEmaj2oS7oXjKZ2Mqgx59
	o6L0GQ=
X-Google-Smtp-Source: AGHT+IG1u0oo2KG/eqAPkei9S9jpNUr6q6/qerBp5U6HD3spcuvFuQv+r1pMepeUgbYOloTl+BtEStxyrYSqeymqSxI=
X-Received: by 2002:a05:690c:600d:b0:70c:a57c:94a3 with SMTP id
 00721157ae682-719b422713bmr31267587b3.19.1753270632818; Wed, 23 Jul 2025
 04:37:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250711094513.17073-1-ot_cathy.xu@mediatek.com>
In-Reply-To: <20250711094513.17073-1-ot_cathy.xu@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Jul 2025 13:36:57 +0200
X-Gm-Features: Ac12FXyQQsvM0KPvnjy5H8NAQhVs4FHmng7Wc1VHONXxXWNwFzyha3AMuITkSaw
Message-ID: <CACRpkdbe-0fQY7rF7u14bn4j_f3Qn7+thRzJQZRZBTadG9pjGQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] pinctrl: mediatek: Add pinctrl driver on mt8189
To: Cathy Xu <ot_cathy.xu@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
	Lei Xue <lei.xue@mediatek.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Yong Mao <yong.mao@mediatek.com>, Wenbin Mei <Wenbin.Mei@mediatek.com>, 
	Axe Yang <Axe.Yang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_043714_225537_00C7694B 
X-CRM114-Status: GOOD (  11.20  )
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

On Fri, Jul 11, 2025 at 11:45=E2=80=AFAM Cathy Xu <ot_cathy.xu@mediatek.com=
> wrote:

> This patch series introduces support for the MT8189 pinctrl driver,
> include the driver implementation, new binding document and pinctrl heade=
r file.

> Cathy Xu (3):

>   dt-bindings: pinctrl: mediatek: Add support for mt8189
(...)
>   pinctrl: mediatek: Add pinctrl driver on mt8189

Applied these patches, thanks for all your hard work and
patience!

>   arm64: dts: mediatek: mt8189: Add pinmux macro header file

Please funnel this through the mediatek SoC tree.

Yours,
Linus Walleij

