Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C82FCA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 08:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I096cPDAgu/rffSPuYsOvZ0nu9Fx4C52NqLyO2/RJjU=; b=XVE/70LGJv0g05tAa234qfqoUC
	qPLPbJlpbgiP266tyEsaNfio2OTfOZSFFTH3hwCg8J8XnziEjo3JpZdMYjbr19smEJhdgJU7rsAVU
	6cEvJXJxpjedc5PzsIb3aKobZh/+tTmgpgc2Lqo9ZkzL5kn43phvwaJjQgJlPRw7Vgry7Oc13yXPu
	4TtRavlh7U4p7V3vzf+r5jI49qPc4j9KmxZ5ymOiGfooFalp6aBx8G5soOTxAJ7tnGvDSVXaXY91f
	cXsSsuOy0iDPru1264PE9hGFIRTYX+pNDIVuRXpgdAFZ1vLSg7KawMBt03bSy+4+DQZWgGt4oWHf5
	2cJn2zCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvAZ-0000000DBKO-3KZ8;
	Sat, 03 Oct 2026 08:32:35 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvAV-0000000DBJi-1NxG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 08:32:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=I0
	96cPDAgu/rffSPuYsOvZ0nu9Fx4C52NqLyO2/RJjU=; b=FlqL+VRpdcFAWmYaMI
	aBRL3FvMMPe/QiX2CUAF4I04Ad1aPvQq1ty4z3wpa34NEzKU6BQmE49Gt4YK3KGt
	Hznk+wTN2Tni1nvvouOQjBmPnEhhXinvOzoZOSiPmeJkMVQ2YkZPFjZJS6PyO2TK
	CaWxfYnp61Y77D9qxJ89SVtBo=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3dzGDvcBqKMk7CA--.47308S2;
	Sat, 03 Oct 2026 16:32:04 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-tegra@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH v2 0/4] pinctrl: free maps on DT mapping failures
Date: Sat,  3 Oct 2026 16:31:53 +0800
Message-Id: <20261003083200.459705-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3dzGDvcBqKMk7CA--.47308S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7trWrtw15tr4rtr4fAF1DKFg_yoW8GFyUpF
	4fWFsIyrn8Jw42yF9xJw10yFyfGa1xCry5W3W3K34UZF45CFyDGr4Y9FWFqrWkCrW8Ww4f
	tF45KFyDWr18AFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEM5lnUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQRblWrAvYT77AAA3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_013231_765235_25CC2FE0 
X-CRM114-Status: UNSURE (   8.80  )
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

Several pinctrl drivers reserve map storage before appending mux and
configuration entries while translating device tree nodes.  If a later
operation fails, their error paths free only temporary configuration data
and leave the partially built map allocated.

Commit 17007cd70060 ("pinctrl: generic: free maps on
pinctrl_generic_to_map() failure") fixed the same cleanup problem in the
generic mapping helper.  These drivers use their own mapping callbacks and
need equivalent error handling.

Free the accumulated map on every failure path in the Spreadtrum, Renesas
RZ/N1, Tegra XUSB, and Samsung drivers.  Each patch changes one driver and
remains independently buildable.

Changes in v2:
- Add the Fixes tag and Baolin's Reviewed-by tag to patch 1.
- Drop the unnecessary output parameter resets from all four patches and
  update their commit messages accordingly.

Jiale Yao (4):
  pinctrl: sprd: free maps on DT map failure
  pinctrl: renesas: rzn1: free maps on DT map failure
  pinctrl: tegra: xusb: free maps on DT map failure
  pinctrl: samsung: free maps on DT map failure

 drivers/pinctrl/renesas/pinctrl-rzn1.c     |  8 ++++++--
 drivers/pinctrl/samsung/pinctrl-samsung.c  | 24 ++++++++++++++--------
 drivers/pinctrl/sprd/pinctrl-sprd.c        |  3 +++
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c |  6 +++++-
 4 files changed, 29 insertions(+), 12 deletions(-)

-- 
2.34.1


