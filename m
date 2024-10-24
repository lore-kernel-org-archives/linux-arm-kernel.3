Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FDCCE8E8B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 15:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FuuE2DfjRA1FWJIBJRKhJNQLLqzau7vyr2ycbZbbPws=; b=HHWdo+0TPhdC8UhVv6RwikFGQJ
	tssn4V3DhoggSI7htk+bxxYSXPLvUpVaFrRvr54VQ/+SrgRkJyaUT7jS0LMCRJqdejyp+aO5HyVsH
	wACPKQjx/Ghb3uG/9N2nhPUpyr6FKpda5p9YByYtFo9Mm+djXei52eQH6xiFEV1yvJwBHx5Bhd+3h
	0xN6E0jczDNgaKf/eJprRVH7MznF0cC9gQIItrYWr7l56F80qt4txa7uyriOx6qC9RbGrRzBvlY6a
	eSeCSPH1cQnHWKWvjErzVtFEIyiZ5RzerB5p0FrrzHQy2tueM8Vomty6cXc6eQ9GPkpk5fqoQ8FRG
	TvXMa3hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zil-00000000u5T-23ty;
	Thu, 24 Oct 2024 15:25:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zXR-00000000sYv-1k8X;
	Thu, 24 Oct 2024 15:14:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=FuuE2DfjRA1FWJIBJRKhJNQLLqzau7vyr2ycbZbbPws=; b=U91iHFzlfLq6HHiw3lKnGqCxok
	auJKYm70mS6jujtQpufdmThT1Z/N0Q5rTB4SSOgZudLGz0BdgHPjH2QfdRG2Ke72WdObYKvC5m1S/
	Sp+KPYfryalG8hq0SxH6RhpcD2OXaSXuV0/7KBZrTftGxb2CBo1GGznwtoHDgTi4v2wRFNX/6zRru
	0iUrAevYl6q3FSKQK975o/m0lha3GmoIFZJquoUiI7863tI6vu57dzeUBhLb+iMlcqVP/ceZojP/g
	9fascOKDCHdgKm+H3zzgT1mRBWGhS9QmrSJt/zTbIzymVuypUOQI1D0+hdDeP15JXToCQvz0/WVMR
	Gq8TUn2g==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zXO-00000008h62-2te0;
	Thu, 24 Oct 2024 15:14:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FuuE2DfjRA1FWJIBJRKhJNQLLqzau7vyr2ycbZbbPws=; b=jFfH2AG9XtE7VrCasB/T4rs65O
	lIfHfZr1jtQ/1kBDTspQU3MMAQESkm4j+ZsnvbKX2GEZ9n2lzQkHtVmAm9vfpQU0TDObEGCuPVc5A
	exRVNIkmgxeN5dWwEKFdNFN8oS1L3rY5QfuoRh3/BKnMWWaV5eARt0Rh0+Cl7ZMuSmKuzORMSuvKC
	ndjRyULbvfeJxUHgkT26UekaZ4wK6MBIYxd0knwDSDw3OeEgUVTcGjwr2cT8s0TzX8ThhsKVPY+fN
	4E3+KmQwTOgdtRLwyfu4prD4Wnm7SKg3DwqDI/OxIOisqMoghXOUuBbwr/iKaE+WtXFH3hUWFjc+B
	GLaVzTDg==;
Received: from i53875b34.versanet.de ([83.135.91.52] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1t3zXK-0004at-OH; Thu, 24 Oct 2024 17:14:06 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH v2 1/3] arm64: dts: rockchip: add HDMI pinctrl to rk3588-tiger SoM
Date: Thu, 24 Oct 2024 17:14:01 +0200
Message-ID: <20241024151403.1748554-2-heiko@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241024151403.1748554-1-heiko@sntech.de>
References: <20241024151403.1748554-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_161410_837875_CD14544A 
X-CRM114-Status: GOOD (  11.26  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

The Tiger SoM routes all relevant HDMI pins to its Q7 connector.
Some from the M0 and some from the M1 set of pins.

Add the necessary pinctrl entry to the hdmi controller for the SoM.
Not all baseboards may use all pins, but even for them it'll serve
documentation purposes.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
index 615094bb8ba3..11c1cb27f9c3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
@@ -152,6 +152,12 @@ &gpu {
 	status = "okay";
 };
 
+&hdmi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&hdmim1_tx0_cec &hdmim0_tx0_hpd &hdmim1_tx0_scl
+		     &hdmim1_tx0_sda>;
+};
+
 &i2c1 {
 	pinctrl-0 = <&i2c1m0_xfer>;
 };
-- 
2.45.2


