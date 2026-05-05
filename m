Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C763CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 10:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OCkbLWM0T7ihDsfGf8HM6rffZAvlpjoVa/cZRXt588I=; b=pyXR2l8sg/NLzFrn7X2Wz9Cbcq
	qGxqAnVnvHVs6YAf559sxnr+uAggXUJLr4QivF0/SLcDkkDJCBehIIdsqfk6tv8BzeB9yC8P0Km3x
	zwOMtHAeHlPIBP7kU67bTcR2umvesNDcN+KWXgn4E6/c9mK14WDAvo/63xPsUEKtf4YUJpZitNNyY
	nohWa4v1nBH7Nvw4BJm/IwzhzVzj6tiShjiaG/RmQgMIRE4/bXVD0UmU4vOqJsfa58RiV/X8PJCam
	Yxx5DOij9iJ2aEgrf1ktrjTaJgq+5UpmOlBni1yqS6VCqVjb9bkNchd9NT9x53icz3uqSV7b+4cxo
	6PeRniow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnz-0000000FrcW-37rF;
	Tue, 05 May 2026 10:15:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCny-0000000FrZT-3ayg
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 May 2026 10:15:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=OCkbLWM0T7ihDsfGf8HM6rffZAvlpjoVa/cZRXt588I=; b=mw2qN+WqdE62Z2mYvnJpzXSBRl
	o8rILchqSK6D8uaZtv2zZr7hCfBqnLbqHumw/OY9qSf/nj4xeEPTqoLmy82HtOoUZ2f1YHY3tXOF2
	zOB5/BTt/SjDOGudgyemEEVZXi0Z3ESAKXwNa9uSRAoDBWw+uYSAUljSgGBGa8dtRqf86vcIcloHO
	LO0kb8tCFkou6GidnJZ9eJwJl1wRmI9mRCXDmig1023QH7Bk/H5tI4ji2m6CvCaQEdeMLnIOtLZhM
	WYk4ErX7FbEZqQSnO+HFg2+r0KFeb1ayYpX3YgoYAiI8DH3kC4xiAWpu7WDvXt/GsntDa7PuFvyZP
	0kPUjtNw==;
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnv-0000000D9jA-3622
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 10:15:05 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-c8026aa4d53so1491905a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 03:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976102; x=1778580902; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OCkbLWM0T7ihDsfGf8HM6rffZAvlpjoVa/cZRXt588I=;
        b=gyw6UPzhzyhvVdn5qoShOBYW9xKVsmjh4wMvZQOe04JQ+fpjz3sQvNNoBE3+t/1rvS
         nvZnzFia3OfA6CBHyxo32/lNeKW2mj0u8IJuh9HKSCWj8OyvjwAIVYgz2zgVJxgyy5Y7
         8kDz/txGEYkiCJ7FhP8sgI/F9+JLvJHMhtLbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976102; x=1778580902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OCkbLWM0T7ihDsfGf8HM6rffZAvlpjoVa/cZRXt588I=;
        b=cT9JRUXefv/sGr6HtSHSq3+N2AkhYdnbNsdR8ymA1Jg8pLAZwDEdGp25gsKl3LUalF
         YQa+kCwezOb/AlQ6BfTzBhx9sR7a5it1bfp1QFve5zMpz2CWbsBEZ8Y9RaWmjYAiRizD
         NHnsraQ5YuW4MzlHBcm67NBuw6QZrUfhG8b0Gi9XgjaihObY0qPQ20a+gpsYugWacIEc
         MYqw2Xx0DUVlBxCxvXSR480SkAVVJ08IGwA+XJwUI1AcuOIF4qnjr52hn1TSOEWOokFx
         RNP0nbtkUJL9ep3HmYdjjoC97JyxmDeLQCrdrZKWJtxTNfC3/lmuC6dS/oWhv4mJaUBL
         oaJg==
X-Forwarded-Encrypted: i=1; AFNElJ/c5p8dxfYmnxYvNyqyLOznLUmnBJLpkaoDTr4PrtwkpNznOO7XuqLfXjMD5mBuOLbtQw3C/UK7Zo9sCWlBemj/@lists.infradead.org
X-Gm-Message-State: AOJu0YwxnChn81wpueggB8jn0bOQk++iZiCSmwzosmyDPkNdUgJrBO4f
	JuUlrhwwmBCWlJNg+aNUj3nyD5GqHjGTo9z/tjv5Wj9dqOdCT5jIfVn+BHEmV4zCn7KcQkSoWVS
	uY0M=
X-Gm-Gg: AeBDieulz/CuiXdU14ATkrehS0C9c7VXaM8CMofyq+r3G63c3mhdiDk6T/hc6nuRBd5
	cLlHdgufqT5l70MG1jtJJ729TiGkYaZ79PvP9iarqA/IVhGUiqyZpJWYpsrFPOMtD656MgXkr3/
	yjz4qQO101hN/cgBe7QAFmpNJSYNlYlPE3YAxHlNA9SO1GTq66dFg6f9rJ9n3bKaCY/ZeZ/CCnA
	rAUjRaSoQ+nLBU3JKBAluoyGfHaTYzmWXy/ir6hjy1C10piUEP4RU3k17pCWk5/N1VwMDsi+ln5
	LpCYmFckH8ME0Dl/lzUJh1cQicnIHWewubz6ZUHcHpBYw5GB4pQmSHjaAN0zO9+Il3Xt1Zx+9Dw
	lo+u5lgNyBDR3xkJi9ecE5JWwlWsMVHZNWx5WfTbB3inNuKGGluVuxQeo4ecagkjYEA0/tdOLjQ
	0cyv0hOlmQNgRKt14EI0QjBJUROgAR+WfJEgM8Lrcihm39CmIoJxba1ZOZWVEONn25IHD0tlcML
	dO6K1Pbs4f5AWMLB6A=
X-Received: by 2002:a05:6a20:a122:b0:3a3:3d95:507e with SMTP id adf61e73a8af0-3aa3b6279a1mr2621746637.28.1777976101728;
        Tue, 05 May 2026 03:15:01 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:15:00 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fei Shao <fshao@chromium.org>
Subject: [PATCH v2 15/16] arm64: dts: mediatek: mt8188-geralt: Add MT6359 PMIC supplies
Date: Tue,  5 May 2026 18:14:05 +0800
Message-ID: <20260505101408.1796563-16-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260505101408.1796563-1-wenst@chromium.org>
References: <20260505101408.1796563-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_111504_025800_4EAC1467 
X-CRM114-Status: GOOD (  10.87  )
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

The MT6359 PMIC has a number of power inputs for its various buck and
LDO regulators. The binding recently gained property definitions for
them.

Add the supplies for the PMIC regulators to the common design dtsi file.

Reviewed-by: Fei Shao <fshao@chromium.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Moved supplies to top level PMIC node
---
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index 8e423504ec05..d57e0eec676a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -1149,6 +1149,23 @@ pins-en-pp3300-wlan {
 
 &pmic {
 	interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
+	vsys-smps-supply = <&pp4200_s5>;
+	vsys-vcore-supply = <&pp4200_s5>;
+	vsys-vgpu11-supply = <&pp4200_s5>;
+	vsys-vgpu12-supply = <&pp4200_s5>;
+	vsys-vpa-supply = <&pp4200_s5>;
+	vsys-vproc1-supply = <&pp4200_s5>;
+	vsys-vproc2-supply = <&pp4200_s5>;
+	vsys-vpu-supply = <&pp4200_s5>;
+	vsys-vs1-supply = <&pp4200_s5>;
+	vsys-vs2-supply = <&pp4200_s5>;
+	vsys-vmodem-supply = <&pp4200_s5>;
+	vsys-ldo1-supply = <&pp4200_s5>;
+	vsys-ldo2-supply = <&pp4200_s5>;
+	vs1-ldo1-supply = <&mt6359_vs1_buck_reg>;
+	vs1-ldo2-supply = <&mt6359_vs1_buck_reg>;
+	vs2-ldo1-supply = <&mt6359_vs2_buck_reg>;
+	vs2-ldo2-supply = <&mt6359_vs2_buck_reg>;
 };
 
 &postmask0_in {
-- 
2.54.0.545.g6539524ca2-goog


