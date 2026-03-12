Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8724106ACC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 16:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Noz8BKpLkezZAolANRl1sFT+p7wODBoKnA2WzCpg5Ks=; b=3J/AqcblbujVxjY3h49YvzH/NH
	hvgUX6y7avHZIxuH8T2OJAwZLd9KKpmn0px6xMs+KgSwiookzxo9O66Ye6DwdtyrSiXx6pYMsnFQF
	jRuoNFnI1fsUBZKOWo/Z3Z7eSpA3AAcM6WH6DIfHnl7GxClbCyM27jVJs36slIHGX2vqkz1etdBsK
	neb2tSPJPxVzf5mPgdWKjFfCLcSh6YOdnOSqh8MgwcyAmHHrvzvUpbjI6vbsFw9kh2BXv0X+jEufT
	2jdUBFMU3QYd1qOmTSEUlpklzXVToWsXysMXJQ6K1mm6vhfIORHCbEN20x8IV64yh/dMUgHE7l7EC
	BuzS+vWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0j3I-0000000EaO6-3xZ1;
	Thu, 12 Mar 2026 16:38:24 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0j38-0000000EaE7-0zO1;
	Thu, 12 Mar 2026 16:38:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=No
	z8BKpLkezZAolANRl1sFT+p7wODBoKnA2WzCpg5Ks=; b=S+iaI+j9W4rhVrnlJI
	SJ1/XJU0bpNQhkAu32wUNbBDfiYaK70uNZDsrlLFNWgDVBOd+N7qS8qeHY8qlm9L
	NeEKIIli08ntF6HJ6AudqbgQnL9G9qEXNIYlpOZO5L+Qw1ezY2PAhtVqytJGgXhy
	NylsYBkRvhamFNaKaKTKHKIxc=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDnN1Gl67JpMC_OAQ--.12929S7;
	Fri, 13 Mar 2026 00:37:03 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: lpieralisi@kernel.org,
	jingoohan1@gmail.com,
	mani@kernel.org,
	kwilczynski@kernel.org,
	bhelgaas@google.com,
	helgaas@kernel.org,
	florian.fainelli@broadcom.com,
	jim2101024@gmail.com
Cc: robh@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	claudiu.beznea.uj@bp.renesas.com,
	linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-omap@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v8 5/5] PCI: of: Remove max-link-speed generation validation
Date: Fri, 13 Mar 2026 00:36:52 +0800
Message-Id: <20260312163652.113228-6-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260312163652.113228-1-18255117159@163.com>
References: <20260312163652.113228-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnN1Gl67JpMC_OAQ--.12929S7
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr43tw43CryDXw1DJF1DZFb_yoW8Zw4kpa
	y7CryY9r1rJr45Xr4UXFs5Za4agFn5WrW8tryrC3sruwnxXrZIqry2qF4aqF9a9FZ7ZF17
	Za1aga1UCayqyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pidMabUUUUU=
X-Originating-IP: [240e:b8f:927e:1000:1caf:6d92:f4ee:5e02]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCww8t0Gmy669rLwAA3q
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_093814_647250_9977AC92 
X-CRM114-Status: GOOD (  13.15  )
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

The of_pci_get_max_link_speed() function currently validates the
"max-link-speed" DT property to be in the range 1..4 (Gen1..Gen4).
This imposes a maintenance burden because each new PCIe generation
would require updating this validation.

Remove the range check so the function returns the raw property value
(or a negative error code if the property is missing or malformed).
Callers must now validate the returned speed against the range they
support. A subsequent patch adds such validation to the DWC driver,
which is the primary user of this function.

Removing the validation from this common function allows future PCIe
generations to be supported without modifying drivers/pci/of.c.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/of.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index 9f8eb5df279e..fbb779a94202 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -875,8 +875,9 @@ EXPORT_SYMBOL_GPL(of_pci_supply_present);
  * of_pci_get_max_link_speed - Find the maximum link speed of the given device node.
  * @node: Device tree node with the maximum link speed information.
  *
- * This function will try to find the limitation of link speed by finding
- * a property called "max-link-speed" of the given device node.
+ * This function will try to read the "max-link-speed" property of the given
+ * device tree node. It does NOT validate the value of the property (e.g.,
+ * range checks for PCIe generations).
  *
  * Return:
  * * > 0	- On success, a maximum link speed.
@@ -889,10 +890,11 @@ EXPORT_SYMBOL_GPL(of_pci_supply_present);
 int of_pci_get_max_link_speed(struct device_node *node)
 {
 	u32 max_link_speed;
+	int ret;
 
-	if (of_property_read_u32(node, "max-link-speed", &max_link_speed) ||
-	    max_link_speed == 0 || max_link_speed > 4)
-		return -EINVAL;
+	ret = of_property_read_u32(node, "max-link-speed", &max_link_speed);
+	if (ret)
+		return ret;
 
 	return max_link_speed;
 }
-- 
2.34.1


