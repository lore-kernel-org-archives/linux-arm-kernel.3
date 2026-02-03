Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55638E83057
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 05:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=51VyzH5MVWt5pCU+WtqPfgt9gr9jXVE/0KTTZNnKYmU=; b=eFymmVFu/3ZHNlAmXqoRJiTnXi
	H1l0stR2iZz5ewRYWlB95nH8wIMIIg9k9nKESr6GZZvqUN7N5eeMCoJ+jgTCOoIm8uYpJT7f6CLZ1
	s1uVcEregwauv7y0467edvLYzlEP9aZXWVK0u1M6nxlGsNzz3h0xs7IKoexid0ZvIYSGHJ/np3JkV
	qvxmUGxS4p5x4djkeySEJVKh9AOKzkZQjZPVOxv4RpYbqcHBMj2v9DI9dHiPfeGOsFJPI2k2uvFdX
	DxxAp81Yjz8ZsANONn9ypUmL7zwmkwo0dfifPdS4iulcwTLHbg4T3+f9HyrV9RKsuGGY3iihD+bNQ
	LiSVtNBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9Ka-000000068SZ-3kCP;
	Tue, 03 Feb 2026 05:52:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9KY-000000068RU-17sx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 05:52:08 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612JP8Tf3916029
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Feb 2026 05:52:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	51VyzH5MVWt5pCU+WtqPfgt9gr9jXVE/0KTTZNnKYmU=; b=En++TTvUAIK5TZHQ
	J+sDgDrZmY2qq6ex6kuRa6RApo9SnxG2GekP3G1ttyHiaXDkoeeXtTymcq2GeTEC
	6vurqtAYnx2eVeNyiIM5D5LhXL2/Leni3hhMnRgpCaB1aIoPm0EnsmmflmScYfND
	StkMisUmOHF1lkbrekNKJsv+4pGt7TIYvBb3aNRabaLMrBELzvJ15t7auLL4Uhin
	lgJBKlzgbfOyABwEsyi2ePj+NPOcwo36t8h4TqF0cGL2ZKlT8zM1xNRtp5qxi9lD
	FPneeTXzmQxXWfF8KialDDe08FOZvncl7I8yie/35FOtqQoRduiRVFQews+kNVJu
	XUPL5A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tkmk3a7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 05:52:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0bb1192cbso44008795ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 21:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770097924; x=1770702724; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=51VyzH5MVWt5pCU+WtqPfgt9gr9jXVE/0KTTZNnKYmU=;
        b=fN6OqAPGY8Ll0G8TM0gCyv7ZdVEjAU+qiiqtRD1cODRhFnTo5GOHprF1c2G/RQnDtb
         OzTZnt9QsYQskAaZyUMg+9r/m30ycrMIQpNsfvcb+DouSeYDhdB9blhXmLnREWYeCc6n
         yc0k9/USzbDYCSsLWVAYxW701VPJoYBfYnP5kyCZwhH93A/hd6rpoyEOBPxmpnE2Hgfi
         zknQquGz2Rnzrth1Ip9o+tIhbW4ZCF6eDXao1OVCL/f+98NdX07BuDRwiI9R0+eGTnoj
         1Rro+ns9WBUSapgLw8Uwz/LexkOg9Ynu3shTB3uHfKSrBkg2tzgz0PYUcBAsjmRnUKmK
         C28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770097924; x=1770702724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=51VyzH5MVWt5pCU+WtqPfgt9gr9jXVE/0KTTZNnKYmU=;
        b=J+IO7yu1IRc21rY77khwLCyLkQQ8ahEHemrNhaB+AAIGKRkTdbWAaRm/SLAJ7qGqQY
         NG5flQ6kmOHEIa8tipfdm8Vp7jk7z283fymWqyvvsN3RdMb9pzMibcbTzXSR0wV5Kvtu
         2xbiThK8tfUwh2oHPFO/Z28syMwaZx7M3YnLrR9xZH3WUFBVWd4WZrRIO7TIcyRc4VaI
         EprFN97k8i8m6XL2iRi+CQ/9oyJ8FijS8OHeY/whce7lx0tWhYXgwIX+ARjbA9Cg29ji
         8PseUciwuu+4FZCzF7wcjI30N/EACagJs/cMdxqGNwbXoRdjwHOo4P5nHU5CNHKuiy2b
         ueIA==
X-Forwarded-Encrypted: i=1; AJvYcCUFM7Uh6CGdaoKpSjGbdV31YTRoN72mOBmOrrOkBNA35CymwAts6JCpCzBYMu5tnasgkhHzEjBGfsHVBbrdh1t6@lists.infradead.org
X-Gm-Message-State: AOJu0YwrN8JxGk68QzdJukWllOQ6ycC0xoB6T+1ULW/zv6XYaAaj313k
	O/Go1AtSuO9/8O2bY/0pornRC761bAwyjx98e7Me/aV2TUfEzskei8eqmVpRkh7YZ5fHV9k0xOR
	/qI1VI+2UHcbfMF0LBcVSB3BbAfwYYYGLuDD4Mix4ZX2tIZsVcl0/dg6lqxYhvzFnIfrN5zWb1W
	cl0Q==
X-Gm-Gg: AZuq6aJgFvhZ5GQ0yu68ekkCiuMYhHEVL/NDqtD6Nju8HaCrp2vsbyBPdfQfZQmAmL9
	c8FgHZd6UC/b5YcE+NtxlUx6d2e3914KEVDPfXNlWfAwlE25+JDxxbtvG4P4qFGOezxKH33LvFh
	yzUhG5NZj0ML82qre/1LxQUdhwzXEt+rIqjJUeGNJ/oFKHpdy9n5KPL5wQybjuW3rA6NLZtRGNB
	cpXnSsBPFxCOifE0csHfSJo1PjyPGnZEdkwJzUkxbz1FhvD7vTEGnwloAOBp1Vnobu3Nxfddk8M
	AQ7glTqu1jec+jKAt4s9HxQ8UR25uZ6701winiKWBYb0jvNV9mRQYR+ZePr3fYpRoic8Y12VFKV
	hNjl8n1a60Bom0SysnSsg1ZqRqEmGGvXZVUfNQpXUhQ97Wi/aKsdgxOtuzti8vlIOjyHD1jB9
X-Received: by 2002:a17:902:868d:b0:2a0:9970:13fd with SMTP id d9443c01a7336-2a8d9943c36mr99480675ad.43.1770097923977;
        Mon, 02 Feb 2026 21:52:03 -0800 (PST)
X-Received: by 2002:a17:902:868d:b0:2a0:9970:13fd with SMTP id d9443c01a7336-2a8d9943c36mr99480535ad.43.1770097923508;
        Mon, 02 Feb 2026 21:52:03 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b6e4189sm157424735ad.83.2026.02.02.21.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 21:52:03 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 03 Feb 2026 13:51:19 +0800
Subject: [PATCH v12 3/8] coresight: tmc: Introduce tmc_sysfs_ops to wrap
 sysfs read operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-enable-byte-cntr-for-ctcu-v12-3-7bf81b86b70e@oss.qualcomm.com>
References: <20260203-enable-byte-cntr-for-ctcu-v12-0-7bf81b86b70e@oss.qualcomm.com>
In-Reply-To: <20260203-enable-byte-cntr-for-ctcu-v12-0-7bf81b86b70e@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
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
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770097896; l=5212;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=CwCT5/x9boKhb1Ajkz+foUdUOzmm0/q81QDotkFpGzA=;
 b=kA+GBzzIvXNSvvOWRPmGgpNHQ4tzGkRgViKapki96YY2xM5iV5eA7MLSGbpTQeREnapw2+UDm
 sLP7eOQq/76Cxv3LJb0q7HMP+V2TISsKCLBlFP9H35U2ntJPBaC2O5K
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=TaebdBQh c=1 sm=1 tr=0 ts=69818d05 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=ia3uihG--C1vaqsH_ucA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: XaD_IxL3rp_ruqQg7GdN8EnEXl_DDW3-
X-Proofpoint-ORIG-GUID: XaD_IxL3rp_ruqQg7GdN8EnEXl_DDW3-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA0NCBTYWx0ZWRfXztouEzKQ/EFm
 6zXL3B2M4sUlJfT5O6TGr9jhJibN5XnNtzCnL9vVO2RG/pf75wyPonXPhWr7I4V5c32jSzr7dab
 P+Z6bDRd8rlTRFMr2gphZ5B93fL5sVPP9G8smkBbOBa0DgTwTFd4sCZUXJIX8xVIgH5pUWiboOt
 r8J6TE5uVTkB9Wa1vihShnLkTQx8Pkm83X/UsnW2woirC+b0mU9L2TBJVIFglZQDBwi2LhRh12U
 ixwSlxA5B4eB9vFgm71Db7nw/3K3phFMs/l3gBZzFKqrkA2vQwMIZ475a7adRjbuxfY/cgAvMpz
 uKCGQe5B9yH4vGLP6zZ74Lsw4kXtqjaazIE1z2huItAH038Ht2kR2ZLrvRCk9x1cz1mbiqOA30K
 Gf24mex28KWJCB7uIrB2GtizNCzXX5+xfpjlYZ8fLZmFNduUAI0Q0ezKmvt+xaq7telyO05LDYp
 iTZMd5vKA3GkOKP6hyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_01,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_215207_207083_3D06154E 
X-CRM114-Status: GOOD (  18.07  )
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
index 9b3c4e6f0a5e..c780f6d5dede 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -258,6 +258,7 @@ struct etr_buf_node {
  *		 Used by ETR/ETF.
  * @etr_buf_list: List that is used to manage allocated etr_buf.
  * @reading_node: Available buffer_node for byte-cntr reading.
+ * @sysfs_ops:	Read operations for sysfs mode.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -290,6 +291,20 @@ struct tmc_drvdata {
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


