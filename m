Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFED9E98DEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 06:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLBqq1Ga3quq8yhCCoDLuhaEl8VPL3r4ILjvN9DeBME=; b=zeqNRKeTwRp3bIq4n0pE2L5mkt
	a8TDrbYvw14blYxgL4oOdpmcPu6fzUFCFdbDKxw3Qi6atvEAx2cjQ1ktz0uNkNGPzTF+wSg+Smx9Z
	KtKSHwSGD8GgG1ELh1So5bMzCBqhNa84/IXkG1+/wX2cD/0RtkLcBc4+ynRYf6JtklFW9yBmfiUph
	9VqV8NboJ3vHRpb3VcHridwieo7NenscN9tnxsyDKQgONFK15qcG14+nj1C90z87l+dgtOWkT3OTN
	/XEy4/VjL3fTM6rT23K2olTyiTKrcYK92RDuxveXcjNSq9ROup+YZOg7J5XkkOBpi+cor+F6wAW7Y
	ulooj51g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuPru-0000000HKW2-1bSZ;
	Mon, 23 Feb 2026 06:56:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuPrr-0000000HKUi-3BKu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 06:56:32 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMNgU82211942
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 06:56:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oLBqq1Ga3quq8yhCCoDLuhaEl8VPL3r4ILjvN9DeBME=; b=RQjMkT1cCeTTegtR
	yAX8UtkpknrBVwzzvlcZysykP41Z2IJOCBOl15Hws2nhaWjtf18PbqIk7AK1OBju
	AoUVi4GdgIdUXE9h2033K8iPSoxAICESMUVvc0Lh8VeN4YFbjz9ZfopTSQHXZPIf
	Z+4zNl34ug6U6mUgwQ5EdTV2TCFuwbN99VmJgSfmH0+s6H9anPlUAHHZ4hF/QlN8
	RMzEfgepJ5CzHDgDMmLr8oue3UsNGWi2jCy16qiDlXjRi+gvmAAVfp50uWpchev0
	85c5VTTYZ8Qkc726RBzCg1xGiNU5GK1kDgdbx8qll+q2Ww9tkuOh9s1TuyTQduz7
	6uEj/A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5v3up3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 06:56:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a7701b6353so47894835ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Feb 2026 22:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771829790; x=1772434590; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oLBqq1Ga3quq8yhCCoDLuhaEl8VPL3r4ILjvN9DeBME=;
        b=F89+4BJb/G4hf4IbwTQI1IC0WxAHbKoPa5DAzplCZMKqLqdYGpICEajL5NEr1rlaLB
         w/vG4YwKY8BuIQCOEL+6fbyjn8Hl/1uYUOrxoC++gMOmVcje7aGrub5DYAQVH+uBVL/z
         5PArbcd0hg5U3HGt7A7cMuXWc3SRbyxxbokZu7qlLzZoSU8HDNYAMMpcio7D0aULd6h9
         nvy7CyAmW721cKDPs8ey3pMDeb1WgWP/b2pqyyomQCWLsYTkFcNJJT3qnlHd1G4M7C9I
         AXpvNReW5pxA+13a42rVcoDd4w6f284wYPXxTbimcjmjapXGpQhgDKW1lhQLYq4u+3E2
         R3ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771829790; x=1772434590;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oLBqq1Ga3quq8yhCCoDLuhaEl8VPL3r4ILjvN9DeBME=;
        b=AJUZLO/Rh1TU0fSwAymOPrRm/a5uSs/cuK07tc2aP+2+P+aiY8Hh1e0bbrC9eFdPMn
         vbM9TdPEL8d9SH1UleyF2/j9pfjRr0jImeizPWvQHxBK6EfBI23RpNT8umr4ai5pMBl0
         9zXwiuHUPLG4Bn7uV27CQKzFm+YD2jcPVMcU2RRNBWJZVO0w6aSHtrFxeaxX0E1DhkZk
         ZdGWFhUraIlVKdPo0HP8O3dUGlTi0lucxppc7yoPM1A7Qdq62z88nmcOV6gkKuh1HgYu
         uRD0vzkxy/m1b0BHPX7UIhNeJowT6ryAxsxZOMktSrxmPzFCQvIES3Z40oCkB8XRIrrt
         MotA==
X-Forwarded-Encrypted: i=1; AJvYcCWFt6SoAvLuzJ87UyvVAazG/FFNAjVxD/76HD5NTNZhVU+IyzV7N//szVi4fbvC9iT/Iu2HhSiGwFap44QL6oNi@lists.infradead.org
X-Gm-Message-State: AOJu0YzGsKOzHflPzwMqc+fhYuBnQyg3cwbEGMPKoGW4iBEgK8HL0wMP
	XV0QPz4INjsZ9ka4o3fDdYKCwVDeAz/SUJd2wWOr8QlEFhg1ce7c7xI6OoLsGxPkQPNxhbdONoW
	FB5dLk51FU1KMsQ5E65QCzB+QzgaCuQoCBxBat4WeAPeVt2BdifDDfCUNLDOBNEToPE++5ER31C
	TKdQ==
X-Gm-Gg: ATEYQzyqA+Lo/+JekOow257DcT0PR2k+Gw7kHIrXSoJG37JaOXONswy1ttXt1B+TPIq
	nx7oaU+Oa6dx1uKXZUkIJqSH6NAxWUKQXDy5wBm676RRQgQAq0xyLYR8R9P4nwHQ/TD8//tHOBc
	PyRHtWIonJQEBTiGo55MTGRU5D6AYxoZLGoCNTGJveg/NLNVxotxlxCJcTzlT8W3e9Ee3a4hfaN
	cXQCF6el3KevQ6OUp5xoPKbPoCT7Zlgf6zu9Wm3SysXopF0woxOOhSf8cRfWO8Dt08sqD5/TVnl
	YQn88lOuqipfnkiW63CZ6NeNryiIbnAih3b3rqiL5SA5s7Bp40V+CjnZW4tPUFcGolEnzJvU6sL
	FgBF/VQqDLp/p6r4nh2z1HVfKO6uxTZ6IqZjiHQfFSf8l2HEC+EmR1KJvLekGx7wQj5j4Ao7c2H
	8H/Zdfck/gfrXn
X-Received: by 2002:a17:902:fc85:b0:2aa:e23c:2697 with SMTP id d9443c01a7336-2ad745984bamr63944055ad.57.1771829789769;
        Sun, 22 Feb 2026 22:56:29 -0800 (PST)
X-Received: by 2002:a17:902:fc85:b0:2aa:e23c:2697 with SMTP id d9443c01a7336-2ad745984bamr63943935ad.57.1771829789311;
        Sun, 22 Feb 2026 22:56:29 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74f619f8sm62249225ad.36.2026.02.22.22.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:56:28 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:55:43 +0800
Subject: [PATCH v13 3/8] coresight: tmc: Introduce tmc_sysfs_ops to wrap
 sysfs read operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-enable-byte-cntr-for-ctcu-v13-3-9cb44178b250@oss.qualcomm.com>
References: <20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com>
In-Reply-To: <20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <Mike.Leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Mike Leach <mike.leach@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771829766; l=5212;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=wH5nsU/eD/1ygNqCsVaoWKHsLxpu0A62Fho+0L9SEqE=;
 b=H43pKn8Uscw3mu08d+dMVb0DXKlrPYSYoKHYO/ML3Gr05Uq7OROqtpWA8vYBorTTw9EQ/UW8O
 tryQ8J9+2a+AkzQvxYExucJi3ODdnVcCnQIyIy1CNbZWZjbnzCkdJtl
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=YL6SCBGx c=1 sm=1 tr=0 ts=699bfa1e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ia3uihG--C1vaqsH_ucA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: GPGiqHGNbfkrsdE8bI4dKHpf4Titynxf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA1OSBTYWx0ZWRfX9phjkzNCrBnd
 QbQvGJfukz0GKXgOTEH5coitP81+dbjdmVVoRiZ/+7bhFSjRv3KJW1srFG5YKWT4Pd8d8AVfQiQ
 M8BNQfPtrMsDrhzlFvyzRF3LCfGlHnSSnEQ2V9XB0a05/nZo5cm0/8huKbVtvBoQSel41imgZtM
 relq+jrElbq950K7ALFUAzlFDVVy7C6+B8gQs5YnhiHuSCe0FhrZyiyxD59Dx9L2dnYqknGpcoy
 i5pCy0LC4Fp5XCbDELKP4eYw/RxMEAICUnyeIlQdwor4Xx1hLHxDaLhuGqtBIxA1iu5NGnueGFD
 /S9XJ2QGbjQ4Tggxn9ftLmpbTxV3l3Ga++GvZq/o7Ix+jorIzKcAd+FIkoAulI49wwAwqxft+J3
 +PmNksioHV+B3Rv97wlAFB2fa3PkXgIqnS46wcDfmyS2foz/taqrsRmjfnriJjX/kgMPNCgwKEF
 viogCn+po8LLU1XdY4Q==
X-Proofpoint-GUID: GPGiqHGNbfkrsdE8bI4dKHpf4Titynxf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_225631_914569_E5CD5226 
X-CRM114-Status: GOOD (  17.46  )
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

Introduce tmc_sysfs_ops as a wrapper, wrap sysfs read operations, for reading
trace data from the TMC buffer.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 51 ++++++++++--------------
 drivers/hwtracing/coresight/coresight-tmc.h      | 15 +++++++
 2 files changed, 37 insertions(+), 29 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 1ea255ffa67c..32ca2ec994de 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -232,17 +232,10 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
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
@@ -254,17 +247,10 @@ static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
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
@@ -291,15 +277,7 @@ static int tmc_open(struct inode *inode, struct file *file)
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
@@ -769,6 +747,18 @@ static void register_crash_dev_interface(struct tmc_drvdata *drvdata,
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
@@ -828,6 +818,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
 		desc.ops = &tmc_etb_cs_ops;
 		dev_list = &etb_devs;
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETR:
 		desc.groups = coresight_etr_groups;
@@ -841,6 +832,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = &etr_devs;
 		INIT_LIST_HEAD(&drvdata->etr_buf_list);
+		drvdata->sysfs_ops = &etr_sysfs_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETF:
 		desc.groups = coresight_etf_groups;
@@ -849,6 +841,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
 		desc.ops = &tmc_etf_cs_ops;
 		dev_list = &etf_devs;
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	default:
 		pr_err("%s: Unsupported TMC config\n", desc.name);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 57d8394d09b7..92ffaf771fea 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -260,6 +260,7 @@ struct etr_buf_node {
  *		 Used by ETR/ETF.
  * @etr_buf_list: List that is used to manage allocated etr_buf.
  * @reading_node: Available buffer_node for byte-cntr reading.
+ * @sysfs_ops:	Read operations for sysfs mode.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -292,6 +293,20 @@ struct tmc_drvdata {
 	struct tmc_resrv_buf	crash_mdata;
 	struct list_head        etr_buf_list;
 	struct etr_buf_node     *reading_node;
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


