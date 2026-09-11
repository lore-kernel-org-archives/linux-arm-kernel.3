Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D8A9C88E58
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 15:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pEM9jPOOZujCwjK6sG3Tm845ZU4s2wO25Iym0LKZjIU=; b=zMy5aLTSG1g/QUg05nfMRAAOob
	HS42/Gch1oXQOn73PAKkQ084NcaYi0E+5XsRFlTk4MTp/IPJ7FuwjD4MRggH4tIufYuXQCLxud4fn
	8xK7IDwJg8ZvB9oApTl/Z9pEz7ts1HKgQfg+JMjio01UrRMPfWs6fvipjnuG2flDYtg7RQrTvH1r1
	a3yrvEHxF2llkDatk+CVEuf2hCflvHhpSGQsRvr8OX1bq8HfarnA65lgMGJ0A8vG/cesH/Cca9gXf
	2pZVo5fBtMFqJ9W77dbPemKHhqb73ARpprUhgmG9L061POMd17fN0k7klJnq1ohwl3N6rONeUHYnF
	aS6XELDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x536L-0000000H2FQ-1L64;
	Fri, 11 Sep 2026 15:23:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x536I-0000000H2DR-0vet
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 15:23:40 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEm2Ph442924
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 15:23:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pEM9jPOOZuj
	CwjK6sG3Tm845ZU4s2wO25Iym0LKZjIU=; b=ZiM8bxI4nMUEqrC442er4jrqbUH
	15aqptBgNvibc3upEYfytmBbcsCHkD/ncccW1GvkaVBXzt/+oOtAruWnGH0SUQMN
	CmiFAHZVBtupYwcz7YbvUxg9XsAy3tcHzC6WOdDUIHEx29TsROsHHEa2f85v5BaO
	79UwxKDJfUD2jRWWHxkTGZ2IwBjtntKf/Bi7+VCX157Psvk/Tw/e8TRaHcgQyGx0
	AUC/W/aanHgMU0RsP7kRGDb46yI+hEk3CBNG6fCwgPU1jKtaGjMuvb8JP3DzSZwi
	GZOd5bvBSB82qQQV7uzR3xQk3e5t0uq0THESI8zhwjf/aZ6AsBCY5+fZrhg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmapg2kna-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 15:23:37 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78fa7ff1a44so283287137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 08:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789140217; x=1789745017; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pEM9jPOOZujCwjK6sG3Tm845ZU4s2wO25Iym0LKZjIU=;
        b=aT0/yWf1mWac1NC0wMCpWU8deF2EQQbNJWcOvesKV2m5/RBxNbXp7RS+CRC95xgB5V
         rt3XghYjzAiDYc2uHccDbDC3qPo3JAS5G/vglADLXQ8c30MtlIn9A55e7OWPkptYYe3R
         Cl18RfpSUm2qONzK4YiXRvzCRIZ8lKH1cNnv/aTsfOln7VhndCHu0b7yW0xySBOvYF4n
         Xqq4BaLeiWgLuj9A9pFjv0UbneJZeEpN7lODY7OjN6XQvrkc8pucVSrWm1EV/kPQCbzc
         KXayl2Bal5pFYMgtec9oGwll1CSyW0aZhrq28KwqOkyeaopIUOyEg9nRiS+T1RCWUwMg
         EBZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789140217; x=1789745017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pEM9jPOOZujCwjK6sG3Tm845ZU4s2wO25Iym0LKZjIU=;
        b=WPeoKGa5Um6x2/frOLJUZ8vn9fdzaKj6sD21sUrZdr50suHKPg/MSfr7+MmUJkxfE5
         z+GUvGoxlZRZmwni7lDIav4kqwwgnwjNPL8GAjWlGoPnEWR7BZze5bbrt+ycEv55slC5
         hxE5hfZ7AHV5LrxTkY/rRAe+hv2VJ2A6dFw2sMKZp8jwFqfA7ajdhy5+gtDWbSxBLIWV
         PSNwsrYn/BohrXcihwI76cRBDzkX4zOepS50TJFh4D4jH0PLEKxTvNt+jxUENk5iOr85
         rfmJipTVJZJZ6Ejr+5DS7fRmG7QkEUet7gQMRYs2Rm97YGac6KAtqR7tc1Dt0ed0zwGW
         U+yA==
X-Forwarded-Encrypted: i=1; AKwUvBz2e3G29dBq4mZ0qFeRlLUfiZ3hnYK0ay3oJNtw4GNhIMFb2EsupbSvPxqTd6QazprDei6E32L7/asUlgrQdBMl@lists.infradead.org
X-Gm-Message-State: AFuF++n8Zevbsl/WZOhthWQ2YDTmhWjKfLq3A8IjosmRb7v9tuJU6svh
	MYi0armrm1/KhRcchMTkEhs4WBpmCLf3sjaAML9LtPc5v2ypYrgH3VlBjsPu7sCB3jinTWLccnQ
	nsRFLLgmhoMiRX0QL4aDXxzRe9vYEBQCpYvUZZBLBFXGotISLigtPy5BVr6EN9PQmB7bh2GwZte
	oAow==
X-Gm-Gg: AYBFou2sP0X4BMjOfS2wc8lIzf9vfxEGwlu616l5a3vJ3cKhUstPGSyGAp1CGetOcjn
	BCRe22uy7sJGexMu5J4YGSIXcBRbpTfvMRzCxfIQ8ri8gcYIVinxKbJsghQKL7+xDGTY7jlqXC8
	1SYZbQCYNXdA06JPxrpto3/jxDQUBO0lFxaNy2r3otncubMVRRqgI9i224Ftj0rYVkpEWGlh85V
	JaLztBz6siEbTvsKnY+XMmSDear+rKXi/p0ypEOmRt4dhFTnmXVuqVpjK8sUg4LrtMTNK7DnBNm
	lkMF9UbLqmV/GYZohhx7b7sb30SE9SjrVWDynQ58Cej4Di2yF9mlyFXQ6J0ShVwDML7iwzV0ZMs
	2FmBajHvqwl2FpEQQFH8Vr18N4Jmuwb9UsM7GIF7wva2Yf/H2wwWbuRuFyuIz16QbVCqoz+kulV
	tDHFWdTRdu+HbysSlNcMoVKzMjscfcOvwKoVLl
X-Received: by 2002:a05:6102:3970:b0:782:de7b:eead with SMTP id ada2fe7eead31-792a53b19a3mr5186287137.1.1789140216485;
        Fri, 11 Sep 2026 08:23:36 -0700 (PDT)
X-Received: by 2002:a05:6102:3970:b0:782:de7b:eead with SMTP id ada2fe7eead31-792a53b19a3mr5186201137.1.1789140216013;
        Fri, 11 Sep 2026 08:23:36 -0700 (PDT)
Received: from t14s.space.revspace.nl (2001-1c00-2a07-3a01-8e96-3679-0b9c-de47.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:8e96:3679:b9c:de47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296614323csm94042566b.59.2026.09.11.08.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:23:33 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/4] module: add SCMI device table alias support
Date: Fri, 11 Sep 2026 17:23:26 +0200
Message-ID: <20260911152329.5822-2-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
References: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mm8A1rJo1_T2kolTxvJiAhHjWIUgUIqB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxNCBTYWx0ZWRfX1QoDN9lXvf3Y
 jAsZ0USc9wCLxKVhbZej2jcnGa0KDL9ypsHA4RY6YlEuxlVUnhyUOazjYtxIWjI4x5P87/acqoa
 ipzLZjGYSuq1hE5Ncmiwczv5d4i52TA=
X-Proofpoint-GUID: mm8A1rJo1_T2kolTxvJiAhHjWIUgUIqB
X-Authority-Analysis: v=2.4 cv=DLoacCNb c=1 sm=1 tr=0 ts=6aa41cf9 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=NbjprmzQH6tOvfj-_-IA:9 a=crWF4MFLhNY0qMRaF8an:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxNCBTYWx0ZWRfX2hbPrwoEmfaf
 f9aXDUWc16vYus5iztOhGDelN5MKtPbcE4jIwVae66f5A86DdPl6M8EpTN1G4kfMTrCcR48neH3
 7l8lT52u7ZXJCmfFpEukpO4kzxYai77xdomLrlF/3jzQIKtXfj6l0e0UL3vm4+KXNDYUr7Rdm1L
 5C4OOYFziCh8226jEmmMFB5kQZ8qCND3173q4jZfca3UceurjzJxOTe4oiyTuS9O2GP04iZdTwm
 SGgqxVc8UJFwRonSV6WNcI12dTVPq81oaYnjMoKGRRfqkGg/A88/7lg2e7vFwwF6b33pzEPCOgj
 sXQcHjSIzpVvbk2mIjvb5NRY0o49c78Gh16+uVr0zvLe6rtpmuhqzgO7oPu7c54s+ZCxvrx1MwL
 k7NRMLMdVCPVqEL37hOed08cvaSn3EcKtJuhZMtZNOTe54jmz6K2B9zF6Q5JfTcxOT+rEB1Jhii
 2QZVptvBf86i/AEukKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110214
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_082338_392506_142B0BCC 
X-CRM114-Status: GOOD (  29.00  )
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
Changes in v4:
- Drop unused driver_data member from struct scmi_device_id (Uwe)
- Drop device-id/scmi.h include from mod_devicetable.h (Uwe)
- Add device-id/scmi.h to devicetable-offsets.c and file2alias.c (Uwe)

Changes in v3:
- Adjust for ad428f5811bd ("mod_devicetable.h: Split into per subsystem
  headers")
- Add '\n' to modalias_show() output, matching other subsystems' modalias

Changes in v2:
- Drop #include <linux/mod_devicetable.h> from scmi_protocol.h
- Link to v1: https://patch.msgid.link/20260616-scmi-modalias-v1-0-662b8dd52ab2@oss.qualcomm.com
---
 MAINTAINERS                       |  1 +
 drivers/firmware/arm_scmi/bus.c   | 21 ++++++++++-----------
 include/linux/device-id/scmi.h    | 17 +++++++++++++++++
 include/linux/scmi_protocol.h     |  6 +-----
 scripts/mod/devicetable-offsets.c |  5 +++++
 scripts/mod/file2alias.c          | 12 ++++++++++++
 6 files changed, 46 insertions(+), 16 deletions(-)
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
index 000000000000..1b4ccfa9dcc5
--- /dev/null
+++ b/include/linux/device-id/scmi.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef LINUX_DEVICE_ID_SCMI_H
+#define LINUX_DEVICE_ID_SCMI_H
+
+#ifdef __KERNEL__
+#include <linux/types.h>
+#endif
+
+#define SCMI_NAME_SIZE		32
+#define SCMI_MODULE_PREFIX	"scmi:"
+
+struct scmi_device_id {
+	__u8 protocol_id;
+	char name[SCMI_NAME_SIZE];
+};
+
+#endif /* ifndef LINUX_DEVICE_ID_SCMI_H */
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
index b4178c42d08f..91ec3704ee2b 100644
--- a/scripts/mod/devicetable-offsets.c
+++ b/scripts/mod/devicetable-offsets.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #define COMPILE_OFFSETS
+#include <linux/device-id/scmi.h>
 #include <linux/kbuild.h>
 #include <linux/mod_devicetable.h>
 
@@ -144,6 +145,10 @@ int main(void)
 	DEVID(rpmsg_device_id);
 	DEVID_FIELD(rpmsg_device_id, name);
 
+	DEVID(scmi_device_id);
+	DEVID_FIELD(scmi_device_id, protocol_id);
+	DEVID_FIELD(scmi_device_id, name);
+
 	DEVID(i2c_device_id);
 	DEVID_FIELD(i2c_device_id, name);
 
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 8d36c74dec2d..5379b1def07b 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -121,6 +121,7 @@ typedef struct {
 /* Big exception to the "don't include kernel headers into userspace, which
  * even potentially has different endianness and word sizes, since
  * we handle those differences explicitly below */
+#include "../../include/linux/device-id/scmi.h"
 #include "../../include/linux/mod_devicetable.h"
 
 struct devtable {
@@ -852,6 +853,16 @@ static void do_rpmsg_entry(struct module *mod, void *symval)
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
@@ -1491,6 +1502,7 @@ static const struct devtable devtable[] = {
 	{"virtio", SIZE_virtio_device_id, do_virtio_entry},
 	{"vmbus", SIZE_hv_vmbus_device_id, do_vmbus_entry},
 	{"rpmsg", SIZE_rpmsg_device_id, do_rpmsg_entry},
+	{"scmi", SIZE_scmi_device_id, do_scmi_entry},
 	{"i2c", SIZE_i2c_device_id, do_i2c_entry},
 	{"i3c", SIZE_i3c_device_id, do_i3c_entry},
 	{"slim", SIZE_slim_device_id, do_slim_entry},
-- 
2.55.0


