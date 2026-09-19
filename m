Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034DBC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 06:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DhDYniwbZK/cLIuF0+kBZ9daKL8rPuxnkEwAZ8qtlXY=; b=bDc7S8OyBu5WQNfJlRW3BcrxiU
	/lt3FPjVUYSEJN4+0Am7SJWEmEz61aM9ErnAgOZj8aSvEl6vesZWM2zcUMXQDNdxlMUIcE4EpJzIg
	5fubhOskEuqObLgFsFSxrPeHWv7CGZ6rnDbTccbQk3mP5g6sXOIFXJwTjeTs4mV9O/OQMu+4zYFxp
	tJVTt+ESOmzrdMXAbbxZuINWh64EuwTM6Bbqy+bmPKeHsmdIZeqP7uJe/QAn/iIO+imaSSFcT1GG6
	j65iCDNmLbnm9rJrHCswuXWR9nhg9Mx/fCL24LEdDWBMxiC5miuGMnCZwjZEn4JbWmdhjFJCRyg5b
	3prkwrsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ovt-0000000G07U-15aK;
	Sat, 19 Sep 2026 06:52:21 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ovq-0000000G064-3q1S
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 06:52:20 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-86ec25cf7ecso2379834b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 23:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789800738; x=1790405538; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DhDYniwbZK/cLIuF0+kBZ9daKL8rPuxnkEwAZ8qtlXY=;
        b=baxxgRv0vUDWHaPN0HSnIBaRG0EuUixM8SPAdcZgvqTGhgpQkErtNXZwxUHKjcr9kE
         rRtOLqcUsCbs+10dZKCy8fL8iQZ2UgWhbjAFziPf7zRDFfdd2/AOHntWWqbLRwgYTLPt
         jYGRb4Fo2eoevNIQWHyVaYpubWFPzbiiUC/e0QYKVDXcz9+7kR6AR/UsmueTT2XgT6rG
         z35igFU+cxk1ud35FEpoh36m4q738UpQSA7a260gKJTdMpQooB2Tfj/x3L9IK4LV/0jE
         JnR6iuJb5LlYmgzuLQj7BqBYrsEZ5ktF73w/iNAfcUIsJQFPyjWSkQbm12NgaXIAOoSf
         U3ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789800738; x=1790405538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DhDYniwbZK/cLIuF0+kBZ9daKL8rPuxnkEwAZ8qtlXY=;
        b=w64uNX3EB8GfVhcjdawzisWpOE2aJdPDQNVV19j/PsXAgCb3C52uKMaiKw07ye/RPw
         xgimsASAjMFlip+FcUvTtRwv0OuPCTsPJ9QO/Ze5YYnqI3lIyRIwEHs373CR/AAHCMqu
         VS+XTdB8dHDuhYcx4jfxbQeJUWiUPyGfStglhf+8qlLMDQ+1ew2a1Ta8uYXsPz0gRDXf
         jhPWtt9BR1YWAj5t+w41z9+L54AIVSytyvtWIzw/BPfoPLvOm8HlHQJLbZPc32s5v8iD
         rPi5TThwAQ6fFNxy3mDbexKfWsUcn6VUh62aB/KVIhyhF1oocBK2riy5DRjnZ+KyYp+Y
         c1BQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHgv5Xb09ihNJJqs0T5ds9QNlf/flwgQnpnhHmvB4qY3pSfBYrVKrHtaxtDxIWex1QVjsoFgJmbWmtGWeaHhJy@lists.infradead.org
X-Gm-Message-State: AFuF++mgWuumJvTyt64ScI3s7D2NeJE84rL1D01wdEuq10meH11iwF0c
	TaXC2ZzWb/fIPQg8tZ6X8y7c3uSCFBO2NmuD2qjq1h5gtJkefqx1k83o
X-Gm-Gg: AYBFou33Qm5voPIAvsI4yG4Ee/iOzZUILt5MkkkqQTua6i9zBFFa3PrV8P20Rfe5Dwq
	sjz9uG3J5b/UEWLLj5DxZsJ4oz1dUQ6l31sRb+69MiC3yUVu/0hZ/PojYTkIK1jzGia/l/9noLj
	BiYd2Zu4yucH92hzGBzi9zmf2iT96A8rHbTwwubkNB596MgwzOvVsLcCSA6F21lIKYTMSK9vAoY
	kQqIqo+k6X+uX5hPDEkU8htIaC53Pyi2kQL89hlUQzHecCghGqYC91FGXmtWmTGD7nj80Ly9EfT
	CdGdnjc1RHkP03ylsvoqKyHwuZRvMIwSdL4UQvMxbpCYbIc2mtsYU/CqhZ0EOjINw2I5GHaZWg5
	uicUod1n2H0oON4R8TyCLiWms3VyYALcsl+g1v+AJT8jYKn96yFUR0czysxgdcyRaDjRMCpIeXN
	Lwi6tj6j7c/3odBKwPIj2H5SUCGnkng3Fc4GeGu+rdV7yB0oNL5vSSSeMgQe8dZp2tr0I8SSnNL
	DP4sFrSFBJtExrdfBijJAOvUed30FMUMA==
X-Received: by 2002:a05:6a00:3905:b0:874:72b6:7da4 with SMTP id d2e1a72fcca58-87472b680f6mr7159549b3a.31.1789800737620;
        Fri, 18 Sep 2026 23:52:17 -0700 (PDT)
Received: from abs.sf.dndws.com ([50.35.86.68])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f5464sm678077b3a.27.2026.09.18.23.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 23:52:17 -0700 (PDT)
From: Tao <gongtao0607@gmail.com>
To: netdev@vger.kernel.org
Cc: Tao <gongtao0607@gmail.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net 1/2] net: dsa: mt7530: use consistent egress tag for trapped link-local frames
Date: Sat, 19 Sep 2026 06:52:11 +0000
Message-ID: <20260919065214.31604-2-gongtao0607@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260919065214.31604-1-gongtao0607@gmail.com>
References: <20260919065214.31604-1-gongtao0607@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_235218_959855_FD2AC9EF 
X-CRM114-Status: GOOD (  16.24  )
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

commit 3ac85bcfd404 ("net: dsa: mt7530: preserve VLAN tags on trapped
link-local frames") changed the egress VLAN tag attribute for trapped
link-local frames in BPC, RGAC1, and RGAC2 from MT7530_VLAN_EG_UNTAGGED
to MT7530_VLAN_EG_DISABLED, with the intention of passing frames
through without VLAN tag modification.

However, in MT7530 hardware, MT7530_VLAN_EG_DISABLED disables the
protocol-level egress tagging override, causing trapped frames to
fall back to the egress port's active VLAN table (VAWD2) rule. When a
bridge with VLAN filtering is active, the CPU port is configured with
stack mode, causing the switch to insert a VLAN tag into incoming
untagged BPDUs (01:80:C2:00:00:00) and other link-local frames before
delivering them to the CPU conduit.

Because BPDUs arrive at the CPU with a VLAN tag (EtherType 0x8100
at offset 12 instead of 802.3 length <= 1500), userspace STP daemons
(such as ustpd) and the kernel bridge drop or ignore them, breaking
STP convergence.

Use MT7530_VLAN_EG_CONSISTENT instead. This instructs the hardware to
keep egress tagging consistent with the ingress wire format: frames
received untagged on the wire remain untagged when forwarded to the
CPU, while VLAN-tagged frames preserve their original VLAN tag.

Fixes: 3ac85bcfd404 ("net: dsa: mt7530: preserve VLAN tags on trapped link-local frames")
Signed-off-by: Tao <gongtao0607@gmail.com>
---
 drivers/net/dsa/mt7530.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 14692497e1a6..863f2079833f 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1245,39 +1245,39 @@ static void
 mt753x_trap_frames(struct mt7530_priv *priv)
 {
 	/* Trap 802.1X PAE frames and BPDUs to the CPU port(s) and egress
-	 * them with the EG_TAG attribute set to disabled (system default)
-	 * so that any VLAN tags in the frame are not modified by the
-	 * switch egress VLAN tag processing. This preserves VLAN tags
-	 * for reception on VLAN sub-interfaces.
+	 * them with the EG_TAG attribute set to consistent so that any
+	 * VLAN tags in the frame are not modified by the switch egress
+	 * VLAN tag processing. This preserves VLAN tags for reception
+	 * on VLAN sub-interfaces.
 	 */
 	regmap_update_bits(priv->regmap, MT753X_BPC,
 			   PAE_BPDU_FR | PAE_EG_TAG_MASK | PAE_PORT_FW_MASK |
 				   BPDU_EG_TAG_MASK | BPDU_PORT_FW_MASK,
-			   PAE_BPDU_FR | PAE_EG_TAG(MT7530_VLAN_EG_DISABLED) |
+			   PAE_BPDU_FR | PAE_EG_TAG(MT7530_VLAN_EG_CONSISTENT) |
 				   PAE_PORT_FW(TO_CPU_FW_CPU_ONLY) |
-				   BPDU_EG_TAG(MT7530_VLAN_EG_DISABLED) |
+				   BPDU_EG_TAG(MT7530_VLAN_EG_CONSISTENT) |
 				   TO_CPU_FW_CPU_ONLY);
 
 	/* Trap frames with :01 and :02 MAC DAs to the CPU port(s) and
-	 * egress them with EG_TAG disabled.
+	 * egress them with EG_TAG consistent.
 	 */
 	regmap_update_bits(priv->regmap, MT753X_RGAC1,
 			   R02_BPDU_FR | R02_EG_TAG_MASK | R02_PORT_FW_MASK |
 				   R01_BPDU_FR | R01_EG_TAG_MASK | R01_PORT_FW_MASK,
-			   R02_BPDU_FR | R02_EG_TAG(MT7530_VLAN_EG_DISABLED) |
+			   R02_BPDU_FR | R02_EG_TAG(MT7530_VLAN_EG_CONSISTENT) |
 				   R02_PORT_FW(TO_CPU_FW_CPU_ONLY) | R01_BPDU_FR |
-				   R01_EG_TAG(MT7530_VLAN_EG_DISABLED) |
+				   R01_EG_TAG(MT7530_VLAN_EG_CONSISTENT) |
 				   TO_CPU_FW_CPU_ONLY);
 
 	/* Trap frames with :03 and :0E MAC DAs to the CPU port(s) and
-	 * egress them with EG_TAG disabled.
+	 * egress them with EG_TAG consistent.
 	 */
 	regmap_update_bits(priv->regmap, MT753X_RGAC2,
 			   R0E_BPDU_FR | R0E_EG_TAG_MASK | R0E_PORT_FW_MASK |
 				   R03_BPDU_FR | R03_EG_TAG_MASK | R03_PORT_FW_MASK,
-			   R0E_BPDU_FR | R0E_EG_TAG(MT7530_VLAN_EG_DISABLED) |
+			   R0E_BPDU_FR | R0E_EG_TAG(MT7530_VLAN_EG_CONSISTENT) |
 				   R0E_PORT_FW(TO_CPU_FW_CPU_ONLY) | R03_BPDU_FR |
-				   R03_EG_TAG(MT7530_VLAN_EG_DISABLED) |
+				   R03_EG_TAG(MT7530_VLAN_EG_CONSISTENT) |
 				   TO_CPU_FW_CPU_ONLY);
 }
 
-- 
2.55.0


