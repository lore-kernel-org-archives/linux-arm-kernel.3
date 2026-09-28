Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB794C9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 06:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8+ql9HRxwiF7Hsvr+2veecKSO1rWsvRUfuJvm2uvKQo=; b=bMC1u0mR/Pqp+PsG+IhOdHMIOW
	mOjbyP93BLxqfk+7RubBucBoLVzEK4rzX9OXGsk8FSwl9IbGIOzTy57AN/zOdPjdnmiVaUcoWV8cq
	jx6K3WR+F5Ia9uCkSQmQd6B7EpxZKocgrWWF3bNj3ifvTQvyWBjg6bM/VV+UgNBs0YTmis5KQIQJ3
	cclZfUNSJoaUoRNn5EHm9IWZaknLDvby5WavtQZijgQ6wTwifEDScRU806VkJBN4npcJ7/aUMHDyH
	5UoeVeQPg7BGYcgzDtq90dtHrqZKpG01TLxxsEa/42XwFgh7DNQ9fWHjetbB3IA909u1zbG0wGXoZ
	dClKY7sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB4Yd-0000000HPt2-08Vx;
	Mon, 28 Sep 2026 06:09:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB4Ya-0000000HPsK-3o9X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 06:09:46 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S61WOS772086
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 06:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8+ql9HRxwiF7Hsvr+2veecKSO1rWsvRUfuJvm2uvKQo=; b=Qu6vcqH7S4kRiMyv
	i07dUB9ZPuUXS2A1oPiLsOegxUYPHLPLw1wJ+OoJ7RNr0p3FF9+CmtRAhC6FUEfd
	zlUwZxAsVcDJJGmE5Je2B8gWng00cPxdjVKpB/aShU4U1S0psa29+ELZ364CKT6O
	UsejVbsaGWiqUk/jxZ/tmmRUvCRKkWsp68jmCZukO4J4dHxPRKoyA0BILvvEzKa7
	Je3aXnJCxGZP25vNaxQQsu11VHTiRai5CWRa8fX0YHiBQwXp/zvZixE8EWUjm+vB
	U4grO12+/Z2w2Bf56XMRSHTot6X2G0OE4rY5IHcDAF2VbibXbSwDxrUm5BI1cZsY
	pxdcKQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjkxg0vb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 06:09:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39533bb224cso4056064a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 23:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790575783; x=1791180583; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8+ql9HRxwiF7Hsvr+2veecKSO1rWsvRUfuJvm2uvKQo=;
        b=CJ4Ia0uzjApmAEWEAB5YJHkTi6sA8SK4zb+HnlVNZyeNJjqnm9+BevAtk2DTZt7BMa
         2xGZYvOIF+vHJ6P3NBa3iPWUy6WeJop4YUZvu4Ndhjk0Rhf3wHYFpIkzgZ7xwNfoLYU8
         Wh2AzclsZyiECnONdRrdmgJRpPj7/FL4RMHhpH8ZUsrb8+tdNkJ9BevjTlMhIpOSES5J
         UhiAk7YdrG0pAQJrIGDu+kZiKrPYdMAJ0QHdzk9kPTAKR7zz+8I47S5pqg9JSfPnZOfy
         m9a/ILYerKaJUMJeggzEplOwtBhhTp5Ys8tcSb+hIhOCYIJ5Oua0KGGLwBwUpYiWoSAh
         zNwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790575783; x=1791180583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8+ql9HRxwiF7Hsvr+2veecKSO1rWsvRUfuJvm2uvKQo=;
        b=OA80L7z7TvL9SIN9p/fZXEl36H4MLZBGTDB8UzXhrl7WAdaGqSh0AddgU5PMJDF2i8
         LZyYDLuz4OPLfH5CEqbwwnQMiWwq6l27MdkbZexphvXKtHrZBwLN3cbiY87vpMxqITz4
         +VC1luuH7LyIbOeRjdCI76FsyOs/dwdhaRQs9o/Srr2EjJqcoopY12xPuEGShGBMKYM0
         mUIfGQcNBZ+lnpfOVUOQsCGIfBavvmH0dtr7TMcXGEqJMEoR9y7V9emObQ5uudnZA4s1
         xSKii1/UwJDV63ixWCQJXr9aUXZmjwzkapmgN5JXWIxAz18KTobU2jqHG4FO4n8e/L1v
         EIfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwiSiZ8FKZ07j1WP7LGkDCXXU4spbG+CwTWikmh0K8j85pxddRaro0pHkyLPmeSpOKZaSHmkLe08e6KDuUgNDwz@lists.infradead.org
X-Gm-Message-State: AFq9FYKbrWiJzhSzwZp7MP+11oy8Eg8WvYGhH0tJaT0Ak/IjjQn93oMM
	M/QeHzLnzfVRFSRB3a9gompm2HOnZB/118BWFquvDfVAU7B6aU2pMZQVQA4K243W1oABiYpzwf8
	rwzlZxeHsMUlauRCSMOccVmCBgCXx1MWdDwFA/khUqMaLpGgyIUwAYajMRr6SEcSylEbOBfg4nf
	I/ww==
X-Gm-Gg: AYBFou3JNOp9MqIkprLdg+DUGIiNbu3bfuB22cWP62XjFqsikzzL4FeboFpr7mwIEfC
	gG/0SqGGI+dfiq2oEaCXy6TbXNVD8n19Cspsuub4avwWJgasVecmar1K3S4Q35yfggvflykmraQ
	9FaTpozhhzHwmdL3yV0byLgCn82Qwcf/KNwopx1K3IMoOBngkn9Lt+j7PVF4VPXq8bzUg0LR3u8
	81wzrqA7Fo8E2hxxDPqUqJ4GJvVZHlTNKBAANFjoPoD3hHJP39x0NIz216SOH0WP+VEsR9TUCb/
	63NYQCZlt056By9cs4YEog33ZyC+DIMR+ce19F1OSKG1KP9IVPxI0lnNW5g2S43iFRMMS4r73yR
	ATh0EvitFGVRsw2KquS2ApJn6B8iH72hsRtx2
X-Received: by 2002:a17:90b:184c:b0:39e:2e79:7ce7 with SMTP id 98e67ed59e1d1-3a098ad9d5amr9242807a91.6.1790575782679;
        Sun, 27 Sep 2026 23:09:42 -0700 (PDT)
X-Received: by 2002:a17:90b:184c:b0:39e:2e79:7ce7 with SMTP id 98e67ed59e1d1-3a098ad9d5amr9242801a91.6.1790575782242;
        Sun, 27 Sep 2026 23:09:42 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efb156sm20040846a91.1.2026.09.27.23.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 23:09:41 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 11:39:13 +0530
Subject: [PATCH v26 01/10] power: reset: reboot-mode: Support up to 3 magic
 values per mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-arm-psci-system_reset2-vendor-reboots-v26-1-b24e2348e8e1@oss.qualcomm.com>
References: <20260928-arm-psci-system_reset2-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com>
In-Reply-To: <20260928-arm-psci-system_reset2-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790575761; l=4572;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=3jZJCDBmdKair7R/qKaAWXxKmatvkMOd5u4ong8jp54=;
 b=QeAHZsAp20Q/jJCfU0sVRC8qYt8yx1L7bKt60XOL6rRI3iIvey7f0Eo5M5KzqJEpqT21hBH0Q
 gWQU/cZslhvCN8sZaKkCtwPVaE3vcptPiB9jjJgHgb1268rdRDxu5zl
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-GUID: 0jxW1aB8Wt4_uE4jSiwq42Nm8_qtI_TQ
X-Proofpoint-ORIG-GUID: 0jxW1aB8Wt4_uE4jSiwq42Nm8_qtI_TQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAyNCBTYWx0ZWRfX+kbX7ES9RGSO
 P4wVjBdIr7OmwA5sPnrJhXXQNLYDjhy48jLED0PQWhq5aFU1eeWg0SYL+awb4bDPwnvOVU5FrAZ
 sOcTRLO14JNEGNiYEPjF0EiDb7lG7Bw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAyNCBTYWx0ZWRfX5KEY+Bqnlhf3
 aqCPz9MqE5Zh5p5mTZo5u8St30Tl9RRzut5hiosfAhdTY37YoxzSz2C5ApPm3ad4e3qj/hhIPeD
 XikRcuwihWjVs+ql2ROMBtNWmhLO8mrbA08kXWaexQpBKlNQbIQP3YG9vdvrMwWGfyLSgYzyvVx
 jxVugujAP1IdZguA4/eun19Hk2fKARQRM702575Dvv/2HZKZzSahgkbHWS53MjJTw1aC7VsY/Gi
 Z8Rrc3PzrtucvKFKT8Fpt62WoCmwgFbWFeh+Isim6eiuDgBXn5I8KVnnsvqjDL8HyzilafPLgrX
 SHe5yP4ovhgJ+lrMOIHAUub246izlDfL9TsnwgIIwlJQv2BG+lnsxsJLEPEphEn0RmN1k4fQqtK
 yHkyFsHXEmP/7vYhS+LaFb5KfaHM5AFsVRT7vMZ/w6snoM4KdR42fiY6tocy1RF7TsgNy/w1qGL
 0gi8asc2uuCaSshSYGw==
X-Authority-Analysis: v=2.4 cv=QZfzLcbv c=1 sm=1 tr=0 ts=6aba04a7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=_usNffLPL2KliZ4tEdwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_230945_098782_165B7970 
X-CRM114-Status: GOOD (  24.01  )
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

ARM PSCI vendor-specific resets, require a 32-bit reset_type and a 64-bit
cookie as arguments. This cannot be implemented via the reboot-mode
framework, which supports a single 32-bit argument as magic value.

Extend the reboot-mode framework to support up to three 32-bit arguments
as magic, per reboot-mode.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/reboot-mode.c | 46 +++++++++++++++++++++++++++------------
 include/linux/reboot-mode.h       |  3 +++
 2 files changed, 35 insertions(+), 14 deletions(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index 3611bed341e1..328fa37598df 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -20,7 +20,8 @@
 
 struct mode_info {
 	const char *mode;
-	u32 magic;
+	u32 magic[3];
+	u32 count;
 	struct list_head list;
 };
 
@@ -72,8 +73,7 @@ static const struct class reboot_mode_class = {
 	.dev_groups = reboot_mode_groups,
 };
 
-static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
-					  const char *cmd)
+static struct mode_info *get_reboot_mode_info(struct reboot_mode_driver *reboot, const char *cmd)
 {
 	const char *normal = "normal";
 	struct mode_info *info;
@@ -84,11 +84,11 @@ static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
 
 	list_for_each_entry(info, &reboot->head, list)
 		if (!strcmp(info->mode, cmd))
-			return info->magic;
+			return info;
 
 	/* try to match again, replacing characters impossible in DT */
 	if (strscpy(cmd_, cmd, sizeof(cmd_)) == -E2BIG)
-		return 0;
+		return NULL;
 
 	strreplace(cmd_, ' ', '-');
 	strreplace(cmd_, ',', '-');
@@ -96,21 +96,25 @@ static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
 
 	list_for_each_entry(info, &reboot->head, list)
 		if (!strcmp(info->mode, cmd_))
-			return info->magic;
+			return info;
 
-	return 0;
+	return NULL;
 }
 
 static int reboot_mode_notify(struct notifier_block *this,
 			      unsigned long mode, void *cmd)
 {
 	struct reboot_mode_driver *reboot;
-	unsigned int magic;
+	struct mode_info *info;
 
 	reboot = container_of(this, struct reboot_mode_driver, reboot_notifier);
-	magic = get_reboot_mode_magic(reboot, cmd);
-	if (magic)
-		reboot->write(reboot, magic);
+	info = get_reboot_mode_info(reboot, cmd);
+	if (info && info->count) {
+		if (reboot->write_array)
+			reboot->write_array(reboot, info->magic, info->count);
+		else if (reboot->write && info->magic[0])
+			reboot->write(reboot, info->magic[0]);
+	}
 
 	return NOTIFY_DONE;
 }
@@ -173,16 +177,22 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	struct property *prop;
 	struct device_node *np = reboot->dev->of_node;
 	size_t len = strlen(PREFIX);
-	u32 magic;
+	u32 magic[3];
+	int count;
 	int ret;
 
 	INIT_LIST_HEAD(&reboot->head);
 
 	for_each_property_of_node(np, prop) {
+		memset(magic, 0, sizeof(magic));
+
 		if (strncmp(prop->name, PREFIX, len))
 			continue;
 
-		if (device_property_read_u32(reboot->dev, prop->name, &magic)) {
+		count = device_property_count_u32(reboot->dev, prop->name);
+
+		if (count <= 0 || count > ARRAY_SIZE(magic) ||
+		    device_property_read_u32_array(reboot->dev, prop->name, magic, count)) {
 			dev_dbg(reboot->dev, "reboot mode %s without magic number\n",
 				prop->name);
 			continue;
@@ -194,7 +204,15 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 			goto error;
 		}
 
-		info->magic = magic;
+		if (!memchr_inv(magic, 0, count * sizeof(u32))) {
+			dev_dbg(reboot->dev, "reboot mode %s with zero magic values\n",
+				prop->name);
+			info->count = 0;
+		} else {
+			memcpy(info->magic, magic, count * sizeof(u32));
+			info->count = count;
+		}
+
 		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
 		if (!info->mode) {
 			ret = -ENOMEM;
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index 4a2abb38d1d6..29ae39935d69 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -2,10 +2,13 @@
 #ifndef __REBOOT_MODE_H__
 #define __REBOOT_MODE_H__
 
+#include <linux/types.h>
+
 struct reboot_mode_driver {
 	struct device *dev;
 	struct list_head head;
 	int (*write)(struct reboot_mode_driver *reboot, unsigned int magic);
+	int (*write_array)(struct reboot_mode_driver *reboot, const u32 *magic, int count);
 	struct notifier_block reboot_notifier;
 };
 

-- 
2.34.1


