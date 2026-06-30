Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F148AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 10:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MlMb5zPXUX4woYeZVRLy6YT/2hgcV3iro1eZZxfNI+g=; b=GXsu0pzKuiSMWUEfTmjuvFFjZZ
	AHgu2dGI2Ji2ZNf+bS92NYEnkGZMZoCKag4c9e483JPq6c9r/l/1UOmU/emD630le8j8j8AgN1EZm
	Qy9pORIcJUblaAWaj7JikhYBSAYKNPOHKmE/fd65bUC/wp6bGRBNmJA+pT0uNZGYyhL8cCDvgy4cL
	Y4CIex7uG28fGy2AppvH220/3K7g3fdZ9eN2/cIIZ0O9hAlRkAX4NlJd3WiJJB3y/sMNdkPzcXErM
	H8aGjqrJHzK+BEX7/GA0u+YGTpz8IboursOvuDwldhE2JI+pjCnUChOtZ477XZ8BS6vv2RrhbD7pf
	abh8ky6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVYi-0000000GbuZ-3hXg;
	Tue, 30 Jun 2026 10:19:16 +0000
Received: from out-184.mta0.migadu.com ([91.218.175.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVYe-0000000GbsV-36x4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 10:19:16 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782814748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MlMb5zPXUX4woYeZVRLy6YT/2hgcV3iro1eZZxfNI+g=;
	b=rhl39RgSg7lnKmjtlU7vzEKfDxvQCc7L4CnzS+L91cymc3+Ul0+kX9JPYE4BNSJuTzC0C8
	gbq33AYKCso2rWzDIOxxKN+0a1aNWwGMLqB2IWAJhkkZuWMi4ANxiPkdpH/geU3rCIB9Nf
	UfUN9vqMXeshqgO+2S6pceSO+cWNjTE=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] hwrng: atmel - drop __maybe_unused from atmel_trng_pm_ops
Date: Tue, 30 Jun 2026 12:18:01 +0200
Message-ID: <20260630101801.684164-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=971; i=thorsten.blum@linux.dev; h=from:subject; bh=pcsuBUJx09l9FL78SknJ7UiH2glyj5fmomEjAfqDvVI=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFnO0286xHYWsGryv5ixuGbjt21P/506ZMWRts79Zmyn6 dK7OmfVOkpZGMS4GGTFFFkezPoxw7e0pnKTScROmDmsTCBDGLg4BWAibUcZGZry4lq3MfxJcbnK 4C9uGrraaXnenNtXXlvU/WWbUvzRxoWRYb5iyWuN8FNLmK+cnjorI6rQ3SWi8eKCo1dOZSp8O6u ZywIA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_031912_990209_0AB09DE5 
X-CRM114-Status: UNSURE (   9.35  )
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

Since atmel_trng_driver keeps atmel_trng_pm_ops referenced and pm_ptr()
uses IS_ENABLED(), which allows the compiler to optimize away unused
variables, drop the redundant __maybe_unused annotation.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/char/hw_random/atmel-rng.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/hw_random/atmel-rng.c b/drivers/char/hw_random/atmel-rng.c
index 6ed24be3481d..10082add0886 100644
--- a/drivers/char/hw_random/atmel-rng.c
+++ b/drivers/char/hw_random/atmel-rng.c
@@ -186,7 +186,7 @@ static int __maybe_unused atmel_trng_runtime_resume(struct device *dev)
 	return atmel_trng_init(trng);
 }
 
-static const struct dev_pm_ops __maybe_unused atmel_trng_pm_ops = {
+static const struct dev_pm_ops atmel_trng_pm_ops = {
 	SET_RUNTIME_PM_OPS(atmel_trng_runtime_suspend,
 			   atmel_trng_runtime_resume, NULL)
 	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,

