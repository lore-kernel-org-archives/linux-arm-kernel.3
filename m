Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E1CCA5FF5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 22:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yY8SyQWcSYsDi8cm3rA+aW2F8vWLi9p/feyMtYn7Pcg=; b=hwaaBaih3WjnafdXtYGwYF+lNK
	IqHrK5gDHtBo8Dcp+dxzOxdS+GxnhmOxhPv26CvIXRdDComLDdX1Q7onuIkw76sJBTTIZib5YA6z3
	flDPtMTnpfjmEH5SgC387/Ub/VTL093EbkoOj9iVOBKs5B2d4D3ztvY+si1QPHPT9TDLdPgoY2Zxo
	vdo1lihoqOPoK5Zo5onv7aMMPLz3/0GHVbXGyOlxdxNs7h2Ks0Wa8yTA8dMkUWzSZDHImBh21YOCc
	eYOc+T9UZp8I+Ive20MFMwuTIKnDOcWgNj4C8fNTV58a1yY+2IAotdSHYXQzP2pPWzdntFJsYHB4i
	PgmBCmjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDrDN-0000000HGX1-4B0h;
	Mon, 05 Oct 2026 22:31:22 +0000
Received: from mail-pj2-x00.google.com ([2607:f8b0:4864:39::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDrDJ-0000000HGSK-42iC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 22:31:21 +0000
Received: by mail-pj2-x00.google.com with SMTP id d9443c01a7336-2dd9bce707bso9595345ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 15:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791239477; x=1791844277; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yY8SyQWcSYsDi8cm3rA+aW2F8vWLi9p/feyMtYn7Pcg=;
        b=NkqOr/9+AQcYM5VE1laF1tF38tEqm2DuahyV5LtxCpSDRAKqSqpJOSF1Qsce8F/e7r
         0FCDg42HX/Z2oPPP7mxffG5PXXQkEvLWTidSgDpZwQSjRas4DimkLG3YFN+dF8gkDXDe
         ZlzgsvL3KS57IismRWxoanKkQN7NJ+lkBwp4ABzDYqcCrs2zQ4WB19ZCJPpGmNoeH6z7
         yk/PQo03JEYJIvFcfIr3p/8mk2jgvbQYGjJKB9p8Jz6n7OE+GY72w7sS0Dt39zU5Tias
         wJFuN91ljnH9Ls3Lmna4LYs49gTlnHGQbwwosD5U4pMzOq3vBtpMJEIyjLWks8sjI3Lm
         167Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791239477; x=1791844277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yY8SyQWcSYsDi8cm3rA+aW2F8vWLi9p/feyMtYn7Pcg=;
        b=1ZfbuWNQSaojQvJ2WZxKNNHzI2ICX9pI2hTcGIG0XYvw4lrTD0gsj3GxCZBOs2vETv
         3B4JKlBU1YTmfOJNcz6kqUy+tKf+VLhABX3IViAflD5Yn56e4mYQetn/Cx++wwJte0qy
         drS6fCHYu2ztHCdMTBe+zB5p84ZIJZIiQ+F8dcLZ5peG0CuOAwfwt5aFoiiYmwLDw0En
         NWeLY/vEgiQedz4mK8tUWeP882fpqoyZJGkxhpYD089Evxh71rJQiXXLGOwoU2b506pB
         pfXSJZ6XrpFu4gi59O/MIwFzdO+9euGLoU6fRl0ru+o+SWc27yatPx6POmznLxqyoqYg
         lLyg==
X-Forwarded-Encrypted: i=1; AKwUvBy5+BCH0DDWtdleyFkKxfY/71syUfu99Wqc8w8RQPvGb9WJlom6AfOO8U4SNH/xClJ6x4zrPX4PEc+aWnT/w6sP@lists.infradead.org
X-Gm-Message-State: AFq9FYI2Eu42tfXUHjEAVt7BO+L0DmpJa+bnN676cYz35UaWVXDFN+49
	XHLizLxu5AaDPIY63s6mR8vfB4GndbcBMn7t3Y86znM9J4qncC/T0sQP
X-Gm-Gg: AYBFou37m08TWqoCENUuGQI1RPZqv0Ih3Qr08XkX8qr/NFzjVYnqBH6Zu8xWyvUDdvI
	nKu12NtoAH5ojg8YMQbZ4UDLSFhR7A90lcQFLG/hSy1GNrYmrSRK3KauDuWHbHRufzyuUQDXqjN
	YM6/fj9FTms1o5Num+F5sCkGPxE2O+WZJ2Y0Dz2q2SEBw3kUPYVsOPH2vQk9ViJrQC6V1BuKI6z
	/XJ8wyjRwisfnm+BfLiSoTCOqk18PXwvDdQfM3ukaCgpWehoOHkj6TO+AYvRocRyFVERZ4x6O+B
	igsnxz7kSCVPrHSbkWSk9u8DvcNLhZy6d4SB3dZypYzIoksRoc5dqmPnJ2HHBx5FkiVap73DDH4
	jmYGM7ZOTP3axJhOIvfV7b0trhwL6jmO7o3ZGGnB69W/QV0WeGsmzi9khI0Tfi9lesaFGcLNEPO
	AmzzQXbqgf0IDRPJhNPukBOnZQtZkMkFhLUokaEFDpGZvsE6LPnsnxaCbjWmA0b0bpPeYa
X-Received: by 2002:a17:902:f60f:b0:2dd:c053:82f1 with SMTP id d9443c01a7336-2e49b6290dbmr124418145ad.40.1791239476903;
        Mon, 05 Oct 2026 15:31:16 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5f05321sm13203705ad.78.2026.10.05.15.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 15:31:16 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	David Wu <david.wu@rock-chips.com>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH net-next v10 6/6] MAINTAINERS: add entry for Rockchip XPCS driver
Date: Tue,  6 Oct 2026 06:30:08 +0800
Message-ID: <20261005223011.1124347-7-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005223011.1124347-1-coiaprant@gmail.com>
References: <20261005223011.1124347-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_153118_027019_7F98EAFE 
X-CRM114-Status: GOOD (  11.60  )
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
index 65e8a4b5c90b1..2f0f46eabcf54 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23757,6 +23757,15 @@ S:	Maintained
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


