Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08F9C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 19:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MbRs6SJvz6u9cGosQWklZdWE9HBk6wlNApB8tJN/dPQ=; b=Vr0HgDPiSkumwno8NtoD4oZV8w
	Tdv+21dkYSoebDV/wlNjWRA0AVGmhY4XP3X+kMn2GJNQullk0iGY2nz0tmUOUkolyvJwrxZ7q2oq6
	3W6hXVEeMwyrdXSLNX+KzHMoVbJEgbqQDiN9YUfkuOYs/cMKVWQ3EwKQ46BkhyBz/dYOAr++3duJH
	/10xLQpJM2SO3pw0WyM/FSssNkTdpIIXP8RrhEm9QqcTTV9a3h+HzQVGgd1/e381+Z4cG/2zZEYBX
	OXColS5jA/FUbp6w+o+kBNmPPU4DFL4iwVVM9gtWO93vnOrJfWmafRKZbha7PYqi6QFwUWybtzGCs
	9kPYtI6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxrm3-0000000EkvN-0L06;
	Sat, 22 Aug 2026 19:53:03 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxrm0-0000000EktO-0uVT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 19:53:01 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-69c600f76ccso3678721a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Aug 2026 12:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1787428375; x=1788033175; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MbRs6SJvz6u9cGosQWklZdWE9HBk6wlNApB8tJN/dPQ=;
        b=FqdlQZHbAKTVdPct4QQpncDf018p4n0uyCCLo2niJ9ptbIK0xaXXYcRuRH71hfI04G
         06XdIIAnhM4637r7DBUA+TU9KxrGmf0eaGi5U1JNefr9wTt2aXpoWyQ4LysRPZaoUuN6
         TldgGkee5NiqCL/4o3ihB8XB62sfVAwaAJjjT4JFiQb2+l4/7gVG6vgGiRodn6Umm5Cp
         NoOpKuvBhG/br/RMSRm66aLJJL/rcaSkfEXRcgkTUqGJ37tEXnS2Ql54vXU7wXEwe2zu
         55EJh6qPNtqUcf0ma5IhD18x5qMK8YAq+1KUN4xMaYqXpTucvnRgk+iWDgEN36MaYTHq
         7FzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787428375; x=1788033175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MbRs6SJvz6u9cGosQWklZdWE9HBk6wlNApB8tJN/dPQ=;
        b=q0heSf9JGHUZ3s4RiwtjEUauffrGDUndWVOZ49iIQnCrUu6WisZ2Ic7H8Gc+JyOXkh
         i87+V8lsVUEBrFr6hMEWWF8ww4a5CaY8kIbDWnu2I9Ml0XpBYtBVguBMnlaxTAvp/pnE
         79rpIKnQB1ayYeTaGy1UK3mllteMzk/4sVNfusf47t/TN5gUTQshA6DjQNDrHlXrbqem
         SHhoxNMLg0DeDYsWrfKD2eRopfMw8yTld0qn+SiVec/E+SJDE8nM+A/5/hK60TBmTbXI
         Q0UAG1cyOy7u3mYTMZLVDLEl+TRXta726lQBWgu8dDHn5S/teHE/K7zDu/lMqtMgQ8s0
         HD7w==
X-Forwarded-Encrypted: i=1; AHgh+Rptpx5mh1OmUk9TkKY8r6Yq74gOG9C5wpTRYbyVDAPIFfE2n94bAbdJfFKp5rVxMHdXl3yT9c2swCjaquefrnys@lists.infradead.org
X-Gm-Message-State: AFuF++nFnWU6Etdykv02Hmb/H5ubBLvkIgRvlyG9O17wir6m9V+pCNAN
	28OmZS+yqMcoxPJDtQwDwWu2VDvLG7Zsn5dBf0nszeEW8/4YDmHgoNUZ/w0Mb9ci0Ns=
X-Gm-Gg: AR+sD10HJeUVpjGsdrR0Vs7QVEvlEY/Y9jquSOFHl5oau5/1vN/dATfDTx60+t6tMRE
	K+QsXlJemVp/9E1yLj0VRiMqVR3I5udelgWrso3DZEiCAKQhUhZ3XE1ap1fKMIkCewXygXRMpto
	DXWmgNwCFQqJVlpMSWgzN7XFrYhxm9F4+Wc10TI1ZvOyIQCRDttDtSPjs9a+obakGXENM60Tv9o
	j8jbvvUcx2Hr9UhnPFSQpgiarHbkb3JIk+in/dKIT1wzmLDNU5rE89QLr1N5sHKY1V5ZxKYsYW9
	9SSLPLX+VSF9RyQkbviC3x4bTT2z3g9/7CBteH5qrmpUm3/jPzTx9KffpSWO65KwIeZ8DBK5zAR
	rxe1+d/IKbjB+nWO0GBlt61eU4Oq5atz9Pu2k6vGA5hkuGeZA2lEK8DGLgH6inm9YTyBDNDtFA5
	+rdwPU0c+Wl6qlghCdjlvc3RuUmhq4wFleQcoUlJdWhSmBtGX8syY3UVFbvs/++UtSMaqDIg==
X-Received: by 2002:a17:907:3d0a:b0:c20:83b1:396c with SMTP id a640c23a62f3a-c246a62b68fmr1552247666b.17.1787428375029;
        Sat, 22 Aug 2026 12:52:55 -0700 (PDT)
Received: from ownbook.home.lex.la ([84.17.55.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2495ee5295sm475032666b.0.2026.08.22.12.52.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 22 Aug 2026 12:52:54 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: "Chester A . Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [PATCH net 0/2] net: restore EEE on MediaTek switches and SoC MACs
Date: Sat, 22 Aug 2026 22:52:50 +0300
Message-ID: <20260822195252.2934-1-f@lex.la>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_125300_284246_91D32CBF 
X-CRM114-Status: GOOD (  18.41  )
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
MAC that uses mtk_phylink_ops since the two conversions named in the
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

On MT7531 this undoes half of a deliberate arrangement.
Commit 06dfcd4098cf ("net: dsa: mt7530: fix enabling EEE on MT7531
switch on all boards") turned EEE on at the switch MACs while zeroing
the switch PHYs' EEE advertisement, and ended "With this change, EEE
can now be enabled using ethtool". Only the "off out of the box" half
survives.

Each patch fills lpi_interfaces from supported_interfaces, minus the
interfaces the MAC cannot signal LPI on, and corrects lpi_capabilities,
which takes effect for the first time as a result: neither MAC has EEE
force bits above 1 Gbps. Neither driver sets eee_enabled_default, so
LPI stays off until userspace asks for it with ethtool --set-eee. The
EEE advertisement is a different matter: phylink stops force-clearing
it, so a PHY that advertises EEE out of reset advertises it again and
the link may negotiate EEE, without this MAC asserting LPI. There are
two exceptions: MT7531's five internal PHYs, whose advertisement
mt7531_setup() zeroes before they are probed, and EN7528, where the
driver deliberately leaves both LPI bitmaps empty so phylink keeps
taking the phy_disable_eee() branch.

The two patches are independent and touch different subsystems; they
are sent together because they are the same bug.

Splitting each patch further - lpi_interfaces in one, the
lpi_capabilities correction in another - was considered and rejected: a
value that never reached phy->advertising_eee is not a reviewable
behavioural unit on its own, and the split would leave an intermediate
commit claiming 2.5 Gbps LPI that the registers do not implement.

Targeted at net as a regression fix with an active userspace lockout;
can be retargeted at net-next if maintainers prefer.

Based on net-next at 91ec20351349. Both driver files are byte
identical in net/main and the series applies there unchanged.

After the series, all five ports report:

  EEE status: disabled
  Tx LPI: disabled
  Supported EEE link modes:  100baseT/Full
                             1000baseT/Full
  Advertised EEE link modes:  Not reported

No 2.5G mode is offered, which is the corrected lpi_capabilities, and
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

On wan the link partner advertises no EEE, so enabling it settles at
"enabled - inactive", which is the correct outcome, and the link
survived the autonegotiation restart. Its Tx LPI reads 1000 (us)
against lan1's 30; see the note below the scissors of patch 1.

lan4 keeps EEE disabled and never arms LPI, which is what dropping
2500BASE-X from lpi_interfaces is for. Forwarding through it was
lossless with no carrier change.

Aleksei Sviridkin (2):
  net: dsa: mt7530: populate lpi_interfaces to fix EEE support
  net: ethernet: mtk_eth_soc: populate lpi_interfaces to fix EEE support

 drivers/net/dsa/mt7530.c                    | 24 ++++++++++++++++-----
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 22 ++++++++++++++++---
 2 files changed, 38 insertions(+), 8 deletions(-)

-- 
2.55.0


