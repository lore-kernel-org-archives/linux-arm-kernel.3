Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264FDC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 12:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TbYlrtnqTvqrRHZiqDZ3OZ464UHy7JqGH3TSAiwzqiY=; b=B7HaJwQ/4mJlnEu30m/aw465h+
	jyQuzA7nIDh/sftm73nQId/D7Hiw3z/S+V8RP+zs3wxp+CXEK6BfGjqTMU3YNFTBIT70hJY6jqsQl
	yTIBdfgG2PDaumW2SghkIjPSmTTwThwisSLKgvq8Bs6AuYPB5H/bwZMsFlHdZWMyrwr9olvFhVwCq
	ZGfqckyxRp7j29MM2xUALrdEvdbEjIE1ZepEA1LNdPmFph82GcUTcdcJz1NTBWlIZcCDaIHQZ5ztP
	BHlYB8twO2zqLG7dxMmwH12uTzWn7pvQ+P4MQYDlLzBX70jJKyN136OIhsjzFsNKrSG8OsfL6jksv
	3cxN8A8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZUMk-00000008hQy-29LF;
	Wed, 09 Jul 2025 12:57:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZSF3-00000008L9P-3k4V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 10:41:35 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5697j8Jq009159;
	Wed, 9 Jul 2025 10:41:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=TbYlrtnqTvqrRHZiqDZ3OZ464UHy7JqGH3TSAiwzqiY=; b=Ly
	9XizCNZneT/mZeHl+RZvnf8vWc5D8iB+VAHk2B4tVH1cDjP3Mj/2RDp+UiZFtEsJ
	GI9HyYPAcHTL3CnvGFeh9iEu1mfpe1IFOJjXKP0G7sfIh26BS0z5wqXQNDaOpdis
	zJcx+pqU/yEdq3SqsIfMqwBel60Xnx0sqDn8gh3ZwImXvTBOQ4JZSf4xzeTXMrVE
	ULPzE4bLHP1a7ymwjItLerydqvonnY1n7kmjMWyNyinAGRrFm/C/qYX6bY9q2gNG
	QngrbcwyaCzRsnFGhxUPTxW35ERfsdDERqBkGpMYbS7tlnw5JKeOz2rq+Wo5bcP5
	e9Nr/9G/zIXJvU/nAQ3g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smafghth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Jul 2025 10:41:25 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 569Af2OD005364;
	Wed, 9 Jul 2025 10:41:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTP id 47s9h16ufk-1;
	Wed, 09 Jul 2025 10:41:24 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 569AfO4B006174;
	Wed, 9 Jul 2025 10:41:24 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-songchai-lv.qualcomm.com [10.81.24.255])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTP id 569AfOVE006173;
	Wed, 09 Jul 2025 10:41:24 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 4201483)
	id E0FC25010D0; Wed,  9 Jul 2025 03:41:23 -0700 (PDT)
From: songchai <songchai@qti.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, quic_songchai@quicinc.com
Cc: linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v6 7/7] coresight-tgu: add reset node to initialize
Date: Wed,  9 Jul 2025 03:41:14 -0700
Message-Id: <20250709104114.22240-8-songchai@qti.qualcomm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250709104114.22240-1-songchai@qti.qualcomm.com>
References: <20250709104114.22240-1-songchai@qti.qualcomm.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZJ/XmW7b c=1 sm=1 tr=0 ts=686e4755 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=TW7uPGGm3D3UErKGQS8A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: TBsb_jYgOhDEDA_BDTOlYS_8veUNln4I
X-Proofpoint-GUID: TBsb_jYgOhDEDA_BDTOlYS_8veUNln4I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDA5NiBTYWx0ZWRfX5IcD8deJLRDh
 Fb0D/kQbxbyBjL19tON1D6BKzeSyN3IRjajrqSeoqo3sVj0WeU3DDp5xoe/gXaFRyYytrB47F6M
 lqMvABbVqR0FN9hElL6PF6doEzNd3DG0pG36eGaGmWJuHuV/T2pr/1os43Yyap2vfNxLD3VUIDa
 B8AF9YTyJGyGKI2g6Si3s1T0zbtqDKxVe5IDZVFcOHfSKDwy+llD4h+PQni7Yb7USqevBciDntv
 KFcS2E4krJEy3Umbq/7PpohW89FyitpFz5VHrkzOeVJxxP5hkmTQ5baLoD7ofNHT0NDpQyVP1/a
 aCAHmIWfYCrB792a/EBC7+YLt0N2ZH6szPMVY9ILKkJDC+5VdDEDtu1BLqbxXIsuiodqe98EDm4
 gPibXEzaDh08Joy3W3M8tuaVyBAdopXVbU1GWLzKkRB8RtndbYKkH6XfCuiGmbGFkH4mwEx/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_02,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 impostorscore=0 spamscore=0 adultscore=0 clxscore=1015
 bulkscore=0 phishscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507090096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_034134_045725_5C73C6D3 
X-CRM114-Status: GOOD (  17.73  )
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

From: Songwei Chai <quic_songchai@quicinc.com>

Add reset node to initialize the value of
priority/condition_decode/condition_select/timer/counter nodes.

Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>
---
 .../testing/sysfs-bus-coresight-devices-tgu   |  7 ++
 drivers/hwtracing/coresight/coresight-tgu.c   | 75 +++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
index f0d7db72b61c..4ff5ec9be733 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
@@ -42,3 +42,10 @@ KernelVersion	6.16
 Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Songwei Chai (QUIC) <quic_songchai@quicinc.com>
 Description:
 		(RW) Set/Get the counter value with specific step for TGU.
+
+What:		/sys/bus/coresight/devices/<tgu-name>/reset_tgu
+Date:		July 2025
+KernelVersion	6.16
+Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Songwei Chai (QUIC) <quic_songchai@quicinc.com>
+Description:
+		(Write) Write 1 to reset the dataset for TGU.
diff --git a/drivers/hwtracing/coresight/coresight-tgu.c b/drivers/hwtracing/coresight/coresight-tgu.c
index 303698a9d5ab..35c97f31639e 100644
--- a/drivers/hwtracing/coresight/coresight-tgu.c
+++ b/drivers/hwtracing/coresight/coresight-tgu.c
@@ -473,6 +473,80 @@ static ssize_t enable_tgu_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(enable_tgu);
 
+/* reset_tgu_store - Reset Trace and Gating Unit (TGU) configuration. */
+static ssize_t reset_tgu_store(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+			       size_t size)
+{
+	unsigned long value;
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	int i, j, ret;
+
+	if (kstrtoul(buf, 0, &value) || value == 0)
+		return -EINVAL;
+
+	if (!drvdata->enable) {
+		ret = pm_runtime_get_sync(drvdata->dev);
+		if (ret < 0) {
+			pm_runtime_put(drvdata->dev);
+			return ret;
+		}
+	}
+
+	spin_lock(&drvdata->spinlock);
+	CS_UNLOCK(drvdata->base);
+
+	tgu_writel(drvdata, 0, TGU_CONTROL);
+
+	if (drvdata->value_table->priority)
+		memset(drvdata->value_table->priority, 0,
+			    MAX_PRIORITY * drvdata->max_step *
+				drvdata->max_reg * sizeof(unsigned int));
+
+	if (drvdata->value_table->condition_decode)
+		memset(drvdata->value_table->condition_decode, 0,
+			    drvdata->max_condition_decode * drvdata->max_step *
+				sizeof(unsigned int));
+
+		/* Initialize all condition registers to NOT(value=0x1000000) */
+	for (i = 0; i < drvdata->max_step; i++) {
+		for (j = 0; j < drvdata->max_condition_decode; j++) {
+			drvdata->value_table
+			->condition_decode[calculate_array_location(
+			drvdata, i, TGU_CONDITION_DECODE, j)] =
+			0x1000000;
+		}
+	}
+
+	if (drvdata->value_table->condition_select)
+		memset(drvdata->value_table->condition_select, 0,
+				drvdata->max_condition_select * drvdata->max_step *
+				sizeof(unsigned int));
+
+	if (drvdata->value_table->timer)
+		memset(drvdata->value_table->timer, 0,
+			    (drvdata->max_step) *
+				(drvdata->max_timer) *
+				sizeof(unsigned int));
+
+	if (drvdata->value_table->counter)
+		memset(drvdata->value_table->counter, 0,
+			    (drvdata->max_step) *
+				(drvdata->max_counter) *
+				sizeof(unsigned int));
+
+	dev_dbg(dev, "Coresight-TGU reset complete\n");
+
+	CS_LOCK(drvdata->base);
+
+	drvdata->enable = false;
+	spin_unlock(&drvdata->spinlock);
+	pm_runtime_put(drvdata->dev);
+
+	return size;
+}
+static DEVICE_ATTR_WO(reset_tgu);
+
 static const struct coresight_ops_helper tgu_helper_ops = {
 	.enable = tgu_enable,
 	.disable = tgu_disable,
@@ -484,6 +558,7 @@ static const struct coresight_ops tgu_ops = {
 
 static struct attribute *tgu_common_attrs[] = {
 	&dev_attr_enable_tgu.attr,
+	&dev_attr_reset_tgu.attr,
 	NULL,
 };
 


