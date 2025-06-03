Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F1BAC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 12:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vXr8fPf00egmatGOKDz34aDKcgEmfMhnXVj1rBpajmU=; b=w/gnSbebMeOoR7hodrn8FL/lMZ
	inLEyy/J9G+bf57uh2csoCPCIOmJy1eFBtHU6tNMKjsznRKfC9x0ODFL5wL6A++dYsQKHGyYYGND3
	qjyFPYU+XpeEJQgGIEg7m6KSNZHVLMa02p3UctTOUStGbCXoI64RyU0p2z7dggx8HaSd4/E8fX/gL
	anlcOZoo9ftXLmK156dmU2WKuG6k0qiYPeENTsQG/H2nmzD2moXPh/lKGqzyz+PZ7DEfjK8BcXA8t
	ieJXDmBGNRyF2l4ygRuq2WqrqGL7lLeH6SF29edeNsRjf320C6bgYIzz240xExkuK/XT/Qt97+Qrh
	+HY+WIUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMQTr-0000000AtCU-25Vu;
	Tue, 03 Jun 2025 12:10:59 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMQGu-0000000ArVz-1gYu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 11:57:37 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-451d41e19d0so2664825e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 04:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748951855; x=1749556655; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vXr8fPf00egmatGOKDz34aDKcgEmfMhnXVj1rBpajmU=;
        b=g0AAViyzDIz4mf1yWyJNQESusW5miZtMP8D5gE04ViDnAXKIbeR2jwlyA+fGp6JSYm
         dPc076cZZFHUswqlgWF9HnviBJCuS9vo45/S0OyOiQTd8bmNlq2iTGZQJEDrznkM/KSd
         gnt4/TH5pjyvejt+oRqVkIRo+v4Cm89+yXzEI7O6fbW/64/mb11UocHKVFG5cfZFCHWn
         YCTm+KcW4vX/ugXNGxe3WUUA+Wkf0dyY0ccPtkRgshf8kA+wTpgiZD1aIBIiVzemqTbX
         h4Zd7cpp77DPWZFCTHp13/A54gIj5wiNSfStxly4HkVXGEvq6LVmojVHrVrITni/Yvbe
         fEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748951855; x=1749556655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vXr8fPf00egmatGOKDz34aDKcgEmfMhnXVj1rBpajmU=;
        b=C5KjmIb1bxcCHtYGVsFlkFJXZz9ufXq9wtN8QHnHTUh2gbfltkr9tPTL/utKGiEg5T
         gG1kQE3Zpo6BbFioG5OH39VFGYF05LwD8lM7UpA9OCtuXL2TEgFMvn/vutwK6+/LS1oU
         XGHGJmcaNpSQ1ggzEjTvThshCv0b7lV25uAee3gLyvKvxDhg7f+Tn86+lR23DKHri0gD
         HbDYtOepBREZ+NNMIAmkADUq2u2cbfdgX1saRYiWPKjimjMpBHhZjsNxSjNEYqydID4E
         9z1bo8Wwg7PlTDPpGoN/8zsB6mEUItkfuSZ+yO6KMk32H2QOCLc2+QURP7a0AY0clmJk
         pQpw==
X-Forwarded-Encrypted: i=1; AJvYcCX2cCsaW+4ajuZUlguD7rJHWDlpzglHwkeIukaPPvpLwEsQb5lMjhSjrYLon3tKNt+M/+9be5F1xyUZmiRjlzwP@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/hjuj9B7VtdYPzgBbRKYFkFKXd+uma9JZ3IXGePcULXE0E7ab
	9fc1qK2h2wSMtjwuz67xI75CXuedJ2bjoLZvgzWNp4CksvLdRDM8SIB0kvdD+KApI1A=
X-Gm-Gg: ASbGncu4NNwVaT91lyt2Ssd9dUGewlYesPaxEl4vCSIT6zHcX03mmzx16V4NAaMCG14
	KhbyjYGHfgsgHjlpg/cRsvKADl8ZZRmC9x+VmBmNG5L/8jm6xijGuDTARydo8Sg4tFM0I5+pB/P
	yodtKkSCLaigADWgluSOlXZ9U1UtRcemrw9lBydzsvETOuMhCt2if7NmHNY9HUX0msY8dlgNJoX
	W7d8N9/4ahMuJik0wh+UL4oxcKHFY4/6Kos3uv81ANZUJMhwHOn1Sa/2qRMGsA8cHoJu8LKBn/v
	0n24pf9Dhr6O0WxY0WyCzRnkEv8CmCpRYw28mzNdDnuDU7+tCpnJToh2CJ92HTjQe8OspZPfrdi
	kzIbjSSTFVV3O54/fLiNc5aFGQiAaJ8gH
X-Google-Smtp-Source: AGHT+IHc7vfZ9Jls7pqd4J6k0aCDh+rQJvsx6pfapU4HqG5Fs2nmsdWERExeMcxNl0cV1Ifa/yfWyA==
X-Received: by 2002:a05:600c:3555:b0:450:d4b4:92d0 with SMTP id 5b1f17b1804b1-451e3132b4amr12478215e9.3.1748951854649;
        Tue, 03 Jun 2025 04:57:34 -0700 (PDT)
Received: from [172.16.23.13] (adsl-84-227-104-5.adslplus.ch. [84.227.104.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c7adsm17671666f8f.26.2025.06.03.04.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 04:57:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 03 Jun 2025 13:57:12 +0200
Subject: [PATCH 5/5] dt-bindings: mailbox: Drop consumers example DTS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-dt-bindings-mailbox-cleanup-v1-5-724407563997@linaro.org>
References: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
In-Reply-To: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Nishanth Menon <nm@ti.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Suman Anna <s-anna@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, asahi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3817;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=In9ZWwzHdKPobwGSTNurFlsX8+WfCzcf4pnpnURGnOI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoPuMfcaFZwH9bb0S9dNAm40CuljsCWcpE+w7CS
 Rz+2L02tMSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaD7jHwAKCRDBN2bmhouD
 124kD/9QeML755TJwa+q6NyJCG2/dFgpT6gEYosjiRxkkcvC5kezgKst0oA8mPhfT7+68lSwqel
 wwVtZABbKsDQn/IZi1acleKCkZjAf2mI6XZNNhjl5bwSR4Sz+Vi9/NADv6xDv+mN8jZ+ICjwu9y
 tdpxGOFN791CYC4LlqwPfrxkCTXCQ7KamSyPduvwkULCeM8ELDa1xNwoHXBbgH7vObF/mJbMonF
 4hGz19dD0HFoCZ3cIf1YhezaYF2U+1Eej9MW5x1Zu/ErlISqCOlyEXiHIuhtM4JgxMTqQu62oKD
 gxaCDQ9ddIICmpY5a/OHZj5Z94FAroXzhsLc5v0j/qyopvezq47jKqztcpGsvbqY4bXBMKVnqP3
 i1wiFEQrhf1PGnJM0ZYmlPUgMXp2E8X58tgqkhBIiVxmczsp+qMpTyqSMRWJQEE203EHJ2KctRL
 CUSj+k91UZbE1qzLtVzBucvP70Yz5wh3JNr85Kjj/gg8hvDuWnn20lukNzd1xEr33C0Ar++BEgX
 n/JtchllxwY7IFYq5+5I09kqV+uLPaMgWR+h6YcYQIJXGmCn2f5ODOS2XeW5MQ4lQEafpUwpfGM
 e6A6q/4CpvTsXYxz10mwer+CW8mornr2kBt6RLRQE6QmE/+wxLyk3ilI/RzAMnM51geNFpIQnjG
 7k8TFFyHFeUL+hw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_045736_440156_5FBB3725 
X-CRM114-Status: GOOD (  11.90  )
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

Providers DTS examples should not contain consumer nodes, because they
are completely redundant, obvious (defined in common schema) and add
unnecessary bloat.  Drop consumer examples and unneeded node labels.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml       |  6 +-----
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml     |  9 +--------
 Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml | 10 +++-------
 3 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml b/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
index e1a44e4ae6f91eaa1cd81b357e9e5caeaaf0f5bb..3a387d5e4f065e6fe1bed7e402cb236f4e13ef56 100644
--- a/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
+++ b/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
@@ -108,14 +108,10 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/mailbox/tegra186-hsp.h>
 
-    hsp_top0: mailbox@3c00000 {
+    mailbox@3c00000 {
         compatible = "nvidia,tegra186-hsp";
         reg = <0x03c00000 0xa0000>;
         interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
         interrupt-names = "doorbell";
         #mbox-cells = <2>;
     };
-
-    client {
-        mboxes = <&hsp_top0 TEGRA_HSP_MBOX_TYPE_DB TEGRA_HSP_DB_MASTER_CCPLEX>;
-    };
diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index a58a018f3f7b9f8edd70d7c1bd137844ff2549df..ae28ba44855f75e83ea70ce3c670465ae145178e 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -200,7 +200,7 @@ examples:
   # Example apcs with msm8996
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-    apcs_glb: mailbox@9820000 {
+    mailbox@9820000 {
         compatible = "qcom,msm8996-apcs-hmss-global";
         reg = <0x9820000 0x1000>;
 
@@ -208,13 +208,6 @@ examples:
         #clock-cells = <0>;
     };
 
-    rpm-glink {
-        compatible = "qcom,glink-rpm";
-        interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
-        qcom,rpm-msg-ram = <&rpm_msg_ram>;
-        mboxes = <&apcs_glb 0>;
-    };
-
   # Example apcs with qcs404
   - |
     #define GCC_APSS_AHB_CLK_SRC  1
diff --git a/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
index 1a2001e58880d2fc26954b26cff8ed53e7667f33..8504ceb64806bc7e25468597acdff99624571e9f 100644
--- a/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
@@ -242,7 +242,7 @@ examples:
   - |
     /* OMAP4 */
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-    mailbox: mailbox@4a0f4000 {
+    mailbox@4a0f4000 {
         compatible = "ti,omap4-mailbox";
         reg = <0x4a0f4000 0x200>;
         interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
@@ -260,13 +260,9 @@ examples:
         };
     };
 
-    dsp {
-        mboxes = <&mailbox &mbox_dsp>;
-    };
-
   - |
     /* AM33xx */
-    mailbox1: mailbox@480c8000 {
+    mailbox@480c8000 {
         compatible = "ti,omap4-mailbox";
         reg = <0x480c8000 0x200>;
         interrupts = <77>;
@@ -283,7 +279,7 @@ examples:
 
   - |
     /* AM65x */
-    mailbox0_cluster0: mailbox@31f80000 {
+    mailbox@31f80000 {
         compatible = "ti,am654-mailbox";
         reg = <0x31f80000 0x200>;
         #mbox-cells = <1>;

-- 
2.45.2


