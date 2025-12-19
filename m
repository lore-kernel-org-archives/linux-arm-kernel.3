Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF9CD78783
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 14:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6KPYVk+CR22m/g5FBCc99SLHEDjfYAU2ih06ixsTGRk=; b=nnAs33dEiz4aGVMDFLRSBFg2D5
	Soc/wLMriPMwzl1GD/U8/yVzl4zo9DX+nApNBoT937Fr5j0LssYXu9RFtsCIjLFwb5r1VscLju17s
	fYPnMjPoF/m4mHjyGfLj5gzHo5x3VcP0YSSk7DI9M+9B0LI7uGY4C5PyvwhCwPxMULAFL6BzfhnAL
	Xu2T3zaQ6wS6a9APOmI5LYJ2WPzsVsqVjfAlvtk5GUoclKUmQLwyimVxpyxqWli1MgVOo4OnMW/C7
	kSEftCDXiQOuqu9CidfmeF5NHcVUnAIsOb/X+hAzqJuwVbFT0+eUnxoaTQ4LbMXvBjAIEtXsKjLwB
	LzLNigZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbac-0000000AQ2a-1kct;
	Fri, 19 Dec 2025 14:36:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbaO-0000000APqB-04lF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 14:36:05 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBaR8K4145520
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 14:36:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6KPYVk+CR22m/g5FBCc99SLHEDjfYAU2ih06ixsTGRk=; b=Dx6RAz2MmQbVOKoW
	UDi0K93jkktF0Nszi/pD8lDSsAqYLALDNIz8FwmlIXxBTLlZzeHqx4R7pTt7UhIG
	DWmkliMOf4jN/ZqpamEBz3dOcSS7LwJdW7a23TY7OZqHT94/fYay94YEaGDt2bCg
	eNWxmLyJm3NJOorIOvXcle/4rrXsHtln0vtt5DzVBlYaxJhYfeQsTUSftPurIdlQ
	CziXMC4GXW1tnfR43T+5Uy0uXJn9CEF2E3ohrI8zJzQ4kFYweHWwvMbLzqxPDzC/
	bJhfDsut1yCEbk0zbCdA4ouj3hRi0woR18qT0YgOSfXRgJG7elKeZhYay+WFtIgo
	uEmzCw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2dtyjj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 14:36:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f1d60f037bso37809131cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 06:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766154962; x=1766759762; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6KPYVk+CR22m/g5FBCc99SLHEDjfYAU2ih06ixsTGRk=;
        b=UIQ09wVSdH6UW68pO614QbT7T6yxlFvNwozpMxdUaJsth7DtacnGoW+6glfyLFlr4q
         hAaL7ehw0J18Q6OCGWnWJraO2CksudDRw7ImfW+fKFituH9QkOVsexSTnNXEcPQ2kyJm
         cMSpalw2j/3SeUA/gLY9ez+x8/ijqBqkdOnV2ZznXK7nzEks1PFRraPjk+YDlauG+tMS
         c7ZYUhdye5pekz+U2ZMShDTi42Uhye6NRd5f2o2K3PXnSfalHnbs1eGcEpS8R/b8rGQM
         /KanYVOpjlvgJ17AMUHN9VtAK+d+6x6FvHQwW4R0yIHMp/F5iTEOty9Z6JE8fjRm5zbB
         jytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766154962; x=1766759762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6KPYVk+CR22m/g5FBCc99SLHEDjfYAU2ih06ixsTGRk=;
        b=F1UU3/eyz82bo9K7FgaxJoWCCfzjfxKxJ/piHRqDgwKt5/88dNd+dS4xghNiNSIG2+
         4GgmVN9mGXFDd2hKl6YZ1LTsYucLMH5iadikhdbM7fSD5Hi24BmemxdU++BphzDKAO9A
         EUXnsGH+GnhFmc6asFEeVevQda3Ae3DAxJnCHlMn0MK+OPtfsMPDQAO3Zm3P+VWgTod7
         DWUqI/dZaLOwRz9GXHgb2hv02lblhiypuAVNgNZ5CTiF0Y5Kjn93xYHssmrlf9Y3woTE
         t92AbqOVANzaKy5s6wd12latFDy4KRc9Sv/7ti23ZbHPCrLOQTsOmu5/3ar8NeyeQP6L
         hg+A==
X-Forwarded-Encrypted: i=1; AJvYcCWqkAhcim85us8gQgdDozrqkMf22U48TqhECPWaQwIapYMcOXbdQJf/jpSQEgXx6dqfyClzIb/vCX6D/zADjs/g@lists.infradead.org
X-Gm-Message-State: AOJu0YzTnUO+tOLGg/uRqqxWf1sUkDxY+kFuGICY508QQlBoFoJXoVXm
	I75DmWWUeeNdwIeyrRavh+bU8Cg4bpkgY7B7e2Vq6/YXFnONb5EXzc6SiVWEkJ0qzj2Y1CZ5uhY
	wKMiZ/ffx4DUn6m2ltM03KI9kE5gsWZovAwA51rlqgs2sWa/HCifGj9XeBuNh4EzcNagTOyKNVM
	cxCg==
X-Gm-Gg: AY/fxX48XWnBFmbmPLN0qAtmjSnn3hpkcDnSvh+Cihs3CAJD+jYpoWrIqiH30vbP/Cl
	bSwfviYdfPbwEGe2UenzhqUX0gC5VPAUrwY9Yq39OJ+TYLj/egrngGenNGuFMNYUzgRja4K3feD
	Ion2rs7CIg/bLs6UppWJlzLHZiyMXX4eJsXpBs29hnZ2UtxhewWH+COK+kb6YtdkxDQE21nK78y
	Uv2L774CE8n+lXaapwb4WeQiWsW6RIlsMb+rpLw8jOY/fqXgWssyyQ304W7I61xO9fb8MmkzkhQ
	DaH6OE7ta3AiPIVqtUnzumb4sSBrxVW4jUzLDZz/Wx0fWEXsViZjTc55yrKWPSGBHylGlLaadC6
	dHsUwW6xPDiHkVeAWZR2HbN+zBdGnTHJ3EXzDfVHbbcplf8lA+pU1WIxkCqCZ809QYEqX
X-Received: by 2002:a05:622a:5909:b0:4ee:2c3c:6e with SMTP id d75a77b69052e-4f4abd0cafbmr40585941cf.30.1766154962198;
        Fri, 19 Dec 2025 06:36:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEf/8P/7gffTggqaLL7XA+UX+u7FNuz6BrjE8UubcGAq9Jn0DzHD2i139MD/SRvhbhO2DTJMw==
X-Received: by 2002:a05:622a:5909:b0:4ee:2c3c:6e with SMTP id d75a77b69052e-4f4abd0cafbmr40585381cf.30.1766154961735;
        Fri, 19 Dec 2025 06:36:01 -0800 (PST)
Received: from [127.0.1.1] (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ab7f86sm245145966b.17.2025.12.19.06.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 06:36:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 15:31:53 +0100
Subject: [PATCH 4/5] iio: adc: rockchip: Simplify with dev_err_probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-iio-dev-err-probe-v1-4-bd0fbc83c8a0@oss.qualcomm.com>
References: <20251219-iio-dev-err-probe-v1-0-bd0fbc83c8a0@oss.qualcomm.com>
In-Reply-To: <20251219-iio-dev-err-probe-v1-0-bd0fbc83c8a0@oss.qualcomm.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Heiko Stuebner <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1502;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Fmnj6mVvpbfLtwijoNhLAn9j7guM9pp4HVJeADMhGe0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpRWLH1EFl2sCBthzt79pkShZZiMmOVlFkKcQCW
 mlR1bgxXBeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUVixwAKCRDBN2bmhouD
 1yneEACQf/jyEI6/m6DrHaosqP0fY91Xp3YLGPZnm/1USifaPKrakFkvixtn0eSGYllX4PXMDgd
 duf5nq+PPq67Mbt2J6GvQ80K55z+C99pMr/xL1KxwOqk7vbu18uyryGnjYDo/O3ra1OFDJUCBL1
 xbEmsfWqd15AUJcY74qMPZW30zYCuLScdNNvhWpQvsURFVXzruPmXAUEA1LZDkD13KfhiF+4hd6
 0+cey9A7YbrHXZuLIjkq+EKDRu5c1HY7nFEXeRjZG/VdRpNHnnrZOYLeoSg89UD3d9zHAoAIlC6
 k2HwnIcyCIoM1VTZcC0v71LYPm9FtsIMbZ94VyqS7JIzAkn9JWACeavbmC8utEloLZ1sdxRA5fw
 j+nj7Ugdy0niu9678mY+/hCHp0pGpfxC4S5L2uAkyze9Be1VsT/nJ8+rY7+yrfcULh0awxpWvCY
 yq3qH+6xgGymoG7C/DWWg1p2Tc2UT5VXyB1wlUZ3Dy7rs1t6MPOoW0m6Y8GpIoqbxKl95Ot07Ql
 yxXnHOIsTgub0fbyrI3uwQNMn2b2HkGofj5xJHACHWk+TZRseG+oRZoNhk6gO/t5QSrT80IQCqV
 dapzjsOgJWWyp4u5wm7f/aXgCFoj+c/zRYy4LBpWkRFxP+7dqmmB8UObF1SIb2AyV0JQKEvlVEB
 VKH7vTQ/hvVYXJA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: x0AaQaLiZNlS3yVUs--s0lE1_7gw0BnB
X-Authority-Analysis: v=2.4 cv=A7ph/qWG c=1 sm=1 tr=0 ts=694562d2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=UodCGf9HWxkVo1034I8A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: x0AaQaLiZNlS3yVUs--s0lE1_7gw0BnB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEyMiBTYWx0ZWRfX2jOJXRdn/McA
 /15h0c6q/GIPV8HO3Hg6LmExX2OK7joSOs07ZfUPAWuXii7ssHWKNzbI3MoBYCJlLm4sulU/1w1
 ejgo0kQoE1UEOGrUbOZDfE+VAWGHNO0tXsQrN83uhhrI6OPJ438os5N+XbL5dCi0o0RdIofINgv
 M0ReZurSacVvMjOy5A5p6eVaCv+w/8wG8LBdVUzjssdrtPNNtxxncWE8balMeqEk1FdkuBuf9vq
 qS0UH72YvHciVb5hwK3fOkYXgDisKWMFQmk+2R6YJQSLAs9KDBUUKuQAF3KzwU28RBpg/4g8Wd6
 AmMpSSrvUTrGSqAdvfuqz73SdaxMPy/c1buVNEyAswf0K74zGZCHYgv8WqMUCxii7Ie5aHcrTbV
 xXy1UGTbVFyS7XsbY/Kza9vdi+DjXOW2d5FPeMJn1QXQ9FpQb1YL9KY3jpu8XWrjTF+hkbMOVG4
 PRbaICW8tBNlxDwCJ7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_05,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_063604_268574_7B13786D 
X-CRM114-Status: GOOD (  16.00  )
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

Use dev_err_probe() to make error code handling simpler and handle
deferred probe nicely (avoid spamming logs).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/iio/adc/rockchip_saradc.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/adc/rockchip_saradc.c b/drivers/iio/adc/rockchip_saradc.c
index 6721da0ed7bb..263d80c5fc50 100644
--- a/drivers/iio/adc/rockchip_saradc.c
+++ b/drivers/iio/adc/rockchip_saradc.c
@@ -492,10 +492,9 @@ static int rockchip_saradc_probe(struct platform_device *pdev)
 	 */
 	info->reset = devm_reset_control_get_optional_exclusive(&pdev->dev,
 								"saradc-apb");
-	if (IS_ERR(info->reset)) {
-		ret = PTR_ERR(info->reset);
-		return dev_err_probe(&pdev->dev, ret, "failed to get saradc-apb\n");
-	}
+	if (IS_ERR(info->reset))
+		return dev_err_probe(&pdev->dev, PTR_ERR(info->reset),
+				     "failed to get saradc-apb\n");
 
 	init_completion(&info->completion);
 
@@ -505,10 +504,8 @@ static int rockchip_saradc_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(&pdev->dev, irq, rockchip_saradc_isr,
 			       0, dev_name(&pdev->dev), info);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed requesting irq %d\n", irq);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "failed requesting irq %d\n", irq);
 
 	info->vref = devm_regulator_get(&pdev->dev, "vref");
 	if (IS_ERR(info->vref))

-- 
2.51.0


