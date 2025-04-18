Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC06CC369C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 08:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0qVY1mYqI07xxwOPaaEJN9uMuf5jLViwP+ENDWkNYnk=; b=oWvJxvfjshDMAlXLbMg7yD9jcn
	LwvW5mSeHyvEN+wWvOOulgz/p2jMtUl362Sv/ABHozX0GvZwmUvVf/xy28K8SUwChgWW05I0gK3yC
	OyI62KL6/NDVqJBmCD2qB19twU/5BrEL75IpO+8AYTnH2uBTbiFkS8e+c4F31Wd4hroBIOjNj96s4
	7XMwS+WEdBamkip1rt2+O9nlOgUq9UFiC3LbbbA74MTOum4V4sLcs6XFSy5m3xLUpUlZmyerDi358
	2VICg8BzgDyDTnwJ6Y3wv8IEaWFHKy+oxWyvmpbzVn+KslZHe7pyRRfj31zPXBIz5KwtONtkMPVvc
	fcGK9bQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5h2r-0000000FcGp-2OuS;
	Fri, 18 Apr 2025 08:25:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5gUJ-0000000FWHg-0DAD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 07:50:16 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I2IXb9015277
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 07:50:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0qVY1mYqI07xxwOPaaEJN9uMuf5jLViwP+ENDWkNYnk=; b=VzZuxaapLeJoz3Og
	9KdLyHV/uWxalvCpQqOvwlN+WYGa+6049WoEievtDZ+jSacVClLOM0tZYO9zzo1L
	gUwdtKGunzgE4EDJOTk5ahXyj9Kg+iYIccBNqoFsFHVx6EPDs/O1g4t0NAUDp0Nt
	XwxoNHZe8LSxJ1Hf7W8JTBafnxMoWXKzdts5fXiaq4UfRpRizJB6ilGF9qscHdZ3
	JRdioIMVYJMPTVfl7SGxhwv+ezrnvYFTKRA2zC21YBAx/Ut/47G1KXbDQF+JA8rf
	NYSm/ukIWE567ygyc7gPg66lBaZ+tdb0IknpsbPLt1iA+mm1h64nljVbwjF+l2p5
	CvdHJQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6seyr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 07:50:14 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8ed78717eso23738146d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 00:50:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744962613; x=1745567413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0qVY1mYqI07xxwOPaaEJN9uMuf5jLViwP+ENDWkNYnk=;
        b=lbqoqm9OQewDmUlhK8JStgzS7kF5oU0O7p3vUht28NAxiAIoc4pbR5ZHe54DBvgaCJ
         9GNRCSa76wo5OByhhz9MSFflYfBzJCngdZUry3bvDQIZay4UcBEIcNqeZITWhH0Cw7Id
         05Z99f9p30N3X86Uyql0bZc9kWhFvJxJIxfR4C94xnplhEqiTLT7Qnu8uN6FM8K8EO3I
         /yHMHtLnsMKyc1JcYUZwFBPvv0xgPebjJdmwroGL87ZvcQZgCFyKHzYwe9jAcrsXC2ul
         I9/I+Zm6YHnKE+y1X6MY3/toZbn4eXritctSj6iADgC2nOO5ScmI+OKXB9QBrS73DHXh
         235Q==
X-Forwarded-Encrypted: i=1; AJvYcCU1KQMdCxmnqJIBvFuh8wozJkh/eN9guv3E8zD0vpQh//2ZnLCwzE/fZcMBzSukqlYQsMU1vc4pxPNY/jbuHxeM@lists.infradead.org
X-Gm-Message-State: AOJu0YxP+jTXIYi3KMiJV3o7LmD5MENQGq8gu0O6hLvsVx0NE004N84o
	KT+bbYALrgXlqocJSbrnpJTUkOyEl4sNp9JbDwGDxW+y5HOluvmLPPeGpm/gjYkebl47fooyyPh
	eqWwz86CPbz3rLVdiIwwTnn4AfYRaTkJrO8iYwLobzNlSKlNFj++KLlIcHYgPMK1tNTHI/5nDsA
	==
X-Gm-Gg: ASbGncsNpAYDZdvY821CpfFauZqebctz5UE2/YWeUpbrYsAaagDA7bMcXzZY6W6mqgr
	WhjKrbZm15M2Z2JJbDpJC4SJpt/MTKTtf8x6ReCBF/H1U3xLN5dRspVqC5Adgs07baloe5yd0xg
	3QXjks5vS9gBO+EG8flYjpsB+8w0pM4KVw5M9oICBLYtnJflSUVEPFr+Hy6RcEoYIablSWIee3Q
	l/bDsAQGzjoFfO1B3ng3LcA6ul7tm8dPsaVygvw4Kl4/o5o6TQ5UsO+hLS/jG8ZaaAtKNgwJ2M/
	yiKAGZDyotD8fYUAkiZdc2OsLWW9rBJ9COt3Dk5FyZIyrB1B2Z7BZZLfFo5zk5+S3lAfiBah3fm
	yLrrAwPdNm9sXMhOFkTtAbM3l
X-Received: by 2002:a05:6214:d65:b0:6f2:b06f:fb0d with SMTP id 6a1803df08f44-6f2c450a7e2mr29664966d6.5.1744962613362;
        Fri, 18 Apr 2025 00:50:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEFBKxjNRvAZuYCsZzZoBOXQ5GZ7V5fEmfAkthh/uU8RIOKGlrBZIGmI/H7A/leQUzYmjvVg==
X-Received: by 2002:a05:6214:d65:b0:6f2:b06f:fb0d with SMTP id 6a1803df08f44-6f2c450a7e2mr29664716d6.5.1744962613053;
        Fri, 18 Apr 2025 00:50:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-31090863bd0sm1649061fa.113.2025.04.18.00.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 00:50:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 18 Apr 2025 10:50:01 +0300
Subject: [PATCH v5 06/10] drm/msm/mdss: add SAR2130P device configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-sar2130p-display-v5-6-442c905cb3a4@oss.qualcomm.com>
References: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
In-Reply-To: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1520;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/w/74iYrKtAn6Ezwjelu2gFTZwiy2nDMAwTnc7sQiaY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoAgQpHqG0APamLD8Y8TOI43B0nFr0BQVi/h0uy
 g93F+tmYXKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAIEKQAKCRCLPIo+Aiko
 1SNSB/9iRh03V1205EUwD++qfE6m1Mb38kuXYdQt+HHZJMWzHNaEcpeT4/k/11kXAjeFLU7FrQY
 9G5A/J4nhNmdaD2Xxp1pUtSb6B666EBA5OeqQ1UGCwrtJEKyqoa3b8cCLPHoi7RQnsbhVkbaFQD
 Nia8Vlrzz2oXwAFp34S2WR1jzRqRZ06W/NKceDg3zkX/x+Tvej1iOnwfjEwPtkMeqZIzau/pZUg
 fZscEVOtmz7SlrWKzLtP27s9i1tZG+1o5OyoZRnXKWNxnRgglPlOIN0zOma6RCH1djI07cpltmq
 wkzyOliMjAEziWGI3xR5SdbXiyz5idlUyqgWmyOlBji7ZOVs
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 1mM39g4zP7CPhIls-Rmdt4E1sbX4_SG6
X-Proofpoint-GUID: 1mM39g4zP7CPhIls-Rmdt4E1sbX4_SG6
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=68020436 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=PM8Rf7rFGDq3tjJTke0A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_005015_094585_55906555 
X-CRM114-Status: GOOD (  14.05  )
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Add compatible and device configuration for the Qualcomm SAR2130P
platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index dcb49fd30402b80edd2cb5971f95a78eaad6081f..f706e44231a9c360ac4abe26e4050e416d8c3940 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -592,6 +592,16 @@ static const struct msm_mdss_data sa8775p_data = {
 	.reg_bus_bw = 74000,
 };
 
+static const struct msm_mdss_data sar2130p_data = {
+	.ubwc_enc_version = UBWC_3_0, /* 4.0.2 in hw */
+	.ubwc_dec_version = UBWC_4_3,
+	.ubwc_swizzle = 6,
+	.ubwc_bank_spread = true,
+	.highest_bank_bit = 0,
+	.macrotile_mode = 1,
+	.reg_bus_bw = 74000,
+};
+
 static const struct msm_mdss_data sc7180_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
@@ -738,6 +748,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &qcm2290_data },
 	{ .compatible = "qcom,sa8775p-mdss", .data = &sa8775p_data },
+	{ .compatible = "qcom,sar2130p-mdss", .data = &sar2130p_data },
 	{ .compatible = "qcom,sdm670-mdss", .data = &sdm670_data },
 	{ .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
 	{ .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },

-- 
2.39.5


