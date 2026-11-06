Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF23606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 07:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ku9SAXNL;
	dkim=pass (1024-bit key, unprotected) header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=EdBOOO5d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=X3nxSXG+H2J8k8t3k6poogjxQFJaTHXAguqehE2TWiY=; b=ku9SAXNLJeTJzn9btk8fTP7hOs
	4oVb91h/Br8PGHshgftRV3g8a5NWagWPpqDRI9e4w3JP7ATHdkyt3EnR6IXVCF8BdTs8OAxrkVbd1
	fHr0v4wG2jGseyrRuXpboy/o3j4wnBhXMXbZ/ZfY3vfHQA2xyoqd1u0s/sxmul4/ePAZluOib76bJ
	sJOA8jf/5qmVbdFL+5AvBwC/yBxXgHK0+4prrpbNSyNxDsy+0qj0RaoJKCWGaKo+qgcWxEGpoiGtF
	VwvO3MWhlv5OSXeN4aaMRWYe/BjZgW9+I6my7CnfMaWzvAK9StUaAlRzjOy09yVIp3oIhCnsNZ84i
	tvY229fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPEjZ-0000000BUhw-2j8N;
	Fri, 06 Nov 2026 07:51:37 +0000
Received: from out28-172.mail.aliyun.com ([115.124.28.172])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPEjW-0000000BUhd-2B4s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 07:51:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1793951489; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=X3nxSXG+H2J8k8t3k6poogjxQFJaTHXAguqehE2TWiY=;
	b=EdBOOO5d/HlK/xdK+U63qbsCipbHTOjNjstrXi49twguHyNCSFWfk4udWTjT++l+gs7f4/JjR6BY1sbl1pNhGqsabFd7UqgnLXopyDkZIJKCx6lqYgei7RSKnt1Kbx0fYVrLo9zU5ulAIWNisZgvIILVcRMU1/NTFOLmymFqTVY=
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07707597|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.003847-0.000952075-0.995201;FP=12758894924369871956|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037034254;MF=liuc63@xiaopeng.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.jy77D-U_1793951487;
Received: from localhost(mailfrom:liuc63@xiaopeng.com fp:SMTPD_---.jy77D-U_1793951487 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 06 Nov 2026 15:51:28 +0800
From: Liu Chao <liuc63@xiaopeng.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Juergen Borleis <jbe@pengutronix.de>,
	Denis Carikli <denis@eukrea.com>,
	Lee Jones <lee@kernel.org>,
	fangxy@xiaopeng.com,
	linux-input@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] Input: mx25-tcq - clamp the FIFO sample count to the buffer size
Date: Fri,  6 Nov 2026 15:51:27 +0800
Message-ID: <20261106075127.3105907-1-liuc63@xiaopeng.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_235134_736609_C28B5E23 
X-CRM114-Status: UNSURE (   9.46  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

MX25_ADCQ_SR_FDN() reports up to 31 pending samples.  The IRQ thread
aligns the count down to a multiple of the sample count but never
bounds it by the size of sample_buf, so a FIFO backlog larger than
TSC_MAX_SAMPLES overruns the stack buffer.

Clamp the count before the alignment so that the result stays a
multiple of sample_count.

Fixes: 4f7ed234f2a5 ("Input: touchscreen: Add imx25 TCQ driver")
Cc: stable@vger.kernel.org
Signed-off-by: Liu Chao <liuc63@xiaopeng.com>
---
 drivers/input/touchscreen/fsl-imx25-tcq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/touchscreen/fsl-imx25-tcq.c b/drivers/input/touchscreen/fsl-imx25-tcq.c
index ff270b3b8572..fa8d8b736723 100644
--- a/drivers/input/touchscreen/fsl-imx25-tcq.c
+++ b/drivers/input/touchscreen/fsl-imx25-tcq.c
@@ -319,6 +319,7 @@ static irqreturn_t mx25_tcq_irq_thread(int irq, void *dev_id)
 	 */
 	regmap_read(priv->regs, MX25_ADCQ_SR, &stats);
 	samples = MX25_ADCQ_SR_FDN(stats);
+	samples = min_t(unsigned int, samples, TSC_MAX_SAMPLES);
 	samples -= samples % priv->sample_count;
 
 	if (!samples)
-- 
2.50.1


