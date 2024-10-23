Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE14CDDE5D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 10:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZ8yOjy5Fjyj5INh4hG8cqr2Ci2d83sLKwBHm9onm9Y=; b=Ip5PZKUVj94oNNBGq+sGelM/0d
	gEoIzLHZLhpjIuJiXl9tgXEIqKKW/DB7b/bPrQIu44gxJpF4o1hdJuDsKMRUJ+oK5dOCIOlXOco/2
	XWmuZacvT9q+nEWUEirA2Gqh2o9Scl1IgQaM9YEzgHr37+Ct0DfO8XWrDFArcnE+8WgHllBJitiHN
	W2rDLVkaNev+Wc+vybV2119jcnLMYklgLyMYsZQET9cdtqHXuzFYetXUeRhN4BH5FCvg5z07qqRkj
	9rjXPx+UyyfNjOK6+RGrplt+Pn9ziGnDK/zt0ce7f3G7c25egV3Tq7r+AH4j6DwZg378O+gNUGIx8
	1WsCWRwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Ycu-0000000DzqM-0Dao;
	Wed, 23 Oct 2024 10:30:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3YVU-0000000Dy4p-2XdN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 10:22:26 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49N9M6bE025421;
	Wed, 23 Oct 2024 10:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rZ8yOjy5Fjyj5INh4hG8cqr2Ci2d83sLKwBHm9onm9Y=; b=XrwpfzE26YzvQbmj
	MbbpuDQZNCivpthfmy9XG2iwp5SukM2thY36HI1v7ul8oFGTjiimXfC6rKW8MEyR
	dGkci+PLfqs051zrs4sOq55fGo2V8lJXA7SHZMmQlWdH5sjz2/a1WxvzeGdAfpV1
	p/8N5YKlB1ObBGSs4Jpve1PM2TJ4xHQcLj2CSiWn5E2uqDxKD4krXg0+Y/+syluo
	tk4ubrONvKE2FjBKKXySCcJZhMGZeI1mUldHxGY7F3QOZQJaY6muYOrsWhac3Rbz
	jIdmRxkE+80rCsBKyeBnCu0pM9PkZU66VLktCnOd6ZDLrQ+SMMvqHXKjxhpwoaUf
	af2OiA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em409u0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 10:22:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49NAMBsB010061
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 10:22:11 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 23 Oct 2024 03:22:06 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>,
        <ulf.hansson@linaro.org>, <jassisinghbrar@gmail.com>,
        <dmitry.baryshkov@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <arm-scmi@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_sibis@quicinc.com>,
        <johan@kernel.org>, <konradybcio@kernel.org>,
        <linux-pm@vger.kernel.org>, <tstrudel@google.com>, <rafael@kernel.org>,
        "Johan Hovold" <johan+linaro@kernel.org>
Subject: [PATCH V4 1/4] firmware: arm_scmi: Ensure that the message-id supports fastchannel
Date: Wed, 23 Oct 2024 15:51:45 +0530
Message-ID: <20241023102148.1698910-2-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241023102148.1698910-1-quic_sibis@quicinc.com>
References: <20241023102148.1698910-1-quic_sibis@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: umOjxMZjTYOFCPoqUh3ONsbUSG4jS-u_
X-Proofpoint-GUID: umOjxMZjTYOFCPoqUh3ONsbUSG4jS-u_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_032224_679316_6EE9924E 
X-CRM114-Status: GOOD (  18.55  )
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

Currently the perf and powercap protocol relies on the protocol domain
attributes, which just ensures that one fastchannel per domain, before
instantiating fastchannels for all possible message-ids. Fix this by
ensuring that each message-id supports fastchannel before initialization.

Reported-by: Johan Hovold <johan+linaro@kernel.org>
Closes: https://lore.kernel.org/lkml/ZoQjAWse2YxwyRJv@hovoldconsulting.com/
Fixes: 6f9ea4dabd2d ("firmware: arm_scmi: Generalize the fast channel support")
Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
Tested-by: Johan Hovold <johan+linaro@kernel.org>
---

v3:
* Pick up R-b, T-b from the list.
* Move scmi_protocol_msg_check to the top [Sudeep]

 drivers/firmware/arm_scmi/driver.c    | 72 +++++++++++++++------------
 drivers/firmware/arm_scmi/protocols.h |  2 +
 2 files changed, 41 insertions(+), 33 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 5bd4cc68a3e3..36195f177ade 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1705,6 +1705,39 @@ static int scmi_common_get_max_msg_size(const struct scmi_protocol_handle *ph)
 	return info->desc->max_msg_size;
 }
 
+/**
+ * scmi_protocol_msg_check  - Check protocol message attributes
+ *
+ * @ph: A reference to the protocol handle.
+ * @message_id: The ID of the message to check.
+ * @attributes: A parameter to optionally return the retrieved message
+ *		attributes, in case of Success.
+ *
+ * An helper to check protocol message attributes for a specific protocol
+ * and message pair.
+ *
+ * Return: 0 on SUCCESS
+ */
+static int scmi_protocol_msg_check(const struct scmi_protocol_handle *ph,
+				   u32 message_id, u32 *attributes)
+{
+	int ret;
+	struct scmi_xfer *t;
+
+	ret = xfer_get_init(ph, PROTOCOL_MESSAGE_ATTRIBUTES,
+			    sizeof(__le32), 0, &t);
+	if (ret)
+		return ret;
+
+	put_unaligned_le32(message_id, t->tx.buf);
+	ret = do_xfer(ph, t);
+	if (!ret && attributes)
+		*attributes = get_unaligned_le32(t->rx.buf);
+	xfer_put(ph, t);
+
+	return ret;
+}
+
 /**
  * struct scmi_iterator  - Iterator descriptor
  * @msg: A reference to the message TX buffer; filled by @prepare_message with
@@ -1846,6 +1879,7 @@ scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
 	int ret;
 	u32 flags;
 	u64 phys_addr;
+	u32 attributes;
 	u8 size;
 	void __iomem *addr;
 	struct scmi_xfer *t;
@@ -1854,6 +1888,11 @@ scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
 	struct scmi_msg_resp_desc_fc *resp;
 	const struct scmi_protocol_instance *pi = ph_to_pi(ph);
 
+	/* Check if the MSG_ID supports fastchannel */
+	ret = scmi_protocol_msg_check(ph, message_id, &attributes);
+	if (!ret && !MSG_SUPPORTS_FASTCHANNEL(attributes))
+		return;
+
 	if (!p_addr) {
 		ret = -EINVAL;
 		goto err_out;
@@ -1981,39 +2020,6 @@ static void scmi_common_fastchannel_db_ring(struct scmi_fc_db_info *db)
 #endif
 }
 
-/**
- * scmi_protocol_msg_check  - Check protocol message attributes
- *
- * @ph: A reference to the protocol handle.
- * @message_id: The ID of the message to check.
- * @attributes: A parameter to optionally return the retrieved message
- *		attributes, in case of Success.
- *
- * An helper to check protocol message attributes for a specific protocol
- * and message pair.
- *
- * Return: 0 on SUCCESS
- */
-static int scmi_protocol_msg_check(const struct scmi_protocol_handle *ph,
-				   u32 message_id, u32 *attributes)
-{
-	int ret;
-	struct scmi_xfer *t;
-
-	ret = xfer_get_init(ph, PROTOCOL_MESSAGE_ATTRIBUTES,
-			    sizeof(__le32), 0, &t);
-	if (ret)
-		return ret;
-
-	put_unaligned_le32(message_id, t->tx.buf);
-	ret = do_xfer(ph, t);
-	if (!ret && attributes)
-		*attributes = get_unaligned_le32(t->rx.buf);
-	xfer_put(ph, t);
-
-	return ret;
-}
-
 static const struct scmi_proto_helpers_ops helpers_ops = {
 	.extended_name_get = scmi_common_extended_name_get,
 	.get_max_msg_size = scmi_common_get_max_msg_size,
diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
index aaee57cdcd55..d62c4469d1fd 100644
--- a/drivers/firmware/arm_scmi/protocols.h
+++ b/drivers/firmware/arm_scmi/protocols.h
@@ -31,6 +31,8 @@
 
 #define SCMI_PROTOCOL_VENDOR_BASE	0x80
 
+#define MSG_SUPPORTS_FASTCHANNEL(x)	((x) & BIT(0))
+
 enum scmi_common_cmd {
 	PROTOCOL_VERSION = 0x0,
 	PROTOCOL_ATTRIBUTES = 0x1,
-- 
2.34.1


