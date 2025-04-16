Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEADC369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 23:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=boXGEJ9vm7laFVs45kpF+i7DaEsEXFuWOHSJOklGi48=; b=yOp7HVdqvreKOTCMDAiJQNMaBc
	32KihyaRBfM6ZmELSFnzsuK0pnS8tKmMCk79+zAMgLaIcM1wc66on/227Pk0TWxDEEilNvvMP8/wt
	ZkxeZWOlwP89hWESSIMqk0WlHD+WR+LMB4V6fXnltyLAvCDHRak2CDo6IGQw/d6MdswTCgte9zOyD
	o67qLVGniVV1kuVUhKdY9SiOFo85Nh0YJUsQxNDSgdzmHoAhxTc3oA3A1gW3EwvBf1Udbqs9kSyPM
	/qbfiklP5kM68YaPWv5h2HPUznXWKhKGsGqo6hSrwtFYE2/+wtwknyQsJfBBcK701zPvDkHigRqcD
	PchXS09A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5C91-0000000B9rj-1r1U;
	Wed, 16 Apr 2025 23:26:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Bzp-0000000B8DT-0ynQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 23:16:47 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GMnoGB020542
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 23:16:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	boXGEJ9vm7laFVs45kpF+i7DaEsEXFuWOHSJOklGi48=; b=CUFuv9n6cu9dJ6RA
	JIEgzi9FgUs3jeH+iS/ZP3QIRRa2bL6rZT1mBLBMivucrzsHDBMYkouke1qaaCwX
	C5LwYCgJc23IMmSCzERCLiCpKKBmhUeOaJ8fHaSKemslHpUVVK4FNr/xPuiLORfF
	fC2EvPotuPLM5xUSbuu5GIthziqknKMWjQXSnzwFgYmieJcj8i8lr6uL8OWvCC3I
	7iwnJso5A3m9rDJfZx6GA7XKM8ArZHfKh6B2UIuzIgibMOLxV+5L/0dLLjExe8GB
	SeMeJKopCs6XqTIsNJYUUBcCL1GGfsntO4jeYwIYQilYAQ/UWno5bgfKqUu0CQ9w
	LOJ8zg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wn1ds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 23:16:43 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e91ee078aaso3620636d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 16:16:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744845403; x=1745450203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=boXGEJ9vm7laFVs45kpF+i7DaEsEXFuWOHSJOklGi48=;
        b=eOY/NaJ/Wr+rXtDGvvvienDG1fH1FTN62A+WtHZmeZJj8n2kbzXKH+Nrc4x8SR6Ebe
         PbsaRVJL9z2fpSfoSj1KdH4rPylryfHayFp093V3CG5xXb+Z5rxkxIVImAMBMBZmTdev
         zWxbvfZk1whgWn2GrQX9M4gqjQz4cDhTxdOGveH6J8FGFLgKYALZ2aofYa2w6oZgFC65
         sZFNeDTDjBlhXjfFhmLoElu/QnCZKHP3ggqRM5PyjLsm4J0fH4aGVrly4hHK5GVY2dJU
         sbLGMzQwVx72r38mBnMVouEr7QN9Xs3PgOwH6E5AdPGfQwHXFkzqZRfi6rYO4zhb9mGP
         /XTA==
X-Forwarded-Encrypted: i=1; AJvYcCVH+1cTckkQihNZtMvCAYH0kHEPms8QlWF0JVm8+8/9g8o40L/OJPV2REp8WgCMH6DuAcpR9H3fLMHbR3pqCEQn@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9qQx8nMMSTfjA8ZQSapDUZNGqHeCmAfwBQFVARQ3wo5FLq90g
	+v5/tHljEsFUxnO6eE7JvwnaYQWDcEQpmsYbnjj9boUzvtj4JQqsNAEYEC2lsZsIUhM4gM5xSUq
	pQDckr5vav9xzCWSZcNRZAe4GfrDhupeM9lMcymRUFBrNbz2sygzxJ9SOnYxWhOZUIyh24yx0Pg
	==
X-Gm-Gg: ASbGncvDKPUnEzznmfH5AJ6AbmJ7TdfFulKhNkKBRpFdRIy0dD++TAW2MwAwKQwtnk1
	TtpgiMBqKv/JcJKqLBd6vbYGMUAeb8nnEx+Op1zU4x/Bl1p9Z4oJhj5Lv25RtOIBguJHx+NkhAh
	ibtai6PXZLZXgWvJ20r9M7O+P5kkk1WVGnh2B4qdhDe4uMhyrDExEdFn0tTfAO3Jg8czJYGKc1i
	WCyIRaeta3LOqhSuUxps3yV7Zo0x6OgDpr95dFo9G8gcyZ8Fqua3hHkGOM3uSqZAKrw74QGtcU/
	XIaHID1bUSN3eTJR3op61X+jYcSZSdkGJ6TvY5RPv8NNkrnNqDgemEcoIHqsMWbwMAFZ+IzN8RD
	pMcfX5royWY9a9mYByctNDg+y
X-Received: by 2002:a05:6214:1bc7:b0:6e8:ad15:e0b9 with SMTP id 6a1803df08f44-6f2b2f93f11mr62673656d6.20.1744845403277;
        Wed, 16 Apr 2025 16:16:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrCA/KParNAT/BTiVkOPGzVpXZDtDs1mXEDaoU5nQ2DaTF35AM6o6LLomN2aXrq0eD1fuNmA==
X-Received: by 2002:a05:6214:1bc7:b0:6e8:ad15:e0b9 with SMTP id 6a1803df08f44-6f2b2f93f11mr62673186d6.20.1744845402926;
        Wed, 16 Apr 2025 16:16:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f4649d79esm26062181fa.15.2025.04.16.16.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 16:16:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 02:16:34 +0300
Subject: [PATCH v4 04/10] dt-bindings: display/msm: qcom,sc7280-dpu:
 describe SAR2130P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-sar2130p-display-v4-4-b91dd8a21b1a@oss.qualcomm.com>
References: <20250417-sar2130p-display-v4-0-b91dd8a21b1a@oss.qualcomm.com>
In-Reply-To: <20250417-sar2130p-display-v4-0-b91dd8a21b1a@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=934;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=IJ0quqH+dI7r+sJavUIADWzzAqD1L2X/CIVzw9kCDtE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoADpREQ+V7HPJ8Torzzts6HtQRTIhAKzsZTV1i
 6mzzSWqJhSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAA6UQAKCRCLPIo+Aiko
 1TGhB/90c4LcuO7eAM0tlDSCT0Wt9jESwJSN8QH2OFqAKMujsiEdY37WSv8L/DM+BixUIfPBTj2
 31qmCQGMszanECSZ4FTb1zxAEhZOiY4qAoRR+GnrhdBEhRoPY7FkfX4KLOgnZLSG6kpF1YOrjuy
 NbcW7bv4lHopOvGtTXtjf8/DOv8m7UyKkst5z5s74ugy9sAu5yGgPIOeOlYJV1gGwJkaqFSxSQ7
 qYbd5PaLxQ7zdj+Weyf3x6JPiLsqOZlb4AW1WwqrYVxvv6Djqhk43/YxnlWVg1S7ROHu7fhXI1H
 zQy3Zdtn+yHPOtf8wBpnd5uGKVdFL2WD/SnOJz7C7Ttz973T
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=68003a5c cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=P0d4iQPpJQof_2lRNe4A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: C2agATi7yKeKoEtuh9ocEO7VxaGHlT9B
X-Proofpoint-GUID: C2agATi7yKeKoEtuh9ocEO7VxaGHlT9B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=963 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160186
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_161645_394028_8DC72DFB 
X-CRM114-Status: GOOD (  10.76  )
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

From: Dmitry Baryshkov <lumag@kernel.org>

Describe DPU controller present on Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
index 6902795b4e2c249c2b543c1c5350f739a30553f2..df9ec15ad6c3ca1f77bebaab19ffa3adb985733d 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
@@ -17,6 +17,7 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 properties:
   compatible:
     enum:
+      - qcom,sar2130p-dpu
       - qcom,sc7280-dpu
       - qcom,sc8280xp-dpu
       - qcom,sm8350-dpu

-- 
2.39.5


