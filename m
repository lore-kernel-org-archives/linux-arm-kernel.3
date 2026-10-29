Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C44606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 05:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qZzsV/O7;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Y3vU77yn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=2WMOO2p95M9ThYIGbReouUB1EEEiCid5uIcZXbX1JvU=; b=qZzsV/O7x9o428Svt1ZovWf5Cs
	odwl13ct8clbZUpZ8iU+HKRnZWIDHoYW7jN5Ukl1+IhTHDkzYq+Km/vtwuROfNiYwrjULkbvHSGq5
	U1sJ3kU0wKc/2ubmlH0GBn/hblkYvfGBLXKMIv4sO1fXJn0fJxlJZozDbwzk+zgiEzpcBXtq3S+SI
	yRm9U/V+PbcBNmRdqJy/TGZyS/nqyz6wtaZdhbur1D4SMQ1G8ewXmf0ubepJ9DTGwcW8bPI/bIjbI
	oIpAHMxcfoo9gu48TwF4YGsaQrb0gZY/Dei+GzeMR5SWNubM4BUGGLI24tB7R+qXB6CuuRS+AMqV3
	tFPRZ7Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMIiv-00000008Oob-0RXx;
	Thu, 29 Oct 2026 05:30:49 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMIis-00000008OlF-1h1c;
	Thu, 29 Oct 2026 05:30:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=2W
	MOO2p95M9ThYIGbReouUB1EEEiCid5uIcZXbX1JvU=; b=Y3vU77ynFsjqZ9ZqEY
	5/ycXmO/8NQqHDoOXjWKuVGuVo3kTQkXpy7hiDfNUd3a+BDGOGKv3UD20YEcZFnW
	2tcmJ2fboq/TJ0GtMbCwQnMET2w/Vo0P82InuILekOACobvnJbglKE2qJ/SAYweF
	x5ZY1ti4sqMQ0dXBqcnZIGrWY=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3X7zw2eJqnygTDQ--.62701S2;
	Thu, 29 Oct 2026 13:30:25 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH] media: mediatek: vcodec: NUL-terminate debugfs input
Date: Thu, 29 Oct 2026 13:30:23 +0800
Message-Id: <20261029053024.2526059-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3X7zw2eJqnygTDQ--.62701S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFyfWFWUCw15XF1fuF47XFb_yoW8WryfpF
	Z8Kw17Ar1kJr9Fvr18Cw47ua45C393XFW8CrW3Ww13Zwn0qFW2g340yay3JFZ2yr9FkFnr
	Jrs8uryxWw4jyF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07USkskUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzREGQGri2fHwZQAA3v
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_223046_897969_35F444D3 
X-CRM114-Status: GOOD (  11.49  )
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

mtk_vdec_dbgfs_write() allows userspace to overwrite every byte in the
persistent debugfs buffer. The read handler later searches that buffer with
strstr(), which can read past its end when no NUL remains.

Reserve one byte and terminate the copied input at the updated file
position before releasing the debugfs lock.

Fixes: 5e488a4fd859 ("media: mediatek: vcodec: Add a debugfs file to get different useful information")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 .../media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
index 2da11521fc7b..8528534e41ef 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
@@ -77,8 +77,11 @@ static ssize_t mtk_vdec_dbgfs_write(struct file *filp, const char __user *ubuf,
 	struct mtk_vcodec_dbgfs *dbgfs = &vcodec_dev->dbgfs;
 
 	mutex_lock(&dbgfs->dbgfs_lock);
-	dbgfs->buf_size = simple_write_to_buffer(dbgfs->dbgfs_buf, sizeof(dbgfs->dbgfs_buf),
+	dbgfs->buf_size = simple_write_to_buffer(dbgfs->dbgfs_buf,
+						 sizeof(dbgfs->dbgfs_buf) - 1,
 						 ppos, ubuf, count);
+	if (dbgfs->buf_size > 0)
+		dbgfs->dbgfs_buf[*ppos] = '\0';
 	mutex_unlock(&dbgfs->dbgfs_lock);
 	if (dbgfs->buf_size > 0)
 		return count;
-- 
2.34.1


