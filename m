Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3415ECCD185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 08:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sdNXNRoS+5obGezYMX6in2BIt6z98naqeGeF7fAvmjM=; b=hezB87shgpRetKZVzZhGttd38o
	E1JIkPrgThVCWQXYkGisyrAXPBqEvBZj8b0Pbn/tSAghOqYDhfeY8Nt+0t0DYac+50pKPFB4Ke2+9
	T7ykOuOZh/QFnmgZWQxtZa0c+7hSm0ahj4Btlv8aPgy9THWtSyV+CxXbpEh66aYU42Cqe+yG9e95H
	CHXcOJ9b9/Q+DnGun74SHe76ajOEKANxYgA5M9AVJcd984gRtMd9ef0xF+kC9jGkI5z6lff5kBq8h
	MQ89jz7tHkWJksC48LlubarxgAyf/zkWqxdI8tcaSuunr1gCyPcqZMrdAAdOQCeIbjAZe6nu61lOR
	cu4Vk3Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8DcN-0000000CYsa-3Aq9;
	Mon, 13 Oct 2025 08:09:19 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8DcL-0000000CYru-0Zbb;
	Mon, 13 Oct 2025 08:09:18 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1760342947; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XtYIluVBt05d6VWLeeqyGlauf7EmfDvfIA1NMnXYEac85XGv6jy0zKx0CNxwMzkwMFC9JQnGUgArf/afT7x/NY3SdyD23gbpDIQMK9OTl10FEZ+62jW3w+fJhanyHAXJFR3gDRQttkm0E9eSY7JJCMDeIqO4yx0aoDGtqllkWeE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1760342947; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=sdNXNRoS+5obGezYMX6in2BIt6z98naqeGeF7fAvmjM=; 
	b=HcVoYQ62292xKzqdt6s3a2slw7CXdQofAhBNEE2TRu+V3+g8sOgJPuKy00Dh5F73zgevbztoaTpmVdPAfJsQurTkNSniNOwV20nsTwwTCwl13/xnk+RYyyUNS99DgBZocie+Lheug2kpAGEmMxTWQVEm4QsA0lUldYl12PsrP/U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760342947;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=sdNXNRoS+5obGezYMX6in2BIt6z98naqeGeF7fAvmjM=;
	b=SXHEWoqUhpZhNrwLO0cW3JneA34qnVFjJhJQzqzaghhS6TDYo5P24LLstuHHngjy
	f/+R42qu1eY3Cd/HgJ4L9wpYF64GPS2LyU4xs/319HqCfJt2qPqsGnArksKxtV85Lzy
	8S9QVOYf5mptfy69uLm5S2NED0pNYzbQXv3ay92M=
Received: by mx.zohomail.com with SMTPS id 1760342945538119.53598149326228;
	Mon, 13 Oct 2025 01:09:05 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 13 Oct 2025 10:09:01 +0200
Subject: [PATCH] mailbox: mtk-gpueb: Add missing 'static' to mailbox ops
 struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-mt8196-gpueb-mbox-fix-v1-1-d7de0cb20c36@collabora.com>
X-B4-Tracking: v=1; b=H4sIAJyz7GgC/yWMQQ6DIBBFr0Jm3WlAKhGv0rgQOloWiAU0TYx37
 6Qu/uK95L8DCuVABXpxQKY9lJAWBnUT4N/jMhOGFzM0smmVVBpj7ZQ1OK8bOYwufXEKPDJey1Z
 b+5iAv2sm1v/uc7g402fjfL0kuLEQ+hRjqL3YzV11mL2C4Tx/WUB7m5QAAAA=
X-Change-ID: 20251013-mt8196-gpueb-mbox-fix-fe6c3053994f
To: Jassi Brar <jassisinghbrar@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chia-I Wu <olvaffe@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, kernel@collabora.com, 
 kernel test robot <lkp@intel.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_010917_236869_DB9662C8 
X-CRM114-Status: GOOD (  10.80  )
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

mtk_gpueb_mbox_ops should be declared static. However, due to its const
nature, this specifier was missed, as it compiled fine without it and
with no warning by the compiler.

arc-linux-gcc (GCC) 12.5.0 doesn't seem to like it however, so add the
static to fix that.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202510100629.3nGvrhEU-lkp@intel.com/
Fixes: dbca0eabb821 ("mailbox: add MediaTek GPUEB IPI mailbox")
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/mailbox/mtk-gpueb-mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/mtk-gpueb-mailbox.c b/drivers/mailbox/mtk-gpueb-mailbox.c
index 925bcf21f650..f6d2beccd91b 100644
--- a/drivers/mailbox/mtk-gpueb-mailbox.c
+++ b/drivers/mailbox/mtk-gpueb-mailbox.c
@@ -200,7 +200,7 @@ static bool mtk_gpueb_mbox_last_tx_done(struct mbox_chan *chan)
 	return !(readl(ch->ebm->mbox_ctl + GPUEB_MBOX_CTL_TX_STS) & BIT(ch->num));
 }
 
-const struct mbox_chan_ops mtk_gpueb_mbox_ops = {
+static const struct mbox_chan_ops mtk_gpueb_mbox_ops = {
 	.send_data = mtk_gpueb_mbox_send_data,
 	.startup = mtk_gpueb_mbox_startup,
 	.shutdown = mtk_gpueb_mbox_shutdown,

---
base-commit: cb6649f6217c0331b885cf787f1d175963e2a1d2
change-id: 20251013-mt8196-gpueb-mbox-fix-fe6c3053994f

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>


