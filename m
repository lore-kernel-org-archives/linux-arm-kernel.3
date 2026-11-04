Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9E5606EE93
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 07:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HosE7XUQ;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BH14mN4R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=p8ts80LviUGClPDc+CzAUBQMvTPSUXFtWsdkH5RwrIQ=; b=HosE7XUQSHcP+ncUJzw/Q72EEC
	EMtlOs2yq0Xubj2S8gm1ZlVWIExPTPla3k6rR6GjTIY30JxG16LRpDRH9mCWnFCE8uoEfo5uS2HjM
	mVXzRkrjtl5H4iA5gI5VZXhhWg4WmdIYVCD+zla19XYDJIcd9/oBuwM5NW3lT0jhdS0JhWiYiR9QB
	YgAX3dzPKHs/SYTPCH3ZGDe8lkXfdXCwVtp0/cO2p/qdaZZ7uCct9qfJydfpNYMsQMXJIZ8Mm7Fys
	EfUUkJU9GcIhhmQhXhxbImxrUunrszJwUFfYqmsFfdk+DRT1FL1pSHxW6ZSsH0s6mZbFEGOrqtGDc
	5RscCwtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVKQ-00000004Vmk-1z2I;
	Wed, 04 Nov 2026 07:22:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVKP-00000004Vmc-2CCw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 07:22:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4A3B2407D1;
	Wed,  4 Nov 2026 07:22:37 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793776957;
	b=wvbrLnFFA0rVbNM7t+6kR98FdKmUmHratE3rCQsn/IZdza031Uba9exO1f4Llv9JFfCc
	 J1p3kUD9GoxFrucUYNpZLqnh1zC/PRCAO7i3vKzlPkH3EyCwDFqhIiylzU8MwdsdfiUnu
	 k6yTxgMaPuN3FoQh562GN6Gc1OMzVUWOlfAfmMATxAE8r+c53awCSxBt3A3dEsj6OEiSl
	 yiYejSWVQGVlWYG0Pjq5MqZ41nNpXeykAO79JtjpjoKjN+KgYbEjqAlRvQPlVx5apIxh1
	 46UEgYCGT/JcIMGZi7m2YigzMihlslxJOoR6sdcVLarFdTvJeQdMMmbDZTOt1mxjynw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793776957;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=p8ts80LviUGClPDc+CzAUBQMvTPSUXFtWsdkH5RwrIQ=;
	b=gBugSeqlzO/ntwxlLkwNHD+QhPclr/sI5mm/oFk5XzsZEhU+er1B3DRYYA+AXAfnAd/w
	 LqvUuEv9ra8OG3dStocmF72qMVuMO1DBhoR8c8t0Ekkj4lT1Ys9anDBod2dgMLAlc56G7
	 LRjqSygf0cNFm+ZO0EIq0CgtJU+tgvle0WOYx9D6IpP/zH3NM6jtgfgtym48SZEgEPy4r
	 uSdLkoIbKSyqaGQRGRisDZ6QblboY/Tw7xv0tiEd1ZU/4+SVbdy6M3bBb/yYDHeBEyaeM
	 WZZKHReUQO7KLmu+8JGf5rLvR7QDUJDVWqmfRpGtqt32cT8BCl1CPz7d6ET3tbdAzGw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8CF8D1F000C1;
	Wed,  4 Nov 2026 07:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776957;
	bh=p8ts80LviUGClPDc+CzAUBQMvTPSUXFtWsdkH5RwrIQ=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=BH14mN4Rc/V+Rjt2J2qqDRJ7v6esZjCOYZVOEJPS0dkI+ooPIz2BTmsR0zMSGCBA5
	 7z+DcccTdfHB8thy714aPE+mjiv2hvJo9nsgXCaEVQswbzKo3mxQ81khJsPuNCZ0Xt
	 3hFmwhi3AhdsUCwqohB0S85cEK/BezgCZ6g27rdBG/lVQoNUK4Fq4mgCLFarQLFSEU
	 wdm4SX8xtURrcWUUjyY7MrLc14+t/LcBxarBev6ScedvR1vtldbjW1OUbSLTff+Up0
	 +P5mz7vBBJFhqAvIK7gcYPXJaDqhOcNw2egJuCEVWClCPmOux88NU1ADoznt+1YCx3
	 /74BDjfcTw1Rw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2071146CED;
	Wed,  4 Nov 2026 07:22:36 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Subject: [PATCH net-next 0/2] net: stmmac: Add the Siflower SF19A2890 glue
Date: Wed, 04 Nov 2026 02:22:23 -0500
Message-Id: <20261104-sf19a2890-gmac-v1-0-a15965a49574@telaak.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC/d6moC/y2NwQqDMBBEf0X23IUkiCT9leIhphu7gmmbjSKI/
 9609jjMvDc7CGUmgWuzQ6aVhZ+pBn1pIDx8Ggn5XjMYZTqtlUGJ2nljncJx9gHbOLRW2Wg7F6B
 Cr0yRt5/wBokKJtoK9GcjyzBRKF/ff5vpvdTPcgL9cXwAoL3q7ZEAAAA=
X-Change-ID: 20261102-sf19a2890-gmac-4fb4808f869c
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Chuanhong Guo <gch981213@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793776955; l=2659;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=4aX1WuQkiEXgDzkE3OQjN92P69c1uJb0rksZC2QCI/c=;
 b=5W2C6p3JKlr/OYkYYzwVZ7Y5b/m53N4KDQeoxViOd9QSaRTx62D8T06k382412ER3M30amjJg
 EQ22G8hgj8LDsd9xPfExPXtkSI+BUGn7ruvO4K5Ikn+zcvgJNRsHte8
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: joseph@telaak.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Siflower SF19A2890, a MIPS SoC for home routers, has a DesignWare
GMAC 3.73a. Its interface type and RGMII clock delays are set in a
small configuration block next to its clock and reset manager. This
series adds a binding and the glue.

The glue is based on Chuanhong Guo's driver, which read the RGMII delays
from a factory flash cell in the delay line's own units and always
applied them. Here the delays come from rx-internal-delay-ps and
tx-internal-delay-ps and are applied only when those are present. The
interface type is set through set_phy_intf_sel.

The delay line's step is not documented, so I measured it: sweeping
each delay register over 0-255 with the link at 1000 Mb/s, the working
windows repeat every 145 steps (TX) and 144.5 steps (RX), which is one
8 ns period of the 125 MHz RGMII clock. So a step is about 55 ps. The
TX eye is about 3.1 ns wide and the RX eye about 1.75 ns; the delays the
bootloader programs, 17 and 10 steps (935 and 550 ps), sit inside both.

On the GL.iNet GL-SFT1200 the GMAC is the CPU port of a MaxLinear GSW150
switch over RGMII with no delays on the board; the GMAC adds both.

The MAINTAINERS entry that covers these files comes with the MIPS series
"MIPS: Add support for the Siflower SF19A2890"; this series applies on
its own. That entry is also why checkpatch's question about updating
MAINTAINERS for the new files is left unanswered here.

Tested on a GL-SFT1200 with the GSW150 driver:
- each of WAN, LAN 1 and LAN 2 links at 1000 Mb/s full duplex and
  passes iperf3 both ways (160-205 Mb/s out, 262-273 Mb/s in, well
  under line rate; I have not looked into where the limit is);
- 10 GB each way through LAN 1, after which every CRC, alignment,
  error, drop, overflow and underflow counter on eth0 and lan1 is 0;
- 50 link down/up cycles, after which the link and traffic recover;
- the MAC address from the factory partition, and ethtool reporting the
  link with no PCS workaround.

---
Joseph Telaak (2):
      dt-bindings: net: Add Siflower SF19A2890 GMAC
      net: stmmac: Add Siflower SF19A2890 glue

 .../bindings/net/siflower,sf19a2890-gmac.yaml      | 110 ++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml        |   1 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile       |   1 +
 .../net/ethernet/stmicro/stmmac/dwmac-sf19a2890.c  | 158 +++++++++++++++++++++
 5 files changed, 281 insertions(+)
---
base-commit: 7b6ab4dbc156e2f96419715130b3d5738a306c93
change-id: 20261102-sf19a2890-gmac-4fb4808f869c

Best regards,
--  
Joseph Telaak <joseph@telaak.dev>



