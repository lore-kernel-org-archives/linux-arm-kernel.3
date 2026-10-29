Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFB3606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 18:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KQ+XjX+G;
	dkim=pass (2048-bit key, unprotected) header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=NELsSHRp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VY1Y9Wrs674y7GrLGEyeMMqNpydE7jf2tJurMnaK9fI=; b=KQ+XjX+GpDnNGS
	CPipLC0Nqk2VW7Zhv7lJFlNe3DrziQK7j92UxlKbdZiJwo20pUg1mG+jesNgVnBXWZjnljH265S2B
	wyUk3Dis/4h76uSJdrD8i8NcYQSJhrZs8FcDLmSarkNOkDEGzHAOg5e4DKm3a4O5TKdBufeLNHNuQ
	unVjjAMUXjE/4XCXTeeb1vKXSK/shLSclN8RKeTcSyrZgGjnZHkEC7SIEk48OryqCr05xkKcwU3ei
	mIjhDmxxO8b0alXD/k1DH1EoFB0CR2UmPOUBmWME/NRMJ8H1sGzkafHx9VKFN5KZsTG0xkpVZyeXg
	Dsul53Lo7/v1VrLMtq4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMV59-0000000A8Vm-0Cqm;
	Thu, 29 Oct 2026 18:42:35 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMV52-0000000A8R8-0ge5;
	Thu, 29 Oct 2026 18:42:29 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D73911AA31C;
	Thu, 29 Oct 2026 19:42:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1793299343; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=VY1Y9Wrs674y7GrLGEyeMMqNpydE7jf2tJurMnaK9fI=;
	b=NELsSHRpm5LMd7qDM9rSeMlKqQW3jloxpskiGZPcQDDu5LUaXRnYaRO8nRknwkxWRK6GhL
	ssJngc4y5g81ySxtxmdRMic2waS/UCNYnHWv/sacCFj7yCK2YJjvz5ndtxd7YWwXvYVObr
	3EjnNGt17JMV7owm/JsHVaav/Xk5KF3KsBGGyCGDXX0IV+Hp5+NfJlYh7x4dRgplm28qDX
	QGKoqGR1yHNa0hJqqdkpS4VsnkYTSlKk5qZbCkqyKZm+Fow3voVxlBRf+jkwLuPRTNeHan
	pdHq7H+d0Mqd0nJqbFdLzKkzVGoSJpW97XWRGNIxs8GLR0Zci6cYiKZ2kl4ydg==
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
Subject: [PATCH v4 2/7] dt-bindings: net: dsa: mediatek,mt7530: describe 'passthrough' hierarchy
Date: Thu, 29 Oct 2026 18:41:57 +0000
Message-Id: <20261029184202.1859843-3-cjd@cjdns.fr>
In-Reply-To: <20261029184202.1859843-1-cjd@cjdns.fr>
References: <20261029184202.1859843-1-cjd@cjdns.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_114228_403812_8ED1AC58 
X-CRM114-Status: UNSURE (   7.33  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Due to hardware limitations, full switch hierarchies are not supported
with DSA based on the mt7530 DSA tag, however it does support a simplified
hierarchy in which one or more switches act as passthrough conduits with
only one CPU port and one DSA port active. Document this capability.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml         | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 90b3582b7619..f98b9113ad12 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -73,6 +73,11 @@ description: |
 
       Check out example 7.
 
+  The MT7530 and MT7531 switches offer limited support for switch hierarchies,
+  particularly in the case where one or more switches have only one upstream
+  and one downstream port, and can act as blind pass-throughs to a fully
+  featured switch downstream.
+
 properties:
   compatible:
     oneOf:
-- 
2.39.5


