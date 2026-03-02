Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE503D58E48
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 02:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5OSdZggynsJBsU/qtiL9Wji3B58q5QjoIHphGlxLwaA=; b=qbAC4ZyFJtoXY9pmx4XAgLG+43
	/hnIIQ/nGmHaEQ2ZXK6/JVEKU/M2suVqqN94wTcHRkwWpL118biNMPhdjo/IX10ujYbk4+DvCpJAS
	EObaAYqYxOwcpyNaBcoQXkx2B8DKZe+4y5+q40MVbIuoaK1S34dN3nRTpnbNbvJntoEYGI+RKnCjm
	jUOTTxs3n8HnBdp/FAXhNGJd243DNhh39ziZjdNkIDI9hzlKmk115feg0hWV/9pYdTn+oDZK2UuHc
	Pr1G0PbeNUjaA/0KyTmEOnCKTNYp44lLhng+wxsrm8O/uqwHAYKq5MEMC8NrgmgT5OuCP7opeG4Oy
	veUXLKzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwsk5-0000000C6J5-3X1j;
	Mon, 02 Mar 2026 02:10:44 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwsk2-0000000C6GZ-1zsf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 02:10:40 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4836f363ad2so46732675e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 18:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772417437; x=1773022237; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5OSdZggynsJBsU/qtiL9Wji3B58q5QjoIHphGlxLwaA=;
        b=JiigwxWiAPisf2Rb53e897aVVQ9d/oD7fx9S17w2jvptbs8byTL0WuoLqFoo4LbUx9
         /mG9hML6arlCWMmKYDWsGnQ+LyrUHA/I0H5kqT0DkOQSV5wxmHp63C095XaK1xgF+e0q
         meZi/xDKcDZAt/EMrLWP100FLpOu++tBQfz+0eKyXMv0ECgQyCdz8WhIIjYRnhqwdeXy
         Iqzx/+E7jiDv1acdDuOAx18vSgmFnFJFDuDltw2DMhG5qbl59UU5VuE+G4zF21SlyDtd
         Oygfgyo6UFvxUbQ3Y0Mfc+pnbn9atixp0ECCPhLfmd00B/rwc1I322I9iES0FdxnfwhG
         zwcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772417437; x=1773022237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5OSdZggynsJBsU/qtiL9Wji3B58q5QjoIHphGlxLwaA=;
        b=AsRNF4zjb0QRR0dlAEQV5veJHt5M2MYtzKAYiELF5FD9OmAxjMEK7Rw9qRjgE4U7Tm
         4QhpzEroIv9nL7xwTjlQm9w+R2ttYHUE3prFwx+koWT59hBuy/hVFA8/p/RbSVKnhqov
         d23bSjKaQwhyIlf1Ioi9tFBtUpWnjs3UxCK23enl6UJ03+AeTbkGZJaJpBHxGgh/t+Tw
         FC1vS4r0W0Ifr/Pa7DeXgaVwce2FXKnffViCOTPH0Yz4LhQGKbtTj7oIM8eMBHACb/pK
         c73Um8Ja5PmqAc3P10kJAtt0hzz7l4zzhsK8cglLHF5IMqWFQKaLn+whiAAOR85LX2bw
         A6LA==
X-Forwarded-Encrypted: i=1; AJvYcCXq2yhRFpyIMsnp8BBzTYWp+KZcvW47g9aA44g//xx6L0JVdyfEBsaDDZXk2QM8lUdTor/G/5AsUYVWD7jA6DAW@lists.infradead.org
X-Gm-Message-State: AOJu0YziCZ7JR9H/JntNstz95gPu47Mh7gglVPq6Ih5qaltR8FXqRvk7
	IB+LobdyfmY4hV1TDGlMP3+arAoSWBUl62fvVX8ODmnn8/ntxXJ0Q8b2
X-Gm-Gg: ATEYQzzHI6nw6dQmVL7K+KBZl32c/IcNstRzTCyDAoY6bLKRhMsyR7M8AlzYuwawxpb
	FP4vjG8cufb22jlI+JD34ncwmMlPonkZtNvSXtJS7WO24xISUU1B6LfQhVoNFO++u3uVY2CVg0k
	RT+MEn4cpEK4jyvpRb+1MNXmMDLjHftz2LK7pUgTCMnCy0Minf+lKkNN6qefXfP1YJQlTbMzWZT
	+1PlFZnrxlhEupQcRAvlN/A0FDFOqO1jveIWhDKUrVL+Z5dDB5skIAOTwWeO+c9tuKKkaglb3ft
	HXE8Mb/X3c0WRYXAwo86joN7VEAqAnOl9mIFC9S+uLVUr/L0+bwcsd66orKc80D1Lyt9RqZOsgf
	arNo6na7i6VaLIq1ZrrAlSqPZW0iZHqoLrMrMTMs5hXVVAKeq1b+S4sTKIw20eV5O0lKRFs3Mcs
	4aaqiBFXuA+Ug3w1HvrCMl
X-Received: by 2002:a05:600c:c490:b0:480:20f1:7abd with SMTP id 5b1f17b1804b1-483c9c204b0mr180073705e9.31.1772417436800;
        Sun, 01 Mar 2026 18:10:36 -0800 (PST)
Received: from arch.localdomain ([2409:8a28:a55:9af1::1002])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcb9b97sm194451105e9.7.2026.03.01.18.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 18:10:36 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	mripard@kernel.org,
	andre.przywara@arm.com,
	Jun Yan <jerrysteve1101@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 2/3] dt-bindings: arm: sunxi: Add TaiqiCat (TQC) A01
Date: Mon,  2 Mar 2026 10:09:55 +0800
Message-ID: <20260302020956.96424-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302020956.96424-1-jerrysteve1101@gmail.com>
References: <20260302020956.96424-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_181039_017368_B5931233 
X-CRM114-Status: UNSURE (   9.66  )
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

TaiqiCat (TQC) A01 is a set-top box powered by an Allwinner H6 SoC,
equipped with an AXP305 PMIC, 1GB LPDDR3 RAM, 8GB eMMC, an AP6212
WiFi/BT combo module, one 100M Ethernet port, one USB 3.0 Type-A port,
one USB 2.0 Type-A port, one Micro USB port, HDMI, SPDIF, Micro-SD, and
infrared input.

It is a blockchain-based terminal product launched by UQSoft
(Beijing UQSoft Interactive Technology Co., Ltd.), a wholly-owned
subsidiary of Ultrapower. Its dedicated product homepage[1] was once
hosted on Ultrapower’s official website[2].

It should be noted that UQSoft's official website[3] is no longer
operational, and the company appears to have been discontinued.

[1] https://web.archive.org/web/20190409213228/https://tq.ultrapower.com.cn/product.html
[2] https://www.ultrapower.com.cn
[3] http://www.uqsoft.com

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 9e4627f97d7e..e6443c266fa1 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -901,6 +901,11 @@ properties:
           - const: allwinner,sl631
           - const: allwinner,sun8i-v3
 
+      - description: TaiqiCat A01
+        items:
+          - const: ultrapower,taiqicat-a01
+          - const: allwinner,sun50i-h6
+
       - description: Tanix TX1
         items:
           - const: oranth,tanix-tx1
-- 
2.53.0


