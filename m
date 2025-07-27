Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2779C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 16:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v4YCBWmY0mp9H7MQ3j2gakQJBYTosZxb2APt1bK5h/Q=; b=0kSl059ycate6H61vvAXs3Kwp5
	2maCaNQ1UT2BSO8ccae4jPzPJiSsiCl37iEAHlFD2qzbWk9F6d6e6gQ4FWmJ2QPeUHO4D2bfnCOPa
	aU/WqtCipp93PGuHOsQzO5BIUUr/h6oTdf/itYenrovoMkDmuD/RaS5TgxblFoFWrRGDRt0oJu/FO
	6ET/TUlYmfL3TmCOt/veUbQKubYhXD5qTN4h9WJ7GHnUgF5uHCf64zFmRVg/WnfuZNUhximTld8Dv
	2H633xEd2kyKQ4KI4AEepljsihX+jPGp+gmcuaT6eremIdEdOHy82+/4Sb37uI/7AgI0cflNOMqJ5
	1iB3OgOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug4GU-0000000CvxN-0I9K;
	Sun, 27 Jul 2025 16:30:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug4BV-0000000Cv8J-04fP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Jul 2025 16:25:14 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56RFwbQa002596
	for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 16:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v4YCBWmY0mp9H7MQ3j2gakQJBYTosZxb2APt1bK5h/Q=; b=Pc3A8fbHKs3Uzph6
	DOtrmF5OwSYALF4PY5i7D4F9VXczqAzOrGND4qpa31lWhSlECsdAM/Rv4UFEdQ0i
	PItIVzMOGcrEIvfVFmOaH6NMP1HobYfzXXQ1ND/NB3IBKJhSIlUqY6TA9APIg+Tt
	e1sTVP0biTCkzmhm7UJZ3sNscRVQP0mN9u4tZburAFKw1BFE7BUi7xcbw6c5A1VA
	RX8LUHXTMNCktcb+mBTF5LuLW/dF9nwiio3oRhv7tX98JxczkchN69iHw3NzOnQY
	ZN4w5vyjeIdcPP26WobDOofu4PNgdsS2iG+5STLfwXKwGW+iUlu86bPbW6Ca8HDK
	LnMiEQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484racj9jb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 16:25:12 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23fe28867b7so11964805ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 09:25:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753633511; x=1754238311;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v4YCBWmY0mp9H7MQ3j2gakQJBYTosZxb2APt1bK5h/Q=;
        b=rvf8U7cnJftCIYeHQU+aSkGl47198uGXeGv20FHpbBnmtHFeyJkxZOiv9R+4FtxLgl
         yUpcieI+vg1R6h1V06JT11owSFKqqiN4V7FMZM8cLs5ekQ5gszslfNtpdJ7u06l+qEq5
         lxPGnCOWKwlIcuI92one8iNo534pxpB9EGGViMhc1r+uHEg53P9n7GxDrdWUgljGugwY
         kGe62FXYIwmfxef0RGT6I8IiK7sNrKbEis84vLRMUKgoNN0oyRx3rJbUE0VcpwqPMNht
         07bhZqWq6c4pBMKEzteGL4nn/ecsgke9SVsh+fTcSlXVM+XTC5GyzYheZpRBWdx1Y4DQ
         2M9w==
X-Forwarded-Encrypted: i=1; AJvYcCUZ64rSDqaVYd3SQf5kmLAg5wHtHFlNnDzbs1KCkb9ru7pmDuF16ZtDPiB1tYNubMGY6yHh9hvpsvngkNZ68WYV@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv+v3tle4SOoXAtqLwdu4ghqGZHT3pxQlG2c7vf6OPCEZtJgnq
	wjJJCRHwZwEVoe84wcNz7Pr5z6pQly3ha6JrLHKICEREriFnbhBNO4SJVR1VWk7TKugnpXGliIh
	GAh7XmcpSm2GjUorRsXEtKyLNCnIk1+Qe6JkJJXUvSr+zkr6SqtuNfgCFTP1lDI4Czx3QnKSmYX
	SNqjruHe/P1Q==
X-Gm-Gg: ASbGncsr1yp3wkzTX8XfWJ86zMQporD6vr0Flswb6elvCJ/e0sF3dUVE9X4xGSnlMb/
	nUHEzRqyy+GhLAIxZoStEKZteQR7NiR6AKtMsKxIPKswmxcTjWFW3G7/hAh+rGF9iiXJHZ845C6
	r0qk0ggnVPJzOF9DZBrYW46Y0OWvit6faRJ372uR6InS/Eo+kcM/ERsLNcOzIAVrVNvsqNHiSQ2
	mNUPDAuFoTND50hF5n8JxGM1/1hPVBLXdrSyogGMyc0IvIRH1PF6FptVHFyQUCAR6ExKYLkNHWj
	0Ml1xoQxhaLUSppxuq/r1P5ILh3HITpyOKFYFbaZLfuWlXYHptzjM+V+HbL5YUQWdYobygYWTMS
	c
X-Received: by 2002:a17:902:ccc9:b0:240:2eb6:d5cc with SMTP id d9443c01a7336-2402eb6d9e9mr9977125ad.17.1753633511478;
        Sun, 27 Jul 2025 09:25:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVQHJRnmueFVtjE5Xgx+LUDsaynix8FLVjXOCUqpUqvT52MAlWGQMEYT0tAC2uOxsMT2zpuQ==
X-Received: by 2002:a17:902:ccc9:b0:240:2eb6:d5cc with SMTP id d9443c01a7336-2402eb6d9e9mr9976695ad.17.1753633511036;
        Sun, 27 Jul 2025 09:25:11 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fd9397ebbsm29110325ad.210.2025.07.27.09.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 09:25:10 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 27 Jul 2025 21:54:44 +0530
Subject: [PATCH v13 01/10] power: reset: reboot-mode: Synchronize list
 traversal
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250727-arm-psci-system_reset2-vendor-reboots-v13-1-6b8d23315898@oss.qualcomm.com>
References: <20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com>
In-Reply-To: <20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753633495; l=3679;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=FC7RrRfjKXNVyHBQzF6uwLhcss5N7idT7lbjBm/hwDg=;
 b=wuM7Ud9mvdBgYMygF1JESinqXl7pH9Sn1j9nV94LYy4tSZEq96eslDnylVV4vStbiMeqYy+l1
 Cs6ZBdqK3AwBOUismrxPOsG47QSiHQe0Arf9SH5ULtsQcLsU7g18Y+3
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=WqsrMcfv c=1 sm=1 tr=0 ts=688652e8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=iWTyA_h5fkyOTIp6uasA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: FiojTH828TbtIeNa2Inyq-ma6v-ZGXLo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDE0NiBTYWx0ZWRfX826NbAyBVFo7
 IMJMedLVrUMg+i3yl7P6Ojl6eCTuZWwCo/gHEmIIdjlGlPS5OywhI8swB7wKM+Tw0JrZKLB01Lg
 0C6owRH85lLQM9BIyW4BtDWVn9RBKAHHzENsYNycboAKJxuenG+hGfYC/eE9QMw5nnxO4xBP55g
 TgLKJFr0q6uqnYu+9mTgdw24odTurmpL+DRSFfe1a/to/poVUbUEN2fau+QLVbgKhHQ3IhDg4A/
 19NlRJRa9OuX4TZRpo8KB0V9qxNG8lBqX8+AQw5R13zzeRGMts9KrbIq+d8vPI0Q9kIQlps4I+R
 PTTZinjVuCEZek0umedxPRdjzfkobLH1VyZe80v9o5EtWfiMuXaxFecrGZRyIv2b+MHVNg+PUxp
 Dot3TAumG7GdXjAGWFLE8vJDwvPX1reR3efN774btKCw1wXjCYn3G5d9qVOAytF0PZvH6UIK
X-Proofpoint-ORIG-GUID: FiojTH828TbtIeNa2Inyq-ma6v-ZGXLo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_05,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 mlxscore=0 malwarescore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507270146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_092513_070173_21365D66 
X-CRM114-Status: GOOD (  17.70  )
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

List traversals must be synchronized to prevent race conditions
and data corruption. The reboot-mode list is not protected by a
lock currently, which can lead to concurrent access and race.

Introduce a mutex lock to guard all operations on the reboot-mode
list and ensure thread-safe access. The change prevents unsafe
concurrent access on reboot-mode list.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/reboot-mode.c | 24 ++++++++++++++++++++----
 include/linux/reboot-mode.h       |  4 ++++
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index fba53f638da04655e756b5f8b7d2d666d1379535..42bb99128ed3846d4bff62416dc31135ddeaeb90 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -29,9 +29,14 @@ static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
 	if (!cmd)
 		cmd = normal;
 
-	list_for_each_entry(info, &reboot->head, list)
-		if (!strcmp(info->mode, cmd))
+	mutex_lock(&reboot->rb_lock);
+	list_for_each_entry(info, &reboot->head, list) {
+		if (!strcmp(info->mode, cmd)) {
+			mutex_unlock(&reboot->rb_lock);
 			return info->magic;
+		}
+	}
+	mutex_unlock(&reboot->rb_lock);
 
 	/* try to match again, replacing characters impossible in DT */
 	if (strscpy(cmd_, cmd, sizeof(cmd_)) == -E2BIG)
@@ -41,9 +46,14 @@ static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
 	strreplace(cmd_, ',', '-');
 	strreplace(cmd_, '/', '-');
 
-	list_for_each_entry(info, &reboot->head, list)
-		if (!strcmp(info->mode, cmd_))
+	mutex_lock(&reboot->rb_lock);
+	list_for_each_entry(info, &reboot->head, list) {
+		if (!strcmp(info->mode, cmd_)) {
+			mutex_unlock(&reboot->rb_lock);
 			return info->magic;
+		}
+	}
+	mutex_unlock(&reboot->rb_lock);
 
 	return 0;
 }
@@ -77,7 +87,9 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	int ret;
 
 	INIT_LIST_HEAD(&reboot->head);
+	mutex_init(&reboot->rb_lock);
 
+	mutex_lock(&reboot->rb_lock);
 	for_each_property_of_node(np, prop) {
 		if (strncmp(prop->name, PREFIX, len))
 			continue;
@@ -113,12 +125,14 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	reboot->reboot_notifier.notifier_call = reboot_mode_notify;
 	register_reboot_notifier(&reboot->reboot_notifier);
 
+	mutex_unlock(&reboot->rb_lock);
 	return 0;
 
 error:
 	list_for_each_entry(info, &reboot->head, list)
 		kfree_const(info->mode);
 
+	mutex_unlock(&reboot->rb_lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(reboot_mode_register);
@@ -133,8 +147,10 @@ int reboot_mode_unregister(struct reboot_mode_driver *reboot)
 
 	unregister_reboot_notifier(&reboot->reboot_notifier);
 
+	mutex_lock(&reboot->rb_lock);
 	list_for_each_entry(info, &reboot->head, list)
 		kfree_const(info->mode);
+	mutex_unlock(&reboot->rb_lock);
 
 	return 0;
 }
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index 4a2abb38d1d612ec0fdf05eb18c98b210f631b7f..b73f80708197677db8dc2e43affc519782b7146e 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -2,11 +2,15 @@
 #ifndef __REBOOT_MODE_H__
 #define __REBOOT_MODE_H__
 
+#include <linux/mutex.h>
+
 struct reboot_mode_driver {
 	struct device *dev;
 	struct list_head head;
 	int (*write)(struct reboot_mode_driver *reboot, unsigned int magic);
 	struct notifier_block reboot_notifier;
+	/*Protects access to reboot mode list*/
+	struct mutex rb_lock;
 };
 
 int reboot_mode_register(struct reboot_mode_driver *reboot);

-- 
2.34.1


