Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6788ECD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 14:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lVT+6+ENhr9QUbosk5DVYlfO2a3L1c21Y2zL0+4Gp+M=; b=IhVxyWoP5guOCgJSsAVR0nLRMz
	RMCcrJLF1kNIP5UOqs0xLWftLuadmC/WNPZB904inPJPav4d6IrORFot+Mcu68ocrVg/13wiOJJ3c
	ky63Wj+VrisQSI1dFwBDU5aDiH3e09nP2nyX08JEHG3yfNB+WB1U26xGiPwpUJnwOFq+caDsnX3l1
	lgblLNrP4tbTfEceX1fJ9ohXBNdEzas1nFGWdrel5uiAt7QVfsDAtC3yhaUCjQxqpN9ZZjYG2dxme
	ZfZC4D2FeqiU2NvdTSe/s6HmaIxwAK68cDkgN0P+qvrydg/SA91wAvVDYKvDtf4ywuXbsk7KWsXq9
	u8OoojwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNX32-00000005jES-0Yqz;
	Thu, 14 May 2026 14:28:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNX2z-00000005jCE-1y46
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 14:28:22 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeanB2238508
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 14:28:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lVT+6+ENhr9QUbosk5DVYlfO2a3L1c21Y2zL0+4Gp+M=; b=NRpVxQYT9bG/uPQF
	IBuTkRhJd6b7AEoCvbiiiah2eseNeMWXBfRh6XkzBc2TkJj0XCvMUuxtSyq79p0W
	x6k2e16XJ6avvZOTM2OdyoPWqX0R/5UbPx5sNOVOHiyLGlN5V/+Y9wLUmp4APtRT
	I/2+Vy8cGkquGwNSAMnCyfqOVXJds3blolbsKx6deGrLmb1xMM49xWJ97iEcNQKe
	64Lu2DznOWviMAl5stx0twPMuMgU033Y+8BvLqCtVDogd0ukPjhJBMjKGyf0j+Q2
	Okl1dqQz6UA6Szci8urtWmGMinZKoTEMCt1+WkJkOseU+WkxcIb+UHq8gZqPquqA
	MXUFjg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e566bj677-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 14:28:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b99eb06178so169088405ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 07:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778768899; x=1779373699; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lVT+6+ENhr9QUbosk5DVYlfO2a3L1c21Y2zL0+4Gp+M=;
        b=kqmyeZ8E+BLbNrM31zM1NEkYhocT1Wo/hrr2rL9cliIK7bwxhKZ/Xr3teD29XGqCdJ
         6gMXG1qD2aky71oB8eRGAfEXj1ZZmghwMdwA7xGWt+HEEXRAkI8QWWQlPkQ/Nitf5CP7
         MFKbTnQSAtda5xOKiIs3H5zN/sbUU1DDZUTzLKdU3SE/3b7QYKTHhMlcMLJyVLEPkSHe
         +NfcRc1ouCoDQP5GlRthVNZCVbhJHj07MpwCP17NVAMjuAxvdDH73CVx0IsL00cSMuNL
         woxwxpXxLw2lIhcvsB+hShKpWRAy6GekHjlT0Kf183UZMULY5LpmYKXKZ4B6TS/R/R/x
         uXxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778768899; x=1779373699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lVT+6+ENhr9QUbosk5DVYlfO2a3L1c21Y2zL0+4Gp+M=;
        b=NVuUKvY3743D16EMrGhPnV6WNT8Ni2ICFI7IQ8McFrNowlMqLvT9928dGvEzWU3jzQ
         /GguK5ejcujxSXGlQN4MO0YHUR1cBkuv6cUTfU5IJm/Tqg0qfhku2oRqkJhb2+b/SkaJ
         1HFyVwRNK+4ktQ6h77ACPiX8leiId3WaawMCchJ5Sc89LTibzdyuv1IloOB/u/DXqi7D
         eiO3hLdRP5yMXBR9jhWue/VlFWXoyHtVXLNb+mxFdPV6UlnSfy52cPrfc+MLE+849Vw0
         0vKV3bGX6dlzNhQUosabnzeN/6lYCJaUDUs7i6uwCgn6nq+9/CJun57YKVOoZc6lZ8kB
         8loA==
X-Forwarded-Encrypted: i=1; AFNElJ9GgQnUTKbCBJKX8fOtZ7/ewLb+DusOggA1XautXjhZPDPhzO/8AB/YHwhg8haae6OAdFMUH9vBxJyY+nNXf0br@lists.infradead.org
X-Gm-Message-State: AOJu0YwTGJHIpzErMbBRQ71XS8bJO1gasIBCvjWTxRIMAF8OnILCLos7
	vQkOyJ99V6WU+f0SAKAyzPfLLzChFhXbH7UvxYBljCSfDafptovGv+Eu1/hzgqVaF7MAwXPNTlT
	XLB3M3NPErB7/WkpF4Jn3KrNYArw6G7/IjpG+9DVVF5o9rCxN23ybJlwP+8LJxxnBNdfe3gIwJ3
	0qkw==
X-Gm-Gg: Acq92OFpgIQxGEHmdPJ7UjAvxnU2lmzfVDORcE5DOGi26b2atql50smAsbacb1a9SY0
	8gLUjUsIz8YZcAOXJhuE5eoFNw7AD4MfJSmx0TgpQdmna4EpVBRRFkyH+fecpsquEsd0jD1MbFI
	ejSWouMTumJeQSR+5j2L+7gDLdd/iR46iVXUxeZQ8jo5ta72d84TZt4TocSstWkBwhT0gQBuiLF
	JWU98HppHgOm6Mrt4gnN0jsUjsz3sULWVsieb/zUc+Sh2xN2hsSHpEaWLbtacH8/V9opL0Qw+9m
	lfSDt8aAavifiBL8ViKjMTJyV951Tq4us4SznzFCf15OUU47kOaAGmclk1zSNcPa8ezDJNRcFZL
	Rd7mp5GiHM5eT0Fz/t7GjIazGuCDhSEyjYgazLUq6abQblK1ILccGenP0wQ==
X-Received: by 2002:a17:903:2910:b0:2bd:2439:25fc with SMTP id d9443c01a7336-2bd27147127mr50114045ad.7.1778768899356;
        Thu, 14 May 2026 07:28:19 -0700 (PDT)
X-Received: by 2002:a17:903:2910:b0:2bd:2439:25fc with SMTP id d9443c01a7336-2bd27147127mr50113845ad.7.1778768898844;
        Thu, 14 May 2026 07:28:18 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05ffbesm28566485ad.27.2026.05.14.07.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 07:28:18 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 14 May 2026 19:55:49 +0530
Subject: [PATCH v22 08/13] mfd: core: Add firmware-node support to MFD
 cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-arm-psci-system_reset2-vendor-reboots-v22-8-28a5bde07483@oss.qualcomm.com>
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
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778768806; l=3848;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=vbRU67UVOb7vag0urLTR9CGL8NDqWbK8p17LbDC+cW4=;
 b=1ujf4JijpapWH/nOjxZ2QgZuRc0mQFRmg1998wEzgTxxWNXW+Wu6uTuV3aIgaDfjFZ74E/z0z
 sUG4/0XD4kBDQ+Rg5DzfQ2CFoovpR4etLcGo6OPdUtObyR6ZlRz/Y1x
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: fgpbsHrUDbaG9BY6Mpm6RDi1k91rGP2G
X-Authority-Analysis: v=2.4 cv=WsMb99fv c=1 sm=1 tr=0 ts=6a05dc04 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=n1cGDs2KZ32Q86TtW5UA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0NiBTYWx0ZWRfX3lz0zP77x+kX
 bRgS+SA8047TPsblJiKtiYF0/5vkivFaDvq4RY3KJDYtd6ReEHmWZkt6Q2NfOSYdaCwk1hCN5XX
 rwW7Uy45OFczZkVmkuhQKEvw3LEwdXdyVD0gOGamJ+K2k//xcFYTVjOVGcHP7xvdje0XvSvVolb
 2N4pjOxk+z3Q6eIqiQhu6zZZlpPT+na6RT1rJnh6bvFYYKJpUiAkXEKJQLrLpHC2IIXlZpIFzQ4
 wdkeaKjQu3+2sw9PkknHYcZ26uLuKW4EfAcWChwVvMB3u6yc4FsLpkZ5c7fuLDFTTNTQXGrSd+L
 iUAZMfsymUo5mwO1HVNcb3dAn8e3EUYKeu7qBQF0zoMHwWpajvCQDF8bu31Xg0XwDpEPh3q9H76
 D6x2kBKYUi7M2MEFF69f6+H2FU/JhIJ0v7Iq8palU4Ayr5O9L8g5b0nlpTSDDABEgfTYqQGrkKN
 VgVU1OWy6dD09cc7aZQ==
X-Proofpoint-GUID: fgpbsHrUDbaG9BY6Mpm6RDi1k91rGP2G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_072821_666603_E27217DD 
X-CRM114-Status: GOOD (  24.63  )
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

MFD core has no way to register a child device using an explicit firmware
node. This prevents drivers from registering child nodes when those nodes
do not define a compatible string. One such example is the PSCI
"reboot-mode" node, which omits a compatible string as it describes
boot-states provided by the underlying firmware.

Extend struct mfd_cell with a callback that allows drivers to provide an
explicit firmware node. The node is added to the MFD child device during
registration when none is assigned by device tree, ACPI, or software
matching.

Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/mfd/mfd-core.c   | 30 ++++++++++++++++++++++++++++++
 include/linux/mfd/core.h | 14 ++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
index 7aa32b90cf1eb7fa0a05bf3dc506e60a262c9850..cc2a2a924d6d3044e29a9f864b536ee325ed797b 100644
--- a/drivers/mfd/mfd-core.c
+++ b/drivers/mfd/mfd-core.c
@@ -10,6 +10,7 @@
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
 #include <linux/acpi.h>
+#include <linux/fwnode.h>
 #include <linux/list.h>
 #include <linux/property.h>
 #include <linux/mfd/core.h>
@@ -148,6 +149,11 @@ static int mfd_match_of_node_to_dev(struct platform_device *pdev,
 	return 0;
 }
 
+static void mfd_child_fwnode_put(void *data)
+{
+	fwnode_handle_put(data);
+}
+
 static int mfd_add_device(struct device *parent, int id,
 			  const struct mfd_cell *cell,
 			  struct resource *mem_base,
@@ -156,6 +162,7 @@ static int mfd_add_device(struct device *parent, int id,
 	struct resource *res;
 	struct platform_device *pdev;
 	struct mfd_of_node_entry *of_entry, *tmp;
+	struct fwnode_handle *fwnode;
 	bool disabled = false;
 	int ret = -ENOMEM;
 	int platform_id;
@@ -224,6 +231,29 @@ static int mfd_add_device(struct device *parent, int id,
 
 	mfd_acpi_add_device(cell, pdev);
 
+	if (!pdev->dev.fwnode && cell->get_child_fwnode) {
+		fwnode = cell->get_child_fwnode(parent);
+		if (fwnode) {
+			device_set_node(&pdev->dev, fwnode);
+
+			/*
+			 * platform_device_release() drops only of_node refs.
+			 * Track non-OF fwnodes explicitly so they are put on
+			 * all teardown paths.
+			 */
+			if (!to_of_node(fwnode)) {
+				ret = devm_add_action(&pdev->dev,
+						      mfd_child_fwnode_put,
+						      fwnode);
+				if (ret) {
+					device_set_node(&pdev->dev, NULL);
+					fwnode_handle_put(fwnode);
+					goto fail_of_entry;
+				}
+			}
+		}
+	}
+
 	if (cell->pdata_size) {
 		ret = platform_device_add_data(pdev,
 					cell->platform_data, cell->pdata_size);
diff --git a/include/linux/mfd/core.h b/include/linux/mfd/core.h
index faeea7abd688f223fb0b31cde0a9b69dfe2a61ff..abfc26c057d6ee46947ba2b6f2e99f420e74b127 100644
--- a/include/linux/mfd/core.h
+++ b/include/linux/mfd/core.h
@@ -50,6 +50,7 @@
 #define MFD_DEP_LEVEL_HIGH 1
 
 struct irq_domain;
+struct fwnode_handle;
 struct software_node;
 
 /* Matches ACPI PNP id, either _HID or _CID, or ACPI _ADR */
@@ -80,6 +81,19 @@ struct mfd_cell {
 
 	/* Software node for the device. */
 	const struct software_node *swnode;
+	/*
+	 * Callback to return an explicit firmware node.
+	 * @parent: MFD parent device passed to mfd_add_devices().
+	 *
+	 * Called only if OF/ACPI matching did not assign a fwnode.
+	 * Ownership of the returned reference is transferred to MFD core.
+	 *
+	 * Return a referenced fwnode or NULL if none is available.
+	 *
+	 * mfd_cell must be zero-initialized or get_child_fwnode must be NULL
+	 * when unused.
+	 */
+	struct fwnode_handle *(*get_child_fwnode)(struct device *parent);
 
 	/*
 	 * Device Tree compatible string

-- 
2.34.1


