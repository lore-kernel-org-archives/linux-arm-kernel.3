Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDF6C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 19:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CK5bDbReHG6fPNd1fjSjzJA7YFApuP2BjpPfIh5cqv4=; b=GvUYXzDFr/VIlTsB0Kdc3L9dHB
	kZVgCQcCQqV1RDdRBMpWpB05muyS5CWPkFArDsBQ4wNKnVsv6an0u5cHTib7g0ieQBwegVPHATJtS
	Dn7Q00qZNLRykd8jCZSZ6pyaVApU7pbEbHF0TvSPDPd7QOB0KY7CUGQH40aUJrjMLMYMdxx7xNa2L
	mYa9tvTHTkBGbFMTCl696XPh85tyrYlI+tJ9RNayH8BK7KKtG6uftSprp55c0Ysngqtw+oeUZ2yYx
	AlT+buzErxb26zWSYc/fTqyH951G9+CqICMZ9sG4SVna3tcSC6avh/AvvsDyOROSiZtc15m5hZDbH
	CBm0v1cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqzUh-0000000H4kE-2K3W;
	Sat, 08 Mar 2025 19:05:55 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqz1Y-0000000H0UQ-3hjM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 18:35:50 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ac0cc83e9adso801876166b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Mar 2025 10:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458947; x=1742063747; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CK5bDbReHG6fPNd1fjSjzJA7YFApuP2BjpPfIh5cqv4=;
        b=BsWqCiwHRKlF6lM0ii5nU1wJ4BMPABARfSEnOwYjizRhcHDQBZ+jd/Saya4NlmhNBL
         LRRhhveh2ZN4uSlChPNq8drTo2ZGr6EcSeVZaTgsK8sk+uiUhjzzuQVZeKdqAvCqf0w/
         9Z5OmdFRACVuakbL9uTxEWIdTOExwCUIC2UjqKmXfUvzojErywa8DgXC3SdpLXTggbFb
         p95aTPSh1SQmLdtcgsxBkOgmfI2NMRASqgUquEQxHVCB9/CJaJOOjHatXU3HbYYz/8Ap
         Quw/0SS6iojGS0O+7TM2edGSLl3JxHSt09Vf1wsFr669GsXdSSwri+NcD5ZAx3umWv/9
         Nn+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458947; x=1742063747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CK5bDbReHG6fPNd1fjSjzJA7YFApuP2BjpPfIh5cqv4=;
        b=T15qwRYDeo7Zvmb/oBoeaUSBxkgMWWkRA5pLZVnJHbFSbumO0dMK4zinG5j+Kd7e2L
         SebeeCueMgx8IdKmr3FUjid7iRvhz0pYDQVl5NCj1rhh6VeKUfNyX2h09Gje/+0HIy5F
         ON3Kc8OhaLG7f5OsKbXw8a7kVxY48TjZtU6sxdwYJXjBylE0zYLKZA7lA3hwxLg202gl
         CjZC29gsdAx3H4rxaMKxRx9a0+UP4qwyakPH/GBwjzXAv0NRBYNQEMDqjeLV6yZUQnd+
         iofZkaDSRK1UroTXpvgY2912nkH/HN7tlV1E6jCQVBJP/RTfPIkAbJyYFV7ao3UGU6h0
         Hukw==
X-Forwarded-Encrypted: i=1; AJvYcCUOEQsHliM5NfoMmKfdQrALr0ZOeTWgt+I0fwEEMBzFZTivuWJuRg5d4V/Aa8K9e8f4E7F7RjJNUeJj+J7dty/y@lists.infradead.org
X-Gm-Message-State: AOJu0YwPMwMDFGtcgZDt+Wt4Z78tzC5O/b3wxceMqGvfwYR/FLhuYQLl
	FR4f3l5pfsaO4i9BcE3maMXlCRUJV7JfDD4iU65zfL0xC7kZrQTV
X-Gm-Gg: ASbGncsiogaO9OH+TTA3Rn1KuPwSnQwidOtgnev7FeAAtepQe/DDuwueCQoQ3tWx5F5
	RugWyFcOIWL1r2i6WBDSqy85LbiSMbS+TbiWbplYOkL1rr+G27LKVqyPs2ypyTvSmm0YKiePI83
	vxK0a1V2k2vJv9uzoxuNz4mTkY//WR0BXNKIY0NdQvfJIG9PmjX88gtUw6cLFo/IJ+WZaUb1IGV
	ksaIWHFxgLz503+idToYAGpL7xDU19ZivWh7FqKvhv9/vrWVU2ee8eVMpYMZ/yYUX/xveBEflFi
	5v76De2nX49XGTmfxeYQUAfFsVo3yzip2Ixv6r07nTBdsBw4s5kY843BPw==
X-Google-Smtp-Source: AGHT+IGYYdE8ygjHkGbwYFxdRuN7/SMwMWgaOvxuGGIjcdc5JQxB3kxCPC7VbHX7VMiCBnhZf/DQyA==
X-Received: by 2002:a17:907:c313:b0:abf:27ac:2cf8 with SMTP id a640c23a62f3a-ac26cbc5b28mr427259166b.21.1741458946975;
        Sat, 08 Mar 2025 10:35:46 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:35:46 -0800 (PST)
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
Subject: [RFC PATCH 18/24] dt-bindings: media: i2c: max96712: add support for I2C MUX
Date: Sat,  8 Mar 2025 20:33:47 +0200
Message-ID: <20250308183410.3013996-19-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250308183410.3013996-1-demonsingur@gmail.com>
References: <20250308183410.3013996-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_103548_925527_5E068983 
X-CRM114-Status: GOOD (  11.15  )
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

MAX96712 and MAX96724 have more than one GMSL2 link, and each link is
capable of connecting to a separate serializer. If these serializers
have the same CFG pins configuration, they will also have the same I2C
address, causing conflicts unless the deserializer muxes the I2C
channels. Moreover, the serializers can have the same hardware attached
to their respective I2C bus.

The MAX96712 and MAX96724 suppot I2C channel muxing via the GMSL2 link
to facilitate communication to each of the connected serializers.

Document this capability.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 52b5603c2f53..4c4542d041cd 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -37,6 +37,17 @@ properties:
 
   enable-gpios: true
 
+  i2c-mux:
+    $ref: /schemas/i2c/i2c-mux.yaml#
+    patternProperties:
+      '^i2c@[0-3]$':
+        $ref: /schemas/i2c/i2c-controller.yaml#
+        properties:
+          reg:
+            items:
+              min: 0
+              max: 3
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-- 
2.48.1


