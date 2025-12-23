Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4625CE6FE24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 17:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ATmBcvdi0ZM8QoG3QXHD/flqNJmgCDsENr6fJV3JS3U=; b=eXQcYfVV/kglf9Ftn79PBiT/uq
	s18UjsZxZXSql9Hpg6ClMOT6QTgo/5fZpTR43y2v1yPhqkfnsvSWMAb3VVWbcgVFqhLCrvg60jN/q
	V7ykDmKtDdVJi3YZhzN9/aW+OfAgnO6mcBAOVT9G0y7qqQPxH6oANx4eW7y1a8qCFM5Inwqav3RPS
	S6HqQn5ss1iWcW52Eu27aFFV1rxUnsQwvYnGn2nTC195/Z8BmIFfy25eEbgFRR0PuHvXYWGWsJmkE
	bI1qyKC3TFwZvbPSg/4axgA4ecSMaL6YY3bum8BoHJNcoh1DTnaLsMFh9gbowF+Ay0B7/mcYjAnoK
	PuQ16EGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY5rw-0000000FnLf-0ynE;
	Tue, 23 Dec 2025 17:08:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY5rt-0000000FnKz-20bY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 17:08:18 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNFOmGH024545
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 17:08:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ATmBcvdi0ZM8QoG3QXHD/flqNJmgCDsENr6fJV3JS3U=; b=HH9NnO8mW92oPOiM
	fQyYZmS/UYALFDf62pRwRkp/yXzyI4p9u4LraYVQktx1jq2Z7JY/nvTyXWBZ8N8T
	f0l/M3yByd4M6RSFar2vUtHZmC1ZDMPRmLk4xTjVygZW951NE77tXHz1cjFeG99X
	6I0yBE9tzuRjPjxujiT6u/NZMDe1+ft1CHEscs0SXP64n3YVbPCktZzvOADaEeeN
	zrBrew/Z6HDV4CyomtSjP1+aDB8GEBQPoO/drAHKeoyc3Dtd2j7RJq7YSPecpxjc
	7nX7ZGk/bSIe+seEYrI7Y0fVqNxG5obXFXxR1rmd7mMBE9xLFumqlblW9pIb0KGQ
	7Lfm5Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cuhbe9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 17:08:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f13989cd3so157815225ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 09:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766509696; x=1767114496; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ATmBcvdi0ZM8QoG3QXHD/flqNJmgCDsENr6fJV3JS3U=;
        b=My75buQiwyL4gBpvN/EQw6pwKpckv1w8Q+NDb2p5Vo4uAvO5n//LQfnsqUUHDUWS4v
         GjT/+O2df5N/5I/n9ZwYqDMIjcTOlc0ZdmwucMG6Rn4Ww3GicaAam47iWazdmaXOoIq2
         0ihMFufUk3PQQqfGfUIXXabzGUHyZ1Y4OILQzQOkJXLb0KEZ4rmIB9nTG5HBSSVDqCLU
         Xygm41gFsHEF/Exr0c3hDgXuXXLaN+kYbPTMJNJSeJyv5Q99ryvQWa2dTpfGON8W6Qyj
         sn956yjuDNfGwsT6x2gq5fUdZHuKOe8/ObFMVWJ7CvNcmzpdBwQAtxaR2UZQqhnPl1yj
         Y6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766509696; x=1767114496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ATmBcvdi0ZM8QoG3QXHD/flqNJmgCDsENr6fJV3JS3U=;
        b=u4vWCv2aev7IkqMLE392pSfZRPGCHVJDKgM07Fo9JqWkPO1uP2quzLj307RDRK6Vzx
         wgm5W7unBNJRdIewYPTVGZefS8ivXVDeA39AIS1NRjwr1BQGEpfg/jEoYxVTtjRbvAFR
         3XVLZ8JvVHS3n7ixbgNxypBpBPNVL1J5OpWwv2rRoBMnzv9EgTkVkmQdo47zH1IPgOBk
         O8vuGq/6TXIDODnWkEXlBWh3FwuWJEfvVNqeWVmcHKQT4hosXl2LCBrL6t1uYYO2Ms4b
         BBfTAfViJQEol8Bun+GXmyWREr1WH4ErHVRLU02w6jewIt+cK3Fo8Xl5xSifdXzWQsFv
         dcYg==
X-Forwarded-Encrypted: i=1; AJvYcCVMJ98fIoM6rV/1GyXrPG8k0ZmPh438tQQ7HXNAd80nH8DXpRDfxv7JJCArh9d9Q5XhfvrwTCA7MalT9iQDxOnT@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx39PQSQaNlku8cXEAmZEl8YwH6CUmJF5C20At7vJ0v7Csampk
	HCY9irbtrS0HNxLfYsdIAP+L9GX2H8TXPFKSjNgf4fOCCw9ZqwVMKTsZiu5OG6+S/di/+PTbSV0
	OvSWDJtkNonsLvkXevbt5RrB1WXJq5f5GujL3jh3C8I00GXwzAs30CR09st22d2GpWRVG6wvBYW
	LGow==
X-Gm-Gg: AY/fxX4NvFH5/VDH0pg0zKoMa6tILcz6fqRDbtrwiG8UX4EJpVAr8a1/QNHvfqOFtrk
	ur5JxlQGA8qpjxD4e/NbV8LQPjhS0P5bP4JJh30HwYo6d6td7lMk5IVjdxUb4TyqMzvxcMvZzWZ
	Wft2+m5IQgv8lirEVwMa8AQiktzT/ismxJTsjuVBHqEQPzHSdQo34zxi6o6SOjYSqP0rCHwS1a4
	vPlmptGFVvfGTrB9cqwgMPMHZhm8448Ic/ubUkDCYtb+AroEmIQezEOHMR36MBbADVyzhfxteUq
	08dyRFeZM+xiBm7pLgKuxoiVTHqbiZ41/aYB8ZmmlwJjO+GkJdaO0HNKpS2TF9obUOzPjq2Q/lJ
	b4zVy3676QbMhmX+WkaWtSYfXAeNHfhdOk/aBn7u9rLvjLQ==
X-Received: by 2002:a17:903:22d2:b0:2a0:de4f:c96 with SMTP id d9443c01a7336-2a2f22290bfmr155876145ad.18.1766509695878;
        Tue, 23 Dec 2025 09:08:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGLK98y9AUy+4JNxavuFk4mRdGfVbrYe9HdiVU9bqvyrNEVl99KZev10YEXapHKTBkUt9/3bw==
X-Received: by 2002:a17:903:22d2:b0:2a0:de4f:c96 with SMTP id d9443c01a7336-2a2f22290bfmr155875775ad.18.1766509695401;
        Tue, 23 Dec 2025 09:08:15 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5d863sm130019325ad.80.2025.12.23.09.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 09:08:15 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 22:37:34 +0530
Subject: [PATCH v18 03/10] power: reset: reboot-mode: Add support for
 predefined reboot modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-arm-psci-system_reset2-vendor-reboots-v18-3-32fa9e76efc3@oss.qualcomm.com>
References: <20251223-arm-psci-system_reset2-vendor-reboots-v18-0-32fa9e76efc3@oss.qualcomm.com>
In-Reply-To: <20251223-arm-psci-system_reset2-vendor-reboots-v18-0-32fa9e76efc3@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766509672; l=5544;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=EwcxR/RujuDEpRybikjE1BbpDVQI9UxyV0ysyUeOLxE=;
 b=k0L6kc/W6ljfBJPxAe+iBCBIK2dumAtN+LIGDVzfVBr87lfwWKHECVyHSAazU5HMEKCsxDTqJ
 8W2Eiwi72HnB2I0oUhcB8wVNTPjEOpMwbzeoBYJv0zY0ko6WlRNP0Vb
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: PyhngyrYitDrEkLRqGDeQxvcXehbsDEA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE0MiBTYWx0ZWRfXzNIlQdVINz4E
 KpDKB+tWCPCYbX4ZbIiQ/G6SiINKSfUxptM9NdKw+0/mIkH0VOYmkV+7Ut6TtbtOSejHvMeITES
 Xg7G35FEfy9Djm4O6ZWNhieRegyT/bMoywI8Ry0j0bIjFZ3BSURV/y5fNQ/eUFLpKmrzFc/CWQk
 q7o0p6ack/k9UHd+7mgPGOyzXXB0arcOIi/mVM1d48uPFwrhUjyjNR9vTLorLizrie4wP4J5kVg
 ZVGGx0yoLN5wnvz+TzsxjRrQ3O2Zfq/FFkhgQIABBC+O1IKD+q2vUbaaCafdXV+rw77xCxkwC7l
 6SaymmndKziCvg9Eztv477+0afgc20LpgeGJG7hjt7dnNUvdWFBKq0pHqd+g1I9NbDUCATp3ptf
 Dl/ZGN7viduP20WappgCi3PJgz4v2LhLwSMx0aMbM/oTETMbStqYvCil2bdIvsJqe6gqc8GNlX7
 51h8+sWa2zQZKHc+Tmg==
X-Proofpoint-GUID: PyhngyrYitDrEkLRqGDeQxvcXehbsDEA
X-Authority-Analysis: v=2.4 cv=NZDrFmD4 c=1 sm=1 tr=0 ts=694acc80 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=UVh4EkS4hOj72C4E1asA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_090817_531248_305ECC25 
X-CRM114-Status: GOOD (  23.19  )
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

reboot-mode based drivers can define a reboot-mode by adding it under
the reboot-mode node in device tree. This limits such drivers, to define
any predefined reboot-modes statically within the driver and creates a
dependency on device-tree.

Introduce a list for predefined modes in the reboot-mode framework and
process the predefined reboot-modes along with the device-tree defined
reboot-modes. Modify existing reboot-mode based drivers to initialize
the predefined list-head as empty.

This patch enables a reboot mode driver to define reboot-modes through a
predefined static list, in addition to the device-tree based reboot-modes.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/nvmem-reboot-mode.c  |  1 +
 drivers/power/reset/qcom-pon.c           |  1 +
 drivers/power/reset/reboot-mode.c        | 28 ++++++++++++++++++++++------
 drivers/power/reset/syscon-reboot-mode.c |  1 +
 include/linux/reboot-mode.h              |  9 +++++++++
 5 files changed, 34 insertions(+), 6 deletions(-)

diff --git a/drivers/power/reset/nvmem-reboot-mode.c b/drivers/power/reset/nvmem-reboot-mode.c
index b3d21d39b0f732254c40103db1b51fb7045ce344..b02a2af31aac52cb0ab19cf5d4d315d17c208f6e 100644
--- a/drivers/power/reset/nvmem-reboot-mode.c
+++ b/drivers/power/reset/nvmem-reboot-mode.c
@@ -44,6 +44,7 @@ static int nvmem_reboot_mode_probe(struct platform_device *pdev)
 
 	nvmem_rbm->reboot.dev = &pdev->dev;
 	nvmem_rbm->reboot.write = nvmem_reboot_mode_write;
+	INIT_LIST_HEAD(&nvmem_rbm->reboot.predefined_modes);
 
 	nvmem_rbm->cell = devm_nvmem_cell_get(&pdev->dev, "reboot-mode");
 	if (IS_ERR(nvmem_rbm->cell)) {
diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
index ccce1673b2ec47d02524edd44811d4f528c243e8..bf7b9f0bcdcc4c168aa7ff8d6494122d898814b5 100644
--- a/drivers/power/reset/qcom-pon.c
+++ b/drivers/power/reset/qcom-pon.c
@@ -75,6 +75,7 @@ static int qcom_pon_probe(struct platform_device *pdev)
 		pon->reboot_mode.dev = &pdev->dev;
 		pon->reason_shift = reason_shift;
 		pon->reboot_mode.write = qcom_pon_reboot_mode_write;
+		INIT_LIST_HEAD(&pon->reboot_mode.predefined_modes);
 		error = devm_reboot_mode_register(&pdev->dev, &pon->reboot_mode);
 		if (error) {
 			dev_err(&pdev->dev, "can't register reboot mode\n");
diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index 54adcda57e44edf2fd2cda0f752226f747aa72d7..c17c61f47f069b96a9b38699de71dc1f30a807c5 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -15,12 +15,6 @@
 
 #define PREFIX "mode-"
 
-struct mode_info {
-	const char *mode;
-	u64 magic;
-	struct list_head list;
-};
-
 static u64 get_reboot_mode_magic(struct reboot_mode_driver *reboot, const char *cmd)
 {
 	const char *normal = "normal";
@@ -71,6 +65,7 @@ static int reboot_mode_notify(struct notifier_block *this,
  */
 int reboot_mode_register(struct reboot_mode_driver *reboot)
 {
+	struct mode_info *info_predef;
 	struct mode_info *info;
 	struct mode_info *next;
 	struct property *prop;
@@ -82,6 +77,9 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 
 	INIT_LIST_HEAD(&reboot->head);
 
+	if (!np)
+		goto predefined_modes;
+
 	for_each_property_of_node(np, prop) {
 		if (strncmp(prop->name, PREFIX, len))
 			continue;
@@ -123,6 +121,24 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 		list_add_tail(&info->list, &reboot->head);
 	}
 
+predefined_modes:
+	list_for_each_entry(info_predef, &reboot->predefined_modes, list) {
+		info = kzalloc(sizeof(*info), GFP_KERNEL);
+		if (!info) {
+			ret = -ENOMEM;
+			goto error;
+		}
+
+		info->mode = kstrdup_const(info_predef->mode, GFP_KERNEL);
+		if (!info->mode) {
+			ret = -ENOMEM;
+			goto error;
+		}
+
+		info->magic = info_predef->magic;
+		list_add_tail(&info->list, &reboot->head);
+	}
+
 	reboot->reboot_notifier.notifier_call = reboot_mode_notify;
 	register_reboot_notifier(&reboot->reboot_notifier);
 
diff --git a/drivers/power/reset/syscon-reboot-mode.c b/drivers/power/reset/syscon-reboot-mode.c
index eb7fc5b7d6a7ed8a833d4920991c4c40b5b13ca7..74e2e14c5d87c54ac24ef63c7905b3266d736439 100644
--- a/drivers/power/reset/syscon-reboot-mode.c
+++ b/drivers/power/reset/syscon-reboot-mode.c
@@ -50,6 +50,7 @@ static int syscon_reboot_mode_probe(struct platform_device *pdev)
 	syscon_rbm->reboot.dev = &pdev->dev;
 	syscon_rbm->reboot.write = syscon_reboot_mode_write;
 	syscon_rbm->mask = 0xffffffff;
+	INIT_LIST_HEAD(&syscon_rbm->reboot.predefined_modes);
 
 	syscon_rbm->map = syscon_node_to_regmap(pdev->dev.parent->of_node);
 	if (IS_ERR(syscon_rbm->map))
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index a359dc0c6dede0ac5ce67190a00d46a7e7856707..bddec9b7f94187dcb056540df79eea34c25b1d0d 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -4,11 +4,20 @@
 
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/reboot.h>
 #include <linux/types.h>
 
+struct mode_info {
+	const char *mode;
+	u64 magic;
+	struct list_head list;
+};
+
 struct reboot_mode_driver {
 	struct device *dev;
 	struct list_head head;
+	/* List of predefined reboot-modes, a reboot-mode-driver may populate. */
+	struct list_head predefined_modes;
 	int (*write)(struct reboot_mode_driver *reboot, u64 magic);
 	struct notifier_block reboot_notifier;
 };

-- 
2.34.1


