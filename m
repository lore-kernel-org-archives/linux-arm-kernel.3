Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E6FCD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 07:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NyTu92Zpl4iFWsunxbLWvI4/2I1YGqKD298epHlDZtI=; b=Igb8p3rAOThXH8RLODAl4YjJWj
	B1tiBRW946txBLWKfGDOlUTgr7IjHQaf+yAlM978NyrBfhwHDReQuwzeZ/DS/lhsHzT9G3sUkb2f5
	iDzRZgsMo+x1C8oORCzHh/am0yynfpud7UUXaprl75nWbyNVlGkUowTkyNrQ6S/RAR0SX2oC4vGUN
	3/9t1jdXNAghcPrZfKll4OVaCb5g83wbRsfBl8q0xWtQfB049VFj/RzZ+VzEJWYYgE9eW3rW7XiK5
	m9ai60ZBSTJY/msXR1EvfzLa/zkJoL3r3mFu/Mn9agp3qBFzPj7hArBJAEuKcKMxlfM8otOsueJG7
	RPT1vJKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa7Mw-00000000mxk-2W69;
	Thu, 18 Jun 2026 07:40:58 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa7Mt-00000000mw2-0IFk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 07:40:56 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-37c6cd1ac98so539137a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 00:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781768454; x=1782373254; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NyTu92Zpl4iFWsunxbLWvI4/2I1YGqKD298epHlDZtI=;
        b=Ec5S4+hw3KaltXKrczXbJxOlAKMspRYTlQiN1ZH/HspZwpqxWYYx9Ec5/Jq7uZiOTr
         LYXeXl6Ig98z9GEJiZFriHImtrZzasVUYQTVUPem2XfE7W/G3PTVxtSyo36ZPtI5Hn5i
         vEqEvIsuHgMogyQN826+wSfu7KpW3pSu4rTF3OgtylZ5XILlLeW55SuIscStvLwfjuNX
         SXf8uSWbQJ3juv7H3fBZaA5wp0Asj29BYC3h7kU0uwk07JFkMhffy579gxeZNncb9K07
         kut3abfc3uEOCSQ/4Ljt8GQbMmmmyplpbS4H3AIvjGe8qqCRwL37JHrhBBnOXY6gsRM3
         6eVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781768454; x=1782373254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NyTu92Zpl4iFWsunxbLWvI4/2I1YGqKD298epHlDZtI=;
        b=g+7rur6TEzPyzzwpmsd3YI6HfDwIYiNZjxCtx3pKnSHYEMSAq7xQrZsDGugf0bN+Oc
         5Nup91FkPvI2XZgv+jGbBLj4Ko88QPFeuvZnGPU8dHGxrh1KPElACWmvWldtmUr9rWsf
         vvXL0sZk57bqEK1G/xngN59w0UwG45hRXYlBtydfhoY1jq1hnGuo1N+iIeQGMFxggZGR
         33YVMwdnpZZaJh4eDzpZLc4WUO5JY5/Ajoeg18ZL7r5PAhHD/FDcY8nNj6llWGTt7gl+
         cEdWzVAPdrN9km8cirRjqbN/Occc0KlVtpu6YnTzAWOh66YSITfq42O8c7Xk3l2eOjCf
         uiFg==
X-Forwarded-Encrypted: i=1; AFNElJ9crr6Fd3flyvFBxQ/1YFqhJZOw/C0rtnau1s5ktGmj/KHQAS4KUdUCVdBh5oxF7fZP2DoLNXi5tJOaJwaApqlQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxLoqH84StzTY4nFXyustxEYoEjTvAtfjRhGns/sZUQLtMgMH3Z
	nE4PUYXp9B7RUUW9dyQ6V9a1yXTivVHzDSJj13dAcDDVdK12cqq+1n9N
X-Gm-Gg: AfdE7ckFbGboUYhMyZl9iJLH0IHWqOX6v7MCeZfEUMKTAQi/vROrPqycapsR0kuxMPm
	IRGHKiZkUXYPYYo1vsbUMyXAXZM0rZeLwmfcwwfOuLMid4YvOeK/HakItr9v6tr2HpkKC9exJ3O
	+Rpg6CMZWYNC9GLrJATDEh/IdkH7TYLBlsaVTaynRD+8PV4uy6JAXENmdmkYPIyesVxFt9Emww0
	XycztWJYP6r4lViM7fceHdzEqvnp2zlIqqfVzDH/t3icBufKCTBl5U0MjPkb6U4KgHzKDBkbdjf
	km08Pc4JWbyOBoCNNrX7anP3OHskgxVmZkDzzaqU+Z/5IdqsGfzGu9pvcHwRSGekK2VbsvR53aK
	AUyIlp0YAA5hoszoIJXdamfmwa93swujhzG+PnXuJ44fqkoVaMJglEZyMVYyqylexhqQr3v9eWr
	f7yRdpInC9zSRAhed+YI/KRdrEe21lSwp3JYBkzseNuOFI2q/HW9BXOVbI
X-Received: by 2002:a17:903:950:b0:2bf:1fbd:b946 with SMTP id d9443c01a7336-2c6bbca9fc0mr82427775ad.0.1781768454016;
        Thu, 18 Jun 2026 00:40:54 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327ac80asm170465445ad.39.2026.06.18.00.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 00:40:53 -0700 (PDT)
From: Mike Hsieh <mike.quanta.115@gmail.com>
Date: Thu, 18 Jun 2026 15:41:45 +0800
Subject: [PATCH 2/2] ARM: dts: aspeed: sanmiguel: add current-range
 property for PDB HSC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-sanmiguel-dts-config-hsc-lm5066i-v1-2-cccf959c9b78@gmail.com>
References: <20260618-sanmiguel-dts-config-hsc-lm5066i-v1-0-cccf959c9b78@gmail.com>
In-Reply-To: <20260618-sanmiguel-dts-config-hsc-lm5066i-v1-0-cccf959c9b78@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Mik Lin <mik.lin@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
 Mike Hsieh <mike.quanta.115@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781768507; l=1681;
 i=mike.quanta.115@gmail.com; s=20260522; h=from:subject:message-id;
 bh=h7xakdJPR9hp5BA+O9WCA+8GKkcNDqtrcIFBDvQTtso=;
 b=4B0AKEFAQOcmD4z2TjXWcq5Iu8iXFKS5qLvXFAVhpN8p4jGBM4FxsZpp+iXlGTIDWEOvwsfhw
 gBfwcTkj7R6DM2PiBnVgBz7fPy4LsIpCOXtkY74OXnxA/XwdsOumh76
X-Developer-Key: i=mike.quanta.115@gmail.com; a=ed25519;
 pk=DRIErV0xX0KMBlR/irAsbuN4L3egitHbC8FHruUH4HE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_004055_119565_A82D6EB2 
X-CRM114-Status: GOOD (  10.16  )
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

Configure the ti,current-range property for the four TI LM5066i
hot-swap controllers on PDB board.

This defines the hardware current limit operating mode (low/high)
for each sensor to match the physical board design.

Specific configurations:
- HSC1 (0x11): low
- HSC2 (0x13): high
- HSC3 (0x15): high
- HSC4 (0x17): low

Signed-off-by: Mike Hsieh <mike.quanta.115@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
index 3faac0925a79..e518e3fc1c97 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
@@ -451,6 +451,7 @@ pdb_ti_hsc1: power-monitor@11 {
 		compatible = "ti,lm5066i";
 		reg = <0x11>;
 		shunt-resistor-micro-ohms = <1000>;
+		ti,current-range = "low";
 	};
 
 	pdb_mps_hsc2: power-monitor@12 {
@@ -462,6 +463,7 @@ pdb_ti_hsc2: power-monitor@13 {
 		compatible = "ti,lm5066i";
 		reg = <0x13>;
 		shunt-resistor-micro-ohms = <321>;
+		ti,current-range = "high";
 	};
 
 	pdb_mps_hsc3: power-monitor@14 {
@@ -473,6 +475,7 @@ pdb_ti_hsc3: power-monitor@15 {
 		compatible = "ti,lm5066i";
 		reg = <0x15>;
 		shunt-resistor-micro-ohms = <321>;
+		ti,current-range = "high";
 	};
 
 	pdb_mps_hsc4: power-monitor@16 {
@@ -484,6 +487,7 @@ pdb_ti_hsc4: power-monitor@17 {
 		compatible = "ti,lm5066i";
 		reg = <0x17>;
 		shunt-resistor-micro-ohms = <500>;
+		ti,current-range = "low";
 	};
 
 	pdb_ioexp_20: gpio@20 {

-- 
2.53.0


