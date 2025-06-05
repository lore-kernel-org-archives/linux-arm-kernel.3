Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8864C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 01:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dwjxSNJoDCBwwDvUBS1EJFhf4wPoHJoTRtnHdKpEfD0=; b=T1RccrN3Cyg2aO8Jt2bhZtM9xY
	lmFdd3LxDzma/LXyJ4GErpNtpal+Ig0SsMmTxeUf82HaDH3v2pVszIdf+22+6eKVI14fVLN0gejy7
	LOODPKIT/tuhspVvEz61LL4mzp/UF8GmgNHjMlxBYNjkt+BTodJ++8OAaYMhaJUvfq9nCh0aFNGXi
	HXdWTlNzDGP6ysD79YugXSVeVMfCzGVm8qgSMRl+qPxcw6s7jmQVp8D1eRfxPkOKL2HWyziM6mHUa
	twg1Q9cxOSWfAw3sefCbU46EahXgt0DAYmLd2ongbt2CDCmWBcOOJqiqQ+qFYVAYjxHFh+gGDEg0d
	XS7HgBfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMz7D-0000000EUFi-0puF;
	Thu, 05 Jun 2025 01:09:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMz56-0000000EU7Q-3KvU;
	Thu, 05 Jun 2025 01:07:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8573060007;
	Thu,  5 Jun 2025 01:07:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9B2CC4CEE4;
	Thu,  5 Jun 2025 01:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749085662;
	bh=+aLpCNC8OzEHRmMRK/QFfVqV5g0o8xykjr6Q8++9rQk=;
	h=From:To:Cc:Subject:Date:From;
	b=t2IidH412MLiXpk9UtsT7bpSel0KM7VtkNCyhlNNKm1mRAFM9RI/5beDesqRExMIP
	 04M/3zlAjX5s9/k6qC9+zC8BUFIaSban2+JV84UyIrg3hw4z695JLAk2hrVvMydt79
	 f3OEx5LZ/pt2kd0IfYtHmA7R3mGG4diwciMqWBm8eMD1gySPvZeOQTdZD25zym8tN9
	 4hOb2Rz4RQqf9U5OiWSNMaryjGqrzkaTx1FL+M+qnhJQR8d5J9Cg5tAEYuHui+lI/i
	 WmmVK/Ef48KwqurGyeuC0QMCR1oFvH2ve/tjdVa3zd6mTusxD+2/oqhLL56aIfVpBD
	 pzid/Xoppprnw==
From: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mhiramat@kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] mtk-sd: Fix a pagefault in dma_unmap_sg() for not prepared data
Date: Thu,  5 Jun 2025 10:07:38 +0900
Message-ID: <174908565814.4056588.769599127120955383.stgit@mhiramat.tok.corp.google.com>
X-Mailer: git-send-email 2.49.0.1266.g31b7d2e469-goog
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

From: Masami Hiramatsu (Google) <mhiramat@kernel.org>

mtk-msdc driver causes a kernel crash after swiotlb buffer is full.

---
mtk-msdc 11240000.mmc: swiotlb buffer is full (sz: 16384 bytes), total 32768 (slots), used 32732 (slots)
mtk-msdc 11240000.mmc: msdc_track_cmd_data: cmd=18 arg=0397A6F8; host->error=0x00000004
Unable to handle kernel paging request at virtual address ffffffffc0001fc0
---

When swiotlb buffer is full, the dma_map_sg() returns 0 to
msdc_prepare_data(), but it does not check it and sets the
MSDC_PREPARE_FLAG.

swiotlb_tbl_map_single() /* prints "swiotlb buffer is full" */
  <-swiotlb_map()
    <-dma_direct_map_page()
      <-dma_direct_map_sg()
        <-__dma_map_sg_attrs()
          <-dma_map_sg_attrs()
            <-dma_map_sg()  /* returns 0 (pages mapped) */
              <-msdc_prepare_data()

Then, the msdc_unprepare_data() checks MSDC_PREPARE_FLAG and calls
dma_unmap_sg() with unmapped pages. It causes a page fault.

To fix this problem, Do not set MSDC_PREPARE_FLAG if dma_map_sg()
fails because this is not prepared.

Fixes: 208489032bdd ("mmc: mediatek: Add Mediatek MMC driver")
Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
 drivers/mmc/host/mtk-sd.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 345ea91629e0..3594010bc229 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -827,9 +827,10 @@ static inline void msdc_dma_setup(struct msdc_host *host, struct msdc_dma *dma,
 static void msdc_prepare_data(struct msdc_host *host, struct mmc_data *data)
 {
 	if (!(data->host_cookie & MSDC_PREPARE_FLAG)) {
-		data->host_cookie |= MSDC_PREPARE_FLAG;
 		data->sg_count = dma_map_sg(host->dev, data->sg, data->sg_len,
 					    mmc_get_dma_dir(data));
+		if (data->sg_count)
+			data->host_cookie |= MSDC_PREPARE_FLAG;
 	}
 }
 


