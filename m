Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E353606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 03:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Qbj2oIpE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Cc:To:From:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=VBUHk0eb1Jrp0GTokwo7e24MRl3AF5esG7weZxCQEkY=; b=Qbj2oIpECtHRXlP6SLKCPqUSmt
	JCY+KcqbN2/LnmnEAYetTfgO2fXT+DawumbprwtPezIdR7K4L6ldyUBqevXITlLnegkvqQNSdYBvH
	8CiARo+zG9OP4FqIihE4E/ePQcYbpMkN82m2XKot2sj9V8z5tJEusMV5Ehgg6eY//xHmj2OtXfswL
	6aC81Y4MVpcdXyA522Eoic7C2aPcpzCvJAux4Vf0TIU6YHso7N6qrYkZXiqEWZzd6qKmpUkTN+O15
	KQEmfRHZhLoWBCXQ3zbStGoa7HGUw2Cx79VGm7T7HoOTUpyrIS0QQC+K9VY2Sgc1NVQlq2UmGl1Xq
	DrIZkIkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPB2B-0000000BBsj-11GS;
	Fri, 06 Nov 2026 03:54:35 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPB27-0000000BBs0-1eSK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 03:54:33 +0000
Received: from [172.100.0.8] (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowABnVf9yT+1q4vxeAA--.15002S2;
	Fri, 06 Nov 2026 11:54:26 +0800 (CST)
Subject: [PATCH v2] ASoC: stm32: spdifrx: keep the control DMA channel on
 config failure
From: Wentao Liang <vulab@iscas.ac.cn>
To: Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Fri, 06 Nov 2026 03:54:34 -0000
Message-ID: <179393727482.2060666.9057920361892304525@iscas.ac.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: qwCowABnVf9yT+1q4vxeAA--.15002S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF43ZF17Jr4xKw1ktFyfCrg_yoW8Cw4Upr
	48GFWDt3yYqa15XF42g340ka4v9r93Ar4DKws8Ww1Ivr13Ary0vFZ8Gw4qgr4jyFZ3G3W2
	9rZ3tFy5u3s5AF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Sb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxV
	W0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7
	v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_
	Jw0_GFyl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8GFyrJr1UJwCFx2IqxV
	CFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r10
	6r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxV
	WUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG
	6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UYxBIdaVFxhVjvjDU0xZFpf9x07befHbUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAADA2rtTzUAtwAAsG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_195431_829585_125F38D2 
X-CRM114-Status: GOOD (  10.51  )
X-Spam-Score: -4.2 (----)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When dmaengine_slave_config() fails, stm32_spdifrx_dma_ctrl_register()
sets ctrl_chan to NULL and returns the error. The channel obtained from
dma_request_chan() is thus lost, and stm32_spdifrx_probe() calls
stm32_spdifrx_remove() on the error path, which then passes NULL to
dma_release_channel().

Leave ctrl_chan untouched so that the remove path releases the channel.
Its IS_ERR() check already handles the case where dma_request_chan()
failed.

Fixes: 98c8dc2fd59f ("ASoC: stm32: spdifrx: fix control DMA error management")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
Changes in v2:
- Point the Fixes tag at 98c8dc2fd59f ("ASoC: stm32: spdifrx: fix
  control DMA error management") rather than at 03e4d5d56fa5
  ("ASoC: stm32: Add SPDIFRX support"). 03e4d5d56fa5 released the
  channel inside stm32_spdifrx_dma_ctrl_register() before clearing
  ctrl_chan; 98c8dc2fd59f dropped that release and left the cleanup to
  the probe error path, which is where the channel leak on
  dmaengine_slave_config() failure was introduced. Noticed by Olivier
  Moysan.
- Link to v1: https://lore.kernel.org/all/20261104024051.1508703-1-vulab@iscas.ac.cn/

 sound/soc/stm/stm32_spdifrx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index 88863dbd05d9..ce75929daf73 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -425,10 +425,8 @@ static int stm32_spdifrx_dma_ctrl_register(struct device *dev,
 
 	ret = dmaengine_slave_config(spdifrx->ctrl_chan,
 				     &spdifrx->slave_config);
-	if (ret < 0) {
+	if (ret < 0)
 		dev_err(dev, "dmaengine_slave_config returned error %d\n", ret);
-		spdifrx->ctrl_chan = NULL;
-	}
 
 	return ret;
 };
-- 
2.34.1


