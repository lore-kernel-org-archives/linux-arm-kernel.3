Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5B2606A328
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 02:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GpXt3v3W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=GPPjgPXMdTGHADngYsCikDS3FDt2Si5kyVRezK2CTn8=; b=GpXt3v3Wuz+4FR4ubum3N55AR/
	6WQGdWmQd85ee2dVC8oocPdlAuPhSWans7EwXTZhF+g+n/8NP8o8S2Cs7mlNIEu3e/+pIJtVerKbl
	t1eFbtE222xN2/GK1/Fhp4Ms6sCHmV+guCBOB9yuoOWqjfWeRYF1hFHcKs6bLlF4K+ZilTbFudsPV
	JpJtBcsxJHjNW0P+0JgLQcg1HyEAoKUcXwfnX2UerNi7+SVeGv3bIcxd5lb7OK/HmegFixqbykVX2
	zlzwIfQ5z4ffoGoCfv06g8FD/d1OfjLLLzFZdiA7h53h86uTmmipOSeGfu9Pvzo3GAzWXQp/CZmUo
	yhZVRznQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOQvi-00000004BKr-0HWh;
	Wed, 04 Nov 2026 02:40:50 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOQvd-00000004BH1-1Oh1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 02:40:46 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowACXwvwqm+pqh7k+AA--.5176S2;
	Wed, 04 Nov 2026 10:40:42 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ASoC: stm32: spdifrx: keep the control DMA channel on config failure
Date: Wed,  4 Nov 2026 02:40:51 +0000
Message-Id: <20261104024051.1508703-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowACXwvwqm+pqh7k+AA--.5176S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF43ZF17Jr4xKw1ktFyfCrg_yoW8Jw1rpr
	4rJrWvg3y5Xan8XF4qgr109ayv9rZ3Ar4DKws8Ww12vrnxAryIva9xWw4qgr42yFW8Ga12
	9rs3tFy5uw1rCF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBjb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14
	v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xf
	McIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kK
	e7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r48ZrWUJr1UMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267
	AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07bzhL5UUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwQBA2rqZFjVPQAAsV
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_184045_802004_0FC668D7 
X-CRM114-Status: GOOD (  10.20  )
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

When dmaengine_slave_config() fails, stm32_spdifrx_dma_ctrl_register()
sets ctrl_chan to NULL and returns the error. The channel obtained from
dma_request_chan() is thus lost, and stm32_spdifrx_probe() calls
stm32_spdifrx_remove() on the error path, which then passes NULL to
dma_release_channel().

Leave ctrl_chan untouched so that the remove path releases the channel.
Its IS_ERR() check already handles the case where dma_request_chan()
failed.

Fixes: 03e4d5d56fa5 ("ASoC: stm32: Add SPDIFRX support")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
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


