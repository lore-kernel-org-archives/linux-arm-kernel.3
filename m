Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10757C982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 12:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rQei+xFrWR/8tHZU0Qo/Qb7KMibEAMjL/DUhroeeXK4=; b=rf90NFUqYrNtKvZl0tUqApQJXV
	fkb73P6aII9fQkNf/j3SQ1g2izYOVuBdSclXLj5JCKrFRj4GOct4XcQyA733MejY2Qy27uXDFVjhj
	eiEBPJYURbembTZsnKt+BRxhrRGxefuZlZajfQiFWb791PMD1erAmSsOGGSZFHLdopwZXwWgQT/hL
	R2/icKldrDqjm9XCZ6vsqX7YOxrXczt3SYN0cCnI1ey5BY4A1xJWOEubpOiVBZexlhfCOhElTb7nw
	jrggJpnYlyetUL5RV3Tvv7FHJLT77KBQMmY/7GG73Lg4L9/L3zxkutvO/DTFfizMnZGYsnhxHLqss
	wODl6ilQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7uZA-0000000GI4s-1HLS;
	Sat, 19 Sep 2026 12:53:16 +0000
Received: from mail-pz2-x0b.google.com ([2607:f8b0:4864:3b::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7uZ7-0000000GI1w-1mo8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 12:53:15 +0000
Received: by mail-pz2-x0b.google.com with SMTP id 41be03b00d2f7-cc1631a57d2so1062846a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 05:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789822393; x=1790427193; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rQei+xFrWR/8tHZU0Qo/Qb7KMibEAMjL/DUhroeeXK4=;
        b=M1oy2gCc6/vPGJa4ziX6lcoyN16fAm/0zRxW656npnoL+VVXN7WDq74ZyPFtkGOJ52
         Kf09COI77W6oPNE9nqxkYQ1xIMV8P2XUc9ZJbqw56+cb7ek40J7Wda1FE0BlTJViBx+M
         Fkot3mEhViXu2cheMqsCX3lx+HI2FWQSYMYnbeFHWHFO0IYi3B8ZUXjNMwOMuU2yl89Z
         lVcsGiqsctLXS6V6mj14DFV2eaoBVom1Xb5DTY9D1yonrvQ+uyDJkD8WWz/pUvqmHrNW
         x+GlrgmNe9oidsI+j2Jf539IFtRJOyvBZ0lkDqptmYaxylwYJqM1mY34On5qBUfub9Nx
         XrZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789822393; x=1790427193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rQei+xFrWR/8tHZU0Qo/Qb7KMibEAMjL/DUhroeeXK4=;
        b=na8DP9g3we2sgftlw3dV0emPXJ1ECY+T9LINjv9g+QfsjUSu0KTFVJNebKBJLCxqrp
         XSzTPhUpOcbvha48ScxEwGgp102+9ga6BTmUXcZ39ijeeKANvZ9XAR+JlzuXr2FoJG/T
         VYkofd47PQ0Mu9MYqu40WUwmBzNHDpewCBHQOZ8TvRzeTra/AZpqbMBiTnJSYHpVQd2f
         7itT0P/3EbOfTtZV8Rars2cNm/KNa9cpkhzJ+zev6YYoyv1DPnmJTSf3ixr+pXI98UJu
         96+Qd3DhYEXpCMTJpk5QVJgkWDH8EQhwwx2RYVbVvEFHy31RzlWKLCpQYrnQjwpmhwtv
         akmQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJDrdo4CZb4dHIxwI+p2Xg6h7i/Z7VGNS0bsyupSMTPV4YYvSavMmlITQoHVsnQ3anG7fnBZNxrQ9NHr3kP/mJ@lists.infradead.org
X-Gm-Message-State: AFuF++nJx8spkzsIFxXhCWSGqoWXNwKDdUfvBe835BkXeO2U+K8LccR2
	TziYaFbdrWsRGfEYqrHHk5j0gI8KbiBjhFrqLP/Db8le8hz7ewcvfq7F
X-Gm-Gg: AYBFou0UaOi6CcjtTZg2+TMv+TGNbOqHKUE0CTV3ZbDri+1SM6UZoGWfgnU3m+TrnrU
	t68D2gI34TVSWzSdui+vv3X56ZvyOdHEf1GvnKh1vxVwRxxYzhCr82YjVDpABeGioKd2ZYmboU+
	GscMYJyhUjCHDbW9HAPyYOOuPtbVVYr/15CDSl5+iGMEX+/XiegdXqKO146TYNGZoZX+yOo9ykl
	9+Iz+k0PeIs9Su8oIMv6qdB5u884DBD1U8M+NgStOzfc2h33H2vDGbqnpYrVzGusWW99K5td0/c
	bAgvH36PDjS6QNi+ZEC+KQSdFGcfStZmPVjlkA1ccoMPRP79wFAXbfFnkS2Qbe7hPzO4tl1qg9W
	mvCtCDYFby8M+8kOCj7GF6/1TRjOyaPYqM9W0gT2PDjr0jdlAcvxJuYYEQXlSLjwz73XPP7OX18
	Y3pIoFdZXBvBzLtFtNdU818GDppaOXTS3wulM3lNKN87KKU1hegeEVd+RsJJ+v9R/6xWhXQg==
X-Received: by 2002:a05:6a00:1796:b0:874:706d:8573 with SMTP id d2e1a72fcca58-874ddef6806mr9062175b3a.27.1789822392717;
        Sat, 19 Sep 2026 05:53:12 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877aa0026b2sm991805b3a.44.2026.09.19.05.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 05:53:11 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Coia Prant <coiaprant@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v8 11/11] MAINTAINERS: add entry for Rockchip XPCS driver
Date: Sat, 19 Sep 2026 20:51:18 +0800
Message-ID: <20260919125119.2107089-12-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919125119.2107089-1-coiaprant@gmail.com>
References: <20260919125119.2107089-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_055313_574404_20AD127A 
X-CRM114-Status: GOOD (  11.94  )
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

Add a MAINTAINERS entry for the Rockchip RK3568 XPCS platform driver
and its device tree binding.

Include the relevant mailing lists (netdev and linux-rockchip) so that
future patches are properly distributed.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3b2eb2a7a89a8..f53a519da6298 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23739,6 +23739,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/rockchip,rk3576-sai.yaml
 F:	sound/soc/rockchip/rockchip_sai.*
 
+ROCKCHIP XPCS DRIVER
+M:	Coia Prant <coiaprant@gmail.com>
+L:	netdev@vger.kernel.org
+L:	linux-rockchip@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
+F:	drivers/net/pcs/pcs-xpcs-rk.c
+F:	include/linux/pcs/pcs-xpcs-rk.h
+
 ROCKER DRIVER
 M:	Jiri Pirko <jiri@resnulli.us>
 L:	netdev@vger.kernel.org
-- 
2.47.3


