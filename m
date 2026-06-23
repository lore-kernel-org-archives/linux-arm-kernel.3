Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30DBCD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 12:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PSlGePwHyRYcFLv8EJamVpEvdvRpZ3GdhYpvSgrdXIA=; b=q2D7LiC+Ojnec5aqlgcYvL2rHA
	u1bVfCd0Rj/NcUQBBZtXOF0pjnA5WrczurHxR2yAgdi7i0eI3xzth91rNH/U0XsEY6rnRn/QC2/5H
	mDRGgpGyJWJtOlHYQXbMG0phd8KXdNBSM674zH6zHccZlkD8jJgdN77ObB+rAhwWg3yQ07L8YNhcB
	yp22IzhXcDnejkNdP8VYubxavArEj69HZ8oAaRP19kO2N05JU+VwU2NiX/BM3FOoZzxJ+thiy8MSM
	x3TYn0YZAN0RJV5svYfpdQxqDKIhvVybAQgw/mOIrrhAvr7vUU93gPLuGw2GYtDYUlEIhJ4Ou5xd8
	PWnPYuhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc088-00000006FnI-330Z;
	Tue, 23 Jun 2026 12:21:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc084-00000006Fk3-2auy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 12:21:25 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBXcmI1155247
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 12:21:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PSlGePwHyRY
	cFLv8EJamVpEvdvRpZ3GdhYpvSgrdXIA=; b=IzVVX+blTX52AsCG1uVLGDaDf9Q
	T/Josst+RPqMNJBDKYZZn5siB7ZIH08gOPHHVPWVkpns1uSvYpOMJhaL8XQdj6ZK
	oNHNTkMBTqBbnaLTFYzEmmZjP6sZ7QTgexX3xzsXXTV5WIvgog2F9hQEUJBmLZXG
	NS4XwHvCXN3r8Ahjk0Nccj2m7lONUEbBNmrDD42hrFS5XNccFP5eixjqcfpo0iJ+
	gA2doEIfp/V582jq0LkSb2tELSjlskyLLJavLdyJOGSfAOlAmUoYd3wpxvg7EqNC
	XK795HEdYWH6bCrEwGJs9AK2Cjrwc2TK84zxAAbkTgPa4CMZ6DcKu/CrpPQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr28rfr6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 12:21:24 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84531eaf8a8so8116989b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 05:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782217283; x=1782822083; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PSlGePwHyRYcFLv8EJamVpEvdvRpZ3GdhYpvSgrdXIA=;
        b=eMiGYksITJ3NSpJu9kOFMgHh431KIyTbtgQrCZNeRNeFI/OdFNgvgip4nzIXEPi/Tf
         yOWmUWL+FEw7gqYd4ZimjNEqfCV5cV0vs+nAwpdBsUwZjJapMuqzZPfxJ0vfCfKewv6m
         1UryViQOg9+TJ14rD+7HxL9O69rYvjb0x2jwisbTcEX8LPZI85sOP5moEU/d8vSgwjok
         NEm3+90EBqZjtVU9gvdp3gV7J8Dmvjm2JXpojkFuCVpcrUen9hzXIEht/CzW4gmpB8Qw
         RRhFnxqYp2GFvG8gwQQy5QlUscsUEC9ECXDgY6Bg9pfyElmYHG8kk0l0jm3Jk854pQwE
         AhAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782217283; x=1782822083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PSlGePwHyRYcFLv8EJamVpEvdvRpZ3GdhYpvSgrdXIA=;
        b=RKb+JT+RRGXfDETjP4gk/doibzXx9xCxnbids8Cy+tsDA2vQiDZw65tdlKZvE7Nlta
         av7HxR6YsBHx8vDjPbVCwOliTavCsYeflCg60rIjR7gcCoZ4vwcZqeM7jFBTq2r/5QY6
         6et2FvI2tgCsMEcRUqCz49i/qE7RgbogxXG+79Z8hAc/ly411jV1RkQEnTNZ+6F9rqip
         rHUj1/ICC1DQogGXgVbC9z6IBtL0Z6N8Be+rA3+7Zvp/f39FAsIQ+4maznkVc2BlLT/m
         s3GfNBiG39d4z34O7e4WLCfxsO+9YiqIrW0KqMYStx1uy/IZO/Lhzxq3gkLQzd4WXzTe
         +s0Q==
X-Forwarded-Encrypted: i=1; AFNElJ9PQfojLOokDPBtygUnS/Vbu8SiObmv++Xb2K7izYdp6XfXNVfdx7oaWgPrNPD7wxJuDJKbUtALtx3n2dAUwSL8@lists.infradead.org
X-Gm-Message-State: AOJu0YwwelSbiHkwVCF7UVRmGb5E4t4fvY4Nll/cIiwjk7SUziB1LxXS
	KDhJeNPNXhU8cJPEPDsFb0bNDTZzXaVxPjkPk/uVeNawW0o+1xNXXGyp6YkaP3RldtaHQ6/B9dL
	1GncJT7i87LMHzlc6fZ+ApeG6C9t2GRo1PpqnrrrQNNvafQ4mYzGDQcHiFLwJ0utY+RJz1Ev5gY
	apEw==
X-Gm-Gg: AfdE7cn1kpypBDJjsGaAt1Lk+6xtTqPoCTe5hekb8eB4kjYj1As59vzFkXbCqcAe1S+
	U/UsZfZTwB5kLIJhBnQdHFgV40zrvRsHTGf7Lbhdb+8jBJHUytxnXSoJVj+lPI79sNCFQOmbuee
	xG+0bH3kHfGLp3mw6vHs2z6SYqW3K8D5YXbjDcHxszUzLO8TGtCSaMGclVNJh8iICDpjJ9YBARy
	TyTSwe/J+u+q/ktjvZ02TFiOM2ffBIbOkHm+WNLNeRPg9OyvucVlVGvIThJBxHkHUUp1+fmhCgH
	9hON+EwUb35c5IOYgIAEiBXTRMYTd+83ua5DcDMAZ/xjjQJGkLppHLnnbastmlaigGHajVSO470
	0YcHE9jTA9m4RRTGTEMTnPHKrpcjaHRo06IATbw==
X-Received: by 2002:a05:6a00:951c:b0:827:2a07:231d with SMTP id d2e1a72fcca58-845970338ccmr2760023b3a.17.1782217283401;
        Tue, 23 Jun 2026 05:21:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:951c:b0:827:2a07:231d with SMTP id d2e1a72fcca58-845970338ccmr2759991b3a.17.1782217282893;
        Tue, 23 Jun 2026 05:21:22 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564e74646sm10171856b3a.29.2026.06.23.05.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 05:21:22 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 7/8] iommu/qcom: Enable clocks before hardware access in qcom_iommu_ctx_probe()
Date: Tue, 23 Jun 2026 17:50:33 +0530
Message-ID: <20260623122034.1166295-8-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
References: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfXwP0sSuENAeiD
 BUs2L+zv67m09hZ4LXzQ4yT3dSBiVP9qZFIE0szDapC4sSdOBabYYwMkU0I6SA3+v/8LDr5VSRu
 KniIQpOda0S/OC232pFp2hfyiFAug0w=
X-Authority-Analysis: v=2.4 cv=b4KCJNGx c=1 sm=1 tr=0 ts=6a3a7a44 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=8cASqgOsboiLGU4YZykA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: Any5Zff-TufWe6ak3KYn7603G5M5lTFz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfX9Id5VmKFtpmM
 JN4PsiCAsF4HgDt6aq6qzAQ6PWN0PYkqgBhW9MkMdnyHXJgYBIubzuVTZijW04+A1cBmpLnMJZw
 VBLHH+O1TczxZoQFEsvYpcnkmMAc/3EuTdVWb7WVxa7k9lFQZGMcLPPwqmhXd9zJTRE+fJAguaL
 7zxY78/9PRAVgl8GszrqeVAHMTuftOov4TdIJBLoL9Sxaj0EhUlli4NN8n8Fl8I45i0ojm9Ja0F
 oTo18Ep5RMAYmOYrgkdX3WF46YiiMyz+dRIZwn9vfB5toh9juGDMwn1hJ9+MEABIj9gizIY2+BA
 laObuNgwwQUTjm/yQ8mJGCJLyrYs43qIecrrAyU/ir3PkHufiKc/P6oJRBmMLjTd99jW9nbwM7K
 WBRN0pFSlyczC2mI2bXFJjiugNyxPkJd76TggTeiL3YmY+2J/MZgwe0IUkOe2wHyCEU0yzx3NDG
 wzN4NWYekPr1NUvH2Dw==
X-Proofpoint-ORIG-GUID: Any5Zff-TufWe6ak3KYn7603G5M5lTFz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_052124_659527_5A5297C7 
X-CRM114-Status: GOOD (  17.54  )
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

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 51b60b296bb8..0df8c2af8eed 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -714,8 +714,13 @@ static int qcom_iommu_ctx_probe(struct platform_device *pdev)
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


