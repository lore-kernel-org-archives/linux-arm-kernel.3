Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464E9D78787
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 14:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MyMmVElDZvwdRIAby/7iW7vi4WeJE4eibZZHiU0BOnA=; b=pJs1u0WNz5qxdUIh1pwkRReDwV
	0es+SKHD057Yc7PJMdoy0DovauRr+j7IK2nuz0lLid6/Ej1n7C4f9xCqsPXnBehDDGwaaVeAoa2Yr
	kW4Kii0o6+4Y3y67Bg70KDK2zfTMJqtTrDdzgIDDhYUSVFLT8FK1ZgIc/9Kb65DGuEZw6uYH7lK5O
	E+BBc9IHIe3z+KhgBzPYkLZ/QBDlKM3AXp7hMFX6R/E5vmlrQMrWGe4Bttcsxu4+KuZOrscMdx5oh
	DfNVZJKxX2mayKE0adszKMDdOZx12G722PT0amDQ6nqOk5bF0ULmG0auBSSx7MUbUc3ERae3zinp4
	/2/kyqng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbaR-0000000APuL-0b6M;
	Fri, 19 Dec 2025 14:36:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbaK-0000000APoy-34LV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 14:36:03 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBfNrq3975650
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 14:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MyMmVElDZvwdRIAby/7iW7vi4WeJE4eibZZHiU0BOnA=; b=nWMnW2ppEGj8sQO1
	72cd/O2SvycHwZ7mfK+mnsDlsERmYByJEzPltbj60Q+AIUnRJwaKAMUNtnd9sBgV
	mQnpWkAOzI5oDXDNOmhADGWtPkspwBO6OLbr3aRxqkQTbBc4KZRfKxXjRylK0JGg
	YusVtweDPoS/yOzIooZTZQELwNqQXAYnV05U1gYJyFp2jp7Nl+/57jhnjsZkqEQW
	WrCvAV6cCa5Elx5uZRFoNYwJTWu7B7dsEj9n6yKpMzeF+ZuAnI3v6VzKGsjGHBzo
	fPTjEEkH4SjwIYKQ1mGqONKLf5i3pXSk4T4mDpJsyWxGnp18xxYaDnMQ/2YqxLTx
	29VZ/g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2fjw2t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 14:35:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed6ceab125so42595851cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 06:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766154959; x=1766759759; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MyMmVElDZvwdRIAby/7iW7vi4WeJE4eibZZHiU0BOnA=;
        b=UBBHI7bXYzSPxv+ogawOOK5dm68NMs5Rs9vdWm0JUAv1Yzciw+3VcCDI0LElDNbals
         nTrboO0badXjKxcE0By+kNN7JpYTNjxgwlowx/DjpG8aqDxqEGXb69A0oEKH6VTQpY++
         m373KlQQie8RTJNziWucEHz1c1HWqkI43Xm9QU7Z5WgDjXlMZLYUwa/4a33ahm5WBOe8
         IrAhNLmBrSs3vDFdz0t0wjwDpeAlhaviPpptzi/5e8S/k2dJPYlmEk9yCTLnFqd/j3Nz
         YP2SdgQ/k6ft4YJc37NwJjq5tPBS/PBeD7zQXuHjTqLKkhmo0GvUJLCaae7NkE3FbJ0o
         wEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766154959; x=1766759759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MyMmVElDZvwdRIAby/7iW7vi4WeJE4eibZZHiU0BOnA=;
        b=NyNY61BKjqfbiY0iPPiZAxAXaz/TeeeyereWiKhKCrlBwi5VpIPoh9dJKEnsTfxXGv
         +98efFv7nZNxxeq21o5BMq1h+r3G8f1lUH0bndpktSpd3RFOf1ge7F0C5qv8vPEm1nHq
         hppDxfZEXNg3sxAbq8xSarQ/ZF99y832EvNWQP968pqEXTMgpAWzNe1ECOwwm5P4Dv2O
         pCM/z6QcK52PyI3stvnsndvqKxYvUwcjuHpcopqYyxNgwTtt7cupoUQmPOvTrX19zXaP
         MxVorvB0z5Ti+uh4gCrByeW72ZXUZ7ggXU8giGstFOBqJZb0qdB6vrPGIUOWNkRb3Bw4
         nbWw==
X-Forwarded-Encrypted: i=1; AJvYcCUU7LLEDvjDaJGMdyJDCxb82/mH2ywOT1z5RJiw6OYm7utYvNolQJMk5ITFrzKK4BiS2nmWjMupeoJOwjEGonTK@lists.infradead.org
X-Gm-Message-State: AOJu0YyhlvC74fdFqvdEGRap+ClM3XUrQKUWKRGLpC8O6vWv+hT1kARt
	xckY+FOjcZwGa6J8tQxJUI5irxU21X9RzyJgeOMIMRUoh951w3CYXO/u1zPyUa1NPfGz/J7VHkN
	L0Rpacv2ySjVJ9VcjXN/XRvoZ19uxSn9MyAdLwqLOx0L1VKK/uTQeF+HtSxbxH+5K383rh/WyV3
	5gTeyyI8TVRw==
X-Gm-Gg: AY/fxX4HqJzg7xemX9HlCQqnUvHA7c7HhzfZd+Gy83hxnTva68xhQ/5hHDGxp5KdRMA
	dnW7qshHQ3FBLkWMzmeM6COsIaiKE03WirYgjaZ/36Kbm4FS1lCAm94l0G7yaDlTqzH0oRYx9UD
	xTUriQn9Ej45zUEr8Nd1f5rrIKU+Ub/7HiP/rdcuYGd+Zo/Elzta2lOTSy00PXAm6j8re7q/y+P
	4xoeHfs+D9bBID5boI38DZTbZ1f8dJICBSZMaQwN2BcFoG7NHaD6rDfFXX/wI7vRqO8LPHFRycS
	RS4r344boE+J8gsILElAfQd1w80N8agHoKPmHwYq2/X3rkmD5SWphnu2MTZj4C+K0Vu22BfR5k4
	3mxhzJUq44FXzV6NMQMja+4XMchMy8u1rHHUz4XNB+mQ2GrzckXUktnswNjHhmVUvGd5o
X-Received: by 2002:a05:622a:1e94:b0:4ee:209c:be59 with SMTP id d75a77b69052e-4f4abd9541bmr48095991cf.55.1766154958804;
        Fri, 19 Dec 2025 06:35:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFy3s+cedRD+jScDO/yti3WIT0fmJUy0yEz4L9LKCuvDsUwnGPrO9lv5lNcy508pzCE+1Jc6A==
X-Received: by 2002:a05:622a:1e94:b0:4ee:209c:be59 with SMTP id d75a77b69052e-4f4abd9541bmr48095371cf.55.1766154958397;
        Fri, 19 Dec 2025 06:35:58 -0800 (PST)
Received: from [127.0.1.1] (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ab7f86sm245145966b.17.2025.12.19.06.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 06:35:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 15:31:51 +0100
Subject: [PATCH 2/5] iio: adc: exynos: Simplify with dev_err_probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-iio-dev-err-probe-v1-2-bd0fbc83c8a0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2371;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5iVrwaVGkX/lz9WN7/1Hu0jkjOFLzSRBWe82w60UkjU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpRWLFkLm4i1w5ivMIJ1P76TTT6SODbzjV9Amfa
 9AuVP27BKyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUVixQAKCRDBN2bmhouD
 1355D/9zK05TIVLM90YKH+VJ22rkGMMZGxQjjUGFR0oKrTlLWycdW95453AT1vgoNi5JaUt7uhG
 EEm4uMIUCWH+8hMVEji27mf/TEh4IxaMOwaO679edjyhgWMLoV93nYZ3dIEHbA3pJU/dj2JBQ3C
 mRWJowsgDCUMxCHqy9iZAHAX5nTZYZlxArvoFGlaAMrya9ou9xnNapJXa+lRHk9/Zcyx6GudSge
 M71hRmDuvoU3UX3rdLU3Y2+2KjqIt/6cWBzm09etk280kbA4IU1Om9TgwNkN9ydPmDECDHPrftn
 FZYZ/9kAVjsqrPUkaMFBAhEXW4UowvR8EbZ4b8bXf1twI5WrtlGKwpsfXXkkiUJNdDg0RPBN1Zp
 bEXk5mcZg00qSFTFxZZdNuQSYV/USnXxwVpkNZ+uAvwRkGZWoAYSLBoS6uTz/sdoDQnJSUV4OQP
 UybAN7xllOhnQwQwxlyF7rXZNAVgo/aHHU/wiDGNrcDMix34ODC7ZIu5LqbaYe2bw+0nzCpy4wp
 GLj0CDDkP88fOOZ2vI/6mCHyZpXvBMcE12Jn6EFKBOQyxG9ju0A5khAGXp8vToVjZrdMhDi/f8U
 s9v0QkdA6kJF4TjZbVqsyIEr9GKmHiq/T9Hm7HB4od4NZSU3rm+SkVpm6RFCMeUBySXr9gQJ8Pd
 ONf3bUbf6HecpuA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=NODYOk6g c=1 sm=1 tr=0 ts=694562cf cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Y7nMzdyCy53GPDWIMu8A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: dDiddyvuTcLUJyOKTN-SW9OqWjBX6Th8
X-Proofpoint-GUID: dDiddyvuTcLUJyOKTN-SW9OqWjBX6Th8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEyMiBTYWx0ZWRfX5aLbC/iwIdbF
 Kiprqtd+Vgj6jT2EduboVaosT5YnCDnnJQPx95BEStJhj2I6Jtuu5Knsg7JJ46fhXRDiPtkLHu+
 wqMITfKKpgx/mwmLjdXkos3HNsTGNoNAjZAJBwB61+MoQrjGAChXNqHIO86Xdnj4hNGExYOLJ7t
 2P088WfLl3oFpZWMKCWzUGOearf9vyCC4VEPyoHSZtGbsmb1kCx1uY0dIMhGr+B1Lh9QCUme1xR
 aaz4GCk+qiYFL14CVC9VBS36rUZ/JGLXBeUTB9gUObBvlVofutR7rLnypaf+8B8O6+4LbxWVaNG
 pN7Xi/KAO6KKYp6lBt7d9DKYGEda6qyxxIFsgNVrre4qL02gDEEGzhjMzuByu1XoNaRNoY9VmKR
 0pfGESCW4YvbXkY7sst7MtolUi0DFtuTbJmP+BxSHyK3K9n3rWvQmHWoaEK74aX0foIjmbATR2j
 rIJQKulRDrox1Z/HwHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_05,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_063600_889090_44E86CA9 
X-CRM114-Status: GOOD (  13.80  )
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
 drivers/iio/adc/exynos_adc.c | 29 ++++++++++-------------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/drivers/iio/adc/exynos_adc.c b/drivers/iio/adc/exynos_adc.c
index 1484adff00df..491e8dcfd91e 100644
--- a/drivers/iio/adc/exynos_adc.c
+++ b/drivers/iio/adc/exynos_adc.c
@@ -564,10 +564,8 @@ static int exynos_adc_probe(struct platform_device *pdev)
 	info = iio_priv(indio_dev);
 
 	info->data = exynos_adc_get_data(pdev);
-	if (!info->data) {
-		dev_err(&pdev->dev, "failed getting exynos_adc_data\n");
-		return -EINVAL;
-	}
+	if (!info->data)
+		return dev_err_probe(&pdev->dev, -EINVAL, "failed getting exynos_adc_data\n");
 
 	info->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(info->regs))
@@ -578,10 +576,9 @@ static int exynos_adc_probe(struct platform_device *pdev)
 		info->pmu_map = syscon_regmap_lookup_by_phandle(
 					pdev->dev.of_node,
 					"samsung,syscon-phandle");
-		if (IS_ERR(info->pmu_map)) {
-			dev_err(&pdev->dev, "syscon regmap lookup failed.\n");
-			return PTR_ERR(info->pmu_map);
-		}
+		if (IS_ERR(info->pmu_map))
+			return dev_err_probe(&pdev->dev, PTR_ERR(info->pmu_map),
+					     "syscon regmap lookup failed.\n");
 	}
 
 	irq = platform_get_irq(pdev, 0);
@@ -593,20 +590,14 @@ static int exynos_adc_probe(struct platform_device *pdev)
 	init_completion(&info->completion);
 
 	info->clk = devm_clk_get(&pdev->dev, "adc");
-	if (IS_ERR(info->clk)) {
-		dev_err(&pdev->dev, "failed getting clock, err = %ld\n",
-							PTR_ERR(info->clk));
-		return PTR_ERR(info->clk);
-	}
+	if (IS_ERR(info->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(info->clk), "failed getting clock\n");
 
 	if (info->data->needs_sclk) {
 		info->sclk = devm_clk_get(&pdev->dev, "sclk");
-		if (IS_ERR(info->sclk)) {
-			dev_err(&pdev->dev,
-				"failed getting sclk clock, err = %ld\n",
-				PTR_ERR(info->sclk));
-			return PTR_ERR(info->sclk);
-		}
+		if (IS_ERR(info->sclk))
+			return dev_err_probe(&pdev->dev, PTR_ERR(info->sclk),
+					     "failed getting sclk clock\n");
 	}
 
 	info->vdd = devm_regulator_get(&pdev->dev, "vdd");

-- 
2.51.0


