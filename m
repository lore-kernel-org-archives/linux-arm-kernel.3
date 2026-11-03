Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2033860819C1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FgG/BWmw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=UjnvTBM/YYG24vlGmk6I7vQOjp8mM6En/1DCBRv6q50=; b=FgG/BWmwgu+rbSODXvwF1e4bLT
	I1whulWUfMQPhWO91Jp98GtqrmM47NUOaeK6/XoQMJOnmX97Kq0UywnRdcM4rx6TDaryfj0Bif5CG
	+ppq3eZ3JuXO3eawPNTNeTRWEpEA4Qe3MVTJWVS+OgpmCGoNFxP4N5XEnY3uKYMSFqL4X9s09jUvI
	3DjDhNbstsaj7QHq1gVTrXHjpVzS/geQME9EPkBuDjO6sn0A6isoGf8rce7J5d6KGdOPEPPmG656X
	Ou6RlbCZ6MvgCc9ES06mxOIkuu7ef1DIRqr1DDlhyPSoPgVrAU1jbLUHWfkwkvGh2wM8JiIEzQbKR
	T+LGmoFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCB5-000000026Pn-3EUI;
	Tue, 03 Nov 2026 10:55:43 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCB2-000000026OL-1G6k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 10:55:42 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowACnt5ipvelq2OE7AA--.3022S2;
	Tue, 03 Nov 2026 18:55:37 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-rtc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] rtc: stm32: release the LSCO clock provider on remove
Date: Tue,  3 Nov 2026 10:55:46 +0000
Message-Id: <20261103105546.1394618-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowACnt5ipvelq2OE7AA--.3022S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tFy3Zr13uFy3uw4fZr48Crg_yoW8Jw4Upa
	y8GryYkrWktr4Fg3WkXr1qva4Yy3ZIq3yFkFy7C39a93ZYvFy8Z3yrXFyrXF4kJF4rCwsI
	vw47Kry5uFW8CrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9mb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Cr1j6r
	xdMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VAI37AI020EjII2
	zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026x
	CaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_
	JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r
	4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0
	rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8Jr0_Cr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdYxBIdaVFxhVjvjDU0xZFpf9x07UC38nUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAQAA2rpnOGESwAAs6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_025541_502806_CCD2037A 
X-CRM114-Status: GOOD (  11.48  )
X-Spam-Score: -0.9 (/)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The LSCO pinmux action registers the rtc_lsco clock provider with
of_clk_add_provider(), which takes a reference on the RTC device node.
stm32_rtc_remove() unregisters the gate clock but never calls
of_clk_del_provider(), so the node reference is never dropped and the
provider stays registered with a pointer to a clock that no longer
exists.

Delete the provider before unregistering the gate clock.

Fixes: bb7b0df2be5c ("rtc: stm32: add Low Speed Clock Output (LSCO) support")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/rtc/rtc-stm32.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
index 1c4e4bd7afe4..a77868bd79bd 100644
--- a/drivers/rtc/rtc-stm32.c
+++ b/drivers/rtc/rtc-stm32.c
@@ -1215,8 +1215,10 @@ static void stm32_rtc_remove(struct platform_device *pdev)
 	const struct stm32_rtc_registers *regs = &rtc->data->regs;
 	unsigned int cr;
 
-	if (!IS_ERR_OR_NULL(rtc->clk_lsco))
+	if (!IS_ERR_OR_NULL(rtc->clk_lsco)) {
+		of_clk_del_provider(pdev->dev.of_node);
 		clk_unregister_gate(rtc->clk_lsco);
+	}
 
 	/* Disable interrupts */
 	stm32_rtc_wpr_unlock(rtc);
-- 
2.34.1


