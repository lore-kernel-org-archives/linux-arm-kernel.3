Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF9CC4451B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 14:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4z0ymWVrqeqo9gDHe0QR+vDogR/CFdnt/t7HVorr9fc=; b=4xyNOD/GRfS5XCBz14hp6j8GFH
	5oaV7Q/KR5KXcnzEyOucnAhnq4BheAEtt16PyqLxF4qcn7I2thCvoLgjtVd52ydmIUvWMFE6z8+uV
	4q+EAgVkGSFhFWNwxDJj2V0fAV8zXDAm1aEBUl31WyxVppvjvuyM/9hQN1RF+j/YIwtaomM4v5G51
	M1P8XGdJqv1aBJBAOwJSZualMARHZEtgvfMN0HxiCXMrpgXZatq9S89JL/J4DQV/yJnN8iX8NHye2
	ioppXjdZGBzffdyFpTf65DfNgY0axX7B/FdJ1H2Sl/o2OdxF31ZdxqojeJfRDlIZgq7WY8jspCyX2
	YdrlCf1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkjq1-00000002WKH-0RCd;
	Fri, 17 Jul 2026 14:46:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkjpu-00000002WD9-3cbD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 14:46:48 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE7l5Q1973369
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 14:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4z0ymWVrqeq
	o9gDHe0QR+vDogR/CFdnt/t7HVorr9fc=; b=QFmBSEvm/dWDDiIafCacepPcjO0
	Dzs5trvnUgoOOYLlOjQ5KmnXdYre9sG7etR3hQoYxjj/FB2zfRkVOj0QTb5kzP/3
	q+b0MqRlnlJiW7yJoC32vUe6nkxaQmAea9WN3ZdhpPyyYCcH9FB5DxQkOuLUdUhu
	vicC7ZfWrUov00yCEEZeJgaQuchyy9Y1pmyv8y+CWUvvFstdrpFRr32jKCuL3EwG
	+7d5wgGh6c/lFUmmhd9GbvMX9vhpC/xWiWoYVEoS6zKe/bQLc/V4EplFu58sZAnc
	D4Tu2pLRh66HzgHJCoy5NbCWWFNXLFahfY2+Rd4iTi1YGXXtLQ4ibwZBUXA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff2f2vq0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 14:46:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bf321d786so61966731cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 07:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784299605; x=1784904405; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4z0ymWVrqeqo9gDHe0QR+vDogR/CFdnt/t7HVorr9fc=;
        b=YaM35D9OToQPtlrBQnqISV6313aV5nobtb09qru+MPaXP81g1/A6nYXZqDYkp+sFR9
         naUQHXIiC7wdQGVeYJkICrwNOqbsQSUqHiuiOQqfSNJfLxAZuIeZZUM7R4PCRkL2eF6f
         pwBpzQhzlGmWqe5YjokFXkVT6LnpRBkgavCqGJjmMzpRJetytgDYJNxS81AL8zlxgwVd
         BexQGawCmfqXdkvvBtyHO9pu/sThiqqaFGrgkrAoppQueNyBhLIY2j1VmtJl4ZdOXFFD
         ZEFWdCNyN9Pl2ytui3Sqll6tuBnP6IZT+KZkQzMIO6udhSe8EcWeCmXFj3334dTkdhUP
         CV+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784299605; x=1784904405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4z0ymWVrqeqo9gDHe0QR+vDogR/CFdnt/t7HVorr9fc=;
        b=QWIAz0lkBrqFS9jUDmdiOda/UFRkR3LjyN+1sGO8lfGxLUyIg5BmP3tPHOQnPLkOyI
         d3xXkp+PJUTUSN84i0JcK41g/fGfm912cQE9NUXfkt8UNfk/VsBRa5WsLeoSaMPPjdN5
         0ShDMfZ4vdC1fmjQwQ6dcuaYP6t2yXZmrUzsH66BpQHdOtrMQ7g+zPwpUNBQ1iaXrYvX
         5eMmExZScqExQ/mBWlf0HyhAkKm9QH6WRDZiCn7aWZuh/ON6e0DycNKGaqy7do+lLnDU
         nZs2BKznTDYIw7co6Vn5QU2OUFDzc027u9YnVrtQy+itm2RHHCU+DdKOv9ISkfKD9+DM
         Uh5A==
X-Forwarded-Encrypted: i=1; AHgh+RqW1/1InDRxQq1JaL2uSQVE/RtK6U1OY9GKplmyKKgVcSNyNalNflCVmNi9NA+0saMSS0vhZtEZVbCbYiaU8yGL@lists.infradead.org
X-Gm-Message-State: AOJu0YzXSN7wfE1OgIoVbjqO+Rpj5EfrmDF1H9EO4Hy73p1sBfsbmnPJ
	Z7OxwcMU2fmWGJco0bRVxbqlmHkYemJj9GF8aKZn59tlssFW1QPO1JQv4R0I6KwivMV2KU6JEUu
	R+aOTjCIsTNvbVPcRpwdZmUWRBeuBzi0VKsSVoNTJzvrKLeFS2g8GGvw8raiu94nXrbtm0uGq8h
	mFgA==
X-Gm-Gg: AfdE7cmBIoqgIdKPKajikGyHWppDipOmpB5spuXsQfR6rGxDa+vxtzXqjnXgy4OrQNq
	tZHg2wRzMaPu61vp4b5Zwnp0a5f5hdieqF6cCLELl+RNz/P6CfIdxncx5FVIakyv9a0KCF80XB+
	BQb2i8QidCiAfeFY9KQJhGdGrFMnE370Jj8RYrsLmSPcKGHDexCslM8mzsF1wGnePLE+NJjlav/
	i4ELMwuiqYll+mZ2Tv6x73cPxfPYK7Jks//BjLliYjwZty4qiFsR5cUid4dm8FyttqmPoisXeLK
	2dAHBPHv0jedtP+msv5MDozBA1Zn+RYAxsdzmhqG6eEgDySHrEYoJPK5imD4Pir8et7c+HZ+4sb
	jnE6q9nnqoJk9M0DmquKotbOo/9E=
X-Received: by 2002:a05:622a:2b0f:b0:51c:19a3:4ec with SMTP id d75a77b69052e-5213eb7f5e1mr27613701cf.69.1784299604993;
        Fri, 17 Jul 2026 07:46:44 -0700 (PDT)
X-Received: by 2002:a05:622a:2b0f:b0:51c:19a3:4ec with SMTP id d75a77b69052e-5213eb7f5e1mr27613171cf.69.1784299604436;
        Fri, 17 Jul 2026 07:46:44 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52149a3ce4fsm13414801cf.0.2026.07.17.07.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:46:44 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Alex Williamson <alex@shazbot.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 6/6] iommu/qcom: Enable clocks before hardware access in qcom_iommu_ctx_probe()
Date: Fri, 17 Jul 2026 20:16:08 +0530
Message-ID: <20260717144608.3216274-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260717144608.3216274-1-mukesh.ojha@oss.qualcomm.com>
References: <20260717144608.3216274-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4M8MvRlfu2WGxmTneyLy601nSlP4Khgz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE1MCBTYWx0ZWRfX1Fe7FP+/d00e
 HD5qL1fWHibY5ODtrS3eKZb6GJM6R6VjG/dObKYpj+EroXmsDgAxmjuCq8F+eh2SIDIxfFUGQMe
 +Pe4XCZ8LXvbK3olnRTIW8Q4TNkOEWY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE1MCBTYWx0ZWRfX9NKi+EuI4MhE
 +eDAWmaewK3QshX1dIMGijLTkGBMvx9xqrBFEaLaV1u1cxNmzKgOKMytwqVKXeWKGIKztrU55zr
 HSRoDmQy0cZUoE2/0pCfoSqLz6G7O6wi0XV9HkBEmJ0jU8HK7j5AC4Rpv5aLznfmdo6iovpl69n
 O5ip1mFyJNohNBZS5Q+QGin3y1pIWJjuBQX2L3u95cNf+JQJ5AEUi1+Ft0NKAN+TSUHDUWhvsro
 L+rp6Fbngm+4PYW7Gx0g9zCpOThUkGMZwkQEton9ZPuChRwEtO/l78aN1JYqs1+pWrw43OwqjR/
 iZkwNa/B/KW6pZFIGaJb+gpuAv9Z/dLIC2p11gUzHt0VW0FKS9R3zYiTcwImFGFCNw39VyQw6kj
 JBfB90u3sk2cMOgf7Tb3tXM/qziS2ZSA3FRuFBooEzhOhSC6OM3yxc+d3UvGjqi+wEQPWN5fIJH
 C72DFwNaWVBRxSV0nog==
X-Authority-Analysis: v=2.4 cv=NcTWEWD4 c=1 sm=1 tr=0 ts=6a5a4055 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=8cASqgOsboiLGU4YZykA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 4M8MvRlfu2WGxmTneyLy601nSlP4Khgz
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
X-CRM114-CacheID: sfid-20260717_074647_024654_38E16BC6 
X-CRM114-Status: GOOD (  16.89  )
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

qcom_iommu_ctx_probe() reads and writes the CB_FSR register to clear any
stale IRQ left by the bootloader. This happens during
devm_of_platform_populate() which is called from the parent device's
probe before any pm_runtime_get(). The parent's clocks (iface, bus, tbu)
are therefore not guaranteed to be on, making the register access
unreliable on rebind or after a suspend cycle.

Use pm_runtime_resume_and_get() on the parent device to ensure clocks
are enabled before the register access, and release the reference
immediately after.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index ecde5ca2d476..5a9f8b39a99c 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -704,8 +704,13 @@ static int qcom_iommu_ctx_probe(struct platform_device *pdev)
 	/* clear IRQs before registering fault handler, just in case the
 	 * boot-loader left us a surprise:
 	 */
-	if (!ctx->secured_ctx)
+	if (!ctx->secured_ctx) {
+		ret = pm_runtime_resume_and_get(dev->parent);
+		if (ret)
+			return ret;
 		iommu_writel(ctx, ARM_SMMU_CB_FSR, iommu_readl(ctx, ARM_SMMU_CB_FSR));
+		pm_runtime_put_sync(dev->parent);
+	}
 
 	ret = devm_request_irq(dev, irq,
 			       qcom_iommu_fault,
-- 
2.53.0


