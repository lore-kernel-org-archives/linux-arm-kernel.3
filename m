Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B87C88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 22:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4x6skfRoPug9nQpkDIHkliB3IJCFQOtgzSpXl6Smj9I=; b=hOof527qWT/6O006lBeXJaGstm
	b0+ji7+8fGcP7Tz6Y0E79Y7kR2KSdwA/11YqZhjEGehv1Y8FBF4asgKNHf1WsRhWHCffgZrYCArOM
	fT6JCX0eazi+W6RTyDAQKvwLJ7k/V+61Fu1XkeTICMFr30O/y7mU2OhzjkEQmV1GFabx0HnfEk/Tj
	FHvLwQQyg9TSh/ehKdHiHyZu72maaghtUTu+L8hA+AcvjOJYcNohNPfscvYjO8RWirGK1B8QGRlOU
	5bkBDStVq/Uu5s6RO3GDWzRiMRR81B2tv8m91eGVsZJoL+stS0eqdZwvVVu9KupvTdNz3SImbqycE
	cT4qbXcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5A96-00000000JIG-3NDF;
	Fri, 11 Sep 2026 22:55:00 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5A8u-00000000J4J-36mK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 22:54:50 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49e65b1cc29so4761105e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 15:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789167287; x=1789772087; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4x6skfRoPug9nQpkDIHkliB3IJCFQOtgzSpXl6Smj9I=;
        b=VRWwGn0nRMi81/MQF6lCyvlXcP8d77LMRE4meSjn07RUzEi3Xu/FTYCKSe3nUhy7HG
         1w5cL4k54ZVB7/NETSqdzipmDAmgZxBSuoB3XzhrC2p3W/iqMBjxnOIS55Fqm9TtlK79
         fgXC8ZmtKDH9H/lMQL8ZkX5osUz4znqAVx4NPCM3+BwXy9Py3WF/ZlFv/3XlM9nU9TFE
         oB+3r3OLu+Mfww+IRGeRhyzcywI0TivECFfGr8h0i1S1Lmz3Tac41/7zJZGpyZoRcpUI
         tfmfZNHNBrszrRQtF2Ojpsg+6jW+FxHAwUdeSqV6WU4JWexJ8ixqmiSu/7WptBLrv1K4
         7L4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789167287; x=1789772087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4x6skfRoPug9nQpkDIHkliB3IJCFQOtgzSpXl6Smj9I=;
        b=ZaBu2jnLz49uo803erRj3GfhQ7r18ErbjX8OwLxv0rOL+9ROlpb3m7ykk+zIvaRa0g
         GKdYDyfN3LCvvO80AU6W2gk7O3J3pxZI0IpM2TiyF2xl4IiEY4YTYVFExqG+VcNcB5rD
         dzo+FN91tUR9VngEdXTK92Sis49gZNlgJY1dTKTBR+bDdTkdlWLS+UWVxl+oyHybz64l
         ypIp3GpNidj3YlGyOsDiP1g+0H2wGKMokxRppnm2JWCRNsZBnHMc5zm+fV5sg5/aHv4J
         xr73dJwknTQ+wuqRigPypcivj/NdgYbdf0tmpDpVbDm7JFnCWkgpDA+u7Z+tsSVGa4dy
         /zdg==
X-Forwarded-Encrypted: i=1; AKwUvBx4xxSI3mSYaxSAo+899pjb2u+O+TnO+HGTDSWXHcYndO9hKSHXwpZAuOIW4gyvgDX3ym0lkOp7c5two3aWzE/R@lists.infradead.org
X-Gm-Message-State: AFuF++kJlCbUFaPR9ng/mQ7HYY4BTsydNtlK7JvZ3NXCsWhsZKJjbUcA
	Bygmb0TidgRd7bJEsPn1mMbYfP8ZFCKoQyC21mrtHK8ukAEzbW3l3rb+
X-Gm-Gg: AYBFou0KGrNtZldWP6fRLz4YBx4oav3+FH6K7zKgArKEL8Vdaf/MOAdchUkZ72/Gx2O
	4J5PW1DJd2RvMHFZa76vxCHG/EuIOKYvAxtNufIzSseKNICy0ekaOwpZqLbx5dGVoisKEWyAyUb
	XzpHLMaKwRHsYXEMQ5MsFsjCd5Ee+clNJbwcF8cW0n89exg5C/kgmsP/nOYht2Cs4ORONAgfO4A
	9bEgiKtKTBIOu/gdRO08RzavDXOg8lbHGkAC7zzryLa/59Z/1+IupSKm73Th4xlVtmMuHUf3BIg
	myNokeaXkIjG9QAy0IRsXn8L24hB6Vz8MuEus+Hb8oZr5l8KV782x+uhqUJVsjzEf12LDQRBDnj
	WJxfR6DRDIKqnf4MmJu5xUSEif8y4ocXu++HkpSPgEW81n7GMgqaRZNILCtEvm/M40eF/F9y9gD
	X6Vxb8Jl9RI1KD/vd4AiocnpVltH/r4zXHo7cu0nRvP4hJXFkmB+Fe5bc9zh9c3lK3tDdDLC97n
	WT8Id+xY655ZR9CABDBwVXp2AhRAZTeHMTK8vdCAvUd8WRdxF0b3VbkJHiEE6Q=
X-Received: by 2002:a05:600c:a107:b0:49e:663c:c69f with SMTP id 5b1f17b1804b1-49e663cc929mr90961875e9.15.1789167287028;
        Fri, 11 Sep 2026 15:54:47 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e6221ffb0sm77593685e9.3.2026.09.11.15.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:54:46 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v21 7/9] MAINTAINERS: add myself as maintainer for Airoha AN8855 Switch
Date: Sat, 12 Sep 2026 00:53:31 +0200
Message-ID: <20260911225414.225980-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260911225414.225980-1-ansuelsmth@gmail.com>
References: <20260911225414.225980-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_155448_794253_457738EE 
X-CRM114-Status: GOOD (  11.19  )
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

Add myself as maintainer for AN8855 DSA driver and all the related
subdriver (mfd, mdio, phy, nvmem)

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 878ecf1fdf27..95072863b236 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -759,6 +759,22 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
 F:	drivers/net/ethernet/airoha/
 
+AIROHA AN8855 DSA DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
+F:	Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
+F:	Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
+F:	Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
+F:	drivers/mfd/airoha-an8855.c
+F:	drivers/net/dsa/an8855.c
+F:	drivers/net/dsa/an8855.h
+F:	drivers/net/phy/air_an8855.c
+F:	drivers/nvmem/an8855-efuse.c
+
 AIROHA PCIE PHY DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.53.0


