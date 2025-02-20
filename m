Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F34C021B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 23:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qHxXlJmqY7Qeoukk/Mug5bbyhZku9Mld84zeeuVZBss=; b=ntVzAL5sMCYfTPm0LNcmTwL8WC
	mLF2uhnNlWrZNoIx8E+35W4JDb+5XU/i8VsBvqw9/68LhYjdCnx9SBhVm8r4dqR30wnQclbeHsvzV
	LaalIsbrlK3q6G01DePHGxq09zSw3PR+wy/vJHel/NXks8A5df34/4Mx+wlGcV6+NNJW3YRV3ZJvn
	tQEwyfg8mI/QlYL6Oojywg4mBK3JnyuDQXxbsACsdfc5Or9nFjbka5mEwRt8xPddhq9EL1lCAoQzc
	0dGkKJC5nrUL5N3p4PvqLDfNWxDSFmjr4QmBBkMzXujmL+Vkgknweam4lzoXUHE89gvKMt4bcPcoE
	xmHFPHHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlG1L-00000003KkX-21k9;
	Thu, 20 Feb 2025 23:31:55 +0000
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlFvG-00000003J5B-1Hvv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 23:25:39 +0000
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KL98lf029271;
	Thu, 20 Feb 2025 15:25:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=qHxXlJmqY7Qeoukk/Mug5bb
	yhZku9Mld84zeeuVZBss=; b=U6M0fEFVS6NrWzJKPpEFRQM/dKtrZnJmQtiGvKM
	6c3eB1fCvZZCBnhmPPL023tV7VO/ej7phAmFhmU+D2CEo641XQpqCrjkXyz94HzY
	QP1VWpFDfFD0xBblYgERQiDGiMa8s0ofTkkzsn0KfWztB4jVFFagaHa/JTvnZz7I
	3D+BnJg5pWUmKhxvQW4rn7CcsOlfHMdPF6rF4iXNzsMi51dbQbzA696zZdnJ2vY+
	XWwxBWCAc8G1DLsMrw6MnQ+7DZyCrhrGHlmKJ4c1LtuGYpvSCNc7JQwdCwa2nl5d
	t2TalQ1tIoVNmxXe4IhVtsNGOoS8zoCPfh1VQcpC0vTOFOQ==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 44xc24r915-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 15:25:31 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 20 Feb 2025 15:25:29 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 20 Feb 2025 15:25:29 -0800
Received: from wd-ubuntu-24-04.marvell.com (wd-ubuntu-24-04.marvell.com [10.111.132.113])
	by maili.marvell.com (Postfix) with ESMTP id A3C435B692D;
	Thu, 20 Feb 2025 15:25:29 -0800 (PST)
From: Wilson Ding <dingwei@marvell.com>
To: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC: <andrew@lunn.ch>, <gregory.clement@bootlin.com>,
        <sebastian.hesselbarth@gmail.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <salee@marvell.com>, <gakula@marvell.com>,
        Wilson Ding <dingwei@marvell.com>
Subject: [PATCH v2 0/4] Add Armada8K reset controller support
Date: Thu, 20 Feb 2025 15:25:23 -0800
Message-ID: <20250220232527.882888-1-dingwei@marvell.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: HWBi2PcT7VOYBMInwbzQhadaooHUw8wX
X-Proofpoint-ORIG-GUID: HWBi2PcT7VOYBMInwbzQhadaooHUw8wX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_09,2025-02-20_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_152538_469954_91623097 
X-CRM114-Status: GOOD (  14.50  )
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

Wilson Ding (4):
  dt-bindings: reset: Add Armada8K reset controller
  dt-bindings: cp110: Document the reset controller
  reset: Add support for Armada8K reset controller
  arm64: dts: marvell: cp11x: Add reset controller node

 .../arm/marvell/cp110-system-controller.txt   |  43 ++++
 .../reset/marvell,armada8k-reset.yaml         |  45 ++++
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi |   6 +
 drivers/reset/Kconfig                         |  12 ++
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-simple-syscon.c           | 195 ++++++++++++++++++
 include/linux/reset/reset-simple.h            |   3 +
 7 files changed, 305 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/marvell,armada8k-reset.yaml
 create mode 100644 drivers/reset/reset-simple-syscon.c

-- 
2.43.0


