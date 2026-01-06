Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFACC47BCE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 09:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kLVtP0znVY6PZy+iwEU179garS/faVZ3ElWkNffkw50=; b=0x8nVP0hpW1tWsU3mE3ISFVo9e
	eTih4T+GAIfytgjnjPaLPbp5TSGoz+BoVk9QNxEGvDTAKgOlpP8mfmN8seyn/PpvfXi91ifXFeNyP
	2gwdrCWttAJAi3G/QN9dBF/h4TmuUuCGDBBgeuia49t6jr9kMD6qN4AR1hB5j1zJ+bY2rS5zM+KBD
	zOKvVY4HH+rR8Z3a1e+DtIXEGD2b1/WZ9dZulXNWotHIg20eeSTDpsT4pxemf2igGpbJ4w8DPz9FH
	9ptooRUhLl2gBR2MCAaHMMsibEO/wYshkjUkpKB1HJI0e9m0WH1WwR4kXiFBt5fqVDKc706SViiCG
	zIZbhSVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd3AC-0000000CfpP-3OYr;
	Tue, 06 Jan 2026 09:15:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd3A4-0000000Cfmo-3FkY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 09:15:37 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QA0o3214058
	for <linux-arm-kernel@lists.infradead.org>; Tue, 6 Jan 2026 09:15:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kLVtP0znVY6PZy+iwEU179garS/faVZ3ElWkNffkw50=; b=JuDZ0sroPqI9l7rd
	Ba0jWnvV8P+FAhqShgypQEUYb0dNLA7vm9Qdbm+G/FwccP2oRreTP5E8bhL5nwuY
	pseX9SR0EqF3aCDxRiYxNkWx7R8c9qv8l+UL18eLuKuNPK5fVCtkkpshutYHauWR
	/BC1wISWWmSjPRxoSy0lJRBQzbaIhXrkdMaca2wY5GlyQj0w+O913mqHoWpq2Vug
	v1ZPK9K9DCm9H3GBEbS0AbqrwTBrlIja9uYBuXWftICLugoQEq/WOWQXhG+luRdh
	7CKKxgU7sdMLRn/VeLWdpJUOJ774eKOjEuh5Q4HOqKK7wLJzcHfWUj40RXuMwg38
	uX0Aaw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgpnd9hdr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 09:15:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b17194d321so106743585a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 01:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767690931; x=1768295731; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kLVtP0znVY6PZy+iwEU179garS/faVZ3ElWkNffkw50=;
        b=QxUocOY8HciI8vVYZU5FBJm14n7EYjdKDKd8Kbwf6AFA8Ma9xBHYlnxZWDvghtX0pK
         78MTyrRJC2zM1Du2ETgVPpDqjkvUFemY/wFv2UUwxHJr6/uq3jQ4o30ZjumSfXDlGSpN
         1SB7dHr8hDR0hUp6FhkF3VRmCDtkxOcKMQ7OyGFsOTiB1GQLBzOS7/OlQ1o62QXY5jqE
         3I5MJOq16JBlLitu56Z0KliGOvSPeixbLwCvLUni9wj0iLm75Bc9urrZWTCP04sM/xYT
         8R+eeoJ3JUtxq7lM7lsHCbnouozO773POnW+/2uV+pA2mvLmPiG8WAX8IOr3VO26JBf2
         bYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690931; x=1768295731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kLVtP0znVY6PZy+iwEU179garS/faVZ3ElWkNffkw50=;
        b=t0FyV1T5iHOKssaWDEme+3grpUB+gToSC0GXsXsDogPe709KCS9jKnvpeCLGcBaqI0
         vKo3diGreg6HaXKf7WK9YpVT4JsKFmCo3Zg12Gk91i5yrRvaDGQVfuWwHRrM8Xg/WFNG
         BFJwImsgKj23XuCk4GVwojD6Prx+kxglyrxSqll0nuL2QokxM6yb0LgIUI3EyuXy/bkG
         0T9AVCKiXw5SiWAN3hZeMEFeVSHhYSvTTMM306PKogmSCtN5XIAsCRyxp8lJrUjwXJCV
         0n3HRB6nKBbvuVu5ouOqALPjw+e480ofgKqo211GMnHtlPq4mH0XqBrEyOT278LQpKPb
         5HvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlaBuT3oeEs/OPiBsfuE6CY+GQmW8YzB1OcVk7+kh/buGgp90ZqYqXAamMqSOe2FP0zl4JU9GHxmoWJ6FnWlIk@lists.infradead.org
X-Gm-Message-State: AOJu0YxzoeDkLdsG0oGiOj/xuVmwEwjwfbJrnEPU1db9i0LyrfIDp2+g
	8xP2WjaQ/+xcurE0JpQMWTohN51hK2+IAGIT760BkEadahAIIbGl/tf8X1evH0NjbkpuppQbsyl
	GQH1rniwfhWnhqLxTC5MQKnrCtgyxq7KXDh0wmYtI6K4wrzJkhObHgqfOkJ2sqr+Y77WFeX2kB5
	ITUQ==
X-Gm-Gg: AY/fxX5lTgtfd28OF3JZJyoGwTtRtlXcLDrtbQYiqigUSCvy4espUj55/BXcQWMzG+x
	3ikcJQ1F2VAkoXLRbFaoZg9EGAajqRg36P3llLAYLzYgTsRJ76NDh/KMkKoDiyI9lnZ33hPhD3l
	DHObl4BCvn+24AGpfqzhaePMw2VxfaC5TlJYrZ7DDzsS3njc7Zx3876JGtXOe8vG8c3RnKvfm3t
	QFeLSvfaeVZfoh94MenOT7s0qRL5d1x9ye9J/lCjre8pYyh2tnZwpGtfL6a94VL0l1uvdHyzD+j
	L0pghkECEKLdVKPWuLSL1fFFXUlbNfmS5IDEFcaXD70h+iSt5zxKu24kA93ZfcrH7ohsZpN3Ujw
	hyQKvpUaL9Uh7jTZPcF1Ny7XGhNfkaxWSLQ==
X-Received: by 2002:ac8:690d:0:b0:4f1:acb9:a929 with SMTP id d75a77b69052e-4ffa781b9a5mr26337971cf.83.1767690930751;
        Tue, 06 Jan 2026 01:15:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGg4OWE22L/p1/XvBGl1nJqnLjKHLzvm3+SkvN0ogaxYpRilKzOfbx1IfTBfwIK3NoH1EXUlg==
X-Received: by 2002:ac8:690d:0:b0:4f1:acb9:a929 with SMTP id d75a77b69052e-4ffa781b9a5mr26337681cf.83.1767690930280;
        Tue, 06 Jan 2026 01:15:30 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm3271370f8f.43.2026.01.06.01.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:15:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 10:15:12 +0100
Subject: [PATCH v2 02/11] ARM: at91: Simplify with scoped for each OF child
 loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-of-for-each-compatible-scoped-v2-2-05eb948d91f2@oss.qualcomm.com>
References: <20260106-of-for-each-compatible-scoped-v2-0-05eb948d91f2@oss.qualcomm.com>
In-Reply-To: <20260106-of-for-each-compatible-scoped-v2-0-05eb948d91f2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1011;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=oqF2IaCk8/DIpqq3qRCWxnErPuWRL2cMFXqdcUOAGkw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpXNKih0+eXMcylP/gbvVOhdImQsQItFRSegy0G
 pHh0g0vCpKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVzSogAKCRDBN2bmhouD
 13RmD/9yu46d1PZmOsUNbM+bFCAZttIbuf1AQe0A+jcJbyNEOTGx5GJHZdJ/Wpr5Bp/BW0BZoU/
 R4ScVgC6WKih5Sdkbc0GkFvEoA7M2reTrhkCtOYSJHri9iRE6EejlNFGVn6wWSsU4cx0IYcZ/fe
 IeLK+FnLzC/elo57C3wc69KTz4Kz4kgYqwS+mObAY3y0SMPBGAS3neGdpJJv9n1cMJYrWr1xiD+
 udCtzLDkYanbzCTFl+mMPJS1Y2hzFD7xwLWQRsSPAw8nYLrL96L7x34ew06SpAXhO/xAsP+P5+o
 DZN+odYBbjpE8WtO5FdiMIIRuAYJW0ydrwh6hyaauQeCLWWorXnMBA7st7pDJJRALHgv7ZNVc+6
 WwaS0N36aXZtZ6Ucu/Ci04X3T/G5KttoGuUV2xHt/uKwG8ToaXOMNEzIKm52CkJwCfkpPg4V94l
 HgOSJikLpaNAPdwpMPXADf1Im+9Mn1Pn2qtXRUCIgnaMcfieZsV64RmHjRhmR+vzU93s9aoQclo
 Y7/yLgjK1b+2sLqYjh22nt7wQLG96DA9MupSeBJJzhs3VaSQh8hOzdajuADyEVbBFQlvY9wwDJ1
 NkPiW06PhEVCLKqSQnd+uk/1DWVGImBTrHHYrYWP2Fwwy3UKl04PcC8ph/NALHX2amtvLpjFf4N
 SaOSGPsG4nreAQw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: dq7fUGwi8BnC1N1R0Ngd7jGHveP1bviK
X-Proofpoint-GUID: dq7fUGwi8BnC1N1R0Ngd7jGHveP1bviK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NyBTYWx0ZWRfXxDIz6Kt65XlX
 8o8hnn7JDs5HS9iRaksux5kKxyArr5yIzQXF1YpeeBcE4vSSVrI47n6jEcBdL3Rz2M9kytHLWGs
 nQYcdwt7H8vidiL9VOuiMxltrJ7hu9UE4MgQhMTLjimdu/KrqvQEbET0Jf/F1O0nAdjaMxg1K9e
 NfInIfGMynwZw6FZmr+XFpikyef3c9IyMMEA3oOJf30nhFjT1rHW/y1wlLd80UCXjTt8fVS25m6
 QfkGOJiuTt5/TlB8Xj55fCAiRtlSBJhTKKZ58G87FXhEoubSEpRwy8Si2TTvP3xHcWCAr2kX9sG
 xpTJZJc11GC3YbD1oNEDwebkIwasirxPWvhNxpRZXfH5fIRY+Z28fZZ2Huyf/6x8VPcR77KYvVC
 aAFmzPZ1LvhxZQhAUAFGgBgaZs7T6sqHophfpN+zwQ4B8oS7LtMv8Kmu0gD634LRvYJbhKDJJm2
 QQmRovVzqGkhhy4G1YA==
X-Authority-Analysis: v=2.4 cv=Jpz8bc4C c=1 sm=1 tr=0 ts=695cd2b3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=XYAwZIGsAAAA:8 a=EUspDBNiAAAA:8
 a=TtkSn9LXl2vsqZFf_0EA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_011535_768165_DCE6130E 
X-CRM114-Status: GOOD (  16.62  )
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

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Depends on the first patch.
---
 arch/arm/mach-at91/pm.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
index 35058b99069c..68bb4a86cd94 100644
--- a/arch/arm/mach-at91/pm.c
+++ b/arch/arm/mach-at91/pm.c
@@ -982,15 +982,12 @@ static void __init at91_pm_sram_init(void)
 	struct gen_pool *sram_pool;
 	phys_addr_t sram_pbase;
 	unsigned long sram_base;
-	struct device_node *node;
 	struct platform_device *pdev = NULL;
 
-	for_each_compatible_node(node, NULL, "mmio-sram") {
+	for_each_compatible_node_scoped(node, NULL, "mmio-sram") {
 		pdev = of_find_device_by_node(node);
-		if (pdev) {
-			of_node_put(node);
+		if (pdev)
 			break;
-		}
 	}
 
 	if (!pdev) {

-- 
2.51.0


