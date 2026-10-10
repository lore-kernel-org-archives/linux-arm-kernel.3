Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D2ECA9EBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 11:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9iDEeSRYepWdUPmgZSkaxaPn0y4xYgwY4k/M0MT4wvc=; b=aqlDMf5S68nO0edFZ4r0rkGvdv
	ilxwp3nqkOCoHA3peii7VhykUSdZsXqXJykFD/iURp26T7pg9hGKfC156bgZHXx2Iawx2J3DvI6fy
	FgRZMppkAJ1G9YEZyCVATeo+vmOLyQ/oI3ViFj/Ynq4dC7fh+i+n4iSo9Gyx1yRDExE+FixDnN0bg
	9FW6tM9O3z6yKPFC5DzoZymGFozP/gcWotuaexm6LwCu474udeJVzDQVM6e8NgLXDwUx+eqsLE7Ix
	Flb82zfbGtcHjfDlke1/Ek/yeXHA3lpjXEWEBQQ0x5bCUmkOfO2IRLjHrgpSWl2f3KTFNukoa6gJi
	fpiaJoBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFUnH-00000007s54-2A8X;
	Sat, 10 Oct 2026 10:59:11 +0000
Received: from mail-wm1-f43.google.com ([209.85.128.43])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFUnC-00000007rzi-3Mve
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 10:59:08 +0000
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so4459505e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 03:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791629945; x=1792234745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9iDEeSRYepWdUPmgZSkaxaPn0y4xYgwY4k/M0MT4wvc=;
        b=J31lsxvfmfTadA0LvTsd3DY9Sss1BmpCnKLpuEMh3k4R+7qppnmCY4scb628nFZDEE
         VGCosuLLcWhp8BYbkw60XXZpBWyOS/MgnIy3S/+pBdMq9QEQmPu/2oxCVYggjsMUleff
         SrUCZhT5EDxQSpfGSQ5r27dpb8ipzrNoAPCv5BBfudsu7IbuHS6GOyAFv7yu/bdsMzs2
         bK9fZB2BQtHXiM51VUGWlsuplEaCJTvmbCsDBHX9Czv7W2r+nESzZdHIt6tt5HZ9Qpo1
         neZaq/1b4UYgVYIGMQISXIxEeFM7MQnaC7K8xPVglDBUWB08PCD/winRgFC2ttOQJ5oP
         8n7w==
X-Forwarded-Encrypted: i=1; AKwUvByvwHGceY6lGdCMBo5HnGl9HD0xiBWznKGppfq2MS7lZXRIgHg9qw4J+cRFIs83MbA9bpKQyKGyBY3XXYZxX/yH@lists.infradead.org
X-Gm-Message-State: AFq9FYJzrDx48H6iRENcyMtlk4UGZV36LLR9eVk7IR4ZjYpLlCKv1wYh
	4WudrXSLLMdrSkImYWwq7dkxvjuNNQNhnnPIq75u+AxbmGixLsUhcc76
X-Gm-Gg: AYBFou2BAOrinNd5lDbU3WIHJpf52mAlEKT8pl657m8skV+rPPCyt6Slw35Oj4Szc+o
	OKLMLgZEG9/vsLAgUN5Bf3zVvp4HptaUtOg1N0QlB7SWxf7b7c+1z7hlbG6lrO8+GRIumCyfqas
	TZSzI00hzjvs3cQ7vqijU/iuiarqAgR1BGUHnq7A19szh4lGnCi8eU0WeCO8sN3rW/Po3u6svVm
	c4cACdoROWGhXdZCbW26p0p/jl1hSmd2M2FfIE4GpJ3Nf53Yn9QeKASAOOIzMzomitqE/PFSNqV
	ytEnZYN1qGcrTlV07n5E/QAofayEmbmfSf7H7sf6OQXQ8Nr7NKOuHThxVzbQj7YkATkqcInRV6f
	soKeLdE1G1BIO8QHYdzHOMXOrxFq1yifc0RYaK+0oE3xfnvMaj767tuepkcFTK/sdYFADa/uVHm
	2hvG66Ky8xUZxy7cH8yStr9p7r4/4btGhAj1QlpNFPh7rSy+ECyYZqszHXBCw13ibX4yMKhfmgc
	zkMx60MXC8HK8smOtO3dOePQog1dQJrOUcbCK5PjKFY1uw=
X-Received: by 2002:a05:600c:3e14:b0:49e:6c11:c4fc with SMTP id 5b1f17b1804b1-4a18e49316dmr71091115e9.7.1791629944857;
        Sat, 10 Oct 2026 03:59:04 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ae17e9sm8709526f8f.57.2026.10.10.03.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:59:03 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/8] dt-bindings: net: amlogic,meson-dwmac: list the compatible combinations
Date: Sat, 10 Oct 2026 11:58:53 +0100
Message-ID: <20261010105900.247342-2-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261010105900.247342-1-tanure@linux.com>
References: <20261010105900.247342-1-tanure@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_035906_857874_AF32876E 
X-CRM114-Status: GOOD (  11.89  )
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

The compatible property only checks that the first entry is an Amlogic
name and that "snps,dwmac" or "snps,dwmac-3.70a" appears somewhere in
the list. It cannot express which fallbacks each SoC takes, so a SoC
built on a different Synopsys core cannot be added without loosening
the check for every other one.

List the combinations the device trees actually use: Meson6 and
Meson8m2 fall back to "snps,dwmac" alone, the others also name the
3.70a core. The example used a two-entry form no device tree has, so
give it the Meson GXBB combination.

Assisted-by: LLM
Suggested-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../bindings/net/amlogic,meson-dwmac.yaml     | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 5c91716d1f21..90ef79161ab1 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -129,20 +129,20 @@ allOf:
 
 properties:
   compatible:
-    additionalItems: true
-    maxItems: 3
-    items:
-      - enum:
-          - amlogic,meson6-dwmac
-          - amlogic,meson8b-dwmac
-          - amlogic,meson8m2-dwmac
-          - amlogic,meson-gxbb-dwmac
-          - amlogic,meson-axg-dwmac
-          - amlogic,meson-g12a-dwmac
-    contains:
-      enum:
-        - snps,dwmac-3.70a
-        - snps,dwmac
+    oneOf:
+      - items:
+          - enum:
+              - amlogic,meson8b-dwmac
+              - amlogic,meson-gxbb-dwmac
+              - amlogic,meson-axg-dwmac
+              - amlogic,meson-g12a-dwmac
+          - const: snps,dwmac-3.70a
+          - const: snps,dwmac
+      - items:
+          - enum:
+              - amlogic,meson6-dwmac
+              - amlogic,meson8m2-dwmac
+          - const: snps,dwmac
 
   reg:
     items:
@@ -172,7 +172,7 @@ unevaluatedProperties: false
 examples:
   - |
     ethmac: ethernet@c9410000 {
-        compatible = "amlogic,meson-gxbb-dwmac", "snps,dwmac";
+        compatible = "amlogic,meson-gxbb-dwmac", "snps,dwmac-3.70a", "snps,dwmac";
         reg = <0xc9410000 0x10000>, <0xc8834540 0x8>;
         interrupts = <8>;
         interrupt-names = "macirq";
-- 
2.56.0


