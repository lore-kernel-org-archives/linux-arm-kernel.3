Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422B2C678DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kptoO2Aza1llV+rVNxYt5GCzthVJqYhfomZaXMsN2c8=; b=unZAA2KtbFxiigsBSWha5KqbL6
	G7ekHeXKwHDPcsnH0Gg5vIpZLW1AcZPJ5/QNQAsHULFaN6d7D9GJEBT3OeyED2ImNdLq/22UPZRo4
	lXQyID5F5E84yYeVs6/J4XEki+68NsM2RJIrERwmmBldojsdoCXUYTkcG+gKIp/zBRUDNRclq3ovA
	EuGFlCQCnoquyGMVD3rLZ8BM/1EWm3UwEp8LdTw9r8vMd8YFlwsdJ2OGAEcKj1Ty5WplUtfZ0MPwg
	Yn+Bp7HvABjYHGAf1yQ0FpqOI8dTAsG0moMu00dEc1uAK5q9g4h/p3jgcHNVnci36KlFx7bFUw0Sz
	noxNiO1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMpS-0000000AHIV-13ZB;
	Wed, 11 Jun 2025 14:53:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJRH-00000009jFY-36gq
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Jun 2025 11:16:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=kptoO2Aza1llV+rVNxYt5GCzthVJqYhfomZaXMsN2c8=; b=ZxxmcsDNL4FtjVhFs95GwwQxfx
	cAoApMN28oOR/XJ/okDLpVXnrgR1hyj42K0AG+Io76o8L07njucsdg/73s+e7W5LzlDEbZOF6v+In
	0dllt5MAWTjc45pv42v9yvUejSO+BHt5CnbZmAE5GLUCWfKPtNKKVq4zeztrDOkfKClHfj0Wdxjux
	zFn1tu3ViBMyWbYZq8cOUkG7iGmUwTmkBj6GjnWu96Ui124Z0vtqvW/jimTCNl9hfI+Wu+i/SSsjk
	G6lNGfdaGYP8ns3hAXQU4JZjnVhnZdZtWhLroNQJzJ6uD2hT84/Nyx7lozUV6Fg+an64X0MFisYXy
	vU0pQ6YA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJRF-00000002LOO-0SGe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 11:16:15 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DFYK029603
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 11:16:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kptoO2Aza1llV+rVNxYt5GCzthVJqYhfomZaXMsN2c8=; b=Q28xpXfRIXoriJML
	Pq8K026dk+buY4vrjTM7ND/qPGRZkUVeQUMmmN8KUd7+V1NWxuBzgALPEDv+Qj0c
	mHDvxjax79lLC7M4JMXkpMJT5+GkCT1DA0JNV5wHbhwbVfP4km5SCnr9JDYjLC2A
	vAXtuVnUczmrWgP5k6P04mpxaR9TeCpTMxfaDdbDA2gnCtJ2p1Vq3Wae2QKJwEOt
	XSva5CT4tHh7X6CWxENiqepWGq3qDbpDw8yVYroLxeyoS3LefwlbbMVcMbGRGdDQ
	90nYCx2olBY4aOrQuyv9q4+Lw7E60wmPgYCEUQ3E6PGo0dDtKOBBadp4cR0iJTRh
	tKd7DQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d124rm5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 11:16:10 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74620e98ec8so791855b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 04:16:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749640569; x=1750245369;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kptoO2Aza1llV+rVNxYt5GCzthVJqYhfomZaXMsN2c8=;
        b=kMvkSccvv79Z6uvqdKI4Zz1XZPTFZgLhbXq+k1FBzu9ZuzChRyzTRcDJJY1Chqs62m
         c2QIZuba7Tdtypa8Fl4LGUnLBJWpFxC4f04kVooA69P74/QbQq72me9x4OQysywVkg07
         95/g53l4VlY3tkgFLjuGN/yuuqltOs6sWCKIbRTdwgDvymEvLlgYM3xJfxYX7ake6IXh
         znNN1JZjTIc1Be45Sw7b2IOTbVF1ydVuPdz9aOgRnAsDL4dKIIpgQ3Lf9YIS0iSBReE6
         tKRSVOfEFvuKyDzs5zq9Fc38v2oUN7MYYBict01F1kxpijMaI03Z7H+91qnR4CNmqYBZ
         LZ3g==
X-Gm-Message-State: AOJu0YxLqT9daXyRO96vCcxZsLuzxVvlRtatW3jgCq+qrgCI1X/QQ67y
	R2N2YBJHBhLd7nLmpsVhypI2dOSO1m3jBDKNyuFGqEHHDL7YCUwI7Mc/u1QGLiOMIhgSmjkbThI
	1HknTohYCcJJ3nzzhhOCtZh304OB3VTNDKGINVKQlRWQ80qnI5z8TUJRXyTTwugo3gAo7t9h/FD
	RT6Q==
X-Gm-Gg: ASbGncsJ5Qzu8sk93a6/+1Q+1Gf2/Tuff7BBBBBC3vmKjR372iQNMkbgFgnIOFVJyb1
	xKqw0O+J7zRZW52TfxhL3zfJukX+BTd2VGaBrjfPdYJPtvYCxV9aqpOsnnDvk7If6En88a82kbC
	EyJM1l68fxMPVXzT93vr1i05NgQOMqBtF6qiQ+oiDAaLuwXr0NF9zihdZ0TE5prxhs1QSQ3TcVa
	9Pt8bd3Hn0VJqiQY9CyelKxIK/o8czVEqcZoJtGsBMtDKF1ah0vSqVWpZrJpmdAUr3fsnZ2donh
	It2B4vZHe1UgxfH/ToCI+HAv89u4Cipi
X-Received: by 2002:a05:6a00:4642:b0:73b:ac3d:9d6b with SMTP id d2e1a72fcca58-7486d2bfd99mr4480455b3a.4.1749640568957;
        Wed, 11 Jun 2025 04:16:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQv2oR9AKeWi6BvBwm3nl0UvCjpE79XpYL9hXCh5jA1F6NZ0xrqYz3otpm2s5qxPpHx5fcxA==
X-Received: by 2002:a05:6a00:4642:b0:73b:ac3d:9d6b with SMTP id d2e1a72fcca58-7486d2bfd99mr4480395b3a.4.1749640568511;
        Wed, 11 Jun 2025 04:16:08 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0e9d57sm8820772b3a.160.2025.06.11.04.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 04:16:08 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 16:45:32 +0530
Subject: [PATCH v2 2/4] arm64: defconfig: Enable X1P42100_GPUCC driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-x1p-adreno-v2-2-5074907bebbd@oss.qualcomm.com>
References: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
In-Reply-To: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749640547; l=821;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=nMF9K7Auph9cWiGh0kXvvupbMizZQhoAr4irrlKWwzA=;
 b=agOSO7dfGn8dIa7XVbLlt4oDG1hgwGxcPdJ+VerIynmrzAOr5Zglz547UxQuM47URqq26uh55
 1s+Uje4N5aqC8m4jFOukj8M61J+FVNVu7dbTpIXOsh6xEwxxDjWEE5g
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: AhCh_uFqrjUX2J6d2oEC1IZeILtcNhku
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA5NiBTYWx0ZWRfX/7bXrueUE+wZ
 IJ4WUB3TvYjt58GA0nXf6ffzMTrumWeoWEEyRcO1SFWPcBwvxUtYxNn87qdBxP/xlLr8MKlx4xe
 3Jxk8eLWZ75KrxP6ufESRnp0iMy9CWTer4owp5ov3Qy5iLEJo51cpfeIep/FHe7nPuiNEV1hWuP
 mXh5fT+j563qanSNIdfevg2eKlZpEz855xgyHfQVyFs0DWjJMyoFoqaHF3OSv5rrnz7pztAIyOS
 OA+d55RZ9wqUz96A98CkUAM8zaxr6DIN10EBLxr9bYO4BtfhkEityytPeA9dR+RP/d+PzEylxnR
 TwXpVpJPS9GBwgBt092+qPZFzgHzzN68X4ctLOYMmeqQJW5uymanJrwBVSg0E3Xe5/lETwHnCVZ
 RAvlEjKXxKQjceywsoEP6GSIrJIcuuagDa4cEIHHsLm+7OmA+H/l4nOfXPiax9xnrLbyXFKy
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=6849657a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=-EtVc9J5eg0rhuNXUfoA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: AhCh_uFqrjUX2J6d2oEC1IZeILtcNhku
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_04,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=701 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_121613_448250_2D9DEF50 
X-CRM114-Status: GOOD (  12.53  )
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

In order to enable GPU support in Snapdragon X1P42100
(8 CPU core version found on Asus Zenbook A14 and other
similar laptops), enable X1P42100 GPUCC driver as a module.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 62d3c87858e1817bac291780dff3823dacd72510..9cc473fd0d3308f7869d00425e17b114c87093b2 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1350,6 +1350,7 @@ CONFIG_CLK_X1E80100_CAMCC=m
 CONFIG_CLK_X1E80100_DISPCC=m
 CONFIG_CLK_X1E80100_GCC=y
 CONFIG_CLK_X1E80100_GPUCC=m
+CONFIG_CLK_X1P42100_GPUCC=m
 CONFIG_CLK_X1E80100_TCSRCC=y
 CONFIG_CLK_QCM2290_GPUCC=m
 CONFIG_QCOM_A53PLL=y

-- 
2.48.1


