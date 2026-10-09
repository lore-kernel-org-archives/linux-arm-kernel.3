Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C73CA9EC0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 17:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vqP7yOjt/h73cYqrSH+BvswKcxakjUUiEEXb4Y5z0Fo=; b=PfkcTUJrK9wfa2V1eEC1SYZ4q6
	YnEuIKn2EAyjtLdpPusHXdon2VB+Z7QvlZjlGu0wqMe8KbjvtLF/QeVstEN+hJH3PiXtZ9RO7BNK9
	V1bk9dr+fMrVc8qXi/1qiZh5wslC8dbfhNIoyJuwkosUbj2BQCNOQBjoz5HSLiZCtgP34Ofeokk2s
	bLV38gaj4gfs3nGBHkYAygx27vb5ltFmWl3U19vhapEu4+zk0vqu/Bd5qyR5yyBGEEa9AjPdKT0aZ
	QpfPBJW6D1nS8+8LHj4Mkwo6GHlfWkV7oRZ9aKy58poxERzn7ftBgLJaAA0VA03xkxmnZw5EXGR5b
	JUG0kH4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFE0P-00000006khm-1irE;
	Fri, 09 Oct 2026 17:03:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFE0B-00000006kXo-17jz;
	Fri, 09 Oct 2026 17:03:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6301760D86;
	Fri,  9 Oct 2026 17:03:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 089BFC2BCF7;
	Fri,  9 Oct 2026 17:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791565402;
	bh=0BZYLrNFBwg45qvb6sXGySgXpuTKSUmXxmurAKjoavM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TH9a90465SSzTXFqKlzcIB2TOrxYnVXPSspMST479H1/bcN/bcgtTgFzPkguN/m+C
	 LiQJ683jSqAjaGvsTawyXsQjRw6rNhE/PJynd6U8pPyTJBkNW4H45T0Xav0gLaVb96
	 NqwDRc9g8O05ed1VeE6OKQ7JBeXLmVj+RdXBjmcX3X+rU9wmT0le/JbXrcHoMkLUc6
	 Bh7sGrb+t34p7vIh5CC4Ynep2AQWnk3XTmyrb4j7ptN5sRUz5oDlUDGUt83xG6pu1k
	 xXqsGwTGrLSkvsrUwydXmwT1QZDzWkJZ9oHAUOSKojJCxKrYgNoONRHPqKMsAGr16J
	 dZEKPddTZMikQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB890CA601E;
	Fri,  9 Oct 2026 17:03:21 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Fri, 09 Oct 2026 17:02:57 +0000
Subject: [PATCH v3 1/4] mmc: meson-gx: name the limit of the CMD_CFG
 timeout field
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-meson-gx-busy-timeout-v3-1-67d0db3a8328@iav.lv>
References: <20261009-meson-gx-busy-timeout-v3-0-67d0db3a8328@iav.lv>
In-Reply-To: <20261009-meson-gx-busy-timeout-v3-0-67d0db3a8328@iav.lv>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-mmc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1222; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=8VC1yXn3jZKERenMCKphBxv2rNREe/7oQ7Z39r7TC8Y=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFkn5cIE+th8OC4vD0jr2XH3csP+2S+e8f/YqXWho4xjs
 +HBSk/PjlIWBjEuBlkxRZYJhzRuZSy5+tffw/wBzBxWJpAhDFycAjCRKzKMDJcWHfBJNFlknH/q
 XWbdjXdr2O84NmdaX+Upz/S8em9zXxDDXznhmeI7k580L9P/sVD8o9G3eXunzJUUeTOp7v/ZKRd
 vHOcHAA==
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
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
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Igor Velkov <iav@iav.lv>

The data timeout is capped at a literal 32768 ms with a comment next to
it. Give the limit a name beside the other timeout constants.

Assisted-by: LLM
Signed-off-by: Igor Velkov <iav@iav.lv>
---
 drivers/mmc/host/meson-gx-mmc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 7ef16d7c03cb..06479ba38525 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -125,6 +125,7 @@
 #define SD_EMMC_CFG_RESP_TIMEOUT 256 /* in clock cycles */
 #define SD_EMMC_CMD_TIMEOUT 1024 /* in ms */
 #define SD_EMMC_CMD_TIMEOUT_DATA 4096 /* in ms */
+#define SD_EMMC_CMD_TIMEOUT_MAX 32768 /* in ms, 2^15: limit of CMD_CFG_TIMEOUT_MASK */
 #define SD_EMMC_CFG_CMD_GAP 16 /* in clock cycles */
 #define SD_EMMC_DESC_BUF_LEN PAGE_SIZE
 
@@ -212,7 +213,7 @@ static unsigned int meson_mmc_get_timeout_msecs(struct mmc_data *data)
 
 	timeout = roundup_pow_of_two(timeout);
 
-	return min(timeout, 32768U); /* max. 2^15 ms */
+	return min_t(unsigned int, timeout, SD_EMMC_CMD_TIMEOUT_MAX);
 }
 
 static struct mmc_command *meson_mmc_get_next_command(struct mmc_command *cmd)

-- 
2.43.0



