Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF94ACD484E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 22:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VT84PwNDUBR/tJKsjUUmdrL7bPcbqpDnJjYc8wbzdjM=; b=POtwZCLZLHYlPV7T801gZ190OA
	xEd3abenx5cbK5QYMoLc6aKQHnE89KGufqJstFQ/3D/OYOE5BnWfwaLzGcG+qP3nt5Ti0zq3L2RRt
	ZvxPM58hLNPJdvenZrz5Jme4Brb5tflxq6t8gpX4ysXhdXm13Ra3/aM8/Sf4x7XKCNhPZfgLBh8mX
	nRC168SJM37nWNfwxHiOoG2snlEWkIPoo+NO0aCw23Dfgh25JaUlquiVNT1BlspiqSYxJ/Wcls0zp
	sOzs4ymJ7IS3Xi+GlcykvUOfeuE3ipxV2m4gRtUNSFONF3/aiWplLU/BZrdK/UVkDfDP6BWAus23y
	0c/h1Mfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMZ3K-0000000EuxW-1WpH;
	Mon, 11 May 2026 22:24:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMZ3H-0000000Euv3-2jKE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 22:24:40 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6mhc2574240
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 22:24:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VT84PwNDUBR/tJKsjUUmdrL7bPcbqpDnJjYc8wbzdjM=; b=Qp3AwBmVkx0EsjJ2
	vKcMSKGExBHgHr1iDbkp2A1IpUs6nUz3FfiGTOBgmHtNM1Tg1F8DP7XEM8p0a/gU
	YRhzibqnFtWGsjOJqAtnanVpzrnyxkGZvCmg8M1vkklyPRA9IQSEKD/MdzUxi9ml
	VWHRLWOaoWSn5wcNZ0ppHQKTBGxBsahdmIB86v/Da/wcCb/1KvaR5upWM7fdx0Pf
	ztgsWUm66qf/OhiCol8ldCwGILEHa5T4gMP9UsZc3j/KSb42PO5UU0GHTrA9IjTG
	7/wupGretjc/9D2mJbyzGEXn+ai/+nDFamh1+NXbt9CJZ4uc36XP7EPzQRiU388r
	Nq6cEA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv28ff8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 22:24:39 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f85179263so5227285b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 15:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778538278; x=1779143078; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VT84PwNDUBR/tJKsjUUmdrL7bPcbqpDnJjYc8wbzdjM=;
        b=Ua+395ln76S2K5+AKfzqqQH09N/BYhQHYsrMSuwRILeaaa3SZsAMQWN3zxD+ABhc1v
         fVXKAS8ts965c0CI4n8FP5sx1YqCnp2CnbxnFjGzazyGftgBK3kO/Bc3AtA1Mtc0KJT3
         OTu9+0Y6g96ZJPWU2jDbTrZUOjrVu4SRPgDrKRg/lv/GW88zbgudTlbr1PEcAQclQAZJ
         aqS4McLVwhK96oueLQTs5eXqR1b8HkfAnnxfyR3gx+tQKpNDV4tMG0y8Bn3EcRL4/8Wu
         kEX5pdneOq4ONWLmd0TJ2LCR+wUwOGmnuVWpTrSsDDjw4iOgVCN1ZGhXrc3muCuMWk1c
         iKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778538278; x=1779143078;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VT84PwNDUBR/tJKsjUUmdrL7bPcbqpDnJjYc8wbzdjM=;
        b=UkO9gA8VFa/ZSH6FEHQX0pP7pKKBoVq7UEoa4A2CR8eLHj9um/Ht7WC2UaxAAfeGpU
         QNFgflZdZxl7s4DyT91P0a7Z+rjaUpqIpnBepXVZ0Bxtz5GUkALl7zxF3KLJFy2He+nv
         j2ZEddzaac58rtP1T8/ksoriZ9SpEWN9HpODTGi0QDaHsnRXWStS47lLlvW3XL4IyHL7
         xiHb62jyubYDxAbs3a5ZNK5h8MafW4hxikv/dPHjUhYUnI13jpOREXM3I616lihyhUUF
         H0ngvds5uhkY6iBHJvRb/obf7jtJBcaCMaasmMPgny5BFP3bYMYSkGfPFMup+n2Qv6uB
         yNew==
X-Forwarded-Encrypted: i=1; AFNElJ+CIXcIFXmiYY+GcFH3mnRwNl7muA8Hw3UHqhE/PqdTPB5SdAR2Y6q1j8XIaTrQi0a2RPQRz5K68XuwekCU0Mms@lists.infradead.org
X-Gm-Message-State: AOJu0YxH8wVhL887zqWfDZUlAGKebqBZGoY4EZ/lFnLGB1fnwvmhZb8N
	KABj7LaOW8HftRCOjo3pyIYqb28zsOlyTvLuGQfC5eLk7VFuhOFLl7+pto2/fbQ5yAlroODXNYk
	TJGr2whVyUBTc+KIzXvKYFYzpSjL7D2CQalHxbAkm4584Jx0kK1YYm5PDH7zWRr9Hvvk1z7f1/1
	Nx2w==
X-Gm-Gg: Acq92OGQioGlqab6jd480Whb/XQZifuxtqn7xauD7DK/VebnWWNDl+ljDuFsnb0Ocwx
	GPfgRdo/oI8gt+4KFwdKDuOVoQqjaSV1liA/XBtyEZDgdpwgoAZ2vJUbaOP9ttrW5Dl1LMWsTI/
	6yMqmeeB0DuZ9feq0r6QA8ALOOn/AEyeUWWCS+oZl0OLBZ/nOFA/2kAfRi5iO3DMnz+cnEmFHFn
	VuJbRFZlE+NTWahgRP46c8jQ1iwlOK/bzIS79EgGl2FH/5vst6Fng6AcvK8RcwZH1yC406S4wZc
	u+fTCu0g8GCy8kXrF5BcCZld/DxuOf/L0Y3DAjLdU33gCgozZ/QV/Zh3j/jZCJLfa9qO19ME6z6
	Cq0Jl1jPMGBrxOCI0dowMeVdJ1Z9OFsBfsqcujkGzEA0Thg==
X-Received: by 2002:a05:6a00:2c86:b0:83e:c8fb:54df with SMTP id d2e1a72fcca58-83eeba03dafmr336274b3a.2.1778538278582;
        Mon, 11 May 2026 15:24:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:2c86:b0:83e:c8fb:54df with SMTP id d2e1a72fcca58-83eeba03dafmr336251b3a.2.1778538278121;
        Mon, 11 May 2026 15:24:38 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965946543sm27028110b3a.16.2026.05.11.15.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 15:24:37 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 12 May 2026 03:53:22 +0530
Subject: [PATCH 8/8] arm64: dts: qcom: kaanapali-qrd: Enable GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-kaana-gpu-dt-v1-8-13e1c07c2050@oss.qualcomm.com>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
In-Reply-To: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778538205; l=723;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=4TwFG6GQ2rWfxHvno6AGnLKMEMKg94Z6yrhbxek//KE=;
 b=waPfCkFYB6eDvZNGEFJsUZ4feqP4qBVshCQMu58SBRIUoShOVQKU1ivqUXVi57+d8FACeeVYb
 q0ZLr2DHU5jAOh82UtRnGExYjXfoo+hpAyQ8b0CbMm6Im6ysoGaandY
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=IsAutr/g c=1 sm=1 tr=0 ts=6a025727 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=tTGeZ2WnJxbZjfYJna4A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: FLSS2ZdhCIyAKiCXYFkmreCgrKzFS8tg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDIzNiBTYWx0ZWRfX3UOi/8uQ80Jh
 OMYu6FMgunTYwcBPa/sM0SStC1em4LGd4wEerlgdx0gS+ktJLgnpzZ0fRMzKCxGZdQo2YRVztvW
 FOTpn5eXTjy3qP0/VASYn+CX4/fM2Zw9RMxdzTariQS4h03hIdG29pD/SkjtiA1yLUj8nGiLiar
 ZqrUVIQx0/S9hCH3NUKkuMnD2a/C2sauLKs8KZLZ6Lvifm/x2+anjK15yZVFSzKVuIZvgvh8Oe+
 Tn8p2/bxhciASwbmfkkbWMq8r50hZ4rllEf57x+zx6r8OOUdkUJATYNMS2F4nviPU4Lu14y7W/I
 8rb/EexN6U4by2o7E/ks54IUPpUq5+rs2QzDK5IhSbCEuXz38kwZuBwdYgKvpQ7di5YkOI9pN5e
 86XKfkLYoSGGAT0nCfRYm9EAAEPFs6PlpI/PjA5w+lgjBQtKTs8NucdqiwMhBN/rdB/V5uzeQFT
 26Nwcf+bSpK7AHhxZmQ==
X-Proofpoint-ORIG-GUID: FLSS2ZdhCIyAKiCXYFkmreCgrKzFS8tg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605110236
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_152439_703366_FD08C8A6 
X-CRM114-Status: GOOD (  11.80  )
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

Add the secure firmware name property and enable GPU support on
Kaanapali QRD device.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
index 55d02219ef4e..6bef8ec151f8 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
@@ -693,6 +693,14 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/kaanapali/gen80200_zap.mbn";
+};
+
 &pmh0101_flash {
 	status = "okay";
 

-- 
2.51.0


