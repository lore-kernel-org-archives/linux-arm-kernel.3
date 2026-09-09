Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D85C88E40
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 14:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9+LSfF6WeN65ydsS+fKszA1mpUfPTI0QyNbajR7Gplk=; b=mwETn7JoosKqCgk6O2792+if0C
	6zEHn15/nhjncGl4yRvaFS0D5pOjpoADUHYeJTAD1XSEUrEVyK63coHArcnAMWfQutugcSd8pgphb
	6+owt+iX7yBpZ/oI/iGEUGGNZITo3l0Dq32c5ioTRjarm/cwGtZ6CyiljPXYHtwbOe1iVQtY6U/IU
	IkfxLE6V2hhC5pVKJT7RJUc+QlqbmUHgqknNvaz7CtYd+/BJEDtWyqSZjddkbxVzl18vMToIUsDsz
	7NWiaRv3BbEEjkjyY8U7rvbOztphtVP4T1GjHz/I8W99O63pTCNSXDK1GhXWorAFcNg+vdOUi83X3
	KkL5eVpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4IuQ-0000000BsVD-2pGm;
	Wed, 09 Sep 2026 14:04:18 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4IuM-0000000BsQK-2GiZ;
	Wed, 09 Sep 2026 14:04:15 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 816FD3F6541;
	Wed,  9 Sep 2026 16:04:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1788962652; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=9+LSfF6WeN65ydsS+fKszA1mpUfPTI0QyNbajR7Gplk=;
	b=nrBrNkWsqrh66nD0BCrdcjtORe4Wb5aAWoTZoPzY+cBWn+xeFxQESe7ab13tKoNH9CdG2a
	8u+cwOAFL9ZdWY3p5dEGBLi7T6Iqi7RAChpkYiNtra/0K2NJ/BArzNBsH9zKj3yvcApDVE
	WUY0r0E6TcHvnNbQ+2WdpE9/N+Ek8WoPVqTERguR119evKRSmdlBcR7QWAPaMWmfmDRxC+
	kzyLRMe6Lq9BOBv0rBEnGd3mSxZxJ82EyAWKAZcTe8hJb/FMOjKjLW+VAIMNJYxrmeoaxf
	X4EGdMdpNnxe3Hq8EUMv1/L3eg5uUiPLzU7R8eX+ixC5p14qVsZ1lSPuIsYzBw==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	linux@armlinux.org.uk,
	arinc.unal@arinc9.com,
	Landen.Chao@mediatek.com,
	dqfext@gmail.com,
	sean.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	naseefkm@gmail.com,
	b.larsson@gmx.com,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH net-next 2/7] dt-bindings: net: dsa: mediatek,mt7530: add passthrough mode
Date: Wed,  9 Sep 2026 14:03:41 +0000
Message-Id: <20260909140346.2861572-3-cjd@cjdns.fr>
In-Reply-To: <20260909140346.2861572-1-cjd@cjdns.fr>
References: <20260909140346.2861572-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_070414_842829_D3A49E39 
X-CRM114-Status: UNSURE (   7.78  )
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

MT7530 switches can be configured to blindly pass packets between their
CPU/upstream port and a downstream DSA port, in particular, without
altering the MediaTek DSA Tag on the packets. This mode is used in some
integrations where an SoC integrated switch exists, but a more capable
MCM switch is added to effectively replace it.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml       | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 90b3582b7619..e29fb8693498 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -73,6 +73,13 @@ description: |
 
       Check out example 7.
 
+  The MT7530 and MT7531 switches are capable of being operated in "passthrough"
+  mode. In this mode, traffic is unconditionally passed between the CPU port
+  and the DSA port which links to a second switch. To use passthrough mode, the
+  upstream switch is configured with a DSA link to the downstream switch. In
+  passthrough mode the upstream switch is restricted, with no other ports or
+  switch configuration allowed.
+
 properties:
   compatible:
     oneOf:
-- 
2.39.5


