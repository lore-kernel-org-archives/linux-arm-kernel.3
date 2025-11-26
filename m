Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E5ED1118A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 16:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/nE9mFzLK64dd3Op/zaOJqEf8z2tEMBy+TpKMFxK7Q=; b=tfCODjk7YAX3wHTDoW5iIru1dw
	zyWkaYQUQji1CJZ7j8NtWh3/6kg1d9WOlyhfgiojfmGHarMFLIhL14enW7i/aAEezv6omtu07mNJU
	GCwqsmZZxtlE6OoAR34GvQeKTEyOObrz1g0j1WlZ0AmfgXt/OC2B9HF53I+WgZ9Q6bBhJl4QdZwsD
	dfivQYxXv6QeCRBk76TT6LcG68hFciSk6wOKL7FhcHlQbXS0T2Ss7jCXX5dMyD/SR5bEN7mGvqvsK
	mw2zJHijxPmkpcvO0MYwrM83ghX4cfOu42rTqxM9n7sAQEyxlvotDoq7CjhZqnUJjDbYVZmChXeVm
	7GPZ0ewQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIrY-0000000FLR7-3xiM;
	Wed, 26 Nov 2025 16:59:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIrT-0000000FLJo-0J5Q
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 26 Nov 2025 16:59:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9/nE9mFzLK64dd3Op/zaOJqEf8z2tEMBy+TpKMFxK7Q=; b=ShES9ML+gaXCogAtPZi2B+Hxem
	/lIcNqUCzvGlMHmKhugGcPv3k9HfLdYU+F/0zWjIteu0IoEK0KMlWsE6ouS0ygt/de2HJn+z4aUVI
	jyioS/ocwie+LUO3dPQ/i8RN4yqXdLoaXDROzguJ8GGwgwkN33eKTKFli5N92euescVgM5UblBUGP
	XSs01OKKcrTMOtfI1BEoKHPwvj0eSnhzqWC3js/2Eu/6UvUuzHejmhrD3v1vCloTLoEv6QHz5SQ4C
	cppsgw3AoYVLSR+Tk8oCKW+c2ebrO/CKwggIFj/s7w3u5f4+B+LjDto7oJxCP8IbPfNJ0z/AjRzTv
	q+4Dao0A==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHzp-00000008S7C-1wbv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 16:03:59 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQAskc21700288
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 16:59:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9/nE9mFzLK64dd3Op/zaOJqEf8z2tEMBy+TpKMFxK7Q=; b=pRN33DjVGMibJ0oK
	NNVNiQe3jkGzejkIfU6j5WvHrPDh+/50yARQ4OARD/jcWoz9jAZ/gHtIwLxF2ErF
	HVvNMOl9koEhkPVkBaALd0E839/q5DzuryIoNyCBGYq3sWn1873/XtmyjIsgHDSe
	N7Dn5UBDdimHAXv+r9Uch27QK10XYxOK0n86v+42PsA2B8m0ttYbZvRszY5xXxog
	s2Mcs3SucVZkzloGaax2k1sNnfg8rVcs6KA2wvrOSsy40sTUqvdhM36xTS1S1ZB4
	1/HqsuOCWcx98XXUdg223RZ0XbKxZnLF+UjfVWGCBGZTvBKvjqvPWbd7jH3DFjs/
	JNpjsg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap07a0yu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 16:59:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee42d99125so928071cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 08:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764176357; x=1764781157; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9/nE9mFzLK64dd3Op/zaOJqEf8z2tEMBy+TpKMFxK7Q=;
        b=iTwYliwSnV4nVh1ZcrkJSMLt8BhGDlJ5i4OYrO17zdZ/oy/PQiB05AuU+0/WLgRpJg
         8ahmTU1cQ+sbRln5EdZGww0DwXgh6xOjU4a+0HDMcTOXemW8tPvd4dpWIqCD3okSqOq6
         OjCXQDCkTp+shDc6YEeC9lBa7nGiE9AveJAjiPOe6Vk61haGVDtzvJJr7DWhsfnVtQl1
         9aBc1GZE/mTuG7r7grhakZQCN7NPsF4OQOa6QataxpQ/M1XMuiNgQ9TCXr4T6w91qbck
         ndz1KHf9aiXHuAwr+utd9II9DAk1E0VZBfT82TElQ5qszjobPZ9nmvzIJ9a2dFgcivF7
         Ow1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764176357; x=1764781157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9/nE9mFzLK64dd3Op/zaOJqEf8z2tEMBy+TpKMFxK7Q=;
        b=i+PVvasaNLQXuLuIJ0aJl8u21GYqRHN6XOnx1uRS5hTHlcYej/20y4Ql06rSaHhNWY
         pfVIoiX1rnkAEzHxVFz+s9FBPH+Bflyaweb+j0meqym6MTl9Vd3995RY7OkcO7xglFsZ
         id+961JoTxMChlvHpFVkP81BRidvA+ESeDMr3Za4vutDsKmDzAsCDYfzr3b0andsXhJ6
         O8GW6GJD4XI+1xzdk2BMHo3NKm+dDnPa6c+o/tNwz+KS9fDeFQ3KU6vWFJbhAZK0YSRn
         rW0h65vDMRDbMxhdXA4PGY7Hcl8YM5GVAZoH4DqcfxPmw+yue3b43pbd3F1zYS8zHLlm
         ROaw==
X-Forwarded-Encrypted: i=1; AJvYcCV67hMyeglxjGQ2bqhMUF9KyB5/QZwHqp8VI+LIaG/E2yIq6jWtiHu7j4i0K03eMilFtlIMezXeNTnNiL8pQQEx@lists.infradead.org
X-Gm-Message-State: AOJu0YxjdEIeYmbF8zd2U8q0aBqMsKDsXPYuCPqKEdImImisVepFCWqZ
	MHaepNj7DDEcNuXORmQlpNslXfQ8agaxVlD1POYV+jf0wrRo8eIFVznIJA58eZAjRgv5CaPQzaR
	4fq3WQ00f5kRZ9lmwqv9kOpyND27vJ6P6ao177g02XQuqT0NlrmvWArgHx+iiwBqox6LK/4a6v2
	HjKQ==
X-Gm-Gg: ASbGncuFVgeolPVptru7IQ18whC5UrfyP924xP43myAp6EjPvuitv/9ZgMgKLy1Ro9D
	ZcQEG0yZukBZm1CcWrZqkmvCikfwJMaubXyPJlxT/X5xkRAFFkXekwhsOFV6EJA91JgOutin7mB
	6Chg4y4N+Wjmn+9Qg0ELcdpzLugEmtwZd9Cw3UxO+DPiAlXCQbnhKPRAL4DePnWevrsQotXsMkk
	YGFe4AhwkoVzQJpdwXJkw3czbDDgjDrrqhshfLeKn6Gt+9xN17m1Iu4UiDA5GRwn/j1+gKIWGXB
	KWhg7J5fweMwDtggE/K5vtfd7mvUia/JuwCpVcUNMZG4XYRShpfM1nrS+l6KFmsadf4GFSHjyxM
	8thnnffr3r0DYc9qyslHNVu7eOaZY8Uot3A==
X-Received: by 2002:a05:622a:118c:b0:4e8:a8fd:e00 with SMTP id d75a77b69052e-4ee58adff7fmr235322501cf.43.1764176357319;
        Wed, 26 Nov 2025 08:59:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEf5BR5sc1uyqeochjtqGYLG5XCky6dGNK82Mg1F3Fr/vu1xdHr/JvNRnSKTAPNwurtDJu2hQ==
X-Received: by 2002:a05:622a:118c:b0:4e8:a8fd:e00 with SMTP id d75a77b69052e-4ee58adff7fmr235322061cf.43.1764176356792;
        Wed, 26 Nov 2025 08:59:16 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa3a81sm42398811f8f.26.2025.11.26.08.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 08:59:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 17:58:50 +0100
Subject: [PATCH 7/8] regulator: pca9450: Constify pointers to
 'regulator_desc' wrap struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-container-of-const-regulator-v1-7-eeec378144d4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2287;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QHCV631sE287htt5ntixmRlFJMMXMDvt0ofW7ZLTi8E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzHXm4DjOiibZMtVzMV8QxB+V6eAo/uZvNGVY
 RbRJZxsbmqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaScx1wAKCRDBN2bmhouD
 1y0iD/sENBu5+81NVSOLl+hncVKxyBQkJnx/yfWVjuDk7tH9b8bB+QeSX9V14AWPM9GEXqQoufX
 mGXQFaczqBK+ad7yDVb1SIfkbbbG5Z4TEecPDGRfX8npX3PPJo7BPeFtm5RO3+cJgDPqkGDl10+
 nIMXIhqwBvR1uuOFHAH257wWbI9hEG+8p/MkHaLVxvGrsSZBvgxL29NHVR1gDObaEUx80O+YsYC
 96QheHaZD8oy0cFJe0UdklHBVXZoxL6f4xYCkmxwCIAUkvPRFv+HtBDEkJtCN6Cpc1dnM33Lpe3
 u0df7/MYRHHcGAgCTHEk0KhY0dBbxFnRWMw+s0TrJi1bNjia9bSB/AeAQEcnW7nfE/h9JJoIykt
 4UhoEfvLTSkN0XxG7zjbaszX7Iaoqhm762ulj+O0lDtk67qlZAOCWWQev0okoh/4CrampvSVon2
 MwPNZgXS/Oz7/baWEUAxf1fQRfDNPGyUpKbYLVdJ7m5asudNaBc9nb/Xg1VjgE/94Q6mANZtEHN
 HoDHVFSzaSWRcJYGODJKtYvi9c09go1x0m4TQfDNkR5ToycI2hwDdXhwQjnk4TST/E6K8HBrFAE
 LNXJl8vRsx097kljK75rNRDyo3CFX9Elmwv5INgrFvvL05Qwg/QoAKu7sXqMeEgfg22oXZM+rmE
 fusPHitLthfBQZg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=ZZEQ98VA c=1 sm=1 tr=0 ts=692731e6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=wapfrd0RAOuIrv5d2i8A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: _P07SbpUM5RPgYsy1JEI9cnyptMwx2EG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDEzOCBTYWx0ZWRfX3rV6gUZAV+sB
 N4WqDKWbZ6Ww2vHZ0C5GODBaZzmk/rtPKTaS2DXPdniZhT45D8MXdreWV254Qr5LW7cDquvCdNf
 zP4XU5TqYeJIhdDJ2SvYhmVyXDXVtqAc0b9NtisR4teOw//yQzJeN4w3bmawDgQaPsP3G7oBMHt
 Vv2hzlihIW1YDWDmwiqxJSiyJ1Y0aCOIRpq3yezpCpB/oACvobZMM/Ds2Q5CkccuNXheX8wDtNM
 e362jD4IY3dzzz/gKp410NtFiU+snKAwWetGKRbb4EAvHEp3+MG63MHGKNKmClO91eEPobWQx2Z
 7iEotDcci64867dyccaTrag5DfDFh3aZaQMZVB+9YhgOjXldFa8NeWnMlRTdw6cHJeqi/LPOtnW
 ue38lZWnQB6md239zLnn+tw/NrEC5Q==
X-Proofpoint-GUID: _P07SbpUM5RPgYsy1JEI9cnyptMwx2EG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_160357_888516_998E270F 
X-CRM114-Status: GOOD (  17.64  )
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


