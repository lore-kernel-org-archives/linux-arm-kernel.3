Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C75FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 07:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=43r/+cmZvPk4akzcNaaR43usa+rwGbMUMvIGyaPAojw=; b=TRlVyXE4JiJwTzb1YUkK6aohLC
	VXH/nS9+MlL/nGRulSh4mICO7gkSAQqhkU5L/H2Ju9eUIZhgy5OW+MOkHqLp+rb1Xsvd8hQfeYXRA
	Yuwv8z1a5ekH7oQIrlLeTgVmx9WtEcffUhPF04ZyRRi9xatJzaBV3Vr43wva754EorWe0BMxsOFI/
	SMp6aVdJhKThF6L+/HJ1/k/DZwGmB21X0ZY+hGEJADGF08kGGLU4aRQ3Cw6EkMQD9wi2m9kXLVid5
	/uh+tMR/ZIkMv7aRC8bUqOdJk2ihQR3dC4T+/swq4lvk8Fsg2kKGtVkgcVJj6TmmJuFgepxJ5Ee/g
	CzEwOYvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzYF-00000003Aqh-1XUf;
	Wed, 29 Apr 2026 07:41:43 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzYA-00000003AlN-2GCh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 07:41:39 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-364ad762ef8so34002a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 00:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777448497; x=1778053297; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43r/+cmZvPk4akzcNaaR43usa+rwGbMUMvIGyaPAojw=;
        b=U4vc4/bvYWNG/d90mm9l7Ok2NJpUZO3NUUvkPkwG4GdKmANSOkon8FOROXnMLR/dSO
         YDzWvYdgJ1F9NgITrq6RyLGBUzYvLfToMCVReGnS8Cm1T4qgXA5As6PvlVDivHIDWN2D
         IwyYqf6Rn4uh4r+S61/D6CrkH5bcmNkW20RVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777448497; x=1778053297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=43r/+cmZvPk4akzcNaaR43usa+rwGbMUMvIGyaPAojw=;
        b=UIOjQ8jyT92F/8Rwo2wiMgbNKGb0oWOqA5iNdMaeWcyuF3XQtGPv8yRtSCL9XeW0FS
         BlKSxn+IrlXsKdSy+E8NI4QQ1qFkJK2m7ghodXE5mXk61mxD2XBnqxLfspFfcfWxnWAN
         RmRRpx+RbY47ACfv2a8NwLmMLWc52Ve5/J4Pbm6BZSI9rYZenci+G8B9UC905r04zjOO
         HRbx8RbaSch+TxIqkrhPJDG573Ezk9u/Y9XUMMbO9f+J8gUTRY/5IV3zGb1xHwuTDalf
         SnPwwSYyEZq6hVpKPiCdmpmKqTNGrLCAHrb2dtM0FfPEUjJ6l/2fyfzwry1xvMUsyyWQ
         dGdw==
X-Forwarded-Encrypted: i=1; AFNElJ8FyDd7QPmfKTRKVbEAoYmS90Co86huYiMoA1OuaDpz+FC51PvWbY4dsFOeVDdTzm1I4/gk5WHIBTENLVD7+X/E@lists.infradead.org
X-Gm-Message-State: AOJu0YzGIaY46kj9vpSdTvXK1zGZzBJ/3GKl3KU2mFdqtu7QFWHqxKjs
	6+hh1iEs+y4UvWIjgL10HaUXXOS5CozgHZShodkj4dSEQdt/ygKt7168zthN22tYdZbnwEr2Ygx
	0KYkdzA==
X-Gm-Gg: AeBDievUm9tOjl8OeQ0J4WA/2Z1aFhAUjPn1o3mJuQi9SAHR0kL1bIBly01EYNUBav6
	QRFUo5RIFqgdsx8MqQSfo5THdjPNX1qlhGw/M9fRG/m7FFjGtFUljsjCoRkhOtLKz29pVCvDKkJ
	wiQh6+RLoNIpZycBKFXN1YOXI20nl8/3elUY8ULMrzF7aygtba23fGy6Q3vRMR5rPHP8YqYr8Dr
	73wg2vLGNbh/iyFMUMAfvix4dH9Z21serHR2XhO6mI9IlT0+k8b5TAicmJPnrg/sqLcpCtCiZX2
	0/mGD2r/fPzwUmdnxkU92Kc75TjCpjhBac7sMjogX8AmmwUbCvCaUjffQ82MhBI5Tg6mxjqj/UB
	VnSggF2IVZYVShU3STNieHKj6VVkOHM31W4tNyxmN1bvxeR5tKZNs7To+0X1tmpCaJz9Oh2ltNd
	6iiyXTlp/SIMANVy8ndxv3oFHvNd8+WQ+RZav9zHKtKc1AD9upKt3xlZOAa4T2jDqFVJjPqjwdV
	fDlv7xuHEn/Xlp3bOvxmN2PmY1OYg==
X-Received: by 2002:a17:90b:35c3:b0:35a:189b:43db with SMTP id 98e67ed59e1d1-36491fbf094mr6917809a91.4.1777448497660;
        Wed, 29 Apr 2026 00:41:37 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:e49b:67f9:cdcb:8366])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a439248fsm1341528a91.9.2026.04.29.00.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:41:37 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 3/6] regulator: dt-bindings: mt6359: Deprecate bogus vcn33_[12]_* split regulators
Date: Wed, 29 Apr 2026 15:41:09 +0800
Message-ID: <20260429074113.3720271-4-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260429074113.3720271-1-wenst@chromium.org>
References: <20260429074113.3720271-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_004138_572648_7C87EF57 
X-CRM114-Status: GOOD (  12.91  )
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

vcn33_[12]_bt and vcn33_[12]_wifi refer to the same output. There are
two enable bits in the registers so that BT and WiFi drivers can toggle
them separately without any coordination. If either bit is set, then the
regulator output is enabled.

Deprecate the existing regulators, and add proper regulators matching
the outputs: vcn33_1 and vcn33_2.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- deprecate the bogus regulators and add proper ones, instead of
  removing one and keeping the other

 .../bindings/regulator/mt6359-regulator.yaml          | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
index ac925334ae83..eb62d6a0355d 100644
--- a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
@@ -30,7 +30,7 @@ patternProperties:
     $ref: regulator.yaml#
     unevaluatedProperties: false
 
-  "^ldo_vcn(18|13|33_1_bt|13_1_wifi|33_2_bt|33_2_wifi)$":
+  "^ldo_vcn(18|13|33_[12])$":
     type: object
     $ref: regulator.yaml#
     unevaluatedProperties: false
@@ -55,6 +55,15 @@ patternProperties:
     $ref: regulator.yaml#
     unevaluatedProperties: false
 
+  "^ldo_vcn33_[12]_(bt|wifi)":
+    type: object
+    $ref: regulator.yaml#
+    description:
+      vcn33_[12]_(bt|wifi) are incorrect representations.
+      Use vcn33_[12] instead.
+    deprecated: true
+    unevaluatedProperties: false
+
 additionalProperties: false
 
 examples:
-- 
2.54.0.545.g6539524ca2-goog


