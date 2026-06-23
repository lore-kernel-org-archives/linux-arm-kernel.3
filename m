Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BAFCDB46B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 02:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CthWdMNq9JCpMJG/+tGCru7j6+DzXpWUhKMLM+JWrZ4=; b=Si9uwHLRTfsk5X7y9L9Mx2o4J5
	rfWMh9BwKhQB2piiWC25ijK5W1+cM2fEm1NheogWoG7E3IV7uSb9GTKjwIg5jehQ+y7cTyMEuuTnM
	49s9+oseQXFKuR8yFm6m8z8GUS1jMQs/eKXLRzZ0QWNyhifY6e9FikChWRHCqtlXv38mzPKZqDXJP
	HSRiqifbbThLitUFDNYgh03Wo1gn7HlqrAG7BdZQJYO5v10vHCulKCw1mRUG8TbC/fQyCDTGMWN1i
	OlaCeBOzSHfP2buMtlHjqJgPJGP1fntWbNSrw2luHQRmOYq9XOVmBdPEkvXrkzUEpZzyipIcm175+
	HHondNlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbqY4-00000005aOj-0VRl;
	Tue, 23 Jun 2026 02:07:36 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbqY0-00000005aOA-3DhH;
	Tue, 23 Jun 2026 02:07:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ct
	hWdMNq9JCpMJG/+tGCru7j6+DzXpWUhKMLM+JWrZ4=; b=SGp/dcwcfCDc71R212
	f2d+WJ6kgweXhVwK3WoGF3f/R63Uu7WKE6eAj4Tckq0VCqL6B8D69e7v3v7P0/js
	pUdp7KNHHugSKK52TH+5WMzraA62YqP8GXyLCQOX01g2FyaO3HPRQ5H9zkpEm6WX
	fOqzBDs/qYay9GZepM5JlRPWE=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wAnM8c+6jlqfZp1FQ--.32290S2;
	Tue, 23 Jun 2026 10:06:54 +0800 (CST)
From: fffsqian@163.com
To: Ryder Lee <ryder.lee@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	kwilczynski@kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Qingshuang Fu <fuqingshuang@kylinos.cn>
Subject: [PATCH 1/1] PCI: mediatek-gen3: fix unreachable error message in probe
Date: Tue, 23 Jun 2026 10:06:48 +0800
Message-Id: <20260623020648.112623-1-fffsqian@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAnM8c+6jlqfZp1FQ--.32290S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw47GrWUZw13uF1UtryxZrb_yoW8Jw4fpF
	ZrWasayFZ5JFn8Zr47A3Wfu3WF9wn3CrW8Jws7Ww1xZFn3CFyDt343K34rt3y7KFs7Xw13
	X3Wqqa48GasrGF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jna93UUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: 5iii21xldqqiywtou0bp/xtbCwh+yfWo56j8H7AAA3-
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_190733_280255_22F7541A 
X-CRM114-Status: GOOD (  12.11  )
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

From: Qingshuang Fu <fuqingshuang@kylinos.cn>

In mtk_pcie_probe(), the error handling for pci_pwrctrl_create_devices()
has the goto statement before the dev_err_probe() call, making the error
message completely unreachable. When this function fails, no diagnostic
message is ever printed.

Reorder so that dev_err_probe() is called before jumping to the cleanup
label, restoring the intended error reporting.

Fixes: 1a152e21940a ("PCI: mediatek-gen3: Integrate new pwrctrl API")
Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index b0accd828589..5d7cfed44637 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -1222,8 +1222,8 @@ static int mtk_pcie_probe(struct platform_device *pdev)
 
 	err = pci_pwrctrl_create_devices(pcie->dev);
 	if (err) {
-		goto err_tear_down_irq;
 		dev_err_probe(dev, err, "failed to create pwrctrl devices\n");
+		goto err_tear_down_irq;
 	}
 
 	err = mtk_pcie_setup(pcie);

base-commit: 4708cac0e22cfd217f48f7cec3c35e5922efcccd
-- 
2.25.1


