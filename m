Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A113CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 14:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A4ZJp8Qib9+DD7lKkbek2dTcXjA+p73Zi5iXZ8SVeBk=; b=wjBtA8iKAAbJ4DnUV4+vn23KdY
	ojLCEI+t9xUaNgSi2p9U/vKUreD0kJ6sh7hozjBe4fZ3GhthiTyVpr9G4BxJeov7kXHzHLr0x+Jo2
	4ICT2evKDOOXF0+aUfCK96x3y+sYlQhG8MdEqnntOi/k1zeDrTuQwBOE5h6ySekwfXCN44ioXEMC9
	kugv1Vsi3rvNihWo0jbCBA+tQXcRXY04VTwVi3MY3jEH1RJST3JaKuz6A1fCJLdQxWti+bQLLAXTs
	t12h6a7UN1AQQaPKMka7YzeZbPt0/y4ToSWpNRrKKYYhUEReJLQw21/3mAoD4T3ad0nnzKFt5UrOd
	gzN20XNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXUp-00000002JrJ-1HMM;
	Fri, 05 Sep 2025 14:32:59 +0000
Received: from haruka.juszkiewicz.com.pl ([185.243.53.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuSbB-00000000gxT-41oK;
	Fri, 05 Sep 2025 09:19:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=juszkiewicz.com.pl;
	s=mail; t=1757063950;
	bh=KU82z1h5lc5ENlG359nM5e5o66V40HCTdLEYj9iSvTA=;
	h=From:To:Cc:Subject:Date:From;
	b=06WDOYgsa5jHjhmZpHkh7K8+d1bnh6ERsaO+qP/JPrp5I3tcjPtcsKIAf5uxHlpVS
	 zAkDXBqAY8RPs/qkr0SZRdphTspmrm+5KBuIsmbd+XlgpxiK+Cjshw4ft72ZSbUB1O
	 RKXoJqw8r9uMclaIpoyYOLW4cOrfphVP9HTtjTmgz4DKOZrEJ/q7yf0fHbFuYasi6H
	 26xwJQ4I2UBU6ZJTMUc82jTWhTNY45XcnuCN72kDW1JlhHhaiXi75K/RpUAf8l6Yxs
	 VJtUNgn7XQzP3jg9wrStCKRrXMVXjeZJBaA8Lls3kdAc+ehVF8M2rZ14jBRSNKtgWQ
	 wGO3Hswggos9A==
Received: from utena.juszkiewicz.com.pl (utena.juszkiewicz.com.pl [158.101.208.177])
	by haruka.juszkiewicz.com.pl (Postfix) with ESMTPSA id 0BB631FB29;
	Fri, 05 Sep 2025 11:19:10 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BF28045400;
	Fri,  5 Sep 2025 11:19:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=juszkiewicz.com.pl;
	s=mail; t=1757063949; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=A4ZJp8Qib9+DD7lKkbek2dTcXjA+p73Zi5iXZ8SVeBk=;
	b=HnWatuYjas/e+bApgrJ9duKZe1mZPRTa2MbfZpGYPc1koomEtur3yUneu5GXXTuaKXvwHB
	wgD/PJ46dqt+6ROdqEyEPrG/jlAnysm5n6YZ4bX8MF9kSxf049h5UTE4GyW4CX7rotcEvU
	/aidztoi3mmPug2SS1LR8vKDULIzNRQTHAn+Ar6OH6TWTsgfcj56PPJSZ2sLPNJIhm0tH7
	qv7+LBHsBwrVfYsJ3Z+THszX0WUGUhHsNQ7qIxzvsN/PnrrFTFz3WjGnGfiub4UDYXJP6c
	EYgEuZ7ZJ08gduL70z/45BU5Qt55ZAHvn8XVTFXSNG9zCn9EROsQeeZpa3GPSQ==
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: Add vcc supply for SPI Flash on NanoPC-T6
Date: Fri,  5 Sep 2025 11:18:59 +0200
Message-ID: <de71cbe5db3347756d3173245d01e091d3ad1b50.1757062843.git.marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_021914_161697_CFAF9B74 
X-CRM114-Status: UNSURE (   8.99  )
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

FriendlyELEC NanoPC-T6 LTS schematics shows VCC_1V8_S3 being used to
power SPI NOR chip.

This fixes the following kernel message:

spi-nor spi5.0: supply vcc not found, using dummy regulator

Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
index 3d8b6f0c55418..e359d74f20885 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
@@ -731,6 +731,7 @@ flash@0 {
 		spi-max-frequency = <104000000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <1>;
+		vcc-supply = "<&vcc_1v8_s3>";
 	};
 };
 
-- 
2.51.0


