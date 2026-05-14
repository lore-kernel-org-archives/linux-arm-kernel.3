Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7687CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 14:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NTa5Z0fUDWnU+L8/u/WQyWQDpDzKW0OBql8292A1sZs=; b=K+xiq2+srKSL3+cMlJXT5QuBCf
	gHoxP4cVC1T5NHUowzhaxJZFDpVuFqJhhQN7Dbo0gIzcVw0SEMB8KIm2uhPMxuwoqDs2s9BsAkpFx
	LL3+bd5pMKEwEJt69iO65aPozD6xEj8m04+rN6eFjkBT2IZoBT2XQ60F6WIpMR+CW4e6hoxQ1DL/7
	+auNOLBYFRjLl11vqgDSi6K8J8yYD0cWTx7ZGEaYew+2d/E0+xa8LJkuBt9DfPgD9McWEtSZ+ILRN
	RF9wa/w4fs/XbPOKylE8qvAZAZ77Nph6kE/lMZEb8YM/WN4tzTJ1Xr5NayD2JAbUe2Fnx2ksRRniL
	2pmuJGTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNX2D-00000005ihl-2ovO;
	Thu, 14 May 2026 14:27:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNX2B-00000005igN-0McB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 14:27:32 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeSVA2713203
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 14:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NTa5Z0fUDWnU+L8/u/WQyWQDpDzKW0OBql8292A1sZs=; b=XlROFoIBkPohB195
	KgDer0B4WWYjFLnsTCTJVxh7rJFtEL5BmKAfz/u4PvqV7ByMa/P4na6JHCCsPN07
	CERLUxffjKbHGaotq5dWIigouKgGUJHMwI4OL4SlihaZFlZF5wSQJmQXw2t5V4Og
	/axZGT4zQfoQ1xRVfh6JpIz8mPGvAAxLpiXcSMUPnWkoZeuQpcqsqdx9bEsVWZnN
	dSN994+qOwP7w41mG731OjIcCgHEzieGSzMmnnHi1xh4p3k0tf8nnLWdFASi47cd
	hSjHNU16RvqbAWLJRs2ppdNxaHOzmUrM8CxBz4yKck/1XNZUsrwnjND7ASNVgHdK
	OzpMfg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e58v89pgs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 14:27:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2e8bba2e6so104872335ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 07:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778768850; x=1779373650; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NTa5Z0fUDWnU+L8/u/WQyWQDpDzKW0OBql8292A1sZs=;
        b=SB8kEaW3CGmVkOgAJVWO6sxoVdIPwF9FZqs8rk8kGUD9NMH2WCJ/2M2ztUU5Db/qlf
         fptJ/6cUSEzScnC9dPT3q5xw5lnOWz1ORLGFh8fb4l06Gpb8nXYd35ZGAYYI1e1Di90t
         745ECP6QjYgQXdxj69tdKjTZQYGSBU6NcVCb+XV2ib/sgbs9GQ9G28nxyCHEVaz1zAof
         hJlSZYMILYbNchIxQg4xi+WARCmWoNDoLsaZBBY26/efm+vmAKtOdc5z0QAazJjF3tSt
         J09rNyC/3bMEEe57RMDbE/i0x1oVqKgSv5THF6+3EsDyQPAAhbWQVkCWdQ6NHR/vGrrE
         H6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778768850; x=1779373650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NTa5Z0fUDWnU+L8/u/WQyWQDpDzKW0OBql8292A1sZs=;
        b=GqNeQq7R78YH+hL2un8DTVqu7C8YdpkmOS1N5VZCQ1KQypbmvgN/L8hqYKzWwErRDM
         +ofaX2EZtF5o6JH8Y183mMoxOW4B4Ulmfi7VcEtl0O+H0DuuYcmL+LDuprhMwLqxTwnF
         RU0rfLn66wmR5wPOdxkfA+LVHKn4Z5DO++OTvUcHgkrlHZWSWmqQy4EbO89F+neHbL5b
         v5SGpgU8JgVzaTVHF/IhI1d//V8Q/hnCuEXx0Y/OVdAO27GaF8V2rlgKkAmhJOIIj3zq
         t5UBPXIZ4OUE50zvlISucyXjSj4bevahtCvCeZvy9UfsvlT/1/n55in9iQ8olJvY8d70
         0fNQ==
X-Forwarded-Encrypted: i=1; AFNElJ99WAWzUs0fluM6GtkrSbymgpnHByaFmc051RH31+jpji5BKShL2zWL+S3Fo6fYEFHiUtboJkEQFp/c1OzPuyyG@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9p+VZHbPOuU9/IlhTvRVwHZOONTmJylhjxs5Kdwcm03dy9j/n
	0lwjTfO+3Zg+84jfFUB75zPvzGmjSFL/UF7keB1RLySrlsHpjlqVWz/38dugNqZPQBeKag2Pl6t
	KjxS2k0GFyPduNb5GabO3W7QAEhgQU/iuvrL4js0vx7psRyosmAUxiiJAqcUFz2X4TwjFbTcyqX
	zmcA==
X-Gm-Gg: Acq92OFieH7k2jkoEUpOGKXKPdSP0g6faRCnggL3pJPblabc2ds5Xe9FfNaOOTxPKE6
	xK1/y5ze5BPwOCVGXBoO6B51JAlY+x80UTM+tDNeLcykwxOld4GDLPrw9XcH2ntyoKgB7d9pIPH
	5vJaCBj6HVREBN1TDpv7ihnmZGn6XSnja/Oi52MHbe3QHgKLJ/Kui/gnmNhxeMGgcrqgGMalILy
	li4zAocWQ0bMZW/TSMO1OAkpYr3CYOmOMCdXLVCimz8WbDGMU/3QyZWUafdpbxrJ1HxLt94uYTi
	5+oaRpSOS9IqGmeIASjt/EB8os4ofG0u8vQygbilegdOzVzQIDRP22PjRkbHI3Xo7+Oir6tjCnE
	kCm6uTpsgU/SR5/cFvC3ohZdolSQH7yoj7mdunE81WgaiOnmU11rjAfrOMg==
X-Received: by 2002:a17:903:3d0b:b0:2b4:5aff:de60 with SMTP id d9443c01a7336-2bd276f2a6dmr95801795ad.22.1778768849471;
        Thu, 14 May 2026 07:27:29 -0700 (PDT)
X-Received: by 2002:a17:903:3d0b:b0:2b4:5aff:de60 with SMTP id d9443c01a7336-2bd276f2a6dmr95801115ad.22.1778768848834;
        Thu, 14 May 2026 07:27:28 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05ffbesm28566485ad.27.2026.05.14.07.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 07:27:28 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 14 May 2026 19:55:44 +0530
Subject: [PATCH v22 03/13] power: reset: reboot-mode: Add support for
 predefined reboot modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-arm-psci-system_reset2-vendor-reboots-v22-3-28a5bde07483@oss.qualcomm.com>
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
In-Reply-To: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
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
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778768806; l=11586;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=c0E+9Z2fyXM2CTKY2rFdNofWBhkxlwIO4amIwNdSABM=;
 b=ZX/qRQMIKdlkNUrKGzne/vk8+ntfzJi9dYdwUsB3kK1cBmW3G5xbdgok6qfqVmFISWk/uhJbl
 b85DPBsEbqiAEs1k71lUHnmEKHdU01FnndhhCnBhPyJa55ftE5krjl3
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0NiBTYWx0ZWRfX61Q2qDpNQdsC
 Xk6GuXct8JW2aQlHSO1j2vQBEsqWlo2Hna9uKyjh9UlOembmFBPE1AdroaAWFRnZTCVk5JiSkWe
 Ggww7hfKNw4mVRC97ulW07CIpLIFKTLG4XqUs24/7oMlM51HU0Q4M7iTiFU6WRZRD2rVBnhvL4B
 k+KqaA8xHrfRzAXsMyeEkjhcxhdFlUl/H715D8J/S81NromPEFIzmFpJtiqAmB0PLkSYfYbJfIW
 kigwJsjM0iTv1ZGuy5lzwCqHIbABYmnB5DEtYiDFDwIdx4CHW6Syp8kDNAlZxnqmrb5h1vPb6Cu
 xn1YFHNkSd+uSA60kaq7bGGUle+YEDT3hSvVF5H7fgExblBIm8s3y7L7Z+jSGeg2evKrUkxaHb/
 xVKUgcUEAEG6wcgrpFdtJpzMktDNb6gbNJk6DMl0Uf7Iwe/7MPyIbtvhK0+BX0qk6ztTg6QkoWL
 8wOajs5tcKI+uwp/erQ==
X-Proofpoint-GUID: onNQICyUmjxmEx72WWf8qMW2zojEf-wh
X-Authority-Analysis: v=2.4 cv=YZSNIQRf c=1 sm=1 tr=0 ts=6a05dbd2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=sGFwGsstBXFWfJrNqcQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: onNQICyUmjxmEx72WWf8qMW2zojEf-wh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_072731_145821_0F77EC1D 
X-CRM114-Status: GOOD (  24.08  )
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

Extend the reboot-mode framework to handle predefined modes alongside
those defined in device tree. Drivers can now define their own
reboot-modes and register them via the framework. A centralized init
call has been added to the reboot-mode framework and adopted by
existing drivers. This ensures driver state is initialized together
with predefined modes.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/nvmem-reboot-mode.c  |   4 +-
 drivers/power/reset/qcom-pon.c           |   4 +-
 drivers/power/reset/reboot-mode.c        | 142 ++++++++++++++++++++++++-------
 drivers/power/reset/syscon-reboot-mode.c |   4 +-
 include/linux/reboot-mode.h              |  13 +++
 5 files changed, 130 insertions(+), 37 deletions(-)

diff --git a/drivers/power/reset/nvmem-reboot-mode.c b/drivers/power/reset/nvmem-reboot-mode.c
index bd05d660490c686b43134f82f1eadd7665403d20..50e5e1ff4cd3b14f634dc50cdadd97472cf0b1d0 100644
--- a/drivers/power/reset/nvmem-reboot-mode.c
+++ b/drivers/power/reset/nvmem-reboot-mode.c
@@ -51,8 +51,8 @@ static int nvmem_reboot_mode_probe(struct platform_device *pdev)
 	if (!nvmem_rbm)
 		return -ENOMEM;
 
-	nvmem_rbm->reboot.dev = &pdev->dev;
-	nvmem_rbm->reboot.write = nvmem_reboot_mode_write;
+	reboot_mode_driver_init(&nvmem_rbm->reboot, &pdev->dev,
+				nvmem_reboot_mode_write);
 
 	nvmem_rbm->cell = devm_nvmem_cell_get(&pdev->dev, "reboot-mode");
 	if (IS_ERR(nvmem_rbm->cell)) {
diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
index 57b36e6186f80aff947fd7f5aae5ce280c65dc6b..95d6f5dd134d54783f5ab6c600d455862e3d39f1 100644
--- a/drivers/power/reset/qcom-pon.c
+++ b/drivers/power/reset/qcom-pon.c
@@ -70,9 +70,9 @@ static int qcom_pon_probe(struct platform_device *pdev)
 	reason_shift = (long)of_device_get_match_data(&pdev->dev);
 
 	if (reason_shift != NO_REASON_SHIFT) {
-		pon->reboot_mode.dev = &pdev->dev;
+		reboot_mode_driver_init(&pon->reboot_mode, &pdev->dev,
+					qcom_pon_reboot_mode_write);
 		pon->reason_shift = reason_shift;
-		pon->reboot_mode.write = qcom_pon_reboot_mode_write;
 		error = devm_reboot_mode_register(&pdev->dev, &pon->reboot_mode);
 		if (error) {
 			dev_err(&pdev->dev, "can't register reboot mode\n");
diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index f1372dc700e48043320812c3d3619ab1539e1854..d76aee524749a6ec3dff9729c2b678b7244e4f09 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -31,12 +31,12 @@ struct reboot_mode_sysfs_data {
 	struct list_head head;
 };
 
-static inline void reboot_mode_release_list(struct reboot_mode_sysfs_data *priv)
+static inline void reboot_mode_release_list(struct list_head *head)
 {
 	struct mode_info *info;
 	struct mode_info *next;
 
-	list_for_each_entry_safe(info, next, &priv->head, list) {
+	list_for_each_entry_safe(info, next, head, list) {
 		list_del(&info->list);
 		kfree_const(info->mode);
 		kfree(info);
@@ -116,6 +116,51 @@ static int reboot_mode_notify(struct notifier_block *this,
 	return NOTIFY_DONE;
 }
 
+/**
+ * reboot_mode_driver_init - Initialize reboot-mode state
+ * @reboot: reboot mode driver object to initialize
+ * @dev: backing device
+ * @write: write callback for programming magic
+ *
+ * This function must be called with a valid @dev and @write before calling
+ * reboot_mode_register(), reboot_mode_add_predefined_modes(), or any other
+ * reboot-mode framework API.
+ */
+void reboot_mode_driver_init(struct reboot_mode_driver *reboot,
+			     struct device *dev,
+			     int (*write)(struct reboot_mode_driver *reboot, u64 magic))
+{
+	memset(reboot, 0, sizeof(*reboot));
+	reboot->dev = dev;
+	reboot->write = write;
+	INIT_LIST_HEAD(&reboot->head);
+	INIT_LIST_HEAD(&reboot->predefined_modes);
+}
+EXPORT_SYMBOL_GPL(reboot_mode_driver_init);
+
+static struct mode_info *reboot_mode_create_info(const char *mode, u64 magic)
+{
+	struct mode_info *info;
+
+	if (!mode || mode[0] == '\0') {
+		pr_err("invalid mode name(%s): too short!\n", mode);
+		return ERR_PTR(-EINVAL);
+	}
+
+	info = kzalloc_obj(*info, GFP_KERNEL);
+	if (!info)
+		return ERR_PTR(-ENOMEM);
+
+	info->mode = kstrdup_const(mode, GFP_KERNEL);
+	if (!info->mode) {
+		kfree(info);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	info->magic = magic;
+	return info;
+}
+
 static int reboot_mode_create_device(struct reboot_mode_driver *reboot)
 {
 	struct reboot_mode_sysfs_data *priv;
@@ -157,7 +202,7 @@ static int reboot_mode_create_device(struct reboot_mode_driver *reboot)
 	return 0;
 
 error:
-	reboot_mode_release_list(priv);
+	reboot_mode_release_list(&priv->head);
 	kfree(priv);
 	return ret;
 }
@@ -170,7 +215,7 @@ static int reboot_mode_create_device(struct reboot_mode_driver *reboot)
  */
 int reboot_mode_register(struct reboot_mode_driver *reboot)
 {
-	struct mode_info *info = NULL;
+	struct mode_info *info;
 	struct property *prop;
 	struct device_node *np = reboot->dev->of_node;
 	size_t len = strlen(PREFIX);
@@ -180,9 +225,11 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 
 	INIT_LIST_HEAD(&reboot->head);
 
+	if (!np)
+		goto predefined_modes;
+
 	for_each_property_of_node(np, prop) {
 		memset(magic, 0, sizeof(magic));
-
 		if (strncmp(prop->name, PREFIX, len))
 			continue;
 
@@ -194,28 +241,18 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 			continue;
 		}
 
-		info = kzalloc(sizeof(*info), GFP_KERNEL);
-		if (!info) {
-			ret = -ENOMEM;
-			goto error;
-		}
-
-		info->magic = REBOOT_MODE_MAGIC(magic[0], magic[1]);
-		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
-		if (!info->mode) {
-			ret =  -ENOMEM;
-			goto error;
-		} else if (info->mode[0] == '\0') {
-			kfree_const(info->mode);
-			ret = -EINVAL;
-			pr_err("invalid mode name(%s): too short!\n", prop->name);
+		info = reboot_mode_create_info(prop->name + len,
+					       REBOOT_MODE_MAGIC(magic[0], magic[1]));
+		if (IS_ERR(info)) {
+			ret = PTR_ERR(info);
 			goto error;
 		}
 
 		list_add_tail(&info->list, &reboot->head);
-		info = NULL;
 	}
 
+predefined_modes:
+	list_splice_tail_init(&reboot->predefined_modes, &reboot->head);
 	reboot->reboot_notifier.notifier_call = reboot_mode_notify;
 	register_reboot_notifier(&reboot->reboot_notifier);
 
@@ -226,7 +263,6 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	return 0;
 
 error:
-	kfree(info);
 	reboot_mode_unregister(reboot);
 	return ret;
 }
@@ -259,7 +295,7 @@ static inline void reboot_mode_unregister_device(struct reboot_mode_driver *rebo
 	if (!priv)
 		return;
 
-	reboot_mode_release_list(priv);
+	reboot_mode_release_list(&priv->head);
 	kfree(priv);
 }
 
@@ -269,17 +305,12 @@ static inline void reboot_mode_unregister_device(struct reboot_mode_driver *rebo
  */
 int reboot_mode_unregister(struct reboot_mode_driver *reboot)
 {
-	struct mode_info *info;
-	struct mode_info *next;
-
 	unregister_reboot_notifier(&reboot->reboot_notifier);
+	reboot->reboot_notifier.notifier_call = NULL;
 	reboot_mode_unregister_device(reboot);
 
-	list_for_each_entry_safe(info, next, &reboot->head, list) {
-		list_del(&info->list);
-		kfree_const(info->mode);
-		kfree(info);
-	}
+	reboot_mode_release_list(&reboot->head);
+	reboot_mode_release_list(&reboot->predefined_modes);
 
 	return 0;
 }
@@ -344,6 +375,55 @@ void devm_reboot_mode_unregister(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_reboot_mode_unregister);
 
+/**
+ * reboot_mode_add_predefined_modes - Add predefined reboot modes
+ * @reboot: reboot mode driver
+ * @modes: array of predefined reboot mode entries
+ * @count: number of entries in @modes
+ *
+ * Add predefined reboot modes in a single call before registration.
+ *
+ * @reboot must be initialized with reboot_mode_driver_init() before calling
+ * this function.
+ *
+ * Returns: 0 on success, -EINVAL if @modes is NULL, @count is 0, or an entry
+ *          has an invalid name, -EBUSY if called after reboot_mode_register()
+ *          or if predefined modes are already present, or -ENOMEM on allocation
+ *          failures.
+ */
+int reboot_mode_add_predefined_modes(struct reboot_mode_driver *reboot,
+				     const struct reboot_mode_entry *modes,
+				     size_t count)
+{
+	struct mode_info *info;
+	int ret;
+	size_t i;
+
+	if (reboot->reboot_notifier.notifier_call == reboot_mode_notify ||
+	    !list_empty(&reboot->predefined_modes))
+		return -EBUSY;
+
+	if (!modes || !count)
+		return -EINVAL;
+
+	for (i = 0; i < count; i++) {
+		info = reboot_mode_create_info(modes[i].name, modes[i].magic);
+		if (IS_ERR(info)) {
+			ret = PTR_ERR(info);
+			goto error;
+		}
+
+		list_add_tail(&info->list, &reboot->predefined_modes);
+	}
+
+	return 0;
+
+error:
+	reboot_mode_release_list(&reboot->predefined_modes);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(reboot_mode_add_predefined_modes);
+
 static int __init reboot_mode_init(void)
 {
 	return class_register(&reboot_mode_class);
diff --git a/drivers/power/reset/syscon-reboot-mode.c b/drivers/power/reset/syscon-reboot-mode.c
index 9f4b18c5e46f6a8bf197773ceceb80b250f57541..55f2fd33e0d2abc599848c936619cb6cdbaed47d 100644
--- a/drivers/power/reset/syscon-reboot-mode.c
+++ b/drivers/power/reset/syscon-reboot-mode.c
@@ -45,8 +45,8 @@ static int syscon_reboot_mode_probe(struct platform_device *pdev)
 	if (!syscon_rbm)
 		return -ENOMEM;
 
-	syscon_rbm->reboot.dev = &pdev->dev;
-	syscon_rbm->reboot.write = syscon_reboot_mode_write;
+	reboot_mode_driver_init(&syscon_rbm->reboot, &pdev->dev,
+				syscon_reboot_mode_write);
 	syscon_rbm->mask = 0xffffffff;
 
 	syscon_rbm->map = syscon_node_to_regmap(pdev->dev.parent->of_node);
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index 2ce189fdfff4b396d7cc6f175b30016781ae4fe9..4503ee388cd00d5e004600d51056d623ea23e345 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -15,18 +15,31 @@
 /* Get 32 bit arg2 from 64 bit magic */
 #define REBOOT_MODE_ARG2(magic) FIELD_GET(GENMASK_ULL(63, 32), magic)
 
+struct reboot_mode_entry {
+	const char *name;
+	u64 magic;
+};
+
 struct reboot_mode_driver {
 	struct device *dev;
 	struct list_head head;
+	/* List of predefined reboot-modes, populated via reboot_mode_add_predefined_modes(). */
+	struct list_head predefined_modes;
 	int (*write)(struct reboot_mode_driver *reboot, u64 magic);
 	struct notifier_block reboot_notifier;
 };
 
+void reboot_mode_driver_init(struct reboot_mode_driver *reboot,
+			     struct device *dev,
+			     int (*write)(struct reboot_mode_driver *reboot, u64 magic));
 int reboot_mode_register(struct reboot_mode_driver *reboot);
 int reboot_mode_unregister(struct reboot_mode_driver *reboot);
 int devm_reboot_mode_register(struct device *dev,
 			      struct reboot_mode_driver *reboot);
 void devm_reboot_mode_unregister(struct device *dev,
 				 struct reboot_mode_driver *reboot);
+int reboot_mode_add_predefined_modes(struct reboot_mode_driver *reboot,
+				     const struct reboot_mode_entry *modes,
+				     size_t count);
 
 #endif

-- 
2.34.1


