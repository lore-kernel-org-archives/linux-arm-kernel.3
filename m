Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394A7CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 12:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1v/ynnXiKbGlgjlxO+YjIk/mxVwZxy5oog6I7VHwP2E=; b=BD2C+uawlvohPeTcQhX1d31eCQ
	9xd0mxU9RT70IiMU5HNW9FeiGS8yWs+09+wLaoTUZepUu8wQAgWdOXNkHuv3JSY8xuCBXKYDbIPin
	Q1fPFAXXiHXItiQyXBSgowKZ68OvC8BA2ytRartg6QLGoeYCWWUzdE/sLLos6eSBaKU07h5WvcQ1u
	DltaaUsY8E8Ftg7VPJ759Id/8cKn4iWbPkPJ4YT/XWUGkujz+XPJ3YT++UD8dV1hnU3LBpNuym7s6
	M9aPjoqxZX+nsmqJWAo0CUcSJeNyMx/as5he0mm7GQWDrIi+z2rMrHqxmc8hjnJfRLKVSlLGFsDSt
	Kqoq4yAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc07m-00000006FZh-3p5J;
	Tue, 23 Jun 2026 12:21:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc07k-00000006FZD-3AfD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 12:21:05 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NC6fT23744627
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 12:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1v/ynnXiKbGlgjlxO+YjIk/mxVwZxy5oog6I7VHwP2E=; b=F6m/yzxYQAhVEdPX
	K0AGg49/6psv5sZDCQlGnknWglUmWHw4CbQ8TXmzKKKbRvPyMOFsVWF6mrBBY6/d
	R3GonF9jFoa53XKMe660gYN8KfuT/Q50oltNwzBClRuQrZZkJKDl/EDOP1Cz52Jl
	GKD0RCTgkUgLxDwKKCYiT+A1+Y4qv6+IEbd9k+hPfsYOpNf0t9n7JjqJ0lvm+6cR
	M34lnTevTc3K6fjlfobSCtM81Mwz6IOCGe2gxPhy7WhENsCMmu+JnAOTLTCF8TKc
	Wyx1ctLGT38NrTmFPo0RsICNSQ6xrJ1v6IoRMwUe7fbjUmguEP+lax1sYf3btG0Q
	VnxXHw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eysv3g1g1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 12:21:04 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8453031c57cso7839302b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 05:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782217263; x=1782822063; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1v/ynnXiKbGlgjlxO+YjIk/mxVwZxy5oog6I7VHwP2E=;
        b=ax2lBHPQE6UuMOnj+jJI+lx5/K8+fTkjY/HeHo8+iprH/SauL5fgNW0e3IAtSDV2UV
         kTj7serBE4jKA45fVpHJvwcIp4WxDJ/+22t2+9X0Gk+A8rZp6r9DOe4oJeUiaXJPSg6O
         ymok0M/hZnqMlxqxFvzxBGU4dCfVAPRVNLvCug01Sf3tEdrWVaGNHcd0YtF0ic1rTP3+
         yx6d59Bk5cIPocQ7fxaQOtkWLYqUySwTdzmyt5Y+OP7VEh1n0l4QNpBWUhcoA4AFkb4u
         UhrnTaxdnc/5617/b3sL84MaIiQaPkp6Xvelj4UJWhWKPrgEILh91RGiAab+eQNpIKAs
         n14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782217263; x=1782822063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1v/ynnXiKbGlgjlxO+YjIk/mxVwZxy5oog6I7VHwP2E=;
        b=VNqlwDEUq9mhgpUu3zPN1Jmq3MgGT7q+Ev0aC/Jz0us3gVWDOWCWhW/7rbDkbPbacU
         iJT3FXz6g0d80m6vC986mLU4ggyqbvgzoGJ1+E4u9AZsh+7AwtMz8iXmUycudAxE7J8w
         Uq6YiiMyFAup50FrJapV0unr7bUo0EIdCeblM0krZGZfC7XMw8afmg/ZLDOb9I1HPd1N
         hqiJV/zIdE3NkCb2rR+tHktwyWsUmyRDolkHNkONaJh9hORXaQx4Tp4IWWdHzz1hu0fY
         +BkbSKXtcVYpY0J0qcqE+0kr2QGyc9/uA0UwRVU1F8rDZSH/7mc5rCOiEPcWPHnc3uPs
         PIsQ==
X-Forwarded-Encrypted: i=1; AFNElJ+3bvwke8WXgcqMO0r6K5yvtNX/Q6VRB9EkoGUTfK2mh0hLfVWxogSJ7V+r+/hnJIG6Dazl6SB16af+onjkvYLF@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr0BvflrBZxE1sOBCJrvOjcnV/rrIuq8vy8maW6JD/Oa2/g81Z
	SGzhIy6XgwKIAJ/SlxBrtId+srZB54U2xVWxwT+YrjshPxANGsG9jQXmNTPTLitku47RO9FLFLI
	636UFe+Wbd7jxPDoGJxDeo/S5kRZ0Xf/psVxHVZkL83zbYXJUmchs2ryaivh+nTNttCbZpCspBt
	0bzA==
X-Gm-Gg: AfdE7ckm9eW33ZutNk1ULbCK1nX8f3WwK1wEqEuAiJI82K7JTGaG6ETdcc0zZO2xiWA
	31u6QuucHUx7U+pGACAQz9MJBm8faq26cokT1ixAVABAF0PEzZ27QNFNNjG1UAOGA94uAj6U8Iz
	S32YptpZS5YhdNSDp/ixDuMrmk6O3K2ziTVv2uMCVrnzg4zF/oNOdLkEa87XG0NF7oih7HY/XMr
	lO1MpqOQ4MFt+mZ6kDRR9Dq2XRL2EmZr2qKjGSFU9e/CQbO86Q75tTL975DvWeEx2/frCsSINLA
	5dQXGj7Gj7P1EEHljIXmQb3SMU920VtRJilAPLoNfp699bOPBI+g8m0EDqrdD+X89AkKa5DBlnd
	pivZzXFD7mim/E2vzAvXxieBB4BnwM2X6DcXOew==
X-Received: by 2002:a05:6a00:c8b:b0:842:5da3:9b8c with SMTP id d2e1a72fcca58-845970e08d1mr2741604b3a.36.1782217263423;
        Tue, 23 Jun 2026 05:21:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:c8b:b0:842:5da3:9b8c with SMTP id d2e1a72fcca58-845970e08d1mr2741555b3a.36.1782217262806;
        Tue, 23 Jun 2026 05:21:02 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564e74646sm10171856b3a.29.2026.06.23.05.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 05:21:02 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 1/8] iommu/qcom: Fix inverted fault report check in qcom_iommu_fault()
Date: Tue, 23 Jun 2026 17:50:27 +0530
Message-ID: <20260623122034.1166295-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
References: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfX3SD/jKXaDOaG
 gMnFw2+eSQuk9A8vpWxnPERSiK2EviTlgHgMnV2ofbafth/kJ3HP+GdziibMpaNnGX3Bsk+KZnH
 +R1vsO3Qwl64z5ujydl2zBJCukotLWU=
X-Authority-Analysis: v=2.4 cv=WtAb99fv c=1 sm=1 tr=0 ts=6a3a7a30 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=xmDQi4VeJV1Yj6r8B4kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: srVq5J1Nd145f6O83coYNNExXpzEeEMa
X-Proofpoint-GUID: srVq5J1Nd145f6O83coYNNExXpzEeEMa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfX3rIfFaMPHscy
 WVBMB138fR7lI/P1LzfjM6tiECO5NA3C+LXj16a4pZHfz8eq9F12EPAHPicyRA1kVwbok0PxuW9
 cT+Vpz/gM5y35jDGeblmhcygVviOOfYSyH65l8vxhWFWssKwE0x5M/el1v1wgYzQlK28pQV1MA8
 nGFdKk4dgF61DJKV7jooueDUmO0+Ho9HfgPdiX+8I2Wj1LKGOA6hH1n7NZ8jL4NxsEUeWXOCw4c
 Bno+k5v8v/XJ3+Z1wJ1JHC4MSEYQmBkj2XM0cNWG4I0TavtEK7Bnbris8rocdlcLKyIw8+eMfLv
 v6bStR/OhCW4FlEbz3CIzG3fBg0wy+44b2A0y5hflgM2jVPqAv3pOvD1SDVr32go0CUIzoSAOnF
 26yRZYZ/BlevwivELgauOCxZbOUhkM4WsZuynORaDsJUbzAxE9JowsTYnRUBWFn5elz4WqsIMSW
 U7hfK7UKGOvICcHJyNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_052104_805472_684F93CB 
X-CRM114-Status: GOOD (  15.59  )
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


