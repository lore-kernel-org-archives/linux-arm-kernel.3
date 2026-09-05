Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9355C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 08:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v6rV8mHJA3DgWiy+pOW7sTyqzuTia8uCBTPWEfM6Kl0=; b=g7ZPaOqbEyZ046+cAO1g8nY93Y
	w640nkghqxtIij56NWyFI67KEmrjHyqqadAMsaWPP2GQZw7eBy1BlZfM7KCip/FSAHfKCqnsTVeWN
	TOntEZkHWi7AxelR2eQ+frJjDuvmFy46uexTh4/ziEyeAVVQlttDdYyFlHw4tQDL4j+95nnJahiPP
	KMIlGxt4oGtajuQu8SKsOSMtFYY7ldSaqAc3XnQuDO8d1tj4HE35W2UIj45hVXAoDEvcbG4WkDJcx
	NPjCupfhFKC/Q/b8hocuB9SYg6dgPVVgdjSlyawgnT/ZbHoHQmKHEEqAvBZb93YjgLplo5jVoj/fE
	K8HPwBwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2lML-00000003pTz-3DpL;
	Sat, 05 Sep 2026 08:02:45 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2lMJ-00000003pSp-1322
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 08:02:44 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4843efcbdb2so949794f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 01:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788595361; x=1789200161; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v6rV8mHJA3DgWiy+pOW7sTyqzuTia8uCBTPWEfM6Kl0=;
        b=H24q8WqhsF1VPDZsToTRtek+j62AbZIqg3Nr1YFLaz6uFC2nZdPLKCTGOYmOpcVWFA
         WbecUio0J3Pizx/Lhdxhi4aKMBPO6+zti4HWLdgVElNRztmTMK1xHnNsx/caDhp+gpvP
         yopRkTfldCCg0vebMB5uV3XRFYpVBQTj3KnDOnoyxeOwQhJNl1RmYrY1CiL0DvhO8zxG
         BMYaHh56EI2Xz9wCG2Kgk58f3LVULahPx0USjXlZPrm1/A4n63klRYJOT3PsTlZAMBoX
         TAB3pK3xNqdyBxdRBvsbW5LgsloRanDLeIYmR6Fse7bRsSolupgH9A0xAoYxCwRU/dZ2
         VdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788595361; x=1789200161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v6rV8mHJA3DgWiy+pOW7sTyqzuTia8uCBTPWEfM6Kl0=;
        b=ZmUkMIExPiYu5L9nUcjuWnA7jRtBnM+GDttHvQ4A2zU31uO6WcEXuy7G0mXayqg3jE
         tofzve2Vi18fkFSnASTPEKgf3+aCQl2erYj9GXYmm/zAg/drKmTCpOUenjUeOvEUs9GG
         HHVF/cDjkO1q6929WkqcPlb/zUeab1wEwot27JobJ2cGV0JKj+3YBi7JafJIz9wZPQUs
         VwDrD30hwtYzNots1ELzWrrMNkwYZkRct5mE3KRlPqUwp9Ky9MklpHi2IgawAextkw3q
         wy2iyPArOaKTXMTT84bHSueJzA4kfjXGwvtjUzIKruwca6GUzIHub/idMDGhn4a7FlgH
         fjkw==
X-Forwarded-Encrypted: i=1; AKwUvBw+Bm9aKoVtPxvbFLF/ZrTcRP+reVbP8ikDycWPZjQnvask4Z8Wnrq5YOpdApXGJBYg3C7YR73hlVMdh8xblaz4@lists.infradead.org
X-Gm-Message-State: AFuF++lHouCQlAYo9VKiP/Sgbj8Tv/rH9pi0iT7YPsFIEnQpj6gwfo6i
	IZ3HIFF4Z5gzMmyhMOtjAujnO+BD4tApj8IFTs9k9qR0fpLHscHMBE7E
X-Gm-Gg: AYBFou0bGZNGaI5hBZTdGqd6kexyKGyt6+gTmZslDPXpkv6BUD9xb3XNKDNvv1rgD8L
	xAXstG//b1Wnaa8+aGc/gp/yN3wrvh5Y/vdGwTwUt8C7cR3U5PlfYZtWUkjI9hL4//xBFbgmlji
	SDPImHEVD3uoZKG/ZirwGw/rDWBEb6/SAXylRq8dz3PAqQrClxq/A14jufmFqajyHsSy2Sn+aOX
	IZ+wFZd3Ii8CUowkVdT356W4+S+BNtEhIIiqaPM4aVdVe61pUtYhwOuqiTaxou4QXltyJMewNeo
	KtNqwzHiObrqELEZxN0f1dRkxcZ34v2QVzrNeLj6XXhZCWFtNQSkyJjx1Fyr7NORhdvwKBOx4WE
	z61vYnSOSu6r2ai/csTY/4ndCV0safAUtDNjnruiRiS4vNYRnZ32HfzQyLroikPiB1tw3wFe4Tb
	Pj7n6wtV70LNFrdY2SPgRS5bsDYIEzvQM6TzxPg0r2fpgZvXi4l7d1cPYmZKAGHy3CMaHl+tg+T
	y30+XsPbfAF4ylCpeyc5rSGQ0yBUCTxOVqp3zcu8D3Ivxfow0XODlJWy7/Kws+UgLUmggaIc1rG
	IOtFV0WBo1HwhF0+KMXmchoIXC8HCSjtvw58ETAx28MG/2hakn8wSOcEPAyX8Z+6Wtg=
X-Received: by 2002:a05:6000:2010:b0:485:8a47:5b92 with SMTP id ffacd0b85a97d-4858a475dadmr9500479f8f.47.1788595361036;
        Sat, 05 Sep 2026 01:02:41 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883a9234sm12251794f8f.14.2026.09.05.01.02.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 01:02:40 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Antonio Borneo <antonio.borneo@foss.st.com>,
	Linus Walleij <linusw@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] pinctrl: stm32: Drop the nonexistent CONFIG_MACH_STM32MP25 from the STM32MP257 default
Date: Sat,  5 Sep 2026 10:02:35 +0200
Message-Id: <20260905080235.33785-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_010243_343206_75A4CBB5 
X-CRM114-Status: GOOD (  11.37  )
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

Commit 619f8ca4a73d ("pinctrl: stm32: add stm32mp257 pinctrl support")
made CONFIG_PINCTRL_STM32MP257 default to MACH_STM32MP25, following the
MACH_* pattern of the arm32 entries above it, but no Kconfig symbol of
that name exists and git log -S finds no Kconfig file that ever defined
one: the STM32MP25 family is arm64 only, where CONFIG_ARCH_STM32 covers
it. Commit dba0aff2b89b ("pinctrl: stm32: Allow compile as module for
stm32mp257") added "|| (ARCH_STM32 && ARM64)" next to it, so the first
half now evaluates to n and changes no configuration.

Drop the first half.

Fixes: 619f8ca4a73d ("pinctrl: stm32: add stm32mp257 pinctrl support")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/pinctrl/stm32/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/stm32/Kconfig b/drivers/pinctrl/stm32/Kconfig
index d6a171523012..cc425bbfc996 100644
--- a/drivers/pinctrl/stm32/Kconfig
+++ b/drivers/pinctrl/stm32/Kconfig
@@ -55,7 +55,7 @@ config PINCTRL_STM32MP157
 config PINCTRL_STM32MP257
 	tristate "STMicroelectronics STM32MP257 pin control"
 	depends on OF && HAS_IOMEM
-	default MACH_STM32MP25 || (ARCH_STM32 && ARM64)
+	default ARCH_STM32 && ARM64
 	select PINCTRL_STM32
 
 config PINCTRL_STM32_HDP
-- 
2.53.0


