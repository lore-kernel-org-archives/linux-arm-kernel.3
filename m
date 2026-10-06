Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E27CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 12:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URnF0WpPNT76iwwx4OUHbknNShXeDW8wlFWgezHCYwk=; b=ngrCWLJ5XYmLLYeCQ+FmmG67dY
	lybK6ANmV5kWTYhcv1nMlaJNxvY3Ms5j9wws4CE9ghcd8S7JWonSzlxODssCdZPDnoxUxWIX3tfw7
	eN8Et/2kSA8rcbw0cdA89ZDWMZR1YGwzhXxeW2VhMno9vNZIOTnfstjAnLmDsk21ZpqFD0nDq/BHs
	GbolGGid+9H03Qbl4wlNLmUIXrhvygf+I09Wo7qbvwAa250R/LyiGBPq2+WdzRo6sVP3gwGpaMy3o
	p9Irj1wcrBpN2DmRdgvz08xoSAxiiX9YlI2czXuXCo8szlnhZ4MvsPwLQ/Yh7dSYl2tToJH/YbgK/
	tZXUvOog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE4aB-00000000nC6-2fi4;
	Tue, 06 Oct 2026 12:47:47 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE4a5-00000000n8j-1K9p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 12:47:42 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so13195675e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 05:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1791290859; x=1791895659; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=URnF0WpPNT76iwwx4OUHbknNShXeDW8wlFWgezHCYwk=;
        b=akjMdBcPqJzJNt+yG3iC0GkKbpI9h8qA+vgMWW8D28T35ChIk6+4H76GMevImFkzrh
         iEme3HFp2kL1b42w5zGeo2SydyNND1ACBkKC/VHg9zyctvB7ylECYg19uwEIcC5eJGXc
         KFHozm2tXmbvU0ArMnMVeWcrk8MZrfVW7eu6hiMjQDINft7C0ZHscAKNw72BDtKfujjb
         Fz/xEtvCZt2R3PIkUyKZEuayw0qhjLAIwLkOsdCgqHBOemW443tq0ijfKEK9/qNgjRkh
         bAYL6CXVm8J3w0BXARqfbBJ+4b+/Gs82QRBQC0DOjlpc6ryLPfJeHJg5LEowPECT4VEw
         9JjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791290859; x=1791895659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=URnF0WpPNT76iwwx4OUHbknNShXeDW8wlFWgezHCYwk=;
        b=SbxibEDSLbywvqZbz9/qp2sWhcAKUTjGft3+hiqYprvqLxvM7jTUPm7dl9/5aQ+m7c
         xKjz8AKB8tHWKs56YzS4hgVOhN4rvFIG37VobW/Z5upKswm/0gSV5bq/eXYM+FJCS89D
         1LUrbKct7yqeTfGPWBhmW9F6Rvp9ZNhZPCHZM7M5a9hRaoPd6E/2saYEdT8y+PQygTPQ
         JTBo1Tv/pYbo2Wq8kklQoOK+FSHGsVdVOYMKiRluih2lEHr+MHy+tsP9XIbLQn2CgHTN
         LgfCI3DH6HAFRdoyEJ+zP7l7lNij1kK5kT6cNrLToXccgv8kuFNfnUbsn3XCNPTzf1a5
         JTJg==
X-Forwarded-Encrypted: i=1; AKwUvBz64cojQ5q0/wHxBnfT/W/2H0L5Jh2PocfmV73FB8zOsMPUYnnTbrKoXv+ioYhlpgY9381Kud/nssty2wspgXca@lists.infradead.org
X-Gm-Message-State: AFuF++mirWn84QMJLylxYqxnhkgzFn6dFTKufyi3XDy1oknztQWLnKh9
	8iv0DrRACyhg04vdVQYx5yMi0WQa/NSu03Fb6a+1RYNVE5zNN2QAXXvwHtizVs9hXQY=
X-Gm-Gg: AYBFou0dOWn1wepWwlVuSzJYhIPzX3+DyqjWyHVOOzQLJj5iE90zvGG2i+9X6aR5l9k
	k+25NE3Wz8Pyb1G0/K/u0za3owCs4pPOUJuZkxuCaLmmUxW4fiUB9UcCI+rSda+XYJKc8XMcbh4
	3yDPLnks8abuP9bSQY3bST7HNH+EnyG+OHk9sQeNw3b9u1VDGa1hpG1Cozhsisv8EExWSq8k3x2
	GiRWRClKTbCJNoxSV7ydHmAXT3GaZmYhL+M5bzJMZq6LN/eC7Mg9ZFGwvu1aaTP2nlKZlzRgQqg
	XCxvQB3/boetXOXm3dZpYmS28wimW6ajeoVbGwsvcRvlZd0LdaaRzsI40tJAM2bPbLqAlARtTgK
	jNZM+8KY+5RN0idC9ipNs3H/B5g8BnNsDPP16W8/HJNnkIg7xLY9evTbJ5kmlE6nnVSIXYMcZko
	KIn2lknQBaSthgUIDd2nEU0wxhRvdN7eh06xJ5pVzfoNwiV4FEOw==
X-Received: by 2002:a05:600c:4f81:b0:49d:4ef:bf70 with SMTP id 5b1f17b1804b1-4a17b53be50mr23583605e9.10.1791290859097;
        Tue, 06 Oct 2026 05:47:39 -0700 (PDT)
Received: from remote-01 ([84.17.55.224])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622b4685sm9722003f8f.41.2026.10.06.05.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 05:47:38 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v6 1/3] dt-bindings: net: ethernet-phy: add needs-host-firmware
Date: Tue,  6 Oct 2026 15:47:29 +0300
Message-ID: <20261006124731.1528963-2-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261006124731.1528963-1-f@lex.la>
References: <20261006124731.1528963-1-f@lex.la>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_054741_374887_21F765D5 
X-CRM114-Status: GOOD (  18.72  )
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

A PHY can be one that the host has to load firmware into before it can
be driven at all. A controller that connects to such a PHY at setup,
before its driver has loaded, gets the generic driver or no PHY at all,
and one that connects only once gets no working PHY on that port for the
rest of the uptime, even though the PHY works seconds later.

The flag declares that. A consumer that sees it keeps the port and
connects the PHY once its driver binds. It describes the PHY, so it
sits on the PHY node and needs no prefix naming one.

firmware-name is not used for this: it names the file to load, and the
EN8811H driver keeps its two blob names in code, so it would only be
read as a presence flag.

The need is not derived from the compatible because the knowledge that
an ID needs host firmware lives in the PHY driver, and that driver is a
module not yet loaded when the MAC connects, so it has to come from the
device tree.

Found on a Keenetic KN-1012, where the EN8811H behind lan4 has its
driver on the root filesystem and the switch sets its ports up before
that is mounted, so lan4 stayed dead for the uptime.

Assisted-by: LLM
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
Changes in v6: none.

 Documentation/devicetree/bindings/net/ethernet-phy.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ethernet-phy.yaml b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
index df50c4c33d76..ab95b9a5d95a 100644
--- a/Documentation/devicetree/bindings/net/ethernet-phy.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
@@ -215,6 +215,12 @@ properties:
       used. The absence of this property indicates the muxers
       should be configured so that the external PHY is used.
 
+  needs-host-firmware:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      This PHY runs firmware that the host must load before it can be
+      driven, and is not usable until then.
+
   resets:
     maxItems: 1
 
-- 
2.53.0


