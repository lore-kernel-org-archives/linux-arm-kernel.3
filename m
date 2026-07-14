Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33A1C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 17:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AE7EF/yIi6dKqkIKGLCajNYTAH086MLgb/mh4Ejjrpk=; b=j+ObFNmSdwIBv4iHCb/KUw+y0t
	t1RuAKDDy6eR5q2bOhOPnCJA+F7BXqpXjxt8ZG8CIzhXWSWG4Ml9+U65DL13znUW1LZv11VY1FJQ4
	WkkisDAFCS+Xq/LfUi2QbHr0DY52Tce6uenbVLTZSYF8uZrBLIy+aX8Zuqxyd7/LNwegDvEVwjT34
	NagvLRVg30tu+H/mWE3UGEkqa4FlETgy1AwgBNEGVcbzAfb86fzqganFq4GuhW3hOIXJfY/01P/Gy
	WT/8wvWasWk27ywn8kAonQlA6G5dmT8hUjGMwwa8CmWsd2VjiYdieWRBVnXo+ORgFlB6Idjnwx+rG
	IZi5v3fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjglw-0000000Ck8B-1o8p;
	Tue, 14 Jul 2026 17:18:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjglt-0000000Ck6T-48mg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 17:18:19 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG6rop1003200
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 17:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AE7EF/yIi6dKqkIKGLCajNYTAH086MLgb/mh4Ejjrpk=; b=k6xBjTjjlCMFY+Eo
	3CjKPlAA3V0CWRFA3KF4IASSJ8C7Pz8GwNYnuoHyOk3kdGLwleJ3haABo7c8+H4D
	QnSfJNgDRtn/p9n0l0ZTMGVZ8eZ5HtARQwnnagmgX5xxwt6cD4Oql6LzFYb4caoq
	b3YaHlfRUUCt2d60seda6PPS9/tQbhfGQ6I2jND6A21umB2pZTegMv45orFEe4oi
	tXgpyK+v9fukW0o2On8ZXbsqPAnwHDXjolG7pDmso7eRMEOCGYDT7RcnuGUVscZ7
	q6T8Utl4V4Lk7Pug1zbUWhF/U98DdK50p8q8Jpb8wCybm15H7GLk1K0+0e37e7VH
	vxSBIg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnr13jb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 17:18:16 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8488ac68185so7058168b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 10:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784049496; x=1784654296; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AE7EF/yIi6dKqkIKGLCajNYTAH086MLgb/mh4Ejjrpk=;
        b=McXvPHPea4LW/mSbSZnE2amn11rGUdHQOBYh2HAc1RwLovtoM+bm9IkK7sJdfaS8w2
         1j2ZpfMUSO5yuZWTlPF0gUZhnqfivCJQCpXwC12FOygsHKRB2ZbPsrvOCk5Alf42o4YI
         IwNs+SLpYn09ctaVMdtLkr6/Gd2R9Ol3I5BX7EzTdFdNFGfeMtWz3eqyrUURfL39Q2MQ
         gurqr7UoyANYQ6jXrftoYLEKvVZGkIGSjc87C8b4TIiV5cDcbqZmMsgh6GrexqCRBwzJ
         92CNNxgwPXII7MNHZdgrUaaRchZouL5I/UMDkYam/1fNB0YuLmgKQ9hMRnUNCXvqOc6V
         8VVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784049496; x=1784654296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AE7EF/yIi6dKqkIKGLCajNYTAH086MLgb/mh4Ejjrpk=;
        b=QDNy1qXojW+t0Fup0IKXZPFkdqEGl68GKzifr+CXfknQi13cUeDquH9KsoCVZM0q82
         mpDXIZsNWR76wkUm1RY7u+68ruHN3CLx3McxuENeauJtCu3GT5VOryylB0WR31cj4Y8R
         epZS7tBf8n3hEKeSt4xzM3rhxdKE0zQE+Vr28Sg+8svtjdeK0NzzsY9ro0D4rsroqnQj
         mtAXklYuBE6xADzzfcXV51uDejP9uedMr6O9jqzHLTuOn6CcTk5yzoWWWkaZTMPC+Bpc
         ++h3N4iHPmE6CzZWodwnz671aqSfbq5FKsQ9+ieQFM6xQf/poOqZYsEr05x9TSesJfA5
         ZhMg==
X-Forwarded-Encrypted: i=1; AHgh+RoMaX70PWgmLUgcCdU4Ebsx8t0KE1BM7B/pQMsenhYOO3xI5rmnWM9wJDCAklX3Yhl/1oDdfH3Ymb7qhqeshIlZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxIfBTue7iRmnjVLF2Ck+oL+UOqBu2kcyH1oTnRE1gcKahwVsEA
	nnLCy0f/n8/1C70YLymkd92XR1d8rKPBfz/hJ47OrYYOdmKa4rtv3HRngNAWaMlJVNTj/qXXh7J
	5AP67wfcSfwvkthePftFXWRt4nxeuqMOWsmKxG6CSUo9F59PpkVTy8kRaFONJZ+Wx/WWdX16XAv
	bE3mEqatGO2A==
X-Gm-Gg: AfdE7ckCXyVxyMDtdIlIXFxYoS8FrHfu2qV1raneyoaMwTNGMkDOWhbR96V9pMI1IQI
	kADY2/o6iwixu/k8lRrrkOxdELtdIpMOYO9qn5FhwAt9/aVuxq4/jIsF3g9yVvwDJy+PYhFlySS
	YaJrwu1PMxf0uvIAiSGz7+08zQlOAQfhcB0MkBvsUGvHe0VsbA3PdbD9UmyHIXiWQg9EYqe5Ex8
	vIIv95t1rFBbladAdf7wfBLJKWTLXp4ebVM5QIV29GUfQdmYX3v2xZ998LYqlN7ARwTwmWFVqVt
	O1NFMiGolmXR/7enc5YTNVtHgb4tCRf/+8Hvn4y8if1mgK12q0U4E6KVybkRIxiegf74zxv9Mb7
	VCB95v+q1w1Ek6/kLphmB5cXfSwwsnZmiU5Xf7Y2D4op3R7A=
X-Received: by 2002:a05:6a00:4405:b0:845:d286:1fa5 with SMTP id d2e1a72fcca58-8488974b096mr13460109b3a.52.1784049495850;
        Tue, 14 Jul 2026 10:18:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:4405:b0:845:d286:1fa5 with SMTP id d2e1a72fcca58-8488974b096mr13460058b3a.52.1784049495426;
        Tue, 14 Jul 2026 10:18:15 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a5bfcc2e5sm731773b3a.56.2026.07.14.10.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 10:18:15 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 22:46:37 +0530
Subject: [PATCH v23 09/13] mfd: psci-mfd: Add psci-reboot-mode child cell
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-arm-psci-system_reset2-vendor-reboots-v23-9-e7453c548c21@oss.qualcomm.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784049398; l=2622;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=MfoLK8M+cwJsqJMcoFtwkeKu04gSS+o06svNL8s3zdQ=;
 b=qc68dV4YEQckF6aiIfbEhwnkSEuflVjvhtpo0b0PGXV9fx3UjJfg2D23zCw4Y79QkpPBLReqM
 GuYHD88XpFyCNQDG5Cmiuv47u8F4gUERJM9WMx/92hPByxGmUSwjnIM
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfXzBfZP12sDAfO
 pKD4nf4SES51U2O1N0zv0N/G/2XnmCEJSfBmokevW+dX2X4FIQFDR+V6wBKPsrOoAKdk+v55iVd
 nGTflU7ZnPExJdx1X5pqfbgTa6R1WcA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX1XIFcnViGmUj
 lU0jcblPgPir4IF8VaFh1t4tfZEXaMILZKz1KfdLaci9X4b/AVNWe2FaV7wffWRqpo+udO/fvg+
 yaurpjeMa8DuKJFRWFjGTsHpfjeyFe9n2N7n9TCsBFYp3YH/ObnTeF+p281HLl5/IzKtxukf5m8
 m0Pvfvvl583whNd1gER8HgJCeqpuqencWjsmF1jEVw+xd974IxsUduAEneU+CkJtKpfL7C8pZ9b
 cpKvhtjqsQII0NkIRR0pQyBRS5MWOoATWz1ATLcdclqGUjls+grIit/HB/2aRrND5xcppUjMBLY
 HZECQ8ZHXWJ6587GpyXlB9pq+zmirQFFwZOk4Dxl0dMHhknTs7FVH8p+SGWDoX9SeMYPghUL0Wb
 GWPutt6YOoqjfswijPhU/7pwbu5lD3PSpx5mPIiT67e4MSEzMqFb36MHgPEo8FLFF1Uk8Tgq2Kj
 euHJj0MKq0Z2Db2tS3A==
X-Proofpoint-ORIG-GUID: 7DfdmpBfqYdTIGJCxP3A5SJg12mKA0iW
X-Authority-Analysis: v=2.4 cv=NfPWEWD4 c=1 sm=1 tr=0 ts=6a566f58 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=qQQu7YRYY0fa_xNKXW0A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 7DfdmpBfqYdTIGJCxP3A5SJg12mKA0iW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_101818_155223_275B5CE6 
X-CRM114-Status: GOOD (  23.31  )
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

The PSCI "reboot-mode" node does not define a compatible because it is a
configuration of boot-states provided by the underlying firmware. With
the new firmware-node based cells in mfd-core, this node can now be
exposed as a proper child cell.

Add the psci-reboot-mode child cell to the psci-mfd driver with a
named_fwnode. Add psci-cpuidle-domain cell first to isolate it from
reboot-mode failures.

Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/mfd/psci-mfd.c      | 30 +++++++++++++++++++++++++++++-
 drivers/power/reset/Kconfig |  2 +-
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/psci-mfd.c b/drivers/mfd/psci-mfd.c
index 7affd6bb09dd..8c6b78ac471b 100644
--- a/drivers/mfd/psci-mfd.c
+++ b/drivers/mfd/psci-mfd.c
@@ -7,6 +7,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 
 static const struct mfd_cell psci_cells[] = {
 	{
@@ -14,10 +15,37 @@ static const struct mfd_cell psci_cells[] = {
 	},
 };
 
+static const struct mfd_cell psci_reboot_mode_cell[] = {
+	{
+		.name = "psci-reboot-mode",
+		.named_fwnode = "reboot-mode",
+	},
+};
+
 static int psci_mfd_probe(struct platform_device *pdev)
 {
-	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
+	struct fwnode_handle *fwnode;
+	int ret;
+
+	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
 				   ARRAY_SIZE(psci_cells), NULL, 0, NULL);
+	if (ret)
+		return ret;
+
+	fwnode = device_get_named_child_node(&pdev->dev, "reboot-mode");
+	if (!fwnode)
+		return 0;
+
+	fwnode_handle_put(fwnode);
+
+	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
+				   psci_reboot_mode_cell,
+				   ARRAY_SIZE(psci_reboot_mode_cell),
+				   NULL, 0, NULL);
+	if (ret)
+		dev_warn(&pdev->dev, "reboot-mode child cell failed to add: %d\n", ret);
+
+	return 0;
 }
 
 static const struct of_device_id psci_mfd_of_match[] = {
diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index 93e4029d9506..b736a80eda00 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -350,7 +350,7 @@ config NVMEM_REBOOT_MODE
 
 config PSCI_REBOOT_MODE
 	bool "PSCI reboot mode driver"
-	depends on OF && (ARM_PSCI_FW || COMPILE_TEST)
+	depends on OF && ((ARM_PSCI_FW && MFD_PSCI) || COMPILE_TEST)
 	select REBOOT_MODE
 	help
 	  Say y here will enable PSCI reboot mode driver. This gets

-- 
2.34.1


