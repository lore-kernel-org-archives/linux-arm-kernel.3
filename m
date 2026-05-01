Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E48CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 15:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rNqbrJ0nYBLUq7KvlneyDzlxeJd5FU1yTTH99vsr+/Q=; b=tG69sIHZ9Uz1F+wU+iAEcjgnek
	kw1dlLDwP9M0javKSh++AK4BwrJ/j9jT28fuMdcqtIGNIPL5RYnnt1AP9lje4cUeHBX6xA+dx9tCK
	FzF4AGVjahHWNQNW3X4DJOHGrHIOtr9teefZvFqGqeRf+lM7rXNg9UVMMFzgIzN9x6yXXuwZpPs31
	WfJqjFyQ34HR/QiJijszQhe3JDtib706s2K0Uqh08jbvoUOuPDs+zXFJuJL3f64rgiwFVPbAMvU/Z
	1NpYf3M2hk2+LsCjAhEzL0q5bv9sRERV38UeSa/ro62Lv4Gsfq8bkO0a/zag9G2Ao9qskK3FVx1PS
	cnircuWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIpuv-00000007M9n-0VhJ;
	Fri, 01 May 2026 15:36:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIpuu-00000007M9U-0zZN
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 01 May 2026 15:36:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rNqbrJ0nYBLUq7KvlneyDzlxeJd5FU1yTTH99vsr+/Q=; b=B7o/TkfYtKvBRrUCIThMmjygTv
	eQri7cmtlOj5/rPH+SrEia+tUanNFty+NwXdmyiTBHZouCzS5DUFDexnSGGtxXpPacAJxwD720Va1
	4mVwYFcEeaOyZeaTyH3lkBdGD40MV60LeBhli2T0qVFktXPD/EVj6cYhlPwjdEio1YUsXdQJZMsEp
	9Mbs4rQ4HlRaqDbnE8BARMGcxEAZSBm6WJSOT6H3wckp2gZDQWVOK3iXUUzO2NJpDYSxOC0HMaupj
	zUxch6N8Y2dou6nXW/OBtve+sFK/jUBYH9oi6Sy0XAgE51VSmfGs8KrI1cOOaPlOzwwqM9jGwh30l
	YCUjF27A==;
Received: from m16.mail.163.com ([117.135.210.3])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIpuq-0000000969D-3K7u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 15:36:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=rN
	qbrJ0nYBLUq7KvlneyDzlxeJd5FU1yTTH99vsr+/Q=; b=jhTaH9fJuQMA7ClBan
	6isFXXHBF+KQZ3ULwH/LZTlMhxuWnY7b69VbtYXw1ms6DwCLoOXM16vjgN83RsO6
	dfEqkMGjG/a8WtVugORKCiqmWRlAo60YBNu7mEqBlJ14RzamERpp5YeywwR7g2uv
	sKpPj6f3psu/bmGLG7w8t0SIc=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wCH4HBbyPRpuOd_Cw--.58479S4;
	Fri, 01 May 2026 23:35:57 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	vigneshr@ti.com
Cc: robh@kernel.org,
	s-vadapalli@ti.com,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH 2/2] PCI: j721e: Set max_link_speed to enable 100 ms delay after link up
Date: Fri,  1 May 2026 23:35:53 +0800
Message-Id: <20260501153553.66382-3-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260501153553.66382-1-18255117159@163.com>
References: <20260501153553.66382-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCH4HBbyPRpuOd_Cw--.58479S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF1xXry8try3ZF17tFy8AFb_yoW8Gr1Dpa
	y7GFWxG3WIqrW5uanrZ3W5XFyaqFn8J3y7GrZag3WxZFnxCr93JFyIqFyfJ3ySkF4kAF13
	A3Zrt342qr43tF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zZg4U5UUUUU=
X-Originating-IP: [240e:b8f:927e:5900:a6da:de99:5aab:66f2]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6x3ghGn0yF2uugAA3O
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_163633_424440_95A23801 
X-CRM114-Status: UNSURE (   8.87  )
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
added in cdns_pcie_host_wait_for_link() when the controller supports
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


