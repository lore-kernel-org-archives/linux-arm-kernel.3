Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43E7C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 18:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=StYjAl/VAK0MYL6WYMTcRj5E6kmKjD+sp6An2vGqQtw=; b=2/3pnygHZu4hdBGbWkAtCFleuj
	xfnkbAMyf7M8EO3RXR+2dzHLp1LMjFu7ykHn5prS5V8Gx0wRDrHPLuRTYfDATqPfrFJAi07t2avF5
	ViA/bUHBYIDk9PEAg5ggWvFYhaIdPlvz88g3tu0sXVjS4F1fZ3Gs7tRM5n0UUc96DWetsFamJkpzY
	CmkS5Ifa0CihndkHSJfwxxHWUVMQ8sEq3fF1lkxptA68EDMpj6E+SEHWjohzb2F8iba+nPqClTCQc
	lv1kBT2Q0o5quf3BCkeKTbHCK5ItI/O+eznJVxlRq9BOBJC29hKtlvceKbaRlC44cdwVvLJENcyo2
	zYg+zI/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqzJX-0000000H3l4-3F96;
	Sat, 08 Mar 2025 18:54:23 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqz0x-0000000H0Jc-3pLU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 18:35:13 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so510722266b.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Mar 2025 10:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458910; x=1742063710; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StYjAl/VAK0MYL6WYMTcRj5E6kmKjD+sp6An2vGqQtw=;
        b=PdCy5k7lwQVCQR7bC2GTTwjojgjaJTuF/5GkPun90H3PIsSyukteDzT77MhPYBss+Q
         DcL782uKCIfsNYczfXhzf92Drgpg7Zqz6aFTvg/1I0NdLW8LwMc/M3lOiJ67WHPf78De
         StSR4UIypqL4/zBo1FptFygW9kyzhoL/mtJ6S9+DmHG2fiYYbuDkom6zW3XS6yHJayGL
         jX67l+xuspuUdVVbe/vt+phwR/tWBKyu0PzgLA/fdAov5nhAES1kZ5Umkwx241rtCK4H
         JCTCaRvBh+FsSAuqm2PB0BhRhpRTZxwyLoWeFGJ0rFebN+gh2ukyt47zaGH9X1I3iFhu
         Wj5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458910; x=1742063710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=StYjAl/VAK0MYL6WYMTcRj5E6kmKjD+sp6An2vGqQtw=;
        b=ZgGndf5165On046UjW4upgB/Dbj85XqIPACD+1QWoPcdVNgKpqXf+/HG+hyaS93xiM
         V0hh7ExrgTcapA0fTMWGtV+HZD/P1O6BNyIfE8JFClx0mobUGAURysT6tGKUIw5fWV3J
         aiFrfHNDzNhRghWkzsdx9+4cQyMGPFP8YWe53PCFlDOVICONHUPzzfzWaduS4DiZ6Sd6
         tZzNtV4m3mAVxv+7y8x1txT1Vs4OWbz1Wt15wMCG/pbMxf3kRhsQXj7jRgaLCMuJZWt9
         AfqYfk5WAIi7VnxaoiG1P9M/twfawohcOHSSS5YjEruprC4hRNMtKBWKzx0F2QoD8yj1
         o4OQ==
X-Forwarded-Encrypted: i=1; AJvYcCWL6m7viC4gpaFcHXbk3kY/aZYVkpld/SbqHeYz3Np2SbRAYRUMuwQ57YCZu1XID/n0MPCOgThJisNX2biWUYiI@lists.infradead.org
X-Gm-Message-State: AOJu0YwpkPUWA4aT3eFsOzY/TZnRSXL1IX2/3sBr3dx2JDW227UJQ/DW
	BSpm9tTu9k1nmnzRK4p5i6Hlh6oyAu5tN1AK/D1u4OrI1hlnchfX
X-Gm-Gg: ASbGncs+5l8Qs2RwzjYU3o60RkkxXAIRCJfZPTGyZ+JkRswLTJLGUzsRk4xyv31imDS
	Gdo7mf8C1QKo6UYtbNqqJ6U7YcdhTwsoUOi5jDRtoytfMJXOyD+4sfneIy2zMvi+bx+bZ6qxfZ6
	3tA4DIB9kGrSfojyWeKBg2XfHH7OS/u3gyum9K1zqySQD4FfU3905pAr62azFwj/fg2tJCuDaNw
	697erHlEh6Y9yZ804S6L2hn/par1v8d7+90V5VCVBufHYvvgeLWJShTqkTzUnaF8qD6R6ybNmHp
	lOkpQruZ09ZnxiUcLsZQjPYoYEmbTGtVccXz6OgWnZ6trkd1qnVO7bLhdA==
X-Google-Smtp-Source: AGHT+IFkml8eKK0tt9HJFaDP4zPVB3vHkGahRibCFcb1VL1+aECeQ55QqNbdYqCYjZhicTjwIyr4zA==
X-Received: by 2002:a17:907:1b16:b0:abf:742e:1fca with SMTP id a640c23a62f3a-ac252a9e1e0mr879939566b.18.1741458910140;
        Sat, 08 Mar 2025 10:35:10 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:35:09 -0800 (PST)
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
Subject: [RFC PATCH 11/24] dt-bindings: media: i2c: max96714: make supply conditional on compatible
Date: Sat,  8 Mar 2025 20:33:40 +0200
Message-ID: <20250308183410.3013996-12-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250308183410.3013996-1-demonsingur@gmail.com>
References: <20250308183410.3013996-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_103511_954888_775ADE50 
X-CRM114-Status: GOOD (  13.35  )
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

Devices to be added in following patches have more input ports, and,
implicitly, more POC supplies.

Make this property conditional on the compatible strings.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../devicetree/bindings/media/i2c/maxim,max96714.yaml       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index f0ae069c93b5..5bbd36c55ab4 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -41,9 +41,6 @@ properties:
     description:
       Specifier for the GPIO connected to the PWDNB pin.
 
-  port0-poc-supply:
-    description: Regulator providing Power over Coax for the GMSL port
-
 required:
   - compatible
   - reg
@@ -62,6 +59,9 @@ allOf:
         - ports
 
       properties:
+        port0-poc-supply:
+          description: Regulator providing Power over Coax for the GMSL port
+
         i2c-gate:
           $ref: /schemas/i2c/i2c-gate.yaml
           unevaluatedProperties: false
-- 
2.48.1


