Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1CABC5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 20:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+hV7mbrZwx44RLk9dFycUl+f8Z+IiQ1Td63pdUanc1o=; b=0g4QKR04xxVJUeN7AKTSqheYW1
	pgblQEmTmOtbzw68I/5/5mXAixrky3I+VLhEHxtZkkzanKeHCEjMuWZJ7GPGtySIaqqbENmWCeaUW
	OLKCkyVj/XwkUxOdbG8+m2tRvyJXx64ESzcxp+V2YvZfDEI4pMDB1vECk7mExiOq8xpTEMCPED13E
	REKRZNgQPERUPYZDJ6YLaZHUzWk6wUuuAZmALiP2nguqreYqeu0ZJavcdxGD5iUCX1I9fsYb2Sj+k
	JnWtplukcYgrjsdHfWYNYJpBWf0ItaP3I5q4NMMgv5fYG7Bo465Gxr3YxA024Jf5B8GPCPogs88GO
	bnCfbclw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt9wP-0000000AeO3-19jg;
	Sun, 09 Aug 2026 20:16:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt9wJ-0000000AeGq-3SH1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 20:16:15 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679I9hDd3141050
	for <linux-arm-kernel@lists.infradead.org>; Sun, 9 Aug 2026 20:16:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+hV7mbrZwx44RLk9dFycUl+f8Z+IiQ1Td63pdUanc1o=; b=VCYWknPtT+DHTuIY
	tVzaDErKqAENEmh53NdE/F6yPa9Iqqm5VFirSBYIGvRK8vIs3F3NfUyyVYvvFxe2
	RM7MAUGCrDr3M2lUOYnddzIcxBttrW+m3XswltoqI1vIBsmxFRbnm9EpvcLOpC3R
	ZBHVxkGzX07GuWc8pg+tfcGuKiqEXqJe7ccprmM8/TSo9cmFZifhv4bhzpYbqmX3
	WUuX+rLkbW4C8bAgq1XdnESY/tkOe07HZOAawNNkFKApgTbZLAQao4EfQxZocwM5
	lDtfbXLSCeoo4UfJFPjvoM4YbF3j2SE/7OuzHdGdUSidGvZxbJdci/Jqwn+gZKxs
	P55U0w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwvu8keq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 20:16:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e538afe65so130375485a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 13:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786306570; x=1786911370; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+hV7mbrZwx44RLk9dFycUl+f8Z+IiQ1Td63pdUanc1o=;
        b=VlGd7JBqUi8oxV2zfEzvTE+hxFLi/OYlS5YrGvcXs7EMYUEErURmq+B+HaFrN8Z869
         mOSNSYGMPe8D1KpqiZdEEZTC8PVYKUGTS7Q8xYw/RtIUe4RbPxnKLqr7YrTZsGmumoi/
         xTI/vHADGzA8yQeRueAmPxb1tkbjGkY/cP39MMnwK1V6UfXUAP0x7JcBwddsTtCwb96l
         qTT6AGncUcpI2n+W7gZ5mdXa/cX2LiTfGenma5uNa//iszlemF/nU4w6KLAR6CoSpjTk
         Ik8hVaVWeCU7wM5yREUw04F8SOPsv860p0lnje1xpuLurA3o0DjVwFiorhira5MmaSht
         Gz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786306570; x=1786911370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+hV7mbrZwx44RLk9dFycUl+f8Z+IiQ1Td63pdUanc1o=;
        b=AGBgJATsdfgX9iPyvpSj4/CX1s+ua7H7AZiN1fZrAqRFd7Uf92cEinJfNuzKW02rsQ
         xsi+5uDDpXHFmCVA3QVIs3KZ3dlhMZM4hZDgktWdc1fKDvR5xRv5O5kmrQQ/t/BeBiPL
         nelcIBeUlcTHozrIbF3uUOTFNWnj7Ua9gM0/njmf4EZRLVIiwn7j0C3m5s6R9C9RU7Fp
         xOpZhfvGlDIFCh0WtscG304EYlggXYO0pqToXSp+xcQ6KskMm7+qiUvptYvTjFxv46dd
         Jr1b3oHAVfcu9XGqWIVMk8j7JI4rGywa2LhLw7zCiUG93IrPmACOtwyyHZNWgpSg555w
         pKXw==
X-Forwarded-Encrypted: i=1; AHgh+RrDiubOWND6Ent6F9gdE0lc6FCrdiI0gmbB64niKrarAaTwl/pBTuqjsS8WgA16y3+TbgPhv4rouuLv2GQMr66E@lists.infradead.org
X-Gm-Message-State: AOJu0YzzUJmWFpr1uaDBxMYZN/pZWHoceduTCmhmtSVhTUNVzoIRy7Cb
	mn92VHfapp76GUDerMiBqp9mJTQ4AppmsGijWxW5w6usmDa3qwlOk3x+XFZrCE8vim4d2PCfBwQ
	zP7hM5J0e+elLegMbsMv9i1TrtXGEH2QN3QseO2LSR6kLUU8kMNqGlX1STgbM7wuqmN8lF4oXct
	JXNUQjw0dDCA==
X-Gm-Gg: AR+sD11SFsSRenaCH5+r+33hWG1kg+O5L9M+gYt9AjSYv2I68zWYy0SKZxSwA+eCuAb
	gdgIcP2Rs/bzQeYsdWCDYdY3BF7B6ZcQRLtUnEgOc/bCcKX3kfwelATKXjPQ+SZshDHfZXqbZ0k
	mke03nS9qByep2MDiBfQ8jJn1FSExVo6C82jsvXKopO6+0oFdKh+ovJjzCyLuArgES9gxuvkYFb
	g8ApH4IjEB6MATwdDweRebwEeZKAj1marKnuwfxOfPvnRWQoiCNc3kE4C8u8q3DKxGNFNWOyLRB
	wxNR/6YNLs8YY9oB+mYweVK0aiNi8ZkakMf5axeroTBKll5VnP9JGQMHaEyC2ZLZdNHfz+LT7M1
	u59CwEAjCZN+e5yn6fjWdkvUTLlxGeIIen3xPjwxRgXLl0nM9DKKtSKmxXeaiK2/BcyEnEQ4jPY
	Dj3JyNoO8bFDhv1w==
X-Received: by 2002:ad4:596d:0:b0:8ca:268b:13b2 with SMTP id 6a1803df08f44-908813c80aamr450316866d6.32.1786306570131;
        Sun, 09 Aug 2026 13:16:10 -0700 (PDT)
X-Received: by 2002:ad4:596d:0:b0:8ca:268b:13b2 with SMTP id 6a1803df08f44-908813c80aamr450316366d6.32.1786306569637;
        Sun, 09 Aug 2026 13:16:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055f3cfasm1589259e87.70.2026.08.09.13.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:16:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 23:15:48 +0300
Subject: [PATCH 09/12] iommu: qcom_iommu: allow faulting transactions to
 terminate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-msm8974-iommu-upstream-v1-9-87f5cd492560@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1829;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=08DI3m/g8w//LYUe10gsP5FMXIEvOf1ZW68iQjd9XpE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqeN/vhrwXuGhQLdAzY/l2GN/Bhk6G4tkUR0rGB
 /KpHmvM3nqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanjf7wAKCRCLPIo+Aiko
 1fwRB/9hb9z5gxrrc2rcIX+BFjYiB6RwxCiQoXWl76sM26ATHSTCxaQbuXacXM28jJeLWK9Jd6R
 XDfVZ7yWijF4iAIGOC9vZfvp7ilfem4OWuFalZguh2DSShcqwIaeuf4y45ckh7mbxq/KnGt8LvT
 8vz5KhQ7Er6Cl+yFvH4Dp3nQd+WtIjBM6frxM0UNsvnlobUVUjT8hdzTHCPXuB2Jh175Lho6LjB
 LkMTR3AgAo8SNvuEfN8hjQrt9UEb1sCxl6SBoa3zXaaiE2f4oZiQhiEad3O7XGdZEg7SphvYjfM
 uOvwfPPgZBGXz97OhCyhT1AJs0T70xm6aM2/RcJEouk3hfwB
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: scRHmi-AQ5IP_Z0eAPEwFof_X1oZdlyN
X-Authority-Analysis: v=2.4 cv=M8p97Sws c=1 sm=1 tr=0 ts=6a78e00a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=9MEWnGasQQH83fMYMBYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: scRHmi-AQ5IP_Z0eAPEwFof_X1oZdlyN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfX0i5Zu1DLDcmX
 B1KFfPM66YksTploVnW8oA/B20o4kxUipmSGeFW2AN6X63GEuCzmevYa/HlII+My7q1xXA7mMj5
 NSNYtr6AKdEY27pJVKsSfBlhoRcAcIcXwSMrZ6sBH8usZdlRQ9KPLblSosD9c+yaygXzgESLnt/
 VUyjF8R6vzLCpI8NP0GCjZWLc8KyfGtLNlXDAoi+S62VL7b/2CH7yIFr/6y8xIGwbI1aOuRsUOE
 I4uVgauHjN0mcmH/aiLEZmHf7YuZWaUrCcAbJK9Vna76GLd5gNlujuVPZkOIh5NHqpToTwKnyd7
 ZnDt4CLb6OrwsZPDwtc5nWReN21o4PC0wFTmVN6CqVaqXyMT64a5imuVHNpcK0CR9K5Vn88T0Ld
 U3CVExXTHWelREd+ACoOqkfKfsT/ZCiy28ZxuTWeIcYZsfr6s/q3IcETrUvIlSE7epQ3VjJmmIq
 iX+eO+VBRVGlJHssvDA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfX9x9l5AXHGXDj
 LaqTpxPwQuU1mwKgq9zingdgBro6KEAY0xPAKL8RDRI9Qn5jniWI0LIgRagyvg5IdaOLwKgFtBX
 bpBVF1TEZ0PjViPchZIk0ZESM6fQels=
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
X-CRM114-CacheID: sfid-20260809_131613_037673_D571D7FF 
X-CRM114-Status: GOOD (  14.78  )
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

Context banks are programmed with SCTLR.CFCFG, which selects the stall
model: rather than terminating, a faulting transaction is held pending a
write to CB_RESUME. Held transactions stop the micro-MMU draining, and
anything that waits for the front-end to quiesce - the halt handshake, and
TLBSYNC - waits on exactly that.

Not every instance wants the stall model, and some cannot tolerate it.
Add a per-instance no_stall flag that clears CFCFG so faults terminate
instead. CFRE and CFIE are untouched, so faults are still reported
through the existing interrupt handler; only the stall goes away, and
with it the handler's RESUME write becomes a formality.

No instance sets the flag yet.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index f27f8722ee64..2b2cf665c39d 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -76,6 +76,8 @@ struct qcom_iommu_cfg {
 	bool				 ctx_restore;
 	/* the micro-MMU must be halted while its registers are programmed */
 	bool				 halt;
+	/* faulting transactions must terminate rather than stall */
+	bool				 no_stall;
 	const struct qcom_iommu_sid	*sids;	/* one SMR slot per entry */
 	unsigned int			 num_sids;
 };
@@ -500,6 +502,9 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 		if (qcom_iommu->cfg && qcom_iommu->cfg->no_afe)
 			reg &= ~ARM_SMMU_SCTLR_AFE;
 
+		if (qcom_iommu->cfg && qcom_iommu->cfg->no_stall)
+			reg &= ~ARM_SMMU_SCTLR_CFCFG;
+
 		ctx->sctlr = reg;
 
 		qcom_iommu_program_ctx(qcom_iommu, ctx);

-- 
2.47.3


