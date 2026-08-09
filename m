Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F252EC5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 20:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iNPk9I4Upyn1iuvNFg1ZZoqQjoBVK1nqXfEtDMUZc8A=; b=DhnpZOkrRRhBKZQNQACmTZYUNA
	cyDumi+uLN+Xbe6RPl4GlQpI+xv1m0/QJwvOnK6aHSjnu87ijfRLsXiYHqCPY0MAH68L95VCgRtml
	t/pbW1coidwHEl2xahnFyoYZtJOo2lj6a9UaIWtja9TTjZmJw/9sCP+j0jn3kFjwA6671BCa0ohi2
	DQCl4OQWEwla+7B7WyrxBuSZfQn+w3cbp0EriGlaVEAQgq/8Jpq4rTbdk0S2BA4pJnkqRXM7Iok1+
	i3zL7wU97f6DA1xP7Cak8Wd2kB1CxQtqOgV5s9y25pDul2jHfZkbrqx7sgw9oqqEM/NA3YSMGDdiP
	FFHxMCUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt9wT-0000000AeT4-25wy;
	Sun, 09 Aug 2026 20:16:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt9wL-0000000AeIb-3bQ3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 20:16:15 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679I915M3076397
	for <linux-arm-kernel@lists.infradead.org>; Sun, 9 Aug 2026 20:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iNPk9I4Upyn1iuvNFg1ZZoqQjoBVK1nqXfEtDMUZc8A=; b=irpKRk8R9ejJ0k7F
	W7uQs76hjB+J63bTajkby5HIL0fF9bzl6ZM2AHKQKsamwZBOO2i8EOd0YF+aFUqb
	bMF9ImOINAOhJksg1AeXDa12ldb1pYp0nTZ7cRX9w9p65/hyPRGw4fNKn03wbjrQ
	4AAV5L59BOFA3k2qxmNQeyjkEkG//yJkEkhSS7J/IeLKa7vO8be9rvtJdWF0xZ5G
	P4alCOWr2dTIrH2vy7brxybAlW48CW2deVBL3z9zAjSgtiB6DNaYYI8yVzKKsknz
	KiBkzWqSBdJf8d5ZJnGlhR44/zRB/gXigIjch4kTb+KnwzrehKu1tEprK9BofpNw
	BlR9bQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwwr9kbq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 20:16:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c01ff996dso17387441cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 13:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786306572; x=1786911372; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNPk9I4Upyn1iuvNFg1ZZoqQjoBVK1nqXfEtDMUZc8A=;
        b=jebw9GWzn10/YHy42W0FCxKk56tI7wl6AzsbmldquAgHzjxWTnGcijI/iiYziegR+O
         vlmioVa9AdRvFsVBvuCtQcBrJZ79uFrgg2ttkZt7P/rvn8nDkEWuOgXIJ38v/yxjoSM+
         kSRXQioHrLX5Ck1rIo0sntoQoa6Igi2iOJB+a6lJ7hxfEnOWzzGCBC+2tkBKucX8IIY4
         n1C2OWFLtNKnCV2v7cuPe7NDNx68c4ZMoSl3chD1yZwFtmsYmd/OoCTOZKGNbFF/I8gB
         N2zNgkvw9BgKrfAPkNXBsgSC1Pg+XOpzmAFXCnFgFTtIStPV8c5FgqH9eYHUrQ92DPNF
         ovEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786306572; x=1786911372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iNPk9I4Upyn1iuvNFg1ZZoqQjoBVK1nqXfEtDMUZc8A=;
        b=guh764zqn+Z8m9tz05+vtS7asWiIdbXefjdgiAJwfQa4bKSmbR9j1Y55A28/L2cIxr
         DiqibF8OHwFc5CcD4SQqSGZ7MtRdyXKNVln1Fu+0J2KTuvbbRoMJI8hrC8MugKxJ44fx
         ZqYp2I2kI22ThpkzyXBdwtH7VAS6aBL/wVCs98KyHuFKfGqzaKeH1xW/V/iiI3tEv2Yz
         HkvgKQpmYO8EXdRf3RzYbjlDt9tpN0zwSne4T71h2LONlx1uBSTEElLhYpEHoZXqISUG
         aSsnPcZpiHinM1L45LfTd9codV6sNjfzT9ZJj+9a6Ivk/vSHuSa5C+/eV/o+RI2YAoT7
         RK/A==
X-Forwarded-Encrypted: i=1; AHgh+RrXCaUHrUX8k9ZHThYa7ha8oKP/+gvVT/96jjJRrCVWi36hqYpJq4DLLif++Vw7MN/388wL+OxyDIhJgandzAOB@lists.infradead.org
X-Gm-Message-State: AOJu0YzuBIKH+rpeJNLG3UYQszqrf3b0ExVBfa3oPYxeRCtv9vl0D/lv
	trLGwtktpai7/ZRyI4mV1K547MwHD41fa0v7ivKzY0kId5biootVUXhycXDLJCt5z7r1pS0YPph
	Pv4JBApJkVLMNrACqrMTmdc7GPk+N+jz1Tz0VQnDD1MHyKi1lYAnyHoQa0j/8PHdmBxu/O1Y/r1
	Iao5eYSadWrg==
X-Gm-Gg: AR+sD13Jgxv7BQZw7JgCYHbdcw5/xJv0o4P2m5ZXcWoKz+s4K4oqVmYl389SYRSBfFu
	u9a/Got6CDiEp2cJNvx51f/+ifQOscus/+AK3rUW45fZ/dMl2stPggxAlZyybWp7koB/Am7r8wB
	bJIQcO3PadmZWfdwU/sxOE0mA6A0hfZyDCbPryJMkLEhb2lUXtlBvGNoFOn92fuG3DOvuT/V+O7
	DO39LPCeVdW6Qkkgb7Q0BH48aTFMPsTHy8s57hSL5dP9DZ2zeoyaeIkrFyvSe31O6JmTOYvRTSX
	00//APvwERLicjumk+UBXJm/11yJYTS8t0KnIUHuKfRzClUtkuvBYo7+5MvWCivwTyCLyyt2NNt
	hwvzg8An+oAkHuw22nWO9MbW76DV6Op9CptabK5XxJohtrH5F+pf4EeGkR/+JUCFDk1AMiXyRmS
	uk4oBuaJKMkhmYxA==
X-Received: by 2002:ad4:5d6a:0:b0:8b3:f911:c1df with SMTP id 6a1803df08f44-908a7098dcemr230865406d6.21.1786306572120;
        Sun, 09 Aug 2026 13:16:12 -0700 (PDT)
X-Received: by 2002:ad4:5d6a:0:b0:8b3:f911:c1df with SMTP id 6a1803df08f44-908a7098dcemr230864896d6.21.1786306571669;
        Sun, 09 Aug 2026 13:16:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055f3cfasm1589259e87.70.2026.08.09.13.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:16:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 23:15:49 +0300
Subject: [PATCH 10/12] iommu: qcom_iommu: program BFP (prefetch) settings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-msm8974-iommu-upstream-v1-10-87f5cd492560@oss.qualcomm.com>
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
In-Reply-To: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2296;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vdP/W44ayt3FHEa9KUaIShbYNvDrdcgmsdVGlcwUja8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqeN/v954t+9nRfN3jnbRFtVv4Id7AvzQk1kHTv
 v+6iLVynGaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanjf7wAKCRCLPIo+Aiko
 1UhdCACM0mYcaBjCCwCd+apqi/GjzhWRRST3w8LuuiNKdjPQjAlSU6FRIgZfH7nvWcZteQboR0v
 GZXKfhZLTXVzkaVl1q3bfVJIqoYeVIZ8veIxt8pxOHPRyn2PA4xivjvRfjr8bGLOf/v5jNsxprg
 UfzI8sAwYE/9O/q2xhPGfSsZLvW/SCNi35M8yljHoviKgSAAhE6j8ZTT7x5GKN+7VceUfgzZIyk
 xIwScXlLpMSTv49jQ2YKMpkuD91i7AryZnSmbN8YmXhRVtRylDUjH+jv8Y0nkMr7qSh0xOcLFfz
 mTHR8RixAfhFsT7ca5pCr/rVWmavhaHe4HJNf8qF0dOtT/HT
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=d73FDxjE c=1 sm=1 tr=0 ts=6a78e00d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=jEMSmkJXngTgGiv5SFIA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 0S9r116-WG8BuD2gLzvlhxWxmNHrpKhx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfX2te3Gv8C9Xad
 k5eBZtTYWNf3z51mbz7/MJ7HpHFw+/ZpxfzxnX9GrjbA8rXX4Er4orEWE4bYDZ0xezJSaGtQHBl
 O+mwd9zR6g68u4ePbIonLcL2cIVjWCMAf7r8xYjBC27sVMUzCgscRC28HQWHVjdtrF8bD5GCOsG
 d1t285KS9GvG325TgTdY/eMjdrvIoUD0LgIPKLTI9bQ5OWnHgX2RIUz0t44NKO8+YZqg6eKkZ02
 HhdU92PP7Gm7/yQtsq1rfuBuJNsb+2aUIcrFdwhYADSFS1gdi7fhZJkVwwb/3/dOTo8UY5ZMwFo
 YQ+Uo+ysYEFfXxoiMVyoO0XyoNctNvTPsBBFx0dqmPWPceFox0HiWI/b3f6xzcpXZl6VJPkCf2U
 sp8h0uALg6+NJJCmiFqRjrvwiVuTRm+HDYCQgxpkbHa+nPE/vUrjtQPet2vVNMVPzo4TB00bBfD
 m1babyS5/lj8X8+UNZQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfX+6Sg0Hmdt4Yv
 DxWKtL4as2FaYe4rP3zYyc1hkMLP3de16fEaUXFcuH0PIOaiRGU50+v5CHOSYXvo8o3HzinYWEG
 6z6b7kc1c+y0A7Sf3sbd6eKY35jxoS8=
X-Proofpoint-GUID: 0S9r116-WG8BuD2gLzvlhxWxmNHrpKhx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_06,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_131613_997197_45F298AE 
X-CRM114-Status: GOOD (  17.76  )
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

MSM8974 QSMMU instances require additional programming of the prefetch
settings in the instance-specific space, with the tables being specific
to a particular instance (rather than the SoC). Implement support for
programming BFB tables.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 2b2cf665c39d..9523ae95fa12 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -57,6 +57,11 @@ enum qcom_iommu_clk {
 
 struct qcom_iommu_ctx;
 
+struct qcom_iommu_bfb_reg {
+	u32			 offset;
+	u32			 value;
+};
+
 struct qcom_iommu_sid {
 	u8			 cbndx;
 	u8			 sid;
@@ -78,6 +83,8 @@ struct qcom_iommu_cfg {
 	bool				 halt;
 	/* faulting transactions must terminate rather than stall */
 	bool				 no_stall;
+	const struct qcom_iommu_bfb_reg	*bfb;
+	unsigned int			 num_bfb;
 	const struct qcom_iommu_sid	*sids;	/* one SMR slot per entry */
 	unsigned int			 num_sids;
 };
@@ -286,6 +293,25 @@ static irqreturn_t qcom_iommu_fault(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
+static void qcom_iommu_bfb_setup(struct qcom_iommu_dev *qcom_iommu)
+{
+	const struct qcom_iommu_cfg *cfg = qcom_iommu->cfg;
+	unsigned int i;
+
+	if (!cfg)
+		return;
+
+	/* The BFB registers sit in the implementation-defined space */
+	for (i = 0; i < cfg->num_bfb; i++) {
+		if (WARN_ON_ONCE(cfg->bfb[i].offset >= SZ_4K))
+			continue;
+
+		writel_relaxed(cfg->bfb[i].value,
+			       qcom_iommu->global_base + QCOM_IOMMU_IMPL_DEF +
+			       cfg->bfb[i].offset);
+	}
+}
+
 /*
  * Reset and configure the global register space of an instance the
  * secure world does not manage: global fault state, TLB, stream
@@ -1131,6 +1157,8 @@ static int __maybe_unused qcom_iommu_resume(struct device *dev)
 			return ret;
 	}
 
+	qcom_iommu_bfb_setup(qcom_iommu);
+
 	if (qcom_iommu->cfg && qcom_iommu->cfg->ctx_restore) {
 		/* Restore context banks lost over power collapse */
 		for (i = 0; i <= qcom_iommu->max_asid; i++) {

-- 
2.47.3


