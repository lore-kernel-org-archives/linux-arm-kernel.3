Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0552E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 06:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=oDqO9IOD1jONV5GnbVGe8T0Coj4j77IrhqYsAza3Vfo=; b=G+FJSJO8Au3c1hPU6gc1pQQh6o
	P1x2nnEsCsuFcXgWlXs1WNwKmhyJd6jMEQCYfN1aSCCR5i9goml8hOVbXImqgadtclHcAmFwxPC4j
	adOfrXhy4DMNTND8ZHV135+gFZdLrsFtsws5mMkcJ8wliB+VWQ0a1rGri8uenE/1ZWJnpdV+TRmYu
	he03JxLZ7xtqj3yjHn7TLS7Laet+4LSpdkjbOvgl03vTwjXPl6NLFqYymndx/ymTEMbhmBFaeQ//U
	JPX389LPHchIfYmMzYDzI2hZp1T6gA4ePaAGQVGsWY9mSns4FrSFMQs5i2ryHDn+bTJnBRxiof5TA
	QSd6PbGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVPG9-00000007FSi-0bMg;
	Wed, 08 Jan 2025 06:09:41 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVPEv-00000007FKZ-0MXY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 06:08:27 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250108060818epoutp03692b7269fb75c4111bad79c7f5a5357a~YoqfTERkW1666116661epoutp03x
	for <linux-arm-kernel@lists.infradead.org>; Wed,  8 Jan 2025 06:08:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250108060818epoutp03692b7269fb75c4111bad79c7f5a5357a~YoqfTERkW1666116661epoutp03x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1736316498;
	bh=oDqO9IOD1jONV5GnbVGe8T0Coj4j77IrhqYsAza3Vfo=;
	h=From:To:Cc:Subject:Date:References:From;
	b=VKRrvfEGka9bubK610pZBQ0YTsqEFbnPaBa/HlhBGe/30EE5bTg+8UR7S1E8OxJh9
	 6EGWXrJa8qHmWuJPjLoAkCzhFF8ad7fGRRNasf+gnCEDQ+MlqJMEQ1Zkt623RvQ1e+
	 ZwwkUkbaGWWJvXMm1hZMrOZItHqkC6ZZSIrAD3zs=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTP id
	20250108060817epcas5p1f5805d78973d2adde4628d7f90e9b691~Yoqe7Lb770503505035epcas5p1d;
	Wed,  8 Jan 2025 06:08:17 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.177]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4YScsq18d0z4x9QF; Wed,  8 Jan
	2025 06:08:15 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	EE.FA.20052.F461E776; Wed,  8 Jan 2025 15:08:15 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250108054224epcas5p399f3d734f8d9f82e5ae75d183d1a5344~YoT3--ket0155601556epcas5p30;
	Wed,  8 Jan 2025 05:42:24 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250108054223epsmtrp1731f1eec433c597767f0450345175a6a~YoT3-OVYQ2675826758epsmtrp1F;
	Wed,  8 Jan 2025 05:42:23 +0000 (GMT)
X-AuditID: b6c32a49-3fffd70000004e54-c0-677e164f4c2d
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	15.7C.18729.F301E776; Wed,  8 Jan 2025 14:42:23 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250108054222epsmtip29ba52c104d681642b1a890cebb401c8d~YoT2kK8Ew1928019280epsmtip2P;
	Wed,  8 Jan 2025 05:42:22 +0000 (GMT)
From: Devang Tailor <dev.tailor@samsung.com>
To: alim.akhtar@samsung.com, dev.tailor@samsung.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	faraz.ata@samsung.com
Subject: [PATCH v2] arm64: dts: add cpu cache information to ExynosAuto-v920
Date: Wed,  8 Jan 2025 11:20:12 +0530
Message-Id: <20250108055012.1938530-1-dev.tailor@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupik+LIzCtJLcpLzFFi42LZdlhTQ9dfrC7d4Mg+NosH87axWazZe47J
	4t6OZewW84+cY7W4dmMhu8XLWffYLDY9vsZqcXnXHDaLGef3MVn837OD3YHLY9OqTjaPzUvq
	Pfq2rGL0+LxJLoAlKtsmIzUxJbVIITUvOT8lMy/dVsk7ON453tTMwFDX0NLCXEkhLzE31VbJ
	xSdA1y0zB+geJYWyxJxSoFBAYnGxkr6dTVF+aUmqQkZ+cYmtUmpBSk6BSYFecWJucWleul5e
	aomVoYGBkSlQYUJ2RtPUJ4wFFw0qXi36w9TA2KfaxcjBISFgInHwf1QXIxeHkMBuRomNU/4w
	QzifGCVWTn3CDuF8Y5RYfPw5WxcjJ1jHpxv32CASexklPl85wAThvGeUuPe6gwWkik1AR+LZ
	0dtMILaIQL7E9RO7WECKmAUWMEo839sKNkpYwEfi0NI5YA0sAqoSjdv/sIIcxStgK9H/VhJi
	m7zE/oNnmUFsXgFBiZMzn4CVMwPFm7fOZoaouccu0XyTE8J2kVh4/w4jhC0s8er4FnYIW0ri
	ZX8blJ0v8eXQLqjeHIn1r2ZAxe0lVi84A3YCs4CmxPpd+hBhWYmpp9YxQazlk+j9/YQJIs4r
	sWMeiA0KRhWJ998tYTa9uLcHqsRD4v21WWDXCAnESmyd+Yh1AqP8LCTPzELyzCyExQsYmVcx
	SqYWFOempxabFhjmpZbDozU5P3cTIzhRannuYLz74IPeIUYmDsZDjBIczEoivJaytelCvCmJ
	lVWpRfnxRaU5qcWHGE2BATyRWUo0OR+YqvNK4g1NLA1MzMzMTCyNzQyVxHlft85NERJITyxJ
	zU5NLUgtgulj4uCUamCa83NaQpsh/5IvN1ezRU63iZla9fFbmgDXmd9nVQu1TKyuZhrOZH+h
	q5rvam4swcn/29Ve7uK2tU2uOxxXvT3uE6e7es8dgxu5KcF3j35V3e/5mcO8ZrbVLmn3I3yF
	Fw6HBfkvLKsT4OWw4F4ipNO8dZVXaG1At7B3aiVbe+Qv87zXjz4Inw/VjLqhbvB7ytrPrRI+
	J59NvXk8vbCtIS7FavVrd6lI5Ttv622qgqfMFwqrr101Y1aQWB2jqEmVSaiv2Myp8jLsi95d
	O8j4U2ZWzj7O/99ivprGFHh3vf+6xGd25uddW+cXFLFue75nU+XWAybeYRkyXxq7wnq/PLrK
	XiGxRi92XUd4zYT4cCWW4oxEQy3mouJEAIkNehwdBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGLMWRmVeSWpSXmKPExsWy7bCSvK69QF26weXJFhYP5m1js1iz9xyT
	xb0dy9gt5h85x2px7cZCdouXs+6xWWx6fI3V4vKuOWwWM87vY7L4v2cHuwOXx6ZVnWwem5fU
	e/RtWcXo8XmTXABLFJdNSmpOZllqkb5dAldG09QnjAUXDSpeLfrD1MDYp9rFyMkhIWAi8enG
	PbYuRi4OIYHdjBJvzz5ngkhISXS0bICyhSVW/nvODmILCbxllOjbLQ9iswnoSDw7ehuohoND
	RKBU4vzDRJA5zAJLGCUW7GxhAakRFvCROLR0DpjNIqAq0bj9DytIPa+ArUT/W0mI8fIS+w+e
	ZQaxeQUEJU7OfAJWzgwUb946m3kCI98sJKlZSFILGJlWMUqmFhTnpucWGxYY5qWW6xUn5haX
	5qXrJefnbmIEB62W5g7G7as+6B1iZOJgPMQowcGsJMJrKVubLsSbklhZlVqUH19UmpNafIhR
	moNFSZxX/EVvipBAemJJanZqakFqEUyWiYNTqoGJ5aGj2E7ftyknxY1M60uNp6bwPXZIqv7D
	aGVZUpz5xPyH6+9nHR8iJGa7KB/rTTH87jC/skPVymTNRdEr31q0v7rtNa1efM8ha6LPviZJ
	j7nm390YTd1zLxT/cJrXGvfq0bEtZ6sfhi37mRDjcDN2526TRac/7Xy827HqOa/C5mbv54ab
	7j3hck76EawgelI5Kano1RW+vGc5s+bIJ7PeMaj5tjApJChL5y3T+WMbEj0KhFydyvk67GUM
	bnr8XPyPpX/vMT+uJQV7Klb5twe4vyh3mdW45f3daZqv7HVFp5+133HfczfbHJM1fbelnybd
	FHefaPdx0s2sry1XDSzVWiwEKviYDG65fmKQLlFiKc5INNRiLipOBAChA+UWyQIAAA==
X-CMS-MailID: 20250108054224epcas5p399f3d734f8d9f82e5ae75d183d1a5344
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250108054224epcas5p399f3d734f8d9f82e5ae75d183d1a5344
References: <CGME20250108054224epcas5p399f3d734f8d9f82e5ae75d183d1a5344@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_220825_584966_1C754E8C 
X-CRM114-Status: GOOD (  15.78  )
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
available to userspace via sysfs. This SoC has 64/64 KB I/D cache and
256KB of L2 cache for each core, 2 MB of shared L3 cache for each quad
cpu cluster and 1 MB of shared L3 cache for the dual cpu cluster.

Signed-off-by: Devang Tailor <dev.tailor@samsung.com>

---
Changes in v2:
- Added L3 cache for all the three cpu clusters
- Corrected L2 cache numbering as a part of review comments from Krzysztof
  and updated as per cpus clusters.
- Link to v1: https://patchwork.kernel.org/project/linux-arm-kernel/patch/20241231064350.523713-1-dev.tailor@samsung.com/
---
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 127 ++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index eb446cdc4ab6..a3fd503c1b21 100644
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
+			next-level-cache = <&l2_cache_cl0>;
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
+			next-level-cache = <&l2_cache_cl0>;
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
+			next-level-cache = <&l2_cache_cl0>;
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
+			next-level-cache = <&l2_cache_cl0>;
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
+			next-level-cache = <&l2_cache_cl1>;
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
+			next-level-cache = <&l2_cache_cl1>;
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
+			next-level-cache = <&l2_cache_cl1>;
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
+			next-level-cache = <&l2_cache_cl1>;
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
+			next-level-cache = <&l2_cache_cl2>;
 		};
 
 		cpu9: cpu@20100 {
@@ -152,6 +215,70 @@ cpu9: cpu@20100 {
 			compatible = "arm,cortex-a78ae";
 			reg = <0x0 0x20100>;
 			enable-method = "psci";
+			i-cache-size = <0x10000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x10000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2_cache_cl2>;
+		};
+
+		l2_cache_cl0: l2-cache0 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x40000>;
+			cache-line-size = <64>;
+			cache-sets = <512>;
+			next-level-cache = <&l3_cache_cl0>;
+		};
+
+		l2_cache_cl1: l2-cache1 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x40000>;
+			cache-line-size = <64>;
+			cache-sets = <512>;
+			next-level-cache = <&l3_cache_cl1>;
+		};
+
+		l2_cache_cl2: l2-cache2 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x40000>;
+			cache-line-size = <64>;
+			cache-sets = <512>;
+			next-level-cache = <&l3_cache_cl2>;
+		};
+
+		l3_cache_cl0: l3-cache0 {
+			compatible = "cache";
+			cache-level = <3>;
+			cache-unified;
+			cache-size = <0x200000>;/* 2MB L3 cache for cpu cluster-0 */
+			cache-line-size = <64>;
+			cache-sets = <2048>;
+		};
+
+		l3_cache_cl1: l3-cache1 {
+			compatible = "cache";
+			cache-level = <3>;
+			cache-unified;
+			cache-size = <0x200000>;/* 2MB L3 cache for cpu cluster-1 */
+			cache-line-size = <64>;
+			cache-sets = <2048>;
+		};
+
+		l3_cache_cl2: l3-cache2 {
+			compatible = "cache";
+			cache-level = <3>;
+			cache-unified;
+			cache-size = <0x100000>;/* 1MB L3 cache for cpu cluster-2 */
+			cache-line-size = <64>;
+			cache-sets = <1365>;
 		};
 	};
 
-- 
2.34.1


