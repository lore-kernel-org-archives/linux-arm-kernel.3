Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9FED1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 05:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uG7XxevFFopqW9UiOO2+6ZHSivqxQgyRx4KFhHzzqao=; b=XH8OVfz0LfIuLfdsziOn//7cg3
	u0rCNa+1GnniyoYWyY9X5MdYh9uF6RbwD5cxY690P20HIWVNJdibDt4VDYWElcYuI5mo+Sl0DqHd/
	yiWDL1u5eCKdoIl2mkCdG77ytMwaqpuaNZXxmkcVNEBOlHqhwtQbqvFUvOt8zEDCTYkH2+R1A8L1f
	K3MwVoXY3mG9yqGFQoGM+wzL30Mm0qYegN3QvT+clJPGb8P4w+CNUufUCRIkk7M/XglrmXXvBvo66
	+E67239ma5khUIsLTrqXc4RZH5FhA1HyWN+ZYyCbdpyl5+6LgVtPz0OueOpUjKLDrgiGyfQjYVSpi
	FxF3bY8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSqCI-0000000Dq5k-0FFE;
	Tue, 09 Dec 2025 05:23:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSqCF-0000000Dq5P-0lp3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 05:23:36 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8NX1jx1737107
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Dec 2025 05:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uG7XxevFFopqW9UiOO2+6ZHSivqxQgyRx4K
	FhHzzqao=; b=PBv4z3C9yVF8IR3u+hm60r+T8nbVH/cPuOYfacCauoRDefc9Dsr
	p9BgtAxTHMkQqxrPeR4ZgeSUD/QGdXllS+N15dZYV5xBgkwCq4lvNXnqawoqeUAp
	a1/zq8lmha9EfBHxt/0+on446WBB0J9aKPNRYPdlDLTSFjZQbcPhfwW2DLNi/Tnd
	sOEVG2gC/BswLZinYCZyk509DpmHFbgFJmPlu4UCuwZSbl4xclI4qqYK5lKva/b5
	AFu2oWRWNwV5SaDurG4J/9wFpajMGX2o9VsRYcpAHIaRGFMXhLzd31y0sM73uQOa
	/rTSvwe27o9DUzgCJbgcUsOmIHPBw5/IAuQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awvke31hy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 05:23:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-340bc4ef67fso5772108a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Dec 2025 21:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765257813; x=1765862613; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uG7XxevFFopqW9UiOO2+6ZHSivqxQgyRx4KFhHzzqao=;
        b=giYSy2QD0TqeDR8dhcPD9RbuOiP0PJjo3s8Dm1jjWSeXoo7bav728fzdxnCLR1ihCI
         NETMcY27IA5KMlQHe+Ql1dbnC01YzNKzEKnj5Tw9ASMJ9U1BCEMMaS/GWC4Sm6dgYt/2
         pdepmy4ZIU+SBYgVwwzoYmdphggeD97CLZWj9Tn78hmX5Sy3RuZxFbdTdtNmOZrNi479
         msuTBuFLiaHXr/uWe23CyRRVqG+4qWe8zmamucEZERRs1RRIjZmZNEuKBGpO/H3bF2kc
         K2bkxcNXQPEr0eC3hht6K605WqzA0/yqsWRtlxIUS7qQBsXaSH5ga0FmL9Igz+nwrlWO
         f8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765257813; x=1765862613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uG7XxevFFopqW9UiOO2+6ZHSivqxQgyRx4KFhHzzqao=;
        b=w+7Fs4e8DLWJsoP26g2JtKrmRui7CIXnFuHloWmQYQXFcsdpPSwpalXTkf8hE6v5rz
         8FOZL/xt+ExEGfRC2hWmapNWoz6NIaHVcIco6IDTdoErwaEUrX6TBA41NygGJHe6Y3pE
         ffwO+3b4UvwCAWsx5s8H0B4nqcw5/mPzKQtwRo6+kiiE5PlY73LTToUlljg1ZogCgxYy
         som54b1iH8QTXtX6lzNzvKc1LpVxpmFBha1IF4WOZ/mNvagUfYtBAj3cQRewu+Eq/Kj3
         7DkpKOXOfdzLhNhI6QlYo1tckE3vxuG53Vmyih08UoaDRMtsCSGsLu2vvBt2lbNZx+lN
         6jPw==
X-Forwarded-Encrypted: i=1; AJvYcCV7HEfn2uCQd/WWw+Sr0BgRlYmgOTG77VbIWNDQcMdAvoskMiRRLTZQVwWxmHT3Soubq1QxnR+qtMV3mjhfPcoR@lists.infradead.org
X-Gm-Message-State: AOJu0YyVX156Egh/2eef7cyznRzHgdSesM0adAuqbRl6ZlzgE1ZUSiNP
	PYSyLn2NwNL2OA43kyFp3Id8r5GszqiWxeddXIvkYImobuv8c2nlVpRpE+jR+aC3pRlS+HpqO+8
	vWKnr/db3uajo6EhXl778pbg/ELTkqibNCshNphCP23c5I0NVhLxmXdR/tqoHs45gnBUweOA3TP
	TDWA==
X-Gm-Gg: ASbGncsDqxLiY0S4wKxodEeYqoxM433Xy8K3NbfZ/dWHaylBfrsJ3EyOKUO0SHTd0pL
	wVR6ifdOHDoNHOu47D1wz+D4oP/U4iQJG2miwZPhgfp3ciBkGvhgtSWmHcy9MBmKX121v5v2zWa
	Ma1y+tBcMA95J7I3HRFsIamM9gxYw7gjGCEBINUTyAZfFphnXjbteSMuinZE4+AwcMq0WtP9X92
	LsKVdD3kZSqWYg37QOl6lIXL79YXlC50qHn5ezl9n8tSL2Q5aZDftEMR8HLbEDwj7ZusPwfmL6x
	zLF92LEgPulnLQFU+btRH6ZLOF0UC2pUMAQHsMARb/X1A2n922Z8xXhI6nHhB8nSV3LGAQYq41L
	sezxMv/+YjGlSwjx+BheKHa5OYvAF67AbZSUr0cX2
X-Received: by 2002:a05:6a21:338f:b0:33e:84f7:94f9 with SMTP id adf61e73a8af0-36617e36987mr8467040637.9.1765257812938;
        Mon, 08 Dec 2025 21:23:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG12qBZJHj72pTnfDyARxsCCIVd1WYnNqLKhxyYwxqdUyBBqLzkbHg8OuzNL/sOcMsTqbi/eQ==
X-Received: by 2002:a05:6a21:338f:b0:33e:84f7:94f9 with SMTP id adf61e73a8af0-36617e36987mr8467023637.9.1765257812372;
        Mon, 08 Dec 2025 21:23:32 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf681738a29sm13689924a12.3.2025.12.08.21.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 21:23:32 -0800 (PST)
From: bibek.patro@oss.qualcomm.com
To: konrad.dybcio@oss.qualcomm.com, robin.clark@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, will@kernel.org,
        robin.murphy@arm.com, joro@8bytes.org
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: [PATCH v5] iommu/arm-smmu-qcom: add actlr settings for mdss on Qualcomm platforms
Date: Tue,  9 Dec 2025 10:53:23 +0530
Message-Id: <20251209052323.1133495-1-bibek.patro@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: BDpWWmFjNv2oMGiiCPg3F8DH5j9Va4AE
X-Proofpoint-ORIG-GUID: BDpWWmFjNv2oMGiiCPg3F8DH5j9Va4AE
X-Authority-Analysis: v=2.4 cv=UvBu9uwB c=1 sm=1 tr=0 ts=6937b256 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Nhz1Ti08P7End7UVPfYA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDAzOSBTYWx0ZWRfXxjISrijjUQgC
 7ZmYOAtiJt/5Y0XH+wKvLoJppeuPXFBgDxezmn4gjRV5vOFqfh3oTaKrWM36vn0Z29gYSbbD3l3
 7KA4vyoEbgS+K/Y3BxtItnu3cVeZ98C669YthoI4RCzCk6s9A+mEcw54pfH6Od84dpMVxeE4GiR
 PtcGhz6UtncVArHH37BJjwxFtVYrNX9qsBTHUnDfPcg2G2wEeq+mUVSMc+GdKV8SRRZh/OkwqC1
 u7iw9xecYoKMq+wiNkWrSjVXBTPtUPd3sfHVbAMyQACgl5QyPJaCtfj5RSRQ+IIV3zdG3nRoWyo
 Bj0eusbbnenDIj3ZhzHALDDKf4i6QWA+2/rrZ1aK/t2v0at4+4KqXXN8e31ehp3XZtm90LNIDcQ
 +Np8TPgVSV0c8ZtnsDbT5e0+OJizsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-08_07,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_212335_341945_D311BC68 
X-CRM114-Status: GOOD (  14.69  )
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

From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>

Add ACTLR settings for missing MDSS devices on Qualcomm platforms.

These are QoS settings and are specific to per SoC thus different
settings, eg: some have shallow prefetch while others have no
prefetch.

Aswell, this prefetch feature is not implemented for all the
platforms, capturing to those are implemented to the best of my
knowledge.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
Changes from V4:
 1) Change subject prefix to "iommu/arm-smmu-qcom:"
 based on the changes. -- Bjorn
https://lore.kernel.org/all/20251202125447.2102658-1-charan.kalla@oss.qualcomm.com/

Changes from V3:
 1) Add actlr setting for missing sc8180x & sm6115.
 2) Improved commit message.
https://lore.kernel.org/all/20251124171030.323989-1-charan.kalla@oss.qualcomm.com/

Changes from V2:
 1) Add actlr settings for all the mdss devices on Qualcomm platforms.
 2) Improved the commit message that explain why different ACTLR
    settings
https://lore.kernel.org/lkml/20251118171822.3539062-1-charan.kalla@oss.qualcomm.com/#t

Changes from V1:
  1) Added actlr setting only for MDSS and dropped for fastrpc. --
konrad
  2) ACTLR table is updated per alphanumeric order -- konrad 
  https://lore.kernel.org/all/20251105075307.1658329-1-charan.kalla@oss.qualcomm.com/

 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 57c097e87613..c6645df97bbc 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -41,12 +41,38 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
 			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
 	{ .compatible = "qcom,fastrpc",
 			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
+	{ .compatible = "qcom,qcm2290-mdss",
+			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
 	{ .compatible = "qcom,sc7280-mdss",
 			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
 	{ .compatible = "qcom,sc7280-venus",
 			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,sc8180x-mdss",
+			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,sc8280xp-mdss",
+			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,sm6115-mdss",
+			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,sm6125-mdss",
+			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,sm6350-mdss",
+			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,sm8150-mdss",
+			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,sm8250-mdss",
+			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,sm8350-mdss",
+			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,sm8450-mdss",
+			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
 	{ .compatible = "qcom,sm8550-mdss",
 			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
+	{ .compatible = "qcom,sm8650-mdss",
+			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
+	{ .compatible = "qcom,sm8750-mdss",
+			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
+	{ .compatible = "qcom,x1e80100-mdss",
+			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
 	{ }
 };
 
-- 
2.34.1


