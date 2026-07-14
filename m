Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CF5C44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 05:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YtSd3Xc+ifVj14PL2Jkw0taP79/hnT+MmHpMwaXVGFE=; b=zYBGKDsLhi4w0Ae0ERESxITGP8
	wKWamcFRgWOGe1l+hDnZ6gaBN8yRMGGIgfho0jVxE1de+cBlTsOUZQNu3c0wppnsGUVSR919V+yAi
	JbBjbwXkbnun7ujL3CcjFqCz4tytbhbeK8XOhNqWFvSx0SYdHPQX+VJEmXA0dwHDnHGg2hY7/unFj
	UnxYb7fahJksZZ5ixjpdJkVB03lakO4hcFGwQs9cFQsOmRH22ThwS7BrV/R2vkro8CoE5LlGYeNec
	F+HqsD6ih6ROQUKqZgqNuo1TIKRLiVCr8jVmfvyO1vkGNTV7iSRvOkNTMUN3BwTUIrXm4dCz5eqao
	jjlEED2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjVnW-0000000Axc5-0SQq;
	Tue, 14 Jul 2026 05:35:14 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjVnT-0000000AxXw-1I4s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 05:35:12 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-ca7c1176317so2833583a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 22:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784007310; x=1784612110; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YtSd3Xc+ifVj14PL2Jkw0taP79/hnT+MmHpMwaXVGFE=;
        b=QwOYXI2V1R9DqBLkb2LBFR3Buo2LVm7RtoTaR0VD7i+jUoIkA5VuB8j0XxEzjf0aQ0
         z4enOTZXZIo2Lk58EDw59GpA+OcWeCFaAaSMm1ByXWqwGtz8jvAPBeZmzO/mXBbu00ti
         KEyLOp/QTxu1YD9E2r1RX50wv0aVQjOl6RKrlrAqYp6Z2+vkqimgMCH5UlQjPovCaX1w
         PvA+IAcRxyKvrobBvP+55mP1K4PFwTumLvH5mx5/uvjeajNup4jC62eDRssMUGQXCblb
         Mbss7Byit5KHUK1V80TZIFOiBSq1rdIwdhQoOdM0N6gMI0ggEcyx/1ik2Qj6eDwICLef
         npaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784007311; x=1784612111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YtSd3Xc+ifVj14PL2Jkw0taP79/hnT+MmHpMwaXVGFE=;
        b=Yi7yp6+w7bAUBdG5rV5W7pReFpu/mMq2StT5HUa9iiW7yDnRpGzfLFJbefU3Woa71Q
         nd+IQ4bD1UjS5i/FLZ1+ty3J7s8b/rCJOq0X4irRpoTh+ezuVy2gkhFzk67gxGXVhZS+
         90NoRnXDkRehc1NK2z2X26eqZOnXzKrSVRTVwIFfm5pNVzt1Knp7qIrfh28UJcsGEg4o
         wCXWEmc1QbcODEvIzlKs/85fLUUUyeTv4IsUNDdNbmetIGlDmmPqEg7mpFDVuwgzbsLq
         V+dtj6AC1ID7Bi8hDktxwBMne9bmCPrOPCalRyHkDjMXEFyPbCu3K+6gN0cG7axDz5ek
         edDg==
X-Forwarded-Encrypted: i=1; AHgh+Rridu/zbxlbYAw4ZTbq235wHdJGXnQ2ugndn45h7zmOuDDoYtys8R/e19aFKmUerlaFXe9T7LlNNecB4oKuDc8C@lists.infradead.org
X-Gm-Message-State: AOJu0YzAG4D+FFKTHaAPqXpOt/ImSXBYLWznknkcsLaTaE+bomKWt439
	6JvTbtFQ0ymqFzdgzQ6HKDTQXtuQOCnjWoavutboHi4FanYolZjHvYdx
X-Gm-Gg: AfdE7cnYiYUhvbkRybBJuFEsweGAaX2q5MJITx4W8OxIDj24BYrx75HtZuqD7Jk1kWF
	Ii9rSFB/aA/LAnXD2QOsAO6+OOBjKo3EMTRSjnAB3RLvTQ+bh99HTni1XnpNEngjw/14dn3O+ai
	E/RFuvmMkJST2W8ex5/VXvn0jeIHC9T5J+oXu7/xQIVV1IT6N8hpmKejC4CtrKSgCK5VrUNSg6h
	Pul3038iZS6PL84+lcOfq/1uRUmSe1UewNym+M8VSQkbJQhoh0cOlCaCOKPW0ZEPL5P2BId7pG7
	qKycixJiJDMYXO6mzXk5gpIBe3vW9e85N0GTiWuSjbT5wuGJimXEWRhlPlZnltdUu9G7sOhf9Qe
	UMru5Ftnkfzwlp9rexuRSqFCR+/bT5jEdpTJ4B56CAksc8oJS8nmIE4/tin5iv/BQVu58ZJa0Qx
	g3ofz9/149WZaIo6kWIwRP
X-Received: by 2002:a05:6a21:9f17:b0:3c0:9c19:65c4 with SMTP id adf61e73a8af0-3c110aaff03mr14840300637.76.1784007310615;
        Mon, 13 Jul 2026 22:35:10 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm131882715c88.14.2026.07.13.22.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 22:35:10 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: heiko@sntech.de,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v3 2/3] dt-bindings: arm: rockchip: Add Vicharak Vaaman2
Date: Tue, 14 Jul 2026 11:04:41 +0530
Message-ID: <20260714053442.265587-5-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260714053442.265587-1-hrushirajg23@gmail.com>
References: <20260714053442.265587-1-hrushirajg23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_223511_343896_56391543 
X-CRM114-Status: UNSURE (   9.87  )
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

Add device tree binding documentation for the Vicharak Vaaman2,
a single-board computer based on the Rockchip RK3588 SoC.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index b023d4cc9842..b5a43fd5e546 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1311,6 +1311,11 @@ properties:
           - const: vicharak,axon
           - const: rockchip,rk3588
 
+      - description: Vicharak Vaaman2
+        items:
+          - const: vicharak,vaaman2
+          - const: rockchip,rk3588
+
       - description: WolfVision PF5 mainboard
         items:
           - const: wolfvision,rk3568-pf5
-- 
2.47.3


