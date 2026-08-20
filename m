Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A5BC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 19:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2UnZhL42BZOzUigVArKOkVoW3gNb0xtMC9LmMxlRmPE=; b=gQUnknBPB1wWjPTLtXvX3uYNd9
	atjAJDk/iwF77KhRgJzdKe/AhXDos10Y9n+ENpGLr5oxO9g3t0yjsoLmtxq95E1hmyiocrve1+bnS
	b7/tlqJx5uhZqSjeT0MCLEMyo+7QHYK4cLUSPVCth+RJWoSMl577+SFbBXJP9viWD9LQPEZmqJYp+
	rSitCNW4fTJY2JexdmMp6pYF31Ck+h6wRZlbdea2wGZiRyuizCbnzG1pw8k6wDpZPdFz/E5Z9Y1Lo
	S+KuaNopk0t7Pd6uIGWNNFIpKX/18o8HVDEJObnONB6OLo4J6bP3CADqNohLSR6GdlIV0A/gUXk6D
	ECVdLqdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx8l7-0000000C8gV-0il2;
	Thu, 20 Aug 2026 19:49:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx8l0-0000000C8dv-2GQY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 19:48:59 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KIIwd3017023
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 19:48:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2UnZhL42BZO
	zUigVArKOkVoW3gNb0xtMC9LmMxlRmPE=; b=Rw49asBNDE8qcdtvR6pXpRZLrgh
	+q91xMEh/wfc38Rp2OMDkB8i9YUCHlI1DQc0VmH1xRIuYBjNSKcV/w8eZRZ+zsKK
	GON4SoEvUFETvRRK1XoSp+HNv80RLqAP+zbiC+slbm8TVWVApDpa1WOkMQ9fu2Ho
	Z3oG/wtLfumLhMMx/GL79kMk+gyWqRWsvq162m88r24BCSkP6mlBbo48otVzGebT
	j90BsJndgT/ZoOXZiPXi3wAq6ZCXrBvS1YOOy51udY91K/fMkq7ozwOA5naagTKu
	BmStAKVqekHzfTrsgjrGM87qsflAVhAqmRszx4vRPiDpDpwveThGDr0XYiQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5w49bbm5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 19:48:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930edb4362dso19163085a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 12:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787255337; x=1787860137; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2UnZhL42BZOzUigVArKOkVoW3gNb0xtMC9LmMxlRmPE=;
        b=T5F8NihomB7uh6hIMIR3E/MLu79E0Rn878bbjUYAKfdlh3iTEQeNod60uErJCYBIEn
         bPP5lSFetdw88Pq5rxc8AH9pPFfoyFNlezw56n0FX/FS/tuFRL1g8U0NkaL6KeNGpCrZ
         xWC1LEc5+9JsbOzoQXQduPSEtiqf9hxR0+RLLE5TBNsRfjlI+H8fsDfbhH3TZB3+N5Nf
         SIpYLyEAR1WnzYXEYHxtLT+kO3CJYiXthaahFKPlljMo1G+EQDXJvAhLBTgEDlCptTsu
         28izdcZiAOH0/2K2fgj0yCttr8SC7cBi34adv3z8KUtcz4qiTC/pfJXaj22cm+CRpqk8
         Br3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787255337; x=1787860137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2UnZhL42BZOzUigVArKOkVoW3gNb0xtMC9LmMxlRmPE=;
        b=iuu37V0mgKzxA7EEr99VNPl+IX1SbucRKTndffk/riUMZ3LBQ+ky9VdeHcNgsKPhX4
         /CPpM73NaiQ07i00oTgfu9xH6DbsTLTE772OR8JQPOOUlvgJxv4ofPYQTgHiro1BTerx
         yJ8mTlf8GscDujS6ZFLFXLvGWg7hiEUdMFY/Ik3+ErlUoeld9r0NTNQHN0Bhi2+LvHXv
         l5f9OXKiDN7BMp5/6C3C/6Tj02ebmcIHaTvfONP3ervc2qb9LLyXY6aBbY4tT54YcT6x
         A39EhlfkK87g1MwH/Xt7o4dASWjeVbb0mQaRDIieSxnArt6W6p+U05X/mBJAXmzO8fqs
         A/wQ==
X-Forwarded-Encrypted: i=1; AHgh+RqF9Yc3bWeStAOLsnGc2obQdVWB/fmmE5itr5ShkC4MfptGktTTtIIWnlOBhyWQmhnpxrN9FpbXT5ETegbg2goD@lists.infradead.org
X-Gm-Message-State: AOJu0YzC8ueSVnT7iCXIzqxMqpGU+s7Cs1J+oYHvPmOZ+uymyLcXjiqo
	UZTQBjz5hxIYoYBSOvB7YJEkH2c5LbcsD/ZBFbcSyknnJ092bVZkAXgjoWHUj7HeJdWxSwlNdF/
	O3Ue31H1tWWCNJj0dNb6Kg2JWrL7qGVXAn9P7bP4nnTBSTmEBN5mIosgxbezq7qRGl4It7E/RPE
	2iMg==
X-Gm-Gg: AR+sD11r+nxx4NG7Z+PxgkXIMr+5D8Cj22b2Ff10Y47+BKAHTSK7bGH9aXJ8JuAmaLA
	rsS0jeev1YdBxBwP+N4tDc9ZaXrG05Jy25Tqn4df9BxJLWUHdE5ZQFGfqbN9/C0npqG2xW0swKV
	dFxmQH0em8S2tqF9RsbdtRIbIkB+uXVro5H6E2v8pgGrmXj0E/S1rsZ5GgvwF/czgl2EvVOsbHp
	+ljIXxdWIMqA4fppfI613dqWC7mNuFS1DvMmnXN4WxQAAEgiB1GZBfFc5RiVLiZStrv/EEuJVcZ
	nrLKnkEVqtU56ze2nATZ8kyP08Qqauiqf/94OJ32srqXjVzpBQcBn8k0qOv5otcFoZz4eD6xvKl
	hnaLePs2uhNuV
X-Received: by 2002:a05:620a:2982:b0:936:6c8a:f7aa with SMTP id af79cd13be357-9373942ee43mr53885785a.4.1787255336955;
        Thu, 20 Aug 2026 12:48:56 -0700 (PDT)
X-Received: by 2002:a05:620a:2982:b0:936:6c8a:f7aa with SMTP id af79cd13be357-9373942ee43mr53879585a.4.1787255336046;
        Thu, 20 Aug 2026 12:48:56 -0700 (PDT)
Received: from shalem ([2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2459198ec5sm113433266b.34.2026.08.20.12.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 12:48:55 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH v3 1/3] module: add SCMI device table alias support
Date: Thu, 20 Aug 2026 21:48:48 +0200
Message-ID: <20260820194850.459739-2-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260820194850.459739-1-johannes.goede@oss.qualcomm.com>
References: <20260820194850.459739-1-johannes.goede@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE0OSBTYWx0ZWRfXwlDMxLvBCp+y
 38CcvpVoz+yIw6cMoZD9ciLdVZcdCv2PbqH7BMZQR2EC/bktixON5DO2ue94qrKF6YZtwM7XA7X
 1XZrgL4Zr8odrGbV60Me/lQcPAFB42Y=
X-Authority-Analysis: v=2.4 cv=YP+vDxGx c=1 sm=1 tr=0 ts=6a875a2a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8
 a=NbjprmzQH6tOvfj-_-IA:9 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 9IXvj8wwIwyB2bieGWV2P9pZ4631KQOU
X-Proofpoint-GUID: 9IXvj8wwIwyB2bieGWV2P9pZ4631KQOU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE0OSBTYWx0ZWRfXzl7Ts4ZrTfHv
 F6etH00zh4y6gOqqpPLt7HQuS+u/sm356yjJvbT2WBOxXQhOE2gP92qPumBkHr5uSfS4i291oqB
 9BQtuvinMCwK0cT+V/WgQxnEWR1CLUsO2Pd5z7GDzuGjuS0z6B1S+quak371x78NsaUzT+rDkUO
 dFtKAzOTcuZ5BOn7SRma032KqOu4OUBF+NbIwPoJraYcn/yBaFlOXlwcH2p9mjHMGHIcVjkVHAr
 RfUfWKJWC8W1AXAYOiq9PHT4oKm+/78Y6hGESFOezj403QhhtFw3BzP81IET+DQHXJoGnLbVAMh
 nmvFJLntsbUabPW3p4oFLK4rsRFcBS2M6COPbj/ZE3rv5m2MBF5faAJk3MyYZT8+W7EZariSwYG
 +fuAUj2mS/ngsoQXYUrrWqz56KyD7efOjrWlNuBALzT/lHHLU+ZeqDeZFH06aGS2u/ILUBF8ugG
 Y3QYPrHUiPyKMDUkebA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_01,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_124858_585971_0FC0A1B2 
X-CRM114-Status: GOOD (  27.48  )
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

From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

SCMI client drivers already describe their bus match data with
MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to consume
SCMI device tables. As a result, SCMI modules do not get generated module
aliases from their id tables.

Move struct scmi_device_id to mod_devicetable.h so it has a fixed layout
visible to modpost, add the corresponding generated offsets and teach
file2alias to emit scmi:<protocol>:<name> aliases.

Use the same stable alias format for SCMI device uevents and sysfs
modaliases. The previous string included the instance-specific device
name, which is not useful for matching modules.

Assisted-by: Codex:GPT-5.5
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v3:
- Adjust for ad428f5811bd ("mod_devicetable.h: Split into per subsystem
  headers")
- Add '\n' to modalias_show() output, matching other subsystems' modalias
- Link to v2: https://lore.kernel.org/all/20260618-scmi-modalias-v2-1-8c7547c1be21@oss.qualcomm.com/

Changes in v2:
- Drop #include <linux/mod_devicetable.h> from scmi_protocol.h
- Link to v1: https://patch.msgid.link/20260616-scmi-modalias-v1-0-662b8dd52ab2@oss.qualcomm.com
---
 MAINTAINERS                       |  1 +
 drivers/firmware/arm_scmi/bus.c   | 21 ++++++++++-----------
 include/linux/device-id/scmi.h    | 19 +++++++++++++++++++
 include/linux/mod_devicetable.h   |  1 +
 include/linux/scmi_protocol.h     |  6 +-----
 scripts/mod/devicetable-offsets.c |  4 ++++
 scripts/mod/file2alias.c          | 11 +++++++++++
 7 files changed, 47 insertions(+), 16 deletions(-)
 create mode 100644 include/linux/device-id/scmi.h

diff --git a/MAINTAINERS b/MAINTAINERS
index fc6ca082106f..ee5beee606fc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26334,6 +26334,7 @@ F:	drivers/pmdomain/arm/
 F:	drivers/powercap/arm_scmi_powercap.c
 F:	drivers/regulator/scmi-regulator.c
 F:	drivers/reset/reset-scmi.c
+F:	include/linux/device-id/scmi.h
 F:	include/linux/sc[mp]i_protocol.h
 F:	include/trace/events/scmi.h
 F:	include/uapi/linux/virtio_scmi.h
diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 793be9eabaed..d12d5de15a1a 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -13,11 +13,12 @@
 #include <linux/of.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 #include <linux/device.h>
 
 #include "common.h"
 
-#define SCMI_UEVENT_MODALIAS_FMT	"%s:%02x:%s"
+#define SCMI_UEVENT_MODALIAS_FMT	SCMI_MODULE_PREFIX "%02x:%s"
 
 BLOCKING_NOTIFIER_HEAD(scmi_requested_devices_nh);
 EXPORT_SYMBOL_GPL(scmi_requested_devices_nh);
@@ -141,7 +142,7 @@ static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
 	int ret = 0;
 	const struct scmi_device_id *entry;
 
-	for (entry = id_table; entry->name && ret == 0; entry++)
+	for (entry = id_table; entry->name[0] && ret == 0; entry++)
 		ret = scmi_protocol_device_request(entry);
 
 	return ret;
@@ -197,18 +198,18 @@ scmi_protocol_table_unregister(const struct scmi_device_id *id_table)
 {
 	const struct scmi_device_id *entry;
 
-	for (entry = id_table; entry->name; entry++)
+	for (entry = id_table; entry->name[0]; entry++)
 		scmi_protocol_device_unrequest(entry);
 }
 
 static int scmi_dev_match_by_id_table(struct scmi_device *scmi_dev,
 				      const struct scmi_device_id *id_table)
 {
-	if (!id_table || !id_table->name)
+	if (!id_table || !id_table->name[0])
 		return 0;
 
 	/* Always skip transport devices from matching */
-	for (; id_table->protocol_id && id_table->name; id_table++)
+	for (; id_table->protocol_id && id_table->name[0]; id_table++)
 		if (id_table->protocol_id == scmi_dev->protocol_id &&
 		    strncmp(scmi_dev->name, "__scmi_transport_device", 23) &&
 		    !strcmp(id_table->name, scmi_dev->name))
@@ -245,7 +246,7 @@ static struct scmi_device *scmi_child_dev_find(struct device *parent,
 	struct device *dev;
 
 	id_table[0].protocol_id = prot_id;
-	id_table[0].name = name;
+	strscpy(id_table[0].name, name, sizeof(id_table[0].name));
 
 	dev = device_find_child(parent, &id_table, scmi_match_by_id_table);
 	if (!dev)
@@ -282,8 +283,7 @@ static int scmi_device_uevent(const struct device *dev, struct kobj_uevent_env *
 	const struct scmi_device *scmi_dev = to_scmi_dev(dev);
 
 	return add_uevent_var(env, "MODALIAS=" SCMI_UEVENT_MODALIAS_FMT,
-			      dev_name(&scmi_dev->dev), scmi_dev->protocol_id,
-			      scmi_dev->name);
+			      scmi_dev->protocol_id, scmi_dev->name);
 }
 
 static ssize_t modalias_show(struct device *dev,
@@ -291,9 +291,8 @@ static ssize_t modalias_show(struct device *dev,
 {
 	struct scmi_device *scmi_dev = to_scmi_dev(dev);
 
-	return sysfs_emit(buf, SCMI_UEVENT_MODALIAS_FMT,
-			  dev_name(&scmi_dev->dev), scmi_dev->protocol_id,
-			  scmi_dev->name);
+	return sysfs_emit(buf, SCMI_UEVENT_MODALIAS_FMT "\n",
+			  scmi_dev->protocol_id, scmi_dev->name);
 }
 static DEVICE_ATTR_RO(modalias);
 
diff --git a/include/linux/device-id/scmi.h b/include/linux/device-id/scmi.h
new file mode 100644
index 000000000000..4150481524d4
--- /dev/null
+++ b/include/linux/device-id/scmi.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef LINUX_DEVICE_ID_SCMI_H
+#define LINUX_DEVICE_ID_SCMI_H
+
+#ifdef __KERNEL__
+#include <linux/types.h>
+typedef unsigned long kernel_ulong_t;
+#endif
+
+#define SCMI_NAME_SIZE		32
+#define SCMI_MODULE_PREFIX	"scmi:"
+
+struct scmi_device_id {
+	__u8 protocol_id;
+	char name[SCMI_NAME_SIZE];
+	kernel_ulong_t driver_data;
+};
+
+#endif /* ifndef LINUX_DEVICE_ID_SCMI_H */
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index a397213bedac..d241421c36aa 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -49,6 +49,7 @@
 #include "device-id/pnp.h"
 #include "device-id/rio.h"
 #include "device-id/rpmsg.h"
+#include "device-id/scmi.h"
 #include "device-id/sdio.h"
 #include "device-id/sdw.h"
 #include "device-id/serio.h"
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 5ab73b1ab9aa..ba53302d95f5 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -9,6 +9,7 @@
 #define _LINUX_SCMI_PROTOCOL_H
 
 #include <linux/bitfield.h>
+#include <linux/device-id/scmi.h>
 #include <linux/device.h>
 #include <linux/notifier.h>
 #include <linux/types.h>
@@ -951,11 +952,6 @@ struct scmi_device {
 
 #define to_scmi_dev(d) container_of_const(d, struct scmi_device, dev)
 
-struct scmi_device_id {
-	u8 protocol_id;
-	const char *name;
-};
-
 struct scmi_driver {
 	const char *name;
 	int (*probe)(struct scmi_device *sdev);
diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
index b4178c42d08f..da5bd712c8da 100644
--- a/scripts/mod/devicetable-offsets.c
+++ b/scripts/mod/devicetable-offsets.c
@@ -144,6 +144,10 @@ int main(void)
 	DEVID(rpmsg_device_id);
 	DEVID_FIELD(rpmsg_device_id, name);
 
+	DEVID(scmi_device_id);
+	DEVID_FIELD(scmi_device_id, protocol_id);
+	DEVID_FIELD(scmi_device_id, name);
+
 	DEVID(i2c_device_id);
 	DEVID_FIELD(i2c_device_id, name);
 
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 8d36c74dec2d..a5283f4c8e6f 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -852,6 +852,16 @@ static void do_rpmsg_entry(struct module *mod, void *symval)
 	module_alias_printf(mod, false, RPMSG_DEVICE_MODALIAS_FMT, *name);
 }
 
+/* Looks like: scmi:NN:S */
+static void do_scmi_entry(struct module *mod, void *symval)
+{
+	DEF_FIELD(symval, scmi_device_id, protocol_id);
+	DEF_FIELD_ADDR(symval, scmi_device_id, name);
+
+	module_alias_printf(mod, false, SCMI_MODULE_PREFIX "%02x:%s",
+			    protocol_id, *name);
+}
+
 /* Looks like: i2c:S */
 static void do_i2c_entry(struct module *mod, void *symval)
 {
@@ -1491,6 +1501,7 @@ static const struct devtable devtable[] = {
 	{"virtio", SIZE_virtio_device_id, do_virtio_entry},
 	{"vmbus", SIZE_hv_vmbus_device_id, do_vmbus_entry},
 	{"rpmsg", SIZE_rpmsg_device_id, do_rpmsg_entry},
+	{"scmi", SIZE_scmi_device_id, do_scmi_entry},
 	{"i2c", SIZE_i2c_device_id, do_i2c_entry},
 	{"i3c", SIZE_i3c_device_id, do_i3c_entry},
 	{"slim", SIZE_slim_device_id, do_slim_entry},
-- 
2.55.0


