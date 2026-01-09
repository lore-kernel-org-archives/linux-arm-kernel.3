Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED473D26D9B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 20:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e648/KtOd0+RWrEfcZlx4oczML3wOVmr8Cexl05A+BQ=; b=AWt51qivbMe+eR69CfgMS3pJ9+
	AR8DS1MfKCkuxiJvC9IJAQkULa7I6DDE17Jb2KNMGVtKV2RvSurUYYdUwZ+S5JfD+J17VHaKX9vCf
	bTHRRy9V2MgBysDTPQRRCpd2xY5PhDojJoyfbOUHMr/MFD4uhXKI51YKHb6/iGmWm82UnNrOBfNb2
	YkQFKRWNhOap5h+6M+vzSxv2l0MhFtasii0C+gBKMdjbEv92l+2CmOsbIeyLh+EnHGYWcztdeS1d3
	dDquVcPq5sN3Yq2DEBGymGRLxaOf1RDdFwe64OumM4GLAgaPq4Yqo5dXNo30qo0iTC5BuWuCM3699
	3NTOb8IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veJN0-000000030zc-3vhw;
	Fri, 09 Jan 2026 20:46:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veJMw-000000030zC-2sQI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 20:46:05 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609H3oCT1574001
	for <linux-arm-kernel@lists.infradead.org>; Fri, 9 Jan 2026 20:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=e648/KtOd0+
	RWrEfcZlx4oczML3wOVmr8Cexl05A+BQ=; b=gO+Zu767jwDZ3VsfCcLLL2d50tU
	hQM/uMVpQYH9iqo+ymM6vtQvfBkwMU1flEUBgA1+GgwnWFA7c4DW1AGPShZmuEcL
	aAkLHgFmGJFudwCRJDXvf2Un3FNugrgNBFQQIIBzWIeEbkZDvmPB6VC2mwjY7nUr
	d6l8wdsrQ+4gp7E3Lve30fs5DN1Gi1Wje/gmDyntyTs32OqYrMnTNBj3hInmdno7
	T+e4wq0oUPLmvBcaLwQ74jZqxYmCmi5CyueU+pgqSD/UsQAQxrzM31BCYWhrATDw
	C1UC8xUj9iyJr3TgGhtSw6RJnIULwYahG0xY3c4sUzelTBoP+o9odBBTkZA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bk5rc8k2j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 20:46:01 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-81c5e1e3beeso2454849b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 12:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767991561; x=1768596361; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e648/KtOd0+RWrEfcZlx4oczML3wOVmr8Cexl05A+BQ=;
        b=MrEzTb3YsoJ311aYJnCv0voejAgU2zlC5emBQViVSaUQY8IxQq0H9URTmenuavI4SW
         taRYKdUDQWGnbV4OGaaE2aH0Tp8hX8qdQZGo172XbKQuQu3M5DGkgCPt00XDHotLUux4
         OpeybGR5i22F3CbXH3L5AxA1UKFI0+hePemfysrWoxprCmmqICbbkmJjT4+p1YXorkBg
         4BejR7uZhW+qQjT7W2q3vAjGOJSNUMLpB6t1oo9NN9lvgzJOgObAmDedYxc3V4aHkZwd
         aunBxaG4+bzQrcMCRrztnlIRymRBoYkpNqsD5DDWzfc56rC94iu5xRSCGcgYF9Qb3N+W
         yuLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767991561; x=1768596361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e648/KtOd0+RWrEfcZlx4oczML3wOVmr8Cexl05A+BQ=;
        b=ArSjiApkHE8LPJdyKPi49cYFpkym65rg6tGirUoSr6E0pmgVHgXMfGTcX8t2iUfg+L
         QzwulgMn+MVGAalMg2LNNcVvmkWtHB5Qu8ogdodEbne2Ww9Ssq98C7Az/SJ5ehUWzP56
         o/SxbZrLFuwjz7nktbAM9vUkkVB+swoYgAKbFjcJvZQQLOQhZSyMIeHckEQmpLGy8bmf
         +ygX/LDz3MSQPTJb3E5bpV7N91Vzes7Z7AX5VwtEe2xEUUL9ckPxTIsFxrg19X7UY0B5
         klO/t+o3FHoHpDLKMI/y9YCa4RsbLhsVvwV9IWtitxdeG26c6BgtXfkRQVK9ewhkqY2b
         faOg==
X-Forwarded-Encrypted: i=1; AJvYcCVZqeMMNam7y6RcFlu14BiScBz0JyEktqaVOEsCzABwGoeo9uHxE4CmeliWQnxYDWh3JRGBKvXTtJiZ7MV01ApO@lists.infradead.org
X-Gm-Message-State: AOJu0YzDGeTCjBDOKzn66sY5poHL47r/8/ztF1pUGrJ9xIz/xt3hNGwn
	1TOaCITMc6gMVV6OeoLbBvpX0m/WDA027grlqVjRrEQiaSWdsA6NROnAVV4Ev5gS68iZhR7M7Pa
	5dC9FuctzaJEQfGmUJWTOMCh0k3UDc9G0miBG8hPmeuvos/5IJ4mhAV/C5gBRRNFHF7RYDGJPzn
	hrRg==
X-Gm-Gg: AY/fxX42+mcbp2lBtfn5qQAULuTnfhj5H1w4i5lPGtJroDW9wAGvckHEbM+I/bGHeqg
	RdAfgX+nZz2gZH65G6oUhSGkS6LotmnDIA96gXm57aHHMUvrX3lKe1+QpkHjKHzve5JH+BJ1hO1
	lqW+JY/wWAP9HR+W6lJ7UKuewPtgHFJuERp9CnVEIG+wQRsiDtoF7fPpPp3XAuikG/xgrelb+NN
	bty7+r4QMiNnbQ4d0sgNzKQ3GvSVN32+rHmnd4AVk2DrRBTfVSBq4XsO68VFUAI25GslI3ohxlJ
	X39iYVo2tIQUEwQ5AsbIyzEvsYG5s1DGeG7PPlSYYst/slj0+szqJumeZMZWh0noxW5ft4SSy5F
	gGxR9PS6Y10jQGqWOk2Pxqekpa/YiVx5jY8FhSEYf
X-Received: by 2002:a05:6a00:3003:b0:7b9:4e34:621b with SMTP id d2e1a72fcca58-81b7eb27c78mr10510826b3a.12.1767991561303;
        Fri, 09 Jan 2026 12:46:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqjv0b7lCDCbINP4r0dTLyev/FwhW0Ax5Z9VTaH/LlqyuxmnOU3MdXKx8Xj1jiP03kXOMtcA==
X-Received: by 2002:a05:6a00:3003:b0:7b9:4e34:621b with SMTP id d2e1a72fcca58-81b7eb27c78mr10510795b3a.12.1767991560769;
        Fri, 09 Jan 2026 12:46:00 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81e6772688asm2485752b3a.45.2026.01.09.12.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 12:46:00 -0800 (PST)
From: bibek.patro@oss.qualcomm.com
To: will@kernel.org
Cc: bibek.patro@oss.qualcomm.com, catalin.marinas@arm.com,
        charan.kalla@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        iommu@lists.linux.dev, joro@8bytes.org, kernel-team@android.com,
        konrad.dybcio@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robin.clark@oss.qualcomm.com, robin.murphy@arm.com
Subject: [PATCH] iommu/arm-smmu-qcom: Restore ACTLR settings for MDSS on sa8775p
Date: Sat, 10 Jan 2026 02:15:51 +0530
Message-Id: <20260109204551.845959-1-bibek.patro@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aWDsFoEe7PHQaL9F@willie-the-truck>
References: <aWDsFoEe7PHQaL9F@willie-the-truck>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: XpKOKGE1yE4A5cBfF-0txl8XlHNbCqUQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDE2MiBTYWx0ZWRfXy350AwlNqoz9
 Sg5O9Sb161MiulqqXyfs78hKd5oNDeEQJZiTFf2Dj67PPNgXTkx1GDvAHzugSGeHHtmfNYk8FGK
 ba3yQplSwdGQwZAdkmMzFO7GefzTYq2VKBtel57M2Wy5zsGQ2Lvw4oChb7jQwI0YpLhL5gOjIzq
 cVpJFeD2z3Ff0GfYUfXx0PCHks3wRBE0MD/7ClNpFM0itbZNlwMVumknosWwVdr5UvaZN/WQU8F
 GhrlfbqEFlu/AqgPTIByXBmdBU4yUbq7v5m7ZEeWe2bi0bI1oaHSyt13MGeKvM9NTu7lJdqiODc
 oTw0+1w0vK1mvPXzZ2gFsxkyN9eGaVRZCGRePwIlv3AFJf9adlx8ozxmd+bDTUaQfuk97/phwK5
 6k6IfozRcaPZGxbhTeSiUsz0AZR16Bkn92/fxEuMGau8oZ7sfuC82CZL1Had26QsjysGqd5fqnw
 pAGh6Vxft086c3q7JRQ==
X-Proofpoint-GUID: XpKOKGE1yE4A5cBfF-0txl8XlHNbCqUQ
X-Authority-Analysis: v=2.4 cv=HP7O14tv c=1 sm=1 tr=0 ts=69616909 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=X4sqO_BnIXgP0qhT90oA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_124602_745053_4C413085 
X-CRM114-Status: GOOD (  14.85  )
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


