Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FA3C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 07:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RyhhKHcQn/OtgTmNOO+AF/jrAuW0rpCyeN4utPF33Kc=; b=oEeHoMbr3R/ENY/RZnkbsKb9gR
	qZMOuAlol0aaiWXooP04N3KgPyYSh7jr06QUanqcusbpHeaqqsxisbYqMr6m2mSRJeygsytfPR19e
	bprg2us5N9CkV+bmKtlvdl88WHXGQMI/vAvWuNb/+sHd7vkRoQQDy1tgrs4ShGVwGI3bJ0gYo8r0A
	e7uzNs4Yx/JefNTw/HevwxdrFqhboQ/8xnZKgaHsgdYBMb0agK6BurOAGZ/los4Z4Tq1pv0ZJ8KnV
	bE+n5Kuw5e3rhfhubO0ZfFsYzPUDGB24DwonaC/1nvH4XK4r1X+WWzG6JUYl3TIw0MN7Jz8UoGgq6
	nIM0Z+sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9fSQ-00000008laF-1ZHy;
	Tue, 29 Apr 2025 07:32:46 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9fMq-00000008kVK-1M8i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 07:27:01 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53T7QlpD3785291
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 02:26:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745911607;
	bh=RyhhKHcQn/OtgTmNOO+AF/jrAuW0rpCyeN4utPF33Kc=;
	h=From:To:CC:Subject:Date;
	b=deKrmW0CpxxomB5UltntmFvpnqIFK7vxG9so3tJrwKj3hGGJN8Ld/vxMr3n/aEZT2
	 vktX/z50+bfRE7UUFpkGBrE+IjvGT0xnz/IiS6wNnp7zIaAynmeEXXCW2esskFYDv0
	 NehrjlZrn5ddm+QmxIU5fcdKihJHgBRGpkFirKRU=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53T7QlEE026072
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Apr 2025 02:26:47 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Apr 2025 02:26:46 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Apr 2025 02:26:46 -0500
Received: from localhost (chintan-thinkstation-p360-tower.dhcp.ti.com [172.24.227.220])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53T7QjXR088302;
	Tue, 29 Apr 2025 02:26:46 -0500
From: Chintan Vankar <c-vankar@ti.com>
To: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon
	<nm@ti.com>
CC: <srk@ti.com>, <s-vadapalli@ti.com>, <danishanwar@ti.com>,
        <c-vankar@ti.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v4 0/2] Add bootph-all property to necessary nodes to enable ethernet boot for AM68-SK, J722s and AM62p-SK
Date: Tue, 29 Apr 2025 12:56:42 +0530
Message-ID: <20250429072644.2400295-1-c-vankar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_002700_461751_45B0E0AF 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
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

This series adds bootph-all property to necessary nodes to enable
ethernet boot support for AM68-SK, J722s and AM62p-SK.

This series is based on linux-next tagged next-20250428.

Link to v3:
https://lore.kernel.org/r/20250425051055.2393301-1-c-vankar@ti.com/

Changes from v3 to v4:
- As per Nishanth's suggestion, moved nodes which require "bootph-all"
  property into board specific file for AM68-SK.

Chintan Vankar (2):
  arm64: dts: ti: k3-am68-sk-base-board: Add bootph-all property to
    enable Ethernet boot
  arm64: dts: ti: k3-am62p*/k3-j722s: Add bootph-all property to enable
    Ethernet boot

 .../boot/dts/ti/k3-am62p-j722s-common-main.dtsi      |  3 +++
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts              |  2 ++
 arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts     | 12 ++++++++++++
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts              |  3 +++
 4 files changed, 20 insertions(+)

-- 
2.34.1


