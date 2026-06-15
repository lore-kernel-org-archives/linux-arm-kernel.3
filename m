Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6467CD98E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 12:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RNdnR6CZ3/9BNpbQCelD2BkNJUYnz0xCLIGmiZEX744=; b=5EtS2e46Zy84wF51LAvXdmIjJc
	X7dkMu55zpKJN4m1f4rWU9o4NYewbGcaP2ITox6En32q+uVY/I01ci93Z7il2JeHVVhMTuFT9L+f3
	eFiOrMOx0H7qYEDfimIlcNFZ0uS00ApXcaBrefgVgTQYVSVfwosyNqX4S1PsxDMrkJoH4w2B/lk5S
	CqpRMU4sQ4DMpcBSlRu00Vj01nk+F+wlZGgiTvFE8y172TbnfupLMLmv8WTr/aBOQ8PDORMKw4Dw6
	bqJ5y0sFJbGq4267pV/xs7uvdchcE2B8bWsYDH/L+JfOCwXnN+CEKneukm87qkJVVqqZytcMRF3Bp
	q60F8oyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6VF-0000000ECiR-0pDL;
	Mon, 15 Jun 2026 12:33:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6VC-0000000ECgT-17LH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 12:33:20 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FAoQsR2481255
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 12:33:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RNdnR6CZ3/9BNpbQCelD2BkNJUYnz0xCLIGmiZEX744=; b=Xd9ouEPg1I8fMU7f
	YNdwHHkEhz3S1ZfZnUAc5lbpj+lIX7S4QzGiEulBsAfdn4qQTJR3xzI00KZDXJhV
	fbHQNL+q7tbIe7ly5EkI7+1hlZ2qa2gjbECLaksdsrrOkhzXsVdpkv754K27ZdKV
	NzRnWfw1wQWIGiaaFV6SoiEKIQ8y4wdik43oU/ZN5FIFEOp9KeiIoIi4KvPsl56T
	dT3jGDL+QUPl6EbWJz9O47snVJKZwhJP6F7saC5qEl0snzdu2cg2n7st3w+F5ShM
	goD4Tk7pzTDOKUsaBqpLCWKRk5s2horCqOJu4T7yjulzGVRYulAdFSWC3bGXr3cA
	ouZeoQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ete980u22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 12:33:17 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8428384f31fso2598955b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 05:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781526797; x=1782131597; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RNdnR6CZ3/9BNpbQCelD2BkNJUYnz0xCLIGmiZEX744=;
        b=iS69tql7x3dDtZ/WtMnCJR1vWvJLwDIsyxBrqVHUrAg9tjp1mMybafy3HowONPKRzI
         TMlYGb/QtbgrtV8k3R/VGh6Wd304x/VPKqSlGqfwNA4BRsyt682YjPp/SaK7IsM9y5Xh
         PRAqHGnYbFeOY8XwL/6UAXWzA74j9RZbuBRQlzTuQcjodVREZnylX8oJ+cQOgcj2dgoX
         bIslbwLDcp0DSesEiP7BLvpXH2De/PY9malcw7lJ9VIf6bGUjL9P0Q/C+f8De6fO7EJM
         Agt7Ew4G1tkKxEtPpci88achwKhHV4WI4fk9EaX5npINaULvTMbmQpl2+lJIFeV1B+k9
         SivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781526797; x=1782131597;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RNdnR6CZ3/9BNpbQCelD2BkNJUYnz0xCLIGmiZEX744=;
        b=iJf0853GJK5DYNrmPN1hnDNd3gBKcLnvfEDHE6FBxQJNB3DiZn9TR/B+ZPHbHPEwbJ
         4XMlvnkiOmnq6BX9HOexVCKmpmYFKl8NfzgTZEd0tqHbnaMJpB3xEvYtr7VtWdbaFyOs
         ZXImwgRqLwCyvmq30wKyB4PS15YHRqN32Vyi3vXuaYSNqqly56M8LZtcDJuMDA9Q6vn9
         6kTmRm5yW3myMMKkHggawzQa82n6CNhn0bVwvpy0tk48pQ9DhFDS1CNrcLbLTGMuskbU
         vfjBCedVapmezw1+5SsELTQZyphyT9LX1hlGR45afW/bAOtNYtfgDOlpKoCVt7Hoen9x
         L2pg==
X-Forwarded-Encrypted: i=1; AFNElJ8LlDNyiJC8ZS//cN8gLf1tgKDTfGQMLugHohQ5Qk3s/0PwAKhsqi75zol6sE0PunXeB7hhYQmFcmIwiLE4/hvx@lists.infradead.org
X-Gm-Message-State: AOJu0YxORKF6MiAjUf9RmBiZiRTi+TnxiHk65m0GYUiYELdZqpU/p/rv
	8H8MoUt4J96/0uuI0XQR9T6jTqKNGg9FYH5fMmKNgFP+A+kxb5ZmURaB/ltcOyry4HlcguC+DEH
	yXM8WtusA5Ijoyz0a8uc1/aTyyzaxhTUZogZfAslQVL0ABC37Mu/zM20hJoykPtqCF+KU8EJvSA
	/37w==
X-Gm-Gg: Acq92OEl5/2QL4ss59QH2gNe0BRmp3okDtphv448gTPpbAG79S+KcffXa3UzTGFAFia
	4zTqbM0ZUM+vWBnFQzPDr148U+7ewynH3aFtIOE1KcLM4kAprfP0114BSte2Bc+dx6y4JKI2fKE
	khL7B6MdWvoH6vEB0z7gmtACAXmmBJC08HTLLNyRFnOJWWJsZu8jemV3X52kRDRqLQwnXQDd81F
	uClxj/Rdst96Wnt2rNpLD9Ky16m+UOXTrEHURwoaOaXY+AvRx6MT0U6fTRy3js71hoOZZqyO0R3
	g4BOR+iuH6HBEt6J1YC9j3F++8Ut6A4bBtDA6ib4A7EkJ23k0Khk64frFW6+1Pvm6b342bbkaN+
	Fafu43BSgnSvRRS3FQjUOmh9M9UkTYQ138tQIEAnxLf23Qk15VoNUgAWu2KjfpRo1mmZp/gjk2N
	fGpqrQ1OXSQep8tw==
X-Received: by 2002:a05:6a00:a211:b0:837:e9cc:d46d with SMTP id d2e1a72fcca58-8434ced3682mr14804784b3a.44.1781526796986;
        Mon, 15 Jun 2026 05:33:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:a211:b0:837:e9cc:d46d with SMTP id d2e1a72fcca58-8434ced3682mr14804735b3a.44.1781526796468;
        Mon, 15 Jun 2026 05:33:16 -0700 (PDT)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b03fd0bsm9968393b3a.50.2026.06.15.05.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:33:16 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 20:32:31 +0800
Subject: [PATCH v10 3/5] coresight: cti: add Qualcomm extended CTI
 identification and quirks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-extended_cti-v10-3-1c1694b6d8ed@oss.qualcomm.com>
References: <20260615-extended_cti-v10-0-1c1694b6d8ed@oss.qualcomm.com>
In-Reply-To: <20260615-extended_cti-v10-0-1c1694b6d8ed@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, quic_yingdeng@quicinc.com,
        tingwei.zhang@oss.qualcomm.com,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>, jie.gan@oss.qualcomm.com,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781526782; l=8792;
 i=yingchao.deng@oss.qualcomm.com; s=20260611; h=from:subject:message-id;
 bh=lODQpixgMjeh3XaPxg7whs4SFcFhY0krJnrZZurdwgY=;
 b=hTOJCGiFRo4kRJIKulKIAU9giNFMQhIjh0gUp7W5oMvJjfvr53d2zE5P/2Sj/GlmAR6EFemXL
 ZR995QsmeyCCpazUo3+0wHFjNMSbudyfriu35GtXdn+I82ViV1z+dMG
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=+y3U2mIt7mf0C+x6qBUD670cd9S2QV+yl5015bUYMgs=
X-Authority-Analysis: v=2.4 cv=V5tNF+ni c=1 sm=1 tr=0 ts=6a2ff10d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=beW-1tIARaYxa11sNzUA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: CTn_YI8cZMlLVCRFSnquQRV6FdaUukfX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEzMiBTYWx0ZWRfXz+XoY+ykOxQO
 Olq1dt5uIev17ZeMxbcYgGXpgFhfblLctS4B6Gn+sG+fAUJmz5527AnaI7jX4faoYEgUPCCECQB
 0kX8LaoePzI10qo7Gqr+Qxw7ViMFZus=
X-Proofpoint-ORIG-GUID: CTn_YI8cZMlLVCRFSnquQRV6FdaUukfX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEzMiBTYWx0ZWRfX7vl51Y0116ud
 tZTFajgDZcBbRS1dCGdm1TQ6yy//H7cD/RJhBna2kMdu+Gw22L9T0vWyjp8HLxAWSPYHAWdtyGX
 oTGXUHbCveSR+VeB+I03Ss8MK5eXk3dbhoDEGRgXcYU3XMW+h8aXPOAGNF0wM+34H6ijOGk7sbS
 TxnofnNbPNxzdEAiTuOwWJCt+ENaDVIJJ/iWyf+uT98Ou2jjFoQz61XeU15tRzAc09gI9t0nljd
 sv01vcEx1jaza17gzfPa/Y3Vc9CaB2LfQD9o6a1KS/2jjmpKZ/cDhO3EaBdmMCKBm1Bh+QbQ3Fu
 JinsTtVjuXUgUit90Oubw9LOyUouwp2JXMo1MP5nrRSyeofOFTJtAjoQKr6M+R7DkbL0Vamyo2T
 6cgiC0AGTS9a2vjSPYJhOzoIlwLF7IyAuQyZE6BQWPM2p0p0tHIlnKQVwLZfVoaP+4vz886PGIq
 jtJJkOFGCyB0EuH578g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_053318_513038_CF20C1A9 
X-CRM114-Status: GOOD (  26.43  )
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

Qualcomm implements an extended variant of the ARM CoreSight CTI with a
different register layout and vendor-specific behavior. While the
programming model remains largely compatible, the register offsets differ
from the standard ARM CTI and require explicit handling.

Detect Qualcomm CTIs via the DEVARCH register and record this in the CTI
driver data. Introduce a small mapping layer to translate standard CTI
register offsets to Qualcomm-specific offsets, allowing the rest of the
driver to use a common register access path.

Additionally, handle a Qualcomm-specific quirk where the hardware does
not implement the CoreSight Claim tag protocol. Instead of clearing the
CLAIMSET register at probe time, bypass the claim/disclaim operations
entirely for Qualcomm CTIs by wrapping coresight_claim_device(),
coresight_disclaim_device_unlocked() and coresight_clear_self_claim_tag()
in thin helpers that early-return when is_qcom_cti is set.

No functional change is intended for standard ARM CTI devices.

Co-developed-by: Jinlong Mao <jinlong.mao@oss.qualcomm.com>
Signed-off-by: Jinlong Mao <jinlong.mao@oss.qualcomm.com>
Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-cti-core.c | 47 +++++++++++++++--
 drivers/hwtracing/coresight/coresight-cti.h      | 64 +++++++++++++++++++++++-
 2 files changed, 105 insertions(+), 6 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index fa758c535ccb..5b83dd4e603b 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -73,6 +73,35 @@ void cti_write_all_hw_regs(struct cti_drvdata *drvdata)
 	CS_LOCK(drvdata->base);
 }
 
+/*
+ * Qualcomm CTIs do not implement the CoreSight Claim tag protocol, so
+ * bypass coresight_clear_self_claim_tag() for them.
+ */
+static void cti_clear_self_claim_tag(struct cti_drvdata *drvdata,
+				     struct csdev_access *csa)
+{
+	if (drvdata->is_qcom_cti)
+		return;
+
+	coresight_clear_self_claim_tag(csa);
+}
+
+static int cti_claim_device(struct cti_drvdata *drvdata)
+{
+	if (drvdata->is_qcom_cti)
+		return 0;
+
+	return coresight_claim_device(drvdata->csdev);
+}
+
+static void cti_unclaim_device_unlocked(struct cti_drvdata *drvdata)
+{
+	if (drvdata->is_qcom_cti)
+		return;
+
+	coresight_disclaim_device_unlocked(drvdata->csdev);
+}
+
 /* write regs to hardware and enable */
 static int cti_enable_hw(struct cti_drvdata *drvdata)
 {
@@ -86,7 +115,7 @@ static int cti_enable_hw(struct cti_drvdata *drvdata)
 		goto cti_state_unchanged;
 
 	/* claim the device */
-	rc = coresight_claim_device(drvdata->csdev);
+	rc = cti_claim_device(drvdata);
 	if (rc)
 		return rc;
 
@@ -101,7 +130,6 @@ static int cti_enable_hw(struct cti_drvdata *drvdata)
 static int cti_disable_hw(struct cti_drvdata *drvdata)
 {
 	struct cti_config *config = &drvdata->config;
-	struct coresight_device *csdev = drvdata->csdev;
 
 	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
 
@@ -118,7 +146,7 @@ static int cti_disable_hw(struct cti_drvdata *drvdata)
 	/* disable CTI */
 	writel_relaxed(0, drvdata->base + CTICONTROL);
 
-	coresight_disclaim_device_unlocked(csdev);
+	cti_unclaim_device_unlocked(drvdata);
 	CS_LOCK(drvdata->base);
 	return 0;
 }
@@ -144,6 +172,9 @@ void cti_write_intack(struct device *dev, u32 ackval)
 /* DEVID[19:16] - number of CTM channels */
 #define CTI_DEVID_CTMCHANNELS(devid_val) ((int) BMVAL(devid_val, 16, 19))
 
+/* DEVARCH[31:21] - ARCHITECT */
+#define CTI_DEVARCH_ARCHITECT(devarch_val) ((int)BMVAL(devarch_val, 21, 31))
+
 static int cti_set_default_config(struct device *dev,
 				  struct cti_drvdata *drvdata)
 {
@@ -684,6 +715,7 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 	struct coresight_desc cti_desc = { 0 };
 	struct coresight_platform_data *pdata = NULL;
 	struct resource *res = &adev->res;
+	u32 devarch;
 
 	/* driver data*/
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
@@ -708,6 +740,10 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 
 	raw_spin_lock_init(&drvdata->spinlock);
 
+	devarch = readl_relaxed(drvdata->base + CORESIGHT_DEVARCH);
+	if (CTI_DEVARCH_ARCHITECT(devarch) == QCOM_ARCHITECT)
+		drvdata->is_qcom_cti = true;
+
 	/* initialise CTI driver config values */
 	ret = cti_set_default_config(dev, drvdata);
 	if (ret)
@@ -753,7 +789,7 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 	cti_desc.groups = drvdata->ctidev.con_groups;
 	cti_desc.dev = dev;
 
-	coresight_clear_self_claim_tag(&cti_desc.access);
+	cti_clear_self_claim_tag(drvdata, &cti_desc.access);
 	drvdata->csdev = coresight_register(&cti_desc);
 	if (IS_ERR(drvdata->csdev))
 		return PTR_ERR(drvdata->csdev);
@@ -767,7 +803,8 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 
 	/* all done - dec pm refcount */
 	pm_runtime_put(&adev->dev);
-	dev_info(&drvdata->csdev->dev, "CTI initialized\n");
+	dev_info(&drvdata->csdev->dev,
+		 "%sCTI initialized\n", drvdata->is_qcom_cti ? "QCOM " : "");
 	return 0;
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
index 634bdce5cdfd..4b6fd6b55114 100644
--- a/drivers/hwtracing/coresight/coresight-cti.h
+++ b/drivers/hwtracing/coresight/coresight-cti.h
@@ -54,10 +54,36 @@ struct fwnode_handle;
 /*
  * CTI CSSoc 600 has a max of 32 trigger signals per direction.
  * CTI CSSoc 400 has 8 IO triggers - other CTIs can be impl def.
+ * QCOM CTI support up to 128 trigger signals per direction.
  * Max of in and out defined in the DEVID register.
  * - pick up actual number used from .dts parameters if present.
  */
-#define CTIINOUTEN_MAX		32
+#define CTIINOUTEN_MAX		128
+
+/* QCOM CTI extension */
+#define QCOM_ARCHITECT		0x477
+
+#define QCOM_CTIINTACK		0x020
+#define QCOM_CTIAPPSET		0x004
+#define QCOM_CTIAPPCLEAR	0x008
+#define QCOM_CTIAPPPULSE	0x00C
+#define QCOM_CTIINEN		0x400
+#define QCOM_CTIOUTEN		0x800
+#define QCOM_CTITRIGINSTATUS	0x040
+#define QCOM_CTITRIGOUTSTATUS	0x060
+#define QCOM_CTICHINSTATUS	0x080
+#define QCOM_CTICHOUTSTATUS	0x084
+#define QCOM_CTIGATE		0x088
+#define QCOM_ASICCTL		0x08C
+/* Integration test registers */
+#define QCOM_ITCHINACK		0xE70
+#define QCOM_ITTRIGINACK	0xE80
+#define QCOM_ITCHOUT		0xE74
+#define QCOM_ITTRIGOUT		0xEA0
+#define QCOM_ITCHOUTACK		0xE78
+#define QCOM_ITTRIGOUTACK	0xEC0
+#define QCOM_ITCHIN		0xE7C
+#define QCOM_ITTRIGIN		0xEE0
 
 /**
  * Group of related trigger signals
@@ -168,6 +194,9 @@ struct cti_config {
  * @spinlock:	Control data access to one at a time.
  * @config:	Configuration data for this CTI device.
  * @node:	List entry of this device in the list of CTI devices.
+ * @is_qcom_cti: True if this CTI is a Qualcomm vendor-specific
+ *		 variant that requires register offset translation
+ *		 via cti_qcom_reg_off().
  */
 struct cti_drvdata {
 	void __iomem *base;
@@ -176,6 +205,7 @@ struct cti_drvdata {
 	raw_spinlock_t spinlock;
 	struct cti_config config;
 	struct list_head node;
+	bool is_qcom_cti;
 };
 
 /*
@@ -229,9 +259,41 @@ struct coresight_platform_data *
 coresight_cti_get_platform_data(struct device *dev);
 const char *cti_plat_get_node_name(struct fwnode_handle *fwnode);
 
+static inline u32 cti_qcom_reg_off(u32 offset)
+{
+	switch (offset) {
+	case CTIINTACK:		return QCOM_CTIINTACK;
+	case CTIAPPSET:		return QCOM_CTIAPPSET;
+	case CTIAPPCLEAR:	return QCOM_CTIAPPCLEAR;
+	case CTIAPPPULSE:	return QCOM_CTIAPPPULSE;
+	case CTIINEN:		return QCOM_CTIINEN;
+	case CTIOUTEN:		return QCOM_CTIOUTEN;
+	case CTITRIGINSTATUS:	return QCOM_CTITRIGINSTATUS;
+	case CTITRIGOUTSTATUS:	return QCOM_CTITRIGOUTSTATUS;
+	case CTICHINSTATUS:	return QCOM_CTICHINSTATUS;
+	case CTICHOUTSTATUS:	return QCOM_CTICHOUTSTATUS;
+	case CTIGATE:		return QCOM_CTIGATE;
+	case ASICCTL:		return QCOM_ASICCTL;
+	case ITCHINACK:		return QCOM_ITCHINACK;
+	case ITTRIGINACK:	return QCOM_ITTRIGINACK;
+	case ITCHOUT:		return QCOM_ITCHOUT;
+	case ITTRIGOUT:		return QCOM_ITTRIGOUT;
+	case ITCHOUTACK:	return QCOM_ITCHOUTACK;
+	case ITTRIGOUTACK:	return QCOM_ITTRIGOUTACK;
+	case ITCHIN:		return QCOM_ITCHIN;
+	case ITTRIGIN:		return QCOM_ITTRIGIN;
+
+	default:
+		return offset;
+	}
+}
+
 static inline void __iomem *__reg_addr(struct cti_drvdata *drvdata,
 				       u32 off, u32 index)
 {
+	if (unlikely(drvdata->is_qcom_cti))
+		off = cti_qcom_reg_off(off);
+
 	return drvdata->base + off + index * sizeof(u32);
 }
 

-- 
2.43.0


