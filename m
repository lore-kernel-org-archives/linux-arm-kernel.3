Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32908D1118A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 17:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vCpXbzbZhOct4JHJAIu7jvMANlG6baOBU0kaSDKLRkY=; b=nMmCC2uDEQGEP5d/k0/ZDnwRCY
	57dU44kJB6AfdllUlZ0zTTr6KeEFAp6JCAfvr4uyXaIPexIlt89vYXoJSV14QwKNrW9cmltp/kkA6
	lyBTmzVZ3xSgLD90iz/0hKdVmMC/b2gG/mzDKEfxPo2iXF0T+veDLHoSZJkV3Ecmz/8JCJrTP1rNq
	HsWW0pxvr2jzchB+PlHjrofcunNNpOP6mMKWsLwQEl5S5O5QfVXeDfsAZp81fiFlk2q86IVcA3ZSx
	piEXC8Zt/3YJRHAiizL4T3U3iVtaBo8/9wRlIerBnF0xBMIVCAyzUAEMIugn9ix3BcO2ZAp78Bz7g
	BYCUWBdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJVO-0000000FQtt-2Sfr;
	Wed, 26 Nov 2025 17:40:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJVJ-0000000FQqj-0trH
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 26 Nov 2025 17:40:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=vCpXbzbZhOct4JHJAIu7jvMANlG6baOBU0kaSDKLRkY=; b=MWR1yvbht6qc8JGAYeed2C1f9G
	FabiIicsgatqfGC+TfCeouBlrEXGTy1hkrDMWjIqyGOrjOwSBsI+APnyPW1dT0aYCwWATbH1t7zIL
	X0+srxb8OOVLyUl5LiysOv1s4NQ/U4jpWjS2uC/cYr6RH4Y9SxVoVATBYcunqjTDy88qGhefaH8ga
	tREuZyKfHnKdlzLQ3ydAgCB0m6TpYSrenKbT2vvuP06DhFV8WVXQGen4ThHN5OO/oniQgEmRtcaBn
	l+rZgDjZhLZqHOBCuYMRynOG1rY7nezcNY9KGFKgU3+qHvSJNmBOewopBzpyw7/MPFQN1bzPwBQl3
	tiOkl6JQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIdf-00000008Wmz-3816
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 16:45:09 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQFwVsB1234719
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 17:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vCpXbzbZhOct4JHJAIu7jvMANlG6baOBU0kaSDKLRkY=; b=IXkbEk+YGREtz/1U
	32bBxazLAEtjNXTZ4ZgbuvnCuIbD68OathytH6ciVnxPiaMDydKBquwUkSCyxu3t
	4mlWFrdryxYfgu37f7UtaY2OcQGySdzVHLWkBuaVRHOABiHbzKee8+RsgBZQh0sI
	uGTeCqSxV8hkI7yuCZOS8gpNNZmkgg7T17M8wQfyDLhLk2LYFw80cFizrZurJKNy
	gdCV2ak95JlDmWa8Zz1+KSfURicFkDBqZz9ovZzJ8NyFzbF16Z+lbZWecoorMjIz
	lWsFA4a9EEaDAyKY7Vhvwq1J5KkPdNQTO2qocc/V5XiQvZMCmT43kBoq+fWO3QwX
	3RNe0Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anwd41rxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 17:40:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2e4b78e35so636885a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 09:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764178827; x=1764783627; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vCpXbzbZhOct4JHJAIu7jvMANlG6baOBU0kaSDKLRkY=;
        b=AquTiPwn90/NA1zM2OXjJLua9mzFHewGXVPK2gNrJkYzehIRpo/RdBN4+hfT1W6mLc
         HFVRPIsYSNIn+ac9lw/CVc9719tfk0BFgf+WBafjjZnJmy1Mx7KZPPhgyA4W0iuc2C9E
         3JsCoRdPeYQB3pS4s81ADwQBlpef6n9J8h27Q1p1hQPwsl2yluIuowaXNAmfG/hRyilt
         2woXrhVv0HOowUo6Sjsv/5x1pGjPHzrr2AcQeEK4uLTBGBHz+us74H4Ke6p7Zul+EXTP
         J55MNyp9S49e7zyaBFcHpgahJ/LsjpkryieejEpqE4naL3Rpg6kdaUgCKeev12Sjxrsu
         ZVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764178827; x=1764783627;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vCpXbzbZhOct4JHJAIu7jvMANlG6baOBU0kaSDKLRkY=;
        b=gWn4/axfea39MyJ9aNBjuYe5x9BfO9MixCFCKGkepHVDekwEZEmPPyqfce9YjRxZ6C
         NVcN2pHNj+fpTsy8p8qfcFK8WJeRuk6ejBCclIYcsShHCZbCVCL4ole3+8VM1hU91Y/N
         jUnXwtKDD7nJ78iT5CmoXDCj1+Q2CEfSe2qlw3mWnXVJ8H1d118zgywHsZrKpWZI2T3w
         ysyuEldUe/3Eni879I4LRxnhdPJxVnAysZfAYf8KYDQ3DTO1HD8+5gyFwUsJZ5+r90K5
         XcWifcIutK21pzx0dUwCw2PETkPKGFbMWphAmZXKDG8ZVao6dGKogKp9TQX4TVN0e/c0
         CqpA==
X-Forwarded-Encrypted: i=1; AJvYcCWi+W0qE0ypHyJBL2rZ2E8Ei8oPWjkfAH8KZ1QgpXwI/Bi3W6X2rGvAzxHeDoBKQGl5T/HqWQYLKe39fFhHn+ud@lists.infradead.org
X-Gm-Message-State: AOJu0YwH/ksqDvK5xLiQYKzMYk0eOv08vPVOA3IdWj5yq6GDzK13A8C/
	fu4yAJtq/WQoTJ2IhzMyzzSGDwPP7xcMCiDyFAR35J/ImWN0xnWMcAcmfKlZ6hOjutHZs6sGl9t
	wjBOvZoSWyqNVoydlds7AjBWbYqCNKScwFqlD+5dIQjgBT4A7ohqxSDZ6cErjP9n09xtylNl8kV
	C47Q==
X-Gm-Gg: ASbGncsgmN4lRY4m3IY48S5inmhARBRZKiJqhDQjHKzI9fZKLipLbIv9HU8FvIEPZii
	9q6JIuqJvOLgHcrgMj/qWySBdk25suqM8uCcd0CPWXyJq3H7CsGfyWYIENKveUtYs9taP0jTsNc
	t9Y0oC9G8DYqgPSFbZowiCYxW/l3qEzElUXKMMc/4oj8Z8CK4cYWKJ9eFvnlFoNgh6nrKOzLAG6
	Aa0LT7Z8b+Z/hX/XsaSnTfWq9WyKpoq1SffBrkCgGFDtvtbatSL3UHkgWNrHGsco8mzmKV+Wuiv
	YZZ5t/tFozrwWV/8sLZ3A4mv/VNgbKMDZSvDEQ6G9UsQOgIxQW15Lspp6zPxPADGF81d0fyPT4f
	OBRbfxYJ9uzpGjGGFFhblHWJw7E0JSP61Vg==
X-Received: by 2002:a05:620a:4496:b0:8b2:dabe:de42 with SMTP id af79cd13be357-8b4ebdb0549mr1021001285a.46.1764178827479;
        Wed, 26 Nov 2025 09:40:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZUDWs7JiLSSF7ArWfRHkaAuwTyK+QSHjFarP5skIIj4AqiWmo9YleaDZxRWKvb5+rueimyQ==
X-Received: by 2002:a05:620a:4496:b0:8b2:dabe:de42 with SMTP id af79cd13be357-8b4ebdb0549mr1020997085a.46.1764178827001;
        Wed, 26 Nov 2025 09:40:27 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd8e54sm43226430f8f.40.2025.11.26.09.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 09:40:26 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 18:40:09 +0100
Subject: [PATCH v2 5/8] regulator: bd96801: Constify pointers to
 'regulator_desc' wrap struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-container-of-const-regulator-v2-5-7ad3408d6f29@oss.qualcomm.com>
References: <20251126-container-of-const-regulator-v2-0-7ad3408d6f29@oss.qualcomm.com>
In-Reply-To: <20251126-container-of-const-regulator-v2-0-7ad3408d6f29@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1703;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=pvkowGB42YgFOHad3W/lZDavbKmrMX9dgCpdtLR0vaY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzt+qhcdHZT1bVlP+KvVAUFrdcV1FOsogvx2/
 PQmEEsCxTWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSc7fgAKCRDBN2bmhouD
 19XsD/9iNsNCUzdvVYQCqdrlXFz46c3uzDS/W95FVBCYak9EvFYa8wvG/SyoqmfyzqJ3hZ30pLK
 Nqxuz7x4oAaguorR9koog8fcSQdtLEvhbLV54bx2qy70JlZqK+Pl2GR6iXhe4/JS2BLIIkZQEy5
 iKVWsQJ+PjirJRXjfWw8OpLXiCqWS9kYT9Zus7Z3XWn4TMoOeMJtboSBCIX6ZBFhomKz0mE2HEn
 pDOdv645GxGl9y1BNlza5oviDZJyIrHoqxBhv77iufU5u/SScJmJiv9BpkXcHZ5hxPFPvRUkU0w
 NSjzVvQjh5H5jz4xa5CjjzuddZ3ExOjI6r392yeVz3KNLwQ6tGJAGvmGTPb3T/XvEOlbhMSbWHx
 LsNuAnaiw6FbEMXaYwzHgUbMaRId1U7hufR+rJIE2KZfPMQiHrTQzarB3Tiu9OdGByRgHtlSudz
 FnLBZsVHjTlFbfIfPQLqGVOERHP7N3k2wn1PzKRrsp5nrl7yJVFUWfTrQiVgF4XL9M0CktAj3xN
 PCWl/QBXd0b7YvKOIMHu9jXLii+TBPB80HqOJUaeHx25qA8J3QaT/K7e8zMjiOeh44OwyMNGixS
 91o+Bzq4oluoS225GxO8nUBr99gpFCf3Iyqo1mqzzfyCUC0Km2vYvLbw9ZgN7+3O9Bgf+sBeffs
 UGbhlyD8nWsiPFg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 608PQQEm2boNMzivKOhora-GvXnUuxmx
X-Authority-Analysis: v=2.4 cv=feqgCkQF c=1 sm=1 tr=0 ts=69273b8c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9MRJ1adic_HRPEocbcUA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 608PQQEm2boNMzivKOhora-GvXnUuxmx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE0NCBTYWx0ZWRfX20pWhhU4roYf
 r1Z4Mq2EwgyN88QFvQla6+IjcvTBknL7GlTtfSaZUwcY+xr9x1zDkcugJHGkyiKT1NUsPZpykVO
 Onnb2yCP5fazgufPKHoKzleFT/MbNVBOsM2SpSUuD34/Mnq6/9idhT4S++IKEu8a3NaWTCfV2bN
 7mwLmyKqeO7xCj7JCPmPDCLqmj6cXP1t0nkH9Y0IYtU1BZxPzf3ugUyMZVEZ9xNzhrc0q6Lxb3i
 1PeRuZa889VUioX6J61q5BHsmYUhiSE1MPLVvu+D5ZuwE1l4nPyR/2phzMb0UZWj7ycfSEKdQ5m
 fOQ+bJT8fxsvmmCNaTKRUraE1QscLvHUJxYnOMP8rxAIJM7vax1tlK16+7UjumBi0Q231olSxmR
 jK+DMNl1pWleXXSr6sFn0L/bz5qYZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_164508_174176_AF191F5D 
X-CRM114-Status: GOOD (  18.64  )
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
 drivers/regulator/bd96801-regulator.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/regulator/bd96801-regulator.c b/drivers/regulator/bd96801-regulator.c
index 24d21172298b..129b20c33bad 100644
--- a/drivers/regulator/bd96801-regulator.c
+++ b/drivers/regulator/bd96801-regulator.c
@@ -337,12 +337,12 @@ static int ldo_map_notif(int irq, struct regulator_irq_data *rid,
 	int i;
 
 	for (i = 0; i < rid->num_states; i++) {
-		struct bd96801_regulator_data *rdata;
+		const struct bd96801_regulator_data *rdata;
 		struct regulator_dev *rdev;
 
 		rdev = rid->states[i].rdev;
-		rdata = container_of(rdev->desc, struct bd96801_regulator_data,
-				     desc);
+		rdata = container_of_const(rdev->desc, struct bd96801_regulator_data,
+					   desc);
 		rid->states[i].notifs = regulator_err2notif(rdata->ldo_errs);
 		rid->states[i].errors = rdata->ldo_errs;
 		*dev_mask |= BIT(i);
@@ -354,9 +354,9 @@ static int bd96801_list_voltage_lr(struct regulator_dev *rdev,
 				   unsigned int selector)
 {
 	int voltage;
-	struct bd96801_regulator_data *data;
+	const struct bd96801_regulator_data *data;
 
-	data = container_of(rdev->desc, struct bd96801_regulator_data, desc);
+	data = container_of_const(rdev->desc, struct bd96801_regulator_data, desc);
 
 	/*
 	 * The BD096801 has voltage setting in two registers. One giving the

-- 
2.48.1


