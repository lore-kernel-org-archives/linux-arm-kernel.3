Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB74CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 20:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QEoinIILiTKHyRPgP5StMa4pYa/MZMpin1k/LVPTO6Q=; b=kL/UkS0Jhva5RmtVvjQAAtqtxm
	3jMHjj94QLNffsH/wsdNXXvez3BJt3/fRWCfHxBbcKLvEO+p3uR2gsjtxOF8UJOXd8ixWdmglVQXP
	2QHi8ZmLVhg5+6Aof13MYpuS8HomebQ/Zm3Vv8ybXsan7nqfx2F9AHv/GiLQv4pX/f9Q2K92T/mQV
	frUH34S+XVf66wuYm3vp67mJLEiCL4Q1sFgYhwPmo9LG7HaTxxi/lTStJBfqwheaBu7sG/9CxgYxw
	dIYvHtg08cGeAIsSVV5Zn9tnsWFt5f3ZAVL+CmvQOcxJjzLSJ9961mu7XAAGCASFJh4+FPyMUiksQ
	AAlJUpsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfOJF-00000005TJp-3AyF;
	Thu, 02 Jul 2026 20:46:57 +0000
Received: from mail-pj2-x03.google.com ([2607:f8b0:4864:39::3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfOJA-00000005TG1-2Spb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 20:46:56 +0000
Received: by mail-pj2-x03.google.com with SMTP id d9443c01a7336-2cac82afba7so2493625ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 13:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783025212; x=1783630012; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEoinIILiTKHyRPgP5StMa4pYa/MZMpin1k/LVPTO6Q=;
        b=ZzhgBEqrNvpdlJHZLr8c785+ArZK1XHHWvn9nZoJtisj1GuTH311VwSCxREKlKwNAX
         h3pNm65ou3xCIQMie6dOnoPqEOgA4qTLP0vXwaje0LylBTLhyMvOrjzc+skNFeN0MmZx
         Z6QBiq8x4brrOc/4YFo+xa+f/PII2FF+WKZBHO9gF2GHEjFg5APBQqmrhTmd66AIUlfV
         bkBS5GCxXfqqvpaVfXOarXDVSWEWQXU7pagJKG6NZ6+eBFh7lzF4jOe/HDgARWnKEiP6
         Wo57QjB+C53pKaHFe3gv64FzOSdR3sktA6O/wmu+8vnOMsxunBbNlGEeuswBQ44Eup0/
         f3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783025212; x=1783630012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QEoinIILiTKHyRPgP5StMa4pYa/MZMpin1k/LVPTO6Q=;
        b=fHqrhmUchDbcBcyt2ff40Pj2jsmU1/BSz8k/Qb3SchvJcYu0Z50LIPlP3ZOVkPWXeW
         BtuemLus8KCkU6/iQTtyeODIATLXGaGVc+hxAdWZiclWd+81CP9rip44nETWn1gfVYL6
         lQHhfydnwwQQdaVjY9e3mPT9Hly/JYoqkPXHWpcJB3cAGffiFp6oEbtf3lBl6l8bvrNK
         kQLPf7MfnXyh2/SsxHDMlWumTKUtxgY6BbaQpYtlo8Z8+wLZu1RMaDtpXrHR+0Bw0Wih
         bI47MxzHVMPpUy0jfp3L2Z8ihoTEGHqIvnmeaLKyaLEtDcy5LkcFl+tUA33v42YROXly
         ZQ+g==
X-Forwarded-Encrypted: i=1; AHgh+RoVigQCt9eRZCd0CQAa37lb8z+0X+CeAlZd3UiiiqYE7SvQ1p+1WLWROmDCJImmmgaZFY8ZKgUnIMCsSnI3HVrp@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5JkBkBYu+Fld2h4/ZMMKBCV9WGGkoFbmSi5CeZIErwv/EXlOZ
	l6NU/vSIy8xChvELegAEkNHpPpzJOdNMqqqV2pGSM9LCtaUjiZ/yla2g
X-Gm-Gg: AfdE7cnQT1kt9bY4zOVQVTC/9JwlO/KcOQmsSejnL2nd+b/csyufr5aursR36+YN8IG
	ovTmn0QPlrGVmIP0+YnTkuwnkeCmKei3CR6zaPxXMXdgLKdRyxFWyjxxvXkBVzHh6EmBDTi3qZE
	Wb4r5Eqr6N+L87Q5vNStSUfR87NmLy+9aaUY11/YfK/MFRtmPjLfPuy/r9mDQsXbg/+hwlFg045
	iERVIiMmmmqFakd8c4qgLKoIwUEDH8O8yF3WU5cPW51r/02zBMAdH2SUQ08i7saDOoIUDB5uhDF
	52FpR8TLlI670AUjWLa1/JHOv9Gje3cv5dWBC0K+LqvT+Lbm1zMQC2l9pfpLDvwAoiTEuHWK3bv
	4oSj8naJ7Lv3gxv16+cQC2YDvl7O/cFTCAB9ChbnqBDIm2W8674H2YHjsOfMjjDuxBCbglK3OzG
	pUg24Ixih24xI=
X-Received: by 2002:a17:903:19eb:b0:2ca:1479:d9dc with SMTP id d9443c01a7336-2ca7e739bfamr80838845ad.12.1783025211663;
        Thu, 02 Jul 2026 13:46:51 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a9004c1sm18654065ad.21.2026.07.02.13.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 13:46:51 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 2/3] dt-bindings: arm: rockchip: Add Graperain G3568 series
Date: Fri,  3 Jul 2026 04:46:28 +0800
Message-ID: <20260702204628.2407308-4-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260702204628.2407308-2-coiaprant@gmail.com>
References: <20260702204628.2407308-2-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_134652_630820_E14120EB 
X-CRM114-Status: UNSURE (   9.93  )
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

Document the Graperain G3568 v2, which is a development board based on
the Rockchip RK3568 SoC.

Graperain G3568 series also have an SBC series with the suffix "box".

Graperain G3568 v2 belongs to development board series, not SBC series.

Link: https://www.graperain.cn/RK3568/RK3568-Development/ (China)
Link: https://www.graperain.com/ARM-Embedded-RK3568-Development-Board/ (Global)
Link: https://image.chukouplus.com/upload/C_153/product_file/20211022/6daddec9e400458816dd4c57ba807fc3.pdf

Signed-off-by: Coia Prant <coiaprant@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d0..9eb2f66ba3856 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -684,6 +684,12 @@ properties:
           - const: google,veyron
           - const: rockchip,rk3288
 
+      - description: Graperain G3568 series board
+        items:
+          - enum:
+              - graperain,g3568-v2
+          - const: rockchip,rk3568
+
       - description: H96 Max V58 TV Box
         items:
           - const: haochuangyi,h96-max-v58
-- 
2.47.3


