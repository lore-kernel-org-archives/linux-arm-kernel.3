Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1ACEC01B6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 09:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+1wWjC7fh+aHAvyftVm0FHkxDiI5MU51E2SCcX00kUs=; b=X3SSHw5LxRr3CIbUBOpj8qIkuf
	fIuIDdjG3v7r2TVqW0TpjRfodhCA4l1/16ASElVhLWpAglT4U21/cIHMrrpDpRwJ+xdjdbzL5QBv6
	4F/8yYbh/eWHdZ/4/RGSJXKxBx36fq3dPVvwQmjA29B7NZgCy7GoWNvwvQC8PEBqOELnlmk/SCmQL
	CZC1b1coEatO3Y4k4XbqPWJIGNzOvuXFhhTr1XdmJljIXswoxawzfNpJ+XeU5VkBd98Lc46xkP9BJ
	DlpNor0lwVMuezlLCiW9f676CvFQRaZMl3EdbEEmOjcoXzXr5EdFVrq0qLcIiQ3rcixaxn3yQeaxM
	LNP0Tn0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bvI-0000000GPJa-3sEK;
	Mon, 23 Mar 2026 09:50:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bvB-0000000GPET-2Jd3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 09:50:06 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7G49I1220191
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 09:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+1wWjC7fh+aHAvyftVm0FHkxDiI5MU51E2SCcX00kUs=; b=bk0WrT8eGYhDHQ/8
	kTp58Qqov/XMKk5Qvbh/+vkZ3MFovJvBlCrkXh/ssLFW79GgxvDhVT3pk55DEPn6
	87/pTCPXxC5naCzh+wB+wmFwDZvvW20cZAv/iYk38QTkqrj4knQI7DcD82MPz9Xh
	UE1Pir65UHTM2AyCaPy64Ag7yftkpSO/jLBjY3wYU7T8lADXS1iUqvuyoTd0n8zo
	KYlYUQVbehLFaIruIdjYQm391XRKZe5jueXGOvaPvFH/CIwyTsE0K5DnA2d5kzEh
	RCpYmZztnZcjZnS3TTopX0jMShQU+tYHGTUDG0QHsvTJ9HmSy7yi6ilqLNu1i1N7
	1vzN5Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1mghcp7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 09:50:04 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35ba237d2e0so3038920a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 02:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774259404; x=1774864204; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+1wWjC7fh+aHAvyftVm0FHkxDiI5MU51E2SCcX00kUs=;
        b=eAEgxsjPb+dFGpLvtLG1iBY/iqLb2aTX2GyuUn7PgEuZqin+846i5Trqz9loR2zU7T
         oAdkk4nblYm9F9qWV79fqGV3kwDtBqJtajaWOeG730vRSqQl0XBlC9inPFqw5hs4UtUx
         CLUZ7OCAec9bPlsnPhYbA4eAT/dqhLQ3IebC+OIcCiGx7kJBsBMTjAdF6eq7xf3tZ2ZZ
         aqoonpxWOtVb3Bc+t59JU4RaMCKdCW9auH2ICejRfYGfjdKfzvsyCj3XKTluxeDiq5sF
         aisztOSSSIVgjHyIQ9wmOeYVVRX3gTCarpl09PJMtl+CQUN1clPA7reV/+CeNFKcVjqv
         dbNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259404; x=1774864204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+1wWjC7fh+aHAvyftVm0FHkxDiI5MU51E2SCcX00kUs=;
        b=i//U3SQP0P4NALsdc35SNGYmLp4YehKKNgtnC3FPTM6v2fSID2pm9aJaWevh0KW7gf
         pDBGBYCFfgEgFy1gDpIr57rKzEWOHSlFwfaGhDnx5u5yXJ49PQGGnJIWtQq6z8ksM/y/
         HKduJMW4pL+/RItlApIfy+YKTyYAee5DhTv5NCEGzxHtg0FiZIxb8mVgcV9kjHU3jBMN
         WvJ/3s2F+PsNS0p+G+6RWH81lZ/8a55qn0WSx7bZ5zIyZOxcfWWGSfKQHHSA8RtGCNRe
         geEoQ4Gnr7LJ6hSENql4U5Z7AJGVT1z7Z/1V34VAP+HZqkpuowMbHQ6CPXxG9msmyRSd
         2+bQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcGgn/ZoJbALmoG56a9a0JKYzFo4+mt+eoXBSGDp9UFD7cpbICYn/rvOqdUQfqWc16pOTtDTxsdjOInIaq2jAW@lists.infradead.org
X-Gm-Message-State: AOJu0Ywy9SpA6KiIRbiTFylh48/9UggJAnWDFG8TEY8SwCrOXPy9zIyy
	0Q3VQRt1PTA9Un4VhwRzkW+4ywVNyaZ30GQA3KJHgc14rAlMWy724EattU5Nba8czD0xsweYKNU
	eiQXFA/O221XHFRI3MGIQ6KchVHr3zzk7NBGJkpYnMNENJEU2cJ12MAteF7wlJq/JNuMIBn3suo
	3k2Q==
X-Gm-Gg: ATEYQzyngFaV10C/A0Mnb2BPiueMmNkCHTobNRUR0sYwWxrkmHa4MZ8zJs63zW4Es7C
	iW5Is6cRq0K1ejvLWew+AN0bp2TVPONkW4ySCqjqgzKahBhXQB3m/03rqvZl7kIHGFMPvUpp2UK
	14nmeJ/B5rL/Kqc2sMiGah1Y+7G62GPQl8812t/OhWFFmosVMS+DBSF7BccKqMqLfhkFM2fuFvj
	lHgLawWZ3X0TbfmOzPjqJblpz2wb5ioUCoKj3NXZ/1xbRZZjhmfvdorS/ZY1Nh/fDE5qTybqGgA
	q4Py/nG32AWam0Tv2p5G34yVJKUIi42MZ49sN/S2ZVY/ig8NnxByvyr0Gtg3ap0zx4XwaHFZb6K
	4qGw6X3a//DCZEAKQFu+U+RXNq4ugGeHNC4PuGrZq+0C8qh0cwqNwDhx+5A5fmAgYZ9lSSkzcvg
	vUN4ngZMsu
X-Received: by 2002:a05:6a20:7f9f:b0:398:7765:29 with SMTP id adf61e73a8af0-39bceb4772bmr9781621637.34.1774259404270;
        Mon, 23 Mar 2026 02:50:04 -0700 (PDT)
X-Received: by 2002:a05:6a20:7f9f:b0:398:7765:29 with SMTP id adf61e73a8af0-39bceb4772bmr9781586637.34.1774259403738;
        Mon, 23 Mar 2026 02:50:03 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a939af0sm6591935a12.16.2026.03.23.02.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:50:03 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 17:49:28 +0800
Subject: [PATCH v16 3/7] coresight: tmc: introduce tmc_sysfs_ops to wrap
 sysfs read operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-enable-byte-cntr-for-ctcu-v16-3-7a413d211b8d@oss.qualcomm.com>
References: <20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com>
In-Reply-To: <20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774259384; l=5200;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=0THtAIFi5jelKh7Fknxn2c5M5CE76ThTcdKm3o+68rg=;
 b=wvKikvtR4w0c8IuBLQ6hNVCfOt4BETo1zTmLsmCQTrdtpNZ9EdNhVWueFq/22fodFb/JLm6r2
 a+mh0krKnULB0lmLnSI0Gdnj7S5cJ3qWLCjkDmSIZa5e8x1rjkIgcmT
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=69c10ccd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ia3uihG--C1vaqsH_ucA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: -wUhOvi5LPdXch3W_GstFKMPbYN7Trl3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NSBTYWx0ZWRfXwEFMcRqzg0Bj
 TWCI5lI9fN+7eAK+IJcpZZev5Vnltvl937KYMrIpYDHvSfAts+mLTthgAIooFV4i3QMFptyvF0h
 /S8oyHrLDNo6vWwdojbO0asBvDDcgQMH/RwuZD4mHR4l4pyvy0qDU50enLTNvTZJBp1aUNNo98r
 g0SnIbnz8DguJieMqvtxWJ+N6P4qswe1U+KThKlo4OR2KdvdbmtNtG8OnXwVSFMhmx5cg+JeQPs
 ZEl6npWJj33w9BroPRpu7AkinT+h/BEEd+F3GDRINXqrcrMmx+B8Vlidj6dgktzsQqN73ji5tWI
 55ePG+zjCvd+vt7fNGlgeEdg04/D1dfngedLTGH7c2ncdg7ZMqYpSGum2iCvxVcm3H4PXJml5S8
 2AthGaisDNguNuy+YB946vCjQzR1CQtaVcxFuPC46FedT/sKvnF9fEHPtcn0jnIZ7vRB3HYxT6O
 voxoi2yBekYQ5oVN/fQ==
X-Proofpoint-GUID: -wUhOvi5LPdXch3W_GstFKMPbYN7Trl3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_025005_608836_B2BF0F21 
X-CRM114-Status: GOOD (  18.51  )
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

Introduce tmc_sysfs_ops as a wrapper, wrap sysfs read operations,
for reading trace data from the TMC buffer.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 51 ++++++++++--------------
 drivers/hwtracing/coresight/coresight-tmc.h      | 15 +++++++
 2 files changed, 37 insertions(+), 29 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index bac3278ef4dd..110eedde077f 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -228,17 +228,10 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
 
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		ret = tmc_read_prepare_etb(drvdata);
-		break;
-	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_prepare_etr(drvdata);
-		break;
-	default:
+	if (drvdata->sysfs_ops)
+		ret = drvdata->sysfs_ops->read_prepare(drvdata);
+	else
 		ret = -EINVAL;
-	}
 
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read start\n");
@@ -250,17 +243,10 @@ static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
 
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		ret = tmc_read_unprepare_etb(drvdata);
-		break;
-	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_unprepare_etr(drvdata);
-		break;
-	default:
+	if (drvdata->sysfs_ops)
+		ret = drvdata->sysfs_ops->read_unprepare(drvdata);
+	else
 		ret = -EINVAL;
-	}
 
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read end\n");
@@ -287,15 +273,7 @@ static int tmc_open(struct inode *inode, struct file *file)
 static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
 				   char **bufpp)
 {
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		return tmc_etb_get_sysfs_trace(drvdata, pos, len, bufpp);
-	case TMC_CONFIG_TYPE_ETR:
-		return tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
-	}
-
-	return -EINVAL;
+	return drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
 }
 
 static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
@@ -764,6 +742,18 @@ static void register_crash_dev_interface(struct tmc_drvdata *drvdata,
 			"Valid crash tracedata found\n");
 }
 
+static const struct tmc_sysfs_ops etb_sysfs_ops = {
+	.read_prepare	= tmc_read_prepare_etb,
+	.read_unprepare	= tmc_read_unprepare_etb,
+	.get_trace_data	= tmc_etb_get_sysfs_trace,
+};
+
+static const struct tmc_sysfs_ops etr_sysfs_ops = {
+	.read_prepare	= tmc_read_prepare_etr,
+	.read_unprepare	= tmc_read_unprepare_etr,
+	.get_trace_data	= tmc_etr_get_sysfs_trace,
+};
+
 static int __tmc_probe(struct device *dev, struct resource *res)
 {
 	int ret = 0;
@@ -823,6 +813,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
 		desc.ops = &tmc_etb_cs_ops;
 		dev_list = "tmc_etb";
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETR:
 		desc.groups = coresight_etr_groups;
@@ -835,6 +826,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		idr_init(&drvdata->idr);
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = "tmc_etr";
+		drvdata->sysfs_ops = &etr_sysfs_ops;
 		INIT_LIST_HEAD(&drvdata->etr_buf_list);
 		break;
 	case TMC_CONFIG_TYPE_ETF:
@@ -844,6 +836,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
 		desc.ops = &tmc_etf_cs_ops;
 		dev_list = "tmc_etf";
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	default:
 		pr_err("%s: Unsupported TMC config\n", desc.name);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 6e994678f926..a14645b04624 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -259,6 +259,7 @@ struct etr_buf_node {
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
  * @etr_buf_list: List that is used to manage allocated etr_buf.
+ * @sysfs_ops:	Read operations for the sysfs mode.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -290,6 +291,20 @@ struct tmc_drvdata {
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
 	struct list_head        etr_buf_list;
+	const struct tmc_sysfs_ops	*sysfs_ops;
+};
+
+/**
+ * struct tmc_sysfs_ops - read operations for TMC and its helper devices
+ * @read_prepare:	prepare operation.
+ * @read_unprepare:	unprepare operation.
+ * @get_trace_data:	read operation.
+ */
+struct tmc_sysfs_ops {
+	int (*read_prepare)(struct tmc_drvdata *drvdata);
+	int (*read_unprepare)(struct tmc_drvdata *drvdata);
+	ssize_t (*get_trace_data)(struct tmc_drvdata *drvdata, loff_t pos,
+				  size_t len, char **bufpp);
 };
 
 struct etr_buf_operations {

-- 
2.34.1


