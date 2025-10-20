Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E1CFCCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 17:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yZFI6bgH2OjVdPOzpRdpkHCD+IiO8b/2BHEuZv8OFik=; b=YKA5JkuVRhkD2a/HpnqeiwkmFc
	nOypty9kCtqSi3RTuvrLNQkZ3HW1vzYl8upVsGxJatdRrpyx8olZcdklINoAMyomLwaDOcCkIl7wz
	ibGi0/M+kEyIQe/w13/LkdCU+f4OpZ3LcT5PqwUGdOHydiad7rYbQPkBDFFhuMWef7xOoOYe0BX/A
	15B7vxymyKOrdaXN+Wz3K8MSZ8kxoPyO5rvQKBgL3LbXBbuVqmKwqKSSK3h3/hhECJ6I07eqPgCTK
	XDQ4ID+Htyai1w5k6NRG5A71e9z8deBmKht0Rt17FFouAsI4BEkpacEkA6/EYHrBikgOLAFCi4oZV
	ELyq3Dog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtJS-0000000EPZs-2BIB;
	Mon, 20 Oct 2025 17:04:50 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtJP-0000000EPY4-2SgY;
	Mon, 20 Oct 2025 17:04:49 +0000
Received: from DESKTOP-L0HPE2S (unknown [114.245.38.183])
	by APP-01 (Coremail) with SMTP id qwCowAAnfqCsa_ZoP4ErEg--.24677S2;
	Tue, 21 Oct 2025 01:04:44 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] ASoC: mediatek: Fix double pm_runtime_disable in remove functions
Date: Tue, 21 Oct 2025 01:04:40 +0800
Message-ID: <20251020170440.585-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAAnfqCsa_ZoP4ErEg--.24677S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJrW8ZF4UAF4UGFWktry7ZFb_yoW8ZFy3pw
	nYga93t3yaqr1UAanrAw10qa4a9ryfCF43Gryq9347Z343Xr1IvF4qy34jvFWkKFykKanx
	GFyUtFy7Gr4FqFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-Originating-IP: [114.245.38.183]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRABA2j2T10bSgABsH
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_100448_004164_FCF2BC34 
X-CRM114-Status: UNSURE (   9.09  )
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

Both mt8195-afe-pcm and mt8365-afe-pcm drivers use devm_pm_runtime_enable()
in probe function, which automatically calls pm_runtime_disable() on device
removal via devres mechanism. However, the remove callbacks explicitly call
pm_runtime_disable() again, resulting in double pm_runtime_disable() calls.

Fix by removing the redundant pm_runtime_disable() calls from remove
functions, letting the devres framework handle it automatically.

Fixes: 2ca0ec01d49c ("ASoC: mediatek: mt8195-afe-pcm: Simplify runtime PM during probe")
Fixes: e1991d102bc2 ("ASoC: mediatek: mt8365: Add the AFE driver support")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 1 -
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 5d025ad72263..c63b3444bc17 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3176,7 +3176,6 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 
 static void mt8195_afe_pcm_dev_remove(struct platform_device *pdev)
 {
-	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		mt8195_afe_runtime_suspend(&pdev->dev);
 }
diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
index 10793bbe9275..d48252cd96ac 100644
--- a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
@@ -2238,7 +2238,6 @@ static void mt8365_afe_pcm_dev_remove(struct platform_device *pdev)
 
 	mt8365_afe_disable_top_cg(afe, MT8365_TOP_CG_AFE);
 
-	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		mt8365_afe_runtime_suspend(&pdev->dev);
 }
-- 
2.25.1


