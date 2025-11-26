Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F57DD1118D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 17:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/nE9mFzLK64dd3Op/zaOJqEf8z2tEMBy+TpKMFxK7Q=; b=CrnmzhlbZcusnYfiSuUZKTADHX
	qUxszyj0QOM5n3o2ynm9Mk3x5Old7G4Y4h+Pco08oJYI/UyxEiOPWtS26kV6MYv1Fojk9NPVJ6VON
	HVbMkJM39XgsIlTHwhmmSq4Yu0vAs/YApfKFpTDgwhh4t+oHUF+jTQm3Z+TUBY1y/gh5JZNbNceR8
	yPLukesVj+g/hlcZe7Ypiwkv2CEM+Ua3S1ed6wu7hg1yZkFzdVnEyahdVvz+5Fgzzta9qS9dC1Iaj
	ORc1aAmsXYadQ38p/RfV/RqVr0cO89kIYvr+hXa3rFzl06eRlvq0CPs3896Xs23FEcbHG8WtlkHKI
	oMrXc+/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJVb-0000000FR2U-1iZ9;
	Wed, 26 Nov 2025 17:40:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJVM-0000000FQs8-127O
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 26 Nov 2025 17:40:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9/nE9mFzLK64dd3Op/zaOJqEf8z2tEMBy+TpKMFxK7Q=; b=Qtl4GdnyOR/2Xh0VipkXUvEm8E
	47+UuHuJJsH2Eg/dG2eZ4Jee31skVxvAK0ONFqDx2lT7jMOtisAlIp/nJFGeo9GpiGfeA4L1WwvS0
	WdMB/bF4oWXKLxvkWrEWaqAGQHaFKHZ0LH3Aun2vBu/95FPtr3VvQpvmoH0lmkKXbLKzrpTILlLfK
	l1J4Zbi31ZXp0X5KIXmF7yVrL6YRQd7kgvMOJ4AR5HH9ABeyhVQHUffmOX5oNrKZN1/N4xoGDig+K
	INWyW+zI3JL2z8twOq86Y23Rbp+2THuW79BHMZhsXmzex2+ll+gYIyF/A3YJdcWOUYHy5XjgEjtOL
	gqTyZSjw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIdi-00000008WoW-3BrV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 16:45:12 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQB3vCw1668276
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 17:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9/nE9mFzLK64dd3Op/zaOJqEf8z2tEMBy+TpKMFxK7Q=; b=hhzZvyxLmJY8GRFc
	WnVCW0cAYn7x62Rw2dgZd/Sra0R/cKZZQ7LobHH08olKbex/rZvgyuSjcahjMBcH
	bYv21fMI3yYeJ0F6DAK5eEJbann5O64mrgep4Huus3mZaj+qSCf2GvSoomsn31Qo
	LU9vl/VXqnALdcgqDjRrVrxtNX7Y3KyGUEZoqlXlX4ZDauA2QIcY3JE8gf1LuyDU
	ejVgQRjf2VNMhGi08uBriquiyCXBG9/th7ab9sTtCV8bETFBQiTNReIsiZbxv1T2
	FVErpwsNqPRT/j+A64Rp0WvYTEdevNjSWeqavqy6Y6y5rstBZBEnGR91th3L0HJE
	ywPglw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap0bms3hg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 17:40:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2e9b2608dso554885585a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 09:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764178830; x=1764783630; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9/nE9mFzLK64dd3Op/zaOJqEf8z2tEMBy+TpKMFxK7Q=;
        b=jAg+yxTU0FX1LjpelwVruFS+x6VMA/JiwsDexjXXyvUf9iR2G4RNaak+X10xnYcKDI
         2yG7Er0nszh75BT6KQdbwCtnTw9v8bsJ8pHDo1FdUR1Hr+55rME4r/7Q7D5jmFF3zV91
         ECV+eCvz45KDoqzLBu+YS6By3J4CA5fs7kAkNjGSLns2sRYTOIH1Muwe9u8F2ONGAOrC
         VLycdsRZHCLNqvXrZ4Oz0B6cWHMJhi3Cf6wmjzDoYk3pg6iuJUU8dUHj8nS/2oCW9IIe
         adglWt8zBiYPuTJbGhbtF7WaR6TI5dpWHpSjn+LQPu40FAtPLG5IMQ5daGpXO3T3vt0o
         +E8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764178830; x=1764783630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9/nE9mFzLK64dd3Op/zaOJqEf8z2tEMBy+TpKMFxK7Q=;
        b=dUZCgh5PxAkPKm6Szp1HJQONqjxeypRAurxZ4B75T1qTaRm2NML8j8r5gF8pvfm7s0
         EF0zOQYa/7ltwLVtch+zRFmbooRlxzrfa+FnA3PBqh3kHqLNJoFDbXjDT/vaWBcUjLBu
         oJgBDOlgQY+4jn6n583my2V/oyK2Y9q7+FSnoq85wLAOp+JiJMgsxnYlGAQaAmdoO9LB
         IAC4JZ1wINRbBii0ZYa1Stw0xuXLsC0ZS7c/5M+iNbHpN6vGeL1NPH1Q+vrVgPgQvBEl
         QDkAd05TANA0kkBXX28FgTAscKk/PQtLbmL05CqeejZ9hN4BhZv9IWnw4NdF2F1mDswu
         BuFg==
X-Forwarded-Encrypted: i=1; AJvYcCU2c3Z9Acq5cEf+Gf3VdrP/o3FRJkbMmacp6Kk/VyJtPruUSbTfe9dkZON/HPAMjHR1vgBsluBX42/olOC8iI4x@lists.infradead.org
X-Gm-Message-State: AOJu0YwixRfNqdgwIT3xs94l/kh8dwA4Zyl7ll4lI9+M6daJNAq1/Ory
	y/UXQ3AfBLprQtzR7nvLgZg/GsluYMLMkuBHbtRqmFEOFhvwMGQxKKfcpBwyW8DBbgcH3wTH2ky
	ZFiN3yCldiYLbxKT2ytTfuH33N3dVYY16n/UpipFb9SzJhl7awNVlm4ORVY0dzbDH5/Rte3gAR5
	okxQ==
X-Gm-Gg: ASbGncv8bKLtvljWlgVCjaeLe1Vw1AcEfBQlHo5wwo95O6WiSfKxknv8R5vbyWNfbRs
	7ofDz1g1w0CEQI/J78ZBytM5VMl3VCYXuGiDrv6C6gpf6GQnfdPguehtT1vRAgN1psRfeH9iX5z
	MNDKh534hLnH5QMiSdzCYJyMGXlPTJhtBjcMtyWaGlR5V2WVWu4+5QEVmhgzHNVLUOvXeiQj1Q8
	YxnLaq2n9S35T0ZjocMpyW7XsGqsylapWkzH6ztZsKwdzQvpywrjRM9RwY8QPPwNT5dJUI4/vak
	fOLAyPIyugdl1qOqExuFSUS6K9168SdDL/c2kVlppyQfWCabHxZJEZOdo+3AnEIS0COWFgaeGv6
	UJqocWUKNihZRU5Kf8KdQdo2OanCtqGyrAw==
X-Received: by 2002:a05:620a:1909:b0:8b2:6121:5af7 with SMTP id af79cd13be357-8b4ebd54602mr1013172585a.3.1764178830590;
        Wed, 26 Nov 2025 09:40:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFt1Mz9fBy3af1695aDhvFped40qCkoUYHIDo3l5Pjiw2ThshIXfjfsGRpZLC9wUBlHEqde+Q==
X-Received: by 2002:a05:620a:1909:b0:8b2:6121:5af7 with SMTP id af79cd13be357-8b4ebd54602mr1013168785a.3.1764178830218;
        Wed, 26 Nov 2025 09:40:30 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd8e54sm43226430f8f.40.2025.11.26.09.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 09:40:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 18:40:11 +0100
Subject: [PATCH v2 7/8] regulator: pca9450: Constify pointers to
 'regulator_desc' wrap struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-container-of-const-regulator-v2-7-7ad3408d6f29@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2287;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QHCV631sE287htt5ntixmRlFJMMXMDvt0ofW7ZLTi8E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzt/rKHLlSw2aj9ekDpuHoQUuxhSPS1ONpNfU
 t1fSa6vSdqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSc7fwAKCRDBN2bmhouD
 12IAD/4jnjL9wTJJWRkQ/+Sr+duE/So+Tn0cVx0bSN89gdxic7LNgiflqKQYzOf79poYlRrPqqI
 sgQjOR+KEmimL81vv1T7ie8fY7tpXDmIPf8Psexu9Anev2OX9zcoyfowZ4Wy98vfj6QT/HYiywF
 2XgOeQ0DRUhffxOrnPCnbPiD70YOyXUZ6HYCrghW/+FPBt6SglwtX1aD7+gF2LnUf/6MqHqF1uE
 RhqmL6j9Iv+amRsqf11MWIuvbSOrUk/ZY5KDJRHNbP8T6WtWn9FztikJ1zpzASfTClza4VznOFH
 tmC2gP3R8zs2uYQAQGMB86PsEfB0JBlwUWzakp4nombs9OnEt4MScvsNXwBcnPvxJva0ODT9lwU
 /FYk6ew7198c04MicdYfU62HeD68RCZJP/ms4nLD0Rlg+nWAGvqGvrFZc46gjcQ3PqB2nCVUrIi
 uZQpiNtIcOdXpQ+tzbxmU3xH4OSYVKI/g3MDdeATNbuMQyVsGW8ty9cRfAb2aOdiBObgeKn+GYP
 rO9WTd0ueT5yFbp+mTiDbDtdS/LCrFpqo9ePZyeIut8onXd0cieAiy7bUJhqRtvcrrxQ3m/hlIV
 Igq54LQlMwWspYBbIeLTiLxMqTZy+I9Zvx4UFw74SOoOCssjQfqQcXd/HH9Uz9gDWL3/dX/+tEJ
 pXlZ9adGnE7i0kA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=AKyLkLWT c=1 sm=1 tr=0 ts=69273b8f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=wapfrd0RAOuIrv5d2i8A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE0NCBTYWx0ZWRfX7Do4elBNlhO6
 WuBW2zeVi3fW3J/Fei8o9ylYvhBdEVRu2lOauIKhG6agLK8wtCLnsbdqpt9Ot2dP/Mh3oUdaf8Y
 Sy17U6zxxif+KKsowBoN9Z2tGyeArDOv4wFRKUmIffTV7kgp0hqFrRYNjyBFB6OHePvTanbCqqv
 BAsorIYgzR5h2OmD/cAwBdnIfI9rRSEFFsuDDdBs2wb4MbnVwuGCFIANl++LPx/XP4NHJmuUO3r
 GUsSxFLtfRbgwU8K4c4i/dd7AhEjpyfIwPD7XbbmnsfVFaI2rzzllJ265jmW66gLLHqgMcNFtvH
 5w3XB2wGf+oYTdsvKW8Uq47TQNcpWxiqIq07GHicjwuWZXsckdx/wO/iCl5jbm+3xN3TRO+etv6
 TKeyX+v9Wao5Ji6c75k74WNBvlSd3g==
X-Proofpoint-GUID: 4bAHZj8grJqUNlCrl1uqHL1hFZYJH1kB
X-Proofpoint-ORIG-GUID: 4bAHZj8grJqUNlCrl1uqHL1hFZYJH1kB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_164511_161143_DD5575ED 
X-CRM114-Status: GOOD (  17.54  )
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
 drivers/regulator/pca9450-regulator.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/pca9450-regulator.c b/drivers/regulator/pca9450-regulator.c
index 32780c311ccd..5fa868264250 100644
--- a/drivers/regulator/pca9450-regulator.c
+++ b/drivers/regulator/pca9450-regulator.c
@@ -249,7 +249,7 @@ static int buck_set_dvs(const struct regulator_desc *desc,
 	}
 
 	if (ret == 0) {
-		struct pca9450_regulator_desc *regulator = container_of(desc,
+		const struct pca9450_regulator_desc *regulator = container_of_const(desc,
 					struct pca9450_regulator_desc, desc);
 
 		/* Enable DVS control through PMIC_STBY_REQ for this BUCK */
@@ -263,7 +263,7 @@ static int pca9450_set_dvs_levels(struct device_node *np,
 			    const struct regulator_desc *desc,
 			    struct regulator_config *cfg)
 {
-	struct pca9450_regulator_desc *data = container_of(desc,
+	const struct pca9450_regulator_desc *data = container_of_const(desc,
 					struct pca9450_regulator_desc, desc);
 	const struct pc9450_dvs_config *dvs = &data->dvs;
 	unsigned int reg, mask;
@@ -308,7 +308,7 @@ static inline unsigned int pca9450_map_mode(unsigned int mode)
 
 static int pca9450_buck_set_mode(struct regulator_dev *rdev, unsigned int mode)
 {
-	struct pca9450_regulator_desc *desc = container_of(rdev->desc,
+	const struct pca9450_regulator_desc *desc = container_of_const(rdev->desc,
 					struct pca9450_regulator_desc, desc);
 	const struct pc9450_dvs_config *dvs = &desc->dvs;
 	int val;
@@ -333,7 +333,7 @@ static int pca9450_buck_set_mode(struct regulator_dev *rdev, unsigned int mode)
 
 static unsigned int pca9450_buck_get_mode(struct regulator_dev *rdev)
 {
-	struct pca9450_regulator_desc *desc = container_of(rdev->desc,
+	const struct pca9450_regulator_desc *desc = container_of_const(rdev->desc,
 					struct pca9450_regulator_desc, desc);
 	const struct pc9450_dvs_config *dvs = &desc->dvs;
 	int ret = 0, regval;

-- 
2.48.1


