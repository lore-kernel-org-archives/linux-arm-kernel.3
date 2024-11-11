Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F1ED2E9C8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 09:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=16u+npe4MbHHsmpZ08MOYgrA6j2B46LPWEmoqUuH2IU=; b=VeTcZkR1O1GyyYeKvJvNf/GtZ6
	uGUzc8cfdFQ8xrYWmVMvmFoENq8cfY8W7Rzx9QzEzxaf9D5IH4wZTC/mOftp5a+6Pu8iIx0KyqMoD
	Zgi/SJvKWZF8jTzQtq3yBwSBc/bOCDk6yDiMT8i1pHnnc5YvQMzBH74NQPsv5WBJ7eRFQC0CQdgyY
	qUAcCO5U89NQ0vm19ittQFYihKofPAWP6cSriJ5j+r0/+xY4vGpPncHzYyleFRwk9qo1r+Bc/AQXq
	cjAo4sX4At+4Yvkf2u+vp0weUHLXJPG8KNJrn1SFn5oFEwzp9aByMvt6v1To6k3XKYTQP0idt9eUa
	yrinS9Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQiA-0000000H5qN-3Zsp;
	Mon, 11 Nov 2024 09:27:54 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQgN-0000000H5W4-0xw7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 09:26:04 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-71807863f0aso78879a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 01:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731317161; x=1731921961; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=16u+npe4MbHHsmpZ08MOYgrA6j2B46LPWEmoqUuH2IU=;
        b=gOjyytuy1WZKjHHIpYKlJquNeqhvuoBWZXL9Q5hF7Ohcl5KKxD/cNdksDzNRjOo59O
         CoSFPXf+3NpyzR9uFkAmoVcDS/wASPU4kcFudAsaKyQLFSmVUa2+ucVL+4R/GgGA3R17
         WvQgJIDyZkZ6/G6l3F1aT0M7qp5z7W/UvyeJAbZKg2NpJvGVWaJw9E94M2Ho9e9Hs1+Y
         EF5ou4KypVKiPFt2iUXA79P9Bvjatbr3VsiOgdsOsHcjdx2/i6JjyFyz0Z6iUCOATTFO
         6jCT0e//OeqOwgy0lQJwpHMQMSLrmSqIG+6EciTqKjBifLm/AHQH65AwIoyT3gSsf7up
         28cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731317161; x=1731921961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=16u+npe4MbHHsmpZ08MOYgrA6j2B46LPWEmoqUuH2IU=;
        b=PSBvVgSAjGMpKuoaWDdnNqCRCytOLM9Z9SneelWvt4HLtjdspzc4c2d3V0Cu3HYQLg
         cvtt8jh/Pf6j9xkUwuVKTjlpdEQqluzxGPEr7L5qhKHbglxKGFOBKW+JWhNvaS6vZ5Oc
         ANaIrgH/Q8ZNv8+bCw0/aIpo6MCFczVtoDoi1OZZUnnKOlny4GHGR/wsm0gRlL0S22wu
         MzZ00zre1LhgyJl9AjvNnBafEWPCI7et14UOFVj2YxwrcXN5alnoY9CrI+HQ6vQaQyAf
         +os5HEXC1Cfl936yOZS/lmD9fPeTzTGdy+T9gVlzbvFsL2r1TKnsmA/vlHTtOnNQaSfA
         NrOw==
X-Forwarded-Encrypted: i=1; AJvYcCW8iROlyOyDWhyxtq5fEe+OLOYXJDmEdcy+HWF17as+HvwlgwKncfyBBwpQZ/6nLug8dW1r8NVCNWtxfZatGk01@lists.infradead.org
X-Gm-Message-State: AOJu0YwLFlamQ+SKAWHwyACeXTYVZnbMEe8M1iPbD3qZet62KMvBJF/E
	3ALrj1hqCyOVZp9wB+F58b84ukzRfREWF4KtyWIUVbFw7QuXLhPpLiax3yB+Fs4mNVRdbKnB1YG
	lnNGNxSiQmpJwnOUyv7XydDHqFBtlpH+0DLe1rKKWpVJpiuHe3MoRSw==
X-Google-Smtp-Source: AGHT+IEbddWaWnCjkmvVli+HftqZUgfuRo1RHD4WnRBKP26ug1MHqgXnTsC6sGlZxqlzp2/8eme4zlIKL3HJtTUpKNM=
X-Received: by 2002:a05:6830:d87:b0:718:ffc:9445 with SMTP id
 46e09a7af769-71a1c1f11b8mr2581183a34.2.1731317160303; Mon, 11 Nov 2024
 01:26:00 -0800 (PST)
MIME-Version: 1.0
References: <20241021072626.15102-1-xiazhengqiao@huaqin.corp-partner.google.com>
In-Reply-To: <20241021072626.15102-1-xiazhengqiao@huaqin.corp-partner.google.com>
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Date: Mon, 11 Nov 2024 17:25:49 +0800
Message-ID: <CADYyEwQjDUALxi482d=KTY4Jt1zpbByPQXjF9YR4hu-3Qd-u0w@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND 0/4] arm64: dts: mediatek: Add MT8186 Chinchou
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	wenst@chromium.org, hsinyi@chromium.org, sean.wang@mediatek.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_012603_291781_24CA0609 
X-CRM114-Status: GOOD (  16.55  )
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

Hi all,

These patches have not been reviewed for more than two weeks. Please
review them.

thanks

Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
=E4=BA=8E2024=E5=B9=B410=E6=9C=8821=E6=97=A5=E5=91=A8=E4=B8=80 15:27=E5=86=
=99=E9=81=93=EF=BC=9A
>
> This is v3 of the MT8186 Chromebook device tree series to support
> MT8186 chinchou platform. It is based on the "corsola" design.
> It includes chinchou and chinchou360, including LTE, stylus,
> touchscreen combinations.
>
> Changes in v3:
> - Add a patch to change codec in pmic (in mt8186-corsola.dtsi) to audio-c=
odec
> - Link to v2: https://lore.kernel.org/all/20241018091135.17075-1-xiazheng=
qiao@huaqin.corp-partner.google.com/
>
> Changes in v2:
> - Modify location of "const: google,chinchou-sku17" in mediatek.yaml
> - rename "pin-report" to "pin-report-pins"
> - add "vcc33-supply" and "vcc33-supply"
> - rename "cbj-sleeve-gpio" to "cbj-sleeve-gpios"
> - modify subnode of sound
> - Link to v1: https://lore.kernel.org/all/172900161180.733089.89635437453=
85219831.robh@kernel.org/
>
> Zhengqiao Xia (4):
>   dt-bindings: arm: mediatek: Add MT8186 Chinchou Chromebook
>   arm64: dts: mediatek: Add MT8186 Chinchou Chromebooks
>   arm64: dts: mediatek: Add exton node for DP bridge
>   arm64: dts: mediatek: Modify audio codec name for pmic
>
>  .../devicetree/bindings/arm/mediatek.yaml     |  28 ++
>  arch/arm64/boot/dts/mediatek/Makefile         |   3 +
>  .../mediatek/mt8186-corsola-chinchou-sku0.dts |  18 +
>  .../mediatek/mt8186-corsola-chinchou-sku1.dts |  35 ++
>  .../mt8186-corsola-chinchou-sku16.dts         |  29 ++
>  .../dts/mediatek/mt8186-corsola-chinchou.dtsi | 321 ++++++++++++++++++
>  .../boot/dts/mediatek/mt8186-corsola.dtsi     |   8 +-
>  7 files changed, 441 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-=
sku0.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-=
sku1.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-=
sku16.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou.=
dtsi
>
> --
> 2.17.1
>

