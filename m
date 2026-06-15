Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62BDFCD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 12:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qr20YgwaALrRT7ERppM3wfl2A3PS8yJKI5sm3E7rp90=; b=Z8ut9OxNJAVjqPGuCkhkM/QIzl
	t1ik+L6YBuItZU8V30kxpzvmOEe7+229JLoit8NoSCaziY3fOEFLIedLCCSJHs+QG/BxcyEfd9EWH
	l5aaEp1tJ7wnj3r9BdmGaDYA57cr6HpZW6odtMFkVVp0JRHgTS4/S+nb4nNN/7+m6Tluq687jG4A6
	hOZEfhv8j/mgmrY3/SXFB2qjNwCWwsJTFccDe3CV1kUMwe7cxhWFq1Ks43gxJx7FhSuCCzehqmaeE
	cqIoaaIUsg0QiP5qcYolHpGhxhqxTre27jmSOF5nK6Hf8oWn8o4QkypHPI9NezM2fcWTNN9fuFLzr
	d6RuKBBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6VE-0000000EChz-3Wzp;
	Mon, 15 Jun 2026 12:33:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6V9-0000000ECeo-14tF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 12:33:16 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FAoWmf3956112
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 12:33:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qr20YgwaALrRT7ERppM3wfl2A3PS8yJKI5sm3E7rp90=; b=aWkRMtkClHHjMdur
	na28PRuDE4J4+z/b08WxG2+xClOVVoi8s43t6X52SfamdyEmWXIaIGnvz1oq1Yz5
	WV4z01GxHeqcX4JZAEWpH55GR50K2cvlnAy9KF+7s3WRRMuX6jwucn8sYZ68euxZ
	bW9/IxFctJMwS9nUQlU0ZX+ZF/IZ2WDecgo/erB0GWdJPtCJN/7A1wCUPsUzw+NN
	CCUmOOzprHnpxVevV8rpd1L42ql2FTaV2ra5M96+WADDl1ESR1upUbGcmuPHLW7Y
	nSHcl4sEq7nZQGq2s51OYQxCQk92VzkOdl2F/J2x9hE2E9RWgsfQIBk3dbVi9+hx
	SJOrOQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eter00nj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 12:33:14 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8422382178bso2161411b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 05:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781526794; x=1782131594; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qr20YgwaALrRT7ERppM3wfl2A3PS8yJKI5sm3E7rp90=;
        b=Z3hUJxYWQjCPrBJ2U8/KVFkF4v6uinM/moadL2p+7i5loYJbIcZoKlU7JvaRWbYcxD
         xEMh3tEC5AGoAIqwNBPV76Dn7OFlZ6PT2wTXFjaJP0EOwSePnrZd5KV18G8ohs8gWRw6
         VYBWYHkzGQApSjUxSpH7asVWI16RLVLZeukugLehjaUCNQm122Rf/5/UF+9p0jooqAsg
         osxQ/LFqV8BwlDqJGbCW1NRuZOPoP2hQWJUYSbFgrWlaXTv9Hfjmrr0bQag+iKvIJz1N
         MQonJ7MpeuBjxYEWQapXFbC6HbGSvK6mm39ZJmL0vQyuutw2eYfdJwWzFKJLatIk2THt
         jwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781526794; x=1782131594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qr20YgwaALrRT7ERppM3wfl2A3PS8yJKI5sm3E7rp90=;
        b=ryhegnUZc3f2KwaEQls3FY7repZboTAat6wli/vXucUsoS5cPf+3oeezvwjLun79Y8
         2U2t0tE4DnqQteMZP8bpb8TjVyMoU2ALJ5cT/kKER8BKywlFWvkUtvhL9Dag8wmv7y3B
         21yQPlRZYgMFOopjIZP1uUAuohnaagf8g7MuYvyNUFjnkiEkyyoDge+RPfzeqTT/WCII
         FfDzT55dp+IdEy1I6iWE/xTYVuWX+hQSm8+u2+2nJBGitv1jVMCcGO4uwR4uK67Pni1E
         hpw+Bitq5iEjQK/SqHIEFr9qBgMHP1CFPam5v3SzXB2xeaGr3dhPTHEbG4sDLf/fCwKO
         3X6A==
X-Forwarded-Encrypted: i=1; AFNElJ/zL7jFwh3iz+CY6P5XIjZKNJxsWzZeATvHGIwS6EFP7y3V7g4XBpon21YzqdeMCioZ0qG+Mk+4IVEvyvFvsU4D@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9uPSbDkeRUUB+Zd9jDrv7uw2+mtJLQzj9fG/WyqSeLw/HoYNH
	ykOHOVjMenvQ079BcLGVE1miMSm74LaJoVTCF5KoiLoeu5YI8vJSogjOiHdFCjz/Mz862GRuT2c
	7pSzgH7yjnAacTizLQ/MWJxMFGRVrxbnhIdyDgL+XnnmSZWr32hMbGlNlG3L5/kxlGKIyk+M3uT
	dPMQ==
X-Gm-Gg: Acq92OG9n/5ZdkDQKDdCcPOZ5KWGczOU1Cv4wyyiXLhx+z+15pIQryJlTyEsfOizBJu
	pqTtr5IqZq6DPYXly8hlge1BC4c0PUIgx2a7pM8+X7D0+o/16hqYauZ5Ra5xDUopBvoV3p2xnAA
	gjMdTecCQvPVXrZbFPK0VQyDnjqA48auTzuuDoTJisLWe0vkgI5Q2lMWdBOBfI7GXJKD4DZ88WY
	06dG261nPEIUG/Vr09eixcXSnEE9e7wz6/0t+bELBvBBZzsH6uW25Vyc7k+/qAguIi2+ah9AUk9
	M8to4gew6jCstNA3fNYPwFrXNeWmojInyFVLMXLDhMaUZHE9/5/1Lgya1esbv/PupVvNI4iVP+b
	j2h3p15fdYb5+LzaOmHX2wTMJeAbcgSeBY+3s7Oxu8KBsELv4hfoZ9LT5sDSGknaco23Lb4bJAh
	388rpwHs20Ta/ltw==
X-Received: by 2002:a05:6a00:12d2:b0:842:8985:340 with SMTP id d2e1a72fcca58-8434cf4ee62mr15293457b3a.35.1781526793623;
        Mon, 15 Jun 2026 05:33:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:12d2:b0:842:8985:340 with SMTP id d2e1a72fcca58-8434cf4ee62mr15293417b3a.35.1781526793120;
        Mon, 15 Jun 2026 05:33:13 -0700 (PDT)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b03fd0bsm9968393b3a.50.2026.06.15.05.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:33:12 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 20:32:30 +0800
Subject: [PATCH v10 2/5] coresight: cti: use __reg_addr() helper for
 register access
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-extended_cti-v10-2-1c1694b6d8ed@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781526782; l=10380;
 i=yingchao.deng@oss.qualcomm.com; s=20260611; h=from:subject:message-id;
 bh=wIWFmWKXaUOYZmGF72r5cp1d/iTRLSZHqeXR8U6HAKU=;
 b=oKoFZXfqqzQ5B4qXkwS1d5b32jbxDCcr+4CRT76qY8Z/leTtADcFEHzQYyrg3F6MrGiGzRT7R
 MZHH1zEewG5AgAoEp2DMqbVffjU+HyQeW8/lh8ni0K91UjR8UnSTn6E
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=+y3U2mIt7mf0C+x6qBUD670cd9S2QV+yl5015bUYMgs=
X-Proofpoint-ORIG-GUID: UWsAg90thGnXrhORIBcIq_KNGriX2FrM
X-Proofpoint-GUID: UWsAg90thGnXrhORIBcIq_KNGriX2FrM
X-Authority-Analysis: v=2.4 cv=UPzt2ify c=1 sm=1 tr=0 ts=6a2ff10a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=xqws7DasADjwqOAWw1EA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEzMiBTYWx0ZWRfX7U4uKYPwJGeH
 ocFNY1+gB/SwJOlg7P7EWLxl+/sYZon174iJF+fiQZO1C33XPQzeRJMnRZ3OY63k64IM4H9jAeJ
 YjQNG3rgQr22lu7sUJKNrEgMVevypLNCh2G/bqJV3YElQ/QwqThY3ZN2qRtv3bFUD4BOHdWynXU
 q/2sFhi9ktRA4zNZO04lzaFBNfXOOUmP0vO27axHSkSqPzQUVLl+I7qvgP0XrY9aVxTDpqCTNr/
 19Vh07w/u/kwmpWWdECdRIxmmSbqLtxs9EBEWbx6laFESQHaJMUYAPWfT4i1Z2hJORywOKxexLT
 Kf2e14sEgFBNj/PsRvvYh9ukFFgtZe9pmuXX5V/5Ab4orBKb414ofmdC5axuRf2DNHsyDwlKskL
 ZfXSRzci8FDyHu+0lMoTHOEI3sfeBGg8HGdU3m482DNHWSpCI659Orpur+WeEeM4sC696lc0Meh
 meRgEMpU9D+NKVXJoDA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEzMiBTYWx0ZWRfX67ATgFf8RCCT
 p1ksBwrl61wGzdeBmTuiWb9zxwizlB/umX6+tiCRlXxy6YsRlZL3w+SpFwVOigFO24NEjI7HA2f
 28ipbF3nMEEDD8LDEeljzNaZbT+np9U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_053315_325052_C37C46CE 
X-CRM114-Status: GOOD (  18.19  )
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

Introduce a static inline __reg_addr(drvdata, off, index) helper in
coresight-cti.h to compute MMIO addresses from a base offset and a
per-trigger index, replacing the function-like CTIINEN(n)/CTIOUTEN(n)
macros with base offsets and explicit index arithmetic. Add reg_addr
and reg_index_addr convenience macros for zero-index and indexed
access respectively.

Convert cti_read_single_reg() and cti_write_single_reg() to static
inline wrappers in coresight-cti.h, and add indexed variants
cti_read_single_reg_index() / cti_write_single_reg_index() for
callers that need explicit bank selection.  Extend cs_off_attribute
with a u32 index field and update coresight_cti_reg_show/store to
use the attribute's index field directly.

Co-developed-by: Jinlong Mao <jinlong.mao@oss.qualcomm.com>
Signed-off-by: Jinlong Mao <jinlong.mao@oss.qualcomm.com>
Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
 drivers/hwtracing/coresight/coresight-cti-core.c  | 45 ++++++++++++++---------
 drivers/hwtracing/coresight/coresight-cti-sysfs.c | 25 +++++++------
 drivers/hwtracing/coresight/coresight-cti.h       |  9 +++--
 drivers/hwtracing/coresight/coresight-priv.h      |  4 +-
 4 files changed, 50 insertions(+), 33 deletions(-)
---
 drivers/hwtracing/coresight/coresight-cti-core.c  | 36 +++++-------------
 drivers/hwtracing/coresight/coresight-cti-sysfs.c | 17 +++++----
 drivers/hwtracing/coresight/coresight-cti.h       | 46 +++++++++++++++++++++--
 drivers/hwtracing/coresight/coresight-priv.h      |  4 +-
 4 files changed, 64 insertions(+), 39 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index 572798ab504c..fa758c535ccb 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -55,16 +55,17 @@ void cti_write_all_hw_regs(struct cti_drvdata *drvdata)
 
 	/* write the CTI trigger registers */
 	for (i = 0; i < config->nr_trig_max; i++) {
-		writel_relaxed(config->ctiinen[i], drvdata->base + CTIINEN(i));
+		writel_relaxed(config->ctiinen[i],
+			       reg_index_addr(drvdata, CTIINEN, i));
 		writel_relaxed(config->ctiouten[i],
-			       drvdata->base + CTIOUTEN(i));
+			       reg_index_addr(drvdata, CTIOUTEN, i));
 	}
 
 	/* other regs */
-	writel_relaxed(config->ctigate, drvdata->base + CTIGATE);
+	writel_relaxed(config->ctigate, reg_addr(drvdata, CTIGATE));
 	if (config->asicctl_impl)
-		writel_relaxed(config->asicctl, drvdata->base + ASICCTL);
-	writel_relaxed(config->ctiappset, drvdata->base + CTIAPPSET);
+		writel_relaxed(config->asicctl, reg_addr(drvdata, ASICCTL));
+	writel_relaxed(config->ctiappset, reg_addr(drvdata, CTIAPPSET));
 
 	/* re-enable CTI */
 	writel_relaxed(1, drvdata->base + CTICONTROL);
@@ -122,24 +123,6 @@ static int cti_disable_hw(struct cti_drvdata *drvdata)
 	return 0;
 }
 
-u32 cti_read_single_reg(struct cti_drvdata *drvdata, int offset)
-{
-	int val;
-
-	CS_UNLOCK(drvdata->base);
-	val = readl_relaxed(drvdata->base + offset);
-	CS_LOCK(drvdata->base);
-
-	return val;
-}
-
-void cti_write_single_reg(struct cti_drvdata *drvdata, int offset, u32 value)
-{
-	CS_UNLOCK(drvdata->base);
-	writel_relaxed(value, drvdata->base + offset);
-	CS_LOCK(drvdata->base);
-}
-
 void cti_write_intack(struct device *dev, u32 ackval)
 {
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
@@ -333,7 +316,7 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 	struct cti_config *config = &drvdata->config;
 	u32 chan_bitmask;
 	u32 reg_value;
-	int reg_offset;
+	u32 reg_offset;
 
 	/* ensure indexes in range */
 	if ((channel_idx >= config->nr_ctm_channels) ||
@@ -355,8 +338,7 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 
 	/* update the local register values */
 	chan_bitmask = BIT(channel_idx);
-	reg_offset = (direction == CTI_TRIG_IN ? CTIINEN(trigger_idx) :
-		      CTIOUTEN(trigger_idx));
+	reg_offset = (direction == CTI_TRIG_IN ? CTIINEN : CTIOUTEN);
 
 	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
 
@@ -376,7 +358,7 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 
 	/* write through if enabled */
 	if (cti_is_active(config))
-		cti_write_single_reg(drvdata, reg_offset, reg_value);
+		cti_write_single_reg_index(drvdata, reg_offset, trigger_idx, reg_value);
 
 	return 0;
 }
diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index 2bbfa405cb6b..6165866eaefe 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -171,7 +171,7 @@ static ssize_t coresight_cti_reg_show(struct device *dev,
 	pm_runtime_get_sync(dev->parent);
 
 	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock)
-		val = cti_read_single_reg(drvdata, cti_attr->off);
+		val = cti_read_single_reg_index(drvdata, cti_attr->off, cti_attr->index);
 
 	pm_runtime_put_sync(dev->parent);
 	return sysfs_emit(buf, "0x%x\n", val);
@@ -192,7 +192,7 @@ static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
 	pm_runtime_get_sync(dev->parent);
 
 	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock)
-		cti_write_single_reg(drvdata, cti_attr->off, val);
+		cti_write_single_reg_index(drvdata, cti_attr->off, cti_attr->index, val);
 
 	pm_runtime_put_sync(dev->parent);
 	return size;
@@ -202,7 +202,8 @@ static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
 	(&((struct cs_off_attribute[]) {				\
 	   {								\
 		__ATTR(name, 0444, coresight_cti_reg_show, NULL),	\
-		offset							\
+		offset,							\
+		0							\
 	   }								\
 	})[0].attr.attr)
 
@@ -211,7 +212,8 @@ static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
 	   {								\
 		__ATTR(name, 0644, coresight_cti_reg_show,		\
 		       coresight_cti_reg_store),			\
-		offset							\
+		offset,							\
+		0							\
 	   }								\
 	})[0].attr.attr)
 
@@ -219,7 +221,8 @@ static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
 	(&((struct cs_off_attribute[]) {				\
 	   {								\
 		__ATTR(name, 0200, NULL, coresight_cti_reg_store),	\
-		offset							\
+		offset,							\
+		0							\
 	   }								\
 	})[0].attr.attr)
 
@@ -386,7 +389,7 @@ static ssize_t inen_store(struct device *dev,
 
 	/* write through if enabled */
 	if (cti_is_active(config))
-		cti_write_single_reg(drvdata, CTIINEN(index), val);
+		cti_write_single_reg_index(drvdata, CTIINEN, index, val);
 
 	return size;
 }
@@ -427,7 +430,7 @@ static ssize_t outen_store(struct device *dev,
 
 	/* write through if enabled */
 	if (cti_is_active(config))
-		cti_write_single_reg(drvdata, CTIOUTEN(index), val);
+		cti_write_single_reg_index(drvdata, CTIOUTEN, index, val);
 
 	return size;
 }
diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
index ef079fc18b72..634bdce5cdfd 100644
--- a/drivers/hwtracing/coresight/coresight-cti.h
+++ b/drivers/hwtracing/coresight/coresight-cti.h
@@ -30,8 +30,8 @@ struct fwnode_handle;
 #define CTIAPPSET		0x014
 #define CTIAPPCLEAR		0x018
 #define CTIAPPPULSE		0x01C
-#define CTIINEN(n)		(0x020 + (4 * n))
-#define CTIOUTEN(n)		(0x0A0 + (4 * n))
+#define CTIINEN			0x020
+#define CTIOUTEN		0x0A0
 #define CTITRIGINSTATUS		0x130
 #define CTITRIGOUTSTATUS	0x134
 #define CTICHINSTATUS		0x138
@@ -217,8 +217,6 @@ int cti_enable(struct coresight_device *csdev, enum cs_mode mode,
 int cti_disable(struct coresight_device *csdev, struct coresight_path *path);
 void cti_write_all_hw_regs(struct cti_drvdata *drvdata);
 void cti_write_intack(struct device *dev, u32 ackval);
-void cti_write_single_reg(struct cti_drvdata *drvdata, int offset, u32 value);
-u32 cti_read_single_reg(struct cti_drvdata *drvdata, int offset);
 int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 			enum cti_trig_dir direction, u32 channel_idx,
 			u32 trigger_idx);
@@ -231,6 +229,46 @@ struct coresight_platform_data *
 coresight_cti_get_platform_data(struct device *dev);
 const char *cti_plat_get_node_name(struct fwnode_handle *fwnode);
 
+static inline void __iomem *__reg_addr(struct cti_drvdata *drvdata,
+				       u32 off, u32 index)
+{
+	return drvdata->base + off + index * sizeof(u32);
+}
+
+#define reg_addr(drvdata, off)		__reg_addr((drvdata), (off), 0)
+#define reg_index_addr(drvdata, off, i)	__reg_addr((drvdata), (off), (i))
+
+static inline u32 cti_read_single_reg_index(struct cti_drvdata *drvdata,
+					    u32 off, u32 index)
+{
+	u32 val;
+
+	CS_UNLOCK(drvdata->base);
+	val = readl_relaxed(reg_index_addr(drvdata, off, index));
+	CS_LOCK(drvdata->base);
+
+	return val;
+}
+
+static inline u32 cti_read_single_reg(struct cti_drvdata *drvdata, u32 off)
+{
+	return cti_read_single_reg_index(drvdata, off, 0);
+}
+
+static inline void cti_write_single_reg_index(struct cti_drvdata *drvdata,
+					      u32 off, u32 index, u32 value)
+{
+	CS_UNLOCK(drvdata->base);
+	writel_relaxed(value, reg_index_addr(drvdata, off, index));
+	CS_LOCK(drvdata->base);
+}
+
+static inline void cti_write_single_reg(struct cti_drvdata *drvdata,
+					u32 off, u32 value)
+{
+	cti_write_single_reg_index(drvdata, off, 0, value);
+}
+
 /* Check if a cti device is enabled */
 static inline bool cti_is_active(struct cti_config *cfg)
 {
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index dddac946659f..cb4736324c04 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -58,6 +58,7 @@ struct cs_pair_attribute {
 struct cs_off_attribute {
 	struct device_attribute attr;
 	u32 off;
+	u32 index;
 };
 
 ssize_t coresight_simple_show32(struct device *_dev, struct device_attribute *attr, char *buf);
@@ -67,7 +68,8 @@ ssize_t coresight_simple_show_pair(struct device *_dev, struct device_attribute
 	(&((struct cs_off_attribute[]) {				\
 	   {								\
 		__ATTR(name, 0444, coresight_simple_show32, NULL),	\
-		offset							\
+		offset,							\
+		0							\
 	   }								\
 	})[0].attr.attr)
 

-- 
2.43.0


