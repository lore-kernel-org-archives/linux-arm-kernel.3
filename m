Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF08CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 12:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MfokqFYIIscfSWuyK7hBpD3TjL2GPJaI85B2LM0b6Mg=; b=knrJLe5nMUDaH5cRenEX4FCFYd
	SoIjmYTh+uDyKYZTu2U/8ICqkC+p+EjeJFPrqdp/O889YwVL+l8LHbMi+HfpCGk167Z3bn50Yiz6j
	EdAnNEPJvTfIgBPCY0IhwVOLpShQuOC3AkBh/iM9uh8sOHzjUWaLA81Vmnp0ZlbJVUcmeNeS4clCV
	Wf49vv0qeLeZ3ddsyDMfIP4LBz6AMeuIfvZsQbJCOZ1cmlFgxWGr9X4hVjKiUA2y7dyd4iGpanr4L
	v6urbtKgHBdgYB/Wy12ddRC1P0MelZjiBKFzFpOLzg8/TH5+WKwZ1kXIc1RvlH0QVc7HqPpxtAKKd
	1hr6Bxfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc07s-00000006Fbe-0PLw;
	Tue, 23 Jun 2026 12:21:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc07o-00000006Fa6-0euX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 12:21:09 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBXWqB2308416
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 12:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MfokqFYIIsc
	fSWuyK7hBpD3TjL2GPJaI85B2LM0b6Mg=; b=EQTbTof3FJoBbonQtk7mKD/la1P
	r9xxtDLeOePXM6R+o/pWuJkCB1CUiQIHKtd/LpabVN27DFNcrpCneq5IycM3U+4w
	j3J0N1Pv5ik1v0GY3rj0VvVDXxyzgrObgrlURkughRqd+6n2eX1+p8blA78w68++
	Hry+AOfqPFgN1m6HRAloAAHLO19LM9e0Z0WQgpZumFZLdqyjyWahWWecPjXqOQSJ
	GdJupjb4SXNBG0eI8b7HszdRbbsh1VQP5ZT2gCcFEXnuNr03tsE6RRTFZ6Nu1GxL
	sbvlawWtv/BZr8tZxn4aOQUBqKDW0Oe/7y1M2znNn3cqZxmYhlvGON7CiiA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyp1gs2x5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 12:21:07 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8422f987f2eso9216228b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 05:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782217267; x=1782822067; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MfokqFYIIscfSWuyK7hBpD3TjL2GPJaI85B2LM0b6Mg=;
        b=Q04ItxBvUhQBadunqv8pX1JpQt3QSp8Q2W2h3LV5dFV+74AUFsIkQQFzQpXAoWGP13
         i4E85xtkC6VlmWtOYH0RtbZ+sg1DTCX7jrItyNmc7l66q1iRFSKHcUdJ4GziqjW/8kxs
         Us+CFSmH+balr37W7DltiV4SjzOcl40wpeB/Jmja2K0kg55GLhyyQzZYmMZMw09930Wm
         E0XhUjZrh7KFKuYLbxe62LymXgGZx2rLcEKT4w3hvoToPPjzKeKmGoJtwxokDaIY3/no
         1LReEWga8+x7St2TJGPa0xOj9Nb/Da/rByGajwB1d+R5ob9nAlck+Qh0bCQ5X57IyWdQ
         SHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782217267; x=1782822067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MfokqFYIIscfSWuyK7hBpD3TjL2GPJaI85B2LM0b6Mg=;
        b=lHdvOPgtylf6PiqyFiAdWOcz16aDip/ZbwU37EG+mhHuejafhUgUD39suBiHyaCgH6
         XoaHNK5N7kVwQ6qbLsn8o5UDFSu/acgj4G48rdXCcUlFZRJKqNlS6aQX8t/ASm2Iy3oI
         yh3jDfJXGojusozriP5pkrkw+mYpZZckd4ToGds6cKr9HYnevp5Qbje7AHgx0y4zUFsu
         2lo6MppcQEFZgufU0rVFGs7aG/gcYchKWzMN9HMlVUTjnfdobxyhURaSzCfG+nfYz/Wj
         Qo8GkHRwH4cAz+FNOcNEVWDPfkbIJTVgAxGlHSfs73SHkch3ujH5EB1NOAmI3NW949bp
         tCtQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Qlz1Uu8gC9Vi70d2cLpIStEc6z4VQhqfS6/jwOGMH2cDUIE8MrNH+gjj0CdCClhsp8I436K3uroOzzg8do5qv@lists.infradead.org
X-Gm-Message-State: AOJu0YyDxl2WhXIZfoBMZ7PeK96u4565ya9UVJvy04qCGxj99zTKK9Ns
	PHIxTZOCgXX55MjUemBwUXfLBCeRRxaeNHEzD6/5AnYHuxOVeOp0VUPbunks0i+o4gYxAzd1igB
	ZZejuT+AS7YmNGafEEUzQPWoccxxXx4rHoLWKnph6xOgA1Alpgqzv/DB/0BmkBWd6PhHNpvi07b
	g8ag==
X-Gm-Gg: AfdE7cm+vwBfNHGR+lfbuNVvPm/dJf5d7vX4m+ZFGkfZJxNM90bpIShwrkauqNL/WX7
	YqzpP+4a25BgqucunpO4tR5n7sEyeSqrcKlLrqStFR1RupzZA9mRnos9LC9KsWef4zApTN97Emf
	AkUeuC6ajVddE/2tDpQK9HDiIfzHymEckBWgmBkJykpUpeUGFjAtUpeIl+IPYNrdNkc2PfwlL0g
	JSfE2Cay6JvW/GeTIxa22lQQ4ygYMjptaZ31u3pNfd8ymaIjOotAXT7Vbm2S6R1OPfBlS27h8Pc
	NJP0qHo7wIkNeIMjqvLe58GTrTxgn2+u732hiebf9aQhYnd4q/Ktf+HAruXpw2FDBb3BRmwEChU
	wJw6zYyDGYXEj4yVa0/MnMYsaoQcU07javMfsag==
X-Received: by 2002:a05:6a00:2e22:b0:842:6c02:2fa4 with SMTP id d2e1a72fcca58-845952354fdmr3159959b3a.14.1782217266744;
        Tue, 23 Jun 2026 05:21:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e22:b0:842:6c02:2fa4 with SMTP id d2e1a72fcca58-845952354fdmr3159923b3a.14.1782217266179;
        Tue, 23 Jun 2026 05:21:06 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564e74646sm10171856b3a.29.2026.06.23.05.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 05:21:05 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 2/8] iommu/qcom: Fix missing pm_runtime_disable() in qcom_iommu_device_remove()
Date: Tue, 23 Jun 2026 17:50:28 +0530
Message-ID: <20260623122034.1166295-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
References: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: UoiBRGRJBCEMWVk3Ca6YugLvJOHlfoHM
X-Proofpoint-GUID: UoiBRGRJBCEMWVk3Ca6YugLvJOHlfoHM
X-Authority-Analysis: v=2.4 cv=QJhYgALL c=1 sm=1 tr=0 ts=6a3a7a33 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=NButBYuML4y5tsQ1waEA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfX+G4rxRJvL8S0
 Rcb7W7sHVktJO3SES/GqnMkKVjUfbqw3eYhphQCtn5sliwVtuLmaVjKwr7ch5ffql6D6iCFHp1I
 aq2QUY0RS2XI44bXURkf8LGo8LflTsg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfX4lkzxfZbFyK4
 NTF6LHGIij8Rd0NXO3dyUCUJbcM99afAKUiNb4Ahp6RBJVYVlZw9eWR2kqfdyYkXYVVz/UR58/9
 2xnw1tId+f5/EATKWQ/6kWzB4J6MM0Oz7CDXqLJCneymryeCslbk5UBp2nQSRTvg2K37BPXW/yW
 YpWG+uAKY0PrAOujKT2aF5GZufYEeZT/A6XJ5IKXslF7urWjE13F/THUiMzfk46cMlLmp7kB/tH
 +IMVhivEbXIMARDrzD+lTNDfYS0P4EZvv+7Cp4cHZts3yEKD5EZu2KwiwFFo6mfVMZoKSqXCeJf
 kIQObnMb3B1pEQyQtnFlL2G6jZLKdxO3Zt7On6ViduckiPjbjuvVRbc4nbncS303ZXlr0M7Cw6X
 uDqBmP+AwCeJULXRSh8ii0Wn7ILNLGZ13o7SStRWELd3dPnZcFUh1lXnscrGTRkEIOK03hROG1Z
 svF0DwP7tx/7AIFtrPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_052108_208807_2BD60830 
X-CRM114-Status: GOOD (  14.44  )
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

qcom_iommu_device_probe() calls pm_runtime_enable() but
qcom_iommu_device_remove() only calls pm_runtime_force_suspend() without
a matching pm_runtime_disable(). This leaves runtime PM enabled after the
driver unbinds, which can cause issues on rebind or if any code races to
resume the device after removal.

Add pm_runtime_disable() in the remove path to balance the enable in probe.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 09f2ee6be988..cb43276f4a39 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -878,6 +878,7 @@ static void qcom_iommu_device_remove(struct platform_device *pdev)
 	struct qcom_iommu_dev *qcom_iommu = platform_get_drvdata(pdev);
 
 	pm_runtime_force_suspend(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
 	platform_set_drvdata(pdev, NULL);
 	iommu_device_sysfs_remove(&qcom_iommu->iommu);
 	iommu_device_unregister(&qcom_iommu->iommu);
-- 
2.53.0


