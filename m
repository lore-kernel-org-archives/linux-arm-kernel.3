Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F5F3C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 14:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8+ql9HRxwiF7Hsvr+2veecKSO1rWsvRUfuJvm2uvKQo=; b=qN0e+abheh7mTUG6jR8qw+04GZ
	ae1f0icpeUKdLX2PxNTBQHFULIlBQGQC1bIE0UD32tlBtE2X0mFzdyoe0Sg9zx0adIyKLMRaybN8J
	Nzm6YLYy1izV6ikNJrLqu4jYnFi5cK9lmTsJ72lIVOOk5dfBy6bUVYYGRm6LUvxRVSelRtlzCN86t
	Wl/tOdv0oRR3IGcrB2QcLtP9iP4swuy1rShMC2N5plssrxVJmVqPax4+Lp3SQ0AZQatjRLZ4rpxj/
	gJUPZUVj47VNb+ABR0DDPL4V4MYLFOR8IxS75L/eN3VWzaUmz3gF1qXep2CpfakzsFyIkvlOXfFsZ
	auzs2Flw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x689e-000000043KY-3ML0;
	Mon, 14 Sep 2026 14:59:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x689c-000000043Ic-0qwZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 14:59:33 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0LrU4090491
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 14:59:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8+ql9HRxwiF7Hsvr+2veecKSO1rWsvRUfuJvm2uvKQo=; b=K+zPpzd03UkEsCJt
	LiqtWyAwkfM2Xrx++xrZE/ZNqHYbLFI4LvthAK0hpVCtaP6/K8S0sjkLPg91ljO4
	6cbzbO5sJsk1bS2F513JL2w//K8XrjF9aoMXe1hvDVPezR3y91wBfIWUn0JLIEdB
	c3BY+D/esbbtBsIkq/vuLeYhH8kZW9IeqXZQzivJav2NuydB/o7xxA+vxndTQQVo
	d2PlccpmAsVojFChgbnspw3sjkyILURvdKj6X09kr0Ftxq/YyGJHFKlTLrx629LK
	BjwrxTpWvkGbiyeKS2hX1/cVAjW0JY5P2Fn1sHZwM7Q8W2rLgpGAgpz8pqxzLGYr
	unEx8g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg1qgt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 14:59:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d7443e0f0bso61778465ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 07:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789397971; x=1790002771; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8+ql9HRxwiF7Hsvr+2veecKSO1rWsvRUfuJvm2uvKQo=;
        b=BWW+tHP/y6ETSsJ5neO/Qn+2sgUkkzRQZhzTyaqMUhAFo74noqwUfwLNX27MzV+Q0p
         a2nxi3Yi/tmCdT9o0AF+o9Dt1RtXAlOkcat95M88WP3qAUizdDQ2tUvKyzcJDb0gwr6i
         PaKXjtVNnApkG8mm05Up84TivKIrlAokwPaFOYch/kcgAgVqKFS4lAb4s6OLLyCMtrwK
         0LppfZrT4OYxrEfQtg5Mm/4+LWM92fVEFydFznP5hWhQjXXDWhbRO1akwd0aiSzVGQ5F
         LRqNPkUGsziu7yapyoqE+sGj4286FLN82XQv8eS+uCeKb1rMMk9A1JeVmOan+9Okl88D
         ffAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789397971; x=1790002771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8+ql9HRxwiF7Hsvr+2veecKSO1rWsvRUfuJvm2uvKQo=;
        b=k11T4HaDzO0TZ1SbmFWg2RShOdTDD2C3CArd7JQDTNIhUEges5OWYfM3aRRLh2ZBSB
         PIAGmDEST0ebVB2dxFQ2DeYU01p5sUyU5p4KD6lSdettKfWzeef/BpaWFuMA/D5NNqOP
         cNqTzl+VYBpQfgv+lz9kda+j60me34bRBeekW4BSOjYCUIvSLmXhWM2x2+0VVTFx77ID
         rbf50c8g88DZM1Wp4FLJH64ZigTmtB7OwMqHlOfa6l0uKYE7vDkeHnmPWJc2P9fdqc14
         m+Gr9JCu5YuQ0j9dQcBar1ziHmhl2iJjLxK99Iz2aJ4XLqYy14BkxoJvFvngnMZq/MGR
         Luzg==
X-Forwarded-Encrypted: i=1; AKwUvByBRCNDawCE6iCC4j4COOdkABgI47A/xz40MHZjPSTSVb+6jqZXFTsP9KRnGOyHK8OOf6KbUxEHnKZDuBlUZTBL@lists.infradead.org
X-Gm-Message-State: AFuF++l+b6XeiplqszZQ3tavJ7x7c+ROzrvpUDpIQO0uQeHr9mj0EpRe
	CoXlZYYK7FEkim/AzFs9RJksGWLo7Y9P2GjAIWp78GpdV3l0+FwVnG3jS+OONwV1IBAbtXBkIfV
	aDOHfIyrvUSJkckb689jZbMaPbGKyXDa8l9klLp1fLxXP/Uzt/9aEoYMhSyflnpZjWpYTWsH7TF
	8R9A==
X-Gm-Gg: AYBFou0Y3RXFJFjKgAEDYrL25immSIHog84MZhJ1g3OnBHstAPTjQ347ti7pLLujZsy
	2yCzXZ+BferC3Zqb4yh8rlKUtWVPaR6w/VfAEAfY/liEXSQdTxYYuoutQAPsRxrqu81c00Xtkes
	oDLdX2C5z5QvuF3ZHskX4KY2H6rVOTtDCsZB8ShfkSwpfVUlRPdLSpHESxuStu/nkjVXoDmKAG9
	Hwzp3kzOWRVy2B7RKEWb9Ak/r+CMoBh2/WuX8fUNQOQkfzQDq353ny5tr+VMnkuGUuDWyRIvPyy
	+DAQWRGyq6JEDWeNAeSwpzqd9e90XYQaUzVj18SlX93GcWR4O5QWfYQgank06SYif7O7jJPV3+B
	UB0hR3cSbR734HtzTJtS8IAnnRi1EViPN/ZGC
X-Received: by 2002:a17:902:e74b:b0:2d9:216a:cdd3 with SMTP id d9443c01a7336-2dd6c6fd5e3mr56146815ad.18.1789397970993;
        Mon, 14 Sep 2026 07:59:30 -0700 (PDT)
X-Received: by 2002:a17:902:e74b:b0:2d9:216a:cdd3 with SMTP id d9443c01a7336-2dd6c6fd5e3mr56146095ad.18.1789397970445;
        Mon, 14 Sep 2026 07:59:30 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd4007bd4dsm42943345ad.4.2026.09.14.07.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:59:30 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 20:29:05 +0530
Subject: [PATCH v25 01/10] power: reset: reboot-mode: Support up to 3 magic
 values per mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-arm-psci-system_reset2-vendor-reboots-v25-1-4aaf5c09b5c2@oss.qualcomm.com>
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
In-Reply-To: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
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
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789397948; l=4572;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=3jZJCDBmdKair7R/qKaAWXxKmatvkMOd5u4ong8jp54=;
 b=7s+Gk1QNxVnLkzG+di2vJq+YQbfPHSTrr1QX/D/s21KZdIuvvOz1TUPD1brXp5hNyUSG3VZ/K
 movM2/29tT9Anf0uibgKIKF2jcDz0/Fu8ns4yO7NEmVxmJVZ8FXwY1P
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa80bd3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=_usNffLPL2KliZ4tEdwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: foFkSz1_COI7ADZZAzE7YY31pZ1KIEA9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX1MLl7QGDH9fx
 QWVvdSwxhldFZqlT+RmRHkaMxm1TQ5jVazHVU53Ps87z/hk5kgSfjb3Xivi3Jg0aui83CQeqRSq
 Uuqac4QYi67d3+sMkQ9B0f0irXDp48o=
X-Proofpoint-GUID: foFkSz1_COI7ADZZAzE7YY31pZ1KIEA9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX1bd2rPUHzW0p
 U/RLWUh6Zgaz339I95NDDS2s5YHAq36uF4XLTq0B08fGssNSgpsQCo2nge9/tKDjdnG+oz03vzO
 YDFX3+/v6XTxJ1Dm1AR2u1QG53BB0/rAWXA+KW6F1nvcz05C88Xrxjze6eQAvkaQ0gt+rSCttPN
 Sm/K57OrNo0A6a42UD8Mg24/N2uQ+d7oea3IdkG1UyTqdYyerTkKZ5Yi70AKDEVgia4xUWQ+tyo
 xT42Zqk9qlDSB1W4knEzC2I0S58xY6obIWwjUTWp0ajKX88QWTI94Cq71cTqyZpcmmClS3vE2/g
 o7boKmjYJS/mBoayeHDnfPlbAhc6gN00KtsNOdtDZktUV5yx97Lh5L7B4OF1GVxIBsiscO2VkaM
 +nJp71TLNaApy0xVqwNKSOqoTcZm9uHTmv/O8kx6Y3P7reDe38oXlBn+pVsWt+1YNywUTpVYZ8F
 rEf/PlyVWwAB3vXVBDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_075932_261951_F0DD5D4D 
X-CRM114-Status: GOOD (  24.74  )
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


