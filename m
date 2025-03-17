Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB4EC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 19:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=90Qa8a9JOpfX6xK3iRiQYBwU2Lz8sFA7p1khs43FFPw=; b=nRmpRRJQA9mWEPga/gGvCb8M/S
	3CGPEesd4EXyKkHrjmM2YK7nNLAP10hQxxlrcqvs/hEBIHYW6KdnzApfruVxVasG5jM0eqgm0sI1T
	t/20ZTgVryRxOy+7A9pXgTuI1RZmDilp5UvFpycrVK3hkz7rltVUw3a/GBw6AuZrsNERyUDBj590i
	yE0NLTwgV9fcLzuKcu5QgZc1cEpq4aosWQtgd3cgxey4CxAddPPy716oZnA2MNbs/3jkTuXKjixVR
	tZvN3NAT3y2m3Il1YQ4TZKGUX7HU8nV/gsbQG0P0Ped5XHvNTixOklirtDqGK8X01I+VX8izyWpjY
	R5XVndYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuFkl-00000003mKL-21Pr;
	Mon, 17 Mar 2025 19:03:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuEWL-00000003aRV-2YBg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 17:45:02 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HANLF8007922
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 17:45:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	90Qa8a9JOpfX6xK3iRiQYBwU2Lz8sFA7p1khs43FFPw=; b=GdpGZ9i2p36Lz9hy
	wZm0Nfi9jWiJ49+g81VMJRiBNFkq6IhLHnxR6XNNtkEbLLvgLazZPRv3Lg+xCJJo
	l7qTfV6Bdtjk+tEdMHskd9S/w9FElq4F1ZhLBkb4w1xtztvtmrtkXDlwd55YhpAi
	fLIB2n/rk7fKlq3AWeex/XJ+6vOv/7aOjeqz/yuF9ZCyMqCoBSlMCpZ+P6nGCq4/
	fwyRwEsQwmO688SidC4ReV9UAr3HHJ+3Pn5f28Ks6DEzzmZ0II4krbzb/af+dhw9
	6JGUVUxRPkSdapqEmTUIhESErh9KpkMKIgyqtw7KohSue3fdxlJw24N0osbukAYx
	NrC/Dg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d2qm5ewe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 17:45:01 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e8f6443ed5so101372726d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 10:45:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742233499; x=1742838299;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=90Qa8a9JOpfX6xK3iRiQYBwU2Lz8sFA7p1khs43FFPw=;
        b=j+FUkxUex4pxh4xlITFDKfZRJzfAt6nPhlK/qdwU0iaOHLHyQZg0mYUZeGvOqwynnt
         PRP9+GuOEEt37UMPiLu76sm06mVyDM9qA53aZs6yRptKdNu5aZBRwgidsdHkayNoolNS
         PPo+ccjxT6GNkFuIYWQwu5E4YM+V9FoQCrKv1vRGvoGmd/A7dVHRL9YcUuEAu0tTKoF3
         qIB94KjD6JSbxjd/3AWKFvh8q4jF/2diYFZpdhSwVFu+YNO1BcExi+PLODuRBVjEQFu2
         mJKOgCMS1eX4LdFYOytRqYnz+zbpI1+MEmlenhvklsDrlGV2Ykli65AvE9bOtWqW+M/O
         RiYg==
X-Forwarded-Encrypted: i=1; AJvYcCVt6ENnO65fCrlajWtK5zwKrnRTJgO0Pvye6qhL0suS/nMQfiFgiwAgwXVb9h4rQT5jqH1QvOaQCPuUcT+ui22i@lists.infradead.org
X-Gm-Message-State: AOJu0YzJ+ik41x9YJr42uhTVNN/OG8rtan6r2w8yPSASxwF98mvosVd2
	TNMj2XODRrcxH9qv0XXxZWteFCw/T17X+gSvG6QYq2wVzIaC5jMHpfr380hg3U2GBaOl+SPg5Yq
	JLKQa0lYFR4Ijh+jWD5yjviT5cM0HBR/LB9w5yMLQB3QdauEWwOaua3qsxYFpM41gmhiO3seI22
	UcB8wPZw==
X-Gm-Gg: ASbGncueu/Hjg3NUAGtVptOrgdGmIEJg4lFkhiZAjuBMPchVdYqk5JTWc9Bf7pz6Emx
	oEDKlsKZRDKXyZqXgcQjy48cpkwGiPHBxz+UpLorqZ6g7/6+Fb+Gq4UBH3G38VFJzPOlnDdEwHh
	hPJuGyTu3DCAkhls7Sepm/Ai8htffkYXAVDZlvDGIdBpWxrLLBk/XX2RpfOZi69krYDQpJAe+mW
	OKmDyBl7Z+Q1KRZWiYVAr+6tubpoMq1Iaw4oTlJRncdXEJQtqwow+C8EkPrEqT/6NdocSDfAA/P
	ekI9r8lAfAILc/4TRcmNqR6VyeCnJs3ueMGg2bymEzSO19KtL4lscbCp4SuGzPCalWoofY4+jbL
	hWoQ8fllgwLlCd+SgtWYb17eDs8jc
X-Received: by 2002:a05:6214:5246:b0:6e4:4adb:8c29 with SMTP id 6a1803df08f44-6eb1bbdacabmr6171466d6.12.1742233499600;
        Mon, 17 Mar 2025 10:44:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6M10twaR+eAeYAWjZSYXf4U+Rm9PnRfiqhIA7VV26zFHprmtyLz/wX1+C7AE933btocwG+g==
X-Received: by 2002:a05:6214:5246:b0:6e4:4adb:8c29 with SMTP id 6a1803df08f44-6eb1bbdacabmr6170986d6.12.1742233499213;
        Mon, 17 Mar 2025 10:44:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0e9985sm16687121fa.29.2025.03.17.10.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:44:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 17 Mar 2025 19:44:40 +0200
Subject: [PATCH 5/9] ARM: dts: qcom-apq8064: add missing clocks to the
 timer node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-fix-nexus-4-v1-5-655c52e2ad97@oss.qualcomm.com>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
In-Reply-To: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>,
        Andy Gross <agross@codeaurora.org>,
        "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
        Andy Gross <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=945;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=A5b+7PiOzdnEsoIXhJtEDtIF4/+zzwMq2jbAcRXdx6A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn2F+G41SO77q/fkDgTaD4QiDdHsTw/YIt2DpoU
 /iIHBtHF6qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9hfhgAKCRCLPIo+Aiko
 1YNVB/kB3jCe15fh6tsndDZHpVGkGIwtmAmqyKZ1Zj1q1YUo/zvWqfSHp/IwY84QbpmI23fIrPd
 3C+fIlrNRvDSrGRJizu+8VvFyy6SHnNXG9GfiOj+wqOn58HPewIRqisOf875oiVAtnCTLpoiu2v
 t5Xu5Lmm97WDX9q3eUP5YP007ZBRUQpTP5DtAMYS8itWCu3pSZjrGJnsPRBIe1YVz5/zMVOqI1x
 l8awwBbJ2RdiXrLBQEuS9mMHVaC+31aQupj56tiWlHvzfNwFH3bvON3HjXh8HMCSAT74iOEemCo
 5EUvp36+up4TwSCr3Ss8Mb2y2/ERtSJhOwLLr2ZDz1wIQQTL
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: U_zlSjfdyJc5TS1pv1nlHh4DGpVS5EH3
X-Proofpoint-GUID: U_zlSjfdyJc5TS1pv1nlHh4DGpVS5EH3
X-Authority-Analysis: v=2.4 cv=DLWP4zNb c=1 sm=1 tr=0 ts=67d85f9d cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=ZANWpg7mVWKCtM2BIo8A:9 a=QEXdDO2ut3YA:10 a=mjqSHpV9Z7kWhFShES6D:22
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_07,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=834 phishscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_104501_659529_4008ADBA 
X-CRM114-Status: GOOD (  14.02  )
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

In order to fix DT schema warning and describe hardware properly, add
missing sleep clock to the timer node.

Fixes: f335b8af4fd5 ("ARM: dts: qcom: Add initial APQ8064 SoC and IFC6410 board device trees")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 5f1a6b4b764492486df1a2610979f56c0a37b64a..ba99e794dcd2236f65f2f3d8c49213cfdaee5f6e 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -326,6 +326,8 @@ timer@200a000 {
 				     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>;
 			reg = <0x0200a000 0x100>;
 			clock-frequency = <27000000>;
+			clocks = <&sleep_clk>;
+			clock-names = "sleep";
 			cpu-offset = <0x80000>;
 		};
 

-- 
2.39.5


