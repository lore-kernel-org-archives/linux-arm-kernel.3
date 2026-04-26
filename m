Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C85FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 09:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aTnLO3v/ufL6HWDonUJiHCmItAGVK6uVk1cXg/u3TdM=; b=wOw/MQ6zvoN3eR9NjQg8bhYL/Z
	oEWI65kkVTlFikuw98nBbo+7tr0iqkBR322qoES7p/QRcFKgU646Ur9OVffMHX1U1eXW+rT8mBtHe
	JxGEe8Kty+Kn5J5nZVTPhl3kXfHRjHv0Q9eoOpA+/F0d9Fs96HuypBQcdS7AIfSQ26weVwt8YgSII
	ColozK4jIMna+F7TnuP6BViCCrRSKa+J8Ue7XVDs6XLe0wVq2lQ4LAR+36DQaNnXvp5q8p9xRs5a3
	fVWvv9KBSeTPTW+fceDd3aCqBIfI1sSnmmC5G3IJdODwkRMNbc8Wwsg+sh/iRQICRKV71vHmWdXxY
	Yq7IHulA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGw3H-0000000FPWr-1I5Z;
	Sun, 26 Apr 2026 09:45:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGw3B-0000000FPSU-1idO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 09:45:18 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63PKF9QY3638421
	for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 09:45:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aTnLO3v/ufL6HWDonUJiHCmItAGVK6uVk1cXg/u3TdM=; b=etgcmWK9lHODkmCJ
	fGECgZceTOx5wMwwwgSOi8b1yBvXnMnj9p8olaTzzIwK6flD059YYAL3pW/PtR9L
	NdN51bOO6mjtYNsZnj8Hohhs56emtgaJdwKJVRJfiPhvDdbgXgIu5vBqaZrPc4P9
	z5RTVOBNYKPRji+rBGf1uXBhiYqEre4JrCh6Ckr860nSUnNuWwBXKk42c4qB3lUu
	gdIfOw3UwuOrjO1H/9OX+47vEw5ks2HDiAx7kxcX5fNDr5TqacUtkFBLsQ5XZLY0
	aCBXSamUySy7d1EZC9hy6aIJxYxZYzm9Lx13b+q4eVB+s6+Ck97WNy4dq0tcT29y
	2VKcOw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnqtamn1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 09:45:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b458add85aso96029945ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 02:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777196716; x=1777801516; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aTnLO3v/ufL6HWDonUJiHCmItAGVK6uVk1cXg/u3TdM=;
        b=Zl/6495pf8fmdS2sdiuv9D8Kh3/cVAMr2mATWjOkpwcQ9HpylHDWkGjSToyVhRNVhK
         81rgPi3kjwpKlfFPBD1PiB881qTGU7xoMn1x54/IpZGHuK1+IOiOSoWEYY5JpQGoWwTK
         ymuUcLCPZWuHB33Fx8Vpve4hU0FU2lh7arKR9M1pdgRRsPHc3uzY40p/YVyE0ZSkilXI
         Zga3GvmYJkIk/skpWdxynLQGrD3vjvOqpphqFTt5Iqzac/PWxdZTXytDZIxv5cJ/D+fm
         S8gOpwBQTT/Y5AYPZ8olTKoUOX2YChdyA7IJo4f+6CzbR7j86ObDIyZVJUcFXcsfV0gC
         mVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777196716; x=1777801516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aTnLO3v/ufL6HWDonUJiHCmItAGVK6uVk1cXg/u3TdM=;
        b=fNOrGQgFkqclseM+wO8j+Rscz5x3WgwG7LuQIG7yzUTtMGa5mmc0nha8lMFTMY6VYZ
         Z7J1zN8c9PdlyrMBNB22Lpnzp1b4Cz2ZwU43StALehgflvfZlCxYbXpS69sxc+BsA5e1
         5cffOTmaAbCpYXLCzlBYoY2ko4VehZ/q5Imp6/zxGmE7ma1S3YjNCePDDcnBy1R9ddOG
         qu8IIIMu76V/dPw2Lot21F8xNVzpTuwOUilGPkUn4mtq4zaeUc8pJdpK72qOCwCiJKBS
         y8zwCYG8d+Hou4HFJN3pYGlB9bW+xdqi5HGZpcZ8JRuyL81n3TW4ZbauNaZcIoHmBGrJ
         ak4g==
X-Forwarded-Encrypted: i=1; AFNElJ9gXbyvWhIiJTTvapnjkyuusnUzE/B+x/QDO+sSK/BaL60CIkUoNG9Ugao+9aHN/h62a8cfNKjHvmalVqPAgovZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+RzgTNmDNa3/kLiG2KUiS058Uu24uC9kyLqLCT4Nbz/Jt0ent
	4h+FsOP8HIW8/4dm/f+HC3gQiE8DwtkXjhQMtmGfyko/bz5wwYPAyADkSP9ma1Lr3ytuNkLZiAz
	cbBBGn2FkMxnvWC8GazkZsMWwbpiOkEf/as9TGH/gYKt1Gq2FkM/zRk+VBSoIP7jkoY0l9ZMNh+
	vVow==
X-Gm-Gg: AeBDievrSVPMeaR97dzBHwhCNyu5vxeZSxGBSurLnkKJpjG2SCBORrzRhhNTYQl073r
	RLxUuO/V1Ytx4rcHIZhg2C/T5pZUf3vyvZcozbgLa2hoPYrh+KY/BlsxEV9KMrq/gylHI6sRb1O
	jVkdEUIoEUIkO6v5xuRTyWz1SDCOjM2R72cVS1e2V04k0ymeI/6TBESA47wEsHcicrGYufWkYrb
	4q4lnBYL23xvvH54iHD3cDhrDiYviS/quGyqL1x9v4Q06DUmgexBWD2j+C1J6sTzb+36zSlUsMr
	qqi0+YivtsEvhliDO1K+RTTK61Bf+3m7K1ui3i8fMnnNPfguj7700TzWuJj84vUo2LJopDV9yv3
	Y19q2tGLvFvWt5MOJKcRkMGjweGFLIuzacU+vw+jDTTcC16wXvzBjsoe7MUvJ4am0R+Vj1g1bgr
	ymLLbgPWyQwq8pRU3qXsShcDon
X-Received: by 2002:a17:903:120d:b0:2ae:8253:1452 with SMTP id d9443c01a7336-2b5f9e8195fmr412637075ad.11.1777196716309;
        Sun, 26 Apr 2026 02:45:16 -0700 (PDT)
X-Received: by 2002:a17:903:120d:b0:2ae:8253:1452 with SMTP id d9443c01a7336-2b5f9e8195fmr412636805ad.11.1777196715822;
        Sun, 26 Apr 2026 02:45:15 -0700 (PDT)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab208d4sm294960905ad.55.2026.04.26.02.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 02:45:15 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Date: Sun, 26 Apr 2026 17:44:41 +0800
Subject: [PATCH v8 4/4] coresight: cti: expose banked sysfs registers for
 Qualcomm extended CTI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260426-extended-cti-v8-4-23b900a4902f@oss.qualcomm.com>
References: <20260426-extended-cti-v8-0-23b900a4902f@oss.qualcomm.com>
In-Reply-To: <20260426-extended-cti-v8-0-23b900a4902f@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_yingdeng@quicinc.com, Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777196695; l=4661;
 i=yingchao.deng@oss.qualcomm.com; s=20260426; h=from:subject:message-id;
 bh=OLSSErJr7xMEKOb+hZ/LbjI+CM4RcZpu2NN74Ss6L14=;
 b=rIBj4R3Di+1yR8dNdgF+nHpt5UGIVdG09pNVsdxHQm/RGUTcM0OuFsgMKvZA1tO2yFe0EVzWQ
 Jj75zoM14SzAWrvwKEdYSs3i2cWj0S7Yv0miEAYqQKslPdcqt9lS0Sr
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=aufKZC4I8k2lqi+B/z87rB5kPPybOn8C3mLosbtw+no=
X-Authority-Analysis: v=2.4 cv=J42aKgnS c=1 sm=1 tr=0 ts=69eddead cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=2umZ0bgHSShhNh9j1XYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 2dK-9Jtz6OZLUVVBItOoWRTt2RKqtzkc
X-Proofpoint-GUID: 2dK-9Jtz6OZLUVVBItOoWRTt2RKqtzkc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI2MDEwMyBTYWx0ZWRfX4wk7iNhmAG6P
 c5t7uWtnYmeIhbEY+bdvMnpAqkCBn5o+ZIRBy9mb6iH+zBFQEslGfpDMIDZvXR+1mmzHfjrdmnd
 JxBwPuWDWLpZuVaCEhcuR3zGR1HtSad7rA4MIJtxdw/V5hG/gmJ4//OZm7rAUlGDIEeNys7AfgU
 5KwxXSLulBXbTYNX7NQwHfW17j1GWOhYp2LEuPUp0L1Qghx+S/+BG7yAsH2XxXLNdQr/xySfJ3i
 DSKfWTrW9a7aabhLhk+DmaFl/6GZyOwCR17A81oxKaiw4mLX742u171y3gc2C0EyE7CtvBfdoB1
 H/ekDSzMkH1iDEMUx2dCaUNU1/9VOTVya4Lcwx/2/uVUOSjSZa1UMiCRLC5/PrcQLiJlF/0bn23
 2v/vzUUqxjEKzmBXFDEQleVdNq3FC9Kik3qvHSr4Y4nDqpQC+RiozPHzIxUkChjH2F71RLMGhkj
 uxL7D1Jcs3gBSxJ7m8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604260103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_024517_465761_AD83529B 
X-CRM114-Status: GOOD (  18.82  )
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
index 8b70e7e38ea3..046757e4e9b6 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -512,18 +512,36 @@ static struct attribute *coresight_cti_regs_attrs[] = {
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
@@ -534,10 +552,50 @@ static umode_t coresight_cti_regs_is_visible(struct kobject *kobj,
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	static const char * const qcom_suffix_registers[] = {
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


