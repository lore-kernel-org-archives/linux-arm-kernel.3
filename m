Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F396CD343A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 10:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N3LbG04sbEceapIPPbET9a4VVHgMWotJp1E25yUbVLw=; b=U742GHsMxAUWlVysXbEINSDoJ6
	hCEe+nZ/MXn0fDhLw3hyCc8G+sSCANl3DGlVIcOm3udpgc7UzqukoQvvf0zM0yF/UvteM8KybQP90
	a/HaOOi/r0lbhk282cr9BeDq31mzQUENxJqwHEG4hzSSTl31mg7xTzEXQHWTiO9Z1Yr7FVeHEBuNu
	/wIMp5H3RpsCFRftz9dsGji3CUSxWGn4tfvM+6dsYRiAzk9viFvFDCL1miq8DnGhpqk4WOr87Ma+k
	Umj7PrPoVaH+PXl9cdY9zusd4ivZ2VZsm4mLeExap5QA4CziL8C9B/z0mPsRqDN0TwERPJ1X8psxc
	WV61dCwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnW-0000000FqvK-1nwz;
	Tue, 05 May 2026 10:14:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnV-0000000FqsY-08bb
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 May 2026 10:14:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=N3LbG04sbEceapIPPbET9a4VVHgMWotJp1E25yUbVLw=; b=iMj0IcpSTm6pFY4tafb0dYwBRw
	OO0lnZ+wcoge7c/r5mv/H3zAoCNogUKRyiMHP1O2M28fqcC7C8oQ8LvAPB/D/mU0okOeovzCRJfkE
	OvMXuzTtvLEOGjODGs6xJZ7SsRMAyLdUSu7xjYRA5H/hC/ulHuuul1cpabkKrY7UnhVlVs9khLJCq
	GOQIFob8ojibwGBY26UOobOsNkYdYOwibHhV14DaGXPF1rtROtkw6MpsRNaYwNq50P/qSy9qy2LPi
	OLmu7bctFX24+VksuyAIRP4Gq1vLQoLLUkOpfm2+L+o8lRzSJnY+V1HgD9gh4NOjkT5jeRJytYQYx
	4NHRi5ug==;
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnS-0000000D9Wp-0Sn3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 10:14:35 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-8354461da74so1057590b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 03:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976072; x=1778580872; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N3LbG04sbEceapIPPbET9a4VVHgMWotJp1E25yUbVLw=;
        b=OYU24GRYy49nepdAMIi5LTh2irkSRYAa792Qi/Q+9mfU+kb66oOS3iWnGtfq1uATb+
         szFaWNAA4sKOai3rYVVw9xxmbg77AxPkD6GkGlwbIsxAiX0cQeJooNnNUzfCOLYqos49
         YqrtbW/xOdYlPMjkqkXVoVLGFtBSsoQKM6h70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976072; x=1778580872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N3LbG04sbEceapIPPbET9a4VVHgMWotJp1E25yUbVLw=;
        b=a7hB2VUmPMP1hP82PHMF8cfQDsSrkcf9UOFz7vU368Q+KjUJSky7Bg+tXmNRif7GSI
         XPuwAC6RcPqWgFaOWm+ePBvsJQNWjSU71anB4Aiuf0resQ1q8EZ6CQY/JWEXkg0EJfyL
         EB3g3b182jVPOBTLx/s+qlwwUxeECT7w1fUYiW4tJJHhIuabwpdkONQeaR4bfsS530Pd
         n4vUNyF34nl8glN3Ozc48KQZq2+Ny+desHwhhf/SsD4oqlp2oOBv1hxHaA6k+exiRjWD
         dgxkqhLCfRD/pA9oIYVz7kPz5b0/ZIVAulcmioZtJB0Og/5+m1aeWI2Vq7//28yhmgot
         CAzw==
X-Forwarded-Encrypted: i=1; AFNElJ8bTAml3fqcPeWhiSxAjKjojNU+S1iIndgXX+lfEJ33L1QfRVelFEdX1PBwiMG+ns3PFnjECDAlCRrKkBDnSzGV@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9lG1iHZ/4X710maQoqz/sbbgbd/RaISglyTO8d7cwhavU+0oz
	hgbKch5qS3faM14vDcO00EpLiq1HLvfhpgb1pnzebZT4ZFN4blMUKDZiGRHYrYY6n5Y9xRx8rsX
	m/mw=
X-Gm-Gg: AeBDiev0cxrVci1X12mYw8c2ohvWyN7H9vqMH7mUqdK1c/cye0YJuQnWECFs07h1IKU
	jKDd1psfxuNVXTOCbcY5WPFumClJ0n+6l0cfk2X/cMEpa65R0Ddey7Dh+e8HdYk6uQi//vbCftL
	q9hSfE8ArYth8uNrAsNjaKHDGnHrIWGwldl/gLqLIXXq59ysNwIJFFckNzZYgZca3dTRuBHWTPG
	2Pq3tjtS4VJfk8p9+THP0TNDwy1UU4kWIRCAPzRB7e9jg2qOUbpBa7l5rGu9bmRja7jpML9Oi81
	UUujMtMA0sc/zASHixCkOXeEgjqIFPNKpq7cyFAVcBluhIm7t7FtZzQZbgsMDR7S3OFghi+NM53
	G6coLVZ+rFnc53KGnlvc1WFwz94vAjjPZXpu2rdpzfxrEk8jEyJ9TKe7PIpYJSvDffjm9yJ607G
	rPm28VGxicqND2ahP87EyPBAUmGEqP3fNlLu6hOb/Mn3QClxjnNV1oXZm5TuYZPX3lqdwYCLf9M
	HQstFNHbwBi2I7596c=
X-Received: by 2002:a05:6a00:a58a:b0:839:d76e:aa7c with SMTP id d2e1a72fcca58-839d76eae56mr407393b3a.44.1777976072154;
        Tue, 05 May 2026 03:14:32 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:14:31 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/16] arm64: dts: mediatek: mt8192-asurada: Add supplies for ChromeOS EC regulators
Date: Tue,  5 May 2026 18:13:55 +0800
Message-ID: <20260505101408.1796563-6-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260505101408.1796563-1-wenst@chromium.org>
References: <20260505101408.1796563-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_111434_411232_C93100C1 
X-CRM114-Status: GOOD (  11.81  )
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

The ChromeOS Embedded Controller exposes two regulators to the system in
the MT8192 Asurada design. Both these regulators also have power inputs.

Add supplies for these two regulators.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 13960d1c8a02..d08ba6aec382 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -1529,6 +1529,7 @@ mt6360_ldo3_reg: regulator@0 {
 			reg = <0>;
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <3300000>;
+			vin-supply = <&pp4200_g>;
 		};
 
 		mt6360_ldo5_reg: regulator@1 {
@@ -1536,6 +1537,7 @@ mt6360_ldo5_reg: regulator@1 {
 			reg = <1>;
 			regulator-min-microvolt = <3300000>;
 			regulator-max-microvolt = <3300000>;
+			vin-supply = <&pp4200_g>;
 		};
 
 		typec {
-- 
2.54.0.545.g6539524ca2-goog


