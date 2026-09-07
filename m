Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F81EC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 07:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/IuHbdKM4Vlg4v55WkOO4/O+rKTsVzLmcSrrax4XTxQ=; b=fhccBZHsfk0WYN
	edCBhoGfwxNy7ty0nQUMJfi4ThGPM/0Nb3Z1V6WGLSgsfSAR7nd3fEqhpNaIslrmyPAjRAmZd9ZXj
	4wRwnB2GCwh4GNwLnNMRiFBiRhE0yeQ3T7SkzHnB7YxH47yq5Zum7Mpd5tPVkKAzPyE9IAp99g6sz
	4a7HqLJWJsqjcDaYOZ92Uf4UUyCwEEjub87DMmR7EGpYXji3bgz+GH6czrfymOvjEbacRvlmB/Vna
	qXWLJvCsUWmkfYAfkC7cF8QlT/2MtHxUvqptv1X2NGvcQdi8cyn9oAvr6YESljPyGOfSaCnNDDJWo
	tjp7igqzDz3hEf11vIMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3UAn-00000006CIB-0FuV;
	Mon, 07 Sep 2026 07:53:49 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3UAc-00000006CDz-2uuu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 07:53:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:Subject:Date:Message-Id:
	MIME-Version:Content-Type:Content-Transfer-Encoding:To:Cc; bh=/I
	uHbdKM4Vlg4v55WkOO4/O+rKTsVzLmcSrrax4XTxQ=; b=Ln9cOCLVtolM7KcE/E
	Ohz6OceECfg9/GCfHvDBhq7lF4ikO3PXcIeWPl1WWLXQTvjhBjUgvQ1Pd7x5Pz+9
	OPmKdaaCl9KPXIHCQL8fwQbVvKTMkXXOcI6SstUeBLXRH+sIAiG05NyeFv27M1vv
	HYXMdISDWiyIX6Qf41Ud2rNQo=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwDHQAf_a55qnlUAAA--.364S2;
	Mon, 07 Sep 2026 15:47:11 +0800 (CST)
From: Jia Wang <wangjia@ultrarisc.com>
Subject: [PATCH net-next v2 0/5] net: stmmac: Add common RGMII delay
 handling and DP1000 support
Date: Mon, 07 Sep 2026 15:46:49 +0800
Message-Id: <20260907-dwmac-ultrarisc-v2-0-9a39bf8db313@ultrarisc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOprnmoC/2WNwQ6CMBBEf4Xs2TVtgwKe/A/DAZat1EghbUEM4
 d+FmnjxOJl58xbw7Ax7uCQLOJ6MN73dgjokQG1l74ym2TIooc4iVxk2r64iHJ/BVc54woyyQiu
 dC91I2KjBsTZzfLyB5YCW5wDlt/Fj/WAK++G+bY0PvXtH+SQjET2FkH+eSaJALYv0lOYyrUlff
 92R+g7KdV0/Arql5s4AAAA=
X-Change-ID: 20260827-dwmac-ultrarisc-7c79f2f80fd1
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, Jia Wang <wangjia@ultrarisc.com>, 
 sophgo@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788767221; l=3539;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=E0fIp/TpmZlPXhCfLju8023vKe4cY7vjVI1k+JcRdXM=;
 b=7q5KhNLkPIVPaYJq+BSR/OQFUBp8T8TvMM/iF0fcGmrLCXZGptDJJOls0LRVYq27eDCCpAkLb
 qWa2PueH5IUCSn93tk9PAHSuoHWwvwoZwNESHXaHUgy0MFTa7XBrLEn
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID: AQAAfwDHQAf_a55qnlUAAA--.364S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXr1DtF1xGrWxAry7Ar4fXwb_yoW5Kr1kpa
	93CFy5C3s7Jr4fGwsakw10vFyFqay8try3GF4xKw1fXas8AFyYqr90v3y5AF1qyr4kWF1a
	yr1Uuw13Kas0v37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9l14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRRBT5DUUUU
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQACEWqdDaQAAQALsG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_005344_198638_7DBE45F4 
X-CRM114-Status: GOOD (  11.92  )
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

The UltraRISC DP1000 integrates a Synopsys DesignWare GMAC from the 5.20
series with fixed internal delays on both TX and RX RGMII clock paths.

For boards without PCB delays, "rgmii-id" describes the link. Passing this
mode unchanged to the PHY would enable another pair of delays and break
RGMII timing.

Add TX and RX internal-delay capability flags to the common stmmac platform
data and adjust the PHY interface mode in stmmac_pltfr_probe(). Convert the
Sophgo and EIC7700 glue drivers to this common handling, then add the DP1000
binding and glue driver. The DP1000 glue driver only declares both delay
capabilities.

Tested with:

1. dt_binding_check and dtbs_check.
2. RISC-V build with CONFIG_DWMAC_ULTRARISC=m.
3. Runtime validation on Shenzhen Rongda M0 with a YT8531S PHY and
   Milk-V Titan with an RTL8211F PHY: ultrarisc-dwmac binds and
   establishes a 1000 Mb/s full-duplex link on both boards.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
Changes in v2:
- Fold the snps,dwmac compatible-list update into the DP1000 binding patch.
- Add common stmmac capability flags for MAC-provided RGMII delays.
- Convert Sophgo and EIC7700 to the common RGMII delay handling.
- Simplify the DP1000 glue driver to declare its TX and RX delay
  capabilities.
- Add Conor Dooley's Reviewed-by tag to the DP1000 binding patch.
- Link to v1: https://patch.msgid.link/20260901-dwmac-ultrarisc-v1-0-f19454814bcf@ultrarisc.com

To: Andrew Lunn <andrew+netdev@lunn.ch>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Jia Wang <wangjia@ultrarisc.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>
To: Jose Abreu <joabreu@synopsys.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Chen Wang <chen.wang@linux.dev>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: netdev@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: sophgo@lists.linux.dev

---
Jia Wang (5):
      net: stmmac: Add common internal RGMII delay handling
      net: stmmac: sophgo: Use common RGMII delay handling
      net: stmmac: eic7700: Use common RGMII delay handling
      dt-bindings: net: Add UltraRISC DP1000 GMAC
      net: stmmac: Add UltraRISC DP1000 GMAC support

 .../devicetree/bindings/net/snps,dwmac.yaml        |  1 +
 .../bindings/net/ultrarisc,dp1000-gmac.yaml        | 74 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 ++
 drivers/net/ethernet/stmicro/stmmac/Kconfig        | 11 ++++
 drivers/net/ethernet/stmicro/stmmac/Makefile       |  1 +
 .../net/ethernet/stmicro/stmmac/dwmac-eic7700.c    | 13 +---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c | 12 ++--
 .../net/ethernet/stmicro/stmmac/dwmac-ultrarisc.c  | 52 +++++++++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  | 11 ++++
 include/linux/stmmac.h                             |  2 +
 10 files changed, 164 insertions(+), 19 deletions(-)
---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260827-dwmac-ultrarisc-7c79f2f80fd1

Best regards,
--  
Jia Wang <wangjia@ultrarisc.com>


