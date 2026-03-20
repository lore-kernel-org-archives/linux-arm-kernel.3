Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AEDF1098799
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 15:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SUq07e3tFWu2Wbyc9JeCz4a/3cK7LZxQl7ZYp+SCWtw=; b=ZJE8f8AR6XpfWTbyBB55XgUjvs
	l/ZxS8bQBBIWYBYI4Hf3x63taArGMeY5qwvR7NgCFZbm9BF7/JOIuQPVQ9/pv9Rhq69qHzz3w/Pm2
	hnZ9wGDwI7exUsbXkClUkensc0CivLPx8XrszNkj62Rtaa5UHcA7R0vuFLE2jOerjEwZxyIgwmTu2
	8JkcScnDovEx5SfjUl+ipDywwHXFFewKcn09rA2e7I+MVZtYqbHm3z/rVAhDspm/FoWenq4f2CQIo
	DeT7IaPf3ataVd4qEbFbl2fEU5f+3B+NJoy8ZIUDJPqbA/hZ0IxvyIykU1EhFZ7QqoRkNip6ml+zA
	RO7q4Xbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3beL-0000000D1qz-3wKv;
	Fri, 20 Mar 2026 15:20:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3beK-0000000D1pM-11Wa;
	Fri, 20 Mar 2026 15:20:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 22EC66184E;
	Fri, 20 Mar 2026 15:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4621C4CEF7;
	Fri, 20 Mar 2026 15:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774020030;
	bh=vXaAW1fyWcmmS9WVP6WjZrb2DqMl4KjlqcJvvJObNgg=;
	h=From:To:Cc:Subject:Date:From;
	b=H/U/68pz8bEM4dKGRPoLvjksgIORU1tb6seRof9WeFwrE2qSx4A2SVgurKHVNg5b+
	 bLAqnA60e1CfJOXf8LrFtX5Bfv+tpL+AewrHaHI3o1mlDAxrvBjQ1ESqyQL4dIU2qd
	 ZAPTM+sjXxne4RvjhpZaw2HfFGFWST2rrnF5Nf7FQiL0+HTyFXofPGzvRClkO/fGsM
	 fRUJCbe1MlQswkC49cMRmSSdvt5u5hT8h3CFnRBj8tZYA5DglgEdDo7wnq5OqtitAn
	 hW6Mwg77//vta1dZDh/j/a1+6kQyVs1Z/V2Y9kIPJs7A5THpGKNdLlBdttW0jtIA4g
	 t6/WzAF8iNA2w==
From: Arnd Bergmann <arnd@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	"Ivan T. Ivanov" <iivanov@suse.de>,
	Stefan Wahren <wahrenst@gmx.net>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: broadcom: bcm2712-rpi: mark /soc/firmware node as 32-bit
Date: Fri, 20 Mar 2026 16:20:19 +0100
Message-Id: <20260320152025.3501473-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Arnd Bergmann <arnd@arndb.de>

Moving /soc/firmware to /soc/firmware/rpi-firmware resulted in a build
time warning:

arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi:200.4-15: Warning (dma_ranges_format): /soc@107c000000/firmware/rpi-firmware:dma-ranges: empty "dma-ranges" property but its #address-cells (1) differs from /soc@107c000000/firmware (2)

The problem is that while both /soc and /soc/firmware/rpi-firmware are
limited to 32-bit DMA and MMIO addressing, the intermediate /soc/firmware
now gets the default 64-bit addressing, which requires an explicit
translation of the DMA addresses of its 32-bit children.

Mark this one as 32-bit as well for simplicity. Note that this does limit
any other kind of firmware to 32-bit address translation as well, which
might not be ideal in case any of it runs in 64-bit mode. A better solution
may be to move it out of /soc altogether.

Fixes: e3b22edda733 ("arm64: dts: broadcom: bcm2712-rpi: Move the firmware node down 1 level")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I'm a bit confused by the changelog test of the e3b22edda733 commit,
which does not appear to match what it actually does. Maybe the intention
was to move /soc/firmware to /firmware/rpi-firmware instead of
/soc/firmware/rpi-firmware? This would also require an explict
dma address translation though.
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
index eddaf72c4e73..c3e71e6aaff6 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
@@ -191,6 +191,10 @@ wifi: wifi@1 {
 
 &soc {
 	firmware {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		dma-ranges;
+
 		firmware: rpi-firmware {
 			compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
 			#address-cells = <1>;
-- 
2.39.5


