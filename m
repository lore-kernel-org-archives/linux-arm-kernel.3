Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 182E61093181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 07:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YEgOavc24y3yXgmY3844+Rp4FHSMH9wftfFqZIYfiP8=; b=YSZikV3n4tn/Gq7YcvcEfOQ6O3
	gXNCN0QMHD/cmjBR7bcoLZAAKk6CaweqIb+ChgDQ1wXE6loCjFJuQVFSNMHl/KFyPMkmOtgAI5USq
	G87/fDQU2kGCmxiSAXagvWudxpJRsEcOk2pK3CwzmzVZz2Y0l7X8MX3KtTSn1lcOrh/oJ1vS+VJog
	d/6bdF6D9epDjePkuOSwPCPOlc4hlwvwxzk48/Hoi2E6sxR1CqXB+FNfTkj8o0+jkpQYwOHkKv+/L
	3gZzg0JqyO1cQ0o5n27NeCMleqDUOnVFuxpHazpypI8R7iRmqxYux7vb5bQYj4wVeOR/nr7iTRwVv
	35nzBujQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3UCX-0000000CF1g-05IT;
	Fri, 20 Mar 2026 07:23:21 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3UCR-0000000CExm-2nmp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 07:23:17 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2ad617d5b80so10789385ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 00:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773991395; x=1774596195; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YEgOavc24y3yXgmY3844+Rp4FHSMH9wftfFqZIYfiP8=;
        b=iKY+bPCmcU/gpUbziMwvAj0eA1x0t14xyFok32K7P9sYxmNyWkBbIBMbaWdEqNL+EU
         JxZ3enobiSCapNSktUrd61MZjTMfMYB6ZSKwW9HG3kqJSqapq+AbQ6zErmNLkIuuHKY7
         1HVjP7XBzuFkZn3scVQOck+4E/nLaCdQJHqvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773991395; x=1774596195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YEgOavc24y3yXgmY3844+Rp4FHSMH9wftfFqZIYfiP8=;
        b=D/+02xdu+JKZsLGcAxu1rN8+IzlNicm4Zj+B52NbzmjrD0eYOJeuiifWhORfaVhSFa
         sfcM9SUqrIdc+GmT0ilI9eaPzL/a+KRMD2g6+ndHJExBAneVh47mLfgA4rydQhMtm5ld
         OCeghHhGYqf/NRwJiZyJPwyYZR1+1euUIZfVRbPLtyTGEuEhhyc76U9eEtBU0K1iCloQ
         mewt/Xob0EIZnolLtre9oRZBajVbqtLhGKp713Y2xww//it1XnZqG4Q6m6NDp0sCA1oQ
         /Kl+CxwjMWDBaPFwJza7fuhdxDTCqemGYrz72VO/RH4O0wqGqaduiPYpySI1apaT26H9
         fXDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDYUhkNEMUvA/uNgQmCYyaFa7kzw1qc5d/AEJ/qnJgcB7YD1Aiy+L/a557uxG38oiZI9DmULoe1dAoeCbPvOXm@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4HXJm0yRZUJFV3NTttkL04ZDrGWv5Tm30MBlGZt5R1ZCT2Z/5
	TWlKRVHMC8PL5io3MsBGzJ9ENNpPckBqdQrOtkS5D509F/WQNLsRdPLGWFdDtMoCww==
X-Gm-Gg: ATEYQzzl1C7ShVq/wW7OzrdBHqTF3yk0d9H4M2tIgxuzN4cmOSdlwW0RwWsNt113EU7
	MjXdeHzgBfWKpHKXhNwg7QTyJ8WYcJsnZJf2XdgYYjHI0SQXx4jptfeK8sjNNjEpZ4GVIVuTYmK
	Pz11iDcbuhN7bBPxdY7LFihrRauutttyT5KZ9YdVFQeJ2VtT3nvDVgmP1Tj0qWfbHgbOEuoRepE
	+j8U/aJOthr0bFYFoATeogrC5kN094PBcMtjsy5Px6zucGI6Tc9osr6z4/C5UlFGKHA1StjhXhV
	d/THsE4vGZkMzvgQYlS1ka2iD8raHBnb6pOhrMxk3QlpHP0nRYytS1QDkVMB0U1Qw+2il+0Gt5+
	gF6wyT2zrChzRX7GNPO+lBSNxLl+jpe9ROVm2vyAAPFvSl7JI/f94rq9XZozv3JtDKci8LUoXET
	pw/QFWxuZG7A6ItYfDxWohNiepONdJVu0IJvcOL4dma0aXPCeilZKbMIhl/hDwGSa+y2B2pUUgA
	qmFbFBO
X-Received: by 2002:a17:902:f690:b0:2ae:803e:6c0d with SMTP id d9443c01a7336-2b082764904mr20104645ad.19.1773991394782;
        Fri, 20 Mar 2026 00:23:14 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516b96sm16728365ad.7.2026.03.20.00.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 00:23:14 -0700 (PDT)
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
Subject: [PATCH 1/2] regulator: dt-bindings: mt6315: Add regulator supplies
Date: Fri, 20 Mar 2026 15:23:00 +0800
Message-ID: <20260320072302.2402489-2-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260320072302.2402489-1-wenst@chromium.org>
References: <20260320072302.2402489-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_002315_711703_2FF1FB6C 
X-CRM114-Status: GOOD (  11.08  )
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

The MT6315 family of PMICs has 4 buck regulators. Each regulator has a
separate supply.

Add these supplies to the device tree binding.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../bindings/regulator/mt6315-regulator.yaml        | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
index fa6743bb269d..ba99a0d02bc7 100644
--- a/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
@@ -29,6 +29,16 @@ properties:
     type: object
     description: List of regulators and its properties
 
+    properties:
+      pvdd1-supply:
+        description: Supply for vbuck1
+      pvdd2-supply:
+        description: Supply for vbuck2
+      pvdd3-supply:
+        description: Supply for vbuck3
+      pvdd4-supply:
+        description: Supply for vbuck4
+
     patternProperties:
       "^vbuck[1-4]$":
         type: object
@@ -51,6 +61,9 @@ examples:
       reg = <0x6 0>;
 
       regulators {
+        pvdd1-supply = <&pp4200_z2>;
+        pvdd3-supply = <&pp4200_z2>;
+
         vbuck1 {
           regulator-min-microvolt = <300000>;
           regulator-max-microvolt = <1193750>;
-- 
2.53.0.959.g497ff81fa9-goog


