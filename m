Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63D6C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 09:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X4m1yvkaaTqeR66VH+/8tUQpoePgCmmmCTgKWCu5vx8=; b=geILgh8Zb8bxP9pMBnKO1x8NHj
	OWCBiC9jhHkjXXn9UzbRW1hdXSxX8hSnB2ZUJCEDUvC0moxq0hMJhfIWz0JoxOx7h/Q/xsEOd5VJ4
	ltlhTwS5/J1WE6u3j32aZ98Sqtfsi4k1FManXu/5ggYG5CWoLoGtiCeyV3Hjzy8ItNXqKafRv+AlB
	gIDVnG3ViSyaoV8LekmokTeL+U7+KUAbp9Msxt6SHpFgig1ow2gagXtE0dWG/8HyvZ+R2mtiuNcHH
	7CDZtKHZDBHdOKm5Iv88SJRn774jmP+1l82gu5dBoiQFjxdbYrOWzZem+QB03cULZaLkF6Lefa5m8
	46E6M41A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x78Z1-0000000B1Lb-0IT8;
	Thu, 17 Sep 2026 09:37:55 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x78Yx-0000000B1Ks-1gsW;
	Thu, 17 Sep 2026 09:37:53 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowACnFD_ptKtqV8t9CA--.40357S2;
	Thu, 17 Sep 2026 17:37:46 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: angelogioacchino.delregno@collabora.com
Cc: jason-jh.lin@mediatek.com,
	jassisinghbrar@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] mailbox: mtk-cmdq: Fix GCE clock reference leak in cmdq_get_clocks()
Date: Thu, 17 Sep 2026 09:37:45 +0000
Message-Id: <20260917093745.2144930-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACnFD_ptKtqV8t9CA--.40357S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KF4kKF45GFWDAF45CrWDtwb_yoW8uw4fpF
	4qyFy5ArWUJFn7WrsIvr1kAF9Y93WSqFWSkwna9ayvvrs8Ary5XFyUJFy8XF98AFyfAanr
	X3Z5tr1UCr4DAFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvm1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
	w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
	IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E
	87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
	8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_
	JF1lYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY
	0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r48ZrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_GcCE3sUvcSsGvfC2KfnxnU
	UI43ZEXa7VU1eWlPUUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRMNA2qrq00rowAAs7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_023751_811147_E983A45B 
X-CRM114-Status: GOOD (  13.09  )
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

of_clk_get() returns the clock with an elevated reference count, but
the references taken for the other GCE clocks are never dropped: those
clocks outlive probe and the driver calls neither clk_put() nor
clk_bulk_put(), so probing a GCE with multiple instances leaks one
reference per other GCE clock.

Let devres drop the references when the device goes away, which also
covers the probe failure paths after cmdq_get_clocks() has returned.

Fixes: 85dfdbfc13ea ("mailbox: cmdq: add multi-gce clocks support for mt8195")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index e523c84b4808..eadd340f8fee 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -633,11 +633,22 @@ static struct mbox_chan *cmdq_xlate(struct mbox_controller *mbox,
 	return &mbox->chans[ind];
 }
 
+static void cmdq_put_clocks(void *data)
+{
+	struct cmdq *cmdq = data;
+	u32 i;
+
+	for (i = 0; i < cmdq->pdata->gce_num; i++)
+		if (!IS_ERR_OR_NULL(cmdq->clocks[i].clk))
+			clk_put(cmdq->clocks[i].clk);
+}
+
 static int cmdq_get_clocks(struct device *dev, struct cmdq *cmdq)
 {
 	static const char * const gce_name = "gce";
 	struct device_node *parent = dev->of_node->parent;
 	struct clk_bulk_data *clks;
+	int ret;
 
 	cmdq->clocks = devm_kcalloc(dev, cmdq->pdata->gce_num,
 				    sizeof(*cmdq->clocks), GFP_KERNEL);
@@ -660,7 +671,14 @@ static int cmdq_get_clocks(struct device *dev, struct cmdq *cmdq)
 	 * If there is more than one GCE, get the clocks for the others too,
 	 * as the clock of the main GCE must be enabled for additional IPs
 	 * to be reachable.
+	 *
+	 * Those clocks are not devm-managed, so keep track of their
+	 * references and drop them when this device goes away.
 	 */
+	ret = devm_add_action_or_reset(dev, cmdq_put_clocks, cmdq);
+	if (ret)
+		return ret;
+
 	for_each_child_of_node_scoped(parent, node) {
 		int alias_id = of_alias_get_id(node, gce_name);
 
-- 
2.34.1


