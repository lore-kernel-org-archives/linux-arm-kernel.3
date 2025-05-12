Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716ECC3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 21:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EKrPGYo6r8jTfHw6fTsyOidOITDoSW91H73atx2WSvo=; b=qL4e34TTS20cReYwUUjKBHFXZI
	LmAJFG1Fpbi9puypl29NjcSR+t/3fe3oumzbRsE2ctq6VmOul2R4PfF48v8WAajp5RN/42VNIUCwR
	j2exkbEGLDPLbmK0KTTl5L3yGcHtC9f5adDabrtszmJ3zBHQigzZj+cAdGFnhc6mrvd30iSCO1aSh
	6mvN5j+TqCD/MMgrq5tXonH7BLqzcj2ml622ccQPhWvgZ3bngZn0X4qDcqZEw3JlUMnGtGx6QXfJJ
	z5Fm0hdZkCX2faXdU+NPuN3G11czIz5Mxbo3PyyrJlBbL+P1MWL6yWsGvoQU30Q3gUrZ4zSgVB9Hv
	6a8/bQZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEalT-0000000AjcN-1hn9;
	Mon, 12 May 2025 21:32:47 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEahe-0000000AidT-3aFx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 21:28:52 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5f5bef591d6so10362630a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 14:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747085329; x=1747690129; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EKrPGYo6r8jTfHw6fTsyOidOITDoSW91H73atx2WSvo=;
        b=Ta7iZ0Cy9qfKD5g7wRx5nyfvhEdpTLFORObH86+KpBtvJMRkorDwokQLbP1e6TXxtw
         uuh1LloWn7nWMlESIRN15DStxMbrRk0v0U3rEXdMKqklycBIxFLrRn+RDzDIpSewjU0n
         VOgyI7fJ5rEA860fgYcEYzNE3/AAete0NwYxMMNeS/ilLg7ilyV4s2UDJ8yBqThKF4lP
         yyhsLPO0H4eG07+YQ/eEbcwAxbuyQjUS7M8BHXJdUAhkx7x8q7A+YC+doe4GA9XySBqe
         pRcbnyQR0aq9x4Bp/VFz7GuIW1RfFSupHUnFD0RaK2v9XFWMS5RYOemAZ5FGn2mz0LCn
         OQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085329; x=1747690129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EKrPGYo6r8jTfHw6fTsyOidOITDoSW91H73atx2WSvo=;
        b=xEAF4XoWu+z9MKcuem3oyRgdyubQf1bMOrOP8tNAvtqXSA8GRE7puOLRvw9woC6LBF
         Msll12RNqtiuf/XXT83kDoA1mnRsKGGj/Z3r+WOOmv5j1Qqj4Oayus7Dl/7ugFd1vBaK
         tWJ3jWHUnnkTMfl01IJ7TJZZgxbmIly4+JaB4oRNcd+4oGFKiofz0jzZTMSTCEhOX9ZW
         51IoHIZruO/JC3LTgUXXQjMJMdrVRoCdLlukHXSHQRknDsSHPLPDWvyC6FMmXsFhw1hp
         P/S0Kf8PmZoUdRKfYNGgW94CGB1q0EVSLPw+3Ikf4lJp//hw5rl3ET4O38l7QlaL1OQS
         GU+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVvAm9ZdiSxXTETImeeBzg3Uhs9kWsbMH+22Vs2Ukp65XeMxKr2fUawnpUP5L0vFEFO88wcvSI9I1bZEcSbrmFd@lists.infradead.org
X-Gm-Message-State: AOJu0Yxs/PzufFnSE4+ptibS7jzCkA3p4jNGpySnq0ko3gBO0e3ezsP4
	05JuPguwnfUw50E1D24bzoVtyBvMj6eA0WAqThoXBFRtEZojswkg
X-Gm-Gg: ASbGncut8W4W/3dEm7+IR+lJKdchceBEiTaCgg5/21aYX6aaghC22+HCN3az0lwgtJ6
	Q8nKSp/RoJ3r2AKNr2ZjxsVpn3816XUVrmNXyq3VlBPuSLN9T6sB1Hrku6zw4lwlSjYe6yW+Sj9
	BTGPvlwAi4jlkTq75soUCxvBj0dpV/O5jND/N3QHaniYQ4T53wkBkgwBMbMbsDELZoVxvhaWplX
	lDd4pmKEC8PLZB6SPQBa4BVKcvbEUFb3H3jIas6iWANZOxg91w5+WXe8GfhLPSdT9P3doG7cAAe
	rWx28bS+E5YU/y4cN0Pp2crRyCiIPXuOkkN7Bx+3sOTsirrdNYlOQ6swIVB2e4h9CH8/rcr7lw=
	=
X-Google-Smtp-Source: AGHT+IFpt22qZHel8pg/VMN2FxBOpRn/l+5KBVuDEFumIWkq54C5p/vidB0Hx0vw1cOpJ8lTlDD8Pg==
X-Received: by 2002:a17:907:7f05:b0:ad4:d069:324b with SMTP id a640c23a62f3a-ad4d06934ebmr188335466b.10.1747085328447;
        Mon, 12 May 2025 14:28:48 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23a5552a6sm472861466b.30.2025.05.12.14.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:28:48 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Liu Ying <victor.liu@nxp.com>,
	Ross Burton <ross.burton@arm.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v3 01/19] dt-bindings: media: i2c: max96717: add myself as maintainer
Date: Tue, 13 May 2025 00:28:10 +0300
Message-ID: <20250512212832.3674722-2-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512212832.3674722-1-demonsingur@gmail.com>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_142850_900609_B5A46946 
X-CRM114-Status: GOOD (  12.97  )
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

Analog Devices is taking responsability for the maintenance of the Maxim
GMSL2/3 devices.
Add myself to the maintainers list and to the device tree bindings.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml | 1 +
 MAINTAINERS                                                     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index d1e8ba6e368e..15ab37702a92 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -9,6 +9,7 @@ title: MAX96717 CSI-2 to GMSL2 Serializer
 
 maintainers:
   - Julien Massot <julien.massot@collabora.com>
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
 
 description:
   The MAX96717 serializer converts MIPI CSI-2 D-PHY formatted input
diff --git a/MAINTAINERS b/MAINTAINERS
index 1916d0636408..8f463ebca056 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14198,6 +14198,7 @@ F:	drivers/media/i2c/max96714.c
 
 MAX96717 GMSL2 SERIALIZER DRIVER
 M:	Julien Massot <julien.massot@collabora.com>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
-- 
2.49.0


