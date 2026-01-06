Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA980C47BCE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 09:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RUqp4Iv9+wUxLp5PK1JfIBFWlyQtuLekkwcSh0GtSIY=; b=OJivcJfgVudRRIBSvRR7tgSGmC
	CM+bib262GTNsHWZfZidsfu3+VszEB2zPe3MfzdyPy07sCuS4s8BBojCpzBT8oy52zrxjdkwnQoWr
	43Jpu3awm17fahtM/XNU/dn6ANZCyxSc5mk7Q7d0p8uxsUIREGSnEWjNoNUMyymfd1OKuf5fGUOxi
	5EGN1C0FfuD0Dm88rgEJ1r9yBPr47LGJZ35HGLZkeUGTHAdnXKobgYMlOWhD3ZoUfdAC78NYTWNF2
	fw/eLPkjZwLFq296DAZisYm78KLMoNayvn9+/H5/CCZSiOiKZNIUkGWZoCqtInGv9j0FdKf+m7Me7
	zIaGiMdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd3AR-0000000Cfyj-0tWS;
	Tue, 06 Jan 2026 09:15:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd3AG-0000000CfsJ-3Fo3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 09:15:48 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QSe43272106
	for <linux-arm-kernel@lists.infradead.org>; Tue, 6 Jan 2026 09:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RUqp4Iv9+wUxLp5PK1JfIBFWlyQtuLekkwcSh0GtSIY=; b=UNssgyvHFOsSoRhz
	hOzHNq2+BwVowQQTIUH3/4CGt1LOpBwuf2jIfcMKVipTU4rvfDxDeMCKH3Rt9ABW
	ijX6rFSRM3IESx2ytEd/9vo8eeL+cU6IhhNRYE12Y2cNq012BRnOBPEj2eXZqhkS
	5qFWVlUWtGUjOIxBCAbbZL1PLIFvwpre1KlwZI552q72amNuXpIL957aBowCCxEb
	1IHJKVQKN1XjLIMSZn+gtQaTyej1nMcO8w9Tzn4HDaO7yvvxdLSKqPmr4U0chZyz
	vW8i/4Xtc10bvN83JL15y3h0P4XERWPcxhEFGs+B0V00P/QeK/JbNJ4yz0OM8gVo
	EI8h5w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgfv02qft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 09:15:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4fb2f0cb59bso18187401cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 01:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767690943; x=1768295743; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RUqp4Iv9+wUxLp5PK1JfIBFWlyQtuLekkwcSh0GtSIY=;
        b=a7VZeGeoHgGHcW2WTOx3IZWJH5z2TJMGuLNvagS56NzbylS4thMiV1asv75sT56qr4
         cEtKvBH2prELho/xYazD909qT5Yc2PvS8JSqveFO7qaw4tXsDZ81rm4s9/9r3d9ZssLz
         s3vgzvMXGP0G5kz8KnNE4JuE5sszWw9CTCLo413LCTrBpDDo63gxxsOOHMyMpgD1DStH
         ZUuJoOtRU+dHt7n0r+ilXuTrvYy8xDBEg0US6o2rK+f9GJktWvIA/OKV8bVVC2cIUJ/8
         8GUmg61A1M8/HFLt6jX1l0yykt4D5ePlb5GjEAGk3fxqq0MiuE+b0QBOl1YAsMDy0Nrz
         px0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690943; x=1768295743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RUqp4Iv9+wUxLp5PK1JfIBFWlyQtuLekkwcSh0GtSIY=;
        b=DWc20hprhn1bqQ60TbdqHVVjlVr/XXhBRkNoywg93I6ZpHiukVGdRGxfOZYp1Gs3Ck
         UlXc0JHD3s11JL/0umDn3wyqxK/WFP4QRJIXKgu4oHAkvo4nBxsA7uPFgpCqE9JOcru7
         WMNNxxxYOtgTnTkM3x50QlQj9bVrev/cm56BS7jASGr9WJ0/LzYYbzoVTrH3BU6jERNi
         katqkhoPX0lknCog/tr7/GWRh01hSYBEwBAEnpbe7tqg5doboowkJGSCnKEFiKIuwo20
         hnKX4+9C0S0DoTB4FZ0HgMNeMJH3M/Iz3/x5AGbP+h3PYnjk+u00UBT66kBjjMX1Yn5G
         XYNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiDYnYUO7J2h2CDA8jkZVzqSwfShJYJWl8fMcUqY/NjJtYamNxLbKNJGEV4u0MzMr/Dzhp5wDetEjmySzzh+lD@lists.infradead.org
X-Gm-Message-State: AOJu0YxIABL2xuBvPVul35ixmoELAVBQu4gdNbYNc4UzehMZ6z9aenyX
	ccKzxNTdGDLHBS/4NsQbxKNNxv8aEp1OedupXzd/i7KDAl4LP/LNXZypt58n7ecbP9f5ifWW2+3
	irIRoa2WOE9n6vjuTr7x1WX8GPB1McR/YEj9/b1WfaQ7tamOvI+n39jky8aRtHzPBWPxagwu+LZ
	fOHA==
X-Gm-Gg: AY/fxX7dKrFZAhtffxgJA/kKQ2FWqERy+Gt3WEGZ+IVIo40bUTldb98c+irKVvlixL2
	22k8b52wKuoPzozf0G+EpaDAaPDMJTa3FPEaZFXD+iWYkuJ+udSjIhXVnZebGKNi043X7p29DTt
	MqJdCP3jCbqnzepCoJCAcoE6AO0eHpu6KyALMIjMm/ly3ds0LJES1V/4HWp8UQ0ju/QnITVAzPu
	Dz5fMW1K8AFNwKZOqOtxSDKvmCJKMHVeqIrfM30t3PXUHMjB8hept4kIzZE/OnTRccLhZhi91kG
	YPGiTJX3F9rGiMMWyd1CPKWgXc8ol+xkPu8jGIeJYwkWDfAV7hHJoOkAVdyFoB1+Gvy4Z9Pm0/x
	roL7Ko79CMNHP8zj+DWrHjISCxt5tqkS+Aw==
X-Received: by 2002:a05:622a:2b45:b0:4f1:e46b:9dc0 with SMTP id d75a77b69052e-4ffa781fd69mr24540221cf.76.1767690943141;
        Tue, 06 Jan 2026 01:15:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDeuNCrhajN4w2pa9axdtue2qax6nwJTvnc5Cls39nE/xZiXkUxIgLPcpsnvdWju8KVH6lSw==
X-Received: by 2002:a05:622a:2b45:b0:4f1:e46b:9dc0 with SMTP id d75a77b69052e-4ffa781fd69mr24539871cf.76.1767690942649;
        Tue, 06 Jan 2026 01:15:42 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm3271370f8f.43.2026.01.06.01.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:15:42 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 10:15:17 +0100
Subject: [PATCH v2 07/11] clk: imx: imx27: Simplify with scoped for each OF
 child loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-of-for-each-compatible-scoped-v2-7-05eb948d91f2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1166;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=KN3KRjm/oDtXh/DCN2KUrl2ZPSM8F0ypALb9+d3CNrY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpXNKmZXsuC2g+Xb1baVzgLGhhR7Rrcrdg1gFaJ
 ezTFD7yVUmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVzSpgAKCRDBN2bmhouD
 1z7jD/9kNeKktB5dvv1Vao6f1rBEkvNEL+y0aGnFILkw+fFKcXIFMwxxYzzlQfUksNYfJyOdK8O
 BzBik3cMNTqxSDXOVNd8Ijzd3DEfi8jW+J5PLcEpz7riNnuqwBaJkXRAGKiaxYuEFhSTmp8ICqw
 IA3pRZc2+nUuNYEntoIyQa8N4540M6T9RloRrgx8KA/AcupxDC//I6Cnupv+Pd20xe5DweyVTkL
 rH2B84HPtNXAPqy213xQXzfSNeddPtb1NG64d1aT1mDRyu0GX5lvaZBfoaJd++RukRLmTaNjIXz
 n+mK/Udfsktb5JzVUCENVmlt2iBhLG3eXRTcxRyBYn6ela1urPy/DLLyJfRVAcKLGDB5hj7kR5i
 LM8pl9ZOC8Vy19Pvs0obJ2CD9NKLcL64c4V+ol/46prYOEIctwq0WflPChe5Z/BidWm/rfncPLc
 VyFnW86N5SwGO4QUL3MForM/G7H7qgy3Pwha0smSE3OGOxIbISUBhCw6k5YvVfWG3mbQS9ivvJb
 +dumTJQYrMdyXwOlfy3D1qzf8aomhc6kqmB395QwwcwOFVjxeR4gm9QgipV9wsvcA9aRwOq6cHo
 qEWskUhBBGlAzjTlSUE+Op/O0zRyKACK4ToDJ4MefQdIut8sKN/ADiSTOc8+wgCcD0DJBDVmCsD
 /+ZKdT0xUuqOBng==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=e9YLiKp/ c=1 sm=1 tr=0 ts=695cd2c0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8
 a=ZKLgdMRimQxpfTQYzWgA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: ZfEDOEM4JvNV3Euw54ESxsRmr4R9yYRa
X-Proofpoint-ORIG-GUID: ZfEDOEM4JvNV3Euw54ESxsRmr4R9yYRa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NyBTYWx0ZWRfX/YgGugxPMmYx
 mExd+yO32Elqer2lfMHXanWZVJkmZNGFbYJ1Lo85Uwf6+FH/+WJ55pGp7zE1XJLJb2xtKbhKStY
 +y49hpYSZ5y8fwVqG6qeve3LNExNtdWk3pizjqcactIxtPnmOeMNXupKeIcEYfldUuwpGbQ9mTi
 U0GpJsTYBEcPlG+qbZqh/ZJY7RfMe060w5gfY0LexwZH1qb914RTfA9kIg3xEVnyFgy9HCGS9HT
 F8aO0Bgvn+dsqRlpfw6vI9olAbvCBd5zh2/XWqVo16EEF8UQrHftd52EUm1PAYSNTf6fQ5SbT4R
 rdUhFO6NElWj9ghM4xamZ9CalLIUOJjQJ4DV9h/2Sy/7RdCm/lyl244oyP9670ECVkJG8605bDw
 KMFwCHA5eGOOCA2cotom5OFX3CfhKLIZWQsCs423+6ZdDu2JwuF+5ZZVGhFp7fVWbIOXYk0bqDl
 tsPJM6uawU4FTIGCvZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_011547_037237_68570666 
X-CRM114-Status: GOOD (  17.05  )
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
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Depends on first patch.
---
 drivers/clk/imx/clk-imx27.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/imx/clk-imx27.c b/drivers/clk/imx/clk-imx27.c
index 99618ded0939..f2f0d3fe5c52 100644
--- a/drivers/clk/imx/clk-imx27.c
+++ b/drivers/clk/imx/clk-imx27.c
@@ -171,17 +171,14 @@ static void __init _mx27_clocks_init(unsigned long fref)
 
 static void __init mx27_clocks_init_dt(struct device_node *np)
 {
-	struct device_node *refnp;
 	u32 fref = 26000000; /* default */
 
-	for_each_compatible_node(refnp, NULL, "fixed-clock") {
+	for_each_compatible_node_scoped(refnp, NULL, "fixed-clock") {
 		if (!of_device_is_compatible(refnp, "fsl,imx-osc26m"))
 			continue;
 
-		if (!of_property_read_u32(refnp, "clock-frequency", &fref)) {
-			of_node_put(refnp);
+		if (!of_property_read_u32(refnp, "clock-frequency", &fref))
 			break;
-		}
 	}
 
 	ccm = of_iomap(np, 0);

-- 
2.51.0


