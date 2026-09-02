Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70981C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 08:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aDeLBX9QBOTBJ5rFj/dwetIriA6+Uk+oY4WRGgHLJXU=; b=lbVRHh1tZlZxCJYuCLpr4Jq2UF
	/t6GKO4C+0+/UJAagwk/8DNvpJxMUIPOTlFDOXgiKahu2VdILID1Ei7sCS41bxmq1BDrhTglxR+BV
	UgrZAqa1NFmHeMucQioFJQySMm+jr2h+wI86Lt9AHqo8xUGXnWmAGFKbCje4vxrvcZoJXm0JoQUK3
	Y9EjSU8HMuSLItdKe6QV3GOEjt/jlVRL65nhmSxTy3eaHoN3JNLZBKezHNtzLM4KqtGmxB4q0BVQs
	ZPBt5JmaEOpHebOa3ZqV+K3dS2XYhq/3dQ3LI/+uj1mFLMrMfzFe0QFQDgrDsRDVbp/sRsRkWJe4c
	8zH278pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fyI-0000000E15J-3gU4;
	Wed, 02 Sep 2026 08:05:26 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fyG-0000000E11N-0eC9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 08:05:25 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-49b965570d7so5543185e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 01:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788336322; x=1788941122; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aDeLBX9QBOTBJ5rFj/dwetIriA6+Uk+oY4WRGgHLJXU=;
        b=L5e3oD5IxujcU14WQnkkutN7OS7ljNfNyKJUca0GWsE6srZpa1NwAs93lUlWevMR/D
         GLFSjfQCp1nLPBnm3PXiEo+0pkK3S8xg7Xtu3U0V9WmS3xjQasb3pZQHrsBj83/o5P1j
         XDCDaCIkjOsU2A5PLj6/qy4L2mtGU0Cog46YzUFNhUEkLF1n8X1aUAwVz/MvE43Fs95i
         Wfd0m8RB0HJvSRkPZwts4PIC3rqw8btdSsm7Se0Y4/Da4BMcbsAwh7qKgJBU8xiWnH7V
         XYRaF5goUmzQoO6ozbuxqvRTiaTy08+Kx3e4D7svwwJMAQRkak47552kve+WITHJUEE0
         6e2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788336322; x=1788941122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aDeLBX9QBOTBJ5rFj/dwetIriA6+Uk+oY4WRGgHLJXU=;
        b=e2A2Pvyl56t1OTq5pO114Z82sAYqBQDAfiQnZibM3kG8kZs4IGLv5CcOpXqKJ9CdQQ
         05irQY9csOoaZgouBJMidTD4fICed5+5YDntyHVNGD/r7rvhZu1eAoPfO0izJQKLSBVF
         wuan/4NXBVlqhwiJ05to2COKPdFv7ijrF+fSgGisKTeDD8I/+50LJKLe/gJFh1ONtWC/
         mNlXksJlh5900HdBD//qTrZP0ynm6o2P/IPWU+WKZ5gZi5lEWzKirtk9pgx15d11IXSQ
         aKIWL7waAVejrtJrIW2h/gNfbY/P45TPJLoD0EHNPzQUc0THWC/cDXl/QdCbkyYOJHf3
         TksA==
X-Forwarded-Encrypted: i=1; AHgh+RozCGTeg/wYcByOap/FznVQmDl6/iMRuH5Pa+2OeiesTBlKPYPk4uo47bjlGVkv3d7RdD7oQZjcG1pB4Ve2B8vi@lists.infradead.org
X-Gm-Message-State: AFuF++lZ7n4r67pk/uDb6kg0jbnhxiEbvjluViKzwjqrw/cLTDDZg2Qr
	FvcI3A13CbCs3R9pnQ4Q/e7kg7Baujua5JRZtp+lsV4eH7O2xxYhuAnu89I6jADh3cs=
X-Gm-Gg: AR+sD12N3gaXYThU/F7UgwPxmD8tfYgJGyxaY37JAy4R48SubJg8BOh2E3f65mo9yNF
	ZsKbP/LG+sfKbwg3QDDwhrfN46IMK/sDCC5Phs0Qf1HQkGc33BI4XmLXiRT3rDw3yu8RNFzGGP8
	s0J+eXS6Lrlb79XMrTAZ5uanvYK7UGvLLlN3Rjywb49rSSmRG97DUDDD8h80Y5wuhd0uVPhDeJI
	rrMRmhW/3WElHJ0C5HlZJ/WtEaMWglU4ZWhy7R1+NJ8PIl2k6mDNWyky9RiD1YZMCkn7qKqNSPp
	zuxM+IPOUeRuJMnfCsS0B+sGTb8bTy21Tb/f6e00aQ1nf9eEjSf6gaWAvYpqZSOwh+EIo5DdADO
	2UwQYESFaiGDfeV5VmAu++mmItzPfB1dKcB02nvH6/SQyO8yF6fav5O10OZCCjDKaCJctHbqQoR
	zDNVslVU6MuwCgr5GbyReB4hfLxQBQH/pufILj2jUeqpXQLpc/UQ==
X-Received: by 2002:a05:600c:4e93:b0:499:cd34:100d with SMTP id 5b1f17b1804b1-49ce57f5235mr48830435e9.7.1788336322158;
        Wed, 02 Sep 2026 01:05:22 -0700 (PDT)
Received: from remote-01 ([84.17.55.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce309e418sm72781715e9.13.2026.09.02.01.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 01:05:21 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	andrew@lunn.ch,
	olteanv@gmail.com,
	nbd@nbd.name,
	lorenzo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org
Cc: linux@armlinux.org.uk,
	dqfext@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net v4 0/2] net: restore EEE on MediaTek switches and SoC MACs
Date: Wed,  2 Sep 2026 08:05:17 +0000
Message-ID: <20260902080519.2211373-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_010524_249072_5C4A08FE 
X-CRM114-Status: GOOD (  19.55  )
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

Both drivers fill in phylink_config.lpi_capabilities and
lpi_timer_default but never lpi_interfaces. phylink treats a MAC as
supporting managed EEE only when the tx_lpi methods are implemented and
BOTH bitmaps are non-empty, which phylink_create() decides once and for
all, so EEE has been off on every mt753x port and on every mtk_eth_soc
MAC that uses mtk_phylink_ops since the two commits named in the
Fixes: tags. Because the tx_lpi methods ARE implemented, phylink takes
the other branch and calls phy_disable_eee(), which fills
eee_disabled_modes - so userspace cannot enable EEE either.

On an MT7981B board with an MT7531 switch, before these patches:

  == lan1
  Cannot get EEE settings: Not supported
  == lan2
  Cannot get EEE settings: Not supported
  == lan3
  Cannot get EEE settings: Not supported
  == lan4
  Cannot get EEE settings: Not supported
  == wan
  Cannot get EEE settings: Not supported

lan1-3 are the MT7531 internal PHYs, lan4 is an EN8811H on switch port
5 whose MAC side runs 2500BASE-X rate matched to a 1 Gbps media link,
and wan is the mtk_eth_soc MAC with its directly attached 1 Gbps PHY -
so both drivers are covered.

Each patch fills lpi_interfaces from supported_interfaces and leaves
2.5 Gbps out of both bitmaps for now. LPI above 1 Gbps is unvalidated
rather than unsupported: both MACs fold 2.5 Gbps onto their 1 Gbps
speed encoding, so the 1 Gbps EEE force bit is what would govern it.
MediaTek's SDK driver sets the force bits for 100 Mbps and 1 Gbps only,
EEE signalling on 2500BASE-X is outside 802.3, and the 1 us unit of the
wakeup timers is undocumented at 2.5 times the port clock.

The SoC MAC patch fills lpi_interfaces only on SoCs carrying a new
MTK_GMAC_EEE capability. mtk_mac_enable_tx_lpi() programs wake-up times
taken from MT7531's reset values, and the capability marks the SoCs
where those have been measured to work: MT7981 for now. The others keep
today's behaviour, EEE unreachable from userspace, until someone with
the hardware confirms them.

Neither driver sets eee_enabled_default, so LPI stays off until
userspace asks for it with ethtool --set-eee. The EEE advertisement is
a different matter: phylink stops force-clearing it, so a PHY that
advertises EEE out of reset advertises it again and the link may
negotiate EEE, without this MAC asserting LPI. MT7531's internal PHYs
and EN7528 are the exceptions, for the reasons in patch 1. Devicetree
eee-broken-* marks act at the PHY level and keep working, so a board
that already distrusts its PHYs stays protected: OpenWrt marks all
modes broken on MT7621's internal PHYs.

The two patches are independent and touch different subsystems; they
are sent together because they are the same bug.

Targeted at net as a regression fix with an active userspace lockout;
can be retargeted at net-next if maintainers prefer.

Based on net-next at 91ec20351349. All three files touched are byte
identical in net/main and the series applies there unchanged.

After the series, all five ports report:

  EEE status: disabled
  Tx LPI: disabled
  Supported EEE link modes:  100baseT/Full
                             1000baseT/Full
  Advertised EEE link modes:  Not reported

No 2.5G mode is offered, which is the narrowed lpi_capabilities, and
nothing is advertised until userspace asks. On this board no PHY came
out of reset advertising EEE, so the case where the advertisement
returns once phylink stops clearing it is not exercised here.

Enabling it on lan1, whose partner advertises EEE at both speeds:

  # ethtool --set-eee lan1 eee on
  EEE status: enabled - active
  Advertised EEE link modes:  100baseT/Full 1000baseT/Full
  Link partner advertised EEE link modes:  100baseT/Full 1000baseT/Full

  # ethtool --set-eee lan1 eee on tx-lpi on
  EEE status: enabled - active
  Tx LPI: 30 (us)

With LPI armed, 30 parallel ICMPv6 streams of 1400-byte payload, 300
packets each one second apart - so every gap crosses the LPI threshold
and the link enters and leaves LPI thousands of times over 300 s - lost
nothing: 300/300 on every stream, tx and rx error counters unchanged,
carrier_changes unchanged, and no mac_enable_tx_lpi errors in dmesg.

On wan, cabled for this round to a partner that advertises EEE (a
BCM5720), the MT7981 GMAC's own LPI was exercised. With tx-lpi armed
the wan PHY's MMD 3.1 reads 0x0f44, Tx LPI indication set, so the MAC
is asserting LPI; it drops to 0x0044 with tx-lpi off and comes back
with it on. The same 30-stream test at 1 Gbps lost nothing over 9000
packets with the link cycling through LPI at every 1 s gap. At
100 Mbps the only losses were the first packet or two of some
streams, and those reproduce with EEE disabled on both ends:
neighbour discovery for 30 streams starting at once. The 17 and 36 that
mtk_mac_enable_tx_lpi() programs therefore hold on MT7981 against this
partner at both speeds. Its Tx LPI reads 1000 (us) against lan1's 30;
see the note below the scissors of patch 1.

lan4 keeps EEE disabled and never arms LPI, which is what dropping
2500BASE-X from lpi_interfaces is for. Forwarding through it was
lossless with no carrier change.

---
v4: patch 2: populate lpi_interfaces only on SoCs carrying a new
    MTK_GMAC_EEE capability, set for MT7981 after measuring its LPI
    exits; the other SoCs keep the current behaviour (Paolo Abeni).
    patch 1: lpi_capabilities is derived from mac_capabilities instead
    of asserting both speeds. Cover: the MT7981 GMAC LPI measurement.
    https://lore.kernel.org/netdev/20260827211652.63504-1-f@lex.la/
v3: both commit messages cut down to the Why, with the mechanism left
    to the diff and the detail below the scissors (Andrew Lunn); no
    code changes.
    https://lore.kernel.org/netdev/20260824024117.46154-1-f@lex.la/
v2: commit messages rewritten to carry the Why only, mechanism notes
    moved below the scissors (Andrew Lunn); comments and commit
    messages reworded so the 2.5 Gbps exclusion reads as unvalidated
    rather than impossible (Daniel Golle); no functional changes.
    https://lore.kernel.org/netdev/20260822195252.2934-1-f@lex.la/

Aleksei Sviridkin (2):
  net: dsa: mt7530: populate lpi_interfaces to fix EEE support
  net: ethernet: mtk_eth_soc: populate lpi_interfaces to fix EEE support

 drivers/net/dsa/mt7530.c                    | 25 +++++++++++++----
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 30 ++++++++++++++++++---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  4 ++-
 3 files changed, 50 insertions(+), 9 deletions(-)

-- 
2.53.0


