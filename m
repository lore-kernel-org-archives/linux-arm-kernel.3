Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CB4CD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 04:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+4kKS6YbqvXGesLSVmWh/l08m/IHxwWlJ+sqDAtc6CE=; b=sNqjgTF0di3o/lle538u27lztf
	dENuZYXE6L570ss0YjE1Tmy9aGCdiI+r62jEpk6NGJbirRvOW4u0SN3RRRgF8hletYnAP6G4ZmSzn
	CLsuCCGdSCNLxK21HTxw5IcrNkdRiPlwajeyKu8grgmdyY0qGkoJC/Po5bwo2Jm8RPgt+NORAZSnG
	Xa719ZlKBNiFON/39Xo+e9qmDuUDUTMvVwL+7M5AYzJ/RPIUcelqDiHkpnV24wo7ZS3kpQzGBSz2O
	to3gzg60Pcqzbmz1YpN2omlx7r5U+nCDNpR0DUl0mz848fs57coDETklEz/K7RAeOreD9KUw0UMIy
	c2AMTkKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbWJP-00000004PDC-0w5L;
	Mon, 22 Jun 2026 04:31:07 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbWJM-00000004PBz-1zA1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 04:31:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=+4
	kKS6YbqvXGesLSVmWh/l08m/IHxwWlJ+sqDAtc6CE=; b=f1nHMOCiBxzxEfyJJi
	aOrE4z/kR0g3YkYGMFiwNmVCd0u6s4O1fK/wXhYGDjjwnZxQz/ZSYudNq03JQ6tv
	CpjqkrDKI1SZKxJvt4naOFBDi5/0Vgx0uuzAAcV0eTKb64FPnsfD+5/RRjzmLyPD
	mAo9iOM4Sams5mP8Y8YfFNCTY=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDHz8xYujhq80jwEw--.53742S2;
	Mon, 22 Jun 2026 12:30:18 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: linusw@kernel.org,
	kaloz@openwrt.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	huangguangbin2@huawei.com,
	lipeng321@huawei.com
Cc: linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>,
	stable@vger.kernel.org
Subject: [PATCH] net: ixp4xx_hss: fix duplicate HDLC netdev allocation
Date: Mon, 22 Jun 2026 12:30:15 +0800
Message-Id: <20260622043015.643637-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDHz8xYujhq80jwEw--.53742S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr4rWF4ktFWDCF1rJw43Wrg_yoW8ArW8pa
	n8Ka4fKF95W3W3JwnrWF48uFy5Gw48JryUC34jq3sY9345JF1Fk3s5WFy2vFyUCrZxXF4a
	vr43AFZ2vayfZ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRlPfPUUUUU=
X-Originating-IP: [240e:604:311:e68d:9586:9dd0:bd4b:6902]
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbCxhpt22o4ulrK-AAA3u
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_213104_977393_67759880 
X-CRM114-Status: GOOD (  15.84  )
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

ixp4xx_hss_probe() allocates two HDLC netdevs. The first one is stored
in ndev, initialized, and registered with register_hdlc_device(). The
second one is stored in port->netdev and later used by the remove path
for unregister_hdlc_device() and free_netdev().

This means that the registered netdev is not the same object that is
unregistered and freed on remove. It also leaks the first allocation if
the second alloc_hdlcdev() call fails, and the first allocation is not
checked before ndev is used.

Older code allocated the HDLC netdev only once and stored the same object
in both the local variable and port->netdev. The buggy conversion split
this into two alloc_hdlcdev() calls. A later rename changed the local
variable name to ndev, but the underlying mismatch remained.

Fix this by allocating the HDLC netdev only once and assigning the same
object to port->netdev.

Fixes: 99ebe65eb9c0 ("net: ixp4xx_hss: move out assignment in if condition")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/net/wan/ixp4xx_hss.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wan/ixp4xx_hss.c b/drivers/net/wan/ixp4xx_hss.c
index 720c5dc889ea..7f4645ff90aa 100644
--- a/drivers/net/wan/ixp4xx_hss.c
+++ b/drivers/net/wan/ixp4xx_hss.c
@@ -1487,11 +1487,11 @@ static int ixp4xx_hss_probe(struct platform_device *pdev)
 				     "unable to get CLK internal GPIO\n");
 
 	ndev = alloc_hdlcdev(port);
-	port->netdev = alloc_hdlcdev(port);
-	if (!port->netdev) {
+	if (!ndev) {
 		err = -ENOMEM;
 		goto err_plat;
 	}
+	port->netdev = ndev;
 
 	SET_NETDEV_DEV(ndev, &pdev->dev);
 	hdlc = dev_to_hdlc(ndev);
-- 
2.25.1


