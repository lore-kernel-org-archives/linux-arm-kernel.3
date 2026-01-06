Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683EAC47BD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 09:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oArkW0LARboCK7gb4mMn0LYpSg410D5nG+SDjMvZOYk=; b=nwwNSmGs+K+NnEl8pXFn/yTTfh
	YDa4CLVrSH3x1TZk/AtmL6KZ456AHi9f2iGbLEd1N0FxfUt7Snj9gY9E7pfriAE50PLicZclymume
	h5duLGTWvsu2/wOSp6HCRescNBvr2CaWkSuroE8sG7M3gcxRYnsRsY/lfhm5E+urguRROQ4abOQNJ
	MQTNHcBIvt7MWoGjfGv81VmFjNUdN1jT5o2xQC0r/5iEb2ZOyHmJXo84yR082qabvLIknZ4dkH56v
	ll5ACdJnlsOlGShvAgXs2DqM33LxW3Lsip726qs0A6jhz1ojfS2HsfCJw/rzuoH0tMYOCEm4kafVn
	E0m3avTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd3AF-0000000Cfr6-1UDp;
	Tue, 06 Jan 2026 09:15:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd3A9-0000000CfoA-1B0q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 09:15:40 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QSdv3272106
	for <linux-arm-kernel@lists.infradead.org>; Tue, 6 Jan 2026 09:15:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oArkW0LARboCK7gb4mMn0LYpSg410D5nG+SDjMvZOYk=; b=AzdlmuaFqTDxLjwR
	lohgu46V+FUulxlb/1omdPCuQmuu7RqLlas8Etshz19artC/z6uv+dXK2JRYKQcX
	7HgPUw/LiSgZBfdQGZw1RSZBTHqHZJ2D6a0HhKa/4fXnE0y96Qf1h8vMgzoXtCGS
	Gq321I5RXI1D6J+M/ViyEYGaXnSxVGGfUC6thBoyAjA4mbnYaJ217F0lJuOwCug6
	d2HwfWpJOBXjws/GSKKkjQWlm4GfhKzYyZ1j4QO0QuGg20lLODZalEBtYszTnn3a
	nyYokqu4Mnx3NPYdmn1PyjW1dwSiZrWp9lvMntSgpzILBEc1n1xEmPeVTW0dqCow
	dRy6OQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgfv02qep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 09:15:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f35f31000cso11694011cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 01:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767690936; x=1768295736; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oArkW0LARboCK7gb4mMn0LYpSg410D5nG+SDjMvZOYk=;
        b=O5K7wiO6Q9NCkm8fTIbYoaHBiL3m/lnVqObDQoulWkznMB9Y4aITCexkOLG9/ZJA3Z
         0Y1iVwj4CsHRct7RYOsWBpCwidnCGhQcWyWiS3MLA6ryzqxGihFgiIuTZ13LYYpnrYCu
         9d34hPfj5k7USJmZmuH0z1xjlK5E/f6Qk5qa0VtEgOWOl2QomBJwLI05r8xGml2gVGwF
         dqYMkPh/1x4qvLV2gjWnCHl2+w1GO1upY9xpGmmm8RfpTr0QUEFnUzqsQbNywlCscbqX
         zrvX9ADzTg55VnY3/ERydEBRPAQVn7UYLJ3jAM9MTRuryzazpYjHEuOCKY3Nhg5IRd0Q
         PLbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690936; x=1768295736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oArkW0LARboCK7gb4mMn0LYpSg410D5nG+SDjMvZOYk=;
        b=ZCi8uf+4uaM4G4GeENDdUc2lGBqQjTwTlB6yvhxyFya3o+6fn1mVu8BC2Iyya4g/aD
         oP8i6bzzYuNU07Tnw7hXPjP3WngoAvPAMat2WKLGYoqGF2sckwcbtPfGCCnsdZ3QW4QY
         pUwMebz6yZhQIgJgb0n1KX3V5EdJdN7teNC+I/PKv0FRrvSoVPJXuzYlGeqIyXcPvMm5
         l2RqSdoIhM3vkOmTyWY1fdCH2uh+fbLNF/tkkxlf42E5fSMt32+s1q5JvFK7cm4fscrO
         uVEC0SLv1UXXGkVw1rOVja4+GhDeG9LchdOHlvAh8A9d1hdgdaMi0ROC+mY5MBnxisZm
         Ji+A==
X-Forwarded-Encrypted: i=1; AJvYcCUDRZAe0HyBKW1DWtCfhlHphplX9MZjTOh1/u70Q17hQ6nGpbORPQnRYCMZ8NS/m9C5sO1LqMB9l2/6ZosncHjc@lists.infradead.org
X-Gm-Message-State: AOJu0YxAKAUPOhNif6HxfjX0NsATVuCC2R5j6q6FZkrtNZuJ9Yi27HQF
	1Z9RGKsslPNbODmF8Pu//TPQur1bi6UCEPGYEtlcdV1ZO4yggsfyf9jN3N72bK4T9TJ9y1B+WIi
	Wl+X+/EUmRZsUwTxZPrPG+HRBamedk4PM7WVqcCW2VbPmgkUx1aHNYTIHdqV5SDtyVV00+0hc9c
	KuNw==
X-Gm-Gg: AY/fxX4Qe9NaIMm+XQhGhlALg7cSJjWU3NK6ouAC/BbZQb/cN3kunBVerQZvjl867Au
	PBi+eqeetatj/5+bsMXB1ASiT+4/XadPYjx4FZe/whZHlp7ihRb9uLdVgrB6e8op4YBBXK6JjJJ
	Ct8md7i9kvdwG27pQx/ZclcnpFOLzH3iCEIGw6jhY2TFl/WHvvjNMRnJSKuLnQKghJs8ZItkkoa
	Tb5wcMPvzVvWR7CBXGFXDvHs5M3I0EH0oqR9V3Ej6B0CviqRfTttV/iUW5zylZQSkcL4K4lKPeN
	UdTk1S9g3LLICmWMNJmiyhn9oizeXYDbVAIyKF9kM+Lx5aCnKV0eTLry2jaosOT8EmnMQoiOxpR
	AGemzuPuLC5qOz74e0WMyyZgb5XwBJibdEw==
X-Received: by 2002:a05:622a:2597:b0:4ee:2984:7d95 with SMTP id d75a77b69052e-4ffa76a1fa9mr33065291cf.13.1767690935590;
        Tue, 06 Jan 2026 01:15:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHj9n34M+nvJtisn5mDYy5RePHoeuMJd4vqGss8fg8pD102xLm7ehjQZBfXUwHbXo0PbhYlFw==
X-Received: by 2002:a05:622a:2597:b0:4ee:2984:7d95 with SMTP id d75a77b69052e-4ffa76a1fa9mr33065011cf.13.1767690935131;
        Tue, 06 Jan 2026 01:15:35 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm3271370f8f.43.2026.01.06.01.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:15:34 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 10:15:14 +0100
Subject: [PATCH v2 04/11] powerpc/fsp2: Simplify with scoped for each OF
 child loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-of-for-each-compatible-scoped-v2-4-05eb948d91f2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1293;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LVLzy0PUtWV8BS2tmtolxGrxYJ3Rutx30xWjiFUNeE4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpXNKjqMnHKZ6rh4xskjSorjbJanJtC5Td5QsTN
 mTpfCmhXxKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVzSowAKCRDBN2bmhouD
 107BEACFykt16DYNP4MhZ9/yYnB06mL7kkZ7VawN7JLM4VGMbZZnQCVky8Sgq0r62VsJD7jf76u
 qQdVNf/zRIeD/kvN9orKScdeDbI/QjucKwW4mh/7f5YQqherhONZveQt0LkbZtiaGFFT6JHpkHR
 zsuoQFMOCWk/R7xs6w4VpqX0vdPQT4m6hAUXWffthiPETAIPGsF1iw7xGlbmtSSOW5mjZbLJ3Oy
 06ZGo/2BVMN119RDQ1dIJpY1nYxwtLZfbaw6M33xnCcfOuM/vxzuwdRCIyW0eiMTlx2+iZOsZlr
 J+Q6NXbGc3QflgeCXkWowuJJzY7ntyXDg/TQmawr65rpzUnCSt24pjKYW3/WMuwj7yZR92AIAk1
 aottxgCA2w0R6uE3O57KbXDZuLEmXQK4cQZksQCm9IYD3T74JGOqlM6ecCJXdrSexAi7nEWjFJQ
 AI9w7ljNyiUl7kE80EV+AX7c4lOx7VQAj8rPZA6QYFHWkkCjOG75QvJX95xOJwQ0iw/5ACcqeKc
 SmTVGMdug9kP9wgBvtuKVW2HQ2Ff3sYSB8cJYSk0djxI/1uBo88xMl+pixFyFzGIJ613VXDvt6H
 KG7HY0sbmwXgL3R6lyid/9TFFYZLCTfvKMG+4Br99v52e9mbxnkCTzR/x1pVmzsgLGquiz4dr8S
 40GfezA/xzLZtiQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=e9YLiKp/ c=1 sm=1 tr=0 ts=695cd2b8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bRA1xQHzFO3ZoMUYUbgA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: TY_8Ojs7ocSeVFdY8lpX-VLCPalGsMv6
X-Proofpoint-ORIG-GUID: TY_8Ojs7ocSeVFdY8lpX-VLCPalGsMv6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NyBTYWx0ZWRfXzhF/mNgXwS+H
 PWr5e+gsxPz2SkrLxCXkMR8STM7e5rK/fAcEeGs4T+OvjrkpJMfyBYq5zH78U6Dj3Quc3eRrJP8
 vdrskbXIGLOEvChCisKE5E85krakAUPZBQSayeuslPKbs+5A2gO23fnajwFxY7LmA/0d1nhWOjg
 dPeSe05ThhCLHSGFN3S2ne7G8IUdsBsd51Pq3thNkuS+hL0dLL1e2ssOYtlfXNq8TCu147aAULs
 N+gFHSnkMceUPaDMnGxe1SiSPskSsTUr8wXank1HTKaG1KYpadJo6Krxe5hJNVP5lBv46AHO9Ji
 gtSFNcV6P55B1OBKx88ax1/XJyHPmT5RqmAyD0EypMav6zy7Kz77U+QWVN9sZf4DPaENU8FpQp3
 hbk9xrQcWOfIO0C74+0EJWDblnrz+qfoiUOsM63nqfePwnJhRAj14C4eJ4ThJi6ulbMySPRG0Q2
 85m2SWprg2lu45Q1zrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_011537_934671_1B89A0EC 
X-CRM114-Status: GOOD (  17.08  )
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on the first patch.
---
 arch/powerpc/platforms/44x/fsp2.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/44x/fsp2.c b/arch/powerpc/platforms/44x/fsp2.c
index f6b8d02e08b0..b06d9220844c 100644
--- a/arch/powerpc/platforms/44x/fsp2.c
+++ b/arch/powerpc/platforms/44x/fsp2.c
@@ -199,16 +199,14 @@ static irqreturn_t rst_wrn_handler(int irq, void *data) {
 
 static void __init node_irq_request(const char *compat, irq_handler_t errirq_handler)
 {
-	struct device_node *np;
 	unsigned int irq;
 	int32_t rc;
 
-	for_each_compatible_node(np, NULL, compat) {
+	for_each_compatible_node_scoped(np, NULL, compat) {
 		irq = irq_of_parse_and_map(np, 0);
 		if (!irq) {
 			pr_err("device tree node %pOFn is missing a interrupt",
 			      np);
-			of_node_put(np);
 			return;
 		}
 
@@ -216,7 +214,6 @@ static void __init node_irq_request(const char *compat, irq_handler_t errirq_han
 		if (rc) {
 			pr_err("fsp_of_probe: request_irq failed: np=%pOF rc=%d",
 			      np, rc);
-			of_node_put(np);
 			return;
 		}
 	}

-- 
2.51.0


