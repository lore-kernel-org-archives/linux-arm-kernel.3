Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2F36077793
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CVqNClSf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=SH6pWyjcaIWCi7EaeIAaLCITGwbCLBmKt3Bf613xvM8=; b=CVqNClSfNVA9P/gUPfJANlt/Ru
	5iJq5oKcV8ypa4P/VS0sb+/9AWJBsIpbHzDJXHy0lmtViIGZmPmBR8EPSoQBzkAriZ7olUaHy/Uyt
	njQ7dIh9SW1pNThOtsgfVrXSzsaPf/fSe0XOiyNe9sdESm6Va7wafJZtUu8aQH2VvhXcDlg47vHhf
	dFzqmtUL+J5qzeztObUZ04RXHrfATgkmh+IwPfUSZIkTRIjx1M3GG/eUh7BjDbt2s3qsHudYnw6pH
	uNBs1FaSNUOHIXDDjuyqRzxhQ8UssGf/R9FIaR+FcWWQJWUJPVYLLiYPMXIZ/DJuRynTIkWp4bTt4
	fk4ws8SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBl9-00000001zuU-1Cwb;
	Tue, 03 Nov 2026 10:28:55 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBl2-00000001zrS-1gJc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 10:28:49 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowAAHF5hdt+lql6k7AA--.3080S2;
	Tue, 03 Nov 2026 18:28:45 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] net: lan969x: fix page pool leak when RX DMA allocation fails
Date: Tue,  3 Nov 2026 10:28:54 +0000
Message-Id: <20261103102854.1340615-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAAHF5hdt+lql6k7AA--.3080S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJryUArWkuw4rXry8XF15twb_yoW8Xr45pF
	W5K34vk39Fgr43J3WUGrs7A34Uta1FgrWDWF97C3Z5u34rGr45Cr1UAa43Xr1UJrWxGF4S
	yF40ywn5CFnrC37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9I14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26F4UJVW0owAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
	Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
	x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r
	4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87Iv6xkF7I0E14v26F4UJVW0ob
	IYCTnIWIevJa73UjIFyTuYvjfU7nmRUUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAIAA2rpnOFw-QAAs+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_022848_820790_D5A73D19 
X-CRM114-Status: GOOD (  10.95  )
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

lan969x_fdma_rx_alloc() creates the RX page pool and then allocates the
FDMA coherent memory. If fdma_alloc_coherent() fails, the function
returns without destroying the page pool.

The failure propagates out of lan969x_fdma_init(), and
sparx5_frame_io_init() then marks the FDMA IRQ as unavailable, so
lan969x_fdma_deinit() is never called on teardown and the page pool is
never released. Destroy it before returning the error.

Fixes: d84ad2c0d80c ("net: lan969x: add FDMA implementation")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c
index 053d125eda65..bc293ba1707d 100644
--- a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c
+++ b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c
@@ -169,8 +169,10 @@ static int lan969x_fdma_rx_alloc(struct sparx5 *sparx5)
 		return PTR_ERR(rx->page_pool);
 
 	err = fdma_alloc_coherent(sparx5->dev, fdma);
-	if (err)
+	if (err) {
+		page_pool_destroy(rx->page_pool);
 		return err;
+	}
 
 	fdma_dcbs_init(fdma,
 		       FDMA_DCB_INFO_DATAL(fdma->db_size),
-- 
2.34.1


