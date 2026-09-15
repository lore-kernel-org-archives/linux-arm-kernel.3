Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978DDC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 17:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9+LSfF6WeN65ydsS+fKszA1mpUfPTI0QyNbajR7Gplk=; b=k2Fg2CzWApxC1ekfLOk4HAk2k1
	kglxRtuRrMmSFcsuaqj3AlY8pmT+9sFq0CAi/hxjES6SHeuZy2jk6915s/XYeost62nFdm87HI4Uv
	3bqN9w0KNIOLT5sqvNFmSPpNc/0/MNjsnrO8mauOJSuwhNGCSAZPX8ZxAzJ54ijQlsZgEHnW+4D3Y
	15rDws2upBK8V/F4ak7XwJZR4/nfnJsX0w7ciCJuowVyVqrUvlUcp3aEqUT6AnOQPn/4aZ9g+YXgd
	mqlNxDgPI240+UENzbqZNnZjVhADMfCdwY5dddY9hY70ftIzX8AYr+wiEpGw6A7KZvCsaAFNQOkVZ
	PpIy0NCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6XFY-00000007dCu-2u4H;
	Tue, 15 Sep 2026 17:47:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6XFY-00000007dCF-0iqo;
	Tue, 15 Sep 2026 17:47:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9+LSfF6WeN65ydsS+fKszA1mpUfPTI0QyNbajR7Gplk=; b=MFeqYgvM8nJX4pplslPtz0+w+/
	+rEfNw4N6dU1NwgCcViMz63eyl3XGM5dPAlo9t6b+7TQRAly5c4QIo09dZR++ZtlQgyNnNZlwOzqY
	OffxnHVfM+GEodMRGDRFrBKF+1NokP5JTzDZYP1fPtfv2xTS1kfV28tSYcRu56dkIzLxaXsYEYhYG
	REWqw1ZXTpk1H/XZ4/5UYFtIGXO24YCmntjg1/ZcsNrN3X5LqXDQc2kkRsHgrF95E3jOrAcTDvP1P
	vg2RxBHCJu/XV656wfzDyG1EbNhkJKJk/H6tPezJxBIz9n/Vrk1BG4ddolwph/9offenFEhILuLTt
	MClalM/A==;
Received: from mail.cjdns.fr ([5.135.140.105])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6XFV-000000076ME-1cX1;
	Tue, 15 Sep 2026 17:47:19 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9B36948F1D7;
	Tue, 15 Sep 2026 19:47:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1789494425; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=9+LSfF6WeN65ydsS+fKszA1mpUfPTI0QyNbajR7Gplk=;
	b=DcBGrstMfLx9yoDYxrN/8CrGgrPZ5Q4XJs14cpcSavxOgzq21UuhKFhZrDP0ev6EsahPyX
	0iPQDXTfrmRoa+W3cvkWSyozvmH9luEptcqX3rxK6L84MvCzddcYauD/fT1k9YrNFDJFDr
	kDpa7fYzFjVC9Q89yzqxMqFYJROZfW0r+UG7Jr8HnOVwdaV+bD5tYe2+XeXZsEuktp/1Qz
	O2Q34pdpzVS8UPiCpIkcIGEuYhIs8LC3eNrpk6zgla+tszhz2upnMN5wmUEzg2sn0ZcqRX
	8BJ8kX6K5XnsmTyrB53IaYTJxVfHt0ZzN43iULfcOLTQnGSf9wJH6e3V+qldZA==
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
Subject: [PATCH v2 net-next 2/7] dt-bindings: net: dsa: mediatek,mt7530: add passthrough mode
Date: Tue, 15 Sep 2026 17:46:38 +0000
Message-Id: <20260915174643.253660-3-cjd@cjdns.fr>
In-Reply-To: <20260915174643.253660-1-cjd@cjdns.fr>
References: <20260915174643.253660-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_184717_672877_C9915346 
X-CRM114-Status: UNSURE (   8.06  )
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


