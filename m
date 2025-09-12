Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F810CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 12:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6scNEiCwQDhpiTGreKSN8tOQ3odhAtWxi6tg8cuj+Pk=; b=26liX7iu4tfZD0M780mM/6/D0y
	3dzW59ejLrWg13pC/fakSJM86uteQBsmbi93jthRmJ23979L5dUvn28E90ifimGz1CJlJBf40C04G
	JMRxJMiS7ne6hqmnuIrFYrHSZAvpuVeYvX+RZwSREtlB1Yx9jwvHuuzwxGP1kPYjXQXCZFs1KVHXf
	0C2wtNyWKhQUeEN/EqomAVlGU9FE/cfzaFIxz465Yxe6tUnlRtlT2KZCqGWgDEgqfHrmwfQz5Ow5h
	oHvg+Pdt0KgVtgzLvJYn7cnyldQqMHrbhgGDusXnm4E3jyIGSWHUv3v6ysb9Kf64zniKwViNd8cQF
	FiSyBy6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux3JE-00000009NnI-0uL2;
	Fri, 12 Sep 2025 12:55:24 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux3JC-00000009Nmh-2QTM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 12:55:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=6scNEiCwQDhpiTGreKSN8tOQ3odhAtWxi6tg8cuj+Pk=; b=KbhEfAN88WcM4pD441bT2l6Pa1
	23flmmlVtXb4d/OfaU+RBRGolmVniBWbCzoiGQUwB5r3WhnnaMr8RYY+D3naKECyvQhkVw817d2iy
	JSzir0qe4MxEkeVAUGhaTAt5ATR9/yj01IeY7UQGzzHX29VdwRSXJ1qS51q44OO2dEmuyO/RMFIOy
	waB+6mwaoGhA/I0K7eh4Dw4Wd3YKU6LgKyjy4h6JWHzJQfn2wi/kWbtv8moGnEuqdKeCCprlJ7D/7
	3hGFjLBh/my8YIFhU8TvsiQJJLAviSSF9zAlwQcLAN6Z93n4TdFBSz2cBSd+WWkWJTN6v7JsU8EXx
	KV5iBH5w==;
Received: from [122.175.9.182] (port=50898 helo=cypher.couthit.local)
	by server.couthit.com with esmtpa (Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1ux3J7-000000025Qs-1rx5;
	Fri, 12 Sep 2025 08:55:17 -0400
From: Parvathi Pudi <parvathi@couthit.com>
To: danishanwar@ti.com,
	rogerq@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ssantosh@kernel.org,
	richardcochran@gmail.com,
	m-malladi@ti.com,
	s.hauer@pengutronix.de,
	afd@ti.com,
	jacob.e.keller@intel.com,
	kory.maincent@bootlin.com,
	johan@kernel.org,
	alok.a.tiwari@oracle.com,
	m-karicheri2@ti.com,
	s-anna@ti.com,
	horms@kernel.org,
	glaroque@baylibre.com,
	saikrishnag@marvell.com,
	diogo.ivo@siemens.com,
	javier.carrasco.cruz@gmail.com,
	basharath@couthit.com,
	parvathi@couthit.com,
	pmohan@couthit.com
Cc: linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vadim.fedorenko@linux.dev,
	bastien.curutchet@bootlin.com,
	pratheesh@ti.com,
	prajith@ti.com,
	vigneshr@ti.com,
	praneeth@ti.com,
	srk@ti.com,
	rogerq@ti.com,
	krishna@couthit.com,
	mohan@couthit.com
Subject: [PATCH net-next v16 6/6] MAINTAINERS: Add entries for ICSSM Ethernet driver
Date: Fri, 12 Sep 2025 18:23:01 +0530
Message-ID: <20250912125421.530286-7-parvathi@couthit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912104741.528721-1-parvathi@couthit.com>
References: <20250912104741.528721-1-parvathi@couthit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.couthit.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.couthit.com: authenticated_id: parvathi@couthit.com
X-Authenticated-Sender: server.couthit.com: parvathi@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_055522_648162_EE2DBA6F 
X-CRM114-Status: UNSURE (   5.25  )
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

Add an entry to MAINTAINERS file for the ICSSM Ethernet driver with
appropriate maintainer information and mailing list.

Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
---
 MAINTAINERS | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c930a961435e..47bc35743f22 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25319,6 +25319,18 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/ti,icss*.yaml
 F:	drivers/net/ethernet/ti/icssg/*
 
+TI ICSSM ETHERNET DRIVER (ICSSM)
+M:	MD Danish Anwar <danishanwar@ti.com>
+M:	Parvathi Pudi <parvathi@couthit.com>
+R:	Roger Quadros <rogerq@kernel.org>
+R:	Mohan Reddy Putluru <pmohan@couthit.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/ti,icssm*.yaml
+F:	Documentation/devicetree/bindings/net/ti,pruss-ecap.yaml
+F:	drivers/net/ethernet/ti/icssm/*
+
 TI J721E CSI2RX DRIVER
 M:	Jai Luthra <jai.luthra@linux.dev>
 L:	linux-media@vger.kernel.org
-- 
2.43.0


