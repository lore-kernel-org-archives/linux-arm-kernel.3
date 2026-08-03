Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624AFC55175
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 09:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r1TRODCDblm/9JLtIWphfOP7mJeC6V7GnV66A4jorCE=; b=pM/iRXTPSjofd7PbOAOU/iHNQc
	yU6kwLPVdwRc7ymgHSn05bZw6LzqIPa1MhT813eOFkF0bFTPBvQ0YCaXbwqXsnNUKfrzN+7c1ZKVJ
	HiIqd2fuYED62wwoK9b3TMO6fQh35guVtuqz2OOz8BVL/80TRNjMZdZK/yE2a4GdXWV3fGma2C6rP
	CPK4G+VUFVyGRkpHvlURQaCLB9aZMrWdDdMxVGYANbwUHbLdtVGfSf2EMtUSnWNV3pn8cPcvZz9z2
	96Hpf+dE8H3JPBSAZTwntlak9aWyEuGLKBd+k7nVqJAwa6bYdBYqu5sz8l81zyqAjSRMcCIrGncI9
	ANCodHsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpEA-0000000GjGH-41o1;
	Mon, 03 Aug 2026 09:44:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpE8-0000000GjFL-0Cbh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 09:44:57 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736oWKQ2215161
	for <linux-arm-kernel@lists.infradead.org>; Mon, 3 Aug 2026 09:44:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r1TRODCDblm/9JLtIWphfOP7mJeC6V7GnV66A4jorCE=; b=ACMmb4Bur0R7+p9D
	1UUk86nNqNglPnh+L923LAcxwIYAeqPfq5yRZdbDH6fTy2cVwhMki1pskkztKJ1D
	eZyb3k8Vq3m5EuTewvYPjIDlcHBUocNgHHwMGDtalaumm/1gB4QKB/JrZTzayqzd
	+n1wlYPRRx/W2mqRzJ5otRnxb0gi3twSsX1fijYpisKpWwOdMm4K1kxIBCCv5BCr
	S9tmsx2U1XAyXZZtZcXdpIiTUikM/vDgIcPNAQ0C1Uvwtbw7cizKwGtMK9Welwi0
	pxZH/GEjKd43S9lip5fiJ5cGvL9JEegI7JoIXY+6+lo+XppbiCKmO0pKP037dFpH
	GvoxzA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftdmxa2wt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 09:44:55 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso3062449a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 02:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785750295; x=1786355095; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r1TRODCDblm/9JLtIWphfOP7mJeC6V7GnV66A4jorCE=;
        b=OKxiTxkJwFhn/qzhB56ISpZIkg5EZQgDrRHFzn7g1O7AHIv4WAAp1DgX2dzoj8U30o
         p0/XSay7F8oRp+20FTdZCPsQXIyBVtvDkBHU55gl0oNqWNTm8vh+NUU5Fpql/D5H5RmJ
         1eOaycKUk1Ms3GWFGgwmnCj44OOJNcW7J9SWCLJFraVj8DHEYWmx8ATBKmZHv9aVmRnl
         587BTtJBPrUVwjgFGeucmmA5QGQ1XwG2DNGW1yjLZEIe6bjn/sdgFmOuG18XC0uYZnLP
         EDt6y4FislNZGk8cPd9+6fjC6OkZd1eS1zh8BivZX0iqum7PL26WDY3FE2iKcz3Wj2vL
         ZCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785750295; x=1786355095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r1TRODCDblm/9JLtIWphfOP7mJeC6V7GnV66A4jorCE=;
        b=q0UYLcvo2lUcjE2fCx00d+ylfGG3bQ+avtDv/CzN5gc598AK6AGS/PesRI6pgioJxl
         NRoEefkJsrzRH+HnRd7vAFKBdGqNcKMecdWZWP1Dt+wEzLLJFUsHzMfm83PGLC3+Ab3F
         zYEGv0KHZYM/sA9B3mNKywkSrUsNDl69EWGB1PvgEaS1J8KThsmCQtNJjWaRjwfXzj3U
         EQnQ2r17PvO5A5lQh/oaUmyUaE6dcProrLLr35awQny4sZZIpJ/fhoLv3BGnwib2x6pm
         3SRvHpsXvK7QtWokNWbtODx5ZTo7u2qntJvCHyjU8KBMdwSrtUNO7NdXUbEP4U/9eZVC
         kvEg==
X-Forwarded-Encrypted: i=1; AHgh+Rr4WIBlGPC2aeg5cmQHDNJ5hMvoeii7YP7h8H6dIRiEGgvAmeqfhnciKA3yx29UPV38xxf/6ulvrKumLZ+jLqBF@lists.infradead.org
X-Gm-Message-State: AOJu0YxRyTziCZsAV8Q9tkVVdt4OLCU81d0QwsrJmixbdA+Nsw+GQ0OS
	qSlajhJzstNQf9Aqo7M9XMPVL/xTTfRUjwuRerD5i3Z9T8b1oAkI1FLmsCmc50uYClHWhlBj3Eu
	U++ZqQ8agQAIGkJGRs2IBB996zcw79uXvc5V5Wv5E9M+xHjXe9m7Ke3olw6prPu5fyk4SOXE1l4
	Hr6Q==
X-Gm-Gg: AR+sD1081Ir+E6NksyYQGITTh56wMsd5SL0Yl8FwZ4XEnWxZx+BT0SmpBa/r92ha+Uy
	vISIVtR6c2sZZ9KZsl3TpB7QFVwxtiLmQmsOdiyKDcJI6wvqjeAFzQq+Mw7tCt9D6oF4XTVgrRL
	1BRfElsWmR+NF7K/4D1fH8PC3FhOdngMZhxKLvnwAIrRsLRHDuvCp6SwvzWD6TTbD48yj1LTt6n
	ilS2CSotQ5XP07ZgGtnoRUwpY7nhDi2wFjO8tPyb0UVEV02/bz9PjO2r+hFSURqwNOODcTzTCDP
	WKguaqg887k7P2UbsRNZm5vr9Lz1Bjc1CLChopU0iX8zuCpAY0rTZC55YK4MeZ1qBzmzUMT/XDj
	DrtGGwN7i9T6EUZZAABUH6NMEYL/LvVI0g3xH
X-Received: by 2002:a17:90b:57e6:b0:38f:23d6:b4ad with SMTP id 98e67ed59e1d1-38fbc3f7e43mr8156682a91.8.1785750294744;
        Mon, 03 Aug 2026 02:44:54 -0700 (PDT)
X-Received: by 2002:a17:90b:57e6:b0:38f:23d6:b4ad with SMTP id 98e67ed59e1d1-38fbc3f7e43mr8156650a91.8.1785750294303;
        Mon, 03 Aug 2026 02:44:54 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2be6c8csm3660671a91.13.2026.08.03.02.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:44:54 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 15:13:32 +0530
Subject: [PATCH v24 01/12] power: reset: reboot-mode: Support up to 3 magic
 values per mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-arm-psci-system_reset2-vendor-reboots-v24-1-889281373870@oss.qualcomm.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
In-Reply-To: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
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
        Bartosz Golaszewski <brgl@kernel.org>,
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785750273; l=4572;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=2/mMawez6NK626poMyU8T8NA9gdZ6S0XfZEN/N7KY1I=;
 b=xvU9I4zZ2yqhSbHQ4Sj5d5q6B9I3PNsjrVLvkEbssORYCteXpmVFM3Ktc7dyL02b9gY1Ngg4+
 pgoUHjBjDIaCTlfsiQkfExsM7V7X88mmS3J73VfAddR6YEZZlU05T2X
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: LiTthi8Td9m1TbixZtd8DMfTo83dot7w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4NiBTYWx0ZWRfX9iO5rl40Ojzs
 nZMkG8bW44gZ3qVsW2xrqRFwjJ4agRpg6HrKoTIV9Flk8fLOcChY7+OtOOpS+4loVNYDgpmgOvM
 uNAlLLBqMIWRxMRmVG5R425lPpE+c6VODmvJ1qPnWsiSABPZACgMf/l5aDqo0tk2wFiX5RVq6iR
 cFKHz+mmydxY/3YEvK6RjtyH7xid1v3S7Th/8K5H2M59EaetlSGpNgZ09AvMlMgnKZ5KSKz6Hr+
 I/3UDyPJR4RDNfcM68LcK++Hk/fxE8RLPkg9bnW1UZaWVwB1k7I4krUE3HMc1XSNY2be10KStuP
 4EYKWz9oVXS+W9leWcfVktLfWelKV3tTyr/iXsRzDjxDJ2XJ58MKBZ1ZillYfwOmugaY+/oCF2b
 gyDIINUuaAuZ3UwJECejVNo7rOE6tEMKFHGv4ln86/42WKrKLSsPk1irQ74LUFPh69Mt6xABzcW
 pHEkdy4SGOGmLCS/ZoQ==
X-Proofpoint-ORIG-GUID: LiTthi8Td9m1TbixZtd8DMfTo83dot7w
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4NiBTYWx0ZWRfX+VggTe8pc1kw
 IAj2VkqUDBumFHvxkoBKIUDx0eY89XkyMY9BwFT7VVpaADmu01QL7dJuWnBA40/duV+LQ7mabYz
 bhW308kxJkPB6RbnSoQdxRRnaBbkweI=
X-Authority-Analysis: v=2.4 cv=L7MtheT8 c=1 sm=1 tr=0 ts=6a706317 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=_usNffLPL2KliZ4tEdwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_024456_100504_44625064 
X-CRM114-Status: GOOD (  23.96  )
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
index af00c00eceee..c7e9285c64e9 100644
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


