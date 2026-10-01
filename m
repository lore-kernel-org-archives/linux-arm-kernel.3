Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137F5CA5FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 17:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DHDxTGbIRNcqIvihMU0zQVGbd/spHZ4Yk1yDhbc3g/c=; b=KQFcnTj9/o7CTVoAy2tRDyh2NS
	cng8S7Jbd+TILsdo+63vKCYO4igKvQRm6kKgHP2MHBIP6GSX6XGvxLnN18O659b5BTMt/O7NKQqYV
	nP6S2LyzN9curEwwaZIHp92xB3hBNtMiE1hgwPxz6rBZCOLuVF22+zSt8tLqmemMhv+ryx468N3WV
	pP8IKrM18JLcsYywOuUODMREdmRX0bnmheD4RsYszoVSzRG1NOA0GfkxffO5uQpYRwXedcHEDn7cE
	VJkQx+1Zpqrr7UOiUOsHQapFdgkQis1WC3VJYj8HArFBVVlWS4p3WiqD6ynRIYDqKzc/ayeagNIjN
	pUR1LKaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCKuc-00000009u5t-08CP;
	Thu, 01 Oct 2026 17:49:42 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCKuY-00000009u0a-1h1o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 17:49:39 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id CAB5F1FFE3;
	Thu,  1 Oct 2026 19:49:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790876972;
	bh=DHDxTGbIRNcqIvihMU0zQVGbd/spHZ4Yk1yDhbc3g/c=; h=From:To:Subject;
	b=Ui3qd7hFncWyvvZTnAVk75/pg4MLR0hznhWHvejoyIeecg98Cxi5T65XaZPk0BW3P
	 /sDB60Qm9A8KJL7AWFWNVA0Ea16/drZApJccXIQVJFHHnvrkEKZIMFQa3SzdKbtvjM
	 rArCd0TaG20IsgTaY8IPhEMFTqsf7CKKd5rsZvsYOwLoaVYUiLf0ZlO6vfrjOa5C7o
	 W3eZaXqdlCnE2PTmkZn2FBE/v1Khd537ZeQ7+dcPNQRpCAzOP0GXpIopjPJ9nJXKGj
	 HVUyvfEZYfavv/vOkQi94yiq7ixLlHXACFvDJipH5iEgXYlLrmiR+uV7sIm6vC+eN0
	 QKWnSPwtCCoIg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v1 1/7] ARM: dts: imx7d-colibri-emmc: Enable the VGA DAC
Date: Thu,  1 Oct 2026 19:49:10 +0200
Message-ID: <20261001174924.3831455-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261001174924.3831455-1-francesco@dolcini.it>
References: <20261001174924.3831455-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_104938_622240_3BC6A0F7 
X-CRM114-Status: GOOD (  10.28  )
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

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

On the Colibri Evaluation Board and Aster carrier board, the BL_ON signal
on SODIMM 71 controls the active-low power-save input of the ADV7125 VGA
DAC. The VGA overlay does not drive this signal, leaving the DAC disabled.
The monitor receives the sync signals but displays a black image.
On the Iris carrier board, the DAC power-save input is pulled high
so the missing GPIO configuration does not prevent the VGA output from
working.

Add the pinctrl configuration and an active-high enable GPIO to the VGA
bridge so that the simple-bridge driver takes the DAC out of power-save
when enabling the output.

Fixes: cc6c96f0bdd7 ("ARM: dts: imx7d-colibri-emmc: Add VGA overlay")
Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-vga.dtso | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-vga.dtso b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-vga.dtso
index cda214c13876..363c0c2cc43e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-vga.dtso
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-vga.dtso
@@ -12,9 +12,14 @@
 /dts-v1/;
 /plugin/;
 
+#include <dt-bindings/gpio/gpio.h>
+
 &{/} {
 	vga-encoder {
 		compatible = "dumb-vga-dac";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_bl_on>;
+		enable-gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
 
 		ports {
 			#address-cells = <1>;
-- 
2.47.3


