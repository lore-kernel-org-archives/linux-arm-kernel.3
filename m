Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C67D358EE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 09:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TNf7l43MX55crtLyATkZX7s/kbESvyujXOEVyv/5/Yc=; b=OqeGahO7C1CKoGhDq9/lc6Riqm
	8XtJrj2vYpjWNffyWKIPR5uZKHeldeULCSTXLh2crjm3vF1cESzEPinPNrqgwzjpU6BnKUNqu+i4T
	nm3UwsTgyfBfqHPDIz+OWNGhMkqKtDpy4K0smLHPxRhA6SY3yBVf67VcEhTMNo9vd540Ic+JP+PeQ
	k7pWCPQHvq5c3b8xprov2mgx3imk8SVmRH8wFRlvrSgsUyiayPqA915JvoqcVsJOjXP9CMpUxlUwD
	uanUTYoWQEzBPbMy1sKZBgI99DLAUZ9NmgycJ76VPQz4lpzCjCT0IvnuR0cR9fdULqmRGUQt15uMy
	zrqsnBog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlOkB-0000000HXVe-2ohI;
	Thu, 29 Jan 2026 09:55:19 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlOk2-0000000HXQl-3Il4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 09:55:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E680810F4FD;
	Thu, 29 Jan 2026 10:54:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1769680500; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=TNf7l43MX55crtLyATkZX7s/kbESvyujXOEVyv/5/Yc=;
	b=fEbSVsxwx5FJdG0tkvHTWRAJdGY72k44WhwRUeb6ayrhzX85DL6K30IPTbc31xy5rFoFhq
	osVlRlOfEUCno5Gtung0eSw9X+vTbu7Q5AcyJnrpVdmF++wZhWXDKJOPoJqxolHwQIk25c
	TrNH0H7dy9M+KVPKVzg9wWkXalIu6ZC9B+u5Cr1ND9cI/WHbmaVS5OppXJgAnLLQr/TQj4
	Ajm9EF3GmUBfiLukKLFVOcSsuRQ+kYTpeGPmONkXoVClgM9kABA3ulewJY+u3vpXFchxg1
	G0LHj9wv5d+t5Whsy/g4vp2mcPZB6tCVKZ+/QzIzqYY/j6RpMfcsT0DGxEijYQ==
From: Lukasz Majewski <lukma@nabladev.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Lukasz Majewski <lukma@nabladev.com>
Subject: [PATCH v4 0/4] clk: vf610: Add clocks to support MTIP L2 switch
Date: Thu, 29 Jan 2026 10:54:38 +0100
Message-Id: <20260129095442.1646748-1-lukma@nabladev.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_015510_991269_11B14197 
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

This patch series:
- cleans up clocks' setup on vf610 by moving VF610_CLK_END define
  to driver code
- introduces support for several clocks required by MTIP switch IP block

Lukasz Majewski (4):
  clk: vf610: Move VF610_CLK_END define to clk-vf610 driver
  dt-bindings: clock: vf610: Drop VF610_CLK_END define
  dt-bindings: clock: vf610: Add definitions for MTIP L2 switch
  clk: vf610: Add support for the Ethernet switch clocks

 drivers/clk/imx/clk-vf610.c             | 12 ++++++++++++
 include/dt-bindings/clock/vf610-clock.h |  6 +++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

-- 
2.39.5


