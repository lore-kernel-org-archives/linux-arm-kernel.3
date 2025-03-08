Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0055C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 18:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jAQhDQpxTrgqUBQBlshc++aOCj5PQ0JybfWXWmVqz2c=; b=xgV/TptGwhvCzX66rILPHRWZFV
	d3Ijn17niv4kZ9Gpn470QV2d7jfR+XSh2gJGhWScaY8cauqbbC6fzmL0vsHuWoXi1NsJvt74OnSlA
	fBqKHIZ2LTZmlLz9lgtMTL35L6KrLw7h1DIFpW8s6ytNiYcz+zzy7mOv1Q7cFTwkzmEWoNEdcADNh
	Cj0TgDL2TJMbijDMxDTI5iYjJcEss7L5u5KoYzfrS36C8fpIky42VwXQS52u75YmhopaA3IJeHUJZ
	12ILp9vqZazF+aiWE+CyFFm0o+Pc75cXyDvcbMcuwHuLNd4zyqtC088gjHy5MNCLSQ96TWlRbWqLK
	fa/w5gvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqzEk-0000000H3Gk-3NXc;
	Sat, 08 Mar 2025 18:49:26 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqz0m-0000000H0FN-2drs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 18:35:01 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ac21c5d0ea0so353156366b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Mar 2025 10:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458899; x=1742063699; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jAQhDQpxTrgqUBQBlshc++aOCj5PQ0JybfWXWmVqz2c=;
        b=VcLjPJdl9eSbJuasESz6IxvE51qLbRTdsFhqOgTrUq/OMN9YWnu3vTjyIO8vU8v3BK
         dr2iSRmCzi1jPOJO9bSdETGG4IO7kOgivh3WO9EJx9OdgY8MQEkV0CDDNlJ3f+XruTcU
         hXEuFqSg58RT6fioFcCxKJJvPZQWx3YSKPWbrXIbNHa72Xo6sOtjvWzL2KcrjzBu2bSc
         VUTNxp7moVfdxXO4AZ/eAftxAraemS8i6TMBcjMoLnpqJ159va41kjSRQYbBUCeGsTn/
         OdB5qeH6D7xSyyKqq8AoIWtUxfnWjXuG67GzzFuHoCUdR2x6eR4ALdhdbhJsSmGvg4hs
         X2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458899; x=1742063699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jAQhDQpxTrgqUBQBlshc++aOCj5PQ0JybfWXWmVqz2c=;
        b=KMCueIOKZcxpoZEaiBb5Rl6Or74tTlPW0geKlV2og+ZkUJw8+pM98G3PG45QbtSPIp
         A13kUeZmt/oGL7Z6Ah9j7K1mn4ed12o3SCoe+bSQgnV8VAVoepJL6o3Yz7f9lpEtrYot
         db2bUt2ZyML2efG7+TV4WYLIV3FHSSEsUL9y9E4ycEK6Y5VqRUL0NAH4o+8QsdqnUu+e
         z5nlt2ZHwa77R48gGVin7lMyHF7U+gpdOel/SUaqpIBJH4KKj3z6wNdQH0l7kQUjG9Yf
         0Ux+swVTPgZAz9RNvGNMAramBwpbFvJHy7pUkclhrl2OgR25T4a0RPBQeYBLhWuOjGdg
         RdUw==
X-Forwarded-Encrypted: i=1; AJvYcCV8TuNaHUHROBzsspis08B5aFZEhLQrVyOtKpHXRKaDT4SOIbwBOJMGk83hIXkma45BgUBmIZ5s3NJXMeLCXSAp@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy7YpsX2BERVhvTNG3K1DJKTJcgYN8BOV4IrqAxPDYF1CiK/wv
	l6G0uC9AqtKEaicJ5v2kNPXt+gCsMmgKcsL25iTuB0vNvi44gpbs
X-Gm-Gg: ASbGncsAIle5mEuzkuQhW6bw252DKx0dz7yfQVRvjSNCbEvnbPl4N9g2I6a38KFRS4a
	TKWQb5G92AmB6imEK/M2Q+Cub9aHRX+lFANRUdQQEpikgl5LR6k2mKT7Bb54m9vU2QANccczLKu
	r0QY0ksGezcK4m34pwDoUMXwY2eJGS4KlmooN9ro+PQP8VeHGOH4UWB1TeWwWWeh6jfDooWTGJk
	TdhKN0BbHjUzpP5+XFvxXHNRXG10HN2G2XuCj27YM8nhxjfcpL4q4XgfSY/86g4rUJLOVr6JTLS
	03Ogc9+ywx0/5lDSMEnnEZhHM5zS6zcBbbEF1BlJ3tJ0HsvjP4eb3BE2oQ==
X-Google-Smtp-Source: AGHT+IH2YosUhqi+STAQ/nY4ti7PQvH7nJrNeEszlj7Q84z3kvlLkPrCo3BZtLhHfeHuHBAcm4ROyg==
X-Received: by 2002:a05:6402:4617:b0:5e6:17d7:9a32 with SMTP id 4fb4d7f45d1cf-5e617d7bb68mr11479433a12.18.1741458899040;
        Sat, 08 Mar 2025 10:34:59 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:34:58 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH 08/24] dt-bindings: media: i2c: max96714: reflow text
Date: Sat,  8 Mar 2025 20:33:37 +0200
Message-ID: <20250308183410.3013996-9-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250308183410.3013996-1-demonsingur@gmail.com>
References: <20250308183410.3013996-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_103500_665829_462B19CC 
X-CRM114-Status: GOOD (  12.33  )
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

This text is using weird line lengths. Fix it.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96714.yaml        | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index 44667b74296c..2f453189338f 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -12,14 +12,13 @@ maintainers:
   - Cosmin Tanislav <cosmin.tanislav@analog.com>
 
 description:
-  The MAX96714 deserializer converts GMSL2 serial inputs into MIPI
-  CSI-2 D-PHY formatted output. The device allows the GMSL2 link to
-  simultaneously transmit bidirectional control-channel data while forward
-  video transmissions are in progress. The MAX96714 can connect to one
-  remotely located serializer using industry-standard coax or STP
-  interconnects. The device cans operate in pixel or tunnel mode. In pixel mode
-  the MAX96714 can select individual video stream, while the tunnel mode forward all
-  the MIPI data received by the serializer.
+  The MAX96714 deserializer converts GMSL2 serial inputs into MIPI CSI-2 D-PHY
+  formatted output. The device allows the GMSL2 link to simultaneously transmit
+  bidirectional control-channel data while forward video transmissions are in
+  progress. The MAX96714 can connect to one remotely located serializer using
+  industry-standard coax or STP interconnects. The device cans operate in pixel
+  or tunnel mode. In pixel mode the MAX96714 can select individual video stream,
+  while the tunnel mode forward all the MIPI data received by the serializer.
 
   The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
   forward direction and 187.5Mbps in the reverse direction.
-- 
2.48.1


