Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 529C7C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 08:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kxQtaXcsjM2ovX5/37rHFvmUdzjRjLApt0L/oLOpB2U=; b=IvGv1at7zttk4QgSfqTegQwUQs
	RTTxhBGMy8BsBNqmOm3eY6yq9LwgdWcGx5M95Ui5Nr2a8nCWkQTObMsHtG7FS6b0dNrYj5Gc5SVZs
	+BZWeh0f3VFQTDWTjSHdD0YNpMEziKtRg1jTNetnTuB8fNmwMkrFI/T3hPBP9/Usac7JSaZhOn7+8
	jYeYJW1IbNrPntfxdhDZgcpEMA218A5b6TiiLwiCU+P3o2hbVtJ7fshbdwH2E7EzITPtr93I/Ax3s
	ukD4ofjbeudmhwahOLHIVUFl+o+9Ok1WWYWHO6Dp54AX/6yahmcP3L8P2h9p3dwZ4xYEfoygPwzTK
	F0AAS2Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIO1a-00000003KjC-0kUW;
	Fri, 23 May 2025 08:45:06 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uINme-00000003J5s-3bS2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 08:29:42 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id CCC981F997;
	Fri, 23 May 2025 10:29:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1747988979;
	bh=kxQtaXcsjM2ovX5/37rHFvmUdzjRjLApt0L/oLOpB2U=; h=From:To:Subject;
	b=FqEv8FK1TSN1d00jlAH6vrEHuFlvuJxvd1CbULeF+5cxvuSV1U3gYwYIO77wQLxzJ
	 JTySDQll53QlEazU+gxs54PnFAMcC7gwzSUrOiUUBy0ekthUp8uMP7ELHgru+vEFyp
	 TTSGRtZYmO4z8LoTEG+8OLqxSXMxHYtaQc+ZSgEu0qC+C8xie4p8YaPUdhNqZldPnS
	 eK+gqKKxmeH4zw/JJ50QN0BnkjPQaa1fqrvp9XG4dM4VY8Z4TBy9qO4Kkw5cBgOZ0D
	 Q/bY+tyuFHvQckfOMq0Lbva0UPykA5Xch57hITbnIVDn48ianX2O6qW5je2TZXPHl0
	 5+2v0ZizUU05Q==
From: Francesco Dolcini <francesco@dolcini.it>
To: Dong Aisheng <aisheng.dong@nxp.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] i2c: lpi2c: implement master_xfer_atomic callback
Date: Fri, 23 May 2025 10:29:29 +0200
Message-Id: <20250523082931.23170-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_012941_055376_8AFEF0F3 
X-CRM114-Status: UNSURE (   7.08  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

This series adds atomic operations support to the imx-lpi2c driver and split
the previous v3 patch into two separate patches.

The first patch replaces the open-coded polling loops with readl_poll_timeout.
This improves readability and consistency, and prepares the code for
integration of the second patch, while maintaining the same functionality.

The second patch implements the .master_xfer_atomic() callback, enabling
support for atomic I2C transfers.

Emanuele Ghidoli (2):
  i2c: lpi2c: use readl_poll_timeout() for register polling
  i2c: lpi2c: implement master_xfer_atomic callback

 drivers/i2c/busses/i2c-imx-lpi2c.c | 262 +++++++++++++++++++----------
 1 file changed, 176 insertions(+), 86 deletions(-)

-- 
2.39.5


