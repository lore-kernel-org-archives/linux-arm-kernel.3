Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C6ECA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 16:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FDqwUezYGa9CZCaFbdXED7PEdoZ055Cwe3xHxx1ns7M=; b=Pl94G9BamvP02s/nQDxGoOAlLw
	qAYktdhETCOLHiY8s4HgCR3pGGPnYTpL+/PwucaaTe638Csl/BMhXqWiH8w6b/9N5imxad+kSZDCx
	NJaY/xnNvViPA+fXbzi5pqb/+iWrtsq8Df/ZpVXl/mieAQ4lAEHQRLXxGVMfq3GPnn41uBMmQ6TCQ
	iyBJbc7Z4qoIuzorzbuNfeDf1cWEqC3p44KuR7VvXdp/HtHbH+MkawAIC88UOta5DA4hPh28eZk6S
	h+lPStd+x06a07MVaadjKqMXotbHvJRlSz76UMzmWxKNcGoMiOv3Xlr3ggOubQiVIVR2v6YBLitcY
	ua2p1Okw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umxBf-00000002xiq-2HZz;
	Fri, 15 Aug 2025 16:21:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umvXy-00000002ji2-3fsP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 14:36:47 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEIkLg019986
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 14:36:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FDqwUezYGa9CZCaFbdXED7PEdoZ055Cwe3xHxx1ns7M=; b=bMHDQ+feRetjFTrc
	m5JlDNqAhot64rJRTsRRmgf7cf42kyAgR1V+l7Y5D0ECygAxX4/yeec64BsqKnlY
	YbDiwkw7JnoKjaykTWPb4/xiIxDtwRWb7v3OmOOG6xxAbQZBxLLAd+vdmrfjKd58
	BcfrdO21VrJvSfRqBiGzNHKrs30CIfgpmwi82btpa+9v4qyVrNIWuivMx/TBmhVD
	upp0jI3exh1jVPrg5Kj+c9k32yJPhbZienJxS+Oi9N/hKcYwSan3SSZnHvcpAuFN
	sCUpMqtH5WUAFL4CVbXZYrIqQulAhHSOkM4WvjmhhspFX+4NmbY91pUpcVOoE+Wp
	5VqMzQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3gk6mb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 14:36:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-323267c0292so1940573a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 07:36:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755268605; x=1755873405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDqwUezYGa9CZCaFbdXED7PEdoZ055Cwe3xHxx1ns7M=;
        b=TLi1RUSdbHOUhdAoQnlwdXlGZBF65MmE340o8Kh1/QlP0bvpRegLl0Y9Flix7VVjyP
         2ZTnqSRs5U3jQLdSHhz5oFvRpYcr2G36jo6Q3V2TIHn0NDhf6tZorSpttaP9worYE2/e
         qiKMlux725d+nfqWpI7S2L5w3wTsrnGk4j+FUSAfGy5aS9otx2MYhMFeQq0cq8psuAch
         tVwZlbAtWqDLhw3HzqzI+39ljsb1++2CI6xYStx1mWLxO+SGCGQyjRyxMbkjGrvQ9e5y
         rbIrf4ghzLSNFHtyJ/gmNl6dpgC3Pmch60cUMmcdctXHAIsRIdwuN0Ju5o+Ez/lGd9yj
         Xmqw==
X-Forwarded-Encrypted: i=1; AJvYcCUHymg9BCcGrqiJn1GkM97V/TkMLrURkLjoGpp6RqvDvcbBKVfqvi3pqP3auif2B6eDiq+q7osko8L0pzh2wuyi@lists.infradead.org
X-Gm-Message-State: AOJu0YxMTeGyKmaUjRYeGWj+eJsXC5RoFD787EnoNV6aopPMkgslkwyX
	0WPk31aiiDSRQHt0f0TIVT6vCWVbszfHSgnHKyvPbodz6XMAvhAb0NQ0u7AEf5bCCpUosMiRG/s
	7CUNnDbcTk0UtEEbp/FQzMGgwxt9dzE5VWsp8TgkhhRUPneBRFC0+/+F1iB35wcSyZIjafsWcGl
	60aQ==
X-Gm-Gg: ASbGncsV5/El/qWFYjhLJCWx6mcvAhxYD4+g38Jd4iQnns+vY8XX2VzGWs+ZTxRWYbP
	X32ZCpPKgznvrHEIMws5TEwbl0xqnBo1Fyw805X4GrZB6dRQerifAaZOD9j38hI+O2DRR2iupfz
	/9K5j7QTtjLwhrSZB+0tOVRnQQavUUI2YhPx1akgVNhKqt0EFdss+q+5A9GZjitbdWzsLlT+eNx
	JXxciDdZf9EHq0PaKQOobiau4ervWIk1nE6QbSIVwQHg4wfHxeDb6wZfn9xrGaGr/Te8ek62lNa
	fD9d+1RXJwPV7krakl6+V+VjRZiG3Z9F8T7oNNHhn0RKJG2tIczVfvc43kN1G2ThLkYOWvLSM95
	v
X-Received: by 2002:a17:90b:2dd0:b0:31e:f351:bfec with SMTP id 98e67ed59e1d1-32341e5e0a4mr4204551a91.0.1755268605449;
        Fri, 15 Aug 2025 07:36:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqZ62D0ilw5h3pOxyKsD9atT57r02HUkM9y580UM4/h+lMlRwpO5+zb86tLI7CTdiz0ij7TA==
X-Received: by 2002:a17:90b:2dd0:b0:31e:f351:bfec with SMTP id 98e67ed59e1d1-32341e5e0a4mr4204499a91.0.1755268604960;
        Fri, 15 Aug 2025 07:36:44 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d73619fsm1437576a12.39.2025.08.15.07.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 07:36:44 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 20:05:07 +0530
Subject: [PATCH v14 02/10] power: reset: reboot-mode: Add device tree
 node-based registration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-arm-psci-system_reset2-vendor-reboots-v14-2-37d29f59ac9a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755268580; l=4877;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=BzWfToJE3ECxETuJZ3k/sBp7q/SRF/jEhj86+u2O1rk=;
 b=RYuLdurTXlXjQtCHE5nX18yZK2e4lWHzqk3OBDVjfSP6IPXK9bBT/5bHpFJuKNoKQTKctA3aE
 EXCLcCs1FcgDo9wc3NWVVqzdZmL2XVhAsx81HO1e1vIlJH9mOiOFdu7
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=689f45fe cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=IcmTHOqSNbDvJ54L4SUA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfXwf07EzrUqOTf
 GdfU1ZuzkkbXRIvp+bEkrg7HPfq9AaLJE1f2czy1xfi53S470eTEzguCwiJ24kKWYIgfQPEmQBF
 sRvchdXL1unB5g82YuKtXY8iriZmFwd4ywIxQcAdZ917xIpssu2Ie/ugNvN/KY047e4wCIb57HB
 lcHbTsZsr4qOWylLhdcMbvBjbADKNKg1lwsIpkvw/hEkDm/90QI8ZwqWrIMnwn2Q5cQf5FIb4X1
 VR1VAR3n/o8OEv0adIMmPKNjw6UGmCMTfDJr5E07GZtWT1MOW6at4hWQHRizyOndqwSRmOuGxR4
 +mpfKXBddsQdhyMl1r/KV3qMHlwvFRdaeBxIYP025pmdS7hib8+5KYXnAq3Ke8X7a06iXKpBDLS
 yDSHQlND
X-Proofpoint-GUID: iF3dfPDuUKLtvqnsluQJmhr9qPSPMBlO
X-Proofpoint-ORIG-GUID: iF3dfPDuUKLtvqnsluQJmhr9qPSPMBlO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_073646_925016_39489B31 
X-CRM114-Status: GOOD (  22.65  )
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

The reboot-mode driver does not have a strict requirement for
device-based registration. It primarily uses the device's of_node
to read mode-<cmd> properties and the device pointer for logging.

Remove the dependency on struct device and introduce support for
Device Tree (DT) node-based registration. This enables drivers
that are not associated with a struct device to leverage the
reboot-mode framework.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/reboot-mode.c | 37 ++++++++++++++++++++++++++-----------
 include/linux/reboot-mode.h       |  2 +-
 2 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index 42bb99128ed3846d4bff62416dc31135ddeaeb90..9bb97bcd33cd3d58c75c791e9b568024e810e5b0 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -3,13 +3,17 @@
  * Copyright (c) 2016, Fuzhou Rockchip Electronics Co., Ltd
  */
 
+#define pr_fmt(fmt)	"reboot-mode: " fmt
+
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/list.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/reboot.h>
 #include <linux/reboot-mode.h>
+#include <linux/slab.h>
 
 #define PREFIX "mode-"
 
@@ -75,17 +79,21 @@ static int reboot_mode_notify(struct notifier_block *this,
 /**
  * reboot_mode_register - register a reboot mode driver
  * @reboot: reboot mode driver
+ * @np: Pointer to device tree node
  *
  * Returns: 0 on success or a negative error code on failure.
  */
-int reboot_mode_register(struct reboot_mode_driver *reboot)
+int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *np)
 {
 	struct mode_info *info;
+	struct mode_info *next;
 	struct property *prop;
-	struct device_node *np = reboot->dev->of_node;
 	size_t len = strlen(PREFIX);
 	int ret;
 
+	if (!np)
+		return -EINVAL;
+
 	INIT_LIST_HEAD(&reboot->head);
 	mutex_init(&reboot->rb_lock);
 
@@ -94,28 +102,28 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 		if (strncmp(prop->name, PREFIX, len))
 			continue;
 
-		info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
+		info = kzalloc(sizeof(*info), GFP_KERNEL);
 		if (!info) {
 			ret = -ENOMEM;
 			goto error;
 		}
 
 		if (of_property_read_u32(np, prop->name, &info->magic)) {
-			dev_err(reboot->dev, "reboot mode %s without magic number\n",
-				info->mode);
-			devm_kfree(reboot->dev, info);
+			pr_err("reboot mode %s without magic number\n", info->mode);
+			kfree(info);
 			continue;
 		}
 
 		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
 		if (!info->mode) {
 			ret =  -ENOMEM;
+			kfree(info);
 			goto error;
 		} else if (info->mode[0] == '\0') {
 			kfree_const(info->mode);
+			kfree(info);
 			ret = -EINVAL;
-			dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
-				prop->name);
+			pr_err("invalid mode name(%s): too short!\n", prop->name);
 			goto error;
 		}
 
@@ -129,8 +137,11 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	return 0;
 
 error:
-	list_for_each_entry(info, &reboot->head, list)
+	list_for_each_entry_safe(info, next, &reboot->head, list) {
+		list_del(&info->list);
 		kfree_const(info->mode);
+		kfree(info);
+	}
 
 	mutex_unlock(&reboot->rb_lock);
 	return ret;
@@ -144,12 +155,16 @@ EXPORT_SYMBOL_GPL(reboot_mode_register);
 int reboot_mode_unregister(struct reboot_mode_driver *reboot)
 {
 	struct mode_info *info;
+	struct mode_info *next;
 
 	unregister_reboot_notifier(&reboot->reboot_notifier);
 
 	mutex_lock(&reboot->rb_lock);
-	list_for_each_entry(info, &reboot->head, list)
+	list_for_each_entry_safe(info, next, &reboot->head, list) {
+		list_del(&info->list);
 		kfree_const(info->mode);
+		kfree(info);
+	}
 	mutex_unlock(&reboot->rb_lock);
 
 	return 0;
@@ -178,7 +193,7 @@ int devm_reboot_mode_register(struct device *dev,
 	if (!dr)
 		return -ENOMEM;
 
-	rc = reboot_mode_register(reboot);
+	rc = reboot_mode_register(reboot, reboot->dev->of_node);
 	if (rc) {
 		devres_free(dr);
 		return rc;
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index b73f80708197677db8dc2e43affc519782b7146e..98f68f95c9e8460be23282c51ef7fcbed73887bd 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -13,7 +13,7 @@ struct reboot_mode_driver {
 	struct mutex rb_lock;
 };
 
-int reboot_mode_register(struct reboot_mode_driver *reboot);
+int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *np);
 int reboot_mode_unregister(struct reboot_mode_driver *reboot);
 int devm_reboot_mode_register(struct device *dev,
 			      struct reboot_mode_driver *reboot);

-- 
2.34.1


