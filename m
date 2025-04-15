Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B642C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 10:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Nb1CaeSyZdwCqAexjrlTSruwnwqmG4LLxlXJojt81rk=; b=k/jaegcs9xanoxsmPk+SebCPzW
	kXSShBpYXW8jIagA6ou/hBB1296BGVvHw9Ss4whF0F+pp1p1yj6eftzZ+/K/5fqyPf/qHQQlWyEMr
	rmIJx1JqggYNW85FFbDcbSIO4xvjTomAMGPDNVxMyZSsEouTLbu6A69YaXLYU3RaPcMTQv8hNxbVZ
	6QvaNuENAJbpNcjWXWojw8uvKe7wcPNfjUbAXYs75z9fJ0JqBRIHjYvtPNSawctGcBp7lkVy2dzR3
	sSiooiFC0Htw4x5LaNnlveChlJkg8if/LdEC966+vCxALJPmCq3t0YTfZ2mRd7iub9nbCRNWuTe6W
	CaE+rOcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4dTH-00000005JzC-1hFz;
	Tue, 15 Apr 2025 10:24:51 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4dNc-00000005IhJ-47gi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 10:19:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744712340; x=1776248340;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Nb1CaeSyZdwCqAexjrlTSruwnwqmG4LLxlXJojt81rk=;
  b=HqmeQ8XfuzytTNcKI8GeFLUfJNL7lSfj6g46scE0AhPZKD+Fi8/wx2QY
   mmEZYzMQeWb2BW5GWeIbuqf1gQG8FupvpDH7MPatibpFtWFXTaJhSL3Lg
   fs8ouAhmjRSVqAF1W7PlOka+WdhqpsM3Kcxy95jArL09rJsTYiKZDJn3T
   rCZO/K3hf+VsF2Y0SDxpmMvnK7BN5WpQNGXgt7xR66BFPZzJzcbTyEotB
   MvjCMQjVPmrsOJyUdiu+1vWqNP1EH5I0SSW3vVtetMJzkY9eeCO3cJtCT
   o696ZYEowgGom7ZhczleUSrJ57Y337hdREGoqbdjMif4I9vBR8EHamXyG
   Q==;
X-CSE-ConnectionGUID: qHslwqOKQDS3n+C1PL8nQQ==
X-CSE-MsgGUID: z5CBpqFHQfidSCZ9bnHD7g==
X-IronPort-AV: E=Sophos;i="6.15,213,1739833200"; 
   d="scan'208";a="43537779"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 15 Apr 2025 12:18:55 +0200
X-CheckPoint: {67FE3290-2D-903EAEAC-E04C76C8}
X-MAIL-CPID: 776D1808CE1E037E8E14824437E2A7F7_5
X-Control-Analysis: str=0001.0A006378.67FE328F.0080,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E105F161113;
	Tue, 15 Apr 2025 12:18:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744712331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Nb1CaeSyZdwCqAexjrlTSruwnwqmG4LLxlXJojt81rk=;
	b=FxbIXQ3HA+sGY8beUPvzMhSf8rVMxH9ihaDwISw58nDj4onHiPYDmzZR3r5FmvyQ0+ryhE
	SPTAUFh5jUFCYhlaUWM0uUeM2ttx8wXnwRF7SAZI50AGPebD5uP+rZ44+XCcghjbAg+3ba
	v/VucSP2xJw4k/hFi8G33/22jbmMOP0XsrRWeID36OjgICE1rfJHeyT6bnivXqmE6aAnmj
	3UggLZoPYk5wHtd9qwIhlbjpv462wNqOLuiXrDRUmMQ2RVE0imOhqc5FRo0BX7se8qW2f8
	IpNo1YCmCWf3g6pjX3ie/lkmJrK59/Ogx8BbITKc/rNhU/FXHqimWAH8vt5Riw==
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Whitcroft <apw@canonical.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Joe Perches <joe@perches.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tero Kristo <kristo@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH net-next 0/4] RGMII mode clarification + am65-cpsw fix
Date: Tue, 15 Apr 2025 12:18:00 +0200
Message-ID: <cover.1744710099.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_031901_532866_7B37EB60 
X-CRM114-Status: GOOD (  15.44  )
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

As discussed [1], the comments for the different rgmii(-*id) modes do not
accurately describe what these values mean. Update the binding
documentation and fix up the mode to account for the fixed TX delay on
the AM65 CPSW Ethernet controllers, similar to the way the icssg-prueth
does it. For backwards compatibility, the "impossible" modes that claim
to have a delay on the PCB are still accepted, but trigger a warning
message.

As Andrew suggested, I have also added a checkpatch check that requires
a comment for any RGMII mode that is not "rgmii-id".

No Device Trees are updated to avoid the warning for now, to give other
projects syncing the Linux Device Trees some time to fix their drivers
as well. I intend to submit an equivalent change for U-Boot's
am65-cpsw-nuss driver as soon as the changes are accepted for Linux.

[1] https://lore.kernel.org/lkml/d25b1447-c28b-4998-b238-92672434dc28@lunn.ch/

Submitting for net-next for now - I don't know it would make sense to
backport some of these changes to stable.

Note: I have also added the maintainers for the TI K3 SoC families to cc
in addition to the get_maintainers.pl output, to loop in some more of
the relevant people at TI. Should MAINTAINERS be extended to include
some of you for the am65-cpsw* files? At the moment, only the netdev
maintainers are reported for drivers/net/ethernet/ti/am65-cpsw-nuss.c
(except for "authored" lines etc.)

Matthias Schiffer (4):
  dt-bindings: net: ethernet-controller: update descriptions of RGMII
    modes
  dt-bindings: net: ti: k3-am654-cpsw-nuss: update phy-mode in example
  net: ethernet: ti: am65-cpsw: fixup PHY mode for fixed RGMII TX delay
  checkpatch: check for comment explaining rgmii(|-rxid|-txid) PHY modes

 Documentation/dev-tools/checkpatch.rst        |  9 +++++++
 .../bindings/net/ethernet-controller.yaml     | 16 ++++++-----
 .../bindings/net/ti,k3-am654-cpsw-nuss.yaml   |  2 +-
 drivers/net/ethernet/ti/am65-cpsw-nuss.c      | 27 +++++++++++++++++--
 scripts/checkpatch.pl                         | 11 ++++++++
 5 files changed, 55 insertions(+), 10 deletions(-)

-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


