Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7C3CA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 13:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PlB//ouJaFs8pbtEqztirI7J+BCIkiQ8y642fBX9rS8=; b=aP0Og8cjfqVq9mDNq/aB/6GzgL
	ch/h51NXxUPh91wHRwiMEB31Sgbcg9jYI8xpAtLmGwMrxKWoW4gjPl6Hv1f8r2JbGEzKz5cxVXMS2
	56ZEJKtPEB00FsL5J6Y0gXvtXvuMsfKYVi1+UPp8x1pwI0dBFrQm6uqPWC5FdVp6k+PyAwpGn0k0B
	kRgZEdPcN/0LqQgzugfickMBDdf/hQI3vrgoRkE1ijlxh4mG6/LFg598Tcsuk5nY7W4S6vyouFsDB
	1aAReMQTsR9K1kUPSYxTrRqEAxUP0hqNhgItt0A0P4IiFpHUXA8hhPosasynczl4PVGMQVEclYYRV
	dxh36O5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGQV-00000009AAs-1ME9;
	Thu, 01 Oct 2026 13:02:19 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGQR-00000009A8m-48ui
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 13:02:17 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f6350f91so3789870f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 06:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1790859734; x=1791464534; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PlB//ouJaFs8pbtEqztirI7J+BCIkiQ8y642fBX9rS8=;
        b=eEVBVIUB9AwqegO20RIJgq2RMrAT5B5JbRJx6A/iIHq7lHS0rosW+3NK9Ucgi9C67r
         PL1X5gC7/FGveeBOgKEJYcgZlJmphz5xXWrAwwUwpB/FyHxdbwK2Z/PiyADoKWqkdi9B
         CB22aH7H1Ju6kvKXjEn++vPb/NsrHeaZY2oAwfJSEorJmP4OnJ0pVYu2ehBPBsTCHTNc
         NYFTAXSdHNd5yq9SLX4tgvV+F+U6oy2GblpvoYt/ROznPeCENfkhVrrvwdhjwI8gTAMy
         JR3OpeQD+b0CoIXtwjA3DLejOxuuN8crbrJsdgstvY1mQikN4QOd6AHlqAxB6rlf5BG3
         K+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790859734; x=1791464534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PlB//ouJaFs8pbtEqztirI7J+BCIkiQ8y642fBX9rS8=;
        b=bZXMBH7RndHetJ8ao2EmQ6x9sEd8R5oWavfp0McPyFlthh8IbqTZ+lKGn9eUuQjWGL
         j3PqbgT5OPrHpFkEB+j5vJmzcf9BZAC7PVpTHH+9z5SD8U0DatXQ1r4NBtgjRi8WRq3K
         qN2l+1EJaG0407z8wDbrbAh9OTO33zfaY4eGtlhPGpXwFL8VSnb0+2v8PCmurgI41l93
         2TQJ5DDGPH44f0dz1czBSZCLs1hT9Wsw1I5wVKFiIqxWMHNXlgqfspZFVi3C6IukTamj
         haBD2B3hp7B1d0OlO0uocYLHog7Z1K8A1pbsTyZLpdd6YabMcznvDg1Z6sWMkYnwUUn7
         8Wyw==
X-Forwarded-Encrypted: i=1; AKwUvByuG7huWq9qGTXkF5dNq5qChfbDuGVHeGltvCehr8FoJid5V83HWBpEFuctEgDCSVFepfGxX8D5wIx4GJDTg/A+@lists.infradead.org
X-Gm-Message-State: AFq9FYKOFyRlX0hamU5CZV3nb3Df8wzMObv59L6sf8Bl4qCPl6ZqbBcE
	2eW9lC9KMoT8rLVQLLNhWP+mOJRT+i2IEH+NoCHddLGYomi2MMDoIXH61dDxBbzhKDY=
X-Gm-Gg: AYBFou3FbAYroOLYU/sn4shPnafblHQbKIa9B9He2RVZmAwockY78w2aR1t8exHcfKx
	qSQH5fRTbt8UR/R60oKVCUWjiI9weTh74Ak0pKh1ujUwivf4jY258miql8xRrX4O337o8jth5IS
	djJ4irecXnEAQ2DRSIRS2cTcLur7WLaSRw3VNPrujwaeohtS8ZJHd5Y6hkKqngBbY8oGPZqf/y2
	5xraXJj5mNYTXBhuzKngY5XWoZvLwDq3DxR2KeElTJ68SK66fQoyz+xBaFp8iK6MPrtLFVJ+Vr6
	id9bUNAhk7FowMgHkklyqFoAaIaxehgTWm6u5KpaM27EocOL9DcobnRyNVD2GsrjqFARFRqQZd/
	5glbttyu7G3wp/6WcQTjaJPZQpAak/WGAiJrrsHEQdhtie1HyyYi/cmz2n84L1rCdvh9uscrz3W
	6VGMFmwIJRF1DC412qkvJd2gup+sEpUdDv6m8iLbuGCkAFUCtsVw==
X-Received: by 2002:a05:6000:3c7:b0:48b:a6:61b0 with SMTP id ffacd0b85a97d-48b0254d145mr7938379f8f.47.1790859734093;
        Thu, 01 Oct 2026 06:02:14 -0700 (PDT)
Received: from remote-01 ([84.17.55.224])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b06a2cd0fsm5568155f8f.30.2026.10.01.06.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:02:13 -0700 (PDT)
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
Subject: [PATCH net-next v5 1/3] dt-bindings: net: ethernet-phy: add needs-host-firmware
Date: Thu,  1 Oct 2026 16:02:06 +0300
Message-ID: <20261001130208.105558-2-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261001130208.105558-1-f@lex.la>
References: <20261001130208.105558-1-f@lex.la>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_060216_046850_817373D1 
X-CRM114-Status: GOOD (  19.02  )
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
Changes in v5: none, Acked-by added.

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


