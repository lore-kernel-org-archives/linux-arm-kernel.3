Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8B5CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 14:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YaXAl32+bJwu3Ubi8gzjduwO4aL0flsfqwPdvVWa9Kc=; b=b0PL5EhhYfhU7oSgA3U4B2JACT
	Y7hndLzbbCY302o/06PwsvgAq4VH3zylxqNJfsNAXYySb/4cPv1UIEW7vnT7D1fRTCJirg8shuGFn
	VjfdUQhK7/cpOiusM2qmtOJH7TwtfauRMeYh/GbVuOwnkvsrlU0aSKkMl0pRDGD+CHk0Ck8KEE+me
	cry20OYAAJy4OEx6CBldyiG/sphg7MXqAvQml1+NTBp1+4PszRjN/0ovOHDADJTbZgEf3kHeGEiP2
	/ZgFtd8zcuF4MWWrUCDEpEZHbSDGazavFobpKoROjbKGwzx1z3YpvhQ3C1Lf2GUysXZcLPKUsc0w0
	Eqy9EMYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCeNG-0000000Bn8K-1IoT;
	Fri, 02 Oct 2026 14:36:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCeNF-0000000Bn8B-1Hqh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 14:36:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A6223406AE;
	Fri,  2 Oct 2026 14:36:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E959E1F000FF;
	Fri,  2 Oct 2026 14:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790951791;
	bh=YaXAl32+bJwu3Ubi8gzjduwO4aL0flsfqwPdvVWa9Kc=;
	h=From:To:Cc:Subject:Date;
	b=kc1hpE5AqE8Xj5dP3BGj9j9it+sPlQj6jilIyzY67TjShxNrN4rl30fvv013IJaT9
	 mKPB3v95kTB4r1MIv613BRAyghPLsW6HpMRbP2RjJnRI6kAohzwx3dDvAv6s61b/nC
	 tB8+hHgg6fN4jLgCMWHthvl4maCc4u5V6HvpR7NkmOOxGcEMvvikTqrv5LioAOXIYw
	 QV+DgtpQHRCdkJxqdPBkQL4HwgRKcPxNLJNj3DJNUTtv9FddYZHSnuNLE3RO2icNCk
	 kKJFgVAHGmkqQJz/du6zKww+Hc6WxvW5qG7p+aQDfrrNL7cdKgdU4ZAM0fqKK7+zjf
	 UvRYhUmAqAy/g==
From: Thorsten Blum <blum@kernel.org>
To: Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Can Peng <pengcan@kylinos.cn>,
	Linus Walleij <linusw@kernel.org>
Cc: Thorsten Blum <blum@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwrng: stm32 - drop redundant initializations
Date: Fri,  2 Oct 2026 16:35:53 +0200
Message-ID: <20261002143556.43214-2-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1465; i=blum@kernel.org; h=from:subject; bh=slpYjfvppyIYCvee4mbPKEgF5KZtNosKvyE5AxWLmic=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFn7D/owf9lk7Cno7JfuESMu8/PI270a6mrOc8vnT5/89 kzoxxlyHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjARLU1Ghofq92Qk28/deKOk OJ3ts3cuv/qav7n6V5dsdJmzkeG36UyG/w5Za1ZdKns+QcviBBdL2iXuW8FrCyamTDcXbcy/oJ8 4ixMA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
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

The variables are reassigned before their initial values are read - drop
the redundant initializations.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 drivers/char/hw_random/stm32-rng.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/char/hw_random/stm32-rng.c b/drivers/char/hw_random/stm32-rng.c
index f5bfe54c01dc..d3fc910f674a 100644
--- a/drivers/char/hw_random/stm32-rng.c
+++ b/drivers/char/hw_random/stm32-rng.c
@@ -156,7 +156,7 @@ static int stm32_rng_conceal_seed_error_cond_reset(struct stm32_rng_private *pri
  */
 static int stm32_rng_conceal_seed_error_sw_reset(struct stm32_rng_private *priv)
 {
-	unsigned int i = 0;
+	unsigned int i;
 	u32 sr = readl_relaxed(priv->base + RNG_SR);
 
 	writel_relaxed(sr & ~RNG_SR_SEIS, priv->base + RNG_SR);
@@ -187,7 +187,7 @@ static int stm32_rng_read(struct hwrng *rng, void *data, size_t max, bool wait)
 {
 	struct stm32_rng_private *priv = container_of(rng, struct stm32_rng_private, rng);
 	unsigned int i = 0;
-	int retval = 0, err = 0;
+	int retval, err;
 	u32 sr;
 
 	retval = pm_runtime_resume_and_get(priv->dev);
@@ -264,7 +264,7 @@ static uint stm32_rng_clock_freq_restrain(struct hwrng *rng)
 {
 	struct stm32_rng_private *priv =
 	    container_of(rng, struct stm32_rng_private, rng);
-	unsigned long clock_rate = 0;
+	unsigned long clock_rate;
 	uint clock_div = 0;
 
 	clock_rate = clk_get_rate(priv->clk_bulk[0].clk);

