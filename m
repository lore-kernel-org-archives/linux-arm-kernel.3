Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCD7D26D6F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 16:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ow1+Sylf0/GThA8sV9q6qdIH/jdzl1X0FeZ+BXt7EwU=; b=RcmoGuQfskYeLODkTxFn6cADwb
	ie8DmITvUtRsLy9nhx3EThnm6xbMsVJHR/VJ/MjAgbEQ1LOw9MlRRPrHMRkE6PRv6ZVnMiUMXiot8
	UlRDFq8kOmh0/lSFjtk16+YZaqQ68i7qbfD1LY5k6jY4TENj4ooOh1UOqgJaoDIjnzy8VyYKavRi0
	QzfrtpqMyH4lJnQujx4SkhBIhJhYkJdN/ATGEikZjTyEQeXYeYNdt7jFJVUE539v8KgYc/tJzSSmL
	/SOPDB+QFivxcwLq+CpQzTm11Jz2TI6/SuS1ckLtIyjtjtPWyvn2QSKAoziy2hxCYVMzN6rJHrDGY
	GtRKWBhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFoq-00000002fmG-1gVr;
	Fri, 09 Jan 2026 16:58:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFon-00000002fgh-0hgq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 16:58:35 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609CsLtf3541993
	for <linux-arm-kernel@lists.infradead.org>; Fri, 9 Jan 2026 16:58:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ow1+Sylf0/GThA8sV9q6qdIH/jdzl1X0FeZ+BXt7EwU=; b=bw2aC5Vaevcd1ryh
	uLRScVJd87DWUmrA40LMCkcsxHs9m3waqPfan7pxpk6GgRcWkXgbZyKBBJewy4mc
	8hoQ1vxxohXNFijNlFrHk8OXGA/0eQAA4iVRKadwITNauTbs33ODpf72fxDuIdrc
	j96M9/kkJepyhfIrGr9+iDj277g3/eIxWIw7Uo5NFCnERiu9t+yC468YC8pXSltO
	BufnFUaYO6zxBsrLzGdz8GIRZhxHThIJ/GbLvxRHx4fUsRA/iL7QbKmAMCGOoBjs
	vlnVpQbNGySWSaUAqIyte7Glum03G3Ppot/BH0+1Nnoft90P7Mr6af8tRz/Wy4IW
	nkU2aw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bju6b2125-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 16:58:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bb0ae16a63so513518985a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 08:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767977911; x=1768582711; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ow1+Sylf0/GThA8sV9q6qdIH/jdzl1X0FeZ+BXt7EwU=;
        b=ig8wT4QTDPuYIcTtoWin9pZpjWcgpyeIg1fl4fBE2ja/bdbebjL0P0x1xkLk3IZ/LZ
         PUpkGER8ysAadur4ptTwSJUfKs4R89T/dSkrhdEGxspjxFbhkyWKbtjaMxPhFOIbNGV4
         UWkCz1MyOP6EJP6TXb7biZ1BWpSaD00lcf+BIdupJfhtCl7jSAtfHCtgwErkdAu2yw7b
         QiNh8msloJnjfzZzTT/jNxHwPGODqiYYJvO4j41iM1pzjWygyoYnUzK9JYe6br2+ygYd
         XWtn9XQGTejVO03BfPH0di27zvjYgvipWZZvtOuG5/EC2ekgp3/3pNtAy+85zUz4fZ+C
         drAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767977911; x=1768582711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ow1+Sylf0/GThA8sV9q6qdIH/jdzl1X0FeZ+BXt7EwU=;
        b=CDLnJ22Hf2pZk6bdxzhbnMC6HHGYZHR45eDGZh+aOmLbbEI1B8++AxZQZCa7L3nTd1
         tKfMkrQ8PqNjpNcPzE9YdxjvIeYal2Jhbh6pfPon5/e12peFzypGF9PrZv4jMb/0jny1
         Ilo1sEL3Y5+e9yuehCsNsn8sVssTMdBWtG5IYfMdQPfuLtEZ6+XzK+nkfnyPaRfdIHyw
         OO7mIwVNIcufvdaar1z4yYWmoJjl3zKazuVjQuH1dalCFJutv8YWsqt5XeIuDndSCsUe
         u5Z083i8U9SqO2iGMHGVH6KKro/z5foPU5pVTm4tgDGtSAPHZI1e5vOyHYY6jVzLq/QU
         uZXw==
X-Forwarded-Encrypted: i=1; AJvYcCWyO/FGfIp1L4LYtWTO+3bD9rHJbGagVoprWe77H3Gr101C3AElxXIbdPj34M88AhKq/Xk/tPLR536j6u7b0mv3@lists.infradead.org
X-Gm-Message-State: AOJu0YwDfiP1r/B79z4T9WwpMwZoEScoGFL0X3rMOsIlNPK1aCGwbyIy
	BkvWHlVe4Ec8tQtaw+8KDH9Nu0nLixzYAhQKNe2blI8JRnlTavGErPURE9QUGqZdp4Ks8OzOgxJ
	AsWqIZe8JescpgEQWdkXuVUufwhb4Je1ArWKSBEcNf2Qmf1wO+qx3+3rI48QhrF5QgYQHAsymbs
	PfbA==
X-Gm-Gg: AY/fxX4VTab14rLQ7ZV5oaBsfMH+AgMRDGs1PfxN3PQReJx0f3mXhf1o+IY6R9SBSan
	jsbwLXrUEshbGEthtilHzeGMQYGDzor2xha1WufGHS2wdz5J3kYLGK2HM6NGmuUjSak3AgVl54R
	62Ct/rhfFWAB9g2UVoKxfoCBDarpHmOmOqiBF8vOkD4Ogd+lrhcIBioD/ql1RYaUmx38tcZdsaB
	R4FaNHwXiK5z3Dw7jJRy/VqDl2gvDepiQ9drGj6R2op/n0AFnxeatcX10dLjXfpr5RqNup9w9D8
	goQzRvalDZGymVZoNSdew5K0P5mQvmgcJxe6lIIzyCHB9L6GUxfMcpupVpplpySkoytS77kRqVH
	KmcX3bvCCzPxhdprSLTcNxVR0MJrSXZPHSg==
X-Received: by 2002:a05:620a:31a4:b0:8b2:9a8a:118b with SMTP id af79cd13be357-8c3893ee38emr1424671385a.73.1767977911293;
        Fri, 09 Jan 2026 08:58:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEagzIp+psjVuVk3GVMCLnSaVXjxxAaX3Szhc6w4avTMmKqAquuUCbyZR4B9aXL0lO+SjkmzA==
X-Received: by 2002:a05:620a:31a4:b0:8b2:9a8a:118b with SMTP id af79cd13be357-8c3893ee38emr1424664785a.73.1767977910752;
        Fri, 09 Jan 2026 08:58:30 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm23231784f8f.31.2026.01.09.08.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:58:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 17:57:53 +0100
Subject: [PATCH v3 09/12] clk: imx: imx31: Simplify with scoped for each OF
 child loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-of-for-each-compatible-scoped-v3-9-c22fa2c0749a@oss.qualcomm.com>
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
        Frank Li <Frank.Li@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1361;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Uyp3c+ZcOw7zIw42zFp5/g9Wh9eWtjdFSWod2VZLRvk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpYTOYPsGxvbeXsQGj23rJ/C/cCYfiZObAB9ixz
 y53oRvcWfCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWEzmAAKCRDBN2bmhouD
 11quD/932ltOa1s5tv7DudKIHF/1ebbW/6MsuD85b7MWtuPg8Ls//bcv8pKK2ldqRl0TTVl8PkE
 ymOrPYPnkMOZ0U9NghNrj6KVF4exeUKx90kH9QNCtz+HIZj1nJxO0FP4sAeusOxe6LC0XrIZIgV
 t3AG7s68MxFbVkr5P5MZWLUEqHSyz9ZPyXHNFZ94LoQ7nkL0OsIZ/eFD2njaVT1fP3AysNNBx2X
 nCgqMQaEuqrrH0p1fZir1tlD31Jcd7sExD5GCAdljD6E0uZpm8xNDlJlWECzk2Dw5Ap3COM+KYn
 e3zK6tgBgEPPZ79RFbRXCQWkuIDeyGMDek+78gSufysu1DMds4kQXEFiPurkbSasHj8KuVA2KW9
 +nolYW3e2wYzPGG5gPHWoiE4CUFSKxy0t36hEQhgMQLZezOD3Cld6uvoW35Vd3m3ycLRErbjfs7
 0vTrDkBhUznPnLA3rEEGgGNBoT2i2rJ4Bsh+ilpoIs4vuaPh3wm24arsSyvlOSA93Gg5fvpEVQM
 zbhxmpeJHsu/YUcSjCtdx3PmTZodhUNm03jj+1Cm733yQFBZLh90bbahZL9OSE0bE96DdNCG7UV
 Uc6hfMZyGk02iLvd/M2xdswLxMksBmEDF0VsW9mDk1UbCL+lLFy8lbJGfwOECeeEF+4EZKw0VJG
 3miz2lZ0KOeMIoA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEyOCBTYWx0ZWRfX4iSU5vNxL1qK
 iRpnepawtVuQNPLvGvh/AGwVLrU4J0zQ3wAmchLMQ+7lF/Z3Yqcj2wa/UVPamTWCdxEqfqicblm
 3zAmIrwCoXm3CJioxctcuvLifU3wpRMgYH/boqdJChW6N0QJM0wgWhOncGg6+h+c9svrUKYG7N5
 QyCqcmnURntLui85JDzAYQjnDAKz9mSOP24tAKn2RBP00jzohvRQLfXwqqwzu8U/5D1Vy/qIhv2
 3XOF5JGYf0WzEtqiSegofPt0feZ1VEQbnGKcd2clmU/41MRKBUJT9Qu/cB/o4bRTt/3CLbB5Cm2
 eR8pHuF4WdmYLLVPfSL+k9BLfhSmwMN+p3KahEz/9yw6oCMTRhn0NxQ1PaquKr3sKT85pNixg9H
 FtPDTBpdZ28PUHZ1FfDDh6sKNu/Viu56jEtspSkSRn8IoRL+aOAV0T6WGMl1ILgKrrQ6BeFyRhJ
 nd/DOGVUyFZbHD9HY3A==
X-Proofpoint-ORIG-GUID: J0CW9QttijeBkyeTua_merXsGnvbr8Rq
X-Authority-Analysis: v=2.4 cv=V+5wEOni c=1 sm=1 tr=0 ts=696133b8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=i0EeH86SAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=RsIb78jGsj8zXbp4E7EA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: J0CW9QttijeBkyeTua_merXsGnvbr8Rq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_05,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_085833_380050_6B646B18 
X-CRM114-Status: GOOD (  16.55  )
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

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Acked-by: Abel Vesa <abelvesa@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Depends on first patch.
---
 drivers/clk/imx/clk-imx31.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/imx/clk-imx31.c b/drivers/clk/imx/clk-imx31.c
index 4c8d9ff0b2ad..962eccac63ce 100644
--- a/drivers/clk/imx/clk-imx31.c
+++ b/drivers/clk/imx/clk-imx31.c
@@ -123,18 +123,15 @@ static void __init _mx31_clocks_init(void __iomem *base, unsigned long fref)
 
 static void __init mx31_clocks_init_dt(struct device_node *np)
 {
-	struct device_node *osc_np;
 	u32 fref = 26000000; /* default */
 	void __iomem *ccm;
 
-	for_each_compatible_node(osc_np, NULL, "fixed-clock") {
+	for_each_compatible_node_scoped(osc_np, NULL, "fixed-clock") {
 		if (!of_device_is_compatible(osc_np, "fsl,imx-osc26m"))
 			continue;
 
-		if (!of_property_read_u32(osc_np, "clock-frequency", &fref)) {
-			of_node_put(osc_np);
+		if (!of_property_read_u32(osc_np, "clock-frequency", &fref))
 			break;
-		}
 	}
 
 	ccm = of_iomap(np, 0);

-- 
2.51.0


