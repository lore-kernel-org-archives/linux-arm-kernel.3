Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DACFF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 17:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mTylmpgaZ0jhgYjEQvu43uNWIUtaitxie7wYdhQCPmM=; b=xmdeTyEQtuNEg3hYx2MEJ91PTA
	uXGQ6NIIeWNflQXJkMOg2AAFCkinSbGphhwcx96WPYDs5dnfU7rC7GGBWXownO7C+ytLeL1sv50eV
	prtPSgjeRYHcj4iITL6O4CP6zcn/F+tKLZ3H4hLwfh32WDisxOeVRfJWlpyWtsM0IVjFChAaVOX8F
	SEbi4GFKegUMGXh5UXV8+MW0qIXxjOdK8hPfJzJAsKportBLZq4F1iLIpOZAmmb3YqSPssjl6rq5X
	DQr+C0ppzxkX0f/sZypA5AjZ5Eq1hjVwKgjlHlGpuYNNPEU4QvfLl8QlWRlh2qp5f0VOT+TJpEBPw
	aO9imRdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHPsy-0000000HUDA-11hH;
	Mon, 27 Apr 2026 17:36:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHPsw-0000000HUBv-0Y3p
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Apr 2026 17:36:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=mTylmpgaZ0jhgYjEQvu43uNWIUtaitxie7wYdhQCPmM=; b=E3y8BDnSftNtmWPYeDzI1PbxK7
	vd/kDFTkEDNkB+y8jqJvFzmcmXob3gCKDcI1ePVtHAdOdWyZBcHrJJoPoiRda0qzC9Ktb96jMx7PR
	QhHtjDmcfuBqvAKHH3ch1FozXrrq7niIoqeXSeDaBS2ET59G0fMDVSzPRVou9LTuj28kYL1Z4CIhA
	zP4NUpDTt02djB8tS5o85aQ7Ze68QXClEIafXaThwfnn4s/3qJn5Pp7OlNL6W0zsczk3i/f6HY+Fw
	8gy908/7VB6es89oiQ4QEAZSqplULnfFB/ywrZQjqfZ7mPAOOFtjxQtjOcTK/bL2nr0FgeIWjPFCC
	8yrZajaQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHPss-00000001GTO-3GPP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 17:36:40 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RDYaDY3962085
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 17:36:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mTylmpgaZ0jhgYjEQvu43uNWIUtaitxie7wYdhQCPmM=; b=T12XypqnQnquQ8mC
	ng1tcHHYGf3IDDJ0HFnTlGkA0m4XQU3DRNKv8t+IFWYJJSaA8EYdx+pQKyJgIkkb
	QYb+aTcPHcmLzZMN/+saSCSmi8+bAa5wu//Xvpq6sECD4pgbLPw/zBavv6wc6AeQ
	gojy27n40JkkXRLDuqf/HBrVM3HGIntDvAeyAdTDXGF5OqEUSez/FB6nR/5oOGAA
	QEt5bTJ8XiTvoLLXBQ4sMF8QVFf+5tuL35rJF2OjSvM0jo0QDvJfPZ9q1o9VFnl/
	rt5RZYkzo2NJqlxK38YECYUl6WzlrGcYM3z7ESuPPl3YHQPUjDnqaaGUNg/jbFUU
	2WCB7Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt4k3282y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 17:36:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2d0c1ead1so195302265ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 10:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777311394; x=1777916194; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mTylmpgaZ0jhgYjEQvu43uNWIUtaitxie7wYdhQCPmM=;
        b=YdCZNO/HqKSSJYb/ucFEQzz7Geuo2NqoMG+tzunwnXwQB4hPlnxY614lkxyzcGqu7a
         qHfRLbWlYjWZ3nKWRSplvanNSQLXvFiYgu77Xc8sCWVc4UbYKzEbdzHqNRbnZCwcJOCB
         D7UHJnikvyRYclfD14hLdziLae0pGzFX/FqjGsZFuTvwWI/e9vIAzAbHdAOGmHxnrxRJ
         +WFTH9xZkJu7RFoF/PD5iorFehLNV4gANRPhdojuyv+so4+RZmHzSgbgkPAoPMLi5s8E
         nq5pZlul8flw7aUgb7hoducI9GIeSV/11TRCRTXBxvM2I2yvxl7tmDjCQDlWr3ORtgyS
         864g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311394; x=1777916194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mTylmpgaZ0jhgYjEQvu43uNWIUtaitxie7wYdhQCPmM=;
        b=L3OW0D1D8tm0P+StAh55b16N9KZPyKcoUAm7NGFTFu81QZUm22QGCxVV6/dY7+hd5K
         QVH7wUS/y0z6wJeXsqzlTyqWBgS+KaiEUj45v3eLFmrAZevhVWgah6l8NSYHu8w2uKo8
         2VB+9tRjNUQ32EGSGMZ3keolZA5gNKIjCW6VPbN1ft2LEEIRN1yZBSwvrp5XupGADeRH
         MUKgPd+ncylo9ejlbu29tA3PQkyIXioXIihcMSuoWnvDLF/4J6GGIVtYRJTyMIgfQXX2
         8bmyIg5E1uT3CWWzi0b705wSzYeAkB1bRn/atXMEKRWcYNkOa6ZO1J1dAXQU+qZeChhM
         baEw==
X-Forwarded-Encrypted: i=1; AFNElJ8LTReo6Rw521tdzl/+Lj1Hzv2I7yyTphZ1q/XA7VHKiKkE7BLmSflN0bKRXCv79rSuuP7aYmipHER9sN15Is7B@lists.infradead.org
X-Gm-Message-State: AOJu0Yzbb7VNuopW/syyJVpinU9opuJFQl04tQd2OR+Z6Av6GZ3QeCOT
	ZgI9d83ct9aI8Hgrip/q7q2n5CkCNwIeCO9kZAgPLmusvYWFpR3DXGxAo4Kb2Tzhz6KdWJqzeAv
	7J8xtVZV2pC8HsB9snISu02jDWtiAZH+xwnX0lFiZVPaU4pIHXyiqRg0G2D+N5FbM7v75karDPT
	+vJA==
X-Gm-Gg: AeBDiethCbcKvaQPZO3/MMhkstp+ojFzw8FqRyjlHwg0W1qObCWbuQJWHEKD86ax3cP
	HSeL/ZcZoa0nmF4LL79eDdtkBnr9YCXjuzLGauQc319BI7mF5AHZrc9/BbADhwnjHHDf8EkTAGv
	UUSZFomkstOIrwPE1owKn78zAsll1og1CIopSGsqoWFGeFEjkb+d9mUgK9OczYK3J0eGaDqE0kY
	T0ESiKIJsJoPIw74uB8D2TR9SpdA9XxeLiw45r81jTmWhovKPObV+iT+k+S/oRR++ehT4aC5r4i
	Z50MMXyPEa7lPX5daRAvzFDZqIsNBhAUXtoH6BN/G3D52zAauPrnrVWgz5WMtClCNDwSZISQkZJ
	vIGhbMBxAbx9u37PQk+fYbnhh0cHMCxWitaIpg0NdFWubBf4RXT2JXRnzZGo5egWTM7Xn
X-Received: by 2002:a17:902:968a:b0:2b2:5091:1c0a with SMTP id d9443c01a7336-2b97a97d026mr1052505ad.41.1777311394476;
        Mon, 27 Apr 2026 10:36:34 -0700 (PDT)
X-Received: by 2002:a17:902:968a:b0:2b2:5091:1c0a with SMTP id d9443c01a7336-2b97a97d026mr1052025ad.41.1777311393841;
        Mon, 27 Apr 2026 10:36:33 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aca8369sm329115ad.75.2026.04.27.10.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:36:33 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 23:04:48 +0530
Subject: [PATCH v21 08/13] mfd: core: Add firmware-node support to MFD
 cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-arm-psci-system_reset2-vendor-reboots-v21-8-dcf937775e73@oss.qualcomm.com>
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777311301; l=2427;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=fNH9qCYe4Y0NmzftG8HGe9p8tkk1iIJgMKEMMVyfJQY=;
 b=ZRQqaXwPk9eM6B4nM1bogpDoTT6JjboYi/afKdttQA9pSYuU0vd20Tg8Ykkl7Zc2sqmXOR127
 TjkQY84p39bA3wuq+0W6rtvlHbI8XeqZqvU4Lvz1j5Jn7/SwHMWXP5G
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE4NyBTYWx0ZWRfX3OzYQPo8xBmC
 HxcsP2TRAqESyyEzUWpnCNDs+RUol6lUCksKS3PmhHQip71v2LjdmKiH6/0HAYVs1Tdef5q8tcj
 IMG6/I5ty4LiOuUk829EqZfz0cCf85WMOX5n8FUwzk4Wz6f0CmXBncqU4ET9fZsRybUcMX8WEbu
 z3eriFqYGRDiG6H5R/v926EQs+KQyCXQcRdoo7qDNqnl0pdse4y0D8RYzO2AOwGSj55kQJ+KXec
 kI/2iJCWft4Ur7bKJywcfytb8QsAAPQ808XPMKNkEDcB8kKRnc99emeEk72jxvMDjWJ3p1AWPpN
 mcEDorb/nQHaYHKOilx0NMl9sSPP+NadbBbDG6RBS0FKw0UM4lFfK9xdYz9IayczlNFNv0esV/I
 AlOyLKwBCA8AtjoQdqRdZ+lW3KTR2r5Yth0Mr7H8/QbYWKjUQyjF9unSBvsJd4wEfrcTNHhVkXx
 vWASO62g2dtIJjBCLLw==
X-Authority-Analysis: v=2.4 cv=a7QAM0SF c=1 sm=1 tr=0 ts=69ef9ea3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=JnGLTex25XOQSkTSfOwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: rMBpjQMaCt3XXktR9WRKXrc7XLfmZ-lF
X-Proofpoint-ORIG-GUID: rMBpjQMaCt3XXktR9WRKXrc7XLfmZ-lF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_183639_134965_A7A2E32F 
X-CRM114-Status: GOOD (  20.68  )
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

Extend struct mfd_cell with an optional fwnode pointer and attach it to the
child device during registration when no firmware node is already assigned.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/mfd/mfd-core.c   | 10 ++++++++++
 include/linux/mfd/core.h |  6 ++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
index 7aa32b90cf1eb7fa0a05bf3dc506e60a262c9850..d2153d9b6dd75a5f55d232ba87bd9e4abc93c8be 100644
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
@@ -224,6 +225,15 @@ static int mfd_add_device(struct device *parent, int id,
 
 	mfd_acpi_add_device(cell, pdev);
 
+	/* Use explicit cell fwnode only when no firmware node has been assigned. */
+	if (!pdev->dev.fwnode && cell->fwnode) {
+		/* Get a refcount if fwnode is a device-tree node. */
+		if (is_of_node(cell->fwnode))
+			of_node_get(to_of_node(cell->fwnode));
+
+		device_set_node(&pdev->dev, cell->fwnode);
+	}
+
 	if (cell->pdata_size) {
 		ret = platform_device_add_data(pdev,
 					cell->platform_data, cell->pdata_size);
diff --git a/include/linux/mfd/core.h b/include/linux/mfd/core.h
index faeea7abd688f223fb0b31cde0a9b69dfe2a61ff..8a461b43fac360672a489ffffeb8d0e1acd193ac 100644
--- a/include/linux/mfd/core.h
+++ b/include/linux/mfd/core.h
@@ -50,6 +50,7 @@
 #define MFD_DEP_LEVEL_HIGH 1
 
 struct irq_domain;
+struct fwnode_handle;
 struct software_node;
 
 /* Matches ACPI PNP id, either _HID or _CID, or ACPI _ADR */
@@ -80,6 +81,11 @@ struct mfd_cell {
 
 	/* Software node for the device. */
 	const struct software_node *swnode;
+	/*
+	 * Firmware node for the device.
+	 * Caller owns the pointer; mfd-core takes an OF node reference.
+	 */
+	struct fwnode_handle *fwnode;
 
 	/*
 	 * Device Tree compatible string

-- 
2.34.1


