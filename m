Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDB9CCD192
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 04:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wck1RFL3Etc5iANJFBisnl6A9QEEqYSWtMuEcnVHG7E=; b=JLo77+QKGijsDdl9SPA4pDw0fW
	i4pgFcRH5wduWndLLmVxthFzkk1UmhDhoap9deBnBRhpSobau5kA0HyUsLDIo5kiGtaK4vhzFehse
	AVI1ydjlhpqVmxWIlCdsYSZpps57wBbUSF44hZeRD3+vWIJW7pjYMJE/TCSGI34SRp9i9Coh4ig08
	AUMb7YRR+UPs15eSGFC5m0d4cJwZb/XCfKQjAWVb7vSUzYVv+CiduHXO/ZeoVc+uOOhLcTEQ4PyYy
	/+9eahsI7uGZNa1DZ0By2m2Nc4h8mfUl44VcFa1hZScyaHrWht4wHyhp4HJcJLu33PlcAtfEN4Cjy
	aimioOfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8tHn-00000000R18-2WAH;
	Wed, 15 Oct 2025 04:38:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8tHk-00000000R02-2QS9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 04:38:49 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2sbGG016069
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 04:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wck1RFL3Etc5iANJFBisnl6A9QEEqYSWtMuEcnVHG7E=; b=NeMyofGSEPD7nble
	7u4vK4vF1Lvmcr3EAJhxZLCFe9wQE2QAfTSqt8a7V+3QYgCU0QJU1AsFPm7JGsNc
	/J4GlR2nz2VMggOt3mR3tOHCzQ5kbHFVmuXnALpj0qhvo6KCGXwo5ake57C1Ehpq
	t5mm7TO5DRKiCHjwWqiezSod+ipy35j2QhoMJvHUR51SDowjmfvWZyJP9cBcbaYh
	Q6kfWPAhI2jwRnEKimD+mdV3uMbWudjBs4D6SRptx4FoUIC/H8O+PrqhrLxgXR0H
	76V2NQc2N9XLau4piN9vCRSUHCbKuOgFtP2PLKAd+/x9B63jOgzKalXKAdYQ1Vib
	bEGReA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5k5ce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 04:38:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32ee62ed6beso16018934a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 21:38:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760503126; x=1761107926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wck1RFL3Etc5iANJFBisnl6A9QEEqYSWtMuEcnVHG7E=;
        b=qlaruS1bT+QrlpL3X1sri+zMXotBSPNPK2S+h3dnDKwpzoS8+89hmWTUzq+3kXCN+E
         lZHTj9Kl/Z+fo50BckGWPkOF1t4OpBuLsGmTquihHToyfJ+qLjkq6Kq6GzH+Vq+L8QKr
         smCaSjbjGReARPAmovN1vQeRkYb8M/oRi7NUGjlwawybDJKkSVHjLz9ggEuvkaVBk6Iq
         TY3mNZRYV+20zfWh5Hs8iEK8gOGoZ6AV4KShKp9My+pWxbMlCI6Tcf6RdCPR7JWiMdh3
         xhVha4gxr+Uq5buNAlu4ss5NyPrpdTiSZw0meqy7WF9nMUDc00SVDhENJnx7sHOoyaet
         QFHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOeQtzMxJVlEOUMyU3DcaNv7U+BeVN43KFqUW7dLkzcd9Q7BmL4zkkTjfRk+btAWWdATDaQYrmxehDAd3uvBPx@lists.infradead.org
X-Gm-Message-State: AOJu0YwMC3VCS/DqQWJxsSFnhza62xBG6+wIt4igJWTSdmYUApuZwX+N
	p/DWJhNcVKZfyYqp6R8M8YuW9Bp3HecLuo6mFIQjjEEu+r5MY8bCh3TWa3N2IxDT3T0ZKj0s1a+
	4eBMbW8vNcD8/KMeTkLzjj9p6ybPp9v+OWPBi0xKWSn6DBm/+UN9/G6TzJ7CslHq2ni+wqjbpcB
	1qeQ==
X-Gm-Gg: ASbGnct8EeH6DQDAU9uRYpPd4eX2NAMpFnW7ub+JTdSbxK364Q4CIC4DhW+bY3b3k1S
	a/RNOfgblzxSBa233IX3LSg3d4ybpKdFDzT2XcQYcWyaitLdhHRuS1WrCbkjFURsSypLkZpDoZY
	dfRy/h6FGuYItTYS3jtaCJAppwj6hpK4AkSxuE/HBh4Vh0M6F7jkKy/iYWuX7c8wuUXZih3VHst
	ggF5/kAdfP5DBPX4nxgWMNSag0O0kwU+9pf43L3TnIclhgXsOzi5AEgANpnfl4Xh2A8Lz8KzGQW
	SdXF5v3DiVWBypvVjKj6dkTfaw/YkJZwXKILng401t2BOVKyhnUMunJfUa8pvkhCJJGEc3pJ2WM
	U
X-Received: by 2002:a17:90b:1b11:b0:32e:38b0:15f4 with SMTP id 98e67ed59e1d1-33b51149231mr41033723a91.7.1760503126323;
        Tue, 14 Oct 2025 21:38:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcE7BVlkZyFvP65jtmD82QS6auIKSOb6IQDfvqpkbwzRYwpRA963gMl1T170bPhVqowG+flA==
X-Received: by 2002:a17:90b:1b11:b0:32e:38b0:15f4 with SMTP id 98e67ed59e1d1-33b51149231mr41033685a91.7.1760503125868;
        Tue, 14 Oct 2025 21:38:45 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b9787af5asm705406a91.20.2025.10.14.21.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 21:38:45 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 10:08:16 +0530
Subject: [PATCH v16 01/14] power: reset: reboot-mode: Synchronize list
 traversal
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-arm-psci-system_reset2-vendor-reboots-v16-1-b98aedaa23ee@oss.qualcomm.com>
References: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
In-Reply-To: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
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
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760503106; l=5404;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=+LF5Rl/5f5znpMQv1GLZ4NG0dpObtQwZ7SckbxZ5OJg=;
 b=snPD9SWri/7WPNXnr/mfAI9TPr8Ul7090wSZuFr3hvCeRxC1BaCSscVG7MMy7xWGZC8yUHPFg
 KTwa+VD6tfIBELEX0z/Ht6VTERYuhSEoPgGHb0yolprbsmJR9+HFeeX
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: PL-IhU3L5ygQb5kajHwsWTysbCCxesjs
X-Proofpoint-ORIG-GUID: PL-IhU3L5ygQb5kajHwsWTysbCCxesjs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfXyWKDAg90ulV8
 XpaMTr81KJNwTEAguPnLfk8t5mhjzCGMrHD9/fyBxhgNPR7cxFhrjhv1gB/P+PJkPHaISfUudrW
 oJUny+4LGS/blgtnXGAithFckr8iwJYboCqirtKZlsdLTL9i0o6I4tYmVh5mLy6xhr32TapLLGi
 3sm2Ry8NL3aBsnWw/50CFCAx+4FAxsyLOs2RWbfFN6uRzLb+7IgiKSdPPQpx5zDci8n2eeaKV/h
 ++Bt9UwRQq1IbZ2eXsYcHUXy015Ez7/MsVDUHyOaQgp3Vf7ZG6qR5norTl6dBSZyHIfQ0o7rH9T
 OG/UHiuDQ5Mf66xq0Y7sPMg6SUfe/rPn2/pj11iGN/fQ617CaqHQiZwczAJNydeuHMN2xeCtA+j
 LvQjRZFUMf3ZM/i1/IQPh7SmBJkwgg==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68ef2557 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=gP18aZtcJwKeVuiPoooA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_213848_745988_3BCBA3B8 
X-CRM114-Status: GOOD (  20.24  )
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

Fixes: 4fcd504edbf7 ("power: reset: add reboot mode driver")
Fixes: ca3d2ea52314 ("power: reset: reboot-mode: better compatibility with DT (replace ' ,/')")

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/reboot-mode.c | 96 +++++++++++++++++++++------------------
 include/linux/reboot-mode.h       |  4 ++
 2 files changed, 57 insertions(+), 43 deletions(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index fba53f638da04655e756b5f8b7d2d666d1379535..8fc3e14638ea757c8dc3808c240ff569cbd74786 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -29,9 +29,11 @@ static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
 	if (!cmd)
 		cmd = normal;
 
-	list_for_each_entry(info, &reboot->head, list)
-		if (!strcmp(info->mode, cmd))
-			return info->magic;
+	scoped_guard(mutex, &reboot->rb_lock) {
+		list_for_each_entry(info, &reboot->head, list)
+			if (!strcmp(info->mode, cmd))
+				return info->magic;
+	}
 
 	/* try to match again, replacing characters impossible in DT */
 	if (strscpy(cmd_, cmd, sizeof(cmd_)) == -E2BIG)
@@ -41,9 +43,11 @@ static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
 	strreplace(cmd_, ',', '-');
 	strreplace(cmd_, '/', '-');
 
-	list_for_each_entry(info, &reboot->head, list)
-		if (!strcmp(info->mode, cmd_))
-			return info->magic;
+	scoped_guard(mutex, &reboot->rb_lock) {
+		list_for_each_entry(info, &reboot->head, list)
+			if (!strcmp(info->mode, cmd_))
+				return info->magic;
+	}
 
 	return 0;
 }
@@ -78,46 +82,50 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 
 	INIT_LIST_HEAD(&reboot->head);
 
-	for_each_property_of_node(np, prop) {
-		if (strncmp(prop->name, PREFIX, len))
-			continue;
-
-		info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
-		if (!info) {
-			ret = -ENOMEM;
-			goto error;
-		}
-
-		if (of_property_read_u32(np, prop->name, &info->magic)) {
-			dev_err(reboot->dev, "reboot mode %s without magic number\n",
-				info->mode);
-			devm_kfree(reboot->dev, info);
-			continue;
-		}
-
-		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
-		if (!info->mode) {
-			ret =  -ENOMEM;
-			goto error;
-		} else if (info->mode[0] == '\0') {
-			kfree_const(info->mode);
-			ret = -EINVAL;
-			dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
-				prop->name);
-			goto error;
+	mutex_init(&reboot->rb_lock);
+
+	scoped_guard(mutex, &reboot->rb_lock) {
+		for_each_property_of_node(np, prop) {
+			if (strncmp(prop->name, PREFIX, len))
+				continue;
+
+			info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
+			if (!info) {
+				ret = -ENOMEM;
+				goto error;
+			}
+
+			if (of_property_read_u32(np, prop->name, &info->magic)) {
+				dev_err(reboot->dev, "reboot mode %s without magic number\n",
+					info->mode);
+				devm_kfree(reboot->dev, info);
+				continue;
+			}
+
+			info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
+			if (!info->mode) {
+				ret =  -ENOMEM;
+				goto error;
+			} else if (info->mode[0] == '\0') {
+				kfree_const(info->mode);
+				ret = -EINVAL;
+				dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
+					prop->name);
+				goto error;
+			}
+
+			list_add_tail(&info->list, &reboot->head);
 		}
 
-		list_add_tail(&info->list, &reboot->head);
-	}
-
-	reboot->reboot_notifier.notifier_call = reboot_mode_notify;
-	register_reboot_notifier(&reboot->reboot_notifier);
+		reboot->reboot_notifier.notifier_call = reboot_mode_notify;
+		register_reboot_notifier(&reboot->reboot_notifier);
 
-	return 0;
+		return 0;
 
 error:
-	list_for_each_entry(info, &reboot->head, list)
-		kfree_const(info->mode);
+		list_for_each_entry(info, &reboot->head, list)
+			kfree_const(info->mode);
+	}
 
 	return ret;
 }
@@ -133,8 +141,10 @@ int reboot_mode_unregister(struct reboot_mode_driver *reboot)
 
 	unregister_reboot_notifier(&reboot->reboot_notifier);
 
-	list_for_each_entry(info, &reboot->head, list)
-		kfree_const(info->mode);
+	scoped_guard(mutex, &reboot->rb_lock) {
+		list_for_each_entry(info, &reboot->head, list)
+			kfree_const(info->mode);
+	}
 
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


