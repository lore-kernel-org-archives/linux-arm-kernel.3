Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70554C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 08:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jBom37zGwjUcEJUexe/y24yFDLJmL/J5QBTdnrbnixM=; b=U2RK7hpQlpY4OYUfPqFkPtshIl
	WE2hJdukHBwtGPx2O5P4qqz1JQJXB2DLUfHM5oXmjke1Giihwolc7Kcxtm+HFwVWJfjluZ7/OGIIR
	jLgDFHNtM/7ORj7B7Y0jk7lFoetrGPMsyc/6832sM6fIosbagV87bOXy9ZBaLM4Sy+Tk9pd42WZ6J
	L40ialrcLU+hWyVvGkGxkdxWdqcjBiamjB+sAdsiyxFW0odhrnMLQT3felPHS65rGtPNKfEclKCHu
	esWo+zXvxboKX6mJmFB49rsh8xU7k+u5QUNgvT+hZolBgYhm0xfBfa9cwv73K/t0PP+mHCCaJdZiy
	GISTGYIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5h8N-0000000FcuS-3Itp;
	Fri, 18 Apr 2025 08:31:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5gUN-0000000FWJh-3SCr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 07:50:20 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I1xHMg013336
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 07:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jBom37zGwjUcEJUexe/y24yFDLJmL/J5QBTdnrbnixM=; b=ExwlSEzLMJ02Ea3c
	KzM4wJeen7RNWJlaYuzipiNakxiuPvtJKB0sZUFuzH6Dz/4zoZSi/VOhLFstCxBh
	86+5VET8KIurHInZDfqnA2XspLFkdtHVuh5YCRYXWcFGgCTPssAoFRSuqoEVRRT2
	zAWGF592zB/jie+i7plLruWYOvC1Ps0WflUVTHN9ftdlshDfkV7j4QoKpIpteFGD
	12/0qd/ZUfaeRQZJriMRT7qKxuo+NlNrdZJmfUF3okthqzUC4dXDuGGcS19SGy2r
	ivPpxhuN0XiobZsuSrK3BKI/YzvmHLp9PGZ2k/u69NgUSO4X9YkCu0UgGVG3DfB4
	NdJWMw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4628rvepg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 07:50:19 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e91b1ddb51so29454416d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 00:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744962618; x=1745567418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jBom37zGwjUcEJUexe/y24yFDLJmL/J5QBTdnrbnixM=;
        b=k7pEFKlYQm6n8HBpMvJiOtW8TIOBFohr2Y4U37R9p+5ZD2fWV118xwIWZgfoHsWpEI
         LheHUEeX8z5c4TnoUrv22wRL9NhtNC8WOE234AzpXWHmTMo75dl0KWuQF7Dgiedm5fvf
         AEeERUcSZLRm7FEzJGAtWXVNFd3it9T7/IOKtHInisJ+9a4JHPgmeh7pEB/76REyjGAa
         lj9QhcgRppT/KGUJgcyod1/UuWfzW0mNhL4U9XzEaGGXbGje1A6dg08QYvsbstSO3QBD
         br41wUM1r7jvVNp6HQCaBB3wYAYgjyDc079rQc+2ILxPpShDqAwlMxTC9c8Io3NbSJdv
         Gt1w==
X-Forwarded-Encrypted: i=1; AJvYcCVHm4F0xGqTYPp20DBRA9MjxPF1FI6VB9PirSqrHv68VmZ7Lt/xYixNeoAZ5f2kj/HOY9BA9eZAXjob1y/R7QFr@lists.infradead.org
X-Gm-Message-State: AOJu0YwDokHNtDeBq8152wLrGCq6tBAqOG+BlT21AdHqOYaQRjFOFFVs
	lwBv67GPculDyqDMuC4tCrwN4qCHikewMhdHvNS4Wr2kGdjKIFkxl+yCJs/p+BvBMvFZyrxgGQ+
	23mSn4XmQA0/73YkI+uFgU75mPyGd88tknPG8yHRo5BHK+p6eCVz/8mP+jGaJstwPkMIAKwU35Q
	==
X-Gm-Gg: ASbGncsKUIWLr9OeTnu+vDNTG3WI6k92PiutQf9tsOsBjf+ZdY23KkKHaa8veTbGbS2
	3edTNKVg7VIrfmQLI9jHY1VQH16E0Peny9xsxdB8fPgrz0I8lo94z39xxtwY6cnKGRqmdHiKxip
	DxLRF8cgbZQmbzV01uVb3BXTjd0HGrjf8Ez47QPQB4eyuo94pjTCrHFl7IxIZ5nhIOcYnYpBOwt
	TqVnaXFsc2opH4tFC/CRBLAfOwuhBVyxA1rKMpWzcWv0Xn9d85NZJ+zSdgk230WnFN3Cu34U2Xc
	0uU0xzKU5GLhUWgNJ6v/syBvbJbRZ1uzPuMdXOk9l7/gWUqAcz5DrhBYhwKX8vrH7qc8VQfdkMp
	OhXJYvw0xL9Js2yYS/lxEKmU8
X-Received: by 2002:a05:6214:d0c:b0:6e8:fee2:aae7 with SMTP id 6a1803df08f44-6f2c46846dfmr28955806d6.39.1744962618018;
        Fri, 18 Apr 2025 00:50:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEp41yz7pGz3rEyrIWBHkmGxcC/v51+s0suhZapt8oZMdW/ahoCp10mwhc7lFNRji3DDBckxg==
X-Received: by 2002:a05:6214:d0c:b0:6e8:fee2:aae7 with SMTP id 6a1803df08f44-6f2c46846dfmr28955596d6.39.1744962617702;
        Fri, 18 Apr 2025 00:50:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-31090863bd0sm1649061fa.113.2025.04.18.00.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 00:50:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 18 Apr 2025 10:50:04 +0300
Subject: [PATCH v5 09/10] iommu/arm-smmu-qcom: Add SAR2130P MDSS compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-sar2130p-display-v5-9-442c905cb3a4@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1005;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NsF5aI5nusL+eHX5Edd+WVqyrIto2M0m5QQZuN1UEGY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoAgQqkZgl/bdTTEtxJp0GnWwdE3JkQfrfSLAQo
 xuILrb9K7yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAIEKgAKCRCLPIo+Aiko
 1ctKCACX1msikRt57+al3V2ScY3uZ8f0c89G55FBgYosm8h42OrGpKJK6eMCDaD8bjypFkY/pA8
 pSCJKCbzPr0wK/vmGOpz5lT6oFBO6WRXjl8ed8ktiu/TOjgmCSrSh5VqWthOd6ctL53I+oaukuL
 dJEojXXHPYuYYn05pYHi8+0hLO03FKzot3dv9jmWWK3Itd6zvgEyfm/5e2GDchZuHDFHphwlrdP
 5SMQf9ygiz64TwGNz2xu5tWX8KZ9cL7QxHhtX40n/NAF1ZlMKs5MevkP1/XvLB4bELzY5L2Mzvt
 itQx7oLuu1YULW3cPAt/zJhQwEve3LrnLUOjUGz4JLXp15/C
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: cw_fIBO1l9KVqQuaoTaXkaHlNEbRZ5un
X-Authority-Analysis: v=2.4 cv=RbSQC0tv c=1 sm=1 tr=0 ts=6802043b cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=GY4BWdjpb_dk1TMi0HgA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: cw_fIBO1l9KVqQuaoTaXkaHlNEbRZ5un
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_005019_866553_32115FFB 
X-CRM114-Status: GOOD (  13.52  )
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

Add the SAR2130P compatible to clients compatible list, the device
require identity domain.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 59d02687280e8d37b5e944619fcfe4ebd1bd6926..ecc4a1bc9477b766f317a58ef8b5dbcfe448afa9 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -356,6 +356,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,mdp4" },
 	{ .compatible = "qcom,mdss" },
 	{ .compatible = "qcom,qcm2290-mdss" },
+	{ .compatible = "qcom,sar2130p-mdss" },
 	{ .compatible = "qcom,sc7180-mdss" },
 	{ .compatible = "qcom,sc7180-mss-pil" },
 	{ .compatible = "qcom,sc7280-mdss" },

-- 
2.39.5


