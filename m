Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A29BBCC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 06:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XsfldqW0RoQzYlaDX/r5s4QUZHIjZI50DQvuMjBx9x4=; b=ohzLs6u9GivrsUHkyyv+VIkcZF
	OAlAK16YjvIRXL3gU8F8UuHsKDmMpjS4T9gEPJ8xLpYXCZKe6TQpV5GahtYN57RM2N0jKuPluo+Ta
	T69ub/4FcRzJUrVNYvFwlMzATuZevIGBsKrRteyFZz9cvwEzDzmmNcbjdV0ZtrdsifFN4GutGwPNL
	ZSPbukR5xey2f3RzJuWxFl8YaFuHHx0ZBCaDGehv41MWqPsP9ipPdQ7l0qSe7bitxuh4u0QxUM6/Z
	/ujnns0EUw0U93tjYOrSq2xBLA8r8Amrx9MIyrxhdU0MNKpDwkTbaqqs3JnEHp7DnKwYFMn61mx06
	+Y7rJNjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVt0-0000000C8AN-11ec;
	Tue, 13 Oct 2026 06:21:18 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVsw-0000000C89L-2xb4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 06:21:16 +0000
Received: from ratatoskr.trumtrar.info (unknown [IPv6:2a00:1f:f805:2b01:a03:2f4:308a:7b52])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 7039320203A;
	Tue, 13 Oct 2026 08:21:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791872472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XsfldqW0RoQzYlaDX/r5s4QUZHIjZI50DQvuMjBx9x4=;
	b=UEW1isGL8soJE4BFPVWHPtiR0yeZaH1dgGywmGQBo79U+GFSQS6NQEpEH8oa6aAElo4kRv
	Pf3yCfjw+Lwtd3mAK+p+SNz99uQZHiTEuTBQK1TyX9HFzrs0HsN9Sgm9UZEIdmQZWRAUFS
	UKiP9+fFG9sFzFXkzKnzE+9rPGjDlIW8qRxd9xtw2sfz5Sbi4Xw1Gpmm5+JAcAWldvtzUP
	ZEMG138k6YdXS7cFSfwV7zFwgY1Dmvl90hmmPFvY4zdSJKeXauv7fWQx/1qp0D7lhzpGB/
	KsXnUXkwWBy0ZGflAr8akYCnlwszfNZcl4WO1Tuz+mI4aaqr3acXUR6bhrN4Yg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791872472; a=rsa-sha256;
	cv=none;
	b=Jnvz3enXXL0XPkaUmrRpPjxoQXNnHQa4od1LIAIS70F08nkAFomvZZ5NTDIQcItSDy3yZn
	86uF740Wt5YU05zYORkzpBZcTkwaYcQETzAq8ULSj82wYYYJXg8SuPtTnPTsYqlBo5pBNl
	9MYggAbXRnZQ5LepLVcLwuxi8O8+mmFE+Wu1acqYYoLTaWOsuWSn0HuQgvOB0fqmBcloeb
	zUV8/sr5ONe6hLwydt33Rn+z6l+7EuyRWvRIbknMR7oKemuu5JbRBxmXQAcdJh5P+7fdu9
	u+4GeuRqEg9ny7bWG4PtNG+OymE4NxkSRbUPFfFqBkMFBEbYzdiS9II1rOB8wg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=str@pengutronix.de smtp.mailfrom=s.trumtrar@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791872472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XsfldqW0RoQzYlaDX/r5s4QUZHIjZI50DQvuMjBx9x4=;
	b=ByK7P0bGq6jZB0x7TDCC3CnNDRx1/Uw5/CuVpuwR5FEx9usF7nW28/xECdDPNFjvtnsmaZ
	o/Rh7bIenicIvzH0bZrs16Ysc/TlJOKHAFWtCkgA6i2+XwxBT+KK7MwBa2Mug4XXmojxUR
	QYJ8FA2sLUB4HjWMaCJGNOSh281t9PONryPgFDU6im0FvvAV1mnJE/Shntr/ZKmXhV3IkN
	zNiBO21XPu3RQda8i06WlGNVirYiq2Tb5uOb9FSmitnoJLM7jGskQZkKD2QOjXR32Ek/5T
	F8rtGFOrlTiMsyYzT5s5YJXTJXHcXBEXd8XTm/n6T52+OhZUfPLJeDMeY258nw==
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Tue, 13 Oct 2026 08:21:08 +0200
Subject: [PATCH v11 1/4] arm64: dts: freescale: imx8mp: skov: fix sort
 order
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v11-1-b97ad841598b@pengutronix.de>
References: <20261013-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v11-0-b97ad841598b@pengutronix.de>
In-Reply-To: <20261013-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v11-0-b97ad841598b@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 =?utf-8?q?S=C3=B8ren_Andersen?= <san@skov.dk>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1233;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=423yVuUc90HmONuXNkP5wWTzTYT7Jwx2uAIEP4GzfrA=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ9bZs9c3NzEL2B98uG1d/HnpezqOq9kXXarzn6br9c3fa
 Hey0QPVjlIWBjEuBlkxRRaVhRV8oh4fPCOniXDBzGFlAhnCwMUpABNx+crwT9ftgmToJTuvjjeq
 99k+zP541ujsGWlezr8T93yf9NDwRiXDb7Y9UmsXZSYu5Xd8br1O832aqI+F+zal7jOW6fkMzIW
 3GAE=
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_232114_943101_936BBCBB 
X-CRM114-Status: UNSURE (   8.52  )
X-CRM114-Notice: Please train this message.
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

The imx8mp-skov-revc-jutouch should be alphabetically before the
imx8mp-skov-revc-tian variant.

Sort the entries in the correct order.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a80cccf34eb56..475e1ad9116e1 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -707,8 +707,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-lt6.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-mi1010ait-1cp1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-hdmi.dtb
-dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314.dtb

-- 
2.51.0


