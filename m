Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6182AC982D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 13:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EoeEi1s8bllXTPXUm9XUubTHe5pCZBSIM0ndA2wqJEw=; b=4cJSfOwTXU6cKVEi+fsM+211Uw
	JvdWCE4P1YjjJQQ2QEFS3PdACtwZ3EkLl9uQ7sKxIRv/lprn/Tg90jRVFENUPeANXRb+Lz6l4m3GW
	E64nZsLmxr9tbManO783keMZRGKhxtGcoH0gObm0PKPkyDIwmjZHCKY5+NHiNrTFM6lNn2B9CXWEQ
	99hYSo+3LSkgxwUoiqsFMkRYYLVjr71ud2yYhUpqNS9bkc9BV9Nrf0Fg2odYGcSyjZWi3yWQscfPw
	fybYTrhIhulst4UjYTe46J01za+TqYkQMAMl/ByuDb2f47BsXqjI2zKyiO7A86f623kAY2S/nN+Qh
	Hlm87uaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7C4b-0000000BOLs-187h;
	Thu, 17 Sep 2026 13:22:45 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7C4Y-0000000BOKE-1DjC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 13:22:44 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAC3Hzqb6atq9l6BCA--.3721S2;
	Thu, 17 Sep 2026 21:22:35 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Liviu.Dudau@arm.com
Cc: bhelgaas@google.com,
	kwilczynski@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	lpieralisi@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	tinamdar@apm.com,
	toan@os.amperecomputing.com,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] PCI: xgene: Fix device node reference leak in xgene_pcie_probe()
Date: Thu, 17 Sep 2026 13:22:35 +0000
Message-Id: <20260917132235.2153154-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAC3Hzqb6atq9l6BCA--.3721S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tr1DCFyrXF47uFWkCrW5trb_yoW8XrykpF
	WDWryF9r18tr4rWF4Iy3W5Z3Z0kFZay3yUGwsrC3WxZrnxGw1UXry2vFyqqF13KrW8Xry7
	JF4DtF1xAF45J37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPSb7Iv0xC_KF4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxV
	W0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Cr1j6rxdMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VAI37AI020EjII2zVCS5cI20VAGYxC7M4II
	rI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMx
	AIw28IcVCjz48v1sIEY20_Gr43Wr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
	x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r
	43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
	W8Jr0_Cr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_GcCE3sUvcSsGvfC2KfnxnUUI43ZEXa7I
	U1zVbDUUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAQNA2qrrJq8KQAAsk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_062242_706618_B5591A34 
X-CRM114-Status: GOOD (  10.18  )
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

xgene_pcie_probe() takes a reference to the port's device node with
of_node_get(), but returns directly from the error paths of
xgene_pcie_map_reg(), xgene_pcie_init_port(), xgene_pcie_setup() and
pci_host_probe(), leaking that reference on each of them.

Add an err_put_node label that drops the reference before returning.

Fixes: 5f6b6ccdbe1c ("PCI: xgene: Add APM X-Gene PCIe driver")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/pci/controller/pci-xgene.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/pci-xgene.c b/drivers/pci/controller/pci-xgene.c
index b95afa35201d..6b00ec60ede6 100644
--- a/drivers/pci/controller/pci-xgene.c
+++ b/drivers/pci/controller/pci-xgene.c
@@ -633,20 +633,28 @@ static int xgene_pcie_probe(struct platform_device *pdev)
 
 	ret = xgene_pcie_map_reg(port, pdev);
 	if (ret)
-		return ret;
+		goto err_put_node;
 
 	ret = xgene_pcie_init_port(port);
 	if (ret)
-		return ret;
+		goto err_put_node;
 
 	ret = xgene_pcie_setup(port);
 	if (ret)
-		return ret;
+		goto err_put_node;
 
 	bridge->sysdata = port;
 	bridge->ops = &xgene_pcie_ops;
 
-	return pci_host_probe(bridge);
+	ret = pci_host_probe(bridge);
+	if (ret)
+		goto err_put_node;
+
+	return 0;
+
+err_put_node:
+	of_node_put(port->node);
+	return ret;
 }
 
 static const struct of_device_id xgene_pcie_match_table[] = {
-- 
2.34.1


