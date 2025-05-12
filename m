Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43364C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 21:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bAz48FYkFVpYXUdYC+Su9R3w9TkApJmckQAewQrh2nQ=; b=FotQMhNMpwgX9N+ERFO5bPIaWm
	3tElMqEYN6YwSoyq6EDwva0UHZWT3ABr7Rl2aq3gMJQR37tUDgHPRY4AH7PIvIUo1duEGYwJ2BiwN
	pml/kwwVOKKexEFesTSgfSGMjHmnWEDpfxBcQIBko007APKL3Bc6pabo6rE+0CEMu40cPJeSHzJol
	e2AVWIOVIC04xthjcFBSZ6EEhQudSjw7GJ4mlYIbr+Q5bG9Ki2u8D6iZLtlBuVycAgFU4vb0RuwJW
	Tkax9DUzENa+GtXkdTkOAzDH+ua4kvG+KPZis4qBY0Mv6cNjXfd48yomvQtKyrG2vvLqdho0a3VcV
	gW2QU/jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEaxW-0000000AlUq-0Sjq;
	Mon, 12 May 2025 21:45:14 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEaht-0000000AijU-3ubg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 21:29:07 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5fcf1dc8737so5741981a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 14:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747085344; x=1747690144; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bAz48FYkFVpYXUdYC+Su9R3w9TkApJmckQAewQrh2nQ=;
        b=XLzsniMvINk8jKgwcj0GLpBCcfw/6PYnoCicx3Ek0EOOxQM8K3Z0Lkwa2mu0ld+zdE
         52LlkmkLLDdNmYiS6QLRqMl4aKt1zBw6JULN3a/7MNAT2w0wenB50fa2LXzI/ZSWmgiH
         0yEOdHo0OU4ajwncAec91EagDoyece4yqcjERKfm3Ju6kus5G8K2JIgQ3E3tuDpRVTOM
         kCZ16ku9CObcKHUgNu1h5caPyKdThTBeVKRFAUSk6b8L62N1FEIyoLywLP9eG3QeNR+3
         M3x5hq5+moUoejXkqavnZNUeFie3Pq5JeM3Q/z6HRmR0hdvDKfJFJpp9epDGqiLYNofn
         BC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085344; x=1747690144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bAz48FYkFVpYXUdYC+Su9R3w9TkApJmckQAewQrh2nQ=;
        b=skZBZW8EOTAjHr+w3G2c3qrTiNy74lThcmDKOQHUOtnNpx3aFZNS7+Bk45xbCB16QN
         bKoy+TS0iWD3dd4lRyQcmKj1iYkaboq7zpmm/jQsB7VTCIgN1ooh7jgjXW5qXyKvKSFo
         AEngWfN3D61DrF4Ae9BwQSzWHMVX75QhDFokimfYL5BmAvmPqRpC3mrl0xys5taw4IIi
         l45tZvz+Voz/DxGHrx0kfi5DiiOT6sap1d7Z7LCs3QzRuoYDEJ+LFuJAcj0Q4NgSyZiC
         FGo3JAxAl039sOXX+chUD74NhPvTq1k7hcgrKljGLTLe9YpiFuFlBetkPcZSGAjWGE65
         deCg==
X-Forwarded-Encrypted: i=1; AJvYcCVz6+OPBhKABu47ZPvE9lWB+c5puC/Z8zmRd3nR4yOLGEKZ9khnN3ePbXER3biny3uC4P560+PYaS3tZV5n7xLe@lists.infradead.org
X-Gm-Message-State: AOJu0Ywttu/0GvI66O8k0ELlLWlhNyDuEzuJCOylM2TDPlulYgcMvBV7
	E0SpER26gNHNF4MDGUV6nA5Byj2UmcTSrf9iAVVQ6rD0a+cX7Zut
X-Gm-Gg: ASbGncuocaZKCSyRPy6tdWzBymnwUZuGVuRozOzQoXSDSkrDpjXvBPkJSTQL4EAEEGF
	j4hHBk6iqiZyPwq5XE2Psim1aqKlzto7LfkEEOJDavMk2++/KLxFzG1cbuoX34BsuVjNP0jMX6J
	NridjZsX1EDZ+s5Mxz/lLLjNoDyHmrIW7NVXaUMBoI8SIW/M9zIxotqxMwCh9SliigLj3RWXpba
	tDH2PgG//nt6oaCYyMzK0ofVw2ysBiTAU+ioqg+CnLEswUSGrFT6SHPgkjM9WXPcy32w0TrnGN4
	WFeduUpPu+eeeXM5v/jqTFw14ArKKJ4xM3m1lWMpM2f/ZlAKKeXy2uM9A1P3lQEz2hXJdoIulw=
	=
X-Google-Smtp-Source: AGHT+IF3wDuYJ+g7Mgxi4N3TDw1mN1R3uL1whx6mbYJx3067WhAjCO2lvksHmND2LByrVN06I2Xi0Q==
X-Received: by 2002:a17:907:1c91:b0:ad2:3eab:4998 with SMTP id a640c23a62f3a-ad23eab4c5cmr884411566b.32.1747085344105;
        Mon, 12 May 2025 14:29:04 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23a5552a6sm472861466b.30.2025.05.12.14.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:29:03 -0700 (PDT)
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
Subject: [PATCH v3 06/19] dt-bindings: media: i2c: max96712: add myself as maintainer
Date: Tue, 13 May 2025 00:28:15 +0300
Message-ID: <20250512212832.3674722-7-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512212832.3674722-1-demonsingur@gmail.com>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_142905_970434_C0B17020 
X-CRM114-Status: GOOD (  13.57  )
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
 Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml | 1 +
 MAINTAINERS                                                     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 26f85151afbd..efdece2b33b9 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -9,6 +9,7 @@ title: Quad GMSL2 to CSI-2 Deserializer with GMSL1 Compatibility
 
 maintainers:
   - Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
 
 description: |
   The MAX96712 deserializer converts GMSL2 or GMSL1 serial inputs into MIPI
diff --git a/MAINTAINERS b/MAINTAINERS
index f8ffb7cff9c5..abf3afc95fc9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14184,6 +14184,7 @@ F:	drivers/media/i2c/max9286.c
 
 MAX96712 QUAD GMSL2 DESERIALIZER DRIVER
 M:	Niklas Söderlund <niklas.soderlund@ragnatech.se>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
-- 
2.49.0


