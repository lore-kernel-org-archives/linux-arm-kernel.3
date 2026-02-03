Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F782E8306E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 09:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u0laHcyRQqMcqzyGUiX+7U/mo2y9fWruTI7bRibaktY=; b=aZ15QKFRQXhOVv
	jmQGd7g4ovhFOMSNmfAt8Njcwil34QnQXg3KjTFFvvenkjyJXQIvYYjjI+7TzmgMXEbe9FioD1W+q
	CEZ460bDFr3fGbucoEw/nkDpWAU8VClDluG4Xc5f+2zZsiz6hxN8XKdSL3FBmQTqeYqG3Lj4Poj2Q
	1RH50UDDLtleOWHo/1wBN+Qy+6ZSmMRGQJz04ckNSvY55gpJJvkH0TgSE0twdMWa7e4Ha+/5q0NsH
	ZEFPZQ8vXsfuBNUGWX3/feV29nGmK35NjCBLmMGZUw7VY4IWmGh+0vZEZiqo0ZnOcGLb1LLlx62fa
	Pu7LoA60Ck4nPV++urOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnCma-00000006NaB-1yuI;
	Tue, 03 Feb 2026 09:33:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnCmY-00000006NZf-0ipb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 09:33:15 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6134ibm52102245
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Feb 2026 09:33:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=u0laHcyRQqMcqzyGUiX+7U
	/mo2y9fWruTI7bRibaktY=; b=Sc4SyQPDkesghXqJhHjryJTjMZEeoEEmV5rXBp
	HU1pxylIkGITFG5gaS9rm30gkw7RA6oodAtSh4NBcFtna1x3jk9ewA3n6kdZReAg
	RU55ntpIAhH33LIxerU/YfvDqb+/q+qxK3rUoI7NvhiigpyjcZA45+0/3ZUGsEMh
	wR7XxrZsvXxtza3f817WGN0BnL87GmW/9w6ObTsLVuO7eEM/E2heoEmc+1/FUtKU
	dCI0jMJ6qF893+LBkb++DI/hcXcd9dyhiveAvGzCUEtBlkBwcWtUjv1lRQnN6jQ0
	tmYN+4E5FdxUKj3ySdALcs66jhjFYAkK5Kxy6ZdJMyVWYjhg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2t5ebwur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 09:33:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a77040ede0so54203885ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 01:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770111193; x=1770715993; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u0laHcyRQqMcqzyGUiX+7U/mo2y9fWruTI7bRibaktY=;
        b=Ga+LUv1bKjuRafVYfF4ukCtdFN+OJAGy71kYfmYDCZHy2Tjj61VHrWC03EX10J+g/W
         xm9Jue/tDZ7EM6N1T7B/FmU/ZT8DZYm+CPcP4VsranwevBWBNhe4GeLtsMM2Eb8mtD2R
         c+YR/AdsbJgdF+N5DBNFwQ4MD7wMW2/jzvmUS3yZPtHWCUU6NFY6VxWBWM/GW+lInvot
         W95bCdVT/tYbsYJl4RFD4LtsFd1sYZU9BS0O45xjsoWHGd61IftufQE+1JUihPX/rfBD
         2w/yRC4rx2RnxGocLlGs+s67QbP4bA0Qc2IcVhrVbpaT98UNwuL2tdGsP3eybF2Jmonl
         ieSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770111193; x=1770715993;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u0laHcyRQqMcqzyGUiX+7U/mo2y9fWruTI7bRibaktY=;
        b=dLmxAy6o4UKN7doUVZBK+H0afhgaZoGzsaRpDor9zzf3Asy1wxImEN6zN9xSaJXq0j
         GqrSHKwT3Fq7EUTGKHtGh2fv/wOdKJo1g9G6O8bOwiFDqkY5TZ8SOZS0eXO0qPyLLURT
         2KDCn8mKRRXXFGm5FzsmxgEEYL5hfYBcoGFP/BoFpI21tGNqI9/0z5NNK5k9x9zz2/RS
         YtrNV70Y0+CTPCr1uynTZqQCcjLbMLO91etSOzfY2dLksQQryFJVkTlld+AJZF2hVBMK
         CEHNOoeW95WPIdsBs1f8M9+qgavHTJ5mTeYq77RUvp/qhMYXmzh9f7e+Lwv90zLYp+FL
         q2PQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRoZ5JAsfa9Si3r4L8iOh9Gfdn38+MrQCqgPByaeAKHYqNtzVQEa6NsEjDf5suqLLZK/oVtIOVpsDOrfu7aPtK@lists.infradead.org
X-Gm-Message-State: AOJu0YzNlSfpNu3ObxZChn2MmkxGz2ZeGcMnftBs3KqBa9CKE45u+amj
	gduKliIHwWzaTZSs87UvtsqMtLJyhLtHedivQ+Am66kQUZSA6iU4PTHL0zMuKIQiZCS7bYE67gS
	rRHaLBDBwuYsMfhgBFuwe8PcTT8otRZmDk90SpRjW+SNzGRCzQdz8SOWo6V4taFPUdnSQJIxNOd
	1NvA==
X-Gm-Gg: AZuq6aKpjA3le/gOL3nrhfRhiTvjkTQAMr4o30SyAUvY/lPeGoC3nOaaDh912WhwRhA
	yBrQWHP4P8DAlsXWLtvkG9qtWMMB+nKJhG2L1YgLTD4IOYUhkzyRCUPhhFTG+yK89Kdfh3zSBVw
	clnK8/Q2oh2zK11DZhPZrps76EyGcFs5LOcO/gYouYRGPUwC3uVmvLf9/B6yDeGaJkwj58iLawJ
	t1sN1kxMG+rq6Alc2V/6AqabyTJkwKJ+JDFJu8wM/DWxTXct3bMBx0Yua1NFa6USt/RWekaQApT
	ujgqhVPYfoTRVJnoDUDVYIhbnUhd5jYc85PFCAUNzmDeI8hjV4BqZsPuP3YXu9pCXYZW2yOx38h
	Sx3gSE76JYnHK7skY4hk+N4ff0IFd38eCjofqv0hk62rye909MqYDP2QMCmsxd2bNH0FVO8fM
X-Received: by 2002:a17:903:124c:b0:2a7:3db0:6efe with SMTP id d9443c01a7336-2a8d959344fmr141413335ad.12.1770111192864;
        Tue, 03 Feb 2026 01:33:12 -0800 (PST)
X-Received: by 2002:a17:903:124c:b0:2a7:3db0:6efe with SMTP id d9443c01a7336-2a8d959344fmr141413085ad.12.1770111192392;
        Tue, 03 Feb 2026 01:33:12 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b3eedd0sm162489155ad.3.2026.02.03.01.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 01:33:12 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Enable CTCU and ETR devices for multiple QCOM
 platforms
Date: Tue, 03 Feb 2026 17:32:48 +0800
Message-Id: <20260203-enable-ctcu-and-etr-v2-0-aacc7bd7eccb@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMHAgWkC/32NTQ6CMBSEr0Le2kf6ExVceQ/DorQPaQIttoVoS
 O9u5QBuJvkmmW92iBQsRbhVOwTabLTeFRCnCvSo3JPQmsIgmLgwwSSSU/1EqJNeUTmDlAJKPrT
 UGs6axkBZLoEG+z6sj67waGPy4XOcbPzX/vdtHBmqs7xyJUiLvrn7GOvXqibt57kuAV3O+Qu5Z
 2gNvQAAAA==
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770111187; l=1615;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=XccZ96lDk92iWJrEvzXKPxaQ7i+4YFT1eB80lzaLe3A=;
 b=HYNegZBQeqLhA/pAeMb8NnSR07v4leZeJ4ohDhazXGy7TLosKqvwaOAOfu02zm8lM00YeLG9O
 GhSWE786Ue3BcNcWh3W+xkbMSZlu96fWyWN9nR9RvgYdFw6F+6YY01Q
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA3NCBTYWx0ZWRfXwbLDVHN+DsVk
 xQQteXmy22AYM84I3iGKbhd1YDdKsFf4mn9jlWZsZqVaALksDtqM9PJ80ynWm8V9PxN9qck1bza
 six541Z9v7puutRkdWG7/VvvV+Klk+M3eGr8QhawcVPAM85v9G0JhyHpm3jHfsKsVl1/oygdaCx
 CJIV80I6XHiavw9R3OgCzXAk9VagqOIu1mKs7OOXrBBagYEiBX0jocs4QWZNiE189plm8Y1WzqO
 GNO7w3zgcfM94Ey6WY5stCYYF3w00VivHugvF7mN1muHd7ODHJPk2y+Dp72mx+mxTfB1kTJxchS
 NUTLMNKv+SIdzaGO68fhX0tsybCHPwOykYtliGiXa6+qlMXCs5Js+9cdyw2psQ22gRJG4oHOaLA
 NS22g6gkQHFlXDfPfo3rjzw3fho5wyH9wmA27YIbESkmUCp7vveXwEUjE+L3fKcPp3abRBVXK96
 PDcAfArOqqndunG2Bkw==
X-Proofpoint-GUID: PO_2AE_9pXdtEk1FIfA1ybOyI5jXGxtD
X-Authority-Analysis: v=2.4 cv=NOfYOk6g c=1 sm=1 tr=0 ts=6981c0d9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=pO0fZtIvyn0UN2_VQdIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: PO_2AE_9pXdtEk1FIfA1ybOyI5jXGxtD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_013314_214539_60F0A641 
X-CRM114-Status: GOOD (  14.06  )
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

The DT‑binding patch adds platform‑specific compatibles for the
CTCU device, and the following Qualcomm platforms are included:
Kaanapali
Pakala(sm8750)
Hamoa
Glymur

Since the base Coresight DT patches for the Kaanapali and Glymur
platforms have not yet been applied, I created DT patches only
for the Pakala and Hamoa platforms. I will submit the Kaanapali
and Glymur patches once their corresponding base Coresight DT patches
are merged.

The Hamoa‑related patches were posted in a separate email, and I
have included them in the current patch series.

Link to the previous Hamoa patch series:
https://lore.kernel.org/all/20251106-enable-etr-and-ctcu-for-hamoa-v2-0-cdb3a18753aa@oss.qualcomm.com/

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v2:
- change back to the numeric compatible from pakala to sm8750.
- Link to v1: https://lore.kernel.org/r/20260203-enable-ctcu-and-etr-v1-0-a5371a2ec2b8@oss.qualcomm.com

---
Jie Gan (3):
      dt-binding: document QCOM platforms for CTCU device
      arm64: dts: qcom: hamoa: enable ETR and CTCU devices
      arm64: dts: qcom: sm8750: enable ETR and CTCU devices

 .../bindings/arm/qcom,coresight-ctcu.yaml          |   4 +
 arch/arm64/boot/dts/qcom/hamoa.dtsi                | 160 ++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8750.dtsi               | 177 +++++++++++++++++++++
 3 files changed, 340 insertions(+), 1 deletion(-)
---
base-commit: 193579fe01389bc21aff0051d13f24e8ea95b47d
change-id: 20260203-enable-ctcu-and-etr-31f9e9d1088d

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


