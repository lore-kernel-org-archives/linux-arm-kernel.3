Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03670E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 06:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=QmEegIRzUN94auc1xTuuf1HhdMTYdSCFzKxkBFIAO38=; b=HIh9wbnb8Z2g6HY/JNTQQcBtJ/
	Kqt7GTpSCVejhDK5VFnThA8l8CDzyYFyBYtFzm0qprTFo2YDbvdS11dOtQOdTQFhgMebzULEul7xp
	9kqG1FIxundWEOfosETz5kRS9btzTOL13hVObwdbyAVFn5mqBvL/xF3ovkP9W7XhLle9ThgYkuT/F
	ASEz4ze++3EyzUAJwcfxsqKQ0V6QrPd4Yca0q7ymtnNtBlGS9OQzgXf8yGGj7Y+/DhCMr3nxU0ATg
	5HwIcFWIQX2cF/7URHVj2TuJ946QVD9j+uREWCO0yRQY+xGqOxBISjFi9e4Uz4utAIpqvKplYsaP6
	w+lX014w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSW9d-00000006fco-38rs;
	Tue, 31 Dec 2024 06:55:01 +0000
Received: from [203.254.224.25] (helo=mailout2.samsung.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSW8R-00000006fRV-3C2m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Dec 2024 06:53:50 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20241231065343epoutp02a54c5e1ae7525869e32a7312cccdccd7~WMH3o1kMm2806228062epoutp020
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Dec 2024 06:53:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20241231065343epoutp02a54c5e1ae7525869e32a7312cccdccd7~WMH3o1kMm2806228062epoutp020
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1735628023;
	bh=QmEegIRzUN94auc1xTuuf1HhdMTYdSCFzKxkBFIAO38=;
	h=From:To:Cc:Subject:Date:References:From;
	b=T6MUoXY+022KQsNRLrLrQVL5bZZwYPpoxcfnssqplhEjKLQmBYc94FVaKv108o/td
	 nLqpg9rNkFPwV/BgUTaKcGA/VWxEdDl0/cyEj7hCOGuFZzzcpBHxNH4jnddsxasxFi
	 Sw4JHpmH6HvNTirFE10EjmG7ZNQ9uYMDF+CPwUfo=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20241231065343epcas5p2d7ee2f7d2d04ee1ea7412b2e712e1ca8~WMH3V395Z0763307633epcas5p2a;
	Tue, 31 Dec 2024 06:53:43 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.175]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4YMkFx3TNhz4x9Q5; Tue, 31 Dec
	2024 06:53:41 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
	C2.51.19956.5F493776; Tue, 31 Dec 2024 15:53:41 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20241231063730epcas5p4137cc2e3d805cb08e1675b056ef186dc~WL5s6LuDy3145231452epcas5p4S;
	Tue, 31 Dec 2024 06:37:30 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241231063730epsmtrp28d4dbc4b0ee97a8cb35e1a4a09d7b555~WL5s5J9rb0347203472epsmtrp2O;
	Tue, 31 Dec 2024 06:37:30 +0000 (GMT)
X-AuditID: b6c32a4b-fd1f170000004df4-c7-677394f565bd
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	6D.80.33707.92193776; Tue, 31 Dec 2024 15:37:29 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20241231063728epsmtip240598124c1c8ba626663101efdbad2fc~WL5rjpilp2312923129epsmtip2i;
	Tue, 31 Dec 2024 06:37:28 +0000 (GMT)
From: Devang Tailor <dev.tailor@samsung.com>
To: alim.akhtar@samsung.com, dev.tailor@samsung.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: add cpu cache information to ExynosAuto-v920
Date: Tue, 31 Dec 2024 12:13:50 +0530
Message-Id: <20241231064350.523713-1-dev.tailor@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnk+LIzCtJLcpLzFFi42LZdlhTU/frlOJ0g/enxS0ezNvGZrFm7zkm
	i3s7lrFbzD9yjtXi5ax7bBabHl9jtbi8aw6bxYzz+5gs/u/Zwe7A6bFpVSebx+Yl9R59W1Yx
	enzeJBfAEpVtk5GamJJapJCal5yfkpmXbqvkHRzvHG9qZmCoa2hpYa6kkJeYm2qr5OIToOuW
	mQN0ipJCWWJOKVAoILG4WEnfzqYov7QkVSEjv7jEVim1ICWnwKRArzgxt7g0L10vL7XEytDA
	wMgUqDAhO2PW88lsBbuVK86u2MDWwPhOqouRk0NCwETi8vOrrF2MXBxCArsZJfauf8MG4Xxi
	lDh/ewoLnPPw/EcWmJa3374zg9hCAjsZJQ6uToUoes8ocXnjFUaQBJuAjsSzo7eZQGwRgXyJ
	6yd2gU1iFmhnlDg15wY7SEJYwFNi2u51bCA2i4CqxNqzb8DivAI2Es8P32KH2CYvsf/gWWaI
	uKDEyZlPwK5gBoo3b53NDDJUQuASu8T/vs9QDS4Sp16chbKFJV4d3wJlS0l8freXDcLOl/hy
	aBczhJ0jsf7VDKgae4nVC84AQ4MDaIGmxPpd+hBhWYmpp9YxQezlk+j9/YQJIs4rsWMeiM0B
	ZKtIvP9uCbPpxb09UCUeEosfz2SCBFasxOqWZcwTGOVnIflmFpJvZiEsXsDIvIpRMrWgODc9
	tdi0wDgvtRwescn5uZsYwSlSy3sH46MHH/QOMTJxMB5ilOBgVhLhPZdUkC7Em5JYWZValB9f
	VJqTWnyI0RQYxBOZpUST84FJOq8k3tDE0sDEzMzMxNLYzFBJnPd169wUIYH0xJLU7NTUgtQi
	mD4mDk6pBqY5i87d/t2Q9tfDWl+3m4+/d+kT98/bzPmdbGbZe87Pua6a7yRx5Y61wUENd4GD
	T5OYbkScCFzo9fTD83337U+tZzhS17KPYTpr55Fay4Jv6UcErlww2JcRI3K/JdivxHPx0oW/
	vX6ImXf1vfWtKu7pFNskvX1pTFOoU0eBW9jJafoGa4LS7BWybu6Mvx4jMjdqt8HWT0WrdjeG
	znmQGcy2aUqGX20837twq/9V2nGh7Yf0BM7NNv9XPWPr4YXz5r/3eV0XfC7J5m/Qof0Jd49O
	1Am5w2fHGLom5/ua5d9VV1+KuTZhi/5diXnhG+52flB5vFnrYvgNwbnZ279vC/Ti/7vu86a7
	9UETlsY9UpurxFKckWioxVxUnAgAOdJWixoEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHLMWRmVeSWpSXmKPExsWy7bCSvK7WxOJ0g822Fg/mbWOzWLP3HJPF
	vR3L2C3mHznHavFy1j02i02Pr7FaXN41h81ixvl9TBb/9+xgd+D02LSqk81j85J6j74tqxg9
	Pm+SC2CJ4rJJSc3JLEst0rdL4MqY9XwyW8Fu5YqzKzawNTC+k+pi5OSQEDCRePvtO3MXIxeH
	kMB2Ron7xzuYIBJSEh0tG6BsYYmV/56zQxS9ZZTYs/8jM0iCTUBH4tnR20BFHBwiAqUS5x8m
	gtQwC3QzSkzv2sMGUiMs4Ckxbfc6MJtFQFVi7dk37CA2r4CNxPPDt9ghFshL7D94lhkiLihx
	cuYTFhCbGSjevHU28wRGvllIUrOQpBYwMq1iFE0tKM5Nz00uMNQrTswtLs1L10vOz93ECA5S
	raAdjMvW/9U7xMjEwXiIUYKDWUmE91xSQboQb0piZVVqUX58UWlOavEhRmkOFiVxXuWczhQh
	gfTEktTs1NSC1CKYLBMHp1QDEy+j+RIPbudbdY5rvKUOS6802ftfp3XL2TfOq3m+7/5gy7vd
	UePAbnmj5hX3jxme0+KI/PT00g6/7e2Hu4OYpQrl9j9NSZ39gOd/S/TS7XvscmM29ual9CRy
	7tPj2it85+FcriNdnQt+HjTwr1z8Rjz8l8PtKxJcAgUXTyowpPWEHhPoP3332pIdGrXWy65f
	Djp5+eHlTLvgz1+Nkq8IZ/Q/mr01oPN2ota/jUv3fDK+I7Ml7Oehr+oC4mUzYza/XR00ef32
	aPMbU031trXJvzD9sfhTxhKdL4ZOs1eHSer8TL3wYl/L5LNvDisxxe5cq38jxOf1nYVWq1XZ
	l2Q1/fNuvZ3RUXz50lnLGUz3pPcpsRRnJBpqMRcVJwIANZx0S8ECAAA=
X-CMS-MailID: 20241231063730epcas5p4137cc2e3d805cb08e1675b056ef186dc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241231063730epcas5p4137cc2e3d805cb08e1675b056ef186dc
References: <CGME20241231063730epcas5p4137cc2e3d805cb08e1675b056ef186dc@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_225348_269999_B4ADCB55 
X-CRM114-Status: GOOD (  13.69  )
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

Add CPU caches information to its dt nodes so that the same is
available to userspace via sysfs. This SoC has 64/64 KB I/D cache
for each cores and 256KB of L2 cache.

Signed-off-by: Devang Tailor <dev.tailor@samsung.com>
---
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index eb446cdc4ab6..3ca4c8902aa1 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -89,6 +89,13 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a78ae";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			i-cache-size = <0x10000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x10000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpu_l2>;
 		};
 
 		cpu1: cpu@100 {
@@ -96,6 +103,13 @@ cpu1: cpu@100 {
 			compatible = "arm,cortex-a78ae";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			i-cache-size = <0x10000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x10000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpu_l2>;
 		};
 
 		cpu2: cpu@200 {
@@ -103,6 +117,13 @@ cpu2: cpu@200 {
 			compatible = "arm,cortex-a78ae";
 			reg = <0x0 0x200>;
 			enable-method = "psci";
+			i-cache-size = <0x10000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x10000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpu_l2>;
 		};
 
 		cpu3: cpu@300 {
@@ -110,6 +131,13 @@ cpu3: cpu@300 {
 			compatible = "arm,cortex-a78ae";
 			reg = <0x0 0x300>;
 			enable-method = "psci";
+			i-cache-size = <0x10000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x10000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpu_l2>;
 		};
 
 		cpu4: cpu@10000 {
@@ -117,6 +145,13 @@ cpu4: cpu@10000 {
 			compatible = "arm,cortex-a78ae";
 			reg = <0x0 0x10000>;
 			enable-method = "psci";
+			i-cache-size = <0x10000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x10000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpu_l2>;
 		};
 
 		cpu5: cpu@10100 {
@@ -124,6 +159,13 @@ cpu5: cpu@10100 {
 			compatible = "arm,cortex-a78ae";
 			reg = <0x0 0x10100>;
 			enable-method = "psci";
+			i-cache-size = <0x10000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x10000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpu_l2>;
 		};
 
 		cpu6: cpu@10200 {
@@ -131,6 +173,13 @@ cpu6: cpu@10200 {
 			compatible = "arm,cortex-a78ae";
 			reg = <0x0 0x10200>;
 			enable-method = "psci";
+			i-cache-size = <0x10000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x10000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpu_l2>;
 		};
 
 		cpu7: cpu@10300 {
@@ -138,6 +187,13 @@ cpu7: cpu@10300 {
 			compatible = "arm,cortex-a78ae";
 			reg = <0x0 0x10300>;
 			enable-method = "psci";
+			i-cache-size = <0x10000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x10000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpu_l2>;
 		};
 
 		cpu8: cpu@20000 {
@@ -145,6 +201,13 @@ cpu8: cpu@20000 {
 			compatible = "arm,cortex-a78ae";
 			reg = <0x0 0x20000>;
 			enable-method = "psci";
+			i-cache-size = <0x10000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x10000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpu_l2>;
 		};
 
 		cpu9: cpu@20100 {
@@ -152,6 +215,22 @@ cpu9: cpu@20100 {
 			compatible = "arm,cortex-a78ae";
 			reg = <0x0 0x20100>;
 			enable-method = "psci";
+			i-cache-size = <0x10000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x10000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpu_l2>;
+		};
+
+		cpu_l2: l2-cache0 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x40000>;
+			cache-line-size = <64>;
+			cache-sets = <512>;
 		};
 	};
 
-- 
2.34.1


