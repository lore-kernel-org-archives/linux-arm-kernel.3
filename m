Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C53E65264
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Feb 2026 13:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JUlbKJ0tAnOBahwTWyLY7mbYAo1LF+unvBDF/GtAc0o=; b=ey28Hpu8uFKR6oHXyp83xqPlvK
	H+AkEyC/swNO9Gyomj2u9l8VX5MrnvtwEo02xeB4hWwAkxwZ0bA2K35FDwrAYOK7/bAQnHAPqdJEg
	ABaV6DgdPq4CVNJDjxUprsNNUsAkQFQyfYm0KuawRw9VOVR8QTYoI9NL0Wh2O1Mb71YmYkO7ydizD
	0PnPWV+FRS/JFT+WSdkxx+LuDR+vw7gpgXRr6whce24y2M15wBuSUNPfnDNVgSgbOfARIRhik+M/X
	j/EgcNEtn7qt0XVeCah0MqYS4X7CCANmN27V20+tdb4rfzvmX63PjZDCEml1n2gw5hT9vfFaHG95P
	ZzfDrgRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmXcn-00000003trI-2khj;
	Sun, 01 Feb 2026 13:36:25 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmXSg-00000003mF7-2Md2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Feb 2026 13:25:59 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-29f2676bb21so33215105ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Feb 2026 05:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769952357; x=1770557157; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JUlbKJ0tAnOBahwTWyLY7mbYAo1LF+unvBDF/GtAc0o=;
        b=Ff+7GyFhfzPlMHJY0d17Za8GEksj+jlLoEYHeDIItvyc8RTC+MWePk9LjFyEArvVhS
         Hl7TSrFBWce2oKMHAeyCTPFycs/3CykEj8uMkpJuQ+RrMtovvKic0Xe0m39GPQCaL4oM
         PDaOEUr92hEUajx3MQ3SBsI1ZJI5phaU5ib8EwFATwhaoHzrbTOUTjZw+O/VvFK3KU4u
         GjGn5tK3ALuxGKRvlhjIJarXN/Lct8f5sKhmgFiEyc2GplSY/SCnr6sZSoMeGNERYcVj
         ABdxjDO/b0queRMo5qwVMB2yJ5N2IAbPEyOsRNV38FNTw24bNMfBlLIZ8X+hX3TXE8Ij
         F8Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769952357; x=1770557157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JUlbKJ0tAnOBahwTWyLY7mbYAo1LF+unvBDF/GtAc0o=;
        b=iKSbFyML8RQB9TEojelFgthJ0o+CgtNWpfoMU57fBp0zp+X27Zjtyza1kq/DwSfjRj
         szd9IDDAffDneOmsWwLzZS0jbQSUZlwdMbq9xIvks2Ch6fp4/IIL7DB9r+bIZDyld69l
         AwXvEKWfgFepC26rDCth8rSXzoG3OmkJieAZnHes5rfS9/hYqw2W4Axp+1WToQr4dOxa
         MVAaoHxI128H/9JDEjt5KYsux3CQXyH34CDSp3DHSiSlWnq8r4zHpVx/HW3eUqyp7i1N
         zl2q2xDZgxFHaWIZ33ym5cSuhMLTSpzocHQArOuwvZhEG9XlXiJtieEXic6iP2Vh4/Hp
         LBFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWkgaECBTsoZ4OSmnS/zvYFH5RD/rZwbpl/mqFK7bcMk782Rw8jnlYa/V/jn7f7KZomyXBu/hW8qFHi+UGF3m5@lists.infradead.org
X-Gm-Message-State: AOJu0YxKrR3S3Be+gbZcd7r8IUMX+P+yjC+S4BLUg6dtXvSJSSA7GYNG
	RJisxkwzoYTRNXzefA+nd/tJSUi/BFcY9YpfuB13BXom3WkN/dkWKEIZ
X-Gm-Gg: AZuq6aJ/jlBXnsQeeqxsvPNvNVC2PsQxuYIFcDsfE6WfAyA7Db3xF+yf5CcOiZARSgp
	qZxO9X3eyceKIcL731hW6cIOelGTbLPRcvzQ5JPrF1pK5zwymJSDIZRcDHiuvvc5VMLikEoCfmD
	joI7vIM9VK5enXQR8aUbal2LoEzBBs2Wyh9fOhZtwjnZmD/Dj+YsPeEtgmk9oBWJth1kRvouPyj
	dZM06/Ue5y5mGJHsatvF9K+tGYyG6hFC3FgqdmBUqglyX+kaqNmpfcinO3+twwtXS48mrJsafU/
	UbYgF2Tl6NSMd+CLMhEIlcw1Ywq4z1qPrj1d0J+GiMX1ZJ8cc8AcnPcVhMrdTGMFNV7Z2aEH9gn
	23I1b5+5LJUIApybIH8ID0GS2uxdZLISdorCoLHSZrserVQBuwbFGMy02XhNhQg9tvE/5DKCpGT
	qc3pGOr6F+
X-Received: by 2002:a17:903:8cb:b0:2a9:db7:4467 with SMTP id d9443c01a7336-2a90db7462fmr9667595ad.6.1769952357498;
        Sun, 01 Feb 2026 05:25:57 -0800 (PST)
Received: from arch.localdomain ([2409:8a28:a52:d2b1::1004])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a8b47f4717sm108599565ad.18.2026.02.01.05.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 05:25:57 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: conor@kernel.org
Cc: alchark@gmail.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dsimic@manjaro.org,
	heiko@sntech.de,
	jerrysteve1101@gmail.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: arm: rockchip: Add OneThing Edge Cube series
Date: Sun,  1 Feb 2026 21:25:49 +0800
Message-ID: <20260201132549.66244-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131-acclaim-exciting-dff4e7af23a5@spud>
References: <20260131-acclaim-exciting-dff4e7af23a5@spud>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_052558_607193_B5C59621 
X-CRM114-Status: GOOD (  18.27  )
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

> > Add devicetree binding for the OneThing OEC and OEC-turbo
> >=20
> > The OneThing Edge Cube (OEC) series features the RK3566 SoC, 8GB
> > eMMC storage, and supports one SATA interface, one Gigabit Ethernet
> > port, and one USB 3.0 port.
> > Among the lineup, the standard OEC model comes with 2GB of RAM, while
> > the OEC-turbo features 4GB of RAM; The rest of the specifications are
> > identical.
> >=20
> > The OneThing Edge Cube series (shipping with the vendor firmware) is
> > originally designed as a PCDN (P2P Content Delivery Network) device.
> >=20
> > Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Docume=
> ntation/devicetree/bindings/arm/rockchip.yaml
> > index ae77ded9fe47..eeafe40e0f23 100644
> > --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> > +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> > @@ -813,6 +813,12 @@ properties:
> >            - const: openailab,eaidk-610
> >            - const: rockchip,rk3399
> > =20
> > +      - description: OneThing Edge Cube series
> > +        items:
> > +          - const: onething,oec
> > +          - const: onething,oec-turbo
> 
> This doesn't match your dts, so clearly you have not tested this
> sufficiently. oec and oec-turbo should be in an enum.
> pw-bot: changes-requested

Sorry for that. Following Dragan Simic's suggestion, I will merge 
these two board items into one in the V3 patch set.

> 
> > +          - const: rockchip,rk3566
> > +
> >        - description: Xunlong Orange Pi RK3399 board
> >          items:
> >            - const: xunlong,rk3399-orangepi
> > --=20
> > 2.52.0
> >=20



