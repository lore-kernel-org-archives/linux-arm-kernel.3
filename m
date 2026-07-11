Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD29C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 06:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wV6iPQx9mr9GnWcgEuPgvu8N7t+FUMy7pZdOenitrKA=; b=B8ItUlx8PHwG/BN5KVKW8zeVVA
	XhyfMLYrnpWGN+XzxXuXiaBjyZUuxB2nP462j/mIkAID7zzFu5U9bnIV19JzF+pK7zUZcDdwSY7Pv
	4P7jqsh8cenTsj6EFuGo64G+Zh2LRE++9m+Kzdl72QivrJ0rwvhPRwZi3/xdP7HZ4scQ8CJhYI3xs
	3k3WoBafDsmPhMpdpbhuJESg8TR+XY7reoyFfqDoTjGEMHsqD5C2c9un1LHEif0Tc8MHkfzqvp7S8
	BJq7GeS5s4JbWL+4XdYRfLv7k09amQ2fecyR09VSGLZkNxLDXElqLhZwC9xTeUi9qtvMD4uIp3gFS
	w4/glBcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiQnZ-00000006Eo5-2LrF;
	Sat, 11 Jul 2026 06:02:49 +0000
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiQnR-00000006EgE-2z7q
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 06:02:43 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1783749733; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=UNAol3P+3NSnVFANpP0PNenPYX/++5XBKrsgPStGoWHK/tv07cmPa4CJzz82unyIHc
    M8eZ9x6nBCb5bdWStJBwD+utDt8qbnwDhnjVL3zpTkhg2sm+HIz6WG/SQUNAkUBFoid4
    vVL0EHxWyMT0qkCfYkFfMwAzowyj1Fnm6BOpTCDIfGTIYvf+II4xprpVX15aGFypsvRm
    ABT8MKCOpLoEns9Qa5xUOAuoB9lU0hKeT9TqHkLv14sY99APWS9uZXQuo2oP9BONzh9w
    XGSJgByKluI4o61R5m931VxbCJE/fye3v22HyqwTWN+OLTtfNBA7HJ8602Ufw4F3+IbQ
    d2ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1783749733;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=wV6iPQx9mr9GnWcgEuPgvu8N7t+FUMy7pZdOenitrKA=;
    b=ii2uSQlgcBgDWO0l1OXPUTf/cKHjzlvnCuzFMpdI+q+YLehm+8FfA6yGgBxcSi4/DM
    UKKA1YNeyp0wxx2RXyYb7jn8DOvp0y4cE+q15n5KyFtB0qZGRvoP9yNOq1Q3uPONBP6B
    uTA0z7y5VHOZSb5JgTFkyO9VRPrNAWonHD3Z3tDXBWeYBDfrmwb84KrhhTKLHb5vZ61J
    KfuwZntjwOkOlgdABXYJiC7ZLIvdodcJMtkU2p+vdx5SRrJfIFX875Ogo9PPWJtttk2L
    2IakW966dWigtYojCV6X5VToJX2tvPMT4VUmAi+oreQnrFYXYGN9O9sYTFOymipRTvO+
    bIyg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1783749733;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=wV6iPQx9mr9GnWcgEuPgvu8N7t+FUMy7pZdOenitrKA=;
    b=TmE6zxFjGDgs6NxLtFBYoH6EGjXG5RKaK8LImJxYODhQQx0QMlKfBTwwX27Fmhf95z
    yaG+wFdkI908C3whCwXFEt9ZwEUxw/uL2GyzjFYKzzFb9KhA1SIbio8FbDj0l6aL6hf7
    QQzSxcfchX0AuadBytx3x8E508pv5SHIXs7bEE1UsxD/JNhdxivN6tra0r3te6YksbVp
    Xdp4884snRffHQldKJ+9Z0jMvvQmmPcsTZ52S6fPjOwWj4vKsrNcdMbkewjNse74ab5N
    t9x8iAUIeWmtOD3aUcPi8D9sp1bpGYHXA1kun4xtcOKAy2MH8r0+09+/KyzFr2dEkG5m
    Albw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1783749733;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=wV6iPQx9mr9GnWcgEuPgvu8N7t+FUMy7pZdOenitrKA=;
    b=LyjgpbMKh6H6ERpUAmFX42ygfbFz0rHJ1cHwrsF2a/wmKtnMvBsPB4UT/GVX7CtaN5
    Nbkrryo0KmZRFkCZ03Dg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrT35oLmciNszeF4HOToVDOd6S1gdjuILE2MKVd"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.5.6 AUTH)
    with ESMTPSA id Q4b76426B62CGhq
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 11 Jul 2026 08:02:12 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Grond <grond66@riseup.net>,
	Stefan Leichter <sle85276@gmx.de>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	Grazvydas Ignotas <notasas@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Andreas Kemnade <andreas@kemnade.info>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Sen Wang <sen@ti.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Niranjan H Y <niranjan.hy@ti.com>
Cc: letux-kernel@openphoenux.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	kernel@pyra-handheld.com,
	mfd@lists.linux.dev
Subject: [PATCH 05/16] arm: dts: omap3pandora: Don't use DMA channels for unused SPI masters
Date: Sat, 11 Jul 2026 08:01:52 +0200
Message-ID: <129b1ff8e73235c74ac66dab9041672190065785.1783749722.git.hns@goldelico.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1783749722.git.hns@goldelico.com>
References: <cover.1783749722.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_230241_911870_92A28EBF 
X-CRM114-Status: GOOD (  15.40  )
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

From: Grond <grond66@riseup.net>

On the pandora, only McSPI1 (spi0) is actually used. Because the device
tree defaults in arch/arm/boot/dts/omap3.dtsi leave all of the mcspi
interfaces enabled, the DMA channels which the device tree assigns to them
cannot be used for anything else. This is a problem because OMAP3's sDMA
controller can only have 32 DMA channels configured at any one time.

So when we try to use (for example) the McBSP subsystem (which is required
for sound) it doesn't work because we've already exhausted our available
DMA channels.

Fix this by disabling mcspi[2-4] on the pandora device tree.

Signed-off-by: Grond <grond66@riseup.net>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 .../boot/dts/ti/omap/omap3-pandora-common.dtsi  | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi b/arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi
index a0116823ffdef..b4acab1625212 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi
@@ -693,6 +693,23 @@ lcd_in: endpoint {
 
 };
 
+/*
+ * Only mcspi1 is used on the pandora, the others do not surface on the board
+ * due to pinmux configuration. disable the unused ones so that they do not
+ * consume DMA channels
+ */
+&mcspi2 {
+	status = "disabled";
+};
+
+&mcspi3 {
+	status = "disabled";
+};
+
+&mcspi4 {
+	status = "disabled";
+};
+
 /* n/a - used as GPIOs */
 &mcbsp1 {
 };
-- 
2.50.1 (Apple Git-155)


