Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC347C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 14:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZDrBspdOlaSi5AteoQZ2h1DwLsN0BlKCwWO7NZ1k6s0=; b=S9croFtLKn1ql3DixzdKvmfMeZ
	B1zxXpC3mWKO0Z5Vcs0FvTFLsePc86LpovRDv0EgZIvPzG/NjeqHErLfBcH0Pd28axoSamCtb0jyl
	M9rr7HaL2oP0+u8BR4IO5ZHmNI/pHjPngnD2FReb8yHeny0KWi6okQGQETL7wBmVwQHwSZikKZnwp
	FijmJAlAYHDkgwUC6b9Imv6XqQ2puN6U+ZLYxl1+V/VNwkTHOBPy4pXlNr9e+qcxPAyY+i+A2TTOb
	3RDuYfqpxeFwlbGULV9txCLsLL2N9lRPMScaR6UCV2rPlt57SmvzJCpI+QpNnOOl6T0eSiRkCpndU
	JBCWe0xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkjpq-00000002W9i-22j7;
	Fri, 17 Jul 2026 14:46:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkjpk-00000002W58-2nM2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 14:46:37 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE8DUO1839359
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 14:46:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZDrBspdOlaS
	i5AteoQZ2h1DwLsN0BlKCwWO7NZ1k6s0=; b=WJSKGLFbMyVOizPVAe1QCbntT19
	MjaP6YIp8+oldMH7QRfinWFpZeO05GYQUbmU9+heMGeJ4d6pK0yeOqC7TuFnB6Aq
	zZ5zBDaBLNnq3twuKzsduuqU11NVKvjSxrYINKLEmULA1XKihKqDOu9yvElFj9hx
	etdeG9h5ilAmb6WLNnANz1Shvp+nq3JAlZuiVoViWvNaqacmH4Ii0PAc7jXhXtTo
	M0MYtllxR8wnvNXMqxiwt/r+7bBx9MJ5ceUPXSYqEWAFkYgwZ51FQCRb4zhFbZU5
	fyRF7vNP5AUboPZWtpvbhBkg5REbUQX7Q/eSUrTt5euAICRC2ApqkzU5zqA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fffag9rgf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 14:46:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c26012cd0so136446991cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 07:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784299595; x=1784904395; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZDrBspdOlaSi5AteoQZ2h1DwLsN0BlKCwWO7NZ1k6s0=;
        b=NueoeMEAFUNXa0DwQdxBPMBq4Ek5+N72tkGbasIy0GgAbMUrkcCJjPOC4jjyIdilPF
         uhJlA/2Snz32evFPUavfhz30Bi5Dv1BnZDznDmmj5J5PcnZiNl42x96Zkvlc7Yn1m16E
         Cv9h2o2+GZw0I4NqZ6lVp5mBJhG8Mp6/aya5zupJnmuZ807tXrhRvMLULtwsXeMxg3ym
         Jv4lCG06P715BAsK5ksoZidwzws78P1pGNXyuvvLi4y4bIfGCbh8H6k0pck5O/9tPwOe
         YIDdT/LcDQRy5GdisY/e8FX1nE7Do7y5SITn2dfy1c3t0U1sR62LgaL2hOd/+SEsrN6j
         BfOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784299595; x=1784904395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZDrBspdOlaSi5AteoQZ2h1DwLsN0BlKCwWO7NZ1k6s0=;
        b=H2M6DyguJFhVy97BjMmfzP27mtpk901bZ1PPQP+5xpOyxLx/+ERriMNa1BHdRdTN0G
         Qt/9Cd+6aB2mDUsMGAb5KM8t1Gdadyg/wXDbXloIEN5JoffhicWEryCULwE8jWnX+tc2
         W0a3wBZtKJTIqbujQy4/gaaYYFYYxMYwdMlf0zIoCpNANNwniqnq2bMJJg/fpWcMRCIY
         Xfp/d3QnQMn0czwIwXDqC+/mvZsbGnJp3XPYuxXX4Ubt+KVxLwGXv5Dm/P5rMHDY0lyf
         W4ASSvmjcwpJS7dlpcaeBVJolwiBt2d49Ort4PiSk4NGiCqaUa2jLE9CaufMpwetBf4R
         Laag==
X-Forwarded-Encrypted: i=1; AHgh+Rr2tMnh4tBtr6UG+DrzZ1kk5Eqhk1jPtKaJ9mg/gutJE166i1k2alZzysIfnl1K/D/pDTWRkK2500VrrxFSqXUu@lists.infradead.org
X-Gm-Message-State: AOJu0YxYZEov1YObnuGuX3xVXUNT7u/uKbjKaE9kXy+g/rMKIjsvtBTW
	xDezRe/gtGyvPqLnea0Tkd/98tOa8YHNSX2j/thAJ7JJNWl7K9ptqDZLWkrFtrjsLWJ7cLnFZMj
	YTXlfPwzcmDmhNyomn9GNBqb9KW5x2SwgB8P8xZ3hrE/IvcJauL4j1d5ssldOYN6iX8WMAD29ll
	RhvA==
X-Gm-Gg: AfdE7cmwjD49GTlAadVOjk+4P+Nx/DyOF0ZX9Jin/jkDMHsmXpxB9g+rc+m/dePUEdE
	9slvETAeN114UxPjlCkBxuTA5JllVIycJu1lNk344a2qdzN3nh98LLjKur5nbXK4I5OOVzMF6AE
	p5xaktQJyyksZUgfcUzzpk3jW7++NlBaOoZzJOVtQpcEKTf8e+NkNqUDCj1GtFJsobhn3PyyN9r
	GUq+xlkW8+8so/gMo+8Vt+k+K35PVGJ+LfPRPKCLEuU0sNKCIBqb5G67yADFwVakn/lJ5GOYg9Z
	Ntf847z5Bppk4Opa/Nl3OgNuSSzkwyIA7BT5Hva07uVh7jaFagf5bfeW74tutsivkzXYTBr3o/P
	qV2sgfiw5f57fSICSAobt8EveQqA=
X-Received: by 2002:ac8:7d0c:0:b0:51c:94f:8ce with SMTP id d75a77b69052e-5213c201a70mr26554841cf.34.1784299595059;
        Fri, 17 Jul 2026 07:46:35 -0700 (PDT)
X-Received: by 2002:ac8:7d0c:0:b0:51c:94f:8ce with SMTP id d75a77b69052e-5213c201a70mr26554441cf.34.1784299594533;
        Fri, 17 Jul 2026 07:46:34 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52149a3ce4fsm13414801cf.0.2026.07.17.07.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:46:34 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Alex Williamson <alex@shazbot.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 4/6] iommu/qcom: Fix pgtbl_ops leak in qcom_iommu_init_domain() error path
Date: Fri, 17 Jul 2026 20:16:06 +0530
Message-ID: <20260717144608.3216274-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260717144608.3216274-1-mukesh.ojha@oss.qualcomm.com>
References: <20260717144608.3216274-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE1MCBTYWx0ZWRfX/do7iRgSsCNJ
 XSGEt0vJQWHQNrJHe6HbA/DugsUIN2EBGc7GKVvFlnBvPgMZuRWvie5KOUPZ0LhBr18Uv4nZX/W
 SnLycHrfz9pxrPReznOkwkma7x8EvLlrkAv7ftbevooBkKdOEK8EqG7ZzBdmBd0yxeb8qwG/25d
 WGx++rxWdZRm8yrnCVOC4LkxqsDtLSWkfE8HY+Yp9CBYH+C9N7D3eWPneoZQHUfymPrJKs+yI+q
 zMhba6G6hbgVZJdCmfAABA/EAMKf/U/6oP7fZ9ThBvc4gxt1UMUxx/00wG9hBuMEw50dKNvPbFB
 6/RpYtxf5B1EJjNzVn3GJR3mr5O1vj3ayhkwO0vgvjsWu1g655EWyw9rHDnk39BZewTuE0SSCk6
 F2vup3wvH5XwL+wv8LEG49LuQktQLVR1R8Qd5c2vLfbJwzCH84vya/kt2dPXTOSxzFdJfTs96sL
 VrDJODgq02OEwYVk7kQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE1MCBTYWx0ZWRfXw8KVwZeiAg4K
 9GfeRcfk6asN2DLynX1mIHuF77W/QB7IFurJEK8JLZqwk2MXWRTCAMtNQnKvyG+XtQg+pvM3H3Y
 6GcHpt2fZMFRgOr7vOnODUhdTd+B8Es=
X-Authority-Analysis: v=2.4 cv=KZfidwYD c=1 sm=1 tr=0 ts=6a5a404c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=pv9nQ82OMFi3fEhVMZYA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: Ipx__dcw6G-7fpgsYISeSpx3lmTZhXpR
X-Proofpoint-ORIG-GUID: Ipx__dcw6G-7fpgsYISeSpx3lmTZhXpR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_074636_713389_FA5649F9 
X-CRM114-Status: GOOD (  13.08  )
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

alloc_io_pgtable_ops() can succeed and then qcom_scm_restore_sec_cfg()
can fail for one of the context banks. The goto out_clear_iommu path
only cleared qcom_domain->iommu; the locally allocated pgtbl_ops was
never freed, leaking it permanently since qcom_domain->pgtbl_ops is only
assigned on the success path.

free_io_pgtable_ops() safely handles a NULL argument (covers the case
where alloc_io_pgtable_ops() itself failed), so add it unconditionally in
the out_clear_iommu handler.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 1d04f0a19124..222bb7febd03 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -314,6 +314,7 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 	return 0;
 
 out_clear_iommu:
+	free_io_pgtable_ops(pgtbl_ops);
 	qcom_domain->iommu = NULL;
 out_unlock:
 	mutex_unlock(&qcom_domain->init_mutex);
-- 
2.53.0


