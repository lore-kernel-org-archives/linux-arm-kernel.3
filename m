Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4398B606C575
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nvswbe+a;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=JrI/Tnsa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=yZULAJenn5FpHFmW4iJ5T1lRKnAas/th6WVGZ4q3kuk=; b=nvswbe+aRUxoaWh4D8ewcU2S2Y
	GvEsCoTUvh26cYlRDTHkoj2sY8qnoBBVyYx9/++KqtbXNSJ24AW+8wbYGrmYCxFypKqruDW6uQjai
	t9giv8O1JxnMrVNPVcaqPdbOF2GeApViykGFM1pgZC5GAy6bd8hgXHMMoVZKRBAgwI39jGtbKfpak
	x96RlGcObr55G/bPr4YqLY0gbGcDjhQ8gfhlGXe2stP3BcASdC7ffPxv4mhhwqkVEAg/hd21TgB6+
	CisObpCBLuDdP0wiAoqyHftMZTkxIp6KFS33aW+dys+KGTnJVr/5zopnqL1WAX+o2g2t70C2iVytQ
	EKPXSMEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOC93-000000025wh-11QN;
	Tue, 03 Nov 2026 10:53:37 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOC8z-000000025vG-24xk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 10:53:35 +0000
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 4A7991F9E7;
	Tue,  3 Nov 2026 11:53:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1793703211;
	bh=yZULAJenn5FpHFmW4iJ5T1lRKnAas/th6WVGZ4q3kuk=; h=From:To:Subject;
	b=JrI/Tnsa0kSXWpKhwtP3yZXkHs8CvwVT15jM+DkFLfbHf0Zc0trrLBgE7ncGtxlhI
	 587POREeU2MVGpUlWuN4qMBFYQvZWl2oC2f5WtZ38SmKcJ5S07F4V0OldOmDhVYlsp
	 ecXD6nYfUXr2s9pAmNNwR3wry4M1O8tcH3OImosm9a+50tM8njMia776EhcCG1aVVd
	 1iWIhGv5rBIFGQZN1yQvx4ZLwIm5V7+zArjdqKEGFDT4w6LCc984wZ8v6Sm1wWTvfX
	 Sdf2kHKBR0hnlPCLeSD1mgNtHqN4PxLedWeianJDHbexeviuvwLJ3WzpTuYh0zSJZe
	 HemnP2pmBvW/A==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] arm64: dts: freescale: imx95-aquila: Keep DP_PWR always enabled
Date: Tue,  3 Nov 2026 11:53:14 +0100
Message-ID: <20261103105323.2394012-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_025334_093647_EF0A047A 
X-CRM114-Status: UNSURE (   7.40  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Francesco Dolcini <francesco.dolcini@toradex.com>

DP_PWR on the DisplayPort connector powers active DP cables and
adapters, which do not work without it. Keep it always enabled, and mark
it boot-on so that the firmware, e.g. U-Boot, enables it at boot,
whether or not a display driver is available.

Francesco Dolcini (2):
  arm64: dts: freescale: imx95-aquila-dev: Keep DP_PWR always enabled
  arm64: dts: freescale: imx95-aquila-clover: Keep DP_PWR always enabled

 arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts | 2 ++
 arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts    | 2 ++
 2 files changed, 4 insertions(+)

-- 
2.47.3


