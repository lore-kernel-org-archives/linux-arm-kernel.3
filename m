Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00659C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 22:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=56/5vHlRQhs2KHy6c7TwLs7I1huG9qnDGRRTJ4lHJyo=; b=w0hGfoW6Bgl0F8lyTg1+TOH28y
	ULL+YyAHCl+UMbPeBwD0/3FDptcedUpoH8jyuO7P6KFpk+n0GhF/ZmZ54Z3LnCb+XeRyn0xrX7jJs
	vZeXvpfZlIHIegHAryC00uZilAw9sSx55OZSxVWO7Oyy6ioSlCYWmfA1xpHVf8eHTBERNQRActMSM
	lGajZDxfgUmLdz8OcnjLL1HrWcJQfMmEoR7TcTTng94TWjxx56peBLADV6bicsu2MSterzwNoXlGJ
	UZ1ckB7TJiTisw7hyjazSibeOtYOKQdiDvFSMt+CzIE2Ej2R4SyMdYFyyyv0QUy5CTjumCykiuguz
	GYM+IsCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdz6a-0000000BWSO-0M3F;
	Fri, 31 Jan 2025 22:03:16 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdyqA-0000000BUbV-0TjO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 21:46:19 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50VLkCfI2601806
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 15:46:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738359972;
	bh=56/5vHlRQhs2KHy6c7TwLs7I1huG9qnDGRRTJ4lHJyo=;
	h=From:To:CC:Subject:Date;
	b=KPorOKIu0ycr0dvP19Qqdeypc87+c8bGFRc/yaNc+s/CIHIoO56Dp0j4Zhoo9G9Bv
	 1G+qUNJss4PJWeV0qEO1cPgqvisHMu0HL3L4MN5zy0NpybLn50fjdnTmgQXc3uOaLL
	 9WYa7tuA+tc3sDidsr6MyqVW9bdhXJBvmfPhJZ9c=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50VLkC6a024695
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 31 Jan 2025 15:46:12 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 31
 Jan 2025 15:46:11 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 31 Jan 2025 15:46:11 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50VLkBCv082734;
	Fri, 31 Jan 2025 15:46:11 -0600
From: Judith Mendez <jm@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis
	<afd@ti.com>,
        Hari Nagalla <hnagalla@ti.com>, Judith Mendez <jm@ti.com>
Subject: [PATCH v2 0/9] Add R5F and C7xv device nodes
Date: Fri, 31 Jan 2025 15:46:02 -0600
Message-ID: <20250131214611.3288742-1-jm@ti.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_134618_274755_3AED15DB 
X-CRM114-Status: GOOD (  11.01  )
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

For am62x and am62ax devices, this patch series adds device nodes
for the R5F subsystem and C7xv DSP subsystem found in their
respective voltage domain, based on the device TRMs [0][1].

This patch series also includes patches for enabling IPC for am62x,
am62ax, and am62px by reserving memory and binding the mailbox
assignments for each remote core.

Also reserve main_rti4 and main_timer2 for the C7x DSP as per
firmware requirements.

Changes since v1:
- add patches 5-9 to enable ipc and complete device nodes
- disable each device node in the voltage domain files and
  enable at the board level file
- fix firmware names

[0] https://www.ti.com/lit/pdf/spruj16
[1] https://www.ti.com/lit/pdf/spruiv7

Devarsh Thakkar (3):
  arm64: dts: ti: k3-am62a-wakeup: Add R5F device node
  arm64: dts: ti: k3-am62a7-sk: Enable ipc with remote processors
  arm64: dts: ti: k3-am62p5-sk: Enable ipc with remote processors

Hari Nagalla (5):
  arm64: dts: ti: k3-am62-wakeup: Add wakeup r5f node
  arm64: dts: ti: k3-am62a-mcu: Add R5F remote proc node
  arm64: dts: ti: k3-am62x-sk-common: Enable ipc with remote processors
  arm64: dts: ti: k3-am62a7-sk: Reserve main_timer2 for C7x DSP
  arm64: dts: ti: k3-am62a7-sk: Reserve main_rti4 for C7x DSP

Jai Luthra (1):
  arm64: dts: ti: k3-am62a-main: Add C7xv device node

 arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi    | 25 ++++++
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi     | 12 +++
 arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi      | 38 ++++++++
 arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi   | 25 ++++++
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts       | 88 +++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts       | 50 +++++++++--
 .../arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 32 +++++--
 7 files changed, 259 insertions(+), 11 deletions(-)

-- 
2.48.0


