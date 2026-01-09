Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FEED26D77
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 16:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ovbKKrBmePhAYzcI6ZCSvjFvW5vMXzt/ujfJ3OIR3I=; b=j1HcAy212a4bN1cklFGgq76KR0
	BgtaU8UEF9YAMEX7vR3Nd+K2CkSR+hBncQxsca6pL6gvqZAF6hZnCbTIruaHC/XGqYYLyXjAEJ8jW
	UxhFYGWrMCwBnEjKhh7FV4t6PPOlgYvzUlsbI2sOmVSG2RBzUrozdELSVkr2IIf5KdINKj7udvott
	HdH2NCALMt81rdtIJXhuJ69iV09jIKB83yj/qaMxTrgWYdYOiQBMDlEbhF2rdjxMz+/xEhAAwY5Yk
	QM+NNQi0NfZ2P9D9eCByR/kOVVjVkeUohbcGvrn1jENgZDYztEARthHLYuQYu/7QDvRqI1BgJVs3U
	Wm5Ppefg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFot-00000002fq4-0nZG;
	Fri, 09 Jan 2026 16:58:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFop-00000002fkM-3ML2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 16:58:37 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6099XeKI1048161
	for <linux-arm-kernel@lists.infradead.org>; Fri, 9 Jan 2026 16:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7ovbKKrBmePhAYzcI6ZCSvjFvW5vMXzt/ujfJ3OIR3I=; b=YWiTGxvVE15vFfBL
	1PkZ5modhSlq9rMbB1302WeGwFCjUnXrSizKPUTx1ui0mKgKd08ji7dNxyuknY0L
	g3SKoM3LsaGtmiyBvaCvGRiqqR0iSrPMY/8E7ywIgECHJNfYY6yxXSpPLchBmWFw
	J4XWI3V2LTypt+dR/l/0LrR5TNKtzestz+QTpcJdvtfqVEt+WzgbjvQFDaLZS5eJ
	RefVgGMtGfVW4FPkmD1KX+c70rPtSEoh1iFwZ22URvVEg9+OEyx/ftfZGo+gRahK
	yzaap9JtzoiNGpjVFUtOTwct7Xp4/Fhi2w2y0aT3+sLNp4b95ICWt34zu3p/gNR8
	2fVyRA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjy5b97bj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 16:58:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b259f0da04so1111288385a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 08:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767977914; x=1768582714; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ovbKKrBmePhAYzcI6ZCSvjFvW5vMXzt/ujfJ3OIR3I=;
        b=gUQtTf7mU/TzfagfU57tWIVpsc1ZCKrr5Gf0YiA9rdi3Aa7pggCWcSpSo6NAB9PtRh
         MvuCaqZuClA27TVmMSRZyaZRzTmZIxnrsMiCPeHiIUA7+c4WQw1qfhQ/TcPK+MkRY2nc
         0zyxVxvoWU30DvY1QijB1fq8yg3FZw39q5K0kt2P7v2BqwoxbNIn+IOBD8Af35Tv9J9J
         Cpr0cwAkKRDRKTtxxFugiQn/f4i7uQtQepH776xShkjVDLp0jntdgA+vFfGtowVObSEC
         hAzkBgDK2nZCf79TeWph8YGNdbpnziQYQ0bFveAbPTw4GV4+Ue9CtoL2P76sWU57m921
         xVQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767977914; x=1768582714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7ovbKKrBmePhAYzcI6ZCSvjFvW5vMXzt/ujfJ3OIR3I=;
        b=OQQt645HhV0Buc/N2xICg4JEcRla89Tz0NDMRBUNrSN2sULq4jD2Zt+fQfi90FrQMI
         Dl91y3zPzbAtZgr7fwQt7kVY5n+FVapxjoOmmfVbphHm/jLv9/8n5S8g7oOl21Bg6UVY
         FkQwVuM6OAWCzRMRyvXjbbLTf7H4kEZm0lGj5escvMNQvxlrqXULLsTVHXZ7D5mDugUS
         lz7NGSx1Pi3+6HLyuDsYwnHmB308j6Z9B+yDiGqa0LQFU3oeSld3WgmGIhTYp+rkyuOp
         N+LfO0lF378UefIsafmgCx8lJjomzUdDDFs/f55tElMq+MDGWGTGn2Gi+vuEIEE55N1X
         uFTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLz04PGtYjj1seNAH9tDrcfRWtcF7nmDv0YnpY1pvkVZvZjUnuJzh7a3HYN4aZiojrWt2HoGzr0KIZ+sOwiebA@lists.infradead.org
X-Gm-Message-State: AOJu0YxYRGxtwAYKv7nnvS22zDE5OA9xZHZuMVBCXGAlOxr0r0g76/9L
	1lyvuK4KTaaJo6TNn78GIlpnoYam38fzUmS94cnPbmJkjO9lysUTaBEqLUHRLKPJZuT7C6Ctku/
	Ma8RKwcC6iEVh0Q21kKGBYsSj49ojnGXufuC6UhcuG9U0VXF5yFJTtnp0GhGsrpoBJHqfTmZGqg
	y/lw==
X-Gm-Gg: AY/fxX7ET/QfpAV3E2gHWWXAtyOZYdqW2j//nwIyTfghiFL/+TYIlJMKJOBQ2bJXN69
	s1FWlTk8K5RWQe8je3kir3XPF23vOZdOjQIz5EVFKQuliwhpxc6C4lx/VYU+HPTLHBtddNoASHz
	pammVAnKRqjvV1GLwtKE8qUtUguhfz6RtyRI4RsQNuUg2E7TySuyGNTr9cvThmpSYJpgAj2arPt
	bstn9mrw+DCe5TXA8txXhDeQ0Zpo/uspmqQxwO8YUyZSQIZGDS4v/gYo08j2qPQc3pYsUEpA2+q
	CTnVOXCFFjWh0Fo6gDdHPb7UTHnoq8dH0rTeTF1doyHV2pdV6lrYXkMuyyMHsWz4pPc02rOiB8F
	gemGjECNf+4ea1mi0KpVWik+nSR3KS7nBNQ==
X-Received: by 2002:a05:620a:7088:b0:8b2:d2c9:f73 with SMTP id af79cd13be357-8c3893ef83cmr1176962185a.41.1767977913946;
        Fri, 09 Jan 2026 08:58:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF924iUMxd+MwJ3dGhp/iiQySS67dLxcUnb2YLMcFoaCMT4wx2qTC8T7uv1cj0weZDGRq/u/w==
X-Received: by 2002:a05:620a:7088:b0:8b2:d2c9:f73 with SMTP id af79cd13be357-8c3893ef83cmr1176955885a.41.1767977913425;
        Fri, 09 Jan 2026 08:58:33 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm23231784f8f.31.2026.01.09.08.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:58:32 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 17:57:54 +0100
Subject: [PATCH v3 10/12] dmaengine: fsl_raid: Simplify with scoped for
 each OF child loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-of-for-each-compatible-scoped-v3-10-c22fa2c0749a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1436;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=MsflXqekUXo/aDgUOpqM/A+IhR12MRSHnOb52zLXpPE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpYTOZjtjnuHm6MsFLp3+EGzl32axXLPMxcnb5v
 fcxLyp6KqqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWEzmQAKCRDBN2bmhouD
 15GBD/9pEsoaE7Sv9gNfW8gJEPcA0VfLzP/x1SLnW4JtF28oqZVC9He/51hlFzvBEJRg4A1b+Ft
 KOgvgzZS0/SX36dUn+pRf7ML30RCFvWcM/kSG0DgLYtTzezJfUN0kxc5A/xWKEvuPQp5P+967hM
 H4Ijk6xLQcgIn2DJtoVKHurLdzKhOmZIhfVPdAf1jYBCi9xwxCNSkwMoQfkUExJ5jr3kOeHqvVm
 OYjkMu9ExJBuwfwGhqrOR3q+0Wv0F7OXP0iJN2yGQOlztVvx4e/6EiFZxs37S5+LbXHqV7jXbGG
 CalSNTMChp/eEsmNKRlpdIgt1LDnMCYR+LJslJfpIp2RRLX2kK6KLoX2tL5y/qXLicul2V/JWt4
 O8+yTXm5butG+MSp/njvv83MUAAUxzmaCWYP6tNlk+PAMawDXh4IcyAEYAUkNoHu1h96quF8oz3
 5pf07iFkeS2fqhM1PhJ9VLxtsfBA9pVDVkIvAZQaBk9wreiv65snG9i6OFo1qeMsyatrXCMrs7s
 whC2MO0kZPQPzbg2JnYmK/kfVM/tLzvDn8ASzOUnekSH2fIw1O8GzBFFTHio3uwTdp/jShXzhkC
 zbzxjJdBuQRKlNBMeNmOhu45yvU7SHdE75kpTW1uG06zPaMryXuVAg4y1lGCNI+nBUFDD9hKY0M
 cKfFR2KqKiYbCNg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: qvHVp1GyR-XajZs4RrAThVUNGf7v3J5s
X-Authority-Analysis: v=2.4 cv=JP42csKb c=1 sm=1 tr=0 ts=696133ba cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=i0EeH86SAAAA:8 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8
 a=EUspDBNiAAAA:8 a=RsIb78jGsj8zXbp4E7EA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEyOCBTYWx0ZWRfX/DfLT81zualR
 6BiVdOXP+GPxpwFkQqzyhkUA+4ahTlb43aOJ1D8d3oWZpoy30P8XQ7coyrs32TGJyA1BR9IWC6x
 OpFMIe/39Jq0cEZBatxKYQ8SpdExxcUBdLPVW3VwIFT8nh205uMqdXHfArePEUlz7w2e1uZyUcd
 x4WB2iTL8OK1YuD1veeMaa7nWpoh5xK7tEr8FfTa3sOMcfSwZk7cv22IA9WbiNUipd8Xadg6NtU
 2ltBlv30VniTxziIQvhlk36DsCJVfMxwJLMsrl8SdLoEahiOAbBd5dOQPPsfFJPUw/nng4hXuGX
 tSVpVm3e4GYV/Ys6dsvLa0yXzQnfU/1IyXaInC6O6Xdg4uF38gA4e4FlwdTE9z0mBe73MAVEV7s
 EpfSepiRkDlND8HfZvjfOgClKztQdrX8njUCGF71rTjiSS+xMGZExd8bNIh/g0vPdRI5KW6tWIC
 DHEQwFewl+8SondVICQ==
X-Proofpoint-GUID: qvHVp1GyR-XajZs4RrAThVUNGf7v3J5s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_05,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_085836_036372_257AC2BC 
X-CRM114-Status: GOOD (  16.13  )
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
Acked-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Depends on the first patch.
---
 drivers/dma/fsl_raid.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index 6aa97e258a55..6e6d7e0e475e 100644
--- a/drivers/dma/fsl_raid.c
+++ b/drivers/dma/fsl_raid.c
@@ -746,7 +746,6 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 static int fsl_re_probe(struct platform_device *ofdev)
 {
 	struct fsl_re_drv_private *re_priv;
-	struct device_node *np;
 	struct device_node *child;
 	u32 off;
 	u8 ridx = 0;
@@ -823,11 +822,10 @@ static int fsl_re_probe(struct platform_device *ofdev)
 	dev_set_drvdata(dev, re_priv);
 
 	/* Parse Device tree to find out the total number of JQs present */
-	for_each_compatible_node(np, NULL, "fsl,raideng-v1.0-job-queue") {
+	for_each_compatible_node_scoped(np, NULL, "fsl,raideng-v1.0-job-queue") {
 		rc = of_property_read_u32(np, "reg", &off);
 		if (rc) {
 			dev_err(dev, "Reg property not found in JQ node\n");
-			of_node_put(np);
 			return -ENODEV;
 		}
 		/* Find out the Job Rings present under each JQ */

-- 
2.51.0


