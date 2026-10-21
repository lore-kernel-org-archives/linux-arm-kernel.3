Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE546606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 10:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tVRITFU6;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=keeLRbDN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8rjo9E5I5jUw2GRnY9ilROcz1Nwl5H/IPAT/yzyrHdM=; b=tVRITFU6FgblmzZsL4Q8Xd0oaD
	8JR5sKr3kejK163vT/Ip3ye87KSvYFJsutljlS152+pKhbPV+Ohi26CP6/WOH9ry+VYu58YOID1wX
	3zEeMlv+dNCg/K8PmD2a2jQe7IcFKIQFOy28Kn1YhdsbRiV1HS43xTTT8fior5yO0yucS/FkwRXrJ
	S735G1lj7j0TMv8YucMTGmzPkQlw7qbePOSfHgPX7IWdqcoKHN06huQmeWZpqM9vIX23CMLk1z81I
	PGGViW0PI4GaJwVVdnP3Y2BZ7q1mkZx/UXliPjRiKtrMELtKBcAQy0bQOCSA9z1wKeK33zrxSmn5c
	9zuSmmOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJTr8-0000000BdxU-2fqT;
	Wed, 21 Oct 2026 10:47:38 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJTr6-0000000Bdvz-2lTp;
	Wed, 21 Oct 2026 10:47:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=8r
	jo9E5I5jUw2GRnY9ilROcz1Nwl5H/IPAT/yzyrHdM=; b=keeLRbDNGVOdaUCCEY
	UDev274CypOiPvrdx9VKF8HolPrD66p7MmIxZkmjzIdrVM2HQfBpmPBwZeMG6Y3J
	RXsYnPB4ej5Lzo1Utiq6AYaHkJjL51lcsrQzrI1n8VOk6lr/WYJuyUVF6MkRCnkr
	AOECxd/UgaxK79n5yHj3Fc0i0=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDX3xM5mNhq3MNSBw--.27855S6;
	Wed, 21 Oct 2026 18:47:25 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 4/4] usb: mtu3: initialize debugfs command buffer
Date: Wed, 21 Oct 2026 18:47:19 +0800
Message-Id: <20261021104720.4106961-5-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261021104720.4106961-1-yaojiale02@163.com>
References: <20261021104720.4106961-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDX3xM5mNhq3MNSBw--.27855S6
X-Coremail-Antispam: 1Uf129KBjvdXoWrtrWUXw4kXrykKFy5ZrWkWFg_yoWkGFcEqw
	1IkrWxJr1vyayjkr1xCrWqvayfK3W5Xrn5ZFnavasxAanFqrnYvws2grn7Zr4UXFW5Ja4D
	Cr9rXrykWa10gjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0YhF7UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzh0GQGrYmD2HowAA3m
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_034737_053635_DE156395 
X-CRM114-Status: GOOD (  11.11  )
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ssusb_mode_write() copies user input into an uninitialized stack buffer
and compares fixed command lengths. A short write matching a command
prefix can make strncmp() inspect bytes that were not initialized.

Zero-initialize the buffer so the copied input is always terminated.

Fixes: 4aab6ad24a10 ("usb: mtu3: move vbus and mode debugfs interfaces into mtu3_debugfs.c")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/usb/mtu3/mtu3_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_debugfs.c b/drivers/usb/mtu3/mtu3_debugfs.c
index c003049bafbf..8976dbfaa585 100644
--- a/drivers/usb/mtu3/mtu3_debugfs.c
+++ b/drivers/usb/mtu3/mtu3_debugfs.c
@@ -423,7 +423,7 @@ static ssize_t ssusb_mode_write(struct file *file, const char __user *ubuf,
 {
 	struct seq_file *sf = file->private_data;
 	struct ssusb_mtk *ssusb = sf->private;
-	char buf[16];
+	char buf[16] = { };
 
 	if (copy_from_user(&buf, ubuf, min_t(size_t, sizeof(buf) - 1, count)))
 		return -EFAULT;
-- 
2.34.1


