Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98170C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 08:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KnbrADbl03nZ3Cw89pBBXWj7vEWq4V7jAOOPfBK1kzQ=; b=YCON8r5darVqIi84KywJIbqgC4
	mfBdibyogw30yAkb3pXOjTMtbFV224vxN4wgyRfaqtJeIYWprZNz/5+gGMI7hVa4wRvOaDLAa3Ysa
	aL9l/SDe7wdzeCS3V7Bj03khF2uVIvZpt4yoAFUIspOD/L+bQ79ncQ9w6qjb9WR1gOW/6MHrXfMqT
	xQBVx0AK1d+n+yMwWTruqCe9WhamqC2YJD8LOqI/OY/qSmgaxUKA0Yy1/7T3aC0ZhraHI0XMPMgyZ
	87H7Lm+9g1+zSY4yGE2Dd++V1h2o6AvRHrwDcOJ2tjjMBBkZVmBX3LgEmvy+E4Tw0+gL9PtGLatP+
	Ckn7fzcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgI0y-000000096lK-0i6N;
	Sun, 05 Jul 2026 08:15:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgI0v-000000096jA-2ZbP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 08:15:46 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6657mswk1148002
	for <linux-arm-kernel@lists.infradead.org>; Sun, 5 Jul 2026 08:15:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KnbrADbl03nZ3Cw89pBBXWj7vEWq4V7jAOOPfBK1kzQ=; b=mx/nqlH+vQt38iZQ
	d28JFJ/cemI1rlkM9IGsruBz3FStlE2ismhLruTZkYLsHK/TAIDeWZvHAH67sOCn
	gNEXWi3bJuodCCA9h6F3LSX3oBr2HztIVG1Pnn9lDb6nMrr1mrSQ1BMF3BfMYay3
	So9w13jlRxMWddtwLFWb702CUBzfPj7+Gvc0lN8WNcpFm1sRd4+fbt29w4WiLza9
	keonQARIz/xuOcnA1icyyGgBSPfIstPNoYWlWaP7Co6w1pRXz7smtrNeYEHU9Irg
	ebAD27rNojNDVWOPktWa+NXGIHNhS6beGoxvZlp06mCqEowft93vcljxV/LWmzC8
	tN0/Aw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s4stevd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 08:15:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c9b1b608e2so39461925ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 01:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783239345; x=1783844145; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KnbrADbl03nZ3Cw89pBBXWj7vEWq4V7jAOOPfBK1kzQ=;
        b=UPwWUc1+ZjhLcSwj5CQXuIWESxAiX13NJ1rXpNe4+6RddBryulnc3gvsFf5Rl9kYED
         yrOxT6o7gyJbminHQOXkp95lOcPQKUR2NhRXNfvGKO0WRB2TcP84TCMrHuOl0U6lqzFR
         OEIrIfsLZ7XOKRX8iexzgifRnoMBIKnJOTD9lMHe4Sir/96bZGS3iC45FC0kOOuwU8Gp
         RVExMwmy/02tEzFA+qsicRpAG1no+LUbYf/zOmZKfnGGGRoJfBPM94BI6pZ9ulXHvZhy
         XUTii7KMpof84Eu7c3mzQRUt/b1KhvQlP9WT7eCpp2dGRe5VNm8jHMWOPVn45Nw1rTIa
         hmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783239345; x=1783844145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KnbrADbl03nZ3Cw89pBBXWj7vEWq4V7jAOOPfBK1kzQ=;
        b=NC9p8W+3lF/2mQhO+6GXOUCURQwd+6Fyn9lmoiKioR2eTFYBAQOt2Mg/mXzOXrXYvv
         JT7D5yvtcAI7LSAcJIzJn1ZgrcRUkGeiJYEANKyskqhwTdnz/btSiXoOmWjywToHVXXN
         PIhi99yVEeQcECzn/e2SDQxoClRVQTz0xskEZPcq/73Vxyl8LNIGlejJIErwhpalZAmG
         yMsqeeGp5/zZrPUI6QYPFnlrvO6BEquEFik0/Ate4081uJMQ8gXx9bWcJvDQ/T2Wy8Pw
         aHz/u9wtLGgZM+OinZ2o/VPXifKP8ZZQaOlJz+EsdF+u/yCgI5BCEI8pmXNdPt56Xd+6
         oYqA==
X-Forwarded-Encrypted: i=1; AHgh+Rr6kq7eWnUfrqPnK7FfSySTpCwd7guKwkq94bU/EOUv+qEDKpcmsFxr6CuFY9ngSfjYR6ufJbQv84zpcEa+QjF9@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq8VqvzWGrXVJGjhkqPCPRude085btHQ2pj1Ii3UHfCr7ZGna0
	0Jg86Qxvl/dYhvmTWmgLkwKnSBE7nsxqyfAyyJkJ4V/mZKsF7rNqnG+B7C+7jlaT3OrpZtrPD8y
	u1yzvIKBdaTWVXfQa1Ipk+XFTQy9mW4RNkjio+QdWTS09QEDDjCImoX7Wz6AIMmtoUv9zfNJvvW
	Ns0w==
X-Gm-Gg: AfdE7cmwunBOcCa3wflrESHTtyGnD3Uv5H4sX1N2hxcwpthQZShe8DFP0Lul/xNJBtE
	WiGfeiEouaCxVGV+8HuXIkT2cqmTnkp9iVuqrYT/yMHBbxX68NII1k/eOPIC4fVMYF7Lp0SdYOv
	NOM6TeadSWy0RKjitvI4hjhfDyxdGvn1Gm27XAE97T6Oh3vidgqaJDfPtVnqtAycP5+aUSi6uXK
	fRiDsFvYnf8Sy1XNOFx9IQZRFQCJaoz/26uCTq49nuSZi83nKa4zGbFCx7se5sxU/7RbhxX5CiS
	g+NczBaaICZMAvF78MvHZRQH24VLwIjK9TtoVLcbv3KkauxYQTk3WYNoLq8RKpJjvpagfcpAtGr
	2b3FbeAJnx3w3gTz+eVb7cYeqcqTenoqBDWw=
X-Received: by 2002:a17:902:e746:b0:2c8:248a:5dbb with SMTP id d9443c01a7336-2cb97e47ac6mr62891875ad.7.1783239344645;
        Sun, 05 Jul 2026 01:15:44 -0700 (PDT)
X-Received: by 2002:a17:902:e746:b0:2c8:248a:5dbb with SMTP id d9443c01a7336-2cb97e47ac6mr62891115ad.7.1783239343645;
        Sun, 05 Jul 2026 01:15:43 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85d4fesm36403980c88.11.2026.07.05.01.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:15:42 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 13:44:23 +0530
Subject: [PATCH 8/8] arm64: dts: qcom: eliza-mtp: Enable Adreno A722 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-eliza-gpu-v1-8-c9f1354dbd29@oss.qualcomm.com>
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
In-Reply-To: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783239265; l=765;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=7fFNa6LfUvVHEiiBGevq3c8n0UAvOooWHrhEPYn74wE=;
 b=6S8MpiE/YFAUGREvxnleOYfr3um2lofUcKuw1nfRX7A8mx3JwkxdgebU3v0OjfjzNtQWaFiAS
 /og6Rpi9tCdBjBax04qDhYpZnfbJh24WgKhT+Nh+02OcLdPzXBHjNLS
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MiBTYWx0ZWRfX0y1jtv+BioAW
 NxLSQKk1caAK2OF2UHWpgrnDC/BIFyzEsqEeLMO2oc+VVsKX0xnjQneDGGGh2iilOpXLg2cpKgf
 rN1YUC3ri3swsUkfyamPF71d0YfeNDs=
X-Proofpoint-ORIG-GUID: 3dMhOAz-yvjVajSLMNLuMDGYALref1d7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MiBTYWx0ZWRfXwguoNCBd27ql
 yuHX/HnXIzkrve5OyoWRDT10u7BRnaSqnZPnzXCjM4ZRHrds+7Al/xf/dS2nTtmxDQZNbEeOsGL
 mR5rfRE4lyJzmXnYQnC41D09W/7sK6OXfHKxwq0IYQuB+hJ8gg/A3Ok6l5TTurwvsEj301/8gFj
 0LBV0WFBcv42NeE48vO8jFJ/FTT8w9y/shsaD2Z1gtVTwiKb4tvtgtIujQV1GkUjfEWR82gzmRw
 iQYMQewz5ncYIceeSqPFZsI2MwexHNEWtKcJhbRk3TQMkx1RqOrQdTa5/iki4RBHM55DQEOF0rc
 w2gTlRxSGyb+jNz44ofMhMCyFGDdr/E1ZnVDKnddNzrA+UXpNJtINnqz6WVSWdZF+mgVCCfQ3/e
 X5MMjvMoZ6pBSguwIE/3r+79gFZVDlq+IS5f8XwAvbcNEvZOvcd0TULQqjECO4ZYN+F6p/4J6/a
 IHcnh/v7UuMFtHm4xzw==
X-Proofpoint-GUID: 3dMhOAz-yvjVajSLMNLuMDGYALref1d7
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a4a12b1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_011545_666340_397B28B9 
X-CRM114-Status: GOOD (  12.34  )
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

From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>

Enable the Adreno A722 GPU on the Eliza MTP board and provide the zap
shader firmware path.

Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index 1374afd9d14e..b280d8e845b1 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -417,6 +417,14 @@ vreg_l7k: ldo7 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/eliza/gen70e00_zap.mbn";
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.54.0


