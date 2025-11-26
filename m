Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 804C7D1118C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 16:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yuBdo4Df7AcVAGzqPD11S2PZNb+g82HKKFiS0s50Rho=; b=ITA5oGNLNkSJJ8zA4jlqgnyOcY
	4XMGBIg1T2esTS5976TOP+hAF9BaSfM0oIRX4OwfvzFBbUIjgWAlYf/Ola/kUndhrT0GLhlNb9ejW
	/mlIbfE8chUOc9fA7Zwe+LfuoTl9frTGFCKgquu76Sj074BucIJ4/wawHgL8mMHn7w7ox+rcCsOyM
	jDnYT12ghYnGfimTM8Mby8Npqqm0hI1sKFS4Ygm/HLc4bORv5nNsUkHonD94BNTXH5qMNUHo6Fipp
	EHZ5oq1FtbQnVETNDTWWH01jtvWybh4yIC/WDcH/l15B/zLIpy331Mo+zBDUfs0k5uJp1E60X+laC
	tNS2vamQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIrW-0000000FLNC-2QvE;
	Wed, 26 Nov 2025 16:59:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIrN-0000000FLEu-1unX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 16:59:18 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQEbHXH3890959
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 16:59:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yuBdo4Df7AcVAGzqPD11S2PZNb+g82HKKFiS0s50Rho=; b=bE7ZJFbieUXASyQ/
	uZbq3dFeXJysBXbv1yZvE+5yJi1LHWQPYNn0rGmzlUxg6xY34f/osbFiYQRcdNhb
	XvXl9n8X8Cs4yTR8YmOmJFwXb99oAmAf8QJ0rKxtgnrMxLziU7YKILVov4/xEXyw
	SAzzHVzn74aK4rOAXiTFqjkTMMhwpBgNOJ497bth49kkJc77Y3iU1V7Ao9ocP0oQ
	jGfimarR6qq4sd/2PpBSjJDQFRPZnJGG82J+AY+tmDQ0n6XJ6/9naHi70MqIuW/h
	YJ8RU1aKMCDU3wrDtoJ9ge6Q8bX6iJ9f+RFUvmeLuNCW/d+TR94Bb70pfdOlbCv1
	8E7qWQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4angmebj94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 16:59:16 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88234e4a694so274015696d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 08:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764176356; x=1764781156; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yuBdo4Df7AcVAGzqPD11S2PZNb+g82HKKFiS0s50Rho=;
        b=GhLBsWdEcOSWsE0f/yAyxesnM5nbNBHnr2YXds7t3yiWF5UVdTZ5BAXtOkbmnQplbQ
         81AGwti4Qdz4TmT8sYxzTArSegZHeIQ6htk8gg++o1WpcNz76580i5uyvtbglAjyFbRT
         anXXEHUILc6Ud2YkgzZGlg79KgcLwzUrHl90uS2rZXQStgZsm2Ir8xoj+cLEoe4PCNSG
         7wMOQLNYfMGshNqNinYSFYUELZSSqKzR7k92+VuM7QxZ6OI7t5B9lquBNrtASdNCkFFR
         54xTM+tUD+IQ3nhcDmX3mOcrWt3AcgjFaNxfnvXvOAkDNSdQbSN7V9Bdr/K2Ajl6wdoi
         7a2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764176356; x=1764781156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yuBdo4Df7AcVAGzqPD11S2PZNb+g82HKKFiS0s50Rho=;
        b=gybn1Pt3OD8gArEJqHNx2h1r6t6N0998hbxXRKyCEYT7w+TTlSnAyfM4+o5+B3HTDZ
         TJs8+WNUfes95k5Wxv1zqabZWpiGH47FqII2ORWe1sEA+Ks6cPYWTIQSb4OfD3qOP9O+
         C61uuIQbcRmbRDDWL1M5WK8SWDsyiEKkisAXH+LTk446uYRTwn7cL7TLeai9yCN4n0yq
         RiKN/QD6Qq+p5dbprDBL2LQS2z7LKss92aoSn6Oz1yhzMoQLYTTCJZAfHHnGzFdMe2s8
         MsxRjhiK4f9owl/Q+SDyDjTjbf9TJwlC4qpPjiLpQaoqZ/CDlqrJ6aILZGekOMzocfmY
         ueEg==
X-Forwarded-Encrypted: i=1; AJvYcCWZcaDCfHxXFdi8kl6+qyeldEjCUv8XaFD0/qYPPRBJ1NzXFKPRG+98dgQHiNvW7yU7siTblIngkAYfYWvh/taD@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6QIx+cn8XwNh0O+nskDN5XC6z10md0I2oe9+7fvEGt552xZhW
	Hb8KOlexdPxLmdlzwVqABTbefE61QCPyAdFNQIW3sE8Ikhn/9C6Km88wGOoHBixE96D33XzrE5G
	LCAECTtu2Yx8ZtRiY7it6UCx59Zv5CMonKaL8E0h4FVNId13u1VSAQ3dqGg9o4SL9Ya3DJeTxpt
	LzCw==
X-Gm-Gg: ASbGncvpWpsqiRZ+1wGvX9KXy38I7fmKcYqozLJFgDAFdZ7x4a/eM9ryCtT/vnAtmYZ
	DYmFKsP4mkIwcA0T9qt3eR088dSzYYu7bhbN6n5tqvJ5049yMtM2iFz+PvBX7oe4VxBPPveT0zr
	8+8KCb8/pzLgfiEi0R3PVdLrnzDEIrAB780f1VnrQ4c3An83P3LySQT4nf8sF2AmivfHaZ/9F9G
	jKmrUvaytyjoGD2oAs/y6EoHv+AHvu8VzWmhzBwkSm3hxR4Q6p0NrNo5vbvqqtpjNwHn0gCn8zH
	9PmqLmbaq/o8EgvBHd9W+aNxePOdvtn7VxAZ8mkui8rJkQ4KtzT7g7wRZFknw4ZhSyA9H/bUPuw
	06ZNOe+PTZi5iO4HYjbshdlpv6s2egx+tQA==
X-Received: by 2002:a05:622a:d5:b0:4ee:19ba:d778 with SMTP id d75a77b69052e-4ee58ad46f4mr280143651cf.48.1764176355735;
        Wed, 26 Nov 2025 08:59:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbl8mU5pugMLdfQ2QpKnpUut5p5RybtVnYi8n3iBTFPdWBvXLbhyoNwExNjjmB+G67NM+G6A==
X-Received: by 2002:a05:622a:d5:b0:4ee:19ba:d778 with SMTP id d75a77b69052e-4ee58ad46f4mr280143281cf.48.1764176355354;
        Wed, 26 Nov 2025 08:59:15 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa3a81sm42398811f8f.26.2025.11.26.08.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 08:59:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 17:58:49 +0100
Subject: [PATCH 6/8] regulator: mt6358: Constify pointers to
 'regulator_desc' wrap struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-container-of-const-regulator-v1-6-eeec378144d4@oss.qualcomm.com>
References: <20251126-container-of-const-regulator-v1-0-eeec378144d4@oss.qualcomm.com>
In-Reply-To: <20251126-container-of-const-regulator-v1-0-eeec378144d4@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Samuel Kayode <samkay014@gmail.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=984;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=F6pa/hBnZb7Gkzh+tLhiX1+7lOKGS/rRVschNyVww/Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzHWHMmqetzJbHOIwek+/YS2OOoLxtr/oKpGB
 iWlpMG8/oqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaScx1gAKCRDBN2bmhouD
 19srD/0edvT0P4QY5aFENvleQKhfKFBzcXVW7mxUBamOidpj2W8rqPGlganIzFaJIxpw2amT2jQ
 oYZbmj1prpf5k0tFTG56IPoA/NM14p8E56OU6+7ySCBjXrhTOFJF8pkr4do4yP/IagOym3WD86a
 z44teVg/DW8X7ZsY9OPkl8bGjm/TtzwIGVZrJ2K+xcsnjVkgR475lTmuhCM9x/2X+YAZFpCnfqE
 xz8dSLFLyM46GMVKACPpOmS0u1diRcpMiLMi2ntKgPGD2trF8IsPb3z2g6W+kQf2c73i0ovRGF0
 IuIRYDDvVX+INcGMAi0d4bqJFjDwpSi8Vqnx9oIg2P/+xHZNnfRMliYMbkUbAbbMmu9tRLkx8OM
 w9EjZ9S5Pnxkp0kSXfrvFyl7ARPntdCnO6pPeiQQUbj+zMC9CjEUchoTYSmdNDE1G0bH8dqwWlb
 nFN0a/zNX8jGppMwl40TkZbd9Wr3sjCbg+yticeWXJnF/Y2tXyd48AoY86dDju/jV4Ce2/j4udj
 1xQRzSRPFUW3v4RCZdUjQXAV+Bm0CNBLtUV/MoVGRunG+K0PP3iaKjM/Ac7gT9+psYRAlGpJhDI
 tKF1tyxj7nD+ONz9HthhboQbSelL6h8ck9qO7zhpeBnt/nWv9ruTiIZPwSlrdXPdgy9K3vm2BAu
 am4OI+eGYdNuThQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=PJgCOPqC c=1 sm=1 tr=0 ts=692731e4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FqRRrX31zAmjg7hXLkcA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDEzOCBTYWx0ZWRfX6xLai1L2mrGS
 JrRd4/rmYOGHsNRvI5Vg+aK/ia/FCJYs9sKkg8fuHjE8MuoQinQVvvjfRI88QfB3FRqto11cghX
 iRW9AFmUtmAYazh8l7u2BnbHECmfadN5yMllrb5xecKv0yCF2HNP4Os8w8hB54w9Qow2EXuoaQI
 W5kW40pJLL3jmYh1bRTPs3IMC0DOFkOLB+QruoCg4786eXR1epUARFT3l2hao4gNeNuOcG5Bdq5
 bLWN2CQv72EBy9lZhlZAsZqpBhAaK93mpNzttHk6zenaXYEeqQ7gVmOSjC/Z4qKAIDMEC/RSxNC
 f/RDv60lLZQDeQkbh5dalFz1dbWwmjbWU/WaY/FrWDFHpV/8y1jBqgsaJsu1PVsgG5MONAnuy45
 Fs+0dugI+sZ2VxCjbBbUfwbRnDquXw==
X-Proofpoint-GUID: 6DV_jNLcy5Mavbe0kTTdKTkSeIV42TfX
X-Proofpoint-ORIG-GUID: 6DV_jNLcy5Mavbe0kTTdKTkSeIV42TfX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1011 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_085917_624726_7BB4CCC2 
X-CRM114-Status: GOOD (  15.66  )
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

Pointer to 'struct regulator_desc' is a pointer to const and the
wrapping structure (container) is not being modified, thus entire syntax
can be replaced to preferred and safer container_of_const().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/regulator/mt6358-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/mt6358-regulator.c b/drivers/regulator/mt6358-regulator.c
index e4745f616cea..2604f674be49 100644
--- a/drivers/regulator/mt6358-regulator.c
+++ b/drivers/regulator/mt6358-regulator.c
@@ -31,7 +31,7 @@ struct mt6358_regulator_info {
 	u32 modeset_mask;
 };
 
-#define to_regulator_info(x) container_of((x), struct mt6358_regulator_info, desc)
+#define to_regulator_info(x) container_of_const((x), struct mt6358_regulator_info, desc)
 
 #define MT6358_BUCK(match, vreg, supply, min, max, step,	\
 		    vosel_mask, _da_vsel_reg, _da_vsel_mask,	\

-- 
2.48.1


