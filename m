Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A031C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 20:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pGguj9r1IdxuLI9hJH3l42uPyd/PQzFXNoZbz9w0Okg=; b=zwvn6x2q/5kP7MrBQ3RwzyefqP
	E4d1oZ59XQ5gKvKeToDrVc18rq79e7mlnTuFo6AT8l3IqCSxSkNh11+rIZv9Jc3QENAESyEnHAZZA
	gewJsxiXpRu8OsBKmwey3Ob3FyZZ0DL4JQECkfy0DekQmjd6EReqJSHupYGSHaqGxEwv1XmbZN3zE
	sN3JQkrELYJphO0nqlO4FYiT34z4AZ+XycPpwFtioije5mE9HNeQY4Q1vjY304gvl48tW2ETR8c1p
	ZMB72P+9V8HIUJwjfqAQ622/M0RxRw55Yaglc0cj7yVwTDBm4ONJ2mcbHTsDs9lfYnI6D+Em9pX/f
	ZonuFQDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt9wI-0000000AeGZ-1B0z;
	Sun, 09 Aug 2026 20:16:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt9wE-0000000AeCn-3sGm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 20:16:08 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679I9n7c3141438
	for <linux-arm-kernel@lists.infradead.org>; Sun, 9 Aug 2026 20:16:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pGguj9r1IdxuLI9hJH3l42uPyd/PQzFXNoZbz9w0Okg=; b=ZtYfg3x9F1NGbIh+
	07sq+oIVUQGoBpVV4hPpk9tIzP7yEPavrTfzz4iv/I6K+0DD1NkiFAc7W58L9uUJ
	7Xw86gMRNnqSI9MVwRL/IXC7Kl6K3XL0ySx4uciuRWHjMC3YIdf1bLFR1lS4DxUP
	Q5uWYzqexts7MqAd8Rw6LrX1cJonz6CPvoZqsUrkGbl2wxbJZimmHUuBE3eVTp7D
	MsT+Az/st564yilQtSXhDrCyGxqDe0Hksk2zvLv7xohszW+3unzv1mEyb4ehB0To
	K3Qfoy3sA9VygUSjGu/Ly1jThVyGKp3z1p/nfaC8Tyjozx3EOt2g9T8NyrDcMgkq
	QGFwjQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwvu8kepw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 20:16:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1a9764f0so11871591cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 13:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786306565; x=1786911365; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pGguj9r1IdxuLI9hJH3l42uPyd/PQzFXNoZbz9w0Okg=;
        b=XyRgTBnjQjITCPOYzWe28yGXN80VuSnj3/VgP0yvmiD6DV94E9zsUgn0hwCAZ13ANl
         Z3EigL9D3brgPAPjomzf1qf+Vn5TcHcq3PY2/oSuh37cR1DTSuSDwxTq9LEreSOSVLMi
         dBdrs/a4hUmYOND7frl3fkWN2YjIxkah9RQbRiX0mMr6KNPIVBaAzwtNUsoVwD+8rjEo
         AE9HkCfrQsaIggp5KUNS2zDJQAGdKxhbtOJ1u47CP/hTDyubH4xTs9SOvkY9SfAx+oOL
         q5jOFNiNL5eWvIkW36CYOKU891/orAnb6KXd7pbBA8KwKNz5v+ChIrxHVfxBFwpyr6J5
         uP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786306565; x=1786911365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pGguj9r1IdxuLI9hJH3l42uPyd/PQzFXNoZbz9w0Okg=;
        b=qeoWtg+EZDDnqAjX7DbR2peT98ZX0Mwbrqf8tvZDDIu/7vrL2C99ESRw6mgGUbK2O3
         iVPAfcWCqvY2CbsKQmQadLsHV7++NfEu+elVHZR2nkztNjoabfvHnSfCOh/k9EES60IU
         2AoQDf6/q2B9RND3Y9Pfyr0QMTBJvBPVUvp0z+NyN8+W7Xs6HtMiiB7uET0AhE/QU+Ce
         K3pezRsoAroI+naTl5vsmztRVXY8GhAMLgFxZD9Xkl0Uw4sv6QulVI10bn8VLoK9zV85
         CG5E1PZU51DSOYaIZqNEBUEJTqjsciivLUOX3JTkwcpZCRDvFvPfR4H/N2etYlk18VYj
         0xTg==
X-Forwarded-Encrypted: i=1; AHgh+RqGh1ESoDKwH3fnnXkIa6Ee5icPmKmFWRFevsW8M8qL/A0X0/Fu+jOFDIBwWMXaIFbAN0AswAfj8HNXsKaaRbJr@lists.infradead.org
X-Gm-Message-State: AOJu0YyljjJj0ncmJ7CMWlonD5udmH/4rsVwudQKt2qFjaF2cWuYgRQQ
	XpB0yN+RVWH3OJ1i40bbme6AZWcBeet2PlVvodMckETldf31W0W2Xebj3ZeFYS0dSWzCsd+KxGK
	pmzG3wqhB53FAJFlFayWI45efiJBY4W7LIGbH13AGERuRT54HcDFIIHf/KwLc3htermBMyJ6GG6
	O6WQu+kDrdrQ==
X-Gm-Gg: AR+sD120V8GDU548dI7ctEuP4BDyWEbulmh8TyRSanl8y+YDw4IajXay9dGR65RARIN
	M0DgKj+uRNKgdVmckA/hd4up72m7Gt+Pntb/L/dn9HxAcOGpVQgWF2ivx199X9cohlH+HACw3BP
	1iUxqWuESgRbDh+xUn/r6F+t99HkMMsKUtvKfQzwn+HEGwN3C7Wsj+7xRh4cpHWnWs3PysC7C7q
	3NNXCq1jVLBhFIZZ52JdF+Repqj8mjyL3zmoqJ59XWRrbUOdh0FbVcSGXxCkX+YzYmwMESe2O5/
	WHipUN/rnyeHjnFFqi9GrfNZiWS6ChpSEs4CJBgQtKup0vWM7W9XzVuIKkKh3n1w4sVI4TfWM6W
	A7Qadm2BjEc8ZIfBBGvwBCMgogkxfhBD7bFLWn5eUdBq1+SWKaGDyEzwPg6WuYYghTOtkdy0NK3
	8l7RnsY2BcjVfekQ==
X-Received: by 2002:a05:622a:90c:b0:51a:ee21:d342 with SMTP id d75a77b69052e-52d20a15f56mr185842061cf.20.1786306565321;
        Sun, 09 Aug 2026 13:16:05 -0700 (PDT)
X-Received: by 2002:a05:622a:90c:b0:51a:ee21:d342 with SMTP id d75a77b69052e-52d20a15f56mr185841631cf.20.1786306564888;
        Sun, 09 Aug 2026 13:16:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055f3cfasm1589259e87.70.2026.08.09.13.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:16:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 23:15:46 +0300
Subject: [PATCH 07/12] iommu: qcom_iommu: restore context bank state after
 power collapse
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-msm8974-iommu-upstream-v1-7-87f5cd492560@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2381;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=laikOYLTOPsJSBO/UZWFxuWPBu+oMI4kCDbCOi9meUo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqeN/uG0cDyKR2aok2TJTyzHOzP3um1LRqY9Ani
 w7dGVPzYfGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanjf7gAKCRCLPIo+Aiko
 1SzHCACG7PZKV6+yM6wpDsbk6vicG4zkkgwjq03pwyL5oFnACN7sLYz/WbsK0l+18ZKvlNMLeBW
 EEUhNOOCq0YbDoP2iNeLSgLYxQUuVBC1urvUqAfaDP3OqkjZaEgNrX8KJOzOj8o95JrjrtWpDQH
 Vy/z1GgHzam9eoQBgKmo3On+turuJSrJLOR1FUteO9GTyL+Ld3v0iNZcmoefwJzJVcH0hR0AwBq
 0yLXTx2t3EB4W2UBh55EbwB+DsShzHBaVZ3Sg/q6F7ZDcrro9rhRnHBUpHXutDjfzN/FasiBdG5
 t/bz6zI2xmO8wJDBOKF3IFVIJSvUiOo8IZh9EefdMcXDMLdc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 8KHUfkjuotvbjlwBKrinrLLg2Yhto1OI
X-Authority-Analysis: v=2.4 cv=M8p97Sws c=1 sm=1 tr=0 ts=6a78e005 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=DguvtcLGRnFhd48z200A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 8KHUfkjuotvbjlwBKrinrLLg2Yhto1OI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfX1qBq6b2eXO48
 W7/afvww2tUGLsYKJ8swI0am+n9ekELUZSyrFgu2V5p7sf9GaYGuL/NZi1Nv9uborwrtShrhPE7
 EE7puMAltriEgCeBxvCG5jad0598cBsGBUVxMrxsTcc2y2jcvh3W3Q35jinNh/6a/GJFxMojTNm
 M/LPMoVL8pRxkx3OPJzZJ0+Xa2UqBL401MluOLRB/+psTPjBaM8zDECvk4/iAtdSMAVGUyQWVJ7
 arGsNYna1FceGvegLCLrlCBotlrhlI5PCB0muLTyr/Ta5CR/TtBhA+o3f2XqZ0l8p5m0rQzjGcZ
 frBWXtMRioULVpULRkl50oY7wcwiSr+XMTkWar0WBYBeg9uwO4cHQCNTgJlGAQoU8ssSS/J+9NS
 b0+hMjUo7PrB7O/mwyCJMWjWdkuTg3T1zgnDWzvhjeDZTSa5KhCr8Je1nou+/XpTq7ntm/CK3He
 vyLc2KURNtk8RCqgw6Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfX9QkCLBQOE7Lx
 Wqy/FFxKAA507KyrL83CTwylvI58sM5qwo4D69SsTsl+kiwXIc60y9Wp4bqsUdJ5Kh51avXZtLp
 KFT6ZiNwZYr6/yefeap9t81Kkxw7Nzo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_06,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608090183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_131607_259470_5A864CDD 
X-CRM114-Status: GOOD (  18.32  )
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

The MSM8974 QSMMU instances sit in MMSS GDSCs: whenever the power
domain collapses, the SMMU loses the global and context bank state the
driver programmed, and the next master transaction faults or bypasses
translation.

Cache the computed context bank register values at attach time and
replay the global reset, stream mapping and context bank programming
on runtime resume, for instances that opt in through the new
ctx_restore configuration flag.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 3b07c4cf23fe..8e9488c47d5c 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -64,6 +64,8 @@ struct qcom_iommu_cfg {
 	enum io_pgtable_fmt		 fmt;
 	/* the walker faults on the AF bit despite it being set */
 	bool				 no_afe;
+	/* context banks lose their state over GDSC power collapse */
+	bool				 ctx_restore;
 	const struct qcom_iommu_sid	*sids;	/* one SMR slot per entry */
 	unsigned int			 num_sids;
 };
@@ -94,7 +96,7 @@ struct qcom_iommu_ctx {
 	bool			 secured_ctx;
 	u8			 asid;      /* asid and ctx bank # are 1:1 */
 	struct iommu_domain	*domain;
-	/* programmed context bank state */
+	/* CB state replayed after power collapse on OS-managed instances */
 	u64			 ttbr0;
 	u32			 tcr[2];
 	u32			 mair[2];
@@ -1063,6 +1065,7 @@ static void qcom_iommu_device_remove(struct platform_device *pdev)
 static int __maybe_unused qcom_iommu_resume(struct device *dev)
 {
 	struct qcom_iommu_dev *qcom_iommu = dev_get_drvdata(dev);
+	unsigned int i;
 	int ret;
 
 	ret = clk_bulk_prepare_enable(CLK_NUM, qcom_iommu->clks);
@@ -1079,6 +1082,16 @@ static int __maybe_unused qcom_iommu_resume(struct device *dev)
 			return ret;
 	}
 
+	if (qcom_iommu->cfg && qcom_iommu->cfg->ctx_restore) {
+		/* Restore context banks lost over power collapse */
+		for (i = 0; i <= qcom_iommu->max_asid; i++) {
+			struct qcom_iommu_ctx *ctx = qcom_iommu->ctxs[i];
+
+			if (ctx && ctx->domain && !ctx->secured_ctx)
+				qcom_iommu_program_ctx(qcom_iommu, ctx);
+		}
+	}
+
 	return ret;
 }
 

-- 
2.47.3


