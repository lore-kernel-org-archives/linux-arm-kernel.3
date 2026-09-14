Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22631C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 15:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RTv/7kXr0e2/E0RIcc6p/oBQdEnq0quh3XSx4UVp1tI=; b=NRwURbalgUXZTdgfQebEAl4hrI
	SsOsdb5NIyZw4LTYeDrqefcnYZqpzvvsLHeFURkQbAizv9kp7JJnBLwXExvbXS/1mECEVyqd2K5vS
	fs6AWrjH4mugbF6e8Jgc2Ggmz0HsBC3F1dXZwxAM6DEppy2rVQ7mSPKAH1bKScvyH+k2UjvqWobWy
	VORSQ2dsilbkw/plTr2yOIKc/DbJl9GEdiFAxu50uzsqAPk8srHNyj1kbxHhTRi4g06QAjGZKJe5i
	te8vOJABzpDBvzNi3x6mIlrRhTp6LWVisCH/8rjCuicvAUKfuDluRoBLHZvOMpowNAkORTWjVB03H
	VdPncEGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68Gn-000000046Ue-3pJj;
	Mon, 14 Sep 2026 15:06:57 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68Gi-000000046SB-3Mas
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 15:06:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=RT
	v/7kXr0e2/E0RIcc6p/oBQdEnq0quh3XSx4UVp1tI=; b=RbnH6QdFF5tbxJHKSp
	jRkEsUXit8fS82NbFj5dLwLisPzb9ps2PeICOxNtsrwO67AKSNOwxq0jDVC8Tc91
	XMG5vPC8Z4i3vhTnf/oaBT5jXZnEnui1QLTCetEwQlim9hC2k0bz2RKy4noTf7Sh
	JtRafm7ii/Fe5tdWDkC40DMt0=
Received: from hpl-VMware-Virtual-Platform.. (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wDn_3pkDahqCSeIAg--.42971S2;
	Mon, 14 Sep 2026 23:06:13 +0800 (CST)
From: peilinhe2020@163.com
To: netdev@vger.kernel.org
Cc: alexandre.torgue@foss.st.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	he.peilin@zte.com.cn,
	jiang.kun2@zte.com.cn,
	kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	maxime.chevallier@bootlin.com,
	mcoquelin.stm32@gmail.com,
	pabeni@redhat.com,
	vbridgers2013@gmail.com,
	xu.xin16@zte.com.cn
Subject: [PATCH net v7 0/2] net: stmmac: remove software VLAN tag stripping
Date: Mon, 14 Sep 2026 23:06:10 +0800
Message-ID: <20260914150612.9798-1-peilinhe2020@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDn_3pkDahqCSeIAg--.42971S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruF18XF15ZFy3uF1fAr1kKrg_yoWfXFX_uF
	W7ZF97Jw4DAF4jkry7KrnxZryrZasrGr1xtr1DtFZI9r1xWrs8GFs5WrZxuFy8WF9YvFyr
	Aw1vvFy0kw17WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjNzV5UUUUU==
X-CM-SenderInfo: xshlzxhqkhjiisq6il2tof0z/xtbC0AUh0mqoDWWQjgAA3S
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_080653_959622_E06439BD 
X-CRM114-Status: UNSURE (   6.79  )
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

Changes in v7:
- Send as a new series, not as a reply to v6.
- Include Maxime's selftests fix as patch 1/2.
- Keep the software VLAN stripping removal as patch 2/2.

Maxime Chevallier (1):
  net: stmmac: selftests: Prevent RXC from being disabled in LPI

Peilin He (1):
  net: stmmac: remove software VLAN tag stripping

 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 28 ++-----------------
 .../stmicro/stmmac/stmmac_selftests.c         |  2 ++
 2 files changed, 4 insertions(+), 26 deletions(-)

-- 
2.43.0


