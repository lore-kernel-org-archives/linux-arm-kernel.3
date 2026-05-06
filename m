Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A7FCD3445
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 15:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uEEJQ9fXszYfwRyDtR6o0/pUHqmq54B1aA4O008XVv8=; b=t3srsMz+SERFMobCwnXwDBnwc9
	Hfhof0Ga8UxLPZzyOK36IU0PpyJxjMjuv2bo5K0mvq8o9SyzM4odkq4Yg08f5wfTCBq5UkvH7qcmn
	SnSkV0zJ8jww6e2dPvibUsmprhs9X9oIXjgzMZ3/suOMLiSaCsTTc1ZaOPPXeMLEpklMBfQgjLJh4
	+2cJY72WE3yP9XDiIE/yImIrx8kH9FRP1IKgcEOz4dSp9kfCbOPgZ8CCC89TDxbQhwi2HKd9U/h0O
	HNlqcZiQKJMX1y74ZTt9D6hAzMIX3MA7n2tJSO4IoOWLpyaSdztsi5u9U0GTdhhMC7pLuaj7bE+MC
	9Q6+nKVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKe7K-00000001Iz2-1InC;
	Wed, 06 May 2026 15:24:54 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKe7G-00000001IuY-3f7q;
	Wed, 06 May 2026 15:24:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=uE
	EJQ9fXszYfwRyDtR6o0/pUHqmq54B1aA4O008XVv8=; b=mMb9kc89cru2itfUkh
	Eh2md/CTuLPUpRJN1UCaVC+R7gJg/05zaFVf6MN375fUdxTcEbLRvm5HGyFiq31g
	C8tU96NjI4ZuPrcQSVMbckGSM6JiREeQqRoa5JbpvmbpVJG2G04HE0b46cM2H5az
	7D+Snzwl538eCInoaS0sk74dM=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wCHAqsXXftpv5CgDg--.43926S6;
	Wed, 06 May 2026 23:24:13 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	vigneshr@ti.com,
	jingoohan1@gmail.com,
	thomas.petazzoni@bootlin.com,
	pali@kernel.org,
	ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com,
	claudiu.beznea.uj@bp.renesas.com,
	mpillai@cadence.com
Cc: robh@kernel.org,
	s-vadapalli@ti.com,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v2 4/8] PCI: j721e: Set max_link_speed to enable 100 ms delay after link up
Date: Wed,  6 May 2026 23:23:42 +0800
Message-Id: <20260506152346.166056-5-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260506152346.166056-1-18255117159@163.com>
References: <20260506152346.166056-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCHAqsXXftpv5CgDg--.43926S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF17Jr4UXrWkZF1xZFy5urg_yoW8Gr1xpa
	y7GFWxG3WIqFW5uanrZ3W5XFyaqFn8J3y7GrZag3WxZFnxCr93JFyIqFyfJ3yfKF4kAF17
	A3Zrt342qr43tF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zEt8ncUUUUU=
X-Originating-IP: [240e:b8f:927e:5900:dbee:26f0:1b68:48a4]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxB63W2n7XR45DgAA3Q
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_082451_318576_B6F8148F 
X-CRM114-Status: UNSURE (   8.94  )
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

Set cdns_pcie.max_link_speed to the maximum supported link speed
(obtained from the device tree property "max-link-speed") in
j721e_pcie_set_link_speed(). This activates the post-link delay logic
added in cdns_pcie_host_start_link() when the controller supports
speeds greater than 5 GT/s.

As required by PCIe r6.0 sec 6.6.1, and following the same approach as
commit 80dc18a0cba8d ("PCI: dwc: Ensure that dw_pcie_wait_for_link()
waits 100 ms after link up"), this ensures a 100 ms delay after link
training completes before any Configuration Request is sent.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/cadence/pci-j721e.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
index bfdfe98d5aba..ee85b8e04f5b 100644
--- a/drivers/pci/controller/cadence/pci-j721e.c
+++ b/drivers/pci/controller/cadence/pci-j721e.c
@@ -206,6 +206,7 @@ static int j721e_pcie_set_link_speed(struct j721e_pcie *pcie,
 	    (pcie_get_link_speed(link_speed) == PCI_SPEED_UNKNOWN))
 		link_speed = 2;
 
+	pcie->cdns_pcie.max_link_speed = link_speed;
 	val = link_speed - 1;
 	ret = regmap_update_bits(syscon, offset, GENERATION_SEL_MASK, val);
 	if (ret)
-- 
2.34.1


