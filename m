Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA67E77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 14:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Fy6I1IWGnrcZTAl68S56qEqGFdO+Mwrk6gsO8fR527s=; b=XyORNyLaB3pgx7g0ZKjG81FTO6
	bZsd33/168vZLAjbNi1s7I1Fr3QzgwmPEaCNBzkLgIFx9MZv6ElHy8BgVH3kkLQV8t3g2TNqVSxkL
	74wD49f9i+qaqhe9krBgkcbIQheWohAMnHF3OFxf5RUvkui0Y3XPmyB8tuR46eNPmgBAz9W0EXKLb
	k2fcdjiL1HPqM8Hx7ekg8AuqgB5QUhuXjADuB6n6eSdzcBIwNpKYUKQA1UDdsULWADNs3eQoUsSm+
	m4juVO20/OitvmiGDE+BNO1d/AUul7UZNPnKTpbbSMs49L4eEUvOQobc4RqR/DJgdrH0jZQr6Jy+f
	wzahhZqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAPP-000000059sq-3Tql;
	Tue, 07 Jan 2025 14:18:15 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAIr-000000057zu-2wo2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 14:11:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736259089; x=1767795089;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Fy6I1IWGnrcZTAl68S56qEqGFdO+Mwrk6gsO8fR527s=;
  b=Lx3fzaLO1pM+yxg009TdLRygOc4w5J9leAUGVS0sSdjpHKehCIJ46wIQ
   X2VVi1TLYvpu0ME3RMmd82Ywzq48NHGMGo1bm8rMTy3PRssTbCkownprr
   ICk4fwqwe8Hy/h802W2+bf9FHsGYRmgwz85jpZhcLO7tefdqcHqhRUnbM
   I8tFl8UNw1UR1GKO56zXuTmTl0RzDvKeVj66+VcwLeVXO0Ik7yYlDuKsy
   hWdpAGwLt7LRVYy7Mw40aBdbDZEYHXnBQzqoXFqeIp/aclSOH/dukYa6f
   /n8WsIrtJGiG276SbrKWBhwMhv1XYdUpi9KRSeuAx4z3bSv1WsWnMKPsx
   g==;
X-CSE-ConnectionGUID: 1dVWb36OSxiOrOR3rCv9tw==
X-CSE-MsgGUID: ROr3RqiQQ62xQBIoTg8drw==
X-IronPort-AV: E=Sophos;i="6.12,295,1728943200"; 
   d="scan'208";a="40896496"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Jan 2025 15:11:27 +0100
X-CheckPoint: {677D360F-45-3C670366-E45AD810}
X-MAIL-CPID: ACA0EC46ECD6D8541640C2E855822D4F_4
X-Control-Analysis: str=0001.0A682F28.677D360F.00AC,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 56B19164ABB;
	Tue,  7 Jan 2025 15:11:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736259083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Fy6I1IWGnrcZTAl68S56qEqGFdO+Mwrk6gsO8fR527s=;
	b=CR8z2CAT0SDqQOv4sd2dLPFi9NMRcBwtw9a8BqcQ3QtqvI7Egxen5qORLxdGdxdPuF6yM4
	GV2UyFTLO1QOK7j0YZFnZOYcnTrSu/1klrhDmBvnVz8Oi1ciQEsuPCRCpRundrLwh6vVbG
	iqZjFWjyOLvgez83s91xpAfL6eqMCrBSmlBL1CCn04HoEbl7Knp9DfiBI5O1QYzbcunEXe
	XJtUm83Qy2rMNpaKjkZPKvmZBOP3pp0rE4G5X+xv9C7TbvMzlGPzAzOZLFt55LFXCj0bck
	fiul5snGxxSRr9m7ep23+SU0AoCI7+kY813vkY2qPS2wmH7HqlruzaSP8Rxsww==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] TQMa93xx fixes
Date: Tue,  7 Jan 2025 15:11:14 +0100
Message-Id: <20250107141117.984652-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_061130_160398_FB3F1D77 
X-CRM114-Status: UNSURE (   7.31  )
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

Hi,

this series includes small fixes to TQMa93xx DT:
* Sorting DT nodes alphabetically
* Invert default for Powerdown/Disables on Mini-PCIe slot
* Swap order of ethernet devices

Alexander Stein (3):
  arm64: dts: freescale: imx93-tqma9352-mba93xxca: sort pinctrl nodes
  arm64: dts: mba93xxca: Do not assert power-down pins
  arm64: dts: tqma9352-mba93xx[cl]a: swap ethernet aliases

 .../freescale/imx93-tqma9352-mba93xxca.dts    | 54 +++++++++----------
 .../freescale/imx93-tqma9352-mba93xxla.dts    |  6 +--
 2 files changed, 30 insertions(+), 30 deletions(-)

-- 
2.34.1


