Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0341ECD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 14:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oWKxom21haWgZdoOhFhN3R9zZKeJdr2nkwKtgHCCEbY=; b=ufafivoY00fZZ3l17tdSfZvSfI
	nWcTatujKef8k8aDdQdYIMhbLycMZiwavkvMv2u/ArotnPWNWXhhG635y/15Y78snRLFsqRDk+m5I
	EhtML97DFSX15BKs/WXwC6LOvOjc2rXCXawqcY0MR82KXJWeYyeMaqZd1pFtak4B0ll+KTuzQCNWH
	Bsai4dur2TsrX3Vi0KuXdU8fGuwp/lgkyVKDXELuHbNwpAZBoyRyi5A/JYTierRqVVVHgCCrQ/y9Y
	XP6VmfWDMPeXdtX2VE1tkPSDCCCro7hTbFsUQJfHXOWCJtVLrafGZZeHdeeF+vOI8JxjsRETXpMGy
	JNzwyvPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNX3C-00000005jLL-1SfA;
	Thu, 14 May 2026 14:28:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNX3A-00000005jJ3-02dC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 14:28:33 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBePtl2841023
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 14:28:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oWKxom21haWgZdoOhFhN3R9zZKeJdr2nkwKtgHCCEbY=; b=hFaeiy8zlR5ONugv
	1yPO1AkOPlVK1PSqAn6ZLWegn7vvi0LDcPXk4qyjoohpMiPJk6sh0vokz/1dhUWc
	NpKYv9F0SEo/lJDeP9xIefhisryqZoJlcYZIiJroaZGPy5l6MVtRTtvm7A+hfIFK
	4I2s82PHoqFxC5fmy+n6p7zdb98YBeD39VqWeQ1uV46PDd2myJc7+t7YFCbL/F/S
	vBVEJ8TOFX4DkUpPsiu/SPYRIaS8f2r/Dh5EeGRlrzjYtfZzwo+RXv4BVQRXRzmH
	AZ7Ulka+e+QYjD2gxqcfwHlIde88BozUDHCWRUoXoZ5dex1HEZeBgOCxEfBX9E6P
	zJf5Sg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5899st2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 14:28:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba268cb5e6so71817915ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 07:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778768910; x=1779373710; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oWKxom21haWgZdoOhFhN3R9zZKeJdr2nkwKtgHCCEbY=;
        b=GUMaDcpJbn/3m8S+J7KRne2PDG8OQ8OzePckgInUIrPx6BT5miFdfzpehebTgMbQFE
         u9LyUQv28bHvL/U8LXCpCbnzIl8GaErGdjKnWf/URiHmcsM84vDk5zzgUw2OZFzv6tnF
         LmlvhM8Gg2OvypsfRCV2nJyQeQCl0bI21Qq2A6cj5596P83gBMJyV/fepudo0obIvEIo
         UfutHxeJ/v2Q6MsEOCcYQZ8J8D1G3AKEgeHS5vfAdK22RBSrcl1nrYKnpY0sEdfb6Phj
         e8SXpO/J/f5CiWtD4Z6dAJE4AEedPt6XCSggmXo1pAZHkIjnos0UYrGK4OwvtCEWjEc6
         VB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778768910; x=1779373710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oWKxom21haWgZdoOhFhN3R9zZKeJdr2nkwKtgHCCEbY=;
        b=S9YLCYaoJovHL2nLt6BidXLnKjDOUubfahzQ8ZgvzrGY2a0M1vX9zpwvPsOmpIOjY1
         E69A+t2siEENPy8vWLNAmAMogdCynhy5E/roFqb86/OFDCDSMV17fVr27i+0Kbw2K7B0
         ZFRMg1iY10BP2vZiFbzX+IJSOkff6QbEAm3HnJT3tL8Un2esm797sdncscRPZuZTOt/n
         V1OwxBFADNH3FzrYrW/D2rphrfvJ3Y9s+zJMuSp2+ogB3Pu2CsP/8CxeViA4uCbLK3M9
         +G/49o202XlDTis0IrjNscbwpknUuW3uj6Ct3w3BrZ5mriAA8n3HfH39Ts3hms7zVtvY
         hTuA==
X-Forwarded-Encrypted: i=1; AFNElJ9dk88CujN2JFwXydOkbrDkJMQavsRo1r3gJwsUug1F+bDYVL8ZGQeRVJdCDEz9Iz6QuSy5/0f34TyxiISTiNSz@lists.infradead.org
X-Gm-Message-State: AOJu0YwvmcCaGC2FSkHl9QBLSGE0+g8qerJ7T3uRvAcxxzd6Oj1Vtex8
	wbkrDPre74KHBzJaluItnrystJmR5f5+ghBhBRCgVUxROPrQEKNONXeo5qpozJy9q9+zauyz4Jw
	pFs9uOHBAje1pOSSFf4lEE9vYq3XlYeakK47+BfIc+bgIzFnHcyKBX04oMq1yVMftLgZzIq/OxD
	JZSg==
X-Gm-Gg: Acq92OF8Bah6IYMQIX13gPKExxYt283F0eAqf17C7wxrrk4mWaSYZGppQv3l7wSvYfx
	v96dGkmKVZ4o/+K2blSNEGUVxQZaIx0dZdCylkn/jC/yNVYIAADg/YLSNlEZOkcquloI221fd2+
	hjhs+V23poJ7fhdC7vYtECRc5sVg9cqyPq+YFaJgnpz3v9d2JTKPalEd/yrjQNeP6Xkva7OYSKU
	sMR31LsjAj/apIKW6E+p2v8AFz9YER1KfwMud8rtufgJiiT/xPLevD5zVZ1/s357JjnHPD4wGzd
	o9O1o8kcdeReCB0b3eAheOiRFptdbP49+NvaPS+e/y61KpiSGad0GVyyo4UgfRGDTZ+cW+USWM8
	MbP1yP3YZEmj3Hnyt2Vu5bCBEvA+7XXR/DTjvS4k51SqcRC79LJG6x8ieug==
X-Received: by 2002:a17:903:198c:b0:2b2:57df:264d with SMTP id d9443c01a7336-2bd276d9763mr89889685ad.33.1778768909608;
        Thu, 14 May 2026 07:28:29 -0700 (PDT)
X-Received: by 2002:a17:903:198c:b0:2b2:57df:264d with SMTP id d9443c01a7336-2bd276d9763mr89888915ad.33.1778768908917;
        Thu, 14 May 2026 07:28:28 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05ffbesm28566485ad.27.2026.05.14.07.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 07:28:28 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 14 May 2026 19:55:50 +0530
Subject: [PATCH v22 09/13] mfd: psci-mfd: Add psci-reboot-mode child cell
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-arm-psci-system_reset2-vendor-reboots-v22-9-28a5bde07483@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778768806; l=2150;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=qY5ZcIM5rzFihKNnoujQTEksmxgJGl5ic/lCFibX6G4=;
 b=AsfuP37SwpufjnSF40KcN6LpuME+xnY+R0MQ14SYIMGvMHlu2Pwe3lLn3lm1X4iWvkci3GH2i
 IRF/AV0XpY3D8SsYxoOayVLFsJWfiPo4qH0uHWQ5tiisSVrbhHY/E5V
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0NiBTYWx0ZWRfX3HUiu9cpgRi7
 /YjttglIXZtxYQFMO/cJg0UX1uXXkJUZMh7F0z3czjHBJIacslR064KCpO8M/wnYIG+P+2HUrQG
 B2dqlalcscSTM6gurjXoK/DBYIXRh2YSM68s7UAsx+YoagPVEO4BLTUlYgkU5QR9tT/vzO1rhYR
 hWlEU5iBjVulJX+fTeLS3juQKvukQjVno4VH0Pxx3r31zsK4ydWrRdigpNM0PcWX5Ww6ZGmoH0N
 xKaV1lXTI9crF2AvaiqXt3fLkW4M2SC+3Je2vKPpX6lDx4xf4aV120sTiSeb/367s2kx59MGtUz
 QyLazEzQsgI3hXK5tFeO44Fv3H66RenCYapqmKhGmOFE/lkBfFojfsVmdU77A6lob5oy9/sazM7
 3diFxT2tZ00p1ys+HpCiXr99JtXdvVUtk2vbvLzxs+Cu5TLucPqsWrlpX0S0dPQ05PCUY/eSMGB
 UAPscBGbZgbRZMuGf9Q==
X-Proofpoint-ORIG-GUID: B1_tJy0y7F44o3dvaiAu5rCl_zBNw9rh
X-Authority-Analysis: v=2.4 cv=N6AZ0W9B c=1 sm=1 tr=0 ts=6a05dc0f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=wFQm1DtpZAjkPzv8fpkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: B1_tJy0y7F44o3dvaiAu5rCl_zBNw9rh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_072832_168451_61404E95 
X-CRM114-Status: GOOD (  20.82  )
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

Add the psci-reboot-mode child cell to the psci-mfd driver and associate
the reboot-mode node as its firmware-node.

Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/mfd/psci-mfd.c      | 18 ++++++++++++++++++
 drivers/power/reset/Kconfig |  2 +-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/psci-mfd.c b/drivers/mfd/psci-mfd.c
index 7affd6bb09dd83452664edeccb09290fe4f43186..852d8e294a438d4ee6789c556d16a83739af2013 100644
--- a/drivers/mfd/psci-mfd.c
+++ b/drivers/mfd/psci-mfd.c
@@ -7,11 +7,29 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
+
+static struct fwnode_handle *psci_reboot_mode_get_child_fwnode(struct device *parent)
+{
+	struct fwnode_handle *fwnode;
+
+	fwnode = fwnode_get_named_child_node(dev_fwnode(parent), "reboot-mode");
+	if (!fwnode_device_is_available(fwnode)) {
+		fwnode_handle_put(fwnode);
+		fwnode = NULL;
+	}
+
+	return fwnode;
+}
 
 static const struct mfd_cell psci_cells[] = {
 	{
 		.name = "psci-cpuidle-domain",
 	},
+	{
+		.name = "psci-reboot-mode",
+		.get_child_fwnode = psci_reboot_mode_get_child_fwnode,
+	},
 };
 
 static int psci_mfd_probe(struct platform_device *pdev)
diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index d9d1f768b8691abc3b32f2675519f2ddbaf19b84..79559206d5852ae5eae4c8eb2c390901cea7531c 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -350,7 +350,7 @@ config NVMEM_REBOOT_MODE
 
 config PSCI_REBOOT_MODE
 	bool "PSCI reboot mode driver"
-	depends on OF && ARM_PSCI_FW
+	depends on OF && ARM_PSCI_FW && MFD_PSCI
 	select REBOOT_MODE
 	help
 	  Say y here will enable PSCI reboot mode driver. This gets

-- 
2.34.1


