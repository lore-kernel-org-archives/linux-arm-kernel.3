Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBF1D2ECE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 15:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R2Q7SvHuSDAVtZr8Kc9/++hSXyyDNQmsxA9fUfbHm9s=; b=LY4GYCPoQezk3SG2FPeSLrhLNm
	PDuojUxEbZic4qZcoj3WA0QitJXwRBy/NrMvFP73YZo2z3vSVqww3rRwBp8RUYHeylX3FzUzKx8fG
	gQi1jWPUBA+sE3wqLDazNxBpbfD7QIWvz1VGELmgsgQ/OXzgmtMyKDGcbobiM9YWdzmUlJus7rAE3
	t3+Ns5gg/J25tVRN+li5RY7ER76Q2XkTTVV4UBwIi4SRano3qAt39Dx5Ff2e3nSFAq0Dg04/a6BNJ
	vK83B25dHQeUmSADDGGDVyW0xD/cYtxVK255UMdXlK4xecejLC3G55StGBBRYCPD1of9/B8yOqTzI
	sTi3OvnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viDO4-000000043Sf-1qPX;
	Tue, 20 Jan 2026 15:11:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viDO1-000000043SK-2g2U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 15:11:19 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KCxZLP803888
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 15:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=R2Q7SvHuSDAVtZr8Kc9/++
	hSXyyDNQmsxA9fUfbHm9s=; b=bBBvBljPPxpPV5HYM08TIgyh/CiAGq1DVhJI/z
	WV/3EaibeIUHHqyvZYNU/mqVecoDq/0I3RG6qo5Cg0V27alaYHB4xr/GrOlB+vhm
	+mS7QlFzqMbj3vX9/856P/X+GsDwX1lna92E+Kg0OecQ/rzBb9xG444T1cq7GG23
	xbK46ntct770xJEX+R8rmxGWfVJ0pP+0Yi8x63msbvssv14HeSGXm5S+kdNsJVZd
	rpGGH11RyqkpGKC3aCp4ERJIagq6TmLFNfQzWaXIxhudAUYwVHWbid8jyoqHx8LH
	xNBPXSutXSohsGxuDGy2zxtIcdlo7MY9qO/2M3iEMrz/h70w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bta6q0c0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 15:11:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34c64cd48a8so5811322a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 07:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768921875; x=1769526675; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R2Q7SvHuSDAVtZr8Kc9/++hSXyyDNQmsxA9fUfbHm9s=;
        b=iP8LYhfTr5ziQyTFIFLu91qgWcViMBbxRqpgGpsvdxTbI9mkB4dTxRSfhZIHOQD8rh
         6QEh0JP5Mnppb4CHc+xWW8PD1WqtAKQMaOgiawUBrs/vxM1qVr33BxWkb0lFius/6eL+
         U6/KjT3Sbx7PjcI78LQ+Ijth3zYaHljPLKxuymfoW6tmcqqP7OdjNNQDEHLXcs5LhMmY
         Ye0CkXAQzkAg6/T2Q1yZ8wFVWZgB2cAH5vJoLky2+1MlkZSp8d9+TX6rhr1axxEO+wos
         2OkblaHKHHsPNLPn3cpuPKYtgTaMHA9FOc5WJdlSxbOuFmMKxfwO12MTtVhhhDVE+ZJ9
         mu1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768921875; x=1769526675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R2Q7SvHuSDAVtZr8Kc9/++hSXyyDNQmsxA9fUfbHm9s=;
        b=WoDzIlooaoRpKjqePLmJ4Onbc9AdaRkVr727iCerogI9SdGd0u/3/w9uVPLhMpblDm
         ZHvJmxLGn424F3VEq5gpJ/t47AHNHnQAKxbIM0WdE8vlZzZqRMI44Jss0aYiI/beugnD
         p/JyklT/QPk1ktYN70+td8RWPxwn6j+y+4uLoD5+vhXKMQzLy07vcu9KJda278rit/O5
         YI52z51MDmexJovFWAb7ABJQujyX2OOS2mePqBdCy8Zt7JsUYHAOx8t7WKuzb4G+lypo
         GMq1LwWEe+5z493gjS5PwmHX9RPZUkKp7wKH377YDAfu7gdoBGOGJI4vlvuql2WXdv75
         aw+A==
X-Forwarded-Encrypted: i=1; AJvYcCWmtqvYmZaH+KNPIGuGB5NKtP/Bm3BgJrdEPhzqVcMkVG14meN13ZAwcOv0xMMbz69dd8dDkgMyNlLxxtdeEcos@lists.infradead.org
X-Gm-Message-State: AOJu0YxqRGB3tBP6bRqlKXKJrp1Gzj0ndvFI8ljRicesMcwX3JcESBJm
	Cdr6/r/Xv+nie5j0pqzbWCyA0cFXHxrr0P1v2c67TXyOpnUGCxR47nAcDZSWKICEY1IXf02I3Nr
	CI9M2wDAIJq/eek2fzVoMDgkxGgz6xwiSofxAr2ityqTL2cYmM6Zbw0vTtEbI818olb5xk689MN
	Cu0g==
X-Gm-Gg: AZuq6aJmpoaSxh0eyCQk3TiaHFKx+hd50uYwYAo2DB8tFu6UfeKGaKtZBStdOZp8+rD
	RDWZjaJnFIO9yKk02WY6N49sgAo9XFrDj8evngq8m3YOS5DGoVfy/NyVBRaSVsZY60ddi7fJ+44
	UeCfR2Qvqhe4JxFd/NfL1ltnRhuBBG3VCBw24KnQLK+3sy8MbRSzc0vtJ4NQzKyuBfbgURicAXZ
	YPTfzCPggaWNSLtwJYCBKbrgdOiSxYEfYa+TcFaHfAEc8n4+kcZV4QmS1DR03CsNPt0QpRyRr+z
	zayI8VsrTceNOLJ1Kn3/FcebEz35JwOTCCSCaMqNpERbBOsD3yc9j2F6Boc7o/9oR1GWG2ApJRg
	TzKBqNuifmMUqmOkALLBxuM7GqqNRdc9Tj49eWiVI
X-Received: by 2002:a17:90b:1e0b:b0:34c:f5b5:c1b6 with SMTP id 98e67ed59e1d1-35272f028a0mr14267292a91.12.1768921874714;
        Tue, 20 Jan 2026 07:11:14 -0800 (PST)
X-Received: by 2002:a17:90b:1e0b:b0:34c:f5b5:c1b6 with SMTP id 98e67ed59e1d1-35272f028a0mr14267256a91.12.1768921874153;
        Tue, 20 Jan 2026 07:11:14 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3527306c41esm11517836a91.5.2026.01.20.07.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 07:11:13 -0800 (PST)
From: bibek.patro@oss.qualcomm.com
To: will@kernel.org
Cc: bibek.patro@oss.qualcomm.com, catalin.marinas@arm.com,
        charan.kalla@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        iommu@lists.linux.dev, joro@8bytes.org, kernel-team@android.com,
        konrad.dybcio@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robin.clark@oss.qualcomm.com, robin.murphy@arm.com
Subject: [PATCH] iommu/arm-smmu-qcom: Restore ACTLR settings for MDSS on sa8775p
Date: Tue, 20 Jan 2026 20:41:05 +0530
Message-Id: <20260120151105.614792-1-bibek.patro@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QohTHFyd c=1 sm=1 tr=0 ts=696f9b13 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=X4sqO_BnIXgP0qhT90oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDEyNiBTYWx0ZWRfX0jKufmD530k8
 OgO7QtzSH/hYR2Z1QP0ovpjWTYcdUUL/Th7+/qar0piQlSiq8FaE2c/P9yURFCCOAwqojn3C5GU
 82WS+RPedEzkBUqtoW8PZTzaASAKWUdZPMtXXzqYgP9afBcpct7yPHTOrUGeC7WiK1fbnuD0l3/
 OVicuruZVCizz6NR+tzZD1/mg6T9Teac1r9jTOajGCM/DK/lkzfSrrVshz/NIUCgJHb4O4/Etbm
 SeoCamrGvWcL2OGeuMlbs2p/Z69ULQKVVZqK23EkrdsXJM6d8oyr2AU933sDJuvlTg7TwWhsYb6
 lhKwD7KZ3O/5t0pR32lMulK8qOmukezxYnnA5xP8QnXwUTDYKXgQw4/ccFsNEAav2pcb9/NBi7X
 /2uhJpjBJAnIDYY2yPvaXWh9uudM4C6B9pNptKe2QKYmzFSpaTHJXNbYiXw6XBh4S79U+sD+c2X
 ScAZEtcZdxYr9+rMYYg==
X-Proofpoint-GUID: y-iLhmscdYRiACuampO6WGohxDrQOjbW
X-Proofpoint-ORIG-GUID: y-iLhmscdYRiACuampO6WGohxDrQOjbW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_071117_798418_8870AB80 
X-CRM114-Status: GOOD (  15.81  )
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

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

The ACTLR configuration for the sa8775p MDSS client was inadvertently
dropped while reworking the commit f91879fdf70b ("iommu/arm-smmu-qcom:
Add actlr settings for mdss on Qualcomm platforms"). Without this
entry, the sa8775p MDSS block does not receive the intended default
ACTLR configuration.

Restore the missing compatible entry so that the platform receives the
expected behavior.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---

Hello community,

Resending this patch as the earlier version was sent as an
in‑reply‑to within an ongoing discussion thread [1], instead of being sent
as a new standalone patch submission. This may have caused it to inherit
the same message-id and appear threaded incorrectly.

Please consider this as the correct patch submission.

[1]:
https://lore.kernel.org/all/20260109204551.845959-1-bibek.patro@oss.qualcomm.com/

Thanks & regards,
Bibek

 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 456d5146831e..718d102356d9 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -43,6 +43,8 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
 			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
 	{ .compatible = "qcom,qcm2290-mdss",
 			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,sa8775p-mdss",
+			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
 	{ .compatible = "qcom,sc7280-mdss",
 			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
 	{ .compatible = "qcom,sc7280-venus",
--
2.34.1


