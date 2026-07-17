Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0CBEC44520
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 14:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3uivIe4Q1p6JPBZcaMSYc8eXAUuOqshf8Fsi7jMSrjw=; b=zKFjLD0McXjxBJPjeJsEh53pPu
	+EEwoIxHLj3zgrWrSkXijUTUHt6IMLxg/qbvjJC6v8p8CdLeCFkkEeBtpsYSDuEG0yezFNz6Azrnf
	6JwauYwKT5qVcoyvbN6+7jSmWK5bzfxiFdJ7F7a7TLE5CqOcV93iatyOjL2PeszM0rCU1fFpKwK+T
	a+M04IogBVwX7hkx5KdvSc4JNYAvQwph455+1aoCBFsNzweqPVs+9Q9XdN5QP5DUfZUotg92g3Fgl
	Fnu8/EtLbOd1JKd14lPF4DBiZFw3+3TjK5ghSDlHG/A2HF+sKGHVy5R4i7+wcj9zlIqWT9UuyToEn
	YPu7Vglg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkjpk-00000002W4f-1T3I;
	Fri, 17 Jul 2026 14:46:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkjpg-00000002W0S-0EP2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 14:46:33 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE7sH91838948
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 14:46:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3uivIe4Q1p6
	JPBZcaMSYc8eXAUuOqshf8Fsi7jMSrjw=; b=WpCJWEpLxEptXN7UO3vw3bvMR2s
	WRsfv2IGmIYdeQATdBtLosTFLH99BDeuAAaQSZB2qxOkaXZ4rJ61owpQw8jmaRFr
	VHCZGP9Os2RcJFEbBSA7yF9WCHyXImihGmDuaJK+UQHxXBZOC5EVmn1jBvPbXm6Q
	mU1BvkjTk+jfb2HJpBszjq6Ul5iH0lPcux9KE3bDLLlOFK2MnjWz05hyKOiSPamR
	z8bjLw2ZYGS0sfJkwPoJnuobuF+vTsm/o+qr3Ou/pY+7d7JeTlI+oTxbiME5DrmH
	GvL0B5LiaAcmcWZMVjC4dg5UI2ZyuWgKqwe4LI5b2P+xEcIwY4WZwC7YSkQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fffag9rg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 14:46:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e63df032bso315023385a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 07:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784299590; x=1784904390; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3uivIe4Q1p6JPBZcaMSYc8eXAUuOqshf8Fsi7jMSrjw=;
        b=dMePNiFDEz35kWGzoiPpxwhzg5g3oPbvW3GWjPa/JL1L9X2+3Zd+9oUWQhXSiz1Esz
         9O+jI3LS0rBxwqJ6dLA21dUXn3sljxAoAtE4YxZ1ckklzYVFUjM85QQtqZ0YLmSzFOfS
         ufsIBgLP06WI9oHOw+WcQ/wbAxEFvMey2u6Vl6HAEJvLZzMVvrVYbGDFPGAzKp8bYGUb
         I0015ei9mgCeYYJIZkKKvbguV0ek4c24IFGQxDXIM6+ER8vQLIGoI8Kkm6nzdrk1AS+F
         MLSF5RCGRgUfSXeuV6cZW6DcZ7o6d6ckCVaphN3mH+y9C6Wd/38ZO7jJ74hrDbHr4c8+
         5INA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784299590; x=1784904390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3uivIe4Q1p6JPBZcaMSYc8eXAUuOqshf8Fsi7jMSrjw=;
        b=S9Ba9MeXnytx0YAIDPntKyBjhauDFwfibmrpb7i8f7d2dAHDNOisx8YjGLIqbVZS4W
         CZzcE4ZDbkLwRlMP41V8071fXUDQnXLqe6vIi8vLwFIkzPGc+3H6AlnDSH2BWbJ5ZOGh
         OqPSuE2A0zfXXm6pj91U43LYWPbwJ7waE2eovkWDnY/0VKxt8SMfs+rwAZpOhXeunuMe
         4NX7N/EKhl3clExZTxPz312SfzyOY/5gKym7FEyLhefFvtaSxtKsTYSoWr9sYvBd/uR2
         bTAU0xeWLaJ4KE66MCHunCiFtuFPek0llKZS3CHu+rxPXqJVtHx7z7wPnRdKPkgirUY+
         /fSw==
X-Forwarded-Encrypted: i=1; AHgh+Rr6Eff6X+X4Hol6em63kP5WXGeigjPMoDz+QFacpCsB6lm3VPkRAgOLds3aCOSMDFfDBWt0L4CD8CXSkxhUmFIU@lists.infradead.org
X-Gm-Message-State: AOJu0YyehPxkKV4dQs+Y8r1LH/svvAAKtFkh9m7owHRwEuCLFVDzDM7P
	uT0U81Oi3QRCX9Rv0l9sAP7XNDMwXI+7iqeYk0qSAGb6YD6CoCXX9JEyu7kfu0VRLj46ted6uXM
	b+cSFkM32LXC08DfDFzZkenRKjZPOGWXylICpQuxZRPgUoasko5Mm7rUsN6hSP+xOtfaNM5JCEr
	eCTg==
X-Gm-Gg: AfdE7cm3huN724CEYX0nY4LPUU6GFJcijsa4PvaqL30dDvKglbmV+x1b3248dGXHb4v
	SVsPFAL/6iDB3UFn/0WsxIXX+UX+o2zE7b1FVhtEfx0GbVwp7Q+pBJZWDSwHKv8r/heo6nMv7Pu
	HNS0UGnrxYXf2gfKflX5G1rdXfxEVT/Uq3OW08k8p4mLbrUlMbow6UGenyZSSjyGWCrr6IWnc8B
	R1gVSO5W14xb+Pvx7t5aGi+aCTYjeepM4VGp2tsDalKEx1BYns0kUFOZe7oWdwPoPUAqe4+j9AT
	BpBUy+mmyqI/BtZBg2a35a7CFlX9WEPStSB7gIE5Dc6+NrW8vXGMWizfQQM56dOgNbWQzm9/La1
	TGmbz5VfcMONSqGBmrnoxfhqkJqk=
X-Received: by 2002:a05:622a:410e:b0:51c:fdd:f040 with SMTP id d75a77b69052e-5212b63cbeamr29077421cf.21.1784299590318;
        Fri, 17 Jul 2026 07:46:30 -0700 (PDT)
X-Received: by 2002:a05:622a:410e:b0:51c:fdd:f040 with SMTP id d75a77b69052e-5212b63cbeamr29076931cf.21.1784299589793;
        Fri, 17 Jul 2026 07:46:29 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52149a3ce4fsm13414801cf.0.2026.07.17.07.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:46:29 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Alex Williamson <alex@shazbot.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 3/6] iommu/qcom: Check pm_runtime_resume_and_get() return in probe
Date: Fri, 17 Jul 2026 20:16:05 +0530
Message-ID: <20260717144608.3216274-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260717144608.3216274-1-mukesh.ojha@oss.qualcomm.com>
References: <20260717144608.3216274-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE1MCBTYWx0ZWRfXwKPjLxWs2OaR
 12S1XKUzwOIJqeglMVSgDYxjmOa2xlGBoshc2Z4FhU7T7CSTIwuZbuPuZlLnabGYoKc+af0Pkjf
 6F0flxd6Nr6CjgwAr+AA8k1YP5oYfEMNlypXns97B0xxwchL2PdXS3sgWLhymvPa+TtPtV/Tmep
 H8T8xuYVmvcViAe5SfcRhVQSEly9F8wSntu9onI7WazXF0svfe60hT+zswKKGrHGj/8e6aqwQ2i
 40iFZAcsEjv9SavaXX7ZvjlJ4/MSV0MPYLdEf2d5HuQQ3xaM3hOpXO3vFBlGg8DOXS8X2geSUM1
 UuDDtAYvVAi3vE/pXJhy4/Qj7Aupz24s6QAGPCsZEftboWAuNCNfHQXT0700wbkXiaCu8NSyNld
 K+KR/CUMH9WIU+1JaMTYxc793rtQVMDqnbxyQwkF88Su16Aun4meM2kNqkyv8aLUAsyM2t3o5lL
 SxNSkCW1j8imFfeGirQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE1MCBTYWx0ZWRfX9w06nuaai0KF
 ORR4m5CnaTRdcVvYU0sSyvn5ZxqtTG4732SOHhMiQGPBBjZFJJztDnPUGEFsV89jJ7Ftkl5rSG4
 gBM+RfQz2X8xSFS5po7Q3j6ljJGYjyA=
X-Authority-Analysis: v=2.4 cv=KZfidwYD c=1 sm=1 tr=0 ts=6a5a4047 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=uh9JkKNIBQsmCcNjqRkA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: gY2lExr_zY_hJz4VB_fhsKKjeTpPPena
X-Proofpoint-ORIG-GUID: gY2lExr_zY_hJz4VB_fhsKKjeTpPPena
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_074632_112590_8AB74F9A 
X-CRM114-Status: GOOD (  15.45  )
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

The SMMU_INTR_SEL_NS register write in qcom_iommu_device_probe() uses
pm_runtime_get_sync() without checking the return value. If runtime
resume fails the subsequent writel_relaxed() would access hardware with
clocks potentially disabled.

Switch to pm_runtime_resume_and_get() which handles the usage-count
cleanup on failure, check the return value, and unwind the already
registered iommu device on error.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 71251aecc292..1d04f0a19124 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -861,13 +861,17 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
 	}
 
 	if (qcom_iommu->local_base) {
-		pm_runtime_get_sync(dev);
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret)
+			goto err_iommu_unregister;
 		writel_relaxed(0xffffffff, qcom_iommu->local_base + SMMU_INTR_SEL_NS);
 		pm_runtime_put_sync(dev);
 	}
 
 	return 0;
 
+err_iommu_unregister:
+	iommu_device_unregister(&qcom_iommu->iommu);
 err_sysfs_remove:
 	iommu_device_sysfs_remove(&qcom_iommu->iommu);
 	return ret;
-- 
2.53.0


