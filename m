Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DFCC982DF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 12:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mwgFbXEPvXREtvKOdLyewIIxAEW+prXX8zPZmbR1mw4=; b=adfazk+b9APNcLnHDWlJDT0yYd
	aqquAoqxDioTpo8iqxdlWQZ2lfJVwn2Sl30d8DZJyjdpp5QN9VGSR7t5slf+D4Qe57kVnNMEzKC6F
	6rG8viUqm/a3EuwAPhhoS14WvY7cvTUXhVuYlMtd2Kp+kDy1j7zjSYok8vDN1Vxs2+1XTtoVV9llZ
	amV8UVTaT9V+fEyupLeLISmVssseArYs+ODM0kIofwsrPUwbS5tlpwsIPkDO3H3iAFfVef6y/32+v
	f77qewqHzs5rP+gGMiGk5Ep4uGqxq+MEAHx57c3gg+b7nn6xBOJt/Cbaht0Z108dlIisVPeykcRSs
	d55x7n4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ueo-0000000GIXp-063J;
	Sat, 19 Sep 2026 12:59:06 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7uef-0000000GIWK-46MP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 12:59:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=mw
	gFbXEPvXREtvKOdLyewIIxAEW+prXX8zPZmbR1mw4=; b=NG7zgMDPNqYk7Pf+hR
	W9fb/+Ur6GzReJqWvPCzbTSb/x7lnkdeU1Ez95jGTM3us70QXo+KpaHPMwEh7Eb4
	8jAVtkiGzt+Amm6hLCVtT/Kpi72FmDmD+DlwvXe+A5jLOj2XyAaHsUPA5YP3wz8U
	MK6T7O6J806wnz0cZXXjoAE2E=
Received: from hpl-VMware-Virtual-Platform.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wA3Rprlhq5qpMqHBg--.54511S2;
	Sat, 19 Sep 2026 20:58:14 +0800 (CST)
From: peilinhe2020@163.com
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peilin He <he.peilin@zte.com.cn>
Subject: [PATCH net v8 0/2] net: stmmac: remove software VLAN tag stripping
Date: Sat, 19 Sep 2026 20:54:11 +0800
Message-ID: <20260919125413.18058-1-peilinhe2020@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wA3Rprlhq5qpMqHBg--.54511S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruF18XF15ZFy3uF1fAr1kKrg_yoWDKrXE9F
	W7tF93Ja1UJF4Y9Fy2krnxZ34fuasrGryxKw4DAFZF9ryxWFZ5GanYvrZxuFyxWFWrXF98
	A34vvFyIyw1fWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbPC7UUUUUU==
X-CM-SenderInfo: xshlzxhqkhjiisq6il2tof0z/xtbC8gYh0mquhub-0gAA3O
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_055858_406586_9E61ABCA 
X-CRM114-Status: UNSURE (   7.43  )
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

From: Peilin He <he.peilin@zte.com.cn>

This series removes the driver-level software VLAN stripping in stmmac.

Patch 1 is a prerequisite selftests fix from Maxime Chevallier to keep
the ethtool selftests working on platforms where NETIF_F_VLAN_FEATURES
may be empty after patch 2.

Patch 2 removes stmmac_rx_vlan() and the related VLAN RX feature
advertisement.

Changes in v8:
- Patch 1: fix inverted true/false description in commit log and mention
  CONFIG_VLAN_8021Q=n builds.
- Patch 2: drop Fixes tag, fix trailers, document user-visible feature
  changes and EEE side effect, tolerate in-payload VLAN tag in
  stmmac_has_ip_ethertype(), and gate NETIF_F_HW_VLAN_CTAG_RX on the
  presence of VLAN ops callbacks.

Maxime Chevallier (1):
  net: stmmac: selftests: Prevent RXC from being disabled in LPI

Peilin He (1):
  net: stmmac: remove software VLAN tag stripping

 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 38 +++++--------------
 .../stmicro/stmmac/stmmac_selftests.c         |  2 +
 2 files changed, 12 insertions(+), 28 deletions(-)

-- 
2.43.0


