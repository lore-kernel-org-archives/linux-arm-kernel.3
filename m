Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A50C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 19:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GLU+nebvdF0Xc0gdMqKgeHYgpviM0sd25FRzaRblhYM=; b=WZxGEoM+GC+ls4WS6BTXRXI5Mq
	zOaosnR0aZUN/x6S95DNDBwHovS/ek6+nrEZXxM2MJwYWY6EvZov8MTFq79i3S/Tn0XfUUNpwKtZX
	L2OBJd9MOcyHEOVtG0Fb8wJWPYjcarlvxGYDE8sSWUfgwmj9NW/yZL+qab42yNUmpomRxQL++jeLC
	wfvZnkCle/EgztyYeUCnMnvGqYHywZpIYW/i0wVcJogqF279mcTwWm/6Zj7lRNHFodcElJZjkx8Zt
	Nvxr3TGUBF4RPvfXO1r5OBRsidflzy5jwIrh1riM47tnCDCxNJBflL3pQLLJorscSofjViiWSK/VE
	tWTTHk0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNzZA-000000020sw-1RrA;
	Sat, 07 Jun 2025 19:50:56 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNzUk-000000020Rr-3Zng
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 19:46:24 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4bF7wS0Ytjz9sdF;
	Sat,  7 Jun 2025 21:46:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1749325576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GLU+nebvdF0Xc0gdMqKgeHYgpviM0sd25FRzaRblhYM=;
	b=BqmtWzLpFRUIuZ0/4CRUlxGpnCBP8p7/dunKVwZIocYhKf8148BAPYyaWxaWyioRRdvIL5
	RAlL6drcUGIwljo2VNj34nng2IJ/WbqdCy3vLDENSKiE66Kql7npzUHh38nHc9A2DCJ2rF
	R4Rs3vSghnGsbap7yQnZYWa1/WpVcnk0HxXcITww5qbryQPlFpgNBeHufd++uFwMCswpe2
	gbdZNLaq9tirGAcYVcpB84pkrTlVbAYPiUJw0R1Bl3vw9icX9x9/Bqm1VFpPYOh8EXl0vj
	5DCKu1lnwmWEbvPz8g4CKMGKuTwb3RoKC8DLjEagYJ6EVusDVNxPflvw6O5dyw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1749325574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GLU+nebvdF0Xc0gdMqKgeHYgpviM0sd25FRzaRblhYM=;
	b=NEj7xwujtH10WMm5FBPTSoyLikdfGnJkn2Q+TaVarhLwhXYUo0XDyoS4w/elMcQ4lYwBYE
	lLIJk7hrQv6zanQpb/kYokqFhCyZMu0iCPKMBBDX4Whejm3frWbFJnDrJQAKPOnyzmXpWQ
	P534ZxtWMaTpLzDwfXQBllQuXBktS3IJsQyJkM2CXDSjDm+34WwnjsYOYXnzlbaA3YRlei
	qbKbTsdRlBFQ0ykeq536P+lIwxsr3ck1PzH4It+gFK7cqnjk6wOpmvg97+2Qc32ydmgOP4
	a8WAhUin4fA4ANoGygrbWUwxN0YwSuLWOYntpBnaY1JT+4E+qb8eL6K987v/rg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
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
Subject: [PATCH v3 1/3] PCI/pwrctrl: Add optional slot clock to pwrctrl driver for PCI slots
Date: Sat,  7 Jun 2025 21:44:37 +0200
Message-ID: <20250607194541.79176-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 4m3iyza63un1hdtsihem8djp8uwn8jy8
X-MBO-RS-ID: c9a665f1ebd789dfeff
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_124623_036028_2359DA70 
X-CRM114-Status: GOOD (  15.24  )
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

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
V3: - Rebase on top of PCI/pwrctrl: Fix double cleanup on devm_add_action_or_reset() failure
    - Move devm_clk_get_optional_enabled() below devm_add_action_or_reset()
    - Add AB from Bartosz
---
 drivers/pci/pwrctrl/slot.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pci/pwrctrl/slot.c b/drivers/pci/pwrctrl/slot.c
index 26b21746da50b..3320494b62d89 100644
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
@@ -56,6 +58,12 @@ static int pci_pwrctrl_slot_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	clk = devm_clk_get_optional_enabled(dev, NULL);
+	if (IS_ERR(clk)) {
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "Failed to enable slot clock\n");
+	}
+
 	pci_pwrctrl_init(&slot->ctx, dev);
 
 	ret = devm_pci_pwrctrl_device_set_ready(dev, &slot->ctx);
-- 
2.47.2


