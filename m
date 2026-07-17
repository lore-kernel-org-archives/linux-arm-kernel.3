Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11AD2C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 14:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WqxH1zDa0UM90FIlcAZOeYgVcW9oIh+YtN03t/bfm5A=; b=CAmKDUaE8ovd7y2WV9BHE9X8lD
	Mn/+6fAv9nMruUOI62MmtXaLC34gDkqIJy4LFXryNp/wG09yWubtidDaF38EtUba76nMZG4eMqq9x
	Rn10WToEJtU8G3kdGkAcbs6QLf+X+fMZY5ZirP3TVY1O5N34XZ66Tq9Jsxzk15304lNJNAvGiO0Fb
	fLPaqeqE9DBQCiLRb7lsUhmw4eAn2Y71N4mIhYyE+4WhnH60lwkbG6uoL94JgocXlQF+mcfcT1gDb
	5te6JFtCUH3/X2Bz4uyrubb62bp9gANkMtPDCxD0wUdSUsx/VJdggYzPR5sycei6WgAan6iUa1GII
	UYblh23g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkjpa-00000002VxX-2tKN;
	Fri, 17 Jul 2026 14:46:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkjpX-00000002VvV-00hx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 14:46:24 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE7plw1973408
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 14:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WqxH1zDa0UM90FIlcAZOeYgVcW9oIh+YtN03t/bfm5A=; b=MsCNE9vSa5V3v0T9
	TOh0LvhG/ngqx7nbQ/VvRAqiPY3pwCGdJTulrwpFROazkDyqkzyxUDiED9tyqZ+y
	n+8QI/OcSnJq2dK6Pca9KcHGnPdsOAAjw9o6Z/Txt+Gpv2OG2X+UOB+luWz2Cegs
	LW5PvQLMtKAL6qvqzCpYsNPm239q9d2FrHBZe9clnkvRn++bnOpZjnOwAAdrUcHU
	vDDP2m6dkTbHxcQK8qyfLynvyZ/5dpOZFrRfuWKEFfT9sq5DVC7VICg6T27nm0eF
	wMftm7oQAIebMugVWdRBjRfzanC3WqUgE9PiQ2x5o+DArmArvSmLAIX2lru0XhGu
	5iuw9Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff2f2vpwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 14:46:21 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8eb8914e651so93635596d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 07:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784299581; x=1784904381; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WqxH1zDa0UM90FIlcAZOeYgVcW9oIh+YtN03t/bfm5A=;
        b=GPV1vJ7vKxf+Dp+VBhhluWi3QAQYlipVFMkWJknV9AGdyhB7CeHGm4u4Ka+YgGhMBX
         CylT8uDRG5uJzhAqJdCBJ7x3+5lENKUWEXWwZKqUv5tXKBEi6YZ22joVF/ukhEGm9C2k
         DdC0UOuQd9JsiZpYLmI+Tbau8Ys0EIQOpylzBzyWLRUI42HT6PY8Tz7tL1bZSuHnjeXB
         HtSEE7d0tiw+wu/1xSYELMu6lmjg4VE5UAOCHsDiYHn2UFPh83TEiyiJD9180WgZE8q8
         EXVRYYR+MnpuovlIoDDk9GjyIb/g8LLqWtf6LXDtqrhh3mm4AWJw1QX35t6ndX5xkYtB
         KUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784299581; x=1784904381;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WqxH1zDa0UM90FIlcAZOeYgVcW9oIh+YtN03t/bfm5A=;
        b=RLF5Mu5TnxWJsxtGIcMA46JFEcbvil/u2lYv98HomNAlS1N/+vDG6or5ezYIiqH9Hz
         DnkgTPIzNro4HQSNv5XydN8bS5B7UkpKG58V0JwTipWUCOxkCOICFZg3x8gtNoXMJY/3
         rRrSrdg177MPMze+W3U9BrbMpTWWS/i28aKD1OableJFUScx/x0vqSSm4aIRYQAS9MYk
         a1xIeV5PfTVbrN7BWd4Vxp15cxr0Xpm3u+PJIvqvi3qWkz3Eouuc18zbl72EZAWRFcEb
         lLSTg2eGUNMuILIoh9zzPDe38us4RDNBvMrmrh3O8H9twNx3B6WJ/zZwDRaZt3cUWUch
         czkg==
X-Forwarded-Encrypted: i=1; AHgh+Rr1MyZqNYlxXTAAw5KOk35slZqBcRlOBNJkP1mudB/oPJsmS517rTECtq8UFQYkKzFbxMDwExSDCdHyEBOludFX@lists.infradead.org
X-Gm-Message-State: AOJu0YzBBY5/kQVElt+h8s7VKGZby1KtagQqEvNeT/17bnzbilJM45vg
	xaRQG2JTjGaVVqVz0i9swWEj2mHs8MeJk45soK6q4nuYEiXITP7uNw2yEpEN14Y/4v06xxQ/PCS
	xB1Sqx7MJDbrgifDbunODH0a14wNzauljtLYS24QccSTrOuJKQU3i+P5bF2pMIceFZPmmgi+vOs
	IC8Q==
X-Gm-Gg: AfdE7cl44G14Ji1i/EgqT1a2JtJA0M6Gvl0owxOgy5/93TFHmBEuWcGNQ0qO85wAgyE
	aBZRB5RHU9HL0GS7dZCmJaMf/nSUxWxcDIYs7b7Tg7BuEJThdJl7yMYgNfCpMhIcPYvSIJg56uu
	0ooPODOBeHY5VyCaYxv0REEpcNuC2wzA6NYVfwGt6x+NZ8CmU9tkerfrZDWWzNII1CEWDGMWrfY
	0vMSqCgTS8uqJEImdHPc2hB+NqdlcfqA8eSfpTlu05tLUqwEYjYvAurrjRd2B1bAuuHTxu1hg2J
	38wlRHae/mTF5rUmsPoL8dbNm0V+Jdi35LGOUr+NBoqhRgHJLk1yYWUTcHq0t9XH7C+A0KcxXuR
	XkdV7pVdTSjTG946TCblk6v4TpYA=
X-Received: by 2002:ac8:5d88:0:b0:51b:eb55:2916 with SMTP id d75a77b69052e-5213dba36cemr24143991cf.34.1784299581262;
        Fri, 17 Jul 2026 07:46:21 -0700 (PDT)
X-Received: by 2002:ac8:5d88:0:b0:51b:eb55:2916 with SMTP id d75a77b69052e-5213dba36cemr24143621cf.34.1784299580715;
        Fri, 17 Jul 2026 07:46:20 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52149a3ce4fsm13414801cf.0.2026.07.17.07.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:46:20 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Alex Williamson <alex@shazbot.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 1/6] iommu/qcom: Fix inverted fault report check in qcom_iommu_fault()
Date: Fri, 17 Jul 2026 20:16:03 +0530
Message-ID: <20260717144608.3216274-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260717144608.3216274-1-mukesh.ojha@oss.qualcomm.com>
References: <20260717144608.3216274-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bT7xKIhUeKXoaekLWuAJKfQe4HUyUz_L
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE1MCBTYWx0ZWRfX1m703FUSxazu
 asrkWkHYmtorc1cFj9MYiU824ke2Q+V7f2EwAOZczUUezPVZnVqUGAfI6pwuC54Uly5C777/YKU
 ErQWUZPDLi7Z+xg+ICaSZoMpOeKyUQw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE1MCBTYWx0ZWRfX4NsqE1GQytqZ
 OT+6zt/7mIDHCPRJhaL/hqJiGvxY12L+l5t7VyAFoesLkJChydKSmcyXg2EUJgAEj8zgvRnuXUw
 +rqP6QTvEbhIOvEXtkDjWP8WybnWmqj0ueG1X+hmawfQbd2mbPmaV3x8I3lLTf4Z1ZHBOtiC4li
 hIUcM0NSSNuBtiyp4xtItf2GMsngGauG8R05m+cSxRxE0o2djGYe0j5P5dvNcu9kNa8NwJbUImw
 RcPf3S11Sgbt7trLgNkJSt7mhg+iIgnHTFWzaAXAIXQvBIea2D8N5E3XvF85fw49pAVTmR3CmL6
 qxKpJsCsJ7h/0ii00cVHNjgaH/1eEbPycwjnvqdxai/arwAviiewuIu9TKJe569zzPJ0xxZ4hGv
 zj1N+EMDNFHPrv36G8NbEfYFR8PTlnQwnWnKwLl0H/zHtKWKiT7v45rFvSgfF2Wd/Q1LBxcaUx0
 yHt/wtFPJuf6bkpqQnQ==
X-Authority-Analysis: v=2.4 cv=NcTWEWD4 c=1 sm=1 tr=0 ts=6a5a403d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=xmDQi4VeJV1Yj6r8B4kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: bT7xKIhUeKXoaekLWuAJKfQe4HUyUz_L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_074623_159686_AA775A0C 
X-CRM114-Status: GOOD (  15.84  )
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

report_iommu_fault() returns 0 when a fault handler successfully handles
the fault, and -ENOSYS when no handler is installed. The condition
'!report_iommu_fault()' evaluates to true (printing "Unhandled context
fault") precisely when the fault *was* handled, and stays silent when no
handler is present — the opposite of what is intended.

Remove the '!' so the driver logs unhandled faults correctly.

Fixes: 049541e178d5 ("iommu: qcom: wire up fault handler")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 32efef69e72d..09f2ee6be988 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -200,7 +200,7 @@ static irqreturn_t qcom_iommu_fault(int irq, void *dev)
 	fsynr = iommu_readl(ctx, ARM_SMMU_CB_FSYNR0);
 	iova = iommu_readq(ctx, ARM_SMMU_CB_FAR);
 
-	if (!report_iommu_fault(ctx->domain, ctx->dev, iova, 0)) {
+	if (report_iommu_fault(ctx->domain, ctx->dev, iova, 0)) {
 		dev_err_ratelimited(ctx->dev,
 				    "Unhandled context fault: fsr=0x%x, "
 				    "iova=0x%016llx, fsynr=0x%x, cb=%d\n",
-- 
2.53.0


