Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4D4C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 11:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LNMTaDoZOlzVn3fThn2AT/sDwHK58mLK2vG4Ir0w4rU=; b=nlZGkm3yu9sxP7Jfs9HPjsy7ag
	o1hq22tTQbZklfqXclcqY8vEb2xmJ4dY4D3mgFvOytEmvmx/N/PNiMMXb0GmGlvcEx1WxCgmWtYAZ
	zrb1Wp9DTshQfTMX6deW/ynhfbwiUgluhn6vDOuY9VYNdnXs4Kh/kWfLcBLAS6gqbqQ2B0fFiDsa0
	/S8RamvBi5BRL9w7GoSq15LQBZq/5QuyqChJJ9zz3qL5w6rHqcZyMW3NtKnwYEMU+vOB3A/lnfsBh
	q7w5p1q+0dKWcjYMLS7vHLyC1gbZy5E3Yp0Ea1S1QQUnnjp88PPQ8yZV3y7rsdj4PlWW2zt5Pk5Jf
	2H2t7DPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU27O-00000005Sh3-0e51;
	Tue, 24 Jun 2025 11:47:14 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU1IH-00000005McL-0GyD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 10:54:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1750762465; x=1782298465;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LNMTaDoZOlzVn3fThn2AT/sDwHK58mLK2vG4Ir0w4rU=;
  b=BQrUqd8BmwYQKVdg2VpNhQ1d7S9JwvIhrZVod52/3SWujJ26rbXmKSnA
   J5/6VHqjl1XcQ7sbRT/N5lNe/3rdrwA5Y3/9FmYULXHCWd9jV+v3+Vg94
   hGkAd2RCO7UHCLjp/IVGNkPWB2Rm7q4YdL2CEr2pcSDXXTdWTl5HS7qBG
   orl7n6pCWOjHJhkFFO8L49mdpTM5xfFR8vSdeu3XtRQhtGNBDUgnCL4y4
   a+gunzhuR/7wWPxWlJpwV9mT/tnapaSnPv275ggquWtVrLF7CzbH6dwD5
   8RuZa/rQVtLA7+dLAIfTcuejEpNYSsuqckvQ/3tJfLYep/tiMuMxcxLKz
   w==;
X-CSE-ConnectionGUID: XNJw146vS0S96A/0Nhey9g==
X-CSE-MsgGUID: XYPmM7QWQlSUiFR7VllvFQ==
X-IronPort-AV: E=Sophos;i="6.16,261,1744063200"; 
   d="scan'208";a="44816885"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 24 Jun 2025 12:54:22 +0200
X-CheckPoint: {685A83DE-2C-B72BD212-DAE8BA0F}
X-MAIL-CPID: A72EB87A374EF68D021090087AE03C24_1
X-Control-Analysis: str=0001.0A006375.685A83EC.0004,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9384116423B;
	Tue, 24 Jun 2025 12:54:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1750762458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LNMTaDoZOlzVn3fThn2AT/sDwHK58mLK2vG4Ir0w4rU=;
	b=saOa8bYqz49bPCywbHMDxBDmgEkl/9wgRYj/qEDSmQOU4uM2DBolqjUuAWtcnTbyC1Ahzz
	2MniU12XGqOGT9khFu2JtBdtDeWha8crh1JMQN7IpTpPo+khBkmuOIN/BVxhHxz40xF5YW
	KXSKGAn3yyfzyk1ZD2Qe/hVu2eHf0qpkkrgCkBjX2ypGxz8Qj27SiUB5mslwISenZ3uu+K
	GFcmB/zOURYTVtv2oP8Id5nNkbBIMPeQz+wxaYqEPvfGLGZSofRA3Vmnhld/2FtMjOsXTv
	fzfk61lQKdOUCs5BzayybDhxhSdA9X5LTKe0EjRskLuA0tNiEVcMZ/0EgxwKXA==
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
Subject: [PATCH net-next v2 0/3] Follow-up to RGMII mode clarification: am65-cpsw fix + checkpatch
Date: Tue, 24 Jun 2025 12:53:31 +0200
Message-ID: <cover.1750756583.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_035425_588280_9C677A9E 
X-CRM114-Status: GOOD (  12.21  )
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

Following previous discussion [1] and the documentation update by
Andrew [2]:

Fix up the mode to account for the fixed TX delay on the AM65 CPSW
Ethernet controllers, similar to the way the icssg-prueth does it. For
backwards compatibility, the "impossible" modes that claim to have a
delay on the PCB are still accepted, but trigger a warning message.

As Andrew suggested, I have also added a checkpatch check that requires
a comment for any RGMII mode that is not "rgmii-id".

No Device Trees are updated to avoid the warning for now, to give other
projects syncing the Linux Device Trees some time to fix their drivers
as well. I intend to submit an equivalent change for U-Boot's
am65-cpsw-nuss driver as soon as the changes are accepted for Linux.

Changelog v2:

- Previous patch 1/4 has been dropped, has it has been replaced by [2]
- Patches 1/3, 2/3: collected review and ack tags
- Patch 3/3:
  - Fixed multiple typos noted during review
  - Extended to check .dtso in addition to .dts and .dtsi
  - Changed CHK() to WARN(), so the warning triggers without --strict

[1] https://lore.kernel.org/lkml/d25b1447-c28b-4998-b238-92672434dc28@lunn.ch/
[2] https://lore.kernel.org/all/20250430-v6-15-rc3-net-rgmii-delays-v2-1-099ae651d5e5@lunn.ch/
    commit c360eb0c3ccb ("dt-bindings: net: ethernet-controller: Add informative text about RGMII delays")
Patch series v1: https://lore.kernel.org/all/cover.1744710099.git.matthias.schiffer@ew.tq-group.com/


Matthias Schiffer (3):
  dt-bindings: net: ti: k3-am654-cpsw-nuss: update phy-mode in example
  net: ethernet: ti: am65-cpsw: fixup PHY mode for fixed RGMII TX delay
  checkpatch: check for comment explaining rgmii(|-rxid|-txid) PHY modes

 Documentation/dev-tools/checkpatch.rst        |  9 +++++++
 .../bindings/net/ti,k3-am654-cpsw-nuss.yaml   |  2 +-
 drivers/net/ethernet/ti/am65-cpsw-nuss.c      | 27 +++++++++++++++++--
 scripts/checkpatch.pl                         | 12 +++++++++
 4 files changed, 47 insertions(+), 3 deletions(-)

-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


