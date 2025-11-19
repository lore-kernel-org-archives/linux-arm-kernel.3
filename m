Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64ACDCF3963
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 16:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W+BKTv32VzHjWL0NXMYpgvUxDlBNuCFA53q1tVGjGOw=; b=z06R1M9CzSYSloLoF1wQyllO/h
	IzYfvfqzKN26vGkaLZl6WquX+CtGAGlr2XkXMGgM6iZrI2PQ2Ny0dYLV1dv25mTS+CJAwlRN1eGxl
	6eEaOig8G38kbu28Oyo0YAcgg1WBee0bijX4HIy8IgWqPz+IaGY8eoPGtiHsfTko1nAf90xD3Kgqq
	N4tTrHfyQyC68bjuPGLcbtZqDU2dpaIUWIbjdE+NzLH0OF+w/+HFKnkQPy3Xgse0uuK+3uwvJ8Gii
	nx22/rYtzpvCAA7Xduy6DkKtfMOniRtVp5vzeq87qKTrxJIXPXmInfOWdrQfjNuhiJ9pJkBlU942K
	yfFOWN9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLlMm-00000003ja2-135W;
	Wed, 19 Nov 2025 16:49:12 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLlMk-00000003jYx-0SVL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 16:49:11 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-429c4c65485so5815859f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 08:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763570948; x=1764175748; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W+BKTv32VzHjWL0NXMYpgvUxDlBNuCFA53q1tVGjGOw=;
        b=EB/m1WBwG69t3Oett8WxFR66mnD2nZiJc9wC6yB1KDPwtAkiAc20N/HwitSr24EUDf
         4yFuIhs6WjVNWRMerftk/D4smuojwDMvwkyZuurL6CDrvsBJ/1wplpAYuyTnnvItKhZE
         r91On6H8cEvupVcpkO/yREmaHVR/xFmH1MqEl4OknB47oLJPxPFImgWWIeZFuVYhycww
         LxBx5U90pdP9W60Ch5BLj8FywWmA+3l8CoOdjAxyBTEguC5nZdj6nX67Anu67ieIrI1+
         5zsIv6F2L58F3zvzx079JO7eT+TMJe6f6DQQOb9u4XGO2sRwi/Sd+WUllxv+UxIaBKLc
         hmww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763570948; x=1764175748;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W+BKTv32VzHjWL0NXMYpgvUxDlBNuCFA53q1tVGjGOw=;
        b=vQSdDdeuJB21q1YyEqnfXMw95cgdn5uKJgBitPd9Ye4o5hANrpZ7/N2txE4QGc6D/6
         1EqMKlALK9m/FZwrE/KGQQqlokw8JWRcMUa8KkaP7w2MxTRjlm/sqfJMz41eyPo5Z5ba
         KgqrxOBzfYK78USzc0SR9QQC4jlzp2zqjDnpAS26IATqVnVHyeusT8Oykh0XwS8Kwb5b
         Mni93LAg9DogGSTaBu4hHFbyE0k7mL9FyYKD3B+8gjsVkzchVF1tecBtd7IwnzCD7+yR
         Lg0Cwt2C2rHX3SyfssdRK/QjcvPmL5rwqMPXwXBx0nvcBQEXm+yrDH9Qa+ZpgiNG1q4D
         WBOw==
X-Forwarded-Encrypted: i=1; AJvYcCUth9X8mWZiB9Rpy4AsXCUy+O83qttpSA/Nn93YZOPPWjTQX3PrS34zY7SwSimDgRBn0PtNlhoME2Pc6v0peUqK@lists.infradead.org
X-Gm-Message-State: AOJu0YwP4gNzQ6SoPP4tYp6goYnUek8JzQXTL0Zr3djCjrdiaHR5aApW
	KdTEX2XdrSHvoKu80SJRmaDnK/0GeYBiQynsi0o+Ow7SLjeLjsrSWaJR0QHfJhbpYg1qaf6Ozz7
	IUYyd
X-Gm-Gg: ASbGnctNY5flGnM/tkQbkvjMqgcLzbfKKOItwqYpGx7HaJdD7oLusnbY06k8sih9ar1
	EuV1f6HCC+LP5BKHTk90zCOdwcA2NzAjxb8ImbfDeVEMzTruqVRIS4r3Exo7YlwstqRcybOVTeo
	zmE36L9iel+hrRGfIkliFTE0g+Q4RPslS/EjBdt60EztIOBg+HgChjtuVi7H15cOuHmx/wbFEHl
	dXzVR0QZnyK35TFejt+gGYWNRo9FMv5RKBYgrlKl5ibl1Hd1d6L5i8VAafpk9+JTyTw1PR3gRBy
	VHLDmObqUDfs7H8Y1s7CIkJjQXETbVUamdRsFsChCTXPmrccQh0AQwl4H9lj3judjOSdQNf2k7/
	Htiys9xUmJeDZ99j3EvuhJGkdF9z1mD/6eoarf/nWrkPJJ6Mwl5g2cUtfGIWFHfeK58euCvJpHU
	0zkYB5hrvXz8Wkls/cNNYJ+/fdhertUJ3OBjjoe7Xfsg==
X-Google-Smtp-Source: AGHT+IGarLhroHkX7qTmCRjo26XJBz7LFy48hq3bSCrrSEHsmi3uQiS1f6ngL2AlJBr3sKmOqBWAhw==
X-Received: by 2002:a05:6000:200c:b0:42b:31a5:f032 with SMTP id ffacd0b85a97d-42b5934dad6mr21284526f8f.28.1763570948041;
        Wed, 19 Nov 2025 08:49:08 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa3592sm117957f8f.21.2025.11.19.08.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:49:07 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Josua Mayer <josua@solid-run.com>
Cc: Jon Nettleton <jon@solid-run.com>, 
 Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-input@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20251117-imx8mp-hb-iiot-v3-0-bf1a4cf5fa8e@solid-run.com>
References: <20251117-imx8mp-hb-iiot-v3-0-bf1a4cf5fa8e@solid-run.com>
Subject: Re: (subset) [PATCH v3 00/11] arm64: dts: add description for
 solidrun imx8mp hummingboard-iiot
Message-Id: <176357094703.280640.18246985537228820663.b4-ty@linaro.org>
Date: Wed, 19 Nov 2025 17:49:07 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_084910_201837_8EEAE815 
X-CRM114-Status: UNSURE (   8.55  )
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

Hi,

On Mon, 17 Nov 2025 13:28:42 +0100, Josua Mayer wrote:
> This patchset mainl adds description for 3 SolidRun boards:
> - i.MX8MP Hummingboard IIoT
> - SolidSense N8 Compact
> - i.MX8MM Hummingboard Ripple
> 
> This includes dt bindings and a range of bug-fixes:
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[02/11] dt-bindings: display: panel: ronbo,rb070d30: panel-common ref
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/779640415ea28abb60bb7641d50f1d9cccaa4d73
[03/11] dt-bindings: panel: lvds: add Winstar WF70A8SYJHLNGA
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/72539c4b9e482f397cc9340bcd97bb7643c0692d
[05/11] drm/panel: ronbo-rb070d30: fix warning with gpio controllers that sleep
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/93f5a0dc2b7c2df71a93e0fc59edae474bb84c6f

-- 
Neil


