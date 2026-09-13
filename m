Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D251C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 19:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQ2IdKH/7qjrKGR31C/pLtiJWP+p6fNr1pFwJZ+2Nhc=; b=bhTEK5/U2Beo9ruF/pz3LXXRyO
	JQcfQ83OYo3P9P/pM7OexXV9yXv7UyYksN1bvQv1fY0Jf16bDayHf1drP3avN9q2QSuTZDE06M7SR
	H3ontpyDZ3QWYwUHqv/750EZ69IRCWFK3ZwAgbk5Nh4dmHUiNJedOWzGTd6fwxlN1ppbWL6f1yinT
	8oLG6m9ey9iz/CSoEP4PQIVy00IxGnPbanzMKkVw8WoGaiS+Ap1tiKarL/B0tgJ8YO6g34kbvKT7C
	Qx/qUntXE8LPg9TQoSKbtxUKvNO9ptRsjufTnysJP3y+JW4TDCDYH18jyE2UxJCLVk1Ffl2eoUkxW
	7ABRmg6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5pSI-00000001yHo-07LQ;
	Sun, 13 Sep 2026 19:01:34 +0000
Received: from mail-pj2-x05.google.com ([2607:f8b0:4864:39::5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5pS5-00000001y7J-11uU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 19:01:29 +0000
Received: by mail-pj2-x05.google.com with SMTP id d9443c01a7336-2d942de6574so15902245ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 12:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789326080; x=1789930880; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zQ2IdKH/7qjrKGR31C/pLtiJWP+p6fNr1pFwJZ+2Nhc=;
        b=ZTAOGCvNt9/iGz6m8gJBjNQkV2YcAgOJzw0lBbbm01fTlwVC2chNBjcHYwFzW+7CwX
         t3YgiOMf/a2D+o9ycdlfuQEMi5e9N08st6ycqr4xB+56qOikgbR96qCw+sN6YegJrUau
         tdLdpuCPy5uSJybO3398bnxmQyuSNpe8O+8rWghgpeDsP39DceVkyZMV2KiIvhl4S8Ez
         dpQBthclrXOUN5+zYqQ0WvYU6g3rA1SoXwsk71+LK6Xjf0h7gDyqNXd0NjGUV8C9npKE
         KrTrGXGcY/PiwnNmXuGliVR6shJJju4yV74f6jKowjtuNTQOLtXCyvMHTjfPMxyB9y+u
         SszA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789326080; x=1789930880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zQ2IdKH/7qjrKGR31C/pLtiJWP+p6fNr1pFwJZ+2Nhc=;
        b=S1r+VHDI2/+E3y/82H+M99A3mHL5+vMFHUgNhoJvNnXcynraM5nSfcuJCQhXt4DMuB
         KbAIif681+G0zu5EFe2TUiUjL3HtfIibGY/hxsxtbkp01+mKiP53yhv/hMx0pa/PcQIy
         +/ADVjRAPAeOT6PdkQ0JDMAgaRfGxLQeRrNJEXCm3ysrZmug17VzukZP0EJ5DBy4fiQI
         BJ66eoQCQ+udwCxhzAs2z2Kf95c1l6HD8K/ZKGCagBna+Fz+QsC4B4vDYJ5neh1xbGyx
         5e5qfjfBRS1f4CQaiA2UA8xcb58KeAo1IIMHCue7Sil9aMMXQ0Jv2SpWCvWkvPbIUbyz
         XRgw==
X-Forwarded-Encrypted: i=1; AKwUvBwuLi7qGMlJXMi7Rg8wmaoRWVaqdH4QEA54ysbC9jWx4Y9WfX5rNrZbqMHzgQUJS4kGaplCZaJmtrpeyEQJGrZE@lists.infradead.org
X-Gm-Message-State: AFuF++lWWkYKbIubhoRrOYZ567DyhhVz6AFP4SeaJAmrubUH/OHGtdVk
	YGrwrNNaernzR4HMGUZX8AcncvHu+qcWOy89jQ3RP1/+l20CMzdSnbW3
X-Gm-Gg: AYBFou2RObovlKz3D33t6O6xhIL77Se3vM5JSofoosvahiq7CkAyh+zrG8l0xBKRBjs
	cofJ4+ws3vBoR4iN69BZCJLQmJF424tCvJkuj/c0R/jpC7nlzD3sb4xp7rlpF2i1oHtLQiXxrnN
	N0lgDXExlXn95+Zk8cDyZTHoZfmqbRhw5Qxz7GxldjcmQvjgYVVDxBukxAEDNaS1BCLE9yTKzeF
	vY/YICQzcU5//1+QFLduFSJQMCArPsL7dvYxDP8NZuShbqNt7LEOaurCeX1bHuF+gyN99V2D6lX
	/G1i/MJJVfZVTvYh+EIArULyBarBpQIpxKsjS5mHlckOo3GaDYZVOos6a7rGF3U1ZPmktsJr6vL
	ZUn10e99g0qIg1T8B9PIMluidBMwm+CSllLQZn50vN4oxg1JTn72UYO70FTtTCPfdIYQlWBvRIW
	za+vVOZeWOHkkG+b+61melV25mp3G7mZoT8DjpPtynCffQYcZ1jNixDLZggTEywlRoaKlTUQ==
X-Received: by 2002:a17:903:1a2e:b0:2d8:d4cc:be63 with SMTP id d9443c01a7336-2dd2a35aa1cmr275548375ad.16.1789326080540;
        Sun, 13 Sep 2026 12:01:20 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cca6b7bsm36808655ad.3.2026.09.13.12.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 12:01:19 -0700 (PDT)
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
Subject: [PATCH net-next v5 11/11] MAINTAINERS: add entry for Rockchip XPCS driver
Date: Mon, 14 Sep 2026 02:58:46 +0800
Message-ID: <20260913185849.907479-12-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260913185849.907479-1-coiaprant@gmail.com>
References: <20260913185849.907479-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_120123_446916_3C9FA4A5 
X-CRM114-Status: GOOD (  11.86  )
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
index c2414447892c2..960a53afa8357 100644
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


