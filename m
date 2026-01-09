Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24952D26D6F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 16:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GXdWjT260fGUyPDLJnEoIPiY7XHrVeOdDpdi6E4I+ZQ=; b=k9Yxo81YoL6IX2vKByXDbzFcT1
	yQke4aCP0We/zgpzIWy8Dq9zfx//WTC/UCh6g9F9g35bMxITXdEWvriuSxyd5E/cBcUErd6GAdwPj
	WIFDNh50FK6OPdZRvjMlfryHd8Rf4vjdxhYHVr7SecpuChYhVAGnpUWRIx1qG05wyvrKBvlNy26Y6
	wXv112H8Oniz+2sMuSVU6CVfuwMYt6bjWzlKCiSg+yzLavLApWGgPKe0eZtcsFjnNA18MgnzhXKQy
	DZc7QtO6Pidnw7F7BZy+1BDIea19RBMNwDNsKePz82ItgEp8T/0q40MoWFS++tNg4qwz7WQfjIkxq
	peXmZbZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFoe-00000002fY5-3PxD;
	Fri, 09 Jan 2026 16:58:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFob-00000002fVC-2ShM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 16:58:22 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6099XeKF1048161
	for <linux-arm-kernel@lists.infradead.org>; Fri, 9 Jan 2026 16:58:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GXdWjT260fGUyPDLJnEoIPiY7XHrVeOdDpdi6E4I+ZQ=; b=GtbD/J6zPFKPLpSc
	W6GI+BDhloVRzAm82fy3V2eaXJcl6K8GEi5lZwiV6lsl0gYQu9rlK0PtydFVXzVC
	JFr1WZxyod07PnIh3O6pxGp4VEpAEvEzodGhCQvhRVGxMpezhJCsBwGKXpoaEaDt
	rhrUXarXSEWmGjvEm8A0DcCt5iNs+Ko7y+/YJUdQHOK0H5/zdaTRzViLLQ4bpgs7
	labG+r+na/Wxk8V68ht6ZHyU75O6YSYVDHIzv9wtcZ7Ii9mNGRgSVJPUbEgQlR2y
	Wi27kgWIssIZO7rfFlQS4JaaCBM04mYu3lzUgpnEZu2ttVLcUKL3clBvKDBa5e4r
	4/nRDQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjy5b979k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 16:58:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c1cffa1f2dso878348685a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 08:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767977900; x=1768582700; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GXdWjT260fGUyPDLJnEoIPiY7XHrVeOdDpdi6E4I+ZQ=;
        b=TVlmaMcHDnJFvW0KtN31USxbihS7JV6qD9vN2/5ii+phXBqY9lVPAi8kJcf9ZeCxTS
         KibdrVb+w4DDfyGaxsS+bZ+s06ekK0wOcJVMPKQRhwWJRUq4rJfAjqLmI0AaVqCHk04h
         b/g+aunWLwJeljPnf/0NOb+lm5MpCxhrnsUTKyqr59UkwdDO57g67Scz7Qus8Zj6KNie
         T3w/GcgRGdvyO5rp3nVA4VJJNcbUPswzaEqhWpDykGKb0Nx9kRMeNdLMkxd/XbohpGxK
         RSMYFxrrIn5GXyEIaOsc1YLZJqBx/H2innJkFREfWlsOgLJcz6MgNJTuZZDDvwkJyehW
         JKrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767977900; x=1768582700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GXdWjT260fGUyPDLJnEoIPiY7XHrVeOdDpdi6E4I+ZQ=;
        b=Gavguaqsjz3hq9pNp4UE3xR395MYcra7LdiD5kKrY9U39dG0A1Lp58CPLhRs6cSziQ
         tiHnIhJ2Nf50aurnPu0jFmRL6BVadB56hIFWi9cPTXuIdXyw2UkDzbzGcv5jiJLF5gLq
         pBKa7p2FttTQjIXt+2grA6P8DvpCQDqXkh4mpSwnsrGJAAKWcnUh3Yi5zE/XNL51QCRz
         QPDqEbOJ5DqxryDwXbRSDXiKbjYnqv8IogMCcFizC6DNlyyVcmjlCi+lztnTTIPYhsHi
         XKpGu3PrRijnZhIqzED3+yLaPXyx9TWZ7NwMpflHQh5GPUOP7NHbICHzdDJ9BgN7FEmJ
         hEQg==
X-Forwarded-Encrypted: i=1; AJvYcCW2s9h3SbkLnrGc0d8NlYC2W80Sqi6vMcz8N8GalGXneq/meYTp+0qCxKtHR+IDKJbIKmchJ6ttNi0anjKIb5um@lists.infradead.org
X-Gm-Message-State: AOJu0YzAhcYkeP4mnGJb8QRMH22zz0k7oVGkFTAYDDx0iqB64HIxGfp/
	bVwmd1YIk0sxjtEBbOaRFpBI3jm9Dvom9ddLjnT6k2ozoKsXo77RpGCi6b81pOiiWFd75PK20Qc
	NQD1ymMHPQppRo/8nbDbtwUH/G4yJVCnnygO/3D4OH8r/3ru/ZyDy9VwrpiE7I1JZ9O3OGzJm63
	sKwg==
X-Gm-Gg: AY/fxX7sTkW+ErF1YUjFU/o2JI+mny70LWm6iw7zraRlsDri3DqXM6qWWkvBQtUPpiD
	OJdffoStbQnrZBIp1R3QD9qnknva55wRaAVluBhVkVN6gdOCzJlMWgSyJLLop10fHUqQltp3GD4
	oCxRsA45L9b6E9lDouxsvlkezj2MuI9b7LUwfrRyJIwVR6B089UaRevyaudSCQoqiro8vSX4KTI
	K1/JtqTzhUVVQGKzVuxyzLbAhYNJEEp03fgCskN1cpau0COTWTq4YDSuDRgxIkoT9KzVLDGGUHL
	3Awr/4pZzIdwgFym5ZVblHwZFszLB3XmTyNqNwmtM+6d8GAkBjhx/N3cTPlFMGWhKZ/UxRjc/Rw
	+3vVGnHwAiJPuse2Yt2BdCP5+MC3zhS4+3w==
X-Received: by 2002:a05:620a:1a06:b0:8ac:70cd:8727 with SMTP id af79cd13be357-8c37f4d721emr1783521885a.11.1767977900102;
        Fri, 09 Jan 2026 08:58:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfx/aTgL387I1S/9aU0ocVMFyV/LqLV/0AqK+x6nzaCXP2E2+pwPoObAcqJpS1Me1ayHGncw==
X-Received: by 2002:a05:620a:1a06:b0:8ac:70cd:8727 with SMTP id af79cd13be357-8c37f4d721emr1783516485a.11.1767977899620;
        Fri, 09 Jan 2026 08:58:19 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm23231784f8f.31.2026.01.09.08.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:58:19 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 17:57:49 +0100
Subject: [PATCH v3 05/12] powerpc/wii: Simplify with scoped for each OF
 child loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-of-for-each-compatible-scoped-v3-5-c22fa2c0749a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1298;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=fbIWwHrmfYrR3vDomTykam7HF7n4jDAXWt4nFKTvi/A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpYTOU+9yDCXvKsPVTAtxi177gAE8GsYE80CyIe
 miqCT3L3HqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWEzlAAKCRDBN2bmhouD
 19wnD/93/HCr8QM4hN7A5FkBlG3ipdhLWJ6+pCbCEODwThDqGymMF5BLDYZ07GFdUN6deKJEzRu
 7dx8cnLlatfCl44Ij2C77df+eM9l9d6pqaWp3LaxMI6ewmFPWYs1DrZBtFZEOWcxc2LxOprbIIs
 3hwaOIU/KhSEf0Oek6tSRXxgaD8Ca2K6h5gnE/wWaGG3ZNcBxYOk/GKxpVPCX1y02nsUKWPZ2zN
 KZpY3GE+jGraCMI2EpxrMd5aXfjRpVWJ13+I1RY+dJ9sqWrxMEKJ9q+FzF+9at7yuU2+fMGaww8
 PgPTMbl40W5CETrBgU0jac0FsduQh1AKvJK8Q/a8sIZdzmP2uXM6twdzJovFuF8cuGF+tge+l4g
 ANnBZUy118+HJsSJeJeHoLiIvfxgASWQAkiFfYa5b/v3n5MqsGkTn3O08A4ltdiTOk3O1XilzFw
 u8bnzX/+kNzlDYX2pVbjczrGeNbdoL6O/zxXyo8VQWLJIhIUwpl0/eYWzW43xjQozUypB3Lcb+y
 pzgUZR87tm64oxcdd+/5A/8T4EDqwUHmZ5bh6pqto/4vxNp2AyOmwjTcr7waICJv6ugTTFgbxRx
 XYaub+a1YdmaWK+jRmK5Fpf5C0nuCQ+xVhMPUVi3QTlV0NXIMKQr6bazB6cbM7asjyrSPkqk961
 hv8kSrk5jZ7Nbnw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: vRcqII8VRvClAwVj13Znc8N2CGo0B_BZ
X-Authority-Analysis: v=2.4 cv=JP42csKb c=1 sm=1 tr=0 ts=696133ac cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8
 a=uffMIp6nSmQIayL3VFUA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEyOCBTYWx0ZWRfX6vwcMUN2zt6a
 4enmnsyTEicTzbQPK26VUzpOPQvzpTE/L02tLpLyui8zouV0Zs3HUC5lrXzkrD3y0ys/odwVYel
 PRnRywQryI1lhiVf6Wt6ypEBNNKEUfq8jsg6N5/XJJvMC6qM7ZmB34Gm/GztoQtv3no5uKI410o
 kqXnEPEzujXiPrTnkxqnEKujzrD/umBJZmIAqLN6O966TIS43hFOw0Vg9e8tos57B3ckB1ldc8c
 xj95iVtnz2gfDK3/hRzh5TMx91/nC9xpg+jLL0/RvB6KYYnId88b2MZ93vKtrrE9LDvSBPJOez8
 QRp75HhTukRGU1RS4TAdxWGfob7FBLWP1mQFpJsdqk2b4+cCjI2pfzzSI5DiBaboU1N4XhVVIpe
 hV5ZKc12F03zz8Nep8krt3nZ2WOODqTH5dKeKI4JfNNn5iWfxaGtXgnCYtSMlLb+i/4N02d1etP
 J56fquX09cKb/7XJiMw==
X-Proofpoint-GUID: vRcqII8VRvClAwVj13Znc8N2CGo0B_BZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_05,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_085821_750485_14F0AF1D 
X-CRM114-Status: GOOD (  15.29  )
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
 arch/powerpc/platforms/embedded6xx/hlwd-pic.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/embedded6xx/hlwd-pic.c b/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
index b57e87b0b3ce..1522a8bece29 100644
--- a/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
+++ b/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
@@ -201,11 +201,10 @@ unsigned int hlwd_pic_get_irq(void)
 void __init hlwd_pic_probe(void)
 {
 	struct irq_domain *host;
-	struct device_node *np;
 	const u32 *interrupts;
 	int cascade_virq;
 
-	for_each_compatible_node(np, NULL, "nintendo,hollywood-pic") {
+	for_each_compatible_node_scoped(np, NULL, "nintendo,hollywood-pic") {
 		interrupts = of_get_property(np, "interrupts", NULL);
 		if (interrupts) {
 			host = hlwd_pic_init(np);
@@ -215,7 +214,6 @@ void __init hlwd_pic_probe(void)
 			irq_set_chained_handler(cascade_virq,
 						hlwd_pic_irq_cascade);
 			hlwd_irq_host = host;
-			of_node_put(np);
 			break;
 		}
 	}

-- 
2.51.0


