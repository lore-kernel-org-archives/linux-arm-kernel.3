Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D848FC79F92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 13:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GQU5Kz/VgyQX4saHEvB7jD5Kcu9XiHJQFMsoC85Sd9Q=; b=RgGu7t9y1VJkT9hj4SZDKoqHVZ
	UOK0hQzWq3llZPpS17r8wGNWNKnnD+zogGXOsDhXeZv9f52aTh87gPa140wknex8+rqGqK3fYVPrv
	/CAMWvbeR6Tj8q7gDcPzl4whlf+MwbKHU3JGeVEHmhX1EIsANmNItfOrhW063yVBAQdM+LlOeSxZf
	AT7QQnCBiVqSvSs7+uZmcSo8HxUyz00xoXwpNcID7nFcP2WaTdZ7/kYGoL4yqaZIR63uxs/vKpMli
	qrL+R9jNoBFYKpvjZELEwLm2MpGFbzTuxsNZAioCcGqRA1OeXBeS6629aAQp5Bm9GYNCWZf6F584a
	J7kV05DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vckj4-0000000BTM0-3zHA;
	Mon, 05 Jan 2026 13:34:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vckj0-0000000BTFp-2WBE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 13:34:24 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6059cv7n610611
	for <linux-arm-kernel@lists.infradead.org>; Mon, 5 Jan 2026 13:34:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GQU5Kz/VgyQX4saHEvB7jD5Kcu9XiHJQFMsoC85Sd9Q=; b=XWeq5s4SwBY/Gda9
	3xTgtWQFxjHVut66+dBaXjRsiKU4gNBlppMhL44RCaB6DvVDCDQCgP6Sin/uuoAn
	dBgVtukRQmEt7++SPuwNQhs02McsAqJWyQWjAZWQGgICBfX9obwAmZHLV4GoPklH
	cE8DIp4HHAWlrpMfPhnfGQwOQ9wOnQDnR60YHBSF/WU5i0veL39urcU2bHxBxMpu
	QYGQDvLJlIji5PfwZomS4P2bB3PfZCNG/ynB+3IUKDvLe5KwKjPDE1elYTT3+pUc
	NNbWwi5bvoLIGdslAqZlxIRCpHmcekkvY5KAA0GoeADt8nG9pFgGNE7YmauVnYjr
	lBAVwA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgaus0jfd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 13:34:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1b39d7ed2so314422061cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 05:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767620061; x=1768224861; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQU5Kz/VgyQX4saHEvB7jD5Kcu9XiHJQFMsoC85Sd9Q=;
        b=AadTeFqEU5mLmWSSLHsQAqvFFprY5fIwrrIrOA+YfcI4ghgt7JDgHWiqrOxy3cV9uJ
         b3FplZd9maSEUU4T4azjn3IfuK1CeEGOPibo8S6kvjdhv3Wvcfhd6hn2GqF8oPg5gnYk
         8A7HN3+GWvilLiLTp4BV+ONV1etH7lM9OG99Mc+CKnwF+rPUPM2QXb3psEvqeCTzl8GI
         HPABnjpS61jZbxOaFHwBfENFSrELNSHyp0IlHKQltBPH3OCTtJXJ6nrvu/mggXVmgvVe
         otbwnmd66pFQwVXFXRQk/blajjl+L6DYKllAD0+rEC+KV2IIJOvqVDd4b2Hj4iTwICwF
         A1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767620061; x=1768224861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GQU5Kz/VgyQX4saHEvB7jD5Kcu9XiHJQFMsoC85Sd9Q=;
        b=uVV0yoWlJKgG03pCuiTH/vNhmCocoJo3nMTlTsjNiK2zsoXpZqW9Rake2RffOBhREr
         +nuxafPSsPWYymfgKvor3UfLKn4nMsOLIpxrb4v0D9PZ6msgQYW9K6GuD2VVdJcEx/0B
         4kLkHK/j+nwKQXch8MVlh8vKJZ3RnlZ/kaTDfaUptF3S4IzyDngUHd8xYqhOoxmdYBLU
         g3x5ietLkInsJNVx9i7CWleHhNByubEw8q7OoLDZBnkYheQpTEMrwkraob3c0EGl3PCU
         6Aw9D14ejeJEoDQnTnPvozHhMv43g+ZIOLBUlHg2asQ7i+lhb8v06/3QfjvJPGEEF/Qd
         ej3A==
X-Forwarded-Encrypted: i=1; AJvYcCVe7Q2PFFA7bcxYDzjsk7bQ53v+gFKrvu0YJu2NU7r/mAUC60v78celffd81jkh6Jm9PhzAzrbMe8NwO8jNBs0R@lists.infradead.org
X-Gm-Message-State: AOJu0YywnzxVxiB5aNdrDd0xLLs1UoBjxYEOW4I3KNDBZJZNv/Z0zmIz
	/TutTF3tQ14TqTFBgCG0uTjQ2CnHUfvUT5o7ly0q1blmRgJeiwREyRZK1imzNSnvNbGXR4U4vVd
	tkcKCXhHL2hsYHkJP2UmU/kQUkAqi2Omp2rzpszUyJW97IcvV9X1w+S2pUMhbNIBQxEpeEBk9jl
	O+5Q==
X-Gm-Gg: AY/fxX4eIOpkxj61S+nz6vEejoUNX3AENcewaNZZjjisALjp8sz0/XRAYAwBNSUpOgx
	yVW6cQtnqq+0Y/aS40tju+sxEpKf2FAFLOPDEzXRkbM8WeZqwme4hzmWdUxdmjXr8XIMC1Nr7OR
	NejtaTygDdws8geeFz8WWOxe1dPpwt8Y24novW2do5gDrqmtJq8CZqsvqblL0iajXsNyB6TMHXq
	8N8o2HKT0/yW0+NKmX1OPflTvvURwfnAPcgtSs1Y5mePBWO1SyUeDoHutyqD2QMEESRTHh+EzL1
	1MtkDgof7lZ+EfR2p21Wxc/QrhnyencutX/lpz0fNiwhf3azI/OaqardFIlJw+XKQt3aCmhLK4k
	kQ85mxRmwQLfJIJZ5J1pBTqDMJG43oezXwQ==
X-Received: by 2002:ac8:5751:0:b0:4ee:155d:b560 with SMTP id d75a77b69052e-4f4abccf941mr657072671cf.8.1767620060928;
        Mon, 05 Jan 2026 05:34:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvohOiETwplgpb7x0MhUosVavCMzgIVhmuUS1hAuC+K3fqYHLtDaKXS+BJRX6q1JcFTIgL4Q==
X-Received: by 2002:ac8:5751:0:b0:4ee:155d:b560 with SMTP id d75a77b69052e-4f4abccf941mr657072381cf.8.1767620060493;
        Mon, 05 Jan 2026 05:34:20 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d143f75sm147211015e9.5.2026.01.05.05.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:34:19 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 14:33:48 +0100
Subject: [PATCH 10/11] media: samsung: exynos4-is: Simplify with scoped for
 each OF child loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-of-for-each-compatible-scoped-v1-10-24e99c177164@oss.qualcomm.com>
References: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
In-Reply-To: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1509;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=OVCWQJWSot2eG/7wK3qMzP+a9sG5lzn0vIz1M3MguJI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW72+pcoko1mnJ4T8CjzyeksWqs2tk1MM7uyw4
 JFwm941XT2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVu9vgAKCRDBN2bmhouD
 15rLD/433Y2qlSNgI4eoywUOZkUks4q0xTYlw1bGBpx+mFsiTiNHcpEOcYjeWfmdvTGx2F1cAgC
 cC+bCiy3spwz22ZAUVF7b//4cn5Liw649LSiRq47/JP47GivQs4k2TOrSl+ZOaAtzu5Q2kN8z7f
 zaQTrug2e6YbkeZX6qdinK/8Wnq74VvzywOtnQnU+2e83CZ6PaeNy1WPOzii/7m/AlFbptjbQr2
 I9e02BSTfPfb6yV7olKvuSHZY40JL2vjkftyY1Z5UkszPE/AYNPubhQcBEksDmGDIfpRuV2Hpgi
 4ixUBeKworGjL7Qk0m5qOnd/ZWR6fmSj0uTbkHOsMVUV1LKct5l4hkKeJzP4I0QYl1cBcrYXBQk
 rM21mJR6GGrWi+p2gQUI/XbGFQr68vMfIHoeOkCXgLUqRz0kef3xrD8PVgs+EfTjp/EVdnZsohH
 pzVjvBalpg+JAmiMo81/i9+dRGT68OE/VkUcK+lRv+dVFo9JAmRWb65HrK4gsih/Icave1dp/uF
 IxUYM7rbVQnxLmdDtG5UAS8MpiV+8U6pLTPl5iqG6UCJys5ATZViA0/OVAxGMcaLMNbACsllgxN
 4pk6C1UAeDWw+3YD3beZ6C/C1sO3pc3V7arSSThH79bzj8in9O0R1a5YLrzfiRBlhbby05633mr
 0caQ+z69JhZ3tBA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: xYNt66lRfg_811VUjOgyreop2bmfLOUP
X-Authority-Analysis: v=2.4 cv=DP6CIiNb c=1 sm=1 tr=0 ts=695bbddd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=2mm1MoeH4kfNTzOWiPUA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: xYNt66lRfg_811VUjOgyreop2bmfLOUP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExOCBTYWx0ZWRfXwzCF6xz2gEG4
 9YdNtnnYkEFLq9CkAnagVb0N+oNFm0p4XXZuOpXwy+bE/zei79dz4ED5WYChqhEsEdXyxOzJ5WU
 H2q7FQ8Bk+MyY43CMLi5mobgkviUD6cTMn3Yg2LAMJfHrBvBpcd24GQTe63/yaLaTWNb39qTnMy
 ZZofkgc6OMZaaXyshk+eZVC69GMSCTO3zQh40EBBCPJERlXNTWWAhPZ5DIrFeRXoxSE6LqpclYj
 dqzPbay2E2Rz1TWuUnEfw45NgfeBkN64xtTXmWpCXmnY7ES2zZxbpF1uI5EyYCLxCGUbQ5qe7dN
 h8880aKBXCsqmtEot5CeNUQJLdXULgoJjuwoa++jdE4PS9wc6vtDyTaPiFC+S601nLs2+6bZ1+u
 AIh6nCheJb7O8NsF1OJbg8POPbufHoYXsIwPuRBItWLRtfhjpa/7OXvRo20l5vmZVXsrADE9+WI
 UtCWko+mMqg9dQID4vQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_053422_717800_625C4BDC 
X-CRM114-Status: GOOD (  17.27  )
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

Use scoped for_each_compatible_node_scoped() loop when iterating over
device nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on the first patch and on:
https://lore.kernel.org/all/20260102124955.64904-2-krzysztof.kozlowski@oss.qualcomm.com/
---
 drivers/media/platform/samsung/exynos4-is/fimc-is.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is.c b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
index 14d84cc96831..b7d9bfedd590 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-is.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
@@ -200,21 +200,19 @@ static int fimc_is_parse_sensor_config(struct fimc_is *is, unsigned int index,
 
 static int fimc_is_register_subdevs(struct fimc_is *is)
 {
-	struct device_node *i2c_bus;
 	int ret, index = 0;
 
 	ret = fimc_isp_subdev_create(&is->isp);
 	if (ret < 0)
 		return ret;
 
-	for_each_compatible_node(i2c_bus, NULL, "samsung,exynos4212-i2c-isp") {
+	for_each_compatible_node_scoped(i2c_bus, NULL, "samsung,exynos4212-i2c-isp") {
 		for_each_available_child_of_node_scoped(i2c_bus, child) {
 			ret = fimc_is_parse_sensor_config(is, index, child);
 
-			if (ret < 0 || index >= FIMC_IS_SENSORS_NUM) {
-				of_node_put(i2c_bus);
+			if (ret < 0 || index >= FIMC_IS_SENSORS_NUM)
 				return ret;
-			}
+
 			index++;
 		}
 	}

-- 
2.51.0


