Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72E3CD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 10:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T7qWssdHiLBFsSt8dH4a2h+fzHkfZe1zSV2zWUbUyiA=; b=aYcAXVq1h3x5TXgD+GLpYWuUjz
	0CCbDP70aWUVFdfbeJAk3yQKYpi1ryIQcT0U+3z+CNMdBXYoAokAP96pF8UmADfqGlvFlCnMUiBrL
	tgEQK0bWk+OUCMZRrCKC6J5FQ0oVeMm2DxL75umNt+p2gZMrcIGpvWJlebuKWsOyJUPZ/IBUUlikY
	Ab2O0p13pPDWKDewqawlnKWyo3LU325sKWG/Ojh9MoPbK1F7eoJv1sKSsylMS+u1vZFtrHQk8gb5e
	PVsy7WBAFWT5bB3lGBozrnypkCUUKvnOXcoc+6hyfJX5Odbz407eHbb114m9BD0pz1w5VTJSbxrg6
	lSehn2xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXcy7-00000009FWH-2V5J;
	Thu, 11 Jun 2026 10:49:03 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXcy5-00000009FVR-3vbY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 10:49:03 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso66562075e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 03:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781174940; x=1781779740; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T7qWssdHiLBFsSt8dH4a2h+fzHkfZe1zSV2zWUbUyiA=;
        b=WlfA2s49sHxt5+VeAbKcuC0eFE0itSHajbKrDaUv6d3UvAwkMQxXf7HxSBj/bA0RF1
         3tt/C9hA8Ejmd/jN20wdfkrFD/L616Nib9KW/z5U/XudU/wP3fU+p5zcEYnytOXPm3eg
         nGXXSwBMgvlRC7VqWwnXGN5phwWWNyqipmSP2eSeKhjStinb4K73A2g7ZvXQjY95UswG
         vdwuZrjB2CoqG3zyFd3M453HJO/n3uMM9j/ofy2gBAY64QKG6NGSVETXjd/QvfSU2u0p
         ulndIAv9cSvfnfXEg6n9EL8Ll46uoC9rNFLiAFo7DfpdV+VdvalC4QrApf+8iL8zE4in
         T7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781174940; x=1781779740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7qWssdHiLBFsSt8dH4a2h+fzHkfZe1zSV2zWUbUyiA=;
        b=Ai9nysUMeMblUGZw7lbQxp5OFJKJfaShlmiYmep2/99uujlXJBwdPNmCrG4Cs9KTqH
         CH/ga63R/dNKPDYaj1KSrCsyjjEWBmvHP/dr8FPTnrvY6Y+BidlM3iViVYjlUX4LqBcm
         0ex6+7HjsxhOr8+FNv0JziHc2w/0/R8B4Arv8bxN3SxN7s2GNvWu6iTRwD110GUn6ga2
         w+5Aos3loJ1tv5X7gFsKlc2w0e1hoP2/JYkvkvs51u1aoIKyeeufI+j43KSfmbEADxu3
         fkeNeyR2Pl0bkwo8pVmb8dbNShf62Pe2SrqueSGEZBE5jm63TLUdYaPgCjufL4iYlQVk
         BI4A==
X-Forwarded-Encrypted: i=1; AFNElJ+KXw5Bqps2BeAwE/3SwaRKzxYj1Jc12S2zT88Qa1LO8eZF6TxmdcwnA2my6xpgrXZ0H/KkJM80C3PvGgX48IGl@lists.infradead.org
X-Gm-Message-State: AOJu0YxrUQFlrv5rOGkxfIpPxabVToQS6DzZdTK9ENAlq35T/zCDwKJR
	3ht7luPK1ffbVfWmcg39SL74EfAku+eYJe7v2OSz/NCVndfZuBoHapIG
X-Gm-Gg: Acq92OG58YWhnl7d6AeFgmcOH1TZtpCYfqABIzqN5tBnSmXTZ266HOpI6nnLXYXKyvJ
	jl8S3BbKfRej1UitfpMR7RG2j2xivTV+5sZcN8K5OSFjlnUm/llb/cq7gkFozXqPCP/tO/EjPoQ
	ritn5PNLjoZN4RYbIRShkCoqYnZ5cn9ti6VkrFXCpnLFWEVIUr/GnrJNHz2s00fOXqjYTWFE3yf
	ZTpSwDQuE+etjIxhUFTcvviPu+Me2c9x/M2DKD1Z+VvPU/IAZvTrEbI4PT0XTG68y92ckVZuiBx
	PFik47VpaRuoJLA2a6ikDq2IHlJpDDrVtwBtIubuzq+hUxOSs1M1EeaX2nxxvv5yngMjp9hnvTW
	Nbjb3wkrr0UAqNap7KyD7hFtfQyYDQ3RzxIYXcLlpy4ItUrisOcDGzZ+pJVc6V91dQ9JJl/Grfx
	SlNIBrurkRjdKtnrIQKNZkEYOmrzQIdobQ6byGh5Kyr9/S6T2amCqdIBYg4H7kqv7wC7Sul3g+n
	bx8grxhsJ4URA==
X-Received: by 2002:a05:600c:c054:b0:490:4b89:5362 with SMTP id 5b1f17b1804b1-490e56146admr18108955e9.24.1781174939589;
        Thu, 11 Jun 2026 03:48:59 -0700 (PDT)
Received: from localhost.localdomain ([90.173.102.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e2c7ead0sm62775155e9.3.2026.06.11.03.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 03:48:59 -0700 (PDT)
From: =?UTF-8?q?Guillermo=20Rodr=C3=ADguez?= <guille.rodriguez@gmail.com>
To: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"M'boumba Cedric Madianga" <cedric.madianga@gmail.com>,
	Wolfram Sang <wsa@kernel.org>
Cc: =?UTF-8?q?Guillermo=20Rodr=C3=ADguez?= <guille.rodriguez@gmail.com>,
	Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
	linux-i2c@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: stm32f7: truncate clock period instead of rounding it
Date: Thu, 11 Jun 2026 12:48:56 +0200
Message-Id: <20260611104857.242153-1-guille.rodriguez@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_034901_998118_04D243A7 
X-CRM114-Status: GOOD (  15.08  )
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

stm32f7_i2c_compute_timing() derives the I2C clock source period
(i2cclk) with DIV_ROUND_CLOSEST, which may round it up. When the
period is overestimated, all timings computed from it (SCLDEL,
SDADEL, SCLL, SCLH) come out shorter on the wire than calculated,
and the resulting bus rate can exceed the requested speed, violating
the I2C specification minimums for tLOW and tHIGH.

For example, with a 104.45 MHz clock source (e.g. PCLK1, the
reset-default I2C clock source on STM32MP1), i2cclk is rounded from
9.574 ns up to 10 ns. Requesting a 400 kHz fast mode bus with
72/27 ns rise/fall times and no analog/digital filters then produces
an actual bus rate of 415.6 kHz with tLOW = 1254 ns, violating both
the 400 kHz maximum rate and the 1300 ns tLOW minimum of the
specification.

Truncate the period instead, so that it can only be underestimated.
The error then falls on the safe side: the programmed timings come
out slightly longer than computed and the bus runs marginally below
the target rate (375.3 kHz in the example above) while meeting the
specification.

i2cbus is left rounded-to-closest: it is only used as the target of
the clk_error comparison and is never multiplied into the programmed
timings, so nearest rounding remains accurate there.

Fixes: aeb068c57214 ("i2c: i2c-stm32f7: add driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guillermo Rodríguez <guille.rodriguez@gmail.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 53d9df70ebe4..6439620d6bed 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -464,8 +464,13 @@ static int stm32f7_i2c_compute_timing(struct stm32f7_i2c_dev *i2c_dev,
 {
 	struct stm32f7_i2c_spec *specs;
 	u32 p_prev = STM32F7_PRESC_MAX;
-	u32 i2cclk = DIV_ROUND_CLOSEST(NSEC_PER_SEC,
-				       setup->clock_src);
+	/*
+	 * Truncate instead of rounding to closest: if the clock period is
+	 * overestimated, the computed SCL timings will come out shorter on
+	 * the wire, which can push the bus above the target rate and below
+	 * the spec's tLOW/tHIGH minimums.
+	 */
+	u32 i2cclk = NSEC_PER_SEC / setup->clock_src;
 	u32 i2cbus = DIV_ROUND_CLOSEST(NSEC_PER_SEC,
 				       setup->speed_freq);
 	u32 clk_error_prev = i2cbus;
-- 
2.25.1


