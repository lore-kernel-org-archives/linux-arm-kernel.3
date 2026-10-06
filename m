Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B3FCA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 12:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RSZxsBu5RBEC02GI587QjIyYZwSuYrJWfwAAHFHFZ+o=; b=sBSzIXPZWhTts+djcAka6RvUaW
	6hCfN/sUQ32UZLojJgVEOoNThb/uNKl0TSWQA1dzROYwmXwrF5cb601EI4YEGsBsMgYieqIcU+YGc
	nmCPE7DAtqzNGZ3xquI0qDh/FfLEYz2+AorXZdV6abNo4CwUfBOQRaZJA6mpU+YU1ay6iPfD3AoJo
	ODyMc9RIKKa5o47Ptd3NzAANM8tAxb7Xa/nfTYeyAz4icydXiSrxWgBkBE+Y1aX6lJR5rlUfhRHJ7
	8UBa7P2yn+eb8mCMZnjion1KtgZfFN3/xvz8hXJFpnPEMeIG7eLLN3JMIHy8n1m1X5puixobyF0Th
	7BJ4D0eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE4a7-00000000nAc-30A7;
	Tue, 06 Oct 2026 12:47:47 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE4a3-00000000n87-36Wa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 12:47:42 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-48c4be28b82so515991f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 05:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1791290858; x=1791895658; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RSZxsBu5RBEC02GI587QjIyYZwSuYrJWfwAAHFHFZ+o=;
        b=ZxSrHlMm/tRZwYR4HA6msHkkWrR5/+TKGBU+ibWLSxJ9Cpbz3Vm6qpggXo70mCdDxT
         6JHltHCg6ShZ/px5y61gI9xwDe0xHI6jFJhq0Ei07ItF+zfaK5yphEG1YaPJTV18J9Qh
         Yn87CGZWZ4FyQnHknGfLbu38aY0W21cIHl+DprNOGexZLhsXSgt95NHuUSKi8bD787eC
         ffVKOIa/7rK6VUFOZ9KDDF00YbwwZw55C7IHxnbrKSoObT6K75MVq7uI5rSANqm4A9XJ
         5+4fqm/tvunPIbFSG0zxKbBCO9AsfPCgBhHhcOYZMl8StYtvdGX7WSSj+2Txy8T9D6kH
         e2Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791290858; x=1791895658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RSZxsBu5RBEC02GI587QjIyYZwSuYrJWfwAAHFHFZ+o=;
        b=rxZn7My6LcE+6f3uzjtMusvWZmhO2+/f3AQpDxBiYuLLCInJK5/1+sr3ihOYc84wY9
         ggDVwA8SUroPSfOLnojBitD5/t6lIjKoDOfWRGdStpyr8o7bK/UPdKUclDh8LaoUX8dc
         K4hbWqpIDKCH60YZJxeZ4JmxaJZG/IeQ1Km8rMgxr4Nou3ndSzky163Xi1h3XtLAvitG
         ny9eDEtU+CH+oG220JFB35IqB5m+bUpPQSVPqJgJRkTjI7oTvvmeDb+dunz9JLUlzd1w
         5kU+G6+So8tbItqOF3pgJTBpt0PhdhBVeTUStSHkzDn3Q5W4/D012btTJx5LXwloWoAU
         nngQ==
X-Forwarded-Encrypted: i=1; AKwUvBzGnuUjzAnuq+m+UJ4SswbtMFjpjoCks0ZRc0+S/Wzpphkod0n6vFPMpTDPVVePBwIIq3bSBP+NxAZozlZwW4B9@lists.infradead.org
X-Gm-Message-State: AFq9FYIucA/f9PbCnMdXWGpzZBviuOhCT/+4K6EPc+Hp6kupMsCq0ALp
	1ipcowxfqSXJD9ahmwNJK+lhirHu//p+OcXCkKFjvIOkhoqhxdiPpRkF7QndpXOuIFI=
X-Gm-Gg: AYBFou2WndpvGaahQM7oMh0S5O97oLU2M0qdB6bQUwFwJxyGjVfxas9dAA4XdJK5zRw
	eJsmyYg2D8bOSaD/fzfm5iBmr/ehfCPcHcdVdgT2TLm8DF9uOuQo14z64ZVr0WVNH8a2PSzsair
	E+6z8wB72LlgmHZa9C0jpFXaLiQ1fBHDTuf9w11NnbbJd8y6qLeJOgMAeJFizxh+JoaS9F2yRGC
	xJ6avF7R6FuOSyhkJ5NuBIyt+Vjw2Q7wQNJ6rKeF//NVBeAP4catRh5bPb01g3DOgESPN49pHGw
	uCZBnzHGFxBLFmtVAWYvE1ZWvt9xnNmH60X9DMSV+xGR8xC82qcufFYdTdjtwOZ380rt1Nwtbqj
	a+0qkuxvkl4/PhnJwRoQMHBMPWOU6mQuQgWUanHyiu71mmkO+d9k8B5OggXjZyc9aCMOadSBXM2
	HtJABBRojje/R9f8IZwIMQVexE3tAFhZyKao5/m6/yJHdP7WiBew==
X-Received: by 2002:a05:6000:4915:b0:48b:4c8:7b08 with SMTP id ffacd0b85a97d-48c6d19d048mr2285274f8f.34.1791290857366;
        Tue, 06 Oct 2026 05:47:37 -0700 (PDT)
Received: from remote-01 ([84.17.55.224])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622b4685sm9722003f8f.41.2026.10.06.05.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 05:47:36 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v6 0/3] net: phylink: wait for a PHY that probes after the MAC
Date: Tue,  6 Oct 2026 15:47:28 +0300
Message-ID: <20261006124731.1528963-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_054739_806377_1044C36C 
X-CRM114-Status: GOOD (  17.94  )
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

On the Keenetic KN-1012 (MT7981B with an MT7531 switch), the Airoha
EN8811H behind lan4 has its PHY driver built as a module on the root
filesystem. The switch sets up its ports before that filesystem is
mounted, so the port is validated against the generic driver, fails its
phy-mode and stays dead for the uptime. DSA does not retry it.

Patch 1 lets the PHY node say so with needs-host-firmware. Patch 2 makes
phylink poll for such a PHY instead of giving up, for a MAC that opts
in. Patch 3 opts in DSA user ports of switch drivers that set a flag,
and sets it in mt7530.

The poller can still lose a race against an unbind of the PHY driver,
between its readiness check and the attach. That window is phylib's:
any phy_attach_direct() caller racing an unbind has it. The attach
guard series [1] closes it.

Tested on that board with the series backported to its OpenWrt 6.18
kernel, together with a940003f44e7 and 07d995873960 (the mt7530
.get_stats64 atomic-context fix). The kernel had lockdep and
DEBUG_ATOMIC_SLEEP on. Local debug parameters, not part of the series,
drove the error paths. They fail the connect after a successful attach,
ignore the opt-in, fail the generic attach of a PHY with no driver, and
add a sleep after the switch shutdown.

 - boot: the PHY driver loaded its firmware at 8.7 s. lan4 attached at
   26.3 s, when the port was brought up. Link up at 1 Gb/s.
 - port kept down for 10 s with the PHY driver bound: no poll and no
   attach. "ip link set lan4 up" attached it a second later.
 - opt-in ignored: the old behaviour, the generic driver took the PHY.
 - two injected failures: "failed to connect late PHY: -EIO" twice, a
   second apart, and the third attempt attached. Link up at 1 Gb/s.
 - failures that do not stop: four attempts and one "giving up". No
   poll after that, also not after a down/up.
 - four failed generic attaches with no driver bound: nothing logged as
   a failure and no retry spent. The port attached once the driver
   bound.
 - switch unbound while the poller waited: nothing oopsed.
 - reboot with a 3 s sleep after the switch shutdown: the poll ran
   every second up to the shutdown and not once in the sleep. On v5 the
   same test polled 3 times in the sleep.

No in-tree device tree sets needs-host-firmware yet. The board is
supported out of tree, in OpenWrt.

Changes in v6 (since v5):
https://lore.kernel.org/r/20261001130208.105558-1-f@lex.la/
 - Defer only in PHY mode and without an SFP cage. In-band, the PCS
   could bring the carrier up with no PHY attached. An SFP PHY could
   take the port while the wait is armed, and its removal dropped the
   wait.
 - Poll only while phylink is started. A port that is down attaches at
   its next up, and nothing touches the PHY after a switch shutdown.
 - A failed attach after the PHY driver went away no longer counts as a
   failed connect.
 - The patch 2 message no longer says that MACs connecting from
   ndo_open recover on the next open. They do not when the PHY driver
   loads while the generic one holds the PHY.
 - The dsa.h comment states the rule: .port_enable must not use its phy
   argument.

[1] https://lore.kernel.org/r/20261001130120.104628-1-f@lex.la/

Aleksei Sviridkin (3):
  dt-bindings: net: ethernet-phy: add needs-host-firmware
  net: phylink: wait for PHYs that are known to probe late
  net: dsa: let user ports wait for a PHY that probes late

 .../devicetree/bindings/net/ethernet-phy.yaml |   6 +
 drivers/net/dsa/mt7530.c                      |   1 +
 drivers/net/phy/phylink.c                     | 232 +++++++++++++++++-
 include/linux/phylink.h                       |   5 +
 include/net/dsa.h                             |   5 +
 net/dsa/user.c                                |   1 +
 6 files changed, 242 insertions(+), 8 deletions(-)


base-commit: 47a1446725732cd3996edf607e8739334bbf4d78
-- 
2.53.0


