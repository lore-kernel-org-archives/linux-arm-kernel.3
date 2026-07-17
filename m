Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23CBEC4451B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 14:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IJVHSO1u6a/Hfz7sqtNZdF678kjFyDUjw1u5+bJ5TaM=; b=0KAkcHwmYCrbHmIbborrcSPtme
	R5hgkzZDiYXIqAXsibmTCfSpObZcd4obtUejwH3be/nLw3fU/s9dXQAm5idNdY+iQ/qqhPcSODJiC
	5N2KL08g3dr2AwDz2ddimsFkqIOioTED05Dcb4X5bY7c18c0JZB16Vf85WZJcDfi6PnPLpcPQwtR6
	4aA8QYcAjzPqUuTBGVAc8On6ly8rsp4k5lKd3pstjFCVbBRdDiOWhUW13o5L9CqVUKYx2jhPkxK+D
	BY7ZQi2XYyZDBjgPa12L1mFXHRSvZIuwSDwOEsuy2d7gg/5JdAN2OM9nZOOPGGHQdGgZ3Xh+xpnU+
	TOmk+0pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkjpf-00000002W0T-3tUu;
	Fri, 17 Jul 2026 14:46:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkjpb-00000002Vxx-064V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 14:46:28 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE7bdf1809054
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 14:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IJVHSO1u6a/
	Hfz7sqtNZdF678kjFyDUjw1u5+bJ5TaM=; b=XLhoDablxd/mhdo8ez1693QDxIF
	71qWgd0edCXFj0Rz1v8wKBbgAhCquMMXNm+QLqj5/FAlDufws9TACRMTd12vW2cF
	ylTN3CiwKhIUtZ8OMTz0I0UgauYIh/7GwEXI99vvk4/Ub81O/SFbonTsaq2dyzuI
	HFLJUEffr16K9D4irXhtqDpnZQY6SZTPpKZ5mehuhNsxFjMCFNYxz35TcQUT3Qjw
	veTT7Ikt6A1FvwSjmkTcC54cAy7oDD/kScH5rEL8td6Kni+fD4ZNFNfXAIzlZRpd
	HbBh7lSYfARwPIaOu+Y1gUSdTjL3q/JUpukcqVVyjzBkptdPkSzttD+fW8A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u8m7r8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 14:46:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c110a3b6aso72408361cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 07:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784299586; x=1784904386; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IJVHSO1u6a/Hfz7sqtNZdF678kjFyDUjw1u5+bJ5TaM=;
        b=jud93PUgiViRj4ezdXwjJj3z1VG0mgVWlPQ4RwJsUPpdiyzg9yqsSidQpKdfnHyQ3k
         CavHmBWUt1pPKgcudaCSKoYPKLSWMDqjNmj5ANb5WPyfdPTMBsfDPqsXhgbH22gddntA
         w797IYgeP3GXpnwKDjm3ATMhCEa0LpR/KUkiqMf97hGXHBhGBfr7m19jQFjyNyZM2pEr
         8lEW8922aSUtqfwyEPf27KeOnXqXQcQ+nvWfZ2BXCNOM8nuS09a9WE36OMImIy4xHjiI
         ZzQU/eOB4pNeDEg4r4Sqj5a2uEo63i66KD0y8QSPy/pR7kE79WBD0g6nl+0PvCktD6uP
         xnhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784299586; x=1784904386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IJVHSO1u6a/Hfz7sqtNZdF678kjFyDUjw1u5+bJ5TaM=;
        b=Q+C4ut6VB7+XpRP1qxAxbAg+N89V/OPPxkW0KntO4u82eakmT8+qg04mVDPoqM9elT
         JfUxqweHMGF7zJCeQqPA916aVg27d627h64WqyYF4fPC0KHvtGw/nFE9vhAo+WaGdQf5
         M9aJGI1fMoA8ZUBBPtpHbG8IcVveptonf+jYA43w0RltIl9++FvNydLWe1alOoCdvxen
         fj5yBWZEJPWjRo3KsyGBQV4c5MJqWvEZ9S80iu+HZWM0DQleByirUiZDPi1WyBpOw/fQ
         IOBJf93nfSXpoihmQ56QQx+Brp/TFspyJMmpQFvr18sVRcfjxUK/AiURxfSs4sp3d7Gt
         Lb0g==
X-Forwarded-Encrypted: i=1; AHgh+RqkUo+PAOl9brZZfay3harS9eWjkXPEdGClpfmk7ag7/8iUza3IcyKysiyr+xbMfNZ8Z+BDbLun2iKFyRIR0Poi@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv7p7BBNJn3khvxUXAwUnoySLueef+I6o+BOsgt1uHbmejTHA+
	qdqg+tzx+yi9cfUAxydxLvnP7KREUFD24ymCYA2ZcwLgjV6mjzQJ73WYL2HCKG4UnGRjsjWOlCm
	p4r0WPyx0oV1dkikDYlcLbr6S+AoNNIqKjlydCc+6Grryhf6QrKwFuut2mOcytKjiB/x8JnuoWX
	gNlA==
X-Gm-Gg: AfdE7clsK0igtOlUWckmr/MMas2OmXPyNl4O8sBZ4e/fZocLWd4erW0yHtefZtaMr88
	Rdgvtk/PNdqixQFS5Zx0FDJH9RjAovYLe0x09Prk/japxwjyWfXN3ha+f5TC6HI/U+h3u1/Felt
	OLeojNulrNPgmcdgQKwqn0Y+7ZIsALKVUYGBG/+/OxpdZlHAUTL2NCxNSmIdkxoS81+4XBuPYU7
	Hi1AhcMjBVhKf14E6OJRU9HJbD0Bbetyuk/W3/q9UN7Odgyu9VVPGGPDMittX9KpWFzrVq1zwnc
	K9X7WcqN3Y/t7sWKY1NB2i6+zcekxhPt5Y6QiCpKa/7M7uIjfrVzmk4XdOP8yqPmkfK6IC7SSQr
	Id5mVo0po9ViH3Nzxb6q21R2V6Bw=
X-Received: by 2002:ac8:5913:0:b0:517:6631:101b with SMTP id d75a77b69052e-5213f66b7admr24607071cf.55.1784299585617;
        Fri, 17 Jul 2026 07:46:25 -0700 (PDT)
X-Received: by 2002:ac8:5913:0:b0:517:6631:101b with SMTP id d75a77b69052e-5213f66b7admr24606711cf.55.1784299585126;
        Fri, 17 Jul 2026 07:46:25 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52149a3ce4fsm13414801cf.0.2026.07.17.07.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:46:24 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Alex Williamson <alex@shazbot.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 2/6] iommu/qcom: Use devm_pm_runtime_enable() in qcom_iommu_device_probe()
Date: Fri, 17 Jul 2026 20:16:04 +0530
Message-ID: <20260717144608.3216274-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260717144608.3216274-1-mukesh.ojha@oss.qualcomm.com>
References: <20260717144608.3216274-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jlcXyNVQjDU57X5IHDHYRCoP7lgnT_bk
X-Proofpoint-ORIG-GUID: jlcXyNVQjDU57X5IHDHYRCoP7lgnT_bk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE1MCBTYWx0ZWRfX9Djkyq52rGOU
 uPz9YOEzbGseMHcW78GonH4zgD2NkHcJct3c+32x15fbw6eBle5CNru9PKl9g72YIcp47/Ie7u+
 xmYkACCBZq6+XOywkwH8BvvSFvUQbws=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE1MCBTYWx0ZWRfX0bFcabpzKZhF
 //XINlEZBGjSjAW9FPcmBf9QQJXtTCGyDbGXG6OIi+fA0I5Lw7zjf00wlNIy/U1I6uOGkqCyMU+
 Y1fHOIYPAxbpLlh6fG6X/4NTnOZuQnpFjrVNBS/cGxhEbunRJsH7CCP1GEFOqV9d/lKXUse7pFF
 YH4D8UXoEhmzBbQRDALItgfM7c4WnVVsxgYswv46GmAiRygXnh8G67LAcFxZZ0hM6ZFvyNFRyo1
 vqNzCqjFRV6dC2jjTJx27BXbpKyRq20iFvHI1maGK32oeOnRuF2wOR4aqGP6ley6QV8H/FLi3Ja
 OpD8v/UTV31kArYFJFSRFj0T9S9DTpIcHEfLI6kl/NSQCf+cZgdb9w2JOFq2jgvPOBeu6w76Y6+
 kbmDwVZcKdIWYuW9CCb3n7m7KpbNDUMdxWQupcw8L6G5ONauD80nGwsjFKks1K6uIglPTicUY1T
 rfZXzHAmufIAAnQMP0g==
X-Authority-Analysis: v=2.4 cv=TL11jVla c=1 sm=1 tr=0 ts=6a5a4042 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=ZhKRi010OgpVv_9PQ1gA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_074627_083560_CC3E8698 
X-CRM114-Status: GOOD (  16.29  )
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

Switch from pm_runtime_enable() to devm_pm_runtime_enable() so that
the matching pm_runtime_disable() is handled automatically via devres,
both on probe failure and on device removal.

This removes the err_pm_disable error label from the probe function and
the explicit pm_runtime_disable() call from qcom_iommu_device_remove().

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 09f2ee6be988..71251aecc292 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -836,20 +836,22 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, qcom_iommu);
 
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
 
 	/* register context bank devices, which are child nodes: */
 	ret = devm_of_platform_populate(dev);
 	if (ret) {
 		dev_err(dev, "Failed to populate iommu contexts\n");
-		goto err_pm_disable;
+		return ret;
 	}
 
 	ret = iommu_device_sysfs_add(&qcom_iommu->iommu, dev, NULL,
 				     dev_name(dev));
 	if (ret) {
 		dev_err(dev, "Failed to register iommu in sysfs\n");
-		goto err_pm_disable;
+		return ret;
 	}
 
 	ret = iommu_device_register(&qcom_iommu->iommu, &qcom_iommu_ops, dev);
@@ -868,8 +870,6 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
 
 err_sysfs_remove:
 	iommu_device_sysfs_remove(&qcom_iommu->iommu);
-err_pm_disable:
-	pm_runtime_disable(dev);
 	return ret;
 }
 
-- 
2.53.0


