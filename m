Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB95C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 22:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+XJoie9AEBmbqAgRJsukKa8ozih8Y1Wspy5pUrpo3Yo=; b=ygBVMwWePw4YwO9daGkGZ2Y+Bz
	F8LaGSmnxf55iq871e+xgE44H6Yu61poirOBExMg/j/XAzL3Q8KjAOqjeXRKgCeclCBZTpgnZoKKL
	TsRpkcrTuADdKEiGKlcUz/S1Y4asyq3nKjhHnKy6JInADg498507g85tMcIEAatoFJd/SeM703LF0
	zCz0LXaDOQzNSTGwnaEC/k/cSItWjzgazzaIGY8DLWxrlITUbMCecvL66EghAC0HHsAL4lbnVJyk8
	FVieUwV00pbHz5doyk11OpMI5Y5/P4PtcKHl1f7S/vtT6V/NABt8lWsb4uKwplUwZeqbc/IHspqli
	sTHURAJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL8g0-00000002Apr-30A6;
	Fri, 30 May 2025 22:58:12 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL8dn-000000029jX-47ic
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 22:55:57 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4b8JVq2wnmz9tVV;
	Sat, 31 May 2025 00:55:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1748645747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+XJoie9AEBmbqAgRJsukKa8ozih8Y1Wspy5pUrpo3Yo=;
	b=Cc8+WuBvUV7GDfqiD3oaC4MXKZzLaCbhehQRRGC3LvMoTOnMCvZelp3n0gO9Lvl0tIjYT2
	udXJ4PAfWCVooCp1cXugYZoMGckiStwp4RYj8ScAhCO5Uwlg7gPzO0pxfilxCprCOLdP9M
	MfwfYz0vCuNlFfNr4/F1pdNpVIWLn25FiL7DW9IVyvDxAMKEnc8rswdPnGxDbupzhQ9TIO
	fNE3ur+gpLjCTJpMgegG/UVEroZHi/BFy6Z/laIutQ3QrQXyK6iMqVA9zDqFoyCQuxvwB7
	sk0Yz6G4gY6niZsNgA2qsDaqabrd21hHyTPwol7OltI+UkFGbrlekBA2RtSFOg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1748645745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+XJoie9AEBmbqAgRJsukKa8ozih8Y1Wspy5pUrpo3Yo=;
	b=fU1pMUYiLd852k/Jf4hqU0aVVnYpuvq2UTDF7f6qzHb3GDiA0BwTQkBchsQL9zS+gMB37J
	/2otq3YSfwAtE798cSn+CS+TQRArWj0y4DR6vQ34kBRXjTOgDHtxkAHAWIz/4K2cANV9Ng
	Mb9hdju7ITDbmaylIL08ltHJzmGl6yIO5mJsZmmH/+lVySFjNa4eZdSJnrfpzwR3cRTeM0
	W7ubSTPculK9RHKmSHn7Xri1brYYa7qpihMTorAulAdDYSGAKyT7IcoyAwZknFZGP0+nVP
	Gn/1lUxa5r7nwjymr1jnKhZOqbpdFvxoVyuqDM4BnZVcv8vYeDxebmmyI3T8Bw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Anand Moon <linux.amoon@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/3] PCI/pwrctrl: Add optional slot clock to pwrctrl driver for PCI slots
Date: Sat, 31 May 2025 00:53:19 +0200
Message-ID: <20250530225504.55042-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: d7ac0f4db81ab4704d4
X-MBO-RS-META: f9zc6z889u3c4k9su4x5hdhkphnw59fm
X-Rspamd-Queue-Id: 4b8JVq2wnmz9tVV
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_155556_164454_BB3834D2 
X-CRM114-Status: GOOD (  14.83  )
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

Add the ability to enable optional slot clock into the pwrctrl driver.
This is used to enable slot clock in split-clock topologies, where the
PCIe host/controller supply and PCIe slot supply are not provided by
the same clock. The PCIe host/controller clock should be described in
the controller node as the controller clock, while the slot clock should
be described in controller bridge/slot subnode.

Example DT snippet:
&pcicontroller {
    clocks = <&clk_dif 0>;             /* PCIe controller clock */

    pci@0,0 {
        #address-cells = <3>;
        #size-cells = <2>;
        reg = <0x0 0x0 0x0 0x0 0x0>;
        compatible = "pciclass,0604";
        device_type = "pci";
        clocks = <&clk_dif 1>;         /* PCIe slot clock */
        vpcie3v3-supply = <&reg_3p3v>;
        ranges;
    };
};

Example clock topology:
 ____________                    ____________
|  PCIe host |                  | PCIe slot  |
|            |                  |            |
|    PCIe RX<|==================|>PCIe TX    |
|    PCIe TX<|==================|>PCIe RX    |
|            |                  |            |
|   PCIe CLK<|======..  ..======|>PCIe CLK   |
'------------'      ||  ||      '------------'
                    ||  ||
 ____________       ||  ||
|  9FGV0441  |      ||  ||
|            |      ||  ||
|   CLK DIF0<|======''  ||
|   CLK DIF1<|==========''
|   CLK DIF2<|
|   CLK DIF3<|
'------------'

Reviewed-by: Anand Moon <linux.amoon@gmail.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: - Fold PTR_ERR() into dev_err_probe()
    - Add RB from Anand and Manivannan
---
 drivers/pci/pwrctrl/slot.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pci/pwrctrl/slot.c b/drivers/pci/pwrctrl/slot.c
index 18becc144913e..dac1ae854f72e 100644
--- a/drivers/pci/pwrctrl/slot.c
+++ b/drivers/pci/pwrctrl/slot.c
@@ -4,6 +4,7 @@
  * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  */
 
+#include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
@@ -30,6 +31,7 @@ static int pci_pwrctrl_slot_probe(struct platform_device *pdev)
 {
 	struct pci_pwrctrl_slot_data *slot;
 	struct device *dev = &pdev->dev;
+	struct clk *clk;
 	int ret;
 
 	slot = devm_kzalloc(dev, sizeof(*slot), GFP_KERNEL);
@@ -50,6 +52,13 @@ static int pci_pwrctrl_slot_probe(struct platform_device *pdev)
 		goto err_regulator_free;
 	}
 
+	clk = devm_clk_get_optional_enabled(dev, NULL);
+	if (IS_ERR(clk)) {
+		ret = dev_err_probe(dev, PTR_ERR(clk),
+				    "Failed to enable slot clock\n");
+		goto err_regulator_disable;
+	}
+
 	ret = devm_add_action_or_reset(dev, devm_pci_pwrctrl_slot_power_off,
 				       slot);
 	if (ret)
-- 
2.47.2


