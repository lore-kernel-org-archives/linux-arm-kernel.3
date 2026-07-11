Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B9DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 11:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SF2r+F7aUjvLppp5OlMxLDe4toTwbQve0N2dz3KscQA=; b=h9Zd5wJck9XJUuCpVJ5hITL0WF
	3lT0xovO3qSnfGLFrfU4CMoV7ULRXksSFswxWNBTlfE4kA9L0VmBF65Pne+pk4UK5/w6gFz3oEg1R
	MdtHc+eJkmZdJUgxfdKI78655Q3z8C0/36ff+baFFLe4ysWIbcJ+qWsKOriGI5R+oSbWcJHg3G9YC
	zjcjMjJAUI/7LtxtDJJNVdhBKwZJRsbu3yc0bBvZ4PEj2L78fIlI+DXtPW4VnALXc9P9smZXr5Xm1
	83R/Ex/tlTxLidsGeFrbmkFTY7UDPQctIsdVhXyqZ8G0KLmMvUmwsWMuQ0PjyZtwlkA1BL68HhGCW
	zXytd7Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiW5G-00000006Us6-0f0V;
	Sat, 11 Jul 2026 11:41:26 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiW5D-00000006Uqv-37z7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 11:41:25 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-38dbb3e08c4so1007289a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 04:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783770083; x=1784374883; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SF2r+F7aUjvLppp5OlMxLDe4toTwbQve0N2dz3KscQA=;
        b=ks/5JrWynQ01UyNCiLAedI9yeBEZVtXLJlOmxB1sN9i4sCZ4a8UE0wZLQmnW3ezBg3
         A2/XNnEgjCQz+0vE6xVZVhyf1olrxdGjj0+AHdda2DWuk1Ow2xWugJDHMT7GoEfgI4C0
         IC3SW7YHAhl5kA7Sv9HTrHNBAPGejDB2da4wdWPvwQfso/x19gVAbzbZo42c9PS+xt4W
         c/WO15GxQG57Va9gvoskLH3T7KjPToowBXof2NS0H7qnwoCR1Z0Qx18y1oNcbRRrAI1s
         HFAxcgPzdjSLvB0u4s3NH/jyMh4taFglkTk8l4SPU7VZXnupc7Dg6+1LriSd/p3LrHqd
         k4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783770083; x=1784374883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SF2r+F7aUjvLppp5OlMxLDe4toTwbQve0N2dz3KscQA=;
        b=S1VxZO34N1CEtjXNYl/+yfC3OcFHvUI5ipZQR094PdVTCmXbrl17Wo7dYS6/2rRssi
         +7BxCJq4XdBLHoScY16ZbwbAko8qHrtNOCbE4Aoefl9hjlDSRAjZhhlc0ezpoBwZIWjN
         9Aeb/vLNlsx7sPRX1UAuEppD/kTKonfgy87fX5KjoHgyYCGQ5CoV1BXxCM6Ae561zuSn
         3qrncxHVS7d3aCBqo/EanelDH6pOwwKeYUz7v94aCZNQyQaNw+jgwXoYjuf4d32mWEFC
         o+3n9gDDeR7ibZ4yqhvEmqQqtQRzosLz4gZjE+k1LYjZG89vh04ZbPj8oxJX0lSgwLY9
         0C8A==
X-Forwarded-Encrypted: i=1; AHgh+Rr57z90VXzbWwY9AdAxf0Gkju2Awl2e77YetqGuamv2vC/EemOJGO0LZEgbDlBv0gfLuF6r398xsTHIb+n/vy9N@lists.infradead.org
X-Gm-Message-State: AOJu0YzBoZIzGt8oDcUnEoQYHSQBDik+4PFLUuiM02We7tAzLCFEEve8
	uy8/ywfKHpw+vC8qTt4/CdY7egL/oy0LJQ8/F2ZQVRA+jV+X9aJSrLbx
X-Gm-Gg: AfdE7ckSIWGVw8Jd2sTJ8TnDR2rT3uxhh8D4A6kERekIT1oZtgM8EXUlpUq01J0u2rr
	E1QOFj2peqoelRkPZVTs8ECjZ6iEzc9J6UXaz7aYV87UtysEtgcGNKFw1BLRYhltc7+EYS6PBUG
	HcmRDlTJ3dUDKpCEjotyROm3Zgg79CdjbhwpReS1WkcLflAa+Dg90V53oLK3q409KlC6u5KAUY7
	WKS13yn+gdWcZ/HOfu/nKcfRZ/MAsER7Ak5iyC0ruj416+oNrckjOqF11V9fiidBiTuNk9lFkM+
	4BClk0f1A4kfxaYfFDlQE9yvu8bOfPAjSbjHkZYmamukDAlOvu22uFimKI5wGeL9BefvajEsLGB
	NsvF6mn+xzy7zf/euHmsP33L+/+X9XgYH8XHmWCIhvFXVrJSEAxsftFg4u3CcPpqrd9uX+WStiO
	mbFsy/sLiGavnrYl4OcUk2
X-Received: by 2002:a17:90b:3f0f:b0:36b:b3f4:d578 with SMTP id 98e67ed59e1d1-38dc75e607fmr2500103a91.15.1783770082826;
        Sat, 11 Jul 2026 04:41:22 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.dm.ae ([49.47.198.15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm32390087eec.24.2026.07.11.04.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 04:41:22 -0700 (PDT)
From: Ahmed Naseef <naseefkm@gmail.com>
To: netdev@vger.kernel.org
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sean Wang <sean.wang@mediatek.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Ahmed Naseef <naseefkm@gmail.com>
Subject: [PATCH net-next v2 1/2] dt-bindings: net: dsa: mediatek,mt7530: add econet,en7528-switch
Date: Sat, 11 Jul 2026 15:41:00 +0400
Message-Id: <2133035bb22eacc8a0e21f86c0c800a45023ee01.1783770059.git.naseefkm@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1783770059.git.naseefkm@gmail.com>
References: <cover.1783770059.git.naseefkm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_044123_792888_6CFECAA9 
X-CRM114-Status: GOOD (  13.95  )
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

The EcoNet EN7528 MIPS SoC integrates an MT7530 Gigabit switch,
memory-mapped in the SoC register space like the built-in switches of
the MediaTek MT7988 and Airoha EN7581/AN7583 SoCs. Its four user ports
are connected to integrated Gigabit PHYs and its CPU port is connected
internally to the SoC Ethernet MAC.

Those three switches are MT7531-based, whereas the EN7528 has a genuine
MT7530 switch core (its chip revision register reads 0x7530). The two
generations differ in their register programming - for example the CPU
port is selected through the MT7530-style MFC register rather than the
MT7531 CFC register - so the EN7528 is not compatible with the existing
switch compatibles and cannot fall back to one of them.

Add the econet,en7528-switch compatible, with the same constraints as
the other built-in switches.

Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
---
 .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml         | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 815a90808901..90b3582b7619 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -100,6 +100,10 @@ properties:
           Built-in switch of the Airoha AN7583 SoC
         const: airoha,an7583-switch
 
+      - description:
+          Built-in switch of the EcoNet EN7528 SoC
+        const: econet,en7528-switch
+
   reg:
     maxItems: 1
 
@@ -318,6 +322,7 @@ allOf:
             - mediatek,mt7988-switch
             - airoha,en7581-switch
             - airoha,an7583-switch
+            - econet,en7528-switch
     then:
       $ref: "#/$defs/builtin-dsa-port"
       properties:
-- 
2.34.1


