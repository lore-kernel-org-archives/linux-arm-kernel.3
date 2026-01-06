Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91BACC47BC5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 09:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TVJbv/lv1mJxKEXbFe7HFa6qKPqOIW0YhqRLM00SXEM=; b=KR2ZHExbdciUg9I00JV/By6OZa
	5kV4/DNha/uVmIMLSGFwY+n7Odcz7/I6oaKWjhwl9XIf4GnENWsKtMW9omUdMfuWdrN/UKzLxFVsr
	Z8/ONp5mfScMNwdtvHzc7YbuTtruU/Cf6ypuH+yE+EDAZ4H60z8jt1wv1A1LZfNINqwzq29L9u6+q
	Ok35PU/xrLLf32eQWhOIoGMwSmtCvyooGhXwWTKGEHfsKZzZjE86nVwUc+3f4J0jwJo8p88mLKAvW
	gdcq2oMz5M9R8vDIjajK7vj9pb7qMi0V1bUASsc0dHMDkQf8dIOcyW6WOcZYmRjSjjmkykTHwVFS3
	Vnj33dyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd3AK-0000000Cfvd-33CD;
	Tue, 06 Jan 2026 09:15:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd3AD-0000000CfpY-3w5A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 09:15:43 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QABk2429874
	for <linux-arm-kernel@lists.infradead.org>; Tue, 6 Jan 2026 09:15:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TVJbv/lv1mJxKEXbFe7HFa6qKPqOIW0YhqRLM00SXEM=; b=eyH1dS+OWuLPBbeG
	s6hOZ3gPsINaPKOrfyjBZOYXLnvlD7li5rlELpB7ldxLd9kQ2KYk2Z+zYUHfK5gW
	e5GPW6fTyqXI0escRoH94iGB1zGtMjBZnbRnFOMMvZi47Qd9wlpf0yJWAitw5Eyn
	ylirZ737//9kxEzncgjqxzmIvOcACfLle6eg1DiI+Nuvnp/abfn2Cp+7VMtqibYw
	T+a1EWqQjq5TSHQfZw6x4HRDjrYUVxeJHF9wb8M+Uzwo0TnANx7YEcDmYoDxmk8N
	6w58V4ZY2xDwbsa4QYVIkMT+IWa86zpFI99Q4K2JShlug2NVO3Ww04Shpg4Z64WB
	eJOHuw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgr7399uw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 09:15:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed74ab4172so15714511cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 01:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767690940; x=1768295740; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TVJbv/lv1mJxKEXbFe7HFa6qKPqOIW0YhqRLM00SXEM=;
        b=aQ0W29i1Tp5vG+vMkFZAJ0s3w0n+s7nJQ++5a5NaNmBU1udaF2f1ZGHuoQKcr6lNp2
         nV7VU+UJ2nQcILdX6tyOUrlZ3fPGIPsTslQpznktvej2/dRwS4Tao5ZDa4vZ2UG3sUSM
         atl+pa11y4985TE5VaL9/SRShACHugkQGfIg6ckEN0S09boi4enkpt8B0SVMOeU2zTE/
         IPznoybhpCR5a1AvQk/qBSyOtnzR0Gq7u496lY09yFHbCvOSdlDbcafV7Nsex5O3Dk0G
         x2SNKqgVMrqc8zGcvN/Hcio72dlTaj2/BAIiJZljE/mTgttUI2Q4xHGdV9a7mfZxb+QQ
         frlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690940; x=1768295740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TVJbv/lv1mJxKEXbFe7HFa6qKPqOIW0YhqRLM00SXEM=;
        b=J4KcNpMazMKEd48LQbDIR+62WyimhrawzaWNvTMuKVfy2xatpMefe48XgauWzvckfs
         HGm/eLMLlOGDBlUkqk7lRQvRQj1jM1UfFbswkNRZabTixUe76nHP1xRSSILjN7pzKsHl
         u4XdHge2sFABJnj/0SeLs8JKQsbqlZSPsfl8zJT2xHovX1RUSHhIpKBlZn7paK4cvCwn
         fIeH2VH2+mV3Vjwa9IVustVIKacEXgO5xSRNK/Q90keTgWk5wyZMLuFcPw1uRqFuwY1D
         CzSDGwKEipZP9WZzkNwLsEfyOt1AHS9Pr3dVG2RHSnBuhQm9QGwzT1ZeTBUPcuvHPt8N
         Or7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVqDe1sssMBv5b2QZ7G1y62uihNU1diFs+CIWhYIQcgx2Ci8bagqYQRhhy4TP9lv1JZePaWdqkHsMJQFube3yij@lists.infradead.org
X-Gm-Message-State: AOJu0YxNsEyhDi52papbnSQCGOpAWW8BcYARA5R3K+JLC7piCXOyFf9A
	V2G0OtTaSSpRYXM8M4UULJOYvJe8TFSywii/qshEDfwjcNDFQR+78tB1I86g5AElaNCDhG7Rmn4
	RFiufg6tDc2P9EuqNqluBhuDuyWTIgGJhS0sKWNcfuFXcu6JQb+lptsRv1qVdfzJ3/dh/+q1ZmZ
	pZ4g==
X-Gm-Gg: AY/fxX7od5tuwjad87k2hzvoUuiQzPngTCxr8gUtmki16eYjrupUHg2dGQSSwww88Gt
	JoPJAAtNA03P2aFEFbYiDmGQV09fbJ/jIG3ODd5901sgRwXKsVdfJNNaKjEb8UOUkrXfH7barle
	7/AAr1qgyrnvTjSnw0ibKMFtrPdPUen+8WVhvmw3ajama80Kp8a6qmAvc94PDS82rFlDU2qT8Zr
	BRgeH5ngkKUe6n4fDQ18DqGMiampJCQ3JymzS4SNASwXCJammLDf3WaPTrKUCmTrqFJ7BtVKtK4
	R0CnZTYMT+HYgdNfFXpZ5Cwyi9ILT4Xi+JJAP2wiwKQXNPfDMAtXEM+yGiTOu+23pMiUBUj8mwn
	lhEunPm6AQwUff+DeUVq0iQur0I9eD7YDSQ==
X-Received: by 2002:a05:622a:5808:b0:4f1:b5ec:dab3 with SMTP id d75a77b69052e-4ffa76be5acmr30003721cf.18.1767690940501;
        Tue, 06 Jan 2026 01:15:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEn9FxKXGa2KHpYz+ZQQB4vTjxpZoVrkeL0JR870oJdg4LQQUiHW7/3aZHLy6E81IxKYYFXcA==
X-Received: by 2002:a05:622a:5808:b0:4f1:b5ec:dab3 with SMTP id d75a77b69052e-4ffa76be5acmr30003321cf.18.1767690940057;
        Tue, 06 Jan 2026 01:15:40 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm3271370f8f.43.2026.01.06.01.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:15:39 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 10:15:16 +0100
Subject: [PATCH v2 06/11] cdx: Simplify with scoped for each OF child loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-of-for-each-compatible-scoped-v2-6-05eb948d91f2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1064;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=etPrXIm2DbWPr0yBMZ1LGq97W5bne6RQqRx/65G5X9g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpXNKlGprAVyAJUtewyF+XMt0Npi5Nw3QQowqDq
 LDolXwelDiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVzSpQAKCRDBN2bmhouD
 1x2bD/9ffIJpL4ZbW/U/j7/3q3tt0Sx4jOdt9UJON5xtLy+81KBOaJWv9oTsWblixcG54IEdSDb
 ky7CLtrOVRm2nsU+I+NZsivbLdkjDaUUYYJ81APzHmE8NPDhiTh1Zl6G+lqyRBDAciyuQmWRs7E
 ba/15aAWk7sWBXMnoydUPhZ15VDFbuKdoCVhGGh89+SlpzqvH93ZbAfMKTExQ6AJ0Bayl24XUcL
 FbEJPOpqJtUYHuZHEkGiAX4yAD53c/uHVRFnAWjHNNeZ64IowWM1AFsZRN2iOWJdR7k7DJ3ds+6
 2Qb+bTqYFQHlnXnreN+NqCM3//8G1U3N70mQbcHVtFHdky/nIN7AbCjrIOupaGoxj7F1vYXeiVJ
 kM2BSyYeiztbDN5XccMSa7lqvsMOIhrgV/6k1j2cxdn3adot66K95rAS0SFrBfPlg/fIrbtTeFK
 rT+cX64PbBE3jYVR5Flq8Q2Dj0SdVyluiX9dsS55YjBMOEGp6nsElIsWQulojsCkVMAlpuW/Y8F
 E1A7pherppgI/uQw8ZNgElbPB3AlJ/xlc9SXmU2OcQwTKB+UoVOn6RBNt9D+MpE5bWw8IhXUt/t
 cgiUVpMoOd1sWskTwc5hQT4lNJafHtAoK7gy8E/OPOx5MlQXiuNUnDTrRv0EZK79EeHYlEtXJBj
 iUssT4/AzCEIFfQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=QrxTHFyd c=1 sm=1 tr=0 ts=695cd2bd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=lBFd75AfmJVjEZM8J80A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: sd6m12GlmJL4fGFIvXIZFVmR09wHjk07
X-Proofpoint-GUID: sd6m12GlmJL4fGFIvXIZFVmR09wHjk07
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NyBTYWx0ZWRfX+7Ez9UJJiYP3
 e7o1iEiW3haH/e3RJXb8wNQ5JcI1GQh/O3YhuYl+jzz0cFatAyuqdi3QGyO0xqyB9JFJ4F74Y5w
 QDdRfCyfeaW4Qbl0EjVdQ74V4y6Ut3T6Uy5riYfsQXDS5RLOqL1Tz+/GRpQ3/NGYbzh2esiAXvV
 7Y9sCs3ufUqzg+REk4QFNoVmDCSVPB/gq8IXj1wOzoAmVmGMagufZ/H9dRFiwvaFmhvlrD/e76D
 4f4p8Q6Y5w4JNA2P61OTUf0iApiGdJijhHvuRiht+GgRFdI01FXe/utqvglkODMh3FaXt3jCrrb
 IBbRZuvInRZnzYLktBpQ7zRHlDnXod/Md9NQ6nijmBZw1QfN/Dv55KIwW0ovVEbcGs8rM1TtKHa
 lcVz8puCl/zgm87Pyuofs0eDaU4YRgPG5T28X2ZnPaiekxDN+HQjgoA16h8nIMtTJmA/WzS2Jeo
 SqEApSYf8jwJc08O0HQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_011542_138606_80A8A2E4 
X-CRM114-Status: GOOD (  16.61  )
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
 drivers/cdx/cdx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/cdx/cdx.c b/drivers/cdx/cdx.c
index b39af2f1937f..bbde529aaa93 100644
--- a/drivers/cdx/cdx.c
+++ b/drivers/cdx/cdx.c
@@ -608,7 +608,6 @@ static ssize_t rescan_store(const struct bus_type *bus,
 {
 	struct cdx_controller *cdx;
 	struct platform_device *pd;
-	struct device_node *np;
 	bool val;
 
 	if (kstrtobool(buf, &val) < 0)
@@ -623,10 +622,9 @@ static ssize_t rescan_store(const struct bus_type *bus,
 	cdx_unregister_devices(&cdx_bus_type);
 
 	/* Rescan all the devices */
-	for_each_compatible_node(np, NULL, compat_node_name) {
+	for_each_compatible_node_scoped(np, NULL, compat_node_name) {
 		pd = of_find_device_by_node(np);
 		if (!pd) {
-			of_node_put(np);
 			count = -EINVAL;
 			goto unlock;
 		}

-- 
2.51.0


