Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E58C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L+Ymq3rUGoUbchUwObBot+uZi50aDDGM2O9Rfhoc+HQ=; b=Bf5Q6IUeWT7wY/Hv5IARqBBLyn
	HxrlvDBIJWEP29Cd4jrHK2B1Va17nTsA/nbeN2f2MP0Bno0t8spC/OXRctqZKjnk+eoW5R/nQ87VX
	f9dbeRSYxvPYzAD4tIT9rJEE229B3noYxW/LTiy4ziYylmJODi5X2BvPSmh5CUU0bnthPQcIUEpjV
	8DLHb/hKuXMRuzEuy+4kis0asyr7eaL7ZI27eFlHAqqtgdge0eqUEoDQj/W/ME9ipUSp3yQGljLSi
	IosY8/M8ppOe6crohC3/EUYeRi3Qh5ydcknQsU5dpsnCA3SJ+4BHLIAGWVMfR0et1B1yOIqPhI8et
	X2t+D0Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjnd-00000008fZh-3UAI;
	Thu, 27 Feb 2025 19:44:01 +0000
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjW4-00000008Rzw-0DWo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 19:25:53 +0000
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RFjKPt005358;
	Thu, 27 Feb 2025 11:25:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=L+Ymq3rUGoUbchUwObBot+u
	Zi50aDDGM2O9Rfhoc+HQ=; b=KEn55KSfKjOgs+58LJClx6Gp2al7aRI4Rf0MOEz
	0UpNy8WIyjqnxAO81CTwvEq8noosLoQQgogsrBxKKqHOq3afDOjbW3OrLeyki1hR
	I4lwa/9svz5mbjkUVfZTyGBBSD73TG9v60fcSZ0/O4DbfUP4uAyT+TrHBb16gjAF
	xOSeAPm+yPbftSwuRCQcOlYfjfc+3uffkc3pmhHIevqiqZ4o++PTJ9vAL0cd8coi
	79amE9Pr6sDHr9hSWqHDZSs41h0qB0PkCDyRoD/GYaCgXIMSJGrlcdaokzqTwg9D
	E+NwFd6tUVPZPMv2W/8lbOAGliydm6FkOwrjOudnUJGiSbw==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 452tyjrhbm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 11:25:39 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 27 Feb 2025 11:25:38 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 27 Feb 2025 11:25:38 -0800
Received: from wd-ubuntu-24-04.marvell.com (wd-ubuntu-24-04.marvell.com [10.111.132.113])
	by maili.marvell.com (Postfix) with ESMTP id 1EA733F7079;
	Thu, 27 Feb 2025 11:25:38 -0800 (PST)
From: Wilson Ding <dingwei@marvell.com>
To: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC: <andrew@lunn.ch>, <gregory.clement@bootlin.com>,
        <sebastian.hesselbarth@gmail.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <salee@marvell.com>, <gakula@marvell.com>,
        Wilson Ding <dingwei@marvell.com>
Subject: [PATCH v3 0/3] Add Armada8K reset controller support
Date: Thu, 27 Feb 2025 11:25:33 -0800
Message-ID: <20250227192536.2426490-1-dingwei@marvell.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: -cHPloBC-hxEftL3iYoYFCczjX1kjUaK
X-Authority-Analysis: v=2.4 cv=UIYnHDfy c=1 sm=1 tr=0 ts=67c0bc33 cx=c_pps a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17 a=T2h4t0Lz3GQA:10 a=Jdwyv6mE_Hljsyy0yKYA:9
X-Proofpoint-GUID: -cHPloBC-hxEftL3iYoYFCczjX1kjUaK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_07,2025-02-27_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_112552_095225_7643FF70 
X-CRM114-Status: GOOD (  15.90  )
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

Armada8K has one simple register for unit soft reset, which is part of
the system controller register area. The simple reset code doesn't
support register access via regmap for the syscon devices. This patch
series created a new driver based on the simple reset code, and add
Armada8K support then.

Thanks,
Wilson

---

Changes in v3:
  - Abandoned the use of the 'offset' property to specify the register
    offset.
  - Dropped the changes to 'cp110-system-controller.txt'.
  - Created a new dt-binding head file to define the reset lines.
  - Fixed the errors and warnings reported by dt_binding_check and
    dtbs_check.

Changes in v2:
  - Created a new driver for SYSCON device instead of extending the
    simple reset code.
  - Allow to retreive the register offset from the 'reg' property as
    an alternative to the 'offset' property.
  - Allow to retrevie the register size from the 'reg' property to
    calculate the number of reset lines.
  - Added the new dt-binding files to document the device-tree scheme
    and fix DT check issues.
  - Updated the device-tree node name to 'reset-controller' to follow
    the name conventions.

Changes in v1:
  - Init version.

Wilson Ding (3):
  dt-bindings: reset: Add Armada8K reset controller
  reset: Add support for Armada8K reset controller
  arm64: dts: marvell: cp11x: Add reset controller node

 .../reset/marvell,armada8k-reset.yaml         |  48 +++++
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi |   8 +
 drivers/reset/Kconfig                         |  12 ++
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-simple-syscon.c           | 188 ++++++++++++++++++
 .../reset/marvell,armada8k-reset.h            |  27 +++
 include/linux/reset/reset-simple.h            |   3 +
 7 files changed, 287 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/marvell,armada8k-reset.yaml
 create mode 100644 drivers/reset/reset-simple-syscon.c
 create mode 100644 include/dt-bindings/reset/marvell,armada8k-reset.h

-- 
2.43.0


