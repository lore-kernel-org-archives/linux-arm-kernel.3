Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CBBC54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 May 2025 16:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r6Bs6NUrhRuWdYh2pTI3k1vpGojw0BMsDwh3G1I30Yc=; b=Fqf/ysJHA+ahku9H4iV3BYMRyk
	50Po406Q1aDftv87M0W2SxzI8efocXAb0Xve5x5CnnNNyPKFDcJW57IjKWgrzrVvz4wIVnsffyMgQ
	JSTOWwXHsMu7HiRi3T0jRDTuqF0OHWREff3XG/xhIwPYgTXpDJaPntOn16cFo+j2nMJP16qvbI9Tp
	OSoLg4IEcxhVDgs8S43GyOBbWd1uCCxmfI77bFL0gYEljme02zh+/WEZSOZ0H2PCZqqQaOf3/hB1E
	kkkbPKpw+24bMgnlexB07rZDVHg8rkwzJv60mf+U6LfWWb4J4rrqqfr983/DTW1uPzEGJc9x7nhNM
	31G9g5CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJDtd-00000007JxF-2fyy;
	Sun, 25 May 2025 16:08:21 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJDqt-00000007Ja8-2H31
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 May 2025 16:05:32 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4b53dj5TXkz9sQv;
	Sun, 25 May 2025 18:05:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1748189129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=r6Bs6NUrhRuWdYh2pTI3k1vpGojw0BMsDwh3G1I30Yc=;
	b=q7fH74UCiGjUCtvewWiab8OveZ5LFfVl9RJXCN5M9knYjnkHpJqEsniAcQWLHFxnNMRY6p
	VhvvsZLioOVUlULBNftr27WstEet3ye5HnImH0lEiBiNyjd93xB7iIw65EonLNdiT9XyPX
	B+dDkbahyv+9EU1qjZjRl8BQymJ9csoIcI2U1zruVAcG/6+KgZKn3c+/dB3b8SRddCqlEO
	toR9v919wd8D7oojYKCqsIpoWadCQ+WF/xNe4IdaBIM9kptE8LwVcry4DThrpHvAjUfQG9
	jevQ1iFJ1hSEPyXwQfRCqODsT0qsAcW7Y+uG4ANxWAp7UG+4TjN9w7I3/0M8ow==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1748189127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=r6Bs6NUrhRuWdYh2pTI3k1vpGojw0BMsDwh3G1I30Yc=;
	b=vx6ZmcZPScSAn+W0D42gmSdW6iD/n6XE/QL1GTl3QAvdSlTquHt+DbX6am6Sw38qYKcmGM
	FqVLWzkEBhhTMMM6I1TCohAlcDAHuHhdDMfyeG0dxylpZ2aKvo77hkxZNgeAbGnlnKE05Z
	2NFit28YckLdWUrHYKZzKl/JI4UnSF4vY2Idp9R6L30YGkTzu5YuxLt2mHLF6q1oFd+EaS
	Y4PLbrYd6j69/bqxYPhPG6pT1iuhycP6bv8Yems+1UOw6eUp0qf3/3LXiHmz3fMcnZjcqi
	OKGqecvgw/FmT+l3l7CxzIqb6CkU1JQNAonDFamQo86Qcjq6yeMK4coRSn4SaA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] PCI/pwrctrl: Add optional slot clock to pwrctrl driver for PCI slots
Date: Sun, 25 May 2025 18:04:03 +0200
Message-ID: <20250525160513.83029-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: a0166e157057709b695
X-MBO-RS-META: 54eity3pg7adano1bw754w6wzqd8pdzu
X-Rspamd-Queue-Id: 4b53dj5TXkz9sQv
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_090531_724672_FEE118BE 
X-CRM114-Status: GOOD (  13.99  )
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
 drivers/pci/pwrctrl/slot.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pci/pwrctrl/slot.c b/drivers/pci/pwrctrl/slot.c
index 18becc144913e..222c14056cfae 100644
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
+		ret = PTR_ERR(clk);
+		dev_err_probe(dev, ret, "Failed to enable slot clock\n");
+		goto err_regulator_disable;
+	}
+
 	ret = devm_add_action_or_reset(dev, devm_pci_pwrctrl_slot_power_off,
 				       slot);
 	if (ret)
-- 
2.47.2


