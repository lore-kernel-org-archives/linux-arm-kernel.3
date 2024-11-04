Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E497D1BDE3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 19:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XGSIuxBK7UXKoz3VO+Rp/7Kz5d6dRUxZNaz/X2B/XWM=; b=gsDIcTRpz0rPaxR0aFqgHnXNfU
	bo5W7BI01819qAkNKCtS3UUV2Rb4NCOvqAPttKSEylTQP5Fu1W1oLCnmCHeoV2m7BPL0SSlT09CEE
	OMbtsY7RJMoLFuaqiQfmBKJpmA9LjmK9pOZMbcla7Js9MJriNUeaY+AfBKbXVuNwBj7wZXPgfF1d/
	gN47t8fx7HqLguhjyg+yZuIWu2vagUXte1UWMN6VAsNir5d+zYk/2OX1T0AzYSe7TeziRDzbAaq2P
	VXCFiTRDI5+3x3jsXewchZdaI7qTtULQoYbvGFs5ugreZPb2LC13SJmD5xB3JJ+g+o9yaOocRq2Uv
	ChmWQz7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t82Xr-0000000Es36-30FC;
	Mon, 04 Nov 2024 19:15:23 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t82Pp-0000000Eqrd-1cCF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 19:07:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7CF91A43286;
	Mon,  4 Nov 2024 19:05:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28193C4CED0;
	Mon,  4 Nov 2024 19:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730747224;
	bh=Dl0TMpSb2eAzhg61AwTW0r0i9OW2iff6l56nxYhwNq0=;
	h=From:To:Cc:Subject:Date:From;
	b=UGOiEUyhyhHRCJ+RkTlev41cqWdhI+paCp1rekR5Lz075hpnzNynja9Vj1qOBXafp
	 fSTuXdIxDf8XcLcddBl2KCcf6YfU+SxFzp67Z0Kbw/6MbQi9HdNDkOCLKivIPAcTQq
	 LUYD7BMeEt6cCZz07lVm3noE29xw/2JnYZVz3laryy34jukjejO1x+n40HuKMsJXGj
	 IUzzwlcIRHTzbcu27xa7TnxPrlb4+zGkn+6fVGdtbQeXs0lTti9QN11Je2gHWuNWTD
	 iiaKD0UWAUjudL1VgbQsa+jg2eLqZvCQbivXQ0aZghGIdN/Tl4iyiZSLMmLITqiLle
	 a03WV8bpJoUbQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] misc: atmel-ssc: Use of_property_present() for non-boolean properties
Date: Mon,  4 Nov 2024 13:06:59 -0600
Message-ID: <20241104190700.275573-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_110705_507517_87178EE9 
X-CRM114-Status: GOOD (  12.01  )
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

The use of of_property_read_bool() for non-boolean properties is
deprecated in favor of of_property_present() when testing for property
presence.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/misc/atmel-ssc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/atmel-ssc.c b/drivers/misc/atmel-ssc.c
index 6eac0f335915..1d0322dfaf79 100644
--- a/drivers/misc/atmel-ssc.c
+++ b/drivers/misc/atmel-ssc.c
@@ -153,7 +153,7 @@ static int ssc_sound_dai_probe(struct ssc_device *ssc)
 
 	ssc->sound_dai = false;
 
-	if (!of_property_read_bool(np, "#sound-dai-cells"))
+	if (!of_property_present(np, "#sound-dai-cells"))
 		return 0;
 
 	id = of_alias_get_id(np, "ssc");
@@ -176,7 +176,7 @@ static void ssc_sound_dai_remove(struct ssc_device *ssc)
 #else
 static inline int ssc_sound_dai_probe(struct ssc_device *ssc)
 {
-	if (of_property_read_bool(ssc->pdev->dev.of_node, "#sound-dai-cells"))
+	if (of_property_present(ssc->pdev->dev.of_node, "#sound-dai-cells"))
 		return -ENOTSUPP;
 
 	return 0;
-- 
2.45.2


