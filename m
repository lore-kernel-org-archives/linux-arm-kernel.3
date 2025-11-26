Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4627D1118B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 16:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X1sBMN4aYdnkQShY49zVQ/9mVbxGlJEjkTF4Hi7fNtc=; b=Zde2Zkc+La/+hG14ZBvmYATBeR
	XYgtB7bBzBraG2QJa+fV6BgJtbF9zbvpBTsOS6LejMFKtB4W4qK6bjoMjTztkQwuo3dhcfewCLT0i
	Ul/QiVgdV6xJF28I3S3Sg5YtO0QlAZ3sf51D0cQS1RvYfTuqBHPL9urTqqNTOfdEWCKdmRGL0mmgz
	V+78E7lDbzgHsxGewQhAvmSytNS3MgeVULo22z+XUFmfWCJ4K8Ro3gBIo2n/NeKRREKcu50SkyX+J
	syxz05O6nGHcoYf61UZr1nwMoH2QGAOfkxPF9Jk/bESybKIem4aeC7Qul81e+fNxr9w1Lf8rN21kV
	TRtQVhSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIrM-0000000FLEa-33ci;
	Wed, 26 Nov 2025 16:59:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIrI-0000000FLBK-2lkM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 16:59:13 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ9L2W84048393
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 16:59:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X1sBMN4aYdnkQShY49zVQ/9mVbxGlJEjkTF4Hi7fNtc=; b=X35q5+SRUu5nhVNv
	1zmNuSiT1HPRpGizSPsrY5NYHWp3ZjBzehGYpR3GBB8ib4KPx+Sy9gEnePuXbmjn
	2t4/LaQlF6SZBkv6linOvnrqOCxp278jlgsTIyGfTPCRAav8apErqplMh2Ss0NM9
	BGKmSz+a30/OhoR15Z05/Xit/3ZiciiMkco9HzK45GSa1H9yPyZaQrYIzqHy1kuo
	RKNp05MNN2CCD8C2/DYbF8gnwOd6fo+c1iQgil12EpT0S5tTPifv/HifezvGLICf
	t3SpS3sZ/wWiMzupwPGOLk1DMw8TKI5LR7BoPg2ezGdGfzWXlvE6Q3AmoW36q3WR
	Wu9ugQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anp2njqcn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 16:59:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee168a520bso820721cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 08:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764176351; x=1764781151; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X1sBMN4aYdnkQShY49zVQ/9mVbxGlJEjkTF4Hi7fNtc=;
        b=HG9qvyT/O3Ucz9xCe+9PBALkA01gNmcx2GUs25PcfMxIYJ+MHef32cTBGa1qzh2rO4
         F964hOv2/i/imxLFM2CBUm7IMoCCxLPIPZ0UIsjGWt0JD8xkT6VKKllpGKb78oX36ekm
         ZXzyONsWgbiYoDbsCmayesg5iqmPlT/OpFYXgByfneGmTLsjFgZ4rvhC3/LC4rVhiJPO
         Ggvbk9PcR4epobsiHwB+FLW6ZHA5HHUy4os4F3ELw/nW8LV1xcp3JOuODFcC0BF76SLr
         ZnDYORqqC7+/mEKSyzeCGcRogoxkN8pystldL2o6ALFvj4udHLvjMZhMVhbbOyKrC346
         nWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764176351; x=1764781151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X1sBMN4aYdnkQShY49zVQ/9mVbxGlJEjkTF4Hi7fNtc=;
        b=FC50+mdcwhKyMDWjEPum7+9oAm0rpGzAI6IuIgAAyllCvFM9TfswXPw2jnLo5LY4Ry
         oSQopmzgd7B9KsdHekBJkn9eBKAyDmv8idOtNU1HFf996POK25md8IUWLCr7NXqHyA2u
         7wsRqy5AqM7O3NKDZUKYNUFaVP1r/9UHra5+Dh5waSbEuwAq2GvolL0QHZZroMAA/peM
         hsCWZvAyAxn+hh1DhDtkpDEtwmT3TEvlgVSZoLOxX8n9wytGUtxYJD7QjGk0QGxWpwES
         dhXR3IROq+QGo+TC7mVozxEXMH5OP6QX0qQ94GQj/zlejYixut1f5Gtcxr8O8l7X5Enm
         WLiQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3JJnc6B6sXgooFrQKXwuZVXtXDy7H9P+Z196YIGE6LiUjMbEf3RF5Q0EorJ5nHUWCfaMhcivuQ2zZ85Nb5y5W@lists.infradead.org
X-Gm-Message-State: AOJu0YwUZ3GZWB5JKHP+owAg26uyQkc/P8MYLUMpLGaM6pX0hDyFblF1
	cV6dW4R1l9HEdfDSL85ZXOI4ocqdpKYKoyHeHqCOCq4PUn41SvH3Uu2bCRPEXK7FI/PWBvKbyFr
	K2tobKu+U1FnBX1x2kt+JLbzxvNOj8tRTHfrCWwPOPmDGbHwuKR3dxyoZxIVLCQW0Od3/AC2cB0
	P/Vg==
X-Gm-Gg: ASbGncsP6GKF/Zl5AurLXuM9LUmVvDLMYcEq0xAJbhKW1jpyksSOilCJ6I8s7Z4LbqD
	njJNebZRFFU6K2WBWLZvYQT4xJ3jK0GShsi6qRnKClPZIptBJaegms1dj5cnuudBtsD86ff9Enz
	B4zgBo0YTaovmmzUn4yG51OYUZGqoIM6NOkZ9iyTOKwcfPJGyQKEdhkjRjZUN/lMhds3ml24Sid
	g0z+dBVQSmClqconZbhT9Hmxd/jaAErRaWbG1bGI7t5rFI+3I1rlN4XHajnwZ+n7/fxaZzjlU9y
	nhiGzU/nLe4imW/uXWoCkRBS9TuFKMURJNaZsd4ya+JS+9uYbg0435Llgzgb8udNIWPvcPSiU2/
	xSeEKBdiB6rTcEhhgWVwahh5d8qZTu4p04w==
X-Received: by 2002:a05:622a:1308:b0:4ee:26bd:13f3 with SMTP id d75a77b69052e-4ee58a61bf6mr244308441cf.8.1764176351347;
        Wed, 26 Nov 2025 08:59:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8lB1Rhgrq3S+danGiNjlWNKu0BDiKtqnkZCNEIla7vkB7GqUXjzDmY84VeQKHPci21vEnkQ==
X-Received: by 2002:a05:622a:1308:b0:4ee:26bd:13f3 with SMTP id d75a77b69052e-4ee58a61bf6mr244308101cf.8.1764176350933;
        Wed, 26 Nov 2025 08:59:10 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa3a81sm42398811f8f.26.2025.11.26.08.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 08:59:10 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 17:58:46 +0100
Subject: [PATCH 3/8] regulator: bd71828: Constify pointers to
 'regulator_desc' wrap struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-container-of-const-regulator-v1-3-eeec378144d4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1097;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DUpWNqruSQhmXQP3XRdoDV1aijYo/dZHk2b5HlvKVaY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzHTv3KzXgz4HC3zgQmbgCAciN3i+x1qbR/Fk
 TALu82gDxWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaScx0wAKCRDBN2bmhouD
 10yND/9sSVKKn7BpioaP9g6rmdgiz3FBDy/AGVkWcEImTalr/rjDKuV0Je5AgCxMxPjVFcRwASz
 6wAKseFTTOZvUmvSnqGfxSkmnSO47RFaMLDR9zkFlXRzYnS/v2G3+oHpe89wllLln5/zl/LB4cn
 VtTAxyHlNT4gxgvDL18j2VJhWVJh+WovUiB9owuIQygwsCR2QgGkzcy2ghkdYzN3FAei0VyPbTu
 vpb6A1UDl+ds4r+61ParpSzxpPHjo7kOqadOae4HQ3D66GA/uAPSDwwMNTl0fCuhpJp3jPgldVX
 Dtf/QCHBgUdkglHn8PXWLf5H6Z7W92+Hl05Bx3CHMBL+OAvqX8gi5OkrQy982RtXkzUDDaZciCp
 Z4Pj4z6viCaUB/tLBEsOs+MJmxgCBHAeuwRmpEktaxvznMorLi9HAE6nWzrDregCl+GCVPj2eJg
 iu4cOEYMgSCstrm+DCwNN62z0WUlzTb7cXMnfAHb7xgkINGlFrmRHbkhtXX3yNU0LpRpj3f4bUK
 RUnhNQVvZWqsa56TnDVJaCKm3BEtFb0YA+bRHTsAuPi2EEIKBxR2umBlIS86vyuf81C9PiShqlX
 UrKN2zH9SHsgwP2MXK2Qu+50QeIQ7lvhsZHu5NGJ5SmxC/3KrqSmUAmbiLp2yZWDuOHByDn80wL
 oWJpXWQt9nvGMqQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=KerfcAYD c=1 sm=1 tr=0 ts=692731e0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9MRJ1adic_HRPEocbcUA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 43Wd71ZxaeoJNTsPD4g0SDNbyhwGjmdV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDEzOCBTYWx0ZWRfX+mIljvHJUvx+
 LGV+k6NSN7vZNZTwCqHFQjbKO4JXkqyWOZywddJJCaYgSL6pzAtGwTHan1IiGGfa5ktPYqazUwX
 6QfN+jT5bLDcoA7EhcNw4GwdnjP1BUuS+mfxZlpaSDLao/x5HErSvqjjp0A/rcrtsQh6+N58dl6
 S42yhT2yxcLGqVUywPIQXKO9xyi1GuOnF4FzYhCf7+mef0ODZlJf644krz4ceW34/liridj6zSa
 hGRrRnCX4hTWw1Qwya1PvMsGA6j8J5wt76+xvfZcJ5/kW07iajxmq1Z2UlhYUhq88VxXi+meAVH
 hHHjPjgiMDByfB9Iz4Gv8gMk/E2butBJUfABD85yVslB0D4ZMTUq8dcNLTJgH7+tYDohmyakdNV
 sSRFLh6YtpCUpiYlBoGrLp0vMskcjg==
X-Proofpoint-ORIG-GUID: 43Wd71ZxaeoJNTsPD4g0SDNbyhwGjmdV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_085912_707033_02B0EE20 
X-CRM114-Status: GOOD (  16.75  )
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
 drivers/regulator/bd71828-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/bd71828-regulator.c b/drivers/regulator/bd71828-regulator.c
index dd871ffe979c..87de87793fa1 100644
--- a/drivers/regulator/bd71828-regulator.c
+++ b/drivers/regulator/bd71828-regulator.c
@@ -95,9 +95,9 @@ static int buck_set_hw_dvs_levels(struct device_node *np,
 				  const struct regulator_desc *desc,
 				  struct regulator_config *cfg)
 {
-	struct bd71828_regulator_data *data;
+	const struct bd71828_regulator_data *data;
 
-	data = container_of(desc, struct bd71828_regulator_data, desc);
+	data = container_of_const(desc, struct bd71828_regulator_data, desc);
 
 	return rohm_regulator_set_dvs_levels(&data->dvs, np, desc, cfg->regmap);
 }

-- 
2.48.1


