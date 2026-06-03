Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ECEBCD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=18c0uCFR0Vx98Z6gn2p5TRyfVjWTgQskztRp85wyJKA=; b=q0elqafKwS3U32m1A/h+JlH4Up
	qlplbVzwFydX6s1ebPCiW3L3K1jkRIHEoLJse/G2qBYP4Nhn/rpC21W9BjwWY0j5MmeqhlfJ035Sk
	LBBWbgKQYwndLWSeyjSg67eUdxj6ph3D9YMTYKASxxjIURP0by4yxbDYqCK6G5JtZZSWyw3dkae+X
	SEIc7LkVyXnuqMog4o3mJHRQVBXU181uIJ+GbSJhiV9vL1rbXbAywkFTpC+BnopFdyXREE0+l05XW
	XAkqWEKk3KLm6E5KW6r4GxBU4F31g1YgPwKAA4kLi242+YLOd4i6OFljXW5Qvr24xjItVrlyOCN20
	B+vaeJ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUn4x-0000000FJjz-0pki;
	Wed, 03 Jun 2026 15:00:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUn4t-0000000FJeW-29IC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:00:20 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6539vTPU2368080
	for <linux-arm-kernel@lists.infradead.org>; Wed, 3 Jun 2026 15:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	18c0uCFR0Vx98Z6gn2p5TRyfVjWTgQskztRp85wyJKA=; b=Sug/L9WINtQNcSA+
	VWzI4NBOLDJYWHDxbR1Q2y52ks5mWmpK/zQDBuk1kYiiuIe749UqP8HxcnCXSNfF
	+k4v1Z5ISAxbWErr5WJj3qbI83sK0npm7bm3T6/lBt8fFS/a7ke9CeXLBm0KUaTr
	ITw9IjYS2woEBFMtwqR2B4ZZHW0Euind+QTa160zVwp45K2jPM3h9ma/DBZDwUPl
	r4ZONSuc0YhF1FprECN2KA/DFYpRX7pLFZXHWuZcnTzLV56SVYM3fvcYiYIjD52T
	EeB2ULUr97u5snKtDVXW6Ig6esFb66y+3cqYs4GkTmfZzwazR/qiOlE4vd2mBwP/
	ym8XPA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj3gh6d9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 15:00:14 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85a2bf5388so2285436a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 08:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780498813; x=1781103613; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=18c0uCFR0Vx98Z6gn2p5TRyfVjWTgQskztRp85wyJKA=;
        b=GseWbZxTgl1qV/HIbTFcWFpeEoFSjxkHp7uOs2iXj6hRU0PJHycpXxCIiLqoSFSr0o
         Wp+pfDaKRpegy1xzatu5tN7PqGXGAkiSgdg+8xs14mLy0yqR3Gg4bdcZV9oRHnkFEAz4
         H6SEfM5SomXzbH/8wcLpVCPszo+UMFSXqAKFo8sAqegftnlsazPO05wzMxbPznMdVw9/
         YZ87Kvw02op//n69aFh4rQjAytQM40h/hZPHiftZek2+/k8FPgkGhciZcVcS0Cj7JTd/
         s2dzhZJzWJz88J8AvhnEd4/HFQK0OJ4lBvPvaeZnf2QhXAuyok7BXsyEKMICtw2+kk74
         UNTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780498813; x=1781103613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=18c0uCFR0Vx98Z6gn2p5TRyfVjWTgQskztRp85wyJKA=;
        b=WAp/WZJz5wSEgE46j492qCQ2fgHWZVUln5kSaapbko+VyR70M2oLwkpBWydCye0bMf
         /ZQnFIcJ8Tw1daQ+p2woXvbeVQit5BQLMZLI2k9v67B313Grp8C75eIHTrKJTuvC82tw
         zuLTqzKYrbnZ+PkpTMCgGjlW2IQaK9ItAZbUWB5s2tNC8ybS1fFmiHshjutKHcXk9PMF
         cmTdorIhcJA4gA0xdFTcyfkOqjTACk1iwXePV/hyqOkJ9eQ312ydn4hueATj+SzRyjOI
         SfapdILaxQCP4BidR7APMJBq/bYIrAk9/jjGw7XEu7+um0rMCTKIqj6/pSK6jH4ePMlK
         7wow==
X-Forwarded-Encrypted: i=1; AFNElJ/NORmHT9wZaLuoADf0196srl5TEmF3sSnD6bJ9YrXp/lZzk0naXL1tIwGUVEM31dQxzHKb0s6PRc7jZoU4Ddml@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0W8xTUGpgLTn+pllnkxW5FJnVC+pQIXZ0wIITfUKXzpxQ3Eb7
	G5wwakHPNH8jrPt0B0Oi2bjNPV7UChKjlj0/hw3SGQuOv2/EcA7N29fpzmGSItPGiG8Jkh4v3Od
	tDbFfeP8NnWejaFPVvP4h1wVM8OLi8m6B3bAJVu/9i32m6Fs5whmUKTNBKyJhOre3O3Xob21Ckl
	P+5w==
X-Gm-Gg: Acq92OFb3PNcwVj1yqrnLSoHflzTgAVpXlJ7mbnThOMrllFBXGv7dcf+ZNjk3iJzc6t
	4f4RgZbgMTK+cRhirxigGXVn5H8XRq26+QZeGgZFAqh7K03bLpHxm7tpd1h3RYv7IY93YW+1OSg
	PQT30EetltoTzES4yoOdOXAF7zQIiidId0wn+V1kaHPeM2NUB75JF/SbYOFi0sRce9Xm2V1ldVO
	q7K1Yll+CnPY7fOI9httddcmIw+Roa2eWHwobdyYOiShQONWA1MuepuU/OhRtd44owFayoQwcp/
	nCWnN3uj+P5Ky4bAZ04lhCt++OqTh6aFdP1MNkBa2BR6c6N5MhccYSKtIRhq1Ob4G/c8hxuwAZl
	ZL4pzDhne5Z5Q1oM9VANHg6d4egA3XpbM80I/o0TOpZX6FlNjnykMCu7/mL0=
X-Received: by 2002:aa7:8887:0:b0:834:e5a2:d089 with SMTP id d2e1a72fcca58-84284f1bdfamr3771752b3a.33.1780498812821;
        Wed, 03 Jun 2026 08:00:12 -0700 (PDT)
X-Received: by 2002:aa7:8887:0:b0:834:e5a2:d089 with SMTP id d2e1a72fcca58-84284f1bdfamr3771679b3a.33.1780498812312;
        Wed, 03 Jun 2026 08:00:12 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282882170sm3747409b3a.30.2026.06.03.08.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 08:00:11 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 20:29:29 +0530
Subject: [PATCH 4/5] soc: qcom: ubwc: Add Shikra UBWC config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-shikra-display-v1-4-aeac1b94faa7@oss.qualcomm.com>
References: <20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com>
In-Reply-To: <20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780498770; l=988;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=a7vBq7QV/0yauiv4Qm+n0KSEd9tQP2btOuvl9/RRzPk=;
 b=LODbReeosUf6ztstgUJKlWgizfw2G5LN5Ygs4s0z7okzEppVrZbtrF8DieJuyRHJDpr2KhVsO
 X+HJ7VKFlFUCz+q/m7DTxr52OcTpVegvlvq5s18YKs1fSb0RScsxD/X
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDE0NCBTYWx0ZWRfX6C29CT6vtKc8
 9FcXVF+cixEseOY3p+B6GDRMQpqUFlbn+CNQLKbtVdtBjYyc7atUkw+XuARLVKcz4KlpeFFHZMW
 wmFTcJnDiOE8sjtH3O+Yz7sYm3sMP52O1UpOmJpwCuytmKboyW6zLK2PyCdulnzc6O3ZdBqZlQV
 vHlUN4Hlc+4+Y57YRglwnXLEZ37qL3kxMPXV/lk6EPVDaS9bS8ePESMoubjClQzUcQnfCF2V5ss
 +1+LhMK6ywEIMh2tkQTXnQ377pgPH08fAEUi89ear09INlOt1r0lWnJB9KzuBOkeSctnKTGMTN9
 o7oT0q6+MfSzCWIfBX7MKq5z93PzeQdCxxMJUoIgd/RCrUyF578YUYkPMLDVAnsI/KsY73SfaW2
 wZyBVhbYN+QGk2u/iO2WewwEBtJV4w==
X-Proofpoint-GUID: Us4-AHJZgFt99lcp3pjxh6LBXqnQqLIE
X-Proofpoint-ORIG-GUID: Us4-AHJZgFt99lcp3pjxh6LBXqnQqLIE
X-Authority-Analysis: v=2.4 cv=UvhT8ewB c=1 sm=1 tr=0 ts=6a20417e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=4nfEs0z1Wzubab7DKycA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0
 adultscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_080019_691133_FCDB454A 
X-CRM114-Status: GOOD (  13.14  )
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

Add UBWC configuration for the Shikra platform. Shikra has no UBWC
support and no highest_bank_bit setting, so use no_ubwc_data.

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 3fe47d8f0f63..01dca97e2671 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -278,6 +278,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,sdm660", .data = &msm8937_data },
 	{ .compatible = "qcom,sdm670", .data = &sdm670_data, },
 	{ .compatible = "qcom,sdm845", .data = &sdm845_data, },
+	{ .compatible = "qcom,shikra", .data = &no_ubwc_data, },
 	{ .compatible = "qcom,sm4250", .data = &sm6115_data, },
 	{ .compatible = "qcom,sm6115", .data = &sm6115_data, },
 	{ .compatible = "qcom,sm6125", .data = &sm6125_data, },

-- 
2.34.1


