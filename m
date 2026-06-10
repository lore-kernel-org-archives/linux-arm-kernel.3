Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF271CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 08:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4D3U0MJrq3HMALbVG4yy5LYGiwOLwK/bQQJ3BITNLwM=; b=cIKR834DQuThi+STCozCQH+psu
	Xn9cIJRKlF7Bk1EcHg7SFkWAoiAsqReFzKz+nXo2tHrLudsrCziUfBxbe1krk+nxJiZXnqDmpnLW1
	etABUbOBsxT3RT3ksc25uC+exkJGq/32jYIit7zw+yqCCPCLnPmiZPFqXlEOnASSNWYQbCY3HTcKK
	7kUST04Lz7+utRnvs4Nzrky3F3cWtLX/JIQ66jMi4t+aAYDapEJVdhE1yQpsgxWfHRhn1isSQ4C+F
	qc8mLI5NX+d6Z3wZg0KuKZT0O/fk4J7i/2O+ZRCdKZE0NqQrIUmp0V7e7vMzSFgXq8uKSzFkuKfG6
	zIWIAOrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXE4x-000000072Jr-3lje;
	Wed, 10 Jun 2026 08:14:27 +0000
Received: from out-180.mta1.migadu.com ([2001:41d0:203:375::b4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXE4t-000000072Ge-3mfx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 08:14:25 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1781079261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4D3U0MJrq3HMALbVG4yy5LYGiwOLwK/bQQJ3BITNLwM=;
	b=NqlJu1XQMQhaZi7mQd/ZOpEchPr+6zrwj3xNiK+0D8Ko97FQl9fiDao64Tv2W03aTZOkM/
	PRrJn0gHWNAItsWzuKZ6Z88MV/dMcDUfjdsml+OG9OnOC0hA163TdPxEfxK8i7v0vT7ORH
	rhIxZWUJCEjFA4tMfM5bTE9k2BcE4C8UBVhmTXvMKA7aV6KOF8ugrlSkKr71PDTzwLwHDB
	5hOFtos5Ldd4PqC5j3DXZy0MiCwqIYWW/TJOu5H9kfLKIyrcT7QvRrIGH1Ee66OhZeDMSZ
	9YmnU7Wu8VSYL85dsLtmfDdpeSxSlGvcDaF/Rn17xBttHzxXNz/t+PpbOHW+7g==
From: Diederik de Haas <diederik@cknow-tech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>,
	Diederik de Haas <diederik@cknow-tech.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: rockchip: Fix USB hub phy-supply config for NanoPC-T6 LTS
Date: Wed, 10 Jun 2026 10:04:06 +0200
Message-ID: <20260610081400.758687-3-diederik@cknow-tech.com>
In-Reply-To: <20260610081400.758687-1-diederik@cknow-tech.com>
References: <20260610081400.758687-1-diederik@cknow-tech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_011424_091015_65182204 
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

The MTT USB 2.0 hub is connected to the SoC's USB20 HOST1, so the phy-supply
belongs to u2phy3_host, not u2phy2_host as that is for USB20 HOST0.

Fixes: db1dcbe5f752 ("arm64: dts: rockchip: add NanoPC-T6 LTS")
Cc: stable@vger.kernel.org
Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dts b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dts
index 0ee67ee24f3c..0e15a2e1f2ff 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dts
@@ -38,6 +38,6 @@ usb20_host_pwren: usb20-host-pwren {
 	};
 };
 
-&u2phy2_host {
+&u2phy3_host {
 	phy-supply = <&vcc5v0_usb20_host>;
 };
-- 
2.53.0


