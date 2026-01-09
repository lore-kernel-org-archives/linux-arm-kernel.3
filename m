Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E79AD26D71
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 16:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ADXvSV8kR6oK/joxnZuLV2sADvFjrfufvsAY5SEvyoo=; b=xkI4ICRNHpgxSoZ0ATf5H9D8Gb
	+GbIGMFamnBhhVqZ1iEI0kljUP/tqfsdApANmaCEFYYSSOneCuI4SfoJfDu2JfdyQ0VDSxeDDZ0je
	6DIRo/Pbuj5t4N9dJKFYImzyMVyKlHtfUJPdvSB4uzffPK0PZJNA3EeiUA2smhhUMwNgxQ3E5ajKO
	HX7C7K1Z7LNH38Tbj98mVV4rTpW6cX92mRuGWciItOk/E8MkqUb+Yp9j9l57cUHssQHRCTr0D7B7c
	U4i6Ali3dmGKRUPHgWL26kr+YtodV0VIzCqoyuOuVX5YsK765CKgQXAd/u6HYTEYLQnQvRh+5whLu
	KOH553XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFoa-00000002fUO-0ip9;
	Fri, 09 Jan 2026 16:58:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFoW-00000002fR7-2apr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 16:58:17 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609B2swF1062748
	for <linux-arm-kernel@lists.infradead.org>; Fri, 9 Jan 2026 16:58:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ADXvSV8kR6oK/joxnZuLV2sADvFjrfufvsAY5SEvyoo=; b=Vykohv77h7z1Of4A
	xXh/fqXuzRIH/PbRRIxfYdGGnxwMQUo8igi1aNjeeV6K6Q7c8bVeyJadWeXzYDU6
	PhWQfwMWtVpVsacS9iASx7ISQoQ6f4Zk+kNh9kzbQHxtqTQ7aFYv61QhOwwFgrUX
	+LZXegAPJkQj0Oq8Mfw2PT7WnMjosGX3u3ZObRY7IgEfWIRGR2aID4S7cBNnKbBa
	k5QH24HY9KzH3SwS+g2rxk0NyQn4q9ICWkZOvPDJfnLfFXO4E3fB1a29bB2te7VN
	kWMOMNx7rjBp7HvW8utlT0nd3BRy3gK10OCnA+E0Kdlhr4z4IKVYCRhyf8bKXKaz
	rdfaYg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bk0f6909t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 16:58:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b24a25cff5so1310079585a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 08:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767977895; x=1768582695; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ADXvSV8kR6oK/joxnZuLV2sADvFjrfufvsAY5SEvyoo=;
        b=a0RQGQPoBxd+iwGWjR+iGv89begEd/5+zJoLLr5JE+BuH7bKuq+ltwkJEp567+67LA
         PJDhwwpWD6nUwmWbUz3sN+3U3H1zUjt//zvzQ3ke3wpZTMrZH3gXnbPfqZ7f0Qv3hKxG
         miR162/TJcFZhfM+PlsV/iZQ0cnntw0HTFZW+GgednsD24BiR/D4tQS5RhiHH8ueaQ8y
         c5eMDLWYDbSaMRVorgExOFnUhCMMsBd85AEhI8GaJa++bdqUux/Z2dHi/BthNp4SHH9s
         17Qe7pq90FT5D7Qnk8JI+h/+ywZ/tHHXxMkZq8nLGPflbUtGXqCP5WDjS1e1FPUleipi
         kNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767977895; x=1768582695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ADXvSV8kR6oK/joxnZuLV2sADvFjrfufvsAY5SEvyoo=;
        b=ZXw0VUKS0Xi+cscAEOaLePIhEEu7ZbA3wg69IrxNLduDYLH48ljioVs5Uke3Veh9oS
         jG25cwKcnFpBA6gfyGvF/JKAHrASwpXm+u4GGBwv6RUkn0GwZw6llzriDmOdDBrnC0Jv
         38Ap9Xgkfir/3/hbIH5DFi4M8taVWzWyqs2j+r8w5j6my62mFd7uTwSAfBXiuv1QTysi
         6FXVntHMOt/d5EgzGRzUSj+zzQdDndcuc7x53vIFmyrXYYroMEb03FUjA3FixNPN0gxH
         cVx/dpRoxlV7fo0F8GRXVLSAsSzuGyCAcjTxBpbyhTFJ7IGH6mpv2OPzZzlc8s2lda5d
         lh2w==
X-Forwarded-Encrypted: i=1; AJvYcCVzrxpljMTJpTINCaXTNEs6Gu4v7afex8JVIrF3KMFjO5Ws2Ys3MBU9NtZT0SzM3T+wKZfpMjYRRqTySzEJEGpn@lists.infradead.org
X-Gm-Message-State: AOJu0Ywh7oNa+mkX0iko5dowK/hNc7L5Kf9ogF1HJKu9DeEvkzIYxueb
	0bNiqodk6b9pBBhmBRCgmgB/YFV6WAUl0Hwnu0rOdWZB6SShSi+P7pvv4LAMxzIF0dnvAFSQJN2
	xLVDFL+91CgGHeeproFq8Ndbi44D3bqf5UUZXxmKyssURMry/8N5FFneZnVJaPInvfSJGX+V2FU
	H+DQ==
X-Gm-Gg: AY/fxX7j/ZI4da7qV0tD7S9sH1Ds9YR8Mc6Slah1FXtuZqxLAKoexE9r5TjpEJOtECK
	U+S3JDntMCi+wD44XW/lE5mXEGgqg1bJ2lXeiUkU/hsdB7HtvEVAuh8iGYZwTqI7oxMfN8BcgIm
	/Dlx+9Juo4DWpua645TrcYJHbSwIG8r7Vj39y5UOo9yMbBWzKKEpdS2jDzmzNVXKJthsk6ZQPLl
	3bvEQaZAp8AqUAXbxR7qRf1PgZvHoZSunq9G7RHuKWQ6g2iSdBTu0Bc65nyRcUowlG1hC0cCAX+
	63yy/2dwnsTWFB+qxXd4Sr6ydeneNmaGhVfAUVHpK/N74X47j98ld1WgyV7c/lzjacqy+7zLBQQ
	zi09ovVpvVYxn4ZNeUGqPDuy96wadL5odeA==
X-Received: by 2002:a05:620a:17a4:b0:85e:b7b6:81e2 with SMTP id af79cd13be357-8c3893eb55fmr1410581085a.50.1767977895037;
        Fri, 09 Jan 2026 08:58:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrBq7Oj9urWGrpAyGkXDWzVgxkYyRBhfKrUthko6Zes9haa8dRS5mYm1yWfIN6yIJkyYVWUA==
X-Received: by 2002:a05:620a:17a4:b0:85e:b7b6:81e2 with SMTP id af79cd13be357-8c3893eb55fmr1410575885a.50.1767977894515;
        Fri, 09 Jan 2026 08:58:14 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm23231784f8f.31.2026.01.09.08.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:58:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 17:57:47 +0100
Subject: [PATCH v3 03/12] ARM: exynos: Simplify with scoped for each OF
 child loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-of-for-each-compatible-scoped-v3-3-c22fa2c0749a@oss.qualcomm.com>
References: <20260109-of-for-each-compatible-scoped-v3-0-c22fa2c0749a@oss.qualcomm.com>
In-Reply-To: <20260109-of-for-each-compatible-scoped-v3-0-c22fa2c0749a@oss.qualcomm.com>
To: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1463;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hWij0Cx2nUsE3a6sV+TeED1rlFEQMwzrQCGei407aGw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpYTOTQudL3FhN/34Bx16jwi5rezq66og3KX2Uf
 nRZnoW0HkqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWEzkwAKCRDBN2bmhouD
 14y3D/4nRgbqVx8NtVKmBEK82/3qTuU14fmyZPVMKAzr3vodo9z/CnsYeX4Qs1/H+v0LL4bLIx0
 KAKUSyyY9ODpBcUTAjJN4/BIOegFdaaC7IjIAwyELLeBRd/3om/oSeas8xuNpggHee/nl+w/MSU
 xFz+iDuuEfBIiVSCW+YXK3KrfzQ4Xn4QuR4njXOrnNOSP8JMAQK+sDYahJYSjkFPhKFcDDbvm97
 R0VcxMpp3lbC+UDz3noSUjgLmlPlQOInreZDxRuumLEV0zvDzRuM/wJRD42VLh7gWw/NBBGu0z3
 kgjnZeMxSp+g+b+fPw/ec7Yv7MnK+qs9Wq+kGlESUXzmSB+Fsjo2dNVhyUCLcWgtG73zmT1MRgJ
 xefiuNEHNpvmWTKQK16hRQK2NL1qFwaz1JayxTJkQm3qAcOuzgGaczahlz7IXO53lQ6PVLDTVmQ
 EBFoOhQfNtnN6D3MfQ++8WB1kHf2Mwyx/RypZZ4jwz1yJ3qqmJEQQnfoGjprZ0G0ssDE7wGcabu
 hntZ1KDKHv9vqVhxYpRcY5WUvvajcC5cCbbVCzq/u9BdlVm3yum0xkaTKKIr8+EPGC/5gcJq6B9
 Hi+WNrkX7nZ9NkWFQSY3iXfuuSG1OcdSKgjIZjRnXw++nfWCpe/oMSiC3zukGykDljEPv8/QmQi
 gLVKlFqabwawcPA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=P803RyAu c=1 sm=1 tr=0 ts=696133a7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8
 a=75aRx82TGYjwQxWndmAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEyOCBTYWx0ZWRfX4C70un2NSXty
 5A+vUQAtu4tKZNmnM7OBM79avi8myyvoqGtE9Ms8IBpdd2X7+keQJbSc2ksU8/Q3d0z41xGxpUJ
 V0C3ucKJbUuvrHMu9nvCsAffqd68BfEWvhYtSDJJ9kSngW6LTswIVV36j8aAzZryG/Ac2fa0q2G
 4mzniTpV8mvGZsqcFkw7GpKrHj9hrz59ZCTHu5YCTLC9m+TnBXJ/qT27qj9J2/sN8wfb94fZjn4
 qv8slJXdlx6m3GmNGEJoKTOMRAAfAeihbsYjsPiad2M5IPPRDGSpik42YVNVN13n8llE9yEvT3e
 GNSKLcBOXvI5O1bADBwwsMhiWUoB+UvUXAHdIk+QpGecEAZ0mpjYY1eKoCCwpzm8/9BQG+GmImZ
 hA0AROAk43tRt2fAoq0BM3/m5rJL0bIvUn9rm8m7Fy5GUFNoUSJfDHZKssr1anFUjn8KdeFCYgw
 9xveKxqCrPTvz1ZJB4g==
X-Proofpoint-GUID: oYeZ5K9ZsYuy0nWFh6yunT1-ber2GfWA
X-Proofpoint-ORIG-GUID: oYeZ5K9ZsYuy0nWFh6yunT1-ber2GfWA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_05,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_085816_784253_89CF1B03 
X-CRM114-Status: GOOD (  15.77  )
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

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Depends on the first patch.
---
 arch/arm/mach-exynos/exynos.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index 2e8099479ffa..18695076c34e 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -47,9 +47,7 @@ unsigned int exynos_rev(void)
 
 void __init exynos_sysram_init(void)
 {
-	struct device_node *node;
-
-	for_each_compatible_node(node, NULL, "samsung,exynos4210-sysram") {
+	for_each_compatible_node_scoped(node, NULL, "samsung,exynos4210-sysram") {
 		struct resource res;
 		if (!of_device_is_available(node))
 			continue;
@@ -57,15 +55,13 @@ void __init exynos_sysram_init(void)
 		of_address_to_resource(node, 0, &res);
 		sysram_base_addr = ioremap(res.start, resource_size(&res));
 		sysram_base_phys = res.start;
-		of_node_put(node);
 		break;
 	}
 
-	for_each_compatible_node(node, NULL, "samsung,exynos4210-sysram-ns") {
+	for_each_compatible_node_scoped(node, NULL, "samsung,exynos4210-sysram-ns") {
 		if (!of_device_is_available(node))
 			continue;
 		sysram_ns_base_addr = of_iomap(node, 0);
-		of_node_put(node);
 		break;
 	}
 }

-- 
2.51.0


