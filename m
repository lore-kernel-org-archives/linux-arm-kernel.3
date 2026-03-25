Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF62FEA80A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 05:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sAedjumssGP8HnleB4ucvI59aev90SYKLdAP8s7agLk=; b=wN0MvQ7g9szarY4T334Enu2fe3
	3Ex4auANpDYfuhat8YsoM93gYhWnGJBgFl05VlYUYJmtNU4QK3sIOGOBrg6CZ1BdRIY0BIDETBdn2
	rkww9SFz2rXR7ogGOlY8IfJ4p5Tp+5MhBGHiDY4HvvqiebVqSywUdM3UVCQ7l1u8TtXP0pX0JMKQo
	ECdoDiGkv0c+5xGdVF/xAQdR3WYVL4u3d90MzcxMiVLNg1ZYV1o2teFssNHqHz0AtpWazLAVXzJZB
	XVJnM8TNTbvghJRathyj0psvMqWFrBF61/12mFDP9UW0OKvZNNASgXdOkKmGzwqemnnPFo0r36WI1
	wWKYT5CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5H2R-00000002j9b-3nlI;
	Wed, 25 Mar 2026 05:44:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5H2L-00000002j7g-3d0g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 05:44:15 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P3xQ2F919830
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 05:44:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sAedjumssGP8HnleB4ucvI59aev90SYKLdAP8s7agLk=; b=VJw8Mhh+jSJxkCAh
	LyLamUjsD8eHWm6v3vFbKQU/sWUjwQXPpuf/99WJTdRfcC3oZaF2n4hS3C0UgGf3
	ATiCZbAQcjFZV11hm7XjAHJ/lw21IoBoNk2+z1Gmfnq0LnrnyHKvn6Q17wUm8T1M
	PlNDOMgBuKTomM2iwEyqn39fAd8unaXfFDtIOAe63AHCl8YXyPDcFxZMpjGSO7q/
	VYLYJgGoxO/HMNqna1mnZHvO9j5oGNiGlP8KiYQ8BI0xnKFrnYmwFDg9BifoejYM
	TVrEKBfw+YDsjdb5fT+ru+t7/HhwkVTtSWqNaHGaoeNZHJYyQrqpLceSN9kn1T6B
	v9wEdQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d489mg9vx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 05:44:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b060c14ccbso180584235ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 22:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774417453; x=1775022253; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sAedjumssGP8HnleB4ucvI59aev90SYKLdAP8s7agLk=;
        b=hgMTYPrR6AzXeHGIUpDQgxbUaDb1Z17S+ZBrRqfQVGR2W5lujOEXf4VbYpLbKjaiuj
         hIETwpkCI3277WT0meFiXa+/MTc5GrrkulBia8bhumDPgOTGuGl1bDMooXWfLkfzfPW0
         oWuqmxhdPP1nGTD65d/vNJ4PSskzOuRwG27Rr1gjZoOqCAXkeDiDRmep17wt2J8O5oOz
         Kgi1j1j9aYaQeBbxGNoPaZlyYWVNJwRhBP+iqjqcsbyToa1U8RPjf2bd7SB6xY0/HE1F
         7+tVNkQuPW1vsrISKcH4Z2L3W9H9Ad/x8sKd043yCOjAyVzRWBQja5qnjMyz0qN/LStu
         BQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774417453; x=1775022253;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sAedjumssGP8HnleB4ucvI59aev90SYKLdAP8s7agLk=;
        b=rH/05qvoJsB5Cs4Plh+Tat8JyX5xsPGvjaqSDJdN/HcwpmDM1pwgtvetnV7GHDfzsw
         h9+Q69ZhmwW/UknGWDcynxCzJo5ZP08mKKQPdjVH9dhhbjD37uZwGPzHScLhpYF9FsE/
         ApE+aWFaBJXn8LNx/GpEUKqTaJMQ5PzqMKwLaHPK0RLstoOog14ePw5DoCQUgVgk9pPJ
         jFgJCwKFo+3KnpIlvWS1RQHkhHc8kSiDLgSfGzY0ypOw6Si1kIZ6RKzr65YjHfrGmS0/
         4ZArTFP0+4N4SQuj6Vpodj/DsNdylxxdGPQutBdcCzeuR5Z8jlo/WAHylzhZpRdBqa7Y
         wu/A==
X-Forwarded-Encrypted: i=1; AJvYcCVbNtooNsl/Vi5PpoeImh8ibMarP3SO0FA54YC3fR+aljLiBeBim6UK27PcnYEHm9fOmq+72HXAsu1Rptpx4CbG@lists.infradead.org
X-Gm-Message-State: AOJu0YztwUFEH/o4JWtMH8RvrNUBvWmefwvodPrgZayF0kJLqnlaS0d4
	xosghEP++tlsTxu8qjekIMJjQAvF6ZOePHahmB6LnJK9LHcRLbPXtz5Db8jyLfcNY968lLAbuve
	vDaKyC+3fJa+0bqRK2tjk9czIQGGMQnBnyTseioaHmCLW+4+tp3SzEqziKWPmXsn9hT3hCWJrYi
	nYzQ==
X-Gm-Gg: ATEYQzz/rH2zSVOgYTiHPuAou3D5vv28Q1Munwi0PQglRGweZah4ciTibhKqSYD9daJ
	cFWKT370YEISnm8z2T6ZfH605umqCN+LLzt4bPDtIzB4tI5TVzrFNupyBes9yEI+33P8rKHcgse
	86Z4jPC6ALxX5HIH3lrTRRamtnsgi0YxyQJaYjhYArXoAC0mMoBBKLmKfghLdyPLEFKJMRefrNW
	Od9rotI6JpnXrlF4ls1HOtTpfC/gDeOidVCfqTdzylumt7/C8yZQZz0HwSKYxDzdm6QmNsjWUkY
	SjvU/X5c25gfW3bFU/gxfUnoBkdSifGuKqCwg1uNazbu9YaDr8pw9ekqlIHMbqoj2il+BwAjPGw
	oxcV6DeKYlyi+PQYK0nSCeh1kzaykzyb0TeS2H7DPUMlcvDlBvpWqa2P1O3M+erLCu41YxeInCo
	dw8JWlMMYeg8lb3w==
X-Received: by 2002:a17:903:46cb:b0:2b0:4b37:e9a5 with SMTP id d9443c01a7336-2b0b0b2efd3mr24364735ad.53.1774417452667;
        Tue, 24 Mar 2026 22:44:12 -0700 (PDT)
X-Received: by 2002:a17:903:46cb:b0:2b0:4b37:e9a5 with SMTP id d9443c01a7336-2b0b0b2efd3mr24364465ad.53.1774417452193;
        Tue, 24 Mar 2026 22:44:12 -0700 (PDT)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836556f6sm219985805ad.49.2026.03.24.22.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 22:44:11 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 13:43:47 +0800
Subject: [PATCH v7 4/4] coresight: cti: expose banked sysfs registers for
 Qualcomm extended CTI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-extended_cti-v7-4-bb406005089f@oss.qualcomm.com>
References: <20260325-extended_cti-v7-0-bb406005089f@oss.qualcomm.com>
In-Reply-To: <20260325-extended_cti-v7-0-bb406005089f@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>, quic_yingdeng@quicinc.com,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774417433; l=4654;
 i=yingchao.deng@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=8tA/1rrhluQQOhAaaei29rn2Ss2/RThN58fxl9hPMJs=;
 b=kPJ6va5jIdBC1luKdNocyudY3wzT2OYkTluHO1R/HtuMWrwpokb9DAG6Jv97cbz6jci6+Z6Ti
 6OStKD1lfPDBsz4zmeoCXv8H7A1fqyT/sRvuwPlSrS8Bih4EWbKRC61
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=5tp504LR96W2IVT3sAbRCqWtoG16CxJVUnXJSfU8NlQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAzOCBTYWx0ZWRfX2m15LjvlNEa8
 isgsJRyCHMoqtLmCdZfXFvY4D+e97wWRpAQZpaqdcvIv55Wsk9yvOB36n4wru4J7WBzprngfBY/
 MF6t6k5lq41xZCiZy2+xgo+mt6Kl4nlDcF+oCZgoF9BNKI5PWqqsrwe2GFeZZdNH6Ti1IwWoLly
 O7R4vMZIorrJEDwBpz7dDJgZxHyig4P+7CIuqT5Dy3MNMEAVBj/Q9hhueXKroNyyL5HNt/TMlU7
 ks55ApWdvgikRSOfn8o9aegYFjb6pDhbfirQAFAfhRxApSDCf1WNImpKZjFjYIr8iDu50lvzgV0
 f36gK8uMvOBaeAIyYI7cXNSMhNrKpoET7LfBxcLPv+fwEGF0S8tNl6fgHdvFJP2Jz4Uiasc2KmA
 tW9Q7/m+nUI7cZSZmtq56iT1xn8zMb7gUFY6/iVDNRP+FzBrVGIXUb++p1V6TrLdByNaDcpYsHZ
 RuJaVQhiVd13eRIAJJA==
X-Proofpoint-GUID: fS9OjqeFPVXOl4nQqGaI_BNrKe1uZz5j
X-Proofpoint-ORIG-GUID: fS9OjqeFPVXOl4nQqGaI_BNrKe1uZz5j
X-Authority-Analysis: v=2.4 cv=AKSYvs3t c=1 sm=1 tr=0 ts=69c3762d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=PrhcshflQRWEcWOJaRQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_224413_942378_0A6690E2 
X-CRM114-Status: GOOD (  20.20  )
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

Qualcomm extended CTI implements banked trigger status and integration
registers, where each bank covers 32 triggers. Multiple instances of
these registers are required to expose the full trigger space.

Add static sysfs entries for the banked CTI registers and control their
visibility based on the underlying hardware configuration. Numbered
sysfs nodes are hidden on standard ARM CTIs, preserving the existing ABI.
On Qualcomm CTIs, only banked registers backed by hardware are exposed,
with the number of visible banks derived from nr_trig_max.

This ensures that userspace only sees registers that are actually
implemented, while maintaining compatibility with existing CTI tooling.

Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-cti-sysfs.c | 58 +++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index 075f633ea9e1..123ac862d8de 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -511,18 +511,36 @@ static struct attribute *coresight_cti_regs_attrs[] = {
 	&dev_attr_appclear.attr,
 	&dev_attr_apppulse.attr,
 	coresight_cti_reg(triginstatus, CTITRIGINSTATUS),
+	coresight_cti_reg(triginstatus1, CTI_REG_SET_NR_CONST(CTITRIGINSTATUS, 1)),
+	coresight_cti_reg(triginstatus2, CTI_REG_SET_NR_CONST(CTITRIGINSTATUS, 2)),
+	coresight_cti_reg(triginstatus3, CTI_REG_SET_NR_CONST(CTITRIGINSTATUS, 3)),
 	coresight_cti_reg(trigoutstatus, CTITRIGOUTSTATUS),
+	coresight_cti_reg(trigoutstatus1, CTI_REG_SET_NR_CONST(CTITRIGOUTSTATUS, 1)),
+	coresight_cti_reg(trigoutstatus2, CTI_REG_SET_NR_CONST(CTITRIGOUTSTATUS, 2)),
+	coresight_cti_reg(trigoutstatus3, CTI_REG_SET_NR_CONST(CTITRIGOUTSTATUS, 3)),
 	coresight_cti_reg(chinstatus, CTICHINSTATUS),
 	coresight_cti_reg(choutstatus, CTICHOUTSTATUS),
 #ifdef CONFIG_CORESIGHT_CTI_INTEGRATION_REGS
 	coresight_cti_reg_rw(itctrl, CORESIGHT_ITCTRL),
 	coresight_cti_reg(ittrigin, ITTRIGIN),
+	coresight_cti_reg(ittrigin1, CTI_REG_SET_NR_CONST(ITTRIGIN, 1)),
+	coresight_cti_reg(ittrigin2, CTI_REG_SET_NR_CONST(ITTRIGIN, 2)),
+	coresight_cti_reg(ittrigin3, CTI_REG_SET_NR_CONST(ITTRIGIN, 3)),
 	coresight_cti_reg(itchin, ITCHIN),
 	coresight_cti_reg_rw(ittrigout, ITTRIGOUT),
+	coresight_cti_reg_rw(ittrigout1, CTI_REG_SET_NR_CONST(ITTRIGOUT, 1)),
+	coresight_cti_reg_rw(ittrigout2, CTI_REG_SET_NR_CONST(ITTRIGOUT, 2)),
+	coresight_cti_reg_rw(ittrigout3, CTI_REG_SET_NR_CONST(ITTRIGOUT, 3)),
 	coresight_cti_reg_rw(itchout, ITCHOUT),
 	coresight_cti_reg(itchoutack, ITCHOUTACK),
 	coresight_cti_reg(ittrigoutack, ITTRIGOUTACK),
+	coresight_cti_reg(ittrigoutack1, CTI_REG_SET_NR_CONST(ITTRIGOUTACK, 1)),
+	coresight_cti_reg(ittrigoutack2, CTI_REG_SET_NR_CONST(ITTRIGOUTACK, 2)),
+	coresight_cti_reg(ittrigoutack3, CTI_REG_SET_NR_CONST(ITTRIGOUTACK, 3)),
 	coresight_cti_reg_wo(ittriginack, ITTRIGINACK),
+	coresight_cti_reg_wo(ittriginack1, CTI_REG_SET_NR_CONST(ITTRIGINACK, 1)),
+	coresight_cti_reg_wo(ittriginack2, CTI_REG_SET_NR_CONST(ITTRIGINACK, 2)),
+	coresight_cti_reg_wo(ittriginack3, CTI_REG_SET_NR_CONST(ITTRIGINACK, 3)),
 	coresight_cti_reg_wo(itchinack, ITCHINACK),
 #endif
 	NULL,
@@ -533,10 +551,50 @@ static umode_t coresight_cti_regs_is_visible(struct kobject *kobj,
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	const char * const qcom_suffix_registers[] = {
+		"triginstatus",
+		"trigoutstatus",
+#ifdef CONFIG_CORESIGHT_CTI_INTEGRATION_REGS
+		"ittrigin",
+		"ittrigout",
+		"ittriginack",
+		"ittrigoutack",
+#endif
+	};
+	int i, nr, max_bank;
+	size_t len;
 
 	if (attr == &dev_attr_asicctl.attr && !drvdata->config.asicctl_impl)
 		return 0;
 
+	/*
+	 * Banked regs are exposed as <qcom_suffix_registers><nr> (nr = 1..3).
+	 * - Hide them on standard CTIs.
+	 * - On QCOM CTIs, hide suffixes beyond the number of banks implied
+	 *   by nr_trig_max (32 triggers per bank).
+	 */
+	for (i = 0; i < ARRAY_SIZE(qcom_suffix_registers); i++) {
+		len = strlen(qcom_suffix_registers[i]);
+
+		if (strncmp(attr->name, qcom_suffix_registers[i], len))
+			continue;
+
+		if (kstrtoint(attr->name + len, 10, &nr))
+			continue;
+
+		if (!drvdata->is_qcom_cti)
+			return 0;
+
+		if (nr < 1 || nr > 3)
+			return 0;
+
+		max_bank = DIV_ROUND_UP(drvdata->config.nr_trig_max, 32) - 1;
+		if (nr > max_bank)
+			return 0;
+
+		break;
+	}
+
 	return attr->mode;
 }
 

-- 
2.43.0


