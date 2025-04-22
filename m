Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C36BC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 00:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ppfOZ3b4VAis2haDcJCJJLYqMkr6zwiaDTGpizkuOXE=; b=gLYTpJymrjn9z7HLicc2Mv+wc4
	bQVApvIwflR/lgcyWC49n20FYYqj0O6ORyuId0VkdvZEoP6DikYLQvcywIgKNt4tZE5b823ZhvYon
	GYEQ5y5HfH9raj6vkfGktRjpBdpfR/ZTCK1T+vVzS6Zxc+SAJz5+mYKuuIZGh+UFG8Vrkdr23ulil
	teBvAu7rXPSkWKUUnlWQkaNtE1QtpXk/hW8NPiR+lggim23GXIIBujUB83lZ+qfCq3PKsI604t3iI
	VzpCmxBMnMODB0SgfoxEmnYztV/jxTz/Ph3cUS3LLDMAUH6ORxgvJHo5j1RsD61/bmgHZrTtmFpJG
	FGjVsZUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u71Ep-00000005RqJ-1SER;
	Tue, 22 Apr 2025 00:11:47 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u71C3-00000005RSC-47G9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 00:08:57 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53M08qBJ1768572
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 19:08:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745280532;
	bh=ppfOZ3b4VAis2haDcJCJJLYqMkr6zwiaDTGpizkuOXE=;
	h=From:To:CC:Subject:Date;
	b=ZVVyCv95JQTAWUYI2XMDMCjEsjK9tyuZv4sI+TfqRw/stNqtMWLBWXcUvp8vbBeoG
	 4W27KiS4IlgYLverNbiKBzD+kuiYih8qPyFgM8wuM35JzyFlkjfeG7n5fQrpmg45of
	 2R2a3b8s6wbuMQsGBGdlNuI+XiyzuEnQFrPgFXVM=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53M08qen102104
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 19:08:52 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 19:08:52 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 19:08:52 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53M08pDE065170;
	Mon, 21 Apr 2025 19:08:51 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/3] Enable PWMs
Date: Mon, 21 Apr 2025 19:08:48 -0500
Message-ID: <20250422000851.4118545-1-jm@ti.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_170856_066050_3A15AF5B 
X-CRM114-Status: UNSURE (   7.00  )
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

This patch series enables PWM signal outputs on am625 SK,
am62 lp SK, am62a7 SK, and am62p5 SK boards.

For am625 SK and am62 lp SK, add pinmux, eCAP, and eHRPWM
nodes in the k3-am62x-sk-common.dtsi so as to not duplicate
nodes in the board files.

Judith Mendez (3):
  arm64: dts: ti: k3-am62p5-sk: Enable PWM
  arm64: dts: ti: k3-am62a7-sk: Enable PWM
  arm64: dts: ti: k3-am625-sk: Enable PWM

 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts       | 40 ++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts       | 54 +++++++++++++++++++
 .../arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 40 ++++++++++++++
 3 files changed, 134 insertions(+)

-- 
2.49.0


