Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A25C83F1F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 10:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Mf1tUCyPlRBD7uh7eZr0NKbyyezdmIRIQMRpteYEvo=; b=xaGh4EK/dUSGxRj+yg4GzWRmY/
	PmCCS4VZpxq6NLsMPojezhuH4sRxIBqaP0PG4dr11j7Mt5aNN+OPgnu7MUITA/0qj2QuJS4vuhk5e
	F8ouwbpdyZilNKaybDULBERtTAk2LPfhhaJrAQUU36pgXNsaZuhc8DzaF4Skr3poyIAzRENLsx9vB
	oEmMMTtJZXNw/1C7h9hV2rVnQd1BwlxbPXdZat2JkqBaBQ5+/W9G9c7wbF5EkYyQnodh3fhDkHFii
	iMhPmPBstp7QObrcQSfvZzHbYf2nZK423dlyJ1OAi/OPuj8xYDNzUZC80u7wLg3FVxTB7NpJyGkXb
	Hhp4Y8Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZoVT-0000000BU7v-0Neg;
	Thu, 10 Jul 2025 10:27:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZnP3-0000000BJd1-1tr1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 09:17:19 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A9Fq7J030103
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 09:17:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Mf1tUCyPlRBD7uh7eZr0NKbyyezdmIRIQMRpteYEvo=; b=VMahjaXqgpX68aY8
	Lb/ksRM5tnwkuGncVOPSKi/u1EmtxqbncDxA6/Jc7xl4hg5136BZtkBeKoBeXqZG
	QHyUDI25izQBtZSk/2FI45c8ypXLZAM1fkF3VYdAkjnBNJtekmLwnL2MSz1SeIf7
	Jm2eWkdg46hQ0rp9qt9d9vYF+PebWBD5h8/kMzdcU3dd6o+KihZ0lpu/dQ4nzkUN
	2mYf7Ne8VIzw1U/pIVDIzd4pByM+X/guU0AXAPmFeSy6l0A+nhCUmbIJEvZwFDg5
	XfpaS/w2SGcWuHY4ZWTe/bCTDGwfW2xehETqrEbu9oILa1ohGINfF7UTVsJRWvim
	WpFzeg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smcg4b02-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 09:17:12 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b00e4358a34so641563a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 02:17:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752139024; x=1752743824;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Mf1tUCyPlRBD7uh7eZr0NKbyyezdmIRIQMRpteYEvo=;
        b=Mi4NK86/1yK9g/GKtdH/6xuDbWa93oPNAFe3e9o6EnPULG+dXYUNGkBtHRx598P9O0
         Bb2HGdIdG3TPo5Y6Vtcg9rGNtN5sywv0gPt9iDQQqssRJfHubbyaR12mzfNv3lUPw2+S
         0M9DZfxNY6wrXxettF0ykfGITaOF9KDpOJeK2Yr/q7vTO6XntSUN2+0nkyr8HKctJbY8
         tSv7HnpgcJ7HcsE15wMBluJZ8a8NZE/Op749sIC/23LEZjyJ7DdeQocGSU7TOb/27pfU
         pC4i/1rvkkRuZzDsDswhOWrtjLw9cOFW7JbpHhcXIkdoBisEtX6etDAj4ALGeFZKrTWW
         W5lg==
X-Forwarded-Encrypted: i=1; AJvYcCXiC7KmtH7xdwRFX0dnQcMEfebYyjxaSKGl4bwLaym7NErWSEK1RopRWwN90J7zvqTSp9VtMbD8BiV/mkfL6JVW@lists.infradead.org
X-Gm-Message-State: AOJu0YwBoGVTidjr2DN2qU4h/MQQXwFm3LARwXvgpGdvbucRaeslV8tR
	D7ebfO5yaORXX18GkFjFwUY6BDysXXHd73d4GUFz/aKLvWenu9eJcEyzEBl53N/FQsxEdmZBuZ/
	zM6wSEp5j5TlI2xAak60ntG763luZ65jz1DSJa+qjU7AoLqsoqLKRcBAnZj4Q/rDF/0SMrx8ti9
	ALGg==
X-Gm-Gg: ASbGncvEjuTm0KgPo6GhprzYM5tdA3UZYyyfc3TkNpIKf7D95Qd6Eeuh2iquYPajN2+
	b2Q9UFohjoXfa+D8j2qZ7229Y1ZFeXa5jtNAld2LGf0x/HCD/eB4Dam/wJjwFRw3hFZbUp5CYZs
	iJSoqNiG1S7GtJmVS9dcsCiZdiQlEl1taYh8boWRcL6jpHMGkvHuMuB8/HUbvuVCOjHH8rmoD5v
	NGFezf/ciZI0g9qRwA2VwbFYwWv7Bvs+lgTrroTziR3KOhvYb8mtfPG6jfxSEWLrvI0vOeNQ13w
	gzLWXJAXVc+AmvYM0vdueqFf0p05CetdKkEC50ka99qKFVA/aKYp9CkzZsY=
X-Received: by 2002:a17:903:11d0:b0:235:7c6:ebdb with SMTP id d9443c01a7336-23de47cd531mr27606345ad.10.1752139024282;
        Thu, 10 Jul 2025 02:17:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaTKG1M836vj85DWnJt0R7I4oMnJq5iahq76ixet4o2OdBW9MxUH5ZENGIwQnEllXEhSYfyQ==
X-Received: by 2002:a17:903:11d0:b0:235:7c6:ebdb with SMTP id d9443c01a7336-23de47cd531mr27605765ad.10.1752139023772;
        Thu, 10 Jul 2025 02:17:03 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4341d51sm14837765ad.189.2025.07.10.02.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 02:17:03 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 14:45:45 +0530
Subject: [PATCH v10 03/10] power: reset: reboot-mode: Add optional cookie
 argument
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250710-arm-psci-system_reset2-vendor-reboots-v10-3-b2d3b882be85@oss.qualcomm.com>
References: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
In-Reply-To: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Elliot Berman <elliotb317@gmail.com>
Cc: Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Andre Draszik <andre.draszik@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, Wei Xu <xuwei5@hisilicon.com>,
        linux-rockchip@lists.infradead.org,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752138982; l=4147;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Ybw+njJawUkDJ2EQIbedFhNekca67Tu3POKilli7L+k=;
 b=YFgAo1XczR69Kp0uIrUveOMYfDOdwaOYVutqLUFprgRmdRqIgHvcUhdeVirp5t0t+SejIfQMq
 ReHm/DNkrNjBb1zWeD+v46tG3Z6QZCEZi2q4dlboOoqyuJ8ZGkvyl9N
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=P7o6hjAu c=1 sm=1 tr=0 ts=686f851a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VUHD6Ma6yzaK34Q8qnAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: aLMtQ0DmoHkLNRdYfHBEcEK77vHYUCwk
X-Proofpoint-GUID: aLMtQ0DmoHkLNRdYfHBEcEK77vHYUCwk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA3OSBTYWx0ZWRfX9xE9ehxQWq4r
 Suk8cd/pCNxsTEGUGeFVFDvKA0nK6EAV/cKebAi2lkIt5N3LG2xNuRQbDu1gFCJT8Pf1XEOTqfH
 zbhzVrCF49sOsaLgnZHzos9XLmXyAQs7FduXQfFnBOqqFGs3Zvt2xVgQp2pTridusAiU0Stakk5
 RgkFEIwVophpTnb1gZt+lmBgH3xMfmQqtbQ1OmHhLyyZjFe32JsH5/XvZFKYokxouxdmRWSeP0v
 5I1iNCA6rQZ/YFenSaKuTHuYkb4EnwxUmNYvjpBcvJtlDJ9YYkoBZe2pbokeNA5QBMHF1mNygh1
 K3e2OjGOxe/hIei0g2t8EKatwQttY7v/wqXduGzf5Z9ClJqekecR3+UxAKiPJRk8DRVZQTZwSTG
 AGUUud/Pc8SjeblCYHBd6igQ/yW+QCyho9sK8BlokV7o46fkPu4dbmwFnJcTnfA4Vjqu6nEO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1011
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_021717_495133_792AA029 
X-CRM114-Status: GOOD (  22.90  )
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

Current reboot-mode driver supports a single argument(magic) for
each reboot-mode. There may be uses-cases where a mode requires
an additional argument and hence may not be able to use the
reboot-mode driver. For example, ARM PSCI vendor-specific resets,
need two arguments for its operation – reset_type and cookie, to
complete the reset operation. If a driver wants to implement this
firmware-based reset, it cannot use reboot-mode framework.

Add support for storing an additional optional argument (cookie)
for each reboot-mode and introduce a write function in
reboot-mode that writes two arguments for each reboot-mode
command. Implement the read and store of additional cookie value
for each reboot-mode defined in the device tree. In case there is
no cookie specified in the reboot-mode device tree, mark the
cookie as invalid to support backward compatibility.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/reboot-mode.c | 32 ++++++++++++++++++++++----------
 include/linux/reboot-mode.h       |  2 ++
 2 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index 61f647b23959789a313f3af0bd967abcad45fa43..afadd823d62d0f7e7e645746b978cc8fecfb9ac4 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -17,11 +17,12 @@
 struct mode_info {
 	const char *mode;
 	u32 magic;
+	u32 cookie;
+	bool is_cookie_valid;
 	struct list_head list;
 };
 
-static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
-					  const char *cmd)
+static struct mode_info *get_reboot_mode_info(struct reboot_mode_driver *reboot, const char *cmd)
 {
 	const char *normal = "normal";
 	struct mode_info *info;
@@ -32,11 +33,11 @@ static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
 
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
@@ -44,21 +45,27 @@ static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
 
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
+	if (info) {
+		if (info->is_cookie_valid) {
+			reboot->write_with_cookie(reboot, info->magic, info->cookie);
+		} else {
+			if (info->magic)
+				reboot->write(reboot, info->magic);
+		}
+	}
 
 	return NOTIFY_DONE;
 }
@@ -95,6 +102,11 @@ int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *
 			continue;
 		}
 
+		if (of_property_read_u32_index(np, prop->name, 1, &info->cookie))
+			info->is_cookie_valid = false;
+		else
+			info->is_cookie_valid = true;
+
 		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
 		if (!info->mode) {
 			ret =  -ENOMEM;
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index 36f071f4b82e1fc255d8dd679a18e537655c3179..cfe18cdc2559be249969bba6c022940a508dd188 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -6,6 +6,8 @@ struct reboot_mode_driver {
 	struct device *dev;
 	struct list_head head;
 	int (*write)(struct reboot_mode_driver *reboot, unsigned int magic);
+	int (*write_with_cookie)(struct reboot_mode_driver *reboot,
+				 unsigned int magic, unsigned int cookie);
 	struct notifier_block reboot_notifier;
 };
 

-- 
2.34.1


