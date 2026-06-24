Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C0BCDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 05:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bIipXPM1WxhAcCqGaRWfcCJPUo3NreAKUT/Dy1pU4Lo=; b=nZUd2IxiEnjMT1BaBCkVfCYwGe
	gd6S6xZMrGg2PEEDcJbssHLCEbZZ8dzf9M0k5MTnYjI/qdkzaDK1cgBiKHeXmi/Ih/TP3Yfjz1E/k
	L4eXgSLcMmkIrUxKP71EIxtBRLC4Dzsf+JbgBojuFGGFN5Fkrdyxcc1+MeOw6jtaxoYGDDcX+0EkA
	iEcLrqo3SELf2LlD8ZugI9xbefRB6duABimmRtcYPGb1EUz/wF5uuxOBWsm1ep210HovmdBM1d4nc
	/58lVmWBjtyWd/UetY7sl8gU6dP+lUV4GUT5AchHIwcobdH+KlJERjUTdqDRL4fxtKDCGdmrg3jDJ
	mmz4yvDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcGWL-00000007BU6-0vlZ;
	Wed, 24 Jun 2026 05:51:33 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcGWI-00000007BSw-23Er
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 05:51:32 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowACXaZBbcDtqZQ2tFQ--.13554S2;
	Wed, 24 Jun 2026 13:51:24 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Samuel Holland <samuel@sholland.org>,
	dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] drm/sun4i: mixer: Check clock enable failures
Date: Wed, 24 Jun 2026 13:51:23 +0800
Message-ID: <20260624055123.26769-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowACXaZBbcDtqZQ2tFQ--.13554S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kry7KFyfXF4rKr4xuFWDCFg_yoW8Wr4kpF
	WfZF1YyrW8J39a9ay3Xr48ZF13Aw4rCFyxG3yDGa40grn0kryUtFyUKFyqgF9Yk3Z5A3W7
	t3WkGrWkuFn8Zr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUL0edUUUUU=
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_225131_140881_2585CC46 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
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

sun8i_mixer_bind() acquires the required bus and module clocks, but
ignores clk_prepare_enable() failures before adding the mixer engine to
the DRM pipeline.

Check both clock enable operations and use the existing unwind labels
when a required clock cannot be enabled.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index ce9c155bfad7..c6546f933b13 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -616,7 +616,11 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 		ret = PTR_ERR(mixer->bus_clk);
 		goto err_assert_reset;
 	}
-	clk_prepare_enable(mixer->bus_clk);
+	ret = clk_prepare_enable(mixer->bus_clk);
+	if (ret) {
+		dev_err(dev, "Couldn't enable the mixer bus clock\n");
+		goto err_assert_reset;
+	}
 
 	mixer->mod_clk = devm_clk_get(dev, "mod");
 	if (IS_ERR(mixer->mod_clk)) {
@@ -633,7 +637,11 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 	if (mixer->cfg->mod_rate)
 		clk_set_rate(mixer->mod_clk, mixer->cfg->mod_rate);
 
-	clk_prepare_enable(mixer->mod_clk);
+	ret = clk_prepare_enable(mixer->mod_clk);
+	if (ret) {
+		dev_err(dev, "Couldn't enable the mixer module clock\n");
+		goto err_disable_bus_clk;
+	}
 
 	list_add_tail(&mixer->engine.list, &drv->engine_list);
 
-- 
2.50.1 (Apple Git-155)


