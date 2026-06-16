Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 168D2CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 18:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PDZtaXjETEhxMoI0zV7AcPBY5Wbkc86wyJ65881hyNY=; b=DwQ4hx/p2OoCkgq6C6lBu98fbS
	5SN/qf7yTosnBhG6wc/KsAShY+GDzyCLyUO9STCMrOOuO7v3UmWGqUQKbEfoLFlN8nweLxwQLub6V
	xwWKvTCVKB2GoT8AA69x1FeGQg9pNhteJqe90NkyA8C25ojWAVrejl8ysJ+3dwFzh5rYRW74QP0Cw
	gMG/lp1PvP7EtKdyitd0AvY5jCnXCbw1vef3baOpfxVnV0BqRDV82h1sHvyaI6qhMcKAfIOzA7Uxx
	+/98x8pGI/7AiC7Le/JZlf6tFPam1C34jejAHUHJH8WXdSo59P7Amnc9Rsjgf7qJAAMMfsM4nliPq
	4Iyt2xEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZYE3-0000000GCI9-2bBQ;
	Tue, 16 Jun 2026 18:09:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZYE1-0000000GCH4-0nKo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 18:09:26 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GH8taV3746555
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 18:09:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PDZtaXjETEhxMoI0zV7AcPBY5Wbkc86wyJ65881hyNY=; b=k7TJxMK2tEDVKdCZ
	fcPYpg+1uVbV2651EKTIOIhdItA5a2Bwr78sfjVqpUSW17xA1Wv2loh9kLX1fr+X
	3MDz2sMbMa0rVouu6JiGpbnUmKhGUXcVCwy1+KojoYTRS/L1O9D7JjkbdHs6vxf5
	PD6vpwOT2WePZYOAXuaVv0iie0JZFd0Adr1CdP8xANnRcsERYRjQyfod3yFxBh23
	eJz73dDbm8afvgtwxq3YHyCTf/cvRpxul4RSheH7JmrjPqnbYIhRftfY0OLeoSI3
	Ger5BUeQPHdO7jIVwrMcDuQiktds+4wDwRl0UywtR594IrfPC+s/P4S5t63jQ1j9
	Vd6V7w==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu0a7uepc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 18:09:23 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139553dd8acso7407356c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 11:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781633363; x=1782238163; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PDZtaXjETEhxMoI0zV7AcPBY5Wbkc86wyJ65881hyNY=;
        b=HeIDE6NX3j0wnGNMPtdjWcQw4OFzfSnK+HGUY/yWbnnU9tGUIvUY7PtI9UQy9HG3M0
         pm8FrNpxiAqiL3feANQva3NDIxYlyWWQTR8UR1I1TZHCGZ1QRAqhXKf/Twf/qQiKm/xf
         7XHLMDSmyJc1AASkzktlfEjMW/wLk8qkbI7CLL92Btvr6M7q8/k9e1XqQLidtNh3Q9MK
         axzIXcMPdWETuPgdGJMWSThS9OZxMFvjJb09GGTqYVgm7MpdMF0Cj7Aug+bkyaztQNtC
         YTsTzKAmNMzbxu7JdHg7ET2iVy6q3LSoTh3lMYSvOiOSs+LSrm2x7w140jAe/a9Ek+n9
         NbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781633363; x=1782238163;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PDZtaXjETEhxMoI0zV7AcPBY5Wbkc86wyJ65881hyNY=;
        b=mwTYQGNmZ76mCQPY/wCmYYP1riQExDku+fTvAufhZLnJYIMBH3+BjiKu7HbvbQUrtw
         IUIGxSdbnXcEoi04WQRcM3CWObfHGw0PZY0NDIt6l/PhBMO98SUevil8Wv0S2x3CJmbg
         NCSNjSwFBoFR1QFn8SK+eslsllbU8yvFiT4j8BZju3uVxRLy81sUbnEA+f2hL4uoaQ+X
         YLdZ8u3IX2H3mgRpig5uoaVYcBOSwE1pgLRcNMyhb3trVNx0nvjrNXRLPxrDdL39ccCU
         UAmhiMBcXPu5t98+DcOLT7b4x9CGHiBiSUvttmCHkrRK4789NxKWydk2dvKAq3sMkddD
         B0OQ==
X-Forwarded-Encrypted: i=1; AFNElJ9uOgI+5EPnF7K8uvZjH7gn2ZTXuplONxsQ7xH1Iv4ch6gzEZpauvNf2cBm/V3XuZDK8N43Kzzqgz1zTFUPJZXl@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4pvFE/Vv5eqgc5ia52lA8zX4sF2dQEPDgW6A4tr2OWinwzle+
	25DXkTU5Hwv60sCsD0iR+c+qgo88VR8FEy9qHypFOF0QcAkTxSnqL/arxGySAGUkt7FjlYP4tcq
	3gbpQWE7W1XynjCkaErWsXbt6sVJIW5bJ3q5taEHYx/F2DVPXCI+3bbb/B5jglLbw/AmHODN2uj
	J8gMXvN9vbhQ==
X-Gm-Gg: Acq92OEMVY37hOibi23a1pLhj5veRDPYloy90k0ANQIinx2hjZRjTAjMhLL2+4oEPuD
	psp5TSkItAZS0WKgoXfsthwBgmkcFMoF7HP5IxOeJ/A9TQ7mmiBtwHeJajZUbijJaJFHo1lDYyx
	ejWKNCfVZ3Lf70kN3BhAK8cf9QC6tqQSh62A8quvG6ym0cK9sMUWe32zploQ2rSO+d7ixgklx3V
	/jQf5NkUPAdWtKa/m2X4Z5y4Ml/KMepCg4uF8ADz0TFheeHUTwVv3h5ujx5aREFduJWxPndYc5X
	9vyPihx/xwMbCnWc7ZxD1KZC7J+44MikJjI6wYRZOl4s6WotqcNy9hu5K2+125q9vD6R6GD72ZW
	wZ3madDEVklFkV8tTg0lQIVtkDzv2712vSJ3E5zuSpl5hkk/fxEiWGgO0Bz+t0gQ=
X-Received: by 2002:a05:7022:68d:b0:137:6bdb:5842 with SMTP id a92af1059eb24-1398f5c45ecmr43993c88.0.1781633363286;
        Tue, 16 Jun 2026 11:09:23 -0700 (PDT)
X-Received: by 2002:a05:7022:68d:b0:137:6bdb:5842 with SMTP id a92af1059eb24-1398f5c45ecmr43970c88.0.1781633362667;
        Tue, 16 Jun 2026 11:09:22 -0700 (PDT)
Received: from [169.254.0.13] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b916b2bsm13747124c88.6.2026.06.16.11.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 11:09:22 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 18:09:15 +0000
Subject: [PATCH 1/2] module: add SCMI device table alias support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-scmi-modalias-v1-1-662b8dd52ab2@oss.qualcomm.com>
References: <20260616-scmi-modalias-v1-0-662b8dd52ab2@oss.qualcomm.com>
In-Reply-To: <20260616-scmi-modalias-v1-0-662b8dd52ab2@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781633360; l=6788;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=zuntpegxMNUfLfKRKVJpD+fHhSqwi5sTESBy5Gc11ms=;
 b=kEt4IJDgAcszo9qEnabKZ1PfxlY0dKprUvlsugiQm0JnJgv6B2HuknECadqYw9wTY5ru0hGcj
 llEct1gZ35UAhFv/6bNJUnMr8bmgM7PyCuD4VLWerqLC475PpaR0wqw
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE4NiBTYWx0ZWRfX6tSC7ShuxmwY
 kVi1HjLvTSTEvRlYoQir7febCvWyHE8ctdqqLZg08WqmAFIaiFaypqjnBu277WO9Px/ysHubYfb
 BcF19wBkXt/AN7z3qAY6pViVpcHlMKE1KW8FszOv/ZAplZn/y+ITKMeuxHIlJamoqI+DP9+PAim
 ZpXlCLSOTkc7FRaq1A7Tdy2xkxtgP6CsnmuelS/0KMulusdBy+w5CLhFTA0sc/pop2Xll0Q+/NB
 25Qh5ZNyOKMuZa6DL1AF1IL66qrLEzfF0LuvMeqjrqFibM8qrsotQ7Q186+86Aju08+6zUF3Cm7
 zM2sf4RZeiw8Z+5NnLC7OHql0ja1pQ+hqiMMJxJbMDLmHNzqa89roiYHgsiv0rZYyCsew7x+ZW8
 FF3tkmpcmV57DdegR+ZfzmEYf7X2ObEdCENDB2qfXTVfnDPNZ/VD5G1cuhg1drPR7PRaaVNfFbd
 XsV1H0nQzDII3IbeArw==
X-Authority-Analysis: v=2.4 cv=JKALdcKb c=1 sm=1 tr=0 ts=6a319154 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Fcj57D9thYDiAllwEF0A:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: jPwqIA_ZH3dh7Wpe_M5YGbmdDFG5_Qo9
X-Proofpoint-GUID: jPwqIA_ZH3dh7Wpe_M5YGbmdDFG5_Qo9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE4NiBTYWx0ZWRfX6KZr1aXN70eA
 3hN2nbXxG03iM5oErfnkFWntONbVElWZAKbt4Q7QVUAXwtebVkMx3NsNm46qjorYzl0RhcNic31
 lOuG2sUct9DiOidUJr2XpY/9bH94gxs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 clxscore=1011 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160186
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_110925_267805_6AEEA713 
X-CRM114-Status: GOOD (  22.06  )
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
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/firmware/arm_scmi/bus.c   | 19 +++++++++----------
 include/linux/mod_devicetable.h   | 11 +++++++++++
 include/linux/scmi_protocol.h     |  6 +-----
 scripts/mod/devicetable-offsets.c |  4 ++++
 scripts/mod/file2alias.c          | 11 +++++++++++
 5 files changed, 36 insertions(+), 15 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 793be9eabaed..7e344f2ee18d 100644
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
@@ -292,8 +292,7 @@ static ssize_t modalias_show(struct device *dev,
 	struct scmi_device *scmi_dev = to_scmi_dev(dev);
 
 	return sysfs_emit(buf, SCMI_UEVENT_MODALIAS_FMT,
-			  dev_name(&scmi_dev->dev), scmi_dev->protocol_id,
-			  scmi_dev->name);
+			  scmi_dev->protocol_id, scmi_dev->name);
 }
 static DEVICE_ATTR_RO(modalias);
 
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 3b0c9a251a2e..769382f2eadd 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -473,6 +473,17 @@ struct rpmsg_device_id {
 	kernel_ulong_t driver_data;
 };
 
+/* scmi */
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
 /* i2c */
 
 #define I2C_NAME_SIZE	20
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 5ab73b1ab9aa..48b346a26068 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -10,6 +10,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/device.h>
+#include <linux/mod_devicetable.h>
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
2.53.0


