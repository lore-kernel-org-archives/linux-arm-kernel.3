Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C887CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uBhEfdW/m0+frpWlSOZbFsnd5JIPo2zwXhwrIyotka0=; b=Rbl9p2Uur3Nmw73k0TKA01O8qj
	gpH67LLomLg/msijvUH1xOUw5e0fm6ESEFBNAVomv9blmu+a6ar5kuTdljKdNCnAv7arGZNr1k8rp
	t786cUistIL/kyUqb0Z3brA2Q5x30/FkeFyvXpHbNMSshUpejRQBTCUxS/JBeK8cpA1HyyCc1M+hl
	F9lZ59/Jtt2rIFCnbwKGobF8l9r5yWQ5zthuXMhCSHkTgJWof8vYxTaGcKVMnziyKLtKjJHLBaOCU
	edEhO6G0q6UUmPOH/y61Zbvrw/g91H3s0F3i0YWsS+H/fqXUsiDwOMHoKq3SDWPQzaD69eVZ33hkg
	HasCjlNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUn54-0000000FJoO-1Tqj;
	Wed, 03 Jun 2026 15:00:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUn51-0000000FJmo-0wr4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:00:29 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653EblHR1476841
	for <linux-arm-kernel@lists.infradead.org>; Wed, 3 Jun 2026 15:00:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uBhEfdW/m0+frpWlSOZbFsnd5JIPo2zwXhwrIyotka0=; b=FR7PSlyOJkWGIVkP
	s6K5xuZO8708Qske/MsZj0ohP7hQzcNJPNb20Hx54i3AeK6MWJ1LU6PTti3NXgDJ
	0R2wBcwfzbNy76tZjRzRkiIQMcmzPZDf3I+sDeMlabw9gVD4tPx0j53IFckySyXt
	9LljQR8atd5o24uTbjtFePW3cSKsUxJyDJ/mgF0fEvKo0a480VjSIljfHHeAC1Dn
	tJ0FskdFCcfF3usxaFdRegGWE0S/wZZj5q66dXsfm53CjicBEY6foMUh2NBPhUzx
	5wOpdzPs+EGPt/2x7FxbQO25m3SsQp0uN0vcOGpN9ObPB7K6S2VUQDExk4P2xfD8
	XWGtNA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejp6nr3f2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 15:00:22 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85a2cda4d0so2170762a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 08:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780498822; x=1781103622; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uBhEfdW/m0+frpWlSOZbFsnd5JIPo2zwXhwrIyotka0=;
        b=Y47lzrZ7bXDXbMcVMWYRmrUM1gASZD/HIM+3MHa9oaEW9qG5qfCR37gH/XwXoinp9t
         cH7vzm5JNwB/7gjvFNSKDao1b1hXNJRRGKJaTXf+I3MSpAjh4FtVBJm8JO04tpTZmjlq
         fUUsSoemrBQNw3isieP5uN/Izvra7oCvYieYiwM5btU7hyqIVhgoXW+y6gUa4fbCid4D
         7f7h7x40bkAoQgAlm0uvIANjrtaNHQ646IG6Taw7IGKbH3pw7WEubL2VCaxqimPomUeA
         tBu4kCfuIlvvOWRHlZFHopORqDfXI9f2scXA7a9XLHc5xj7yukTJeXytXeNNyqmllFbK
         EAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780498822; x=1781103622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uBhEfdW/m0+frpWlSOZbFsnd5JIPo2zwXhwrIyotka0=;
        b=P6HrgRxAGn7bhVUV8JVo/PNIRWTWvOcFOUcG4kylQdCG/J9yxPNrQhOwFYQv8RvpuE
         fEnmuMuEC6OsoNBQAuIAQmEJaJSi1bOL+K/LNmVavMNNa4H75FulObLRH6rFbvtX6pLh
         SF+vdoMNb2lMe6plqAr7PIo4m8I3aYJd+gliElhgasW+WU/I+/G7PsD+RCZJ89+yg6RB
         Lu0crBoQWGVE6qW6WLu4xBmkFa67+bTEZLy4zKXWvaUcglgxnL/qpPBxQlNq5TFzdoLM
         DqKNHoPR2ewiOfpkKQzDWEwJMuHW6rOErxhx+FrtaxJQNg4omWigiqDiiBzfBNwDgnAA
         PEMw==
X-Forwarded-Encrypted: i=1; AFNElJ+rK0U2xeOrRVMFus8UoRXg8DZDOXlyh+uUzBPxJe5tONlu7h1iR8ok/0puQ4VAEbG1CzZFz0Kz//k3VzdqXJr/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5ot9tpIg4GoTTfbqbO/yb6DCzjmbqiOtvTatIef/ZYIOZj+hq
	VVq9v9jG/yd8zgDElJsRMffLd93gomhRkROecRZrzrLj2p2kwRjdQxCo2pKxjLwJPfQjYsYnn1d
	OXpYQDhTMEQo+hegdevxzv2xqvszjtDaQD/+Y036fwtRKgICnoTQ+L0eU1GKPN+eiSvubW62I/X
	GABQ==
X-Gm-Gg: Acq92OEI0Zanu9ATFmTkL3sNq0QO7n7ObjcObpzqqI1C8+jYCT9Pfh4n3bivMLPZy8U
	3yIKgkAlLh3a4ViI2GLtpCJNTLX8KJfBye8B5AG+WOYaACgkU8Xolu7D9zYUwV1Kpg50tkOUMgf
	/CWyYma8aQQpBw6HzmZdoZpVI++KsXqO5uOIhUKq1GbVToaHB211txdutGcq6zsmwJA5+z1oKe3
	MHXAWGVUSZLZzwGx4Q90zEIL6fkx87tj8H+fxetQ7tTId3Gif+8nj67wi+dUGKb8Nb7v0BOOU+L
	8EpoEqgC6IwM2OeYlpPqH1ClJUFFYbefIrkvJI2FznSA9QXgNYbD3BfepzgiWBN7iHVRm/dajfh
	hYLXcSZ88OiyRaHHCJupZeurotBtILHCZrLndddc69OS8HCies5AaabIRDAg=
X-Received: by 2002:a05:6a00:c90:b0:83f:2568:d45f with SMTP id d2e1a72fcca58-84284f5f588mr3805651b3a.23.1780498821421;
        Wed, 03 Jun 2026 08:00:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:c90:b0:83f:2568:d45f with SMTP id d2e1a72fcca58-84284f5f588mr3805562b3a.23.1780498820755;
        Wed, 03 Jun 2026 08:00:20 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282882170sm3747409b3a.30.2026.06.03.08.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 08:00:20 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 20:29:30 +0530
Subject: [PATCH 5/5] iommu/arm-smmu: Add qcom,shikra-mdss to Qualcomm SMMU
 client tables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260603-shikra-display-v1-5-aeac1b94faa7@oss.qualcomm.com>
References: <20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com>
In-Reply-To: <20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780498770; l=1873;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=oR2yHxswddj6quJTdd+FGIgKIDMApsb7sGBB9OxVs9c=;
 b=slT7W/f52dq5AGO2+1rwtTo0T6c9Jbsdja/oVrv6fulBjy7AdNAx6Ybfd6TtE7V8hPTZoRf2Z
 IBvqNqxSNY+BT8jWJynyp5mtqdDgum45kTsfs7dMaj99ai7z9uACjZl
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: knNV0zpqT_Bfrec_Lep1RqNnvj8T6Ho3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDE0NCBTYWx0ZWRfXwhDJ8CXT/GAS
 3n9ZoAmWaRySHVQN+GsoiFnrpS3Gmi9UgIw9RH5hnDG2qb0Maq/NzJVbjsT40nDdBFd2xsNvE4d
 Up9XGA92sv6T3k1J8J1ZuPvG2Z1vzkO53ug1oc5E+9Wg1jpjCOVcuosxu5yNKd4DVMCw7Iun6W7
 7Gn1Zpu2YJAvyU2PSfUhBy0mqND9NRWknEJ9FHZyzPBB3CzhfhjCPqCuoAvrWTwMEuVtYvMzKkv
 ABoaD70ltWw0cLUStofcZgv+L2bD9DAn7mvAZkWkNbTsy3mJF3AiPewwr63PDyKfcSMMBey1MX6
 peW9wIuyXg0HaZnBSNkQmOb5PDSsNT0KrjNUVw5UdnhJsbHNL370rZEHhfur6rOBkLVfJBa8BhR
 5V9TfGKneylyNXMMerF+m/Z3UwHVcw==
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a204186 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=WiTR6ph8kncRzgk6yhEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: knNV0zpqT_Bfrec_Lep1RqNnvj8T6Ho3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2605210000 definitions=main-2606030144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_080027_265257_CE2D7002 
X-CRM114-Status: GOOD (  14.14  )
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

Register the Shikra MDSS display subsystem in both the SMMU ACTLR
client table (for TLB prefetch tuning) and the SMMU client match table.

Shikra MDSS uses qcom,shikra-mdss as its sole compatible string, so
explicit entries are required — there is no fallback to qcom,qcm2290-mdss
to fall back on. The prefetch settings mirror qcm2290-mdss
(PREFETCH_SHALLOW | CPRE | CMTLB) as Shikra shares the same display
hardware block.

No entry is needed in qcom_smmu_impl_of_match: Shikra's apps_smmu
carries qcom,smmu-500 as a fallback and is covered by the catch-all
entry there.

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index e2c914fccd6f..3dfee947e2c9 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -45,6 +45,8 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
 			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
 	{ .compatible = "qcom,qcm2290-mdss",
 			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,shikra-mdss",
+			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
 	{ .compatible = "qcom,sa8775p-mdss",
 			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
 	{ .compatible = "qcom,sc7280-mdss",
@@ -410,6 +412,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,mdp4" },
 	{ .compatible = "qcom,mdss" },
 	{ .compatible = "qcom,qcm2290-mdss" },
+	{ .compatible = "qcom,shikra-mdss" },
 	{ .compatible = "qcom,sar2130p-mdss" },
 	{ .compatible = "qcom,sc7180-mdss" },
 	{ .compatible = "qcom,sc7180-mss-pil" },

-- 
2.34.1


