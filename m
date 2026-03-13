Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E7C107BCCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 16:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jjDNm/XzahkRhGQzN2/ls50FUOrDxUcWtH7f1FncHjY=; b=sldy/sHsMJQi1d+5NPPihjPCej
	UQvEd4yPxhNZp5YMYt5SQneGBda0MRYTtJhiU6BdEKhI5ErAfPq/dJ+20W/t+ebN+iLd+3N7cYUHG
	QAqGtV2yVCsZkMG7uk5ZicM6y2UAOpw6D96beykBiXXA30nALeRPQ/KnJKU9vtsWdvTxC+sZQitir
	j/kdowzTDbl1xYHsTnECj40jYQf1TLFLD6qW26E9hhqFJIDi8oeV+O52amIKOMzzVyis4a4iAfgh6
	KRk4Ve0iQRFws5Eqk+aWtt2d7YiSUwMetK9NoVqYvGBfbv628X3jJsPYSe9Uao4NMRHVjYiNy9hiI
	lm4fNfHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15oe-00000000hfW-0dJK;
	Fri, 13 Mar 2026 16:56:48 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15oM-00000000hSp-18Vm;
	Fri, 13 Mar 2026 16:56:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=jj
	DNm/XzahkRhGQzN2/ls50FUOrDxUcWtH7f1FncHjY=; b=oG71UXqYCXt2nWkn/c
	ijnOrcy8X4LK/CHjGC54b+5PKvlRDgNV9E9rj2ho8TLda9metMKkvnc1Toglbwto
	OccRPnIDwOT+h1HWznW3/Y8s9c24oaIYJRwRzXUa2v7K+2D/iFH/Tnl/0bBrBEGc
	ueSXwsRlVKQTVrqH7D4L0spaM=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wAX2JV7QbRpTApJAw--.54345S7;
	Sat, 14 Mar 2026 00:55:30 +0800 (CST)
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
	shawn.lin@rock-chips.com,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v9 5/5] PCI: of: Remove max-link-speed generation validation
Date: Sat, 14 Mar 2026 00:55:22 +0800
Message-Id: <20260313165522.123518-6-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260313165522.123518-1-18255117159@163.com>
References: <20260313165522.123518-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAX2JV7QbRpTApJAw--.54345S7
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr43tw43CryDXw1DJrWrXwb_yoW8tw43pa
	y3AryY9r1DJr4rWr4UJF4rZa4jgF1rWrW8Kr15C3sruwnxXrWYqry2vF4aqFySkFykuF17
	X3WagF4UCayjkaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piWCJhUUUUU=
X-Originating-IP: [240e:b8f:927e:1000:ce47:698d:adec:5bb5]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxAL3m2m0QYLKGgAA3k
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_095631_132044_6EE24BE3 
X-CRM114-Status: GOOD (  13.47  )
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
 drivers/pci/of.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index 9f8eb5df279e..d645041f5125 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -875,24 +875,24 @@ EXPORT_SYMBOL_GPL(of_pci_supply_present);
  * of_pci_get_max_link_speed - Find the maximum link speed of the given device node.
  * @node: Device tree node with the maximum link speed information.
  *
- * This function will try to find the limitation of link speed by finding
- * a property called "max-link-speed" of the given device node.
+ * This function will try to read the "max-link-speed" property of the given
+ * device tree node. It does NOT validate the value of the property.
  *
  * Return:
  * * > 0	- On success, a maximum link speed.
- * * -EINVAL	- Invalid "max-link-speed" property value, or failure to access
- *		  the property of the device tree node.
+ * * -EINVAL	- Failure to access the property of the device tree node.
  *
  * Returns the associated max link speed from DT, or a negative value if the
- * required property is not found or is invalid.
+ * required property is not found.
  */
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


