Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A483EC624CE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 01:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WrlZlq/Ukg6tU5uYiXQOjyVhnRiamFbSgmVGOW21QaU=; b=t+uKFE91NVfBF7
	EtM6wmlPzlssLo+mfGzk0+DDAearDJCe66NK4wONKP6DjMJB7Ht3BXybQE0Tilxl63kgHU843y2gx
	XkFNFXoK2PslDyOJrtz4zG2u0C9T8qJudV1XlKJj6gVRx6vMEiVJS6gdBU6lc07v6uSl8xukEsSnY
	YzHDLUdATkk7m5YaRfzq8GspyDFgHH07zzkM6Z9kIthZFW0Ssze7eiGBqeV3gCjNUEDz+jSI3ZCSc
	a5YRNLBsebb4RnApUz7guF5Bkd10XAYDfeL6WPcjuRcB9phKj2AXhC2TqL6by5Uv3jw14k4mBu263
	zPKvb+FF+WbA/nja2nTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1DId-0000000AnhB-2lRr;
	Tue, 01 Sep 2026 01:28:31 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1DIa-0000000Ang4-3Hmk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 01:28:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:Subject:Date:Message-Id:
	MIME-Version:Content-Type:Content-Transfer-Encoding:To:Cc; bh=Wr
	lZlq/Ukg6tU5uYiXQOjyVhnRiamFbSgmVGOW21QaU=; b=Vpr1qOnQ7BQiLJDZ+2
	ETZ48mVxT3pFXd3Y4sesDeSsZ/u5h16uFaic13ipW3gH7BoBvsXZED7qGa6zgb+/
	LlSl/h7JohrOIZ0/HHsAlkjCLDsz9pgBba/23y9DkwVeWiCrGTSE5YoovWIO1yR6
	c51p0svkv/p7NOEhRVafgn0R0=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwDnrwYZKpZqvx0AAA--.111S2;
	Tue, 01 Sep 2026 09:27:53 +0800 (CST)
From: Jia Wang <wangjia@ultrarisc.com>
Subject: [PATCH net-next 0/3] net: stmmac: Add UltraRISC DP1000 GMAC
 support
Date: Tue, 01 Sep 2026 09:27:29 +0800
Message-Id: <20260901-dwmac-ultrarisc-v1-0-f19454814bcf@ultrarisc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAEqlmoC/yWMQQ7CMAzAvjLlTKSuBzr4CuJQ0nQEQUFJB5Om/
 Z3CjpZlL2CswgbHbgHlt5g8S4N+1wFdYxkZJTUG7/zeDT5g+jwi4XSvGlWMMFA4ZJ8Hl1MPrXo
 pZ5n/xxMUrlh4rnDejE2XG1P9DWFdvzWSKKh9AAAA
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
 Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, Jia Wang <wangjia@ultrarisc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788226062; l=1669;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=yJE5PmKj9xp18WQCV9PO1CGrkbkB6wXZibF6L4cW2MM=;
 b=uBEkdhNGN0KNSs5ew0dPyZf5HS16Iu5sGIyVbWynEqq22OG2189vuxtgUSnuECVn34yJ66DlH
 ecBKdY2O+LACKSWD79osQnF5skG6aKewz3Xl8SmdkSEQTcoao1uUyHq
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID: AQAAfwDnrwYZKpZqvx0AAA--.111S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tF4xurWrZw43KF1rAw1UWrg_yoW8WrWUpa
	98Ca4ayrykJF4Ig3WSyw48Ga4SgF40qrW7KF4xtw1fJFZ8JFyDtrZ0g3yUA3Wjyr4kXF1a
	vF1Uuw13Ga4FvaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9l14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRNJ5oDUUUU
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAREWqVJKMAFQABst
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_182829_317278_7DB8607A 
X-CRM114-Status: UNSURE (   8.02  )
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

The UltraRISC DP1000 integrates a Synopsys DesignWare GMAC from the 5.20
series with fixed TX and RX RGMII clock delays that cannot be disabled.

For boards without PCB delays, "rgmii-id" describes the link. Passing this
mode unchanged to the PHY would enable another pair of delays and break the
RGMII timing.

Add a dedicated binding and a small DWMAC glue driver. The driver uses
phy_fix_phy_mode_for_mac_delays() to account for the fixed delays before
attaching the PHY and rejects unsupported RGMII modes.

Tested with:

1. dt_binding_check and dtbs_check.
2. RISC-V build with CONFIG_DWMAC_ULTRARISC=m.
3. Runtime validation on Shenzhen Rongda M0 with a YT8531S PHY and
   Milk-V Titan with an RTL8211F PHY: ultrarisc-dwmac binds and
   establishes a 1000 Mb/s full-duplex link on both boards.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
Jia Wang (3):
      dt-bindings: net: snps,dwmac: Add UltraRISC DP1000 compatible
      dt-bindings: net: Add UltraRISC DP1000 GMAC
      net: stmmac: Add UltraRISC DP1000 GMAC support

 .../devicetree/bindings/net/snps,dwmac.yaml        |  1 +
 .../bindings/net/ultrarisc,dp1000-gmac.yaml        | 74 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 ++
 drivers/net/ethernet/stmicro/stmmac/Kconfig        | 11 ++++
 drivers/net/ethernet/stmicro/stmmac/Makefile       |  1 +
 .../net/ethernet/stmicro/stmmac/dwmac-ultrarisc.c  | 54 ++++++++++++++++
 6 files changed, 147 insertions(+)
---
base-commit: abdf623ddb75b24659018d3952d8f61937306ae5
change-id: 20260827-dwmac-ultrarisc-7c79f2f80fd1

Best regards,
--  
Jia Wang <wangjia@ultrarisc.com>


