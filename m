Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB15CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 16:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fpOnpHUlmYdOv4gPzZ2omqt3CmZEZdq9OSzIodZ303E=; b=Kh+CpCTfHhcNBdLyhXLwqUv/Lt
	+iXmx79hhZ8fbfHBeH5hgi77O6cXWmtMdf2R4SyZnTZwz08sdMuGpj8g/oqBBC3DmseW9g2S70B7T
	vcacZuS6Zfzz4rW7XnRaMVf8AylYFq06VMVze+9EM+S3MUhMju1fmwBqgeemk5Qgllj9+zpvT8gA2
	xoIIW5iKUY9w0fybGP0jCkIxnoK6n9bV1T+9/xVCCQoMPruQgAqvew+cVi/BYAcb7MfW7rl4q70er
	+6UXaTx7BqezF9itIrFzXry3k9PSXEswdaNA3Wucm8Bwb2BDTpeIpWEESB/kl01eoC8RDTe5EapC8
	vaC4Zm1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHkaO-00000003PbF-0XpC;
	Fri, 16 Oct 2026 16:15:12 +0000
Received: from mail.nozomi.space ([139.162.184.125])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHkaL-00000003Pa6-3Jtt;
	Fri, 16 Oct 2026 16:15:11 +0000
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nozomi.space;
	s=mail; t=1792167298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fpOnpHUlmYdOv4gPzZ2omqt3CmZEZdq9OSzIodZ303E=;
	b=ZQ66W5hlir9wlHKTxyRZAIejQYiTE71r65GNC8e+3zI19L/8bXcCyf2/P+ugU9jHxlAbwE
	kXKjuovaoxn13FoA8XT7wf75nF1JMiJJjE7R/5S5LecsOTD2o2le53pZOZFWkO65XissoI
	UCrKue2X7BOEwTx9YY3fFvvy4JB/zu+mUyalrBdwX1pdU1yMiKoUmOTZGuqzEnKos3ksO2
	lOMNdYaiF4voVLgXeYPTACJ0jb8KynTEGQS7Si/nidZygn3p1Ihz4IzQizalfiXPOsatw1
	bCDxunfUSkMwia71YSTxc6oKTDosXMSruEvap1CAKUibwOLuTceWLZ7kpQ7VoA==
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
Subject: [PATCH] ASoC: mediatek: mt8188: Suspend the AFE across system sleep
Date: Fri, 16 Oct 2026 18:14:55 +0200
Message-ID: <20261016161455.194400-1-michal@nozomi.space>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_091510_016466_09ACF490 
X-CRM114-Status: UNSURE (   9.08  )
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

The AFE only has runtime PM callbacks. When a stream is open across
system suspend, the AFE stays runtime active, so its clocks stay enabled
and its register cache isn't marked dirty, while its power domain is
turned off in the noirq phase. On resume, the deferred card resume work
powers the DAPM widgets back up and writes the AFE registers, whose
clocks are off after the domain was power cycled. The write stalls the
bus and the system hangs.

Force the AFE into runtime suspend for system sleep, and back to its
previous state on resume, so that the domain sidebands, the clocks and
the register cache are restored before anything touches the AFE.

Fixes: bf106bf09376 ("ASoC: mediatek: mt8188: add platform driver")
Signed-off-by: Michał Kopeć <michal@nozomi.space>
---
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index 7b1f5d05f4d61..1710a9be2bcff 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -3379,6 +3379,7 @@ static const struct of_device_id mt8188_afe_pcm_dt_match[] = {
 MODULE_DEVICE_TABLE(of, mt8188_afe_pcm_dt_match);
 
 static const struct dev_pm_ops mt8188_afe_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 	RUNTIME_PM_OPS(mt8188_afe_runtime_suspend,
 		       mt8188_afe_runtime_resume, NULL)
 };
-- 
2.56.0


