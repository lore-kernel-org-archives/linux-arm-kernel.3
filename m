Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49EEE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 21:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O0iJpfr132f+XUsNEv0Nw3kBjj9h/tNGsFdXnT0fSYI=; b=3xVtVt2fknVKiPBgyfWP5iM0j7
	nJFvYIcqP5yAKfo4KT3qXEmtG2dtMB7APzeR3o1jAkKmqreVYk6y5xTtkprMayvlrwu7ugtU8xCvu
	BoyjAWFz8O7xTyaP81ivOTFlw6t6K+HgqvevF+CEZonAsNDG6vcOwBNwWX5Mfn1fjWDr7AimH/L6l
	o1+enPUbEFSwm8buXJm+L4v4V0SfQ2JnR4/UekgxvTjzbP2ZohbJZzZg3ipDFC/42cA2WiWJHc22T
	6+Kq/ywzEHP6DpKkA3HNlj+6IVw0JKNXHE2B8Xt989mU6NwJ9xxTu0SttwbUCnnrOHZFFhujyIKM6
	4o/2brbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL7Ot-0000000Cl8v-1sqc;
	Tue, 10 Dec 2024 21:04:11 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL7KZ-0000000Ck80-2Z83
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 20:59:45 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BAKxWqL2984166
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 10 Dec 2024 14:59:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733864372;
	bh=O0iJpfr132f+XUsNEv0Nw3kBjj9h/tNGsFdXnT0fSYI=;
	h=From:Date:Subject:References:In-Reply-To:To:CC;
	b=EkmjFN0mmfajeOwu2XwM21QCYM2i+FVQDBmbrfuNGAGHfCICYVksCzGGhA1ZuAQq2
	 PGzz6qEwZ0S6jXkQorXyC+I4Sqom0yBXZq6GWJ3yiM2PfZXtG0yr4h3MQIHTAwttX7
	 mYUoKiZo5tfjJePlNxj6zdPeYLdnJkIGItObCdEg=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BAKxWIT043829;
	Tue, 10 Dec 2024 14:59:32 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 10
 Dec 2024 14:59:31 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 10 Dec 2024 14:59:31 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BAKxVle100283;
	Tue, 10 Dec 2024 14:59:31 -0600
From: Bryan Brattlof <bb@ti.com>
Date: Tue, 10 Dec 2024 14:59:24 -0600
Subject: [PATCH 1/2] arm64: dts: ti: k3-am62: remove duplicate GICR reg
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241210-am62-gic-fixup-v1-1-758b4d5b4a0a@ti.com>
References: <20241210-am62-gic-fixup-v1-0-758b4d5b4a0a@ti.com>
In-Reply-To: <20241210-am62-gic-fixup-v1-0-758b4d5b4a0a@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Bin Liu <b-liu@ti.com>,
        Bryan Brattlof
	<bb@ti.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=939; i=bb@ti.com;
 h=from:subject:message-id; bh=Z6TrSCMqbMcQVffARb+h+rS3MaWBdwEX6yBNrQmJbTg=;
 b=owNCWmg5MUFZJlNZTCxWfwAAaf///vfr/308v7+Rz+Nf8t9/stS//dd/+9bf0/w/k/xxq88wA
 RmwIekAAA0DTQYQaDIMgGho0DIAyaAAyDRoGg0yMgDBMQGhoPRDE0NNpMyRBoADQGRoNGQBoyaA
 wmQMQAAaGmCYmmAEaNNoIDQNMIDCZA0AaGg0B002iYmIaNGIaNBpppkPU0aAaAyAyZAwQAYmQyA
 AGgAGmmmQGRk0PSBoaDQAA2hrmxZQiusFQ/EQzYkIFawMjDUkUHzJMiG9yDwMyD5CD5oLx9KAz/
 nBHnVXNiq8tqoNyoALsd5q9GR70ITApabdoR7E1UlEOxywegTMt9m7gZjWc0QgWBe+vQCXUjX7s
 TG3A3++mkGraTNUy4wjZZzAGn0FhwMtsJplsWRA2Ybw0VqSb1bu5j0TNGnTWhBscLIkDlYLJ07y
 NvvBmMkzKw6EYWuC9S1Pqeo7OLV6udLNeR0Secus6dCmPt8mnCQ6wSYA1Su30vl2OAfQIibRsig
 TpkXVKzzgcCebt21CHuD0T0Wa+H4QAgzGgtKTGDCfCstKc4rY0vaKLJQ7384wxcjob+SBZqjXCV
 GGH0ZBipd5pbLwSVSkQPwN65DeuwChKam0L1ON7ipOjAZiFfv3Gbz6QPphFInQ0XN0A8CDfc9qb
 Qvgf8XckU4UJBMLFZ/A
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_125943_761462_52F6448A 
X-CRM114-Status: UNSURE (   9.90  )
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

The GIC Redistributor control register range is mapped twice. Remove the
extra entry from the reg range.

Reported-by: Bin Liu <b-liu@ti.com>
Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
index 7cd727d10a5f2..7d355aa73ea21 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
@@ -23,7 +23,6 @@ gic500: interrupt-controller@1800000 {
 		interrupt-controller;
 		reg = <0x00 0x01800000 0x00 0x10000>,	/* GICD */
 		      <0x00 0x01880000 0x00 0xc0000>,	/* GICR */
-		      <0x00 0x01880000 0x00 0xc0000>,   /* GICR */
 		      <0x01 0x00000000 0x00 0x2000>,    /* GICC */
 		      <0x01 0x00010000 0x00 0x1000>,    /* GICH */
 		      <0x01 0x00020000 0x00 0x2000>;    /* GICV */

-- 
2.47.1


