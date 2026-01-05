Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3552BC79F90
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 13:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MDuQ7jwVyqM8dLR2MdkMFCrAzvUDPbW3eerEyflpSSA=; b=mAftE8FLM7DjdN85n9u78+Cj4S
	QCqp8NlV/d0DKnBG/tJJHDo/OrxELmMWM1f64opqGDzVkyJoxnqzBCC5co7hxE1cA5xgydv1+vFyY
	21Euks4Gn/rarki7gXf4PL/TslaJCiAyzCJnVCYmTVcHVmgfp1CeTtnYr6CFajTEAI1uwvIdR3KeE
	HwpDIOl0uHsbjXLcPSTQi8RemSdc3lpIZwY9L1dDIiqy2G0Sw7hCIUJkra3G8fASa/RJzEDB7ftk0
	whSaKOnJuEGdEb9i6jhB7QAQ9DnbXfZZRSCXZxtWlSv5oq9h50XJhC4LnczFpEOMbVt0M0sYMYvw+
	Ul3RZyPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vckii-0000000BSzI-1J1O;
	Mon, 05 Jan 2026 13:34:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vckif-0000000BSxQ-3hnv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 13:34:03 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605A2kZC3541656
	for <linux-arm-kernel@lists.infradead.org>; Mon, 5 Jan 2026 13:34:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MDuQ7jwVyqM8dLR2MdkMFCrAzvUDPbW3eerEyflpSSA=; b=KTmiAZ4f2+7mqquu
	nFT7z/6wpZyTaieeceeiYqcTm/vafkPAOsbuyKb4qia21luKq81Ho7RQGEok7ToH
	72uPhEAazvSCLCb1sfg0AyvDPph6FH+1qchOZqxmB+QTore6vep26fSWDonl7nE1
	jNx5/OxUU3h2/Qx8WFZkXu+fu0FrOgreOD7+HNVyUWjGvaoq0HGKRHVEqH7zx+D5
	RHVd52Hou2ENiHHmQW1cA6Pc+riIF73U24qKtwMr8zo2+0Z37MYadOvlnuAyzF7t
	0KZrYkvRZ424xtzlYxKCdM1EEgcl8HsCeUHyhdhx8tk9+dOSUWdOKNCx8Xm3BAp+
	LGOHeQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg57shma6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 13:34:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f4a5dba954so373724061cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 05:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767620040; x=1768224840; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MDuQ7jwVyqM8dLR2MdkMFCrAzvUDPbW3eerEyflpSSA=;
        b=NXurASmr1g1t86aqP4mLLusV72yY2LvIpwNRnye1VYNL7lU281ReIE1H0pz01fKihn
         woGaeOUH4It8+j6u4PEhnIlJAbEjtC1XPotm2CpjwrwWPrjqCZMn8hJyuDq/pqjoLKc5
         cxr8XzI7jyV40OBwcZgCj1RyKNvzw/LZ79Uxbeswi6M/bjPZcgVA/HgN4NxTSzGHevLD
         Bo1zFNMGKFITIGM/AK2OI8cz4PZjaJJtr4q/pDBcTYQCHXTYKYoUFo7HkSx1v5qkW891
         PgaDCdYgBSJiJANxae2rVMvde7nHfTzcjM/oGfKvnaZd8RliggFRtwgk+efKcaxPDYzV
         RmHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767620040; x=1768224840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MDuQ7jwVyqM8dLR2MdkMFCrAzvUDPbW3eerEyflpSSA=;
        b=biQPubJ19S0wdFgD7UHjYCpaJC+KoBZ6nV8VGtHsGlR6bvrwgHmxFy6IWAGlZr95rC
         XWsa/9oWqqgEbTu2OABKmKesG68UEGOXjPzeUPoUfPbhjTtkQo9vWLdQQIiS2/eV8Nvk
         EagzbgiI/cKkQTV8E8JEZm8PmMkMt3BQRTBR1E7y4QkftK0A8PfvVuVQHDyi7GEuJ027
         dTswqsftB2n3sgyHIVoEGlc21H6hnctU/sRKVg8oP8Sxd/N4N6W6obSQjMNqgffUf6cJ
         LJBpnRubbkDNvCjXt1UpuZq2In8HP+eMKZt4xt7McgotgvGus8gACUysKyT33ccrU2fc
         OqqA==
X-Forwarded-Encrypted: i=1; AJvYcCWQWh3ZK++c1aLBnM+NZTjN0BxHqkj9bzF4O+pNcUo+krLt1DczLfEDOOxsZlOKlJIm8gyXiGUU+PKN6bCquQsV@lists.infradead.org
X-Gm-Message-State: AOJu0Ywfcm/+S3DicquhbPIPwVZmCkE2sIZDI+baL7B1YVWc5+ioJJI7
	dzOMgDEYKD1vRPw0cQcHY5j3AaTcGiffWqvxYzU2rZ7ukVuL+X2876mAHyngzWm50csmtc/V2kY
	02Es0xenr6vmJPH9FECzRb7bmHdB888pC54FQ39r4x7eJm+J66zboy2j0jjsKbkpdbzVBpGi+eU
	Tl2g==
X-Gm-Gg: AY/fxX4500BVRdaa/EtL73llnQ8roCJ/q/k4U/hh6wRrjpKaJCPDF+LAeeDQHOGbq8L
	IQ7uJrzc4qkpxU0NtgZDfBqUAYB5i6x1LW21z94YzNh1EYptr86l64mxf45pxI7m1P0T/TiL8YH
	ycBllG3xKDRFMUbd1kOm114+7k/EJPezof7rVUiK2ZrJZLnDcMLDNpS6Owr6WbR2V4Ddpm8m7gQ
	PH5Uf9UWS9XHP7Gv5aaeRxdPlZxQ23avGs+ywwEFiLF2valGT7im2od5Y6HqucbPcgRRpt2rHkX
	LUX3HhpKEPyexHuytPV03hrJQx5cMhLrr+1LjbLiYgS3vjVGbk6ZjlnaqnGjCcRmGnWHvGNCUX4
	NmA+CUKS+jZa11o5F5O3ihpjwV3GJ901rmw==
X-Received: by 2002:a05:622a:1ba3:b0:4f1:e8d7:fda6 with SMTP id d75a77b69052e-4f4abcd0980mr678978511cf.8.1767620040195;
        Mon, 05 Jan 2026 05:34:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+2uQzUVm47u56oWac1o+unOum2Uh65uFLZk8whT4SPW8P78l+PPnQGzRG1E7obagWs5+I7g==
X-Received: by 2002:a05:622a:1ba3:b0:4f1:e8d7:fda6 with SMTP id d75a77b69052e-4f4abcd0980mr678977861cf.8.1767620039693;
        Mon, 05 Jan 2026 05:33:59 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d143f75sm147211015e9.5.2026.01.05.05.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:33:59 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 14:33:40 +0100
Subject: [PATCH 02/11] ARM: at91: Simplify with scoped for each OF child
 loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-of-for-each-compatible-scoped-v1-2-24e99c177164@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=958;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=bfaPWC73VDShQNH2kIqzuF1gw0VIYTXqr0RY6cBFgHk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW72343oLFYqnExfyIbIyofQ+4lJgORIRg4wIn
 LJNeUB+yP+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVu9twAKCRDBN2bmhouD
 15wYD/95pyYOAVcfEa979jYh09zE3m4X+5flU84acBvxVqaTD34XXFcK9Kzv5oW8nj1++Dikv+i
 D+55T4nth83xvP5ehkxVAE802+nZQ8oWC11R895v5omyeDUzQFeK4vxzXsR50vDpdeMbfD3K5rT
 bANp+cMheGhrvVS2Qddqvv3oOd1n52J6VX/PgHuGZnJb29uxF06SGT6MZWtcrW1DSzydaOWn2iB
 ju02BP25NgclvWYlqsqO/FAXRaqdcmfQE9aesRx6QCN2NWD3oywpUzF275EvPga2Pt1AkhM/tFY
 kRRxaWgsJ9/P8Grzs9ArlIH1w1TXPLeoWJVgwPod4/CR0mchbMJmcrBjVGDOpftwFBP5WM14e/N
 Rnd5dwuJjOXCqk1ZMWgRYb8mX7gYqitraBfNVufk5WNZDlQcRTkUueo84o6EtegrsFI5M9IsiDz
 oM+aK0lQ6AaclAHqC3HksEPslZQOLIcSHt3d1TZqSJPtHwGWUXUlb0AGTCbp2RZNXW/AO1EJJ24
 bk0Syf4125/6q3f5G90w/08kVg4jd1FXEFNsd+/GH6A0njwtwml1WuT6rju927e5IezYtE1RnQG
 Lh5tLdIrb1WNMXyyQt91khSZ+ovCrQVfT2CdkjIHqM5e9N8AZTTMnXpmejqGoTPqAQ2Pcq6O4mT
 OpwyEuBAKtA5MAA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=UJ/Q3Sfy c=1 sm=1 tr=0 ts=695bbdc9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=TtkSn9LXl2vsqZFf_0EA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExOCBTYWx0ZWRfX4RDgMVFu3F8n
 LCEoIxz4GWXCVXmKSYLsAyWVo9KBBGZZW2DqrX4QkMuG7/5wztovviia9br8YBVHOdtsQROvQq/
 bHfhBAKwJGaX3o0TdpfldPnSAMlHxXGJ3OB416DleQMGlnGwa/N1esc1FjkEoEG/X1bwaoPkzyt
 DydzqfOdA5rmDMyVIu1lGOQSJqB93Ipgdg0CMbBKqZs+8pDNSF/dXQkqqiFur/5au/8TqCQ/sOB
 HC36GTQhK2SNNrhydBvqO9puip4RH8ZhIikNx9PRtVHakYlVUSXQBHK3KuIXPxMPY3hwwQ104as
 M8Q8V9GZG5j1coxZbcSCSq4xL4nQnJMFtKhZc4xOGzN3QJm2JqjQ4ytm44Ib9TVyAH1P+oBwpmT
 ryiPSK4ecJmEerbmpqMnmd7DOkGP1G6rJZ5YDMifw+qGDdVGPpDmZt+uokTiPxGSaRwkPMvSyrB
 NpTvOzQmlgfaMqdYeNQ==
X-Proofpoint-ORIG-GUID: 4ARAegKf3zBxTngXD1pMAzGhjewuWubj
X-Proofpoint-GUID: 4ARAegKf3zBxTngXD1pMAzGhjewuWubj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_053401_940088_092D1ED1 
X-CRM114-Status: GOOD (  16.72  )
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


