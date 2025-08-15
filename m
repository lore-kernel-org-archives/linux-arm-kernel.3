Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B93CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 16:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v4YCBWmY0mp9H7MQ3j2gakQJBYTosZxb2APt1bK5h/Q=; b=tMOzsixrxzvi+VeJuNqmrOms7D
	6DauQaknS52V77qy+BBoj0Jj9cgA7yZYBS+PZ/cf502l43GJNG3uKr1a0UnmWnAMxhSRu2W75idvI
	R4BCC0dnB37+4hRhVir7yY6WlUlrI2AMfvKYLcVKOHeCALsZpIgsEXPydKAvHpGXjlDKi5JsSP/sm
	TFepuf8WtZfkbhKm0uUXyz16h/qAtsW6tguyhTfVN+6Br/pQCMd59FMZFXTodcl91sx2U0PtdXQaz
	NquuRuaPSIv+S9ZMO5FWK4yQWMEkXAj5PCFRIz8PJ10AFfSrQjLHCmxmlnj0sjcuRUsV8/SNXy+5R
	qm+eGxUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umx98-00000002xOz-3Al9;
	Fri, 15 Aug 2025 16:19:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umvXr-00000002jhN-3Ws8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 14:36:41 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEJFIN022210
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 14:36:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v4YCBWmY0mp9H7MQ3j2gakQJBYTosZxb2APt1bK5h/Q=; b=bfxoMusV+UeHpJYS
	tVHWrsfZOEK6xVzwa+eAnGLEM2Aqciwlq7CI4IB/UoLpjhHfbPoE84geqQpcR1Eb
	F9+4fXqNoElfeUEf9uaXJKS5XDsDnOkxLR+ecgcutM+weSBgFXlPM4nbSlJKZqls
	uQYv05X4h+nVUeqkh6n7bsQquvWvji90fYjVrnzLX09FDydmJWs0SXz2DZH01mt0
	Vs+E73FQwjQ+JO8YT1IwprMQEHiHb41mrB+0cYROltsng5+7Jr1NlRY7ggiE3jUT
	IwHtnJd3QOne8M5AQNbq1oUPoIQ67YJyeTR38pJDbkwij2/AAeKrn/lohfHNFuFJ
	m38lDQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g5hmk7q6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 14:36:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24458345f5dso20436975ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 07:36:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755268597; x=1755873397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v4YCBWmY0mp9H7MQ3j2gakQJBYTosZxb2APt1bK5h/Q=;
        b=DLkFEP1X8A/zvWU5QALnM2w6yIKhZ2y4cgoujIyzs7bsr59uBDZfwJHrSz6IzJuHYM
         9zeeGEhBD7n8QdCQKgiRxcSVt118t8ZuGwHk+lx85ThHEL2U+hi8/ChZy11tRVvonNKD
         0PjQfFgPWKTyvt0bLu1T/M+vTRoqaAhWADGvl0pzzpQXsLNCykHHHliUQygFWjQbvdZt
         z2x44GeLM6IuD04+M7q8p3BRkOvuRXfaAQ5McOxg541fEJp4dq8KKjKCzs/R+9tuZXkb
         1a4Nm9oDXjOe4YSf30mx6smRWTltr3Hf+VhIxgcu89TYghyUrlyGgXXa1pihwd53WRYd
         8B2A==
X-Forwarded-Encrypted: i=1; AJvYcCWI2Jo5VmTV0RfYIeFZxC0VVvw72/h5X5kJ61jj7dsLeVEzIWprlLFWRIn2hF/r2UJo8dVIEwIRaxZkGGercGln@lists.infradead.org
X-Gm-Message-State: AOJu0YwfSBWecRtaErzh7zg+jArPYXqV7Eu4dG+X8VeD1gjIZPA+Km5D
	xAdQnn4UB/6ZFQphzfgczffBmPgyofxMVkk1QJw70OHOBG6Vi5xrfo9AwsvFMJPurgUmYoSO+8R
	vinL3owv5BLvmCtSXnWt5z2XSKUSqnZa/WWHG7VgaTqpCd0P3kre61hMNHKD2XDVjWMYJxLcZxQ
	NIyg==
X-Gm-Gg: ASbGncu+TCQ2+XIk/A7eLYHOl9FpbnNqJgXMJhT5M7Bxa2JNuZrU6LgHN40lUEICcqZ
	70hDvZnn2TYmJdL1dqy/DydU0a6GtJkbR/Xb1L4t9B3u+CxE7927lMfOSUccAYU4rSpWu+hmj3R
	zfay35WXm79JE06HYPLMbOuQUQhZjF++76tcu3cG/P/RhuZHxlOHdzx39/jR7Ci48iaRL7m/+J6
	i2bRlrFMr9cmgY4WzF1KkOVuZdp4r2LlINjYM08otaR4pqIUYPHWF7FGmt3zZCyAPjsbuQu/DF+
	T9mv729xNwqJwvMqC3t+K4Wxo8pQxqjcgNU/LzgGjlGHEGiTKlei5Bqm//F97A4gstKupTYadG9
	Y
X-Received: by 2002:a17:902:c404:b0:240:2145:e526 with SMTP id d9443c01a7336-2446d5bced9mr33643205ad.6.1755268597510;
        Fri, 15 Aug 2025 07:36:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8j2DBTSDu5n5h8GFZmi+daS6bzM/R0ejhF0k7J+060Go5g2KE+vK8hO6LMHELOHeOiEIIIg==
X-Received: by 2002:a17:902:c404:b0:240:2145:e526 with SMTP id d9443c01a7336-2446d5bced9mr33642895ad.6.1755268597056;
        Fri, 15 Aug 2025 07:36:37 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d73619fsm1437576a12.39.2025.08.15.07.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 07:36:36 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 20:05:06 +0530
Subject: [PATCH v14 01/10] power: reset: reboot-mode: Synchronize list
 traversal
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-arm-psci-system_reset2-vendor-reboots-v14-1-37d29f59ac9a@oss.qualcomm.com>
References: <20250815-arm-psci-system_reset2-vendor-reboots-v14-0-37d29f59ac9a@oss.qualcomm.com>
In-Reply-To: <20250815-arm-psci-system_reset2-vendor-reboots-v14-0-37d29f59ac9a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755268580; l=3679;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=FC7RrRfjKXNVyHBQzF6uwLhcss5N7idT7lbjBm/hwDg=;
 b=g4yjAP/BCuktcWiGQdYaKnjeQsltqIlsf61mfAvCUxLEzZySADm+zJuHV9ye2qZLIB3RDyx0V
 W/C8BqZAcwoDo313Sw6zzqFi+iyDxtUYtypSJx0xwxb8KDxTU93zSzF
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDExOSBTYWx0ZWRfXypppCA9yeFPO
 Yvei6rYkdoEmxdeca928LcdYqFiytShovkS6PxY1+WtaDgngm0hfVI464K6pFv1m50JWOeQ8nYe
 iR2Av1tk4Mmiimpk2yD95bCRrgVI6zDDyp/EwlJU6Lnz9djwPVtjbW5HIDe/we/3CjPXglIXLWE
 97zOM5YauPRC3qTJZu8tszhzvKO5z1nyhortXb/0ptiyrsVyvVARovfInUmj1sxgy0APKh88b6a
 ZJ5h/c7tZ/JzVLfBlFsHoZCFPBHOpP0xpZw8mTcBG+dinb/zEA17MvDuWsC3DiQVtLL+axMiyJr
 68BY9y7HalgeCLxOE+QeByAp5/D+hs4h0g7pLKHbiJ2rXjvFqbjLY0uyxtSWJsBGpRtW1xbkSIi
 ybguK8o5
X-Proofpoint-GUID: i4geqGJ6pp4tM363vAhsTlY43HRiSNz4
X-Proofpoint-ORIG-GUID: i4geqGJ6pp4tM363vAhsTlY43HRiSNz4
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=689f45f6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=iWTyA_h5fkyOTIp6uasA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_073640_005158_1CBC5FEB 
X-CRM114-Status: GOOD (  18.01  )
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


