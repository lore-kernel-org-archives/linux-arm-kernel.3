Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D6CE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 15:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KZ/s86xLkYT+SehY6xTa0g1XsTpi9QTPMcjn8c8nw7Q=; b=InzqHUq2VWwCEV5HYVLJv5X8YJ
	W2APhsP38xTK+0xHrwuG09t756xhOCdE1xrHaQsXBH3xwROnyx+8e5gMDc9rEyIyTLUlcaHWw8rtQ
	EYIl+UCjd7KPIh1yms6nUHQ1KZZ5hixyD1f8RBdfwRmAIlP84gRloyFpKdn4esZ23Y1nIJ/SdDdAD
	CM/Zl6kg3ali8pT4zv9mR6fP6wvWOQ9jC0RSWa6Mdyg+OL8D0cGXuxgbzR7I9swdkbv7AfSLnW2vX
	7/Q1F2tuCwdsM2JpOMux9Mgh9xxWSS4qU56FNOIwSxncz7MBP1u/RSzFV7l6aPng3cKPdnn1D26yk
	nqBPUlzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuE3-0000000CPzr-1tJm;
	Thu, 09 Jan 2025 15:13:35 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuCp-0000000CPgg-1Ic5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 15:12:20 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-53e28cf55cdso804710e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 07:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736435536; x=1737040336; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZ/s86xLkYT+SehY6xTa0g1XsTpi9QTPMcjn8c8nw7Q=;
        b=d2s92JORqHre8AQSHDthd4nwCbFzK8atRJlzLLPbJ2u1IN61TTVOcloqe1b6tDxdwi
         3B6mVvNx+57AfAy0haIh7DMZpcNH46DGNP4DtscTxYVqcdzf3vVDaZBh/1gGkKmrH8rS
         tGEN+B/CKD1VTbOULpaSbGw0RN1o+PBk1EPg2YEfuNh8smRBNuKFIRjC8ByKiIwpLRM+
         DP5Vu4hNt0swZqnxpTdm7hWISweY4ACK1KuQ1Jp5v/N6a2CcfoNZI/VsCKCdoPiJs0gC
         Oe1JM6RIby4Eqlzp6aKtxrZtIBsyXkDG3peu2OOJPsNcgOss9Kg3aqEDZyR5INubi4P6
         Kf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736435536; x=1737040336;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KZ/s86xLkYT+SehY6xTa0g1XsTpi9QTPMcjn8c8nw7Q=;
        b=cs/9cYCdKwCUsHRSYpaPx7aWk02nxPGIKjuSKePecwlC2zXvfYT92FijQf592xEpgE
         aMeQZsKcSBm5rm/KEcFnMNcnf4w4+VBHEwmKYuIVZc6AJTyu52kpmyA61c3VZT4Sz1Pk
         Fk9UmVekIaO96Jxr1MItPsqXnqx2KnbyHJqiPHhet5ZiowPLB2MH26ycgNDI4ltXAnYw
         oo4d4XcH3yOzwYVCjeBAofliNUWylbztFd7ImFiFH3QdC6HunlDh2QUVspGmAv/uitqY
         JBK/FlLVTqqq0bGIG2iZNeoQldWxRJAdN8P50NDs13BiDpM+MV9uIRlTfaso83E3VUBY
         GjXA==
X-Forwarded-Encrypted: i=1; AJvYcCXDwsiboYt9gH/Zk+rUTVpLIOPbZPY21OJ80ZSYT3fBRGA2LqLoDdWVqWzQAsE0kBH0iS3BtO6ZtDxsecmnbNuz@lists.infradead.org
X-Gm-Message-State: AOJu0YywUvZ1vFx6U/WWpsmMoXt9SgAFrYGNkv/YW5jGUDeQ7YbxZ+Vi
	9ZnS+BH9LEqey2HtJxMZOQCACdXANWN5gYejYC9D4U3Vg5al9ofb0d4dG8Q1HVliWgYJIw4A18i
	pPvyaQsZlteWzv235inyW0QvVxPM=
X-Gm-Gg: ASbGncv00xSZSHHkSSVnWeK4hJxcxrHXAmxlWeQT4efxFgFFBTltXTc98dPX/lqQxRi
	lmYN32aycOkhGKEp3O+GU+iTWWz7RcbAJy6b0FMYY/IUMGaixncQj69jbVyRN82nbgBZM
X-Google-Smtp-Source: AGHT+IGL+Nhstz3ldj2Qzy3BUu8CvkJW+en+6Pugv+G34XFXJODm1l6h5QLV865NrxoZTWdlJIMugE0m0c4M50RMq8w=
X-Received: by 2002:a05:6512:3c8a:b0:542:28dc:b692 with SMTP id
 2adb3069b0e04-542845b9480mr1829867e87.14.1736435536184; Thu, 09 Jan 2025
 07:12:16 -0800 (PST)
MIME-Version: 1.0
References: <20241107085705.490940-1-lukma@denx.de> <20241209105240.72d8d84a@wsk>
 <20241220112950.4673bb3f@wsk> <20250109153702.2d149023@wsk>
In-Reply-To: <20250109153702.2d149023@wsk>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 9 Jan 2025 12:12:04 -0300
X-Gm-Features: AbW1kvYm4YHhAiGIME9YVA_LVAHfPvIy7l1kmlYvyF8IFfpGO4Q1dallC36xIoU
Message-ID: <CAOMZO5ABPnB9ov7jtEmDSZ=efNh_yx3JcqqS_UMTXgie=8PcTA@mail.gmail.com>
Subject: Re: [PATCH v11 1/3] dt-bindings: display: Add powertip,{st7272|hx8238a}
 as DT Schema description
To: Lukasz Majewski <lukma@denx.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Stefan Wahren <wahrenst@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_071219_344962_737BCDE7 
X-CRM114-Status: UNSURE (   6.77  )
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

Hi Lukasz,

On Thu, Jan 9, 2025 at 11:37=E2=80=AFAM Lukasz Majewski <lukma@denx.de> wro=
te:

> Gentle ping on this patch ...

You missed copying the drm folks:

./scripts/get_maintainer.pl Documentation/devicetree/bindings/display/panel
Neil Armstrong <neil.armstrong@linaro.org> (maintainer:DRM PANEL DRIVERS)
Jessica Zhang <quic_jesszhan@quicinc.com> (reviewer:DRM PANEL DRIVERS)
David Airlie <airlied@gmail.com> (maintainer:DRM DRIVERS)
Simona Vetter <simona@ffwll.ch> (maintainer:DRM DRIVERS)
Maarten Lankhorst <maarten.lankhorst@linux.intel.com> (maintainer:DRM
DRIVERS AND MISC GPU PATCHES)
Maxime Ripard <mripard@kernel.org> (maintainer:DRM DRIVERS AND MISC GPU PAT=
CHES)
Thomas Zimmermann <tzimmermann@suse.de> (maintainer:DRM DRIVERS AND
MISC GPU PATCHES)
Rob Herring <robh@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED
DEVICE TREE BINDINGS)
Krzysztof Kozlowski <krzk+dt@kernel.org> (maintainer:OPEN FIRMWARE AND
FLATTENED DEVICE TREE BINDINGS)
Conor Dooley <conor+dt@kernel.org> (maintainer:OPEN FIRMWARE AND
FLATTENED DEVICE TREE BINDINGS)
dri-devel@lists.freedesktop.org (open list:DRM PANEL DRIVERS)
devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
DEVICE TREE BINDINGS)
linux-kernel@vger.kernel.org (open list)

