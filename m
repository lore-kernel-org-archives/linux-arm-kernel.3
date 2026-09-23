Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6534C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 20:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/NLzzVKxNDn2ENtNLz5RF0HuOFGSUxWDx/tiLwjYhuM=; b=mYFD1AGiEFLWGvT2zKbj+21HPP
	sxhME+RJv6K/MtfAhir6Gl01nUau0a1Bk3LDsXAYFnEw0xQfu4vzg6IHd7gGYGwwnkSfj3QNATvqJ
	NwLCbbfEv12i6EMOuYi1oVYSakRIXz2z4xMga6qFH9f6VtgoAbNPSW/J5vV8TPmI1WNgNjXJGvmGr
	KzigSyuMjF0Nm3lNPeBSmhpvACDN+9bWWemhB1nG+LjJ+9f88j8xn3oQQy2ns+BbzLw2J1MrsD7RU
	v1cTdjUigVbtZZ1wowiAxFxjQKJLF+NE+k87VB4XqoEqRkkjgyDqYHYxu/6HVA/vB7/j9uKHMtEGc
	qMHvBcyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Tsh-00000009VRW-34aD;
	Wed, 23 Sep 2026 20:47:55 +0000
Received: from mail-wr2-f35.google.com ([74.125.225.99])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Tsb-00000009VOt-0eQr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 20:47:50 +0000
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885a1480a2so803038f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 13:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790196467; x=1790801267; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/NLzzVKxNDn2ENtNLz5RF0HuOFGSUxWDx/tiLwjYhuM=;
        b=fFK6MwUufOAV5cM7kj/NIBRGGfAaW3+tNoyHGUfhTgtR9E2kZT48AF9rMmbHWrGRmc
         TvVfAB5Z9pcsG+WtH0OgyKJLRmZhd8QzTp4InY28PQOZMwhYK1rxOjZ9HjH20UbZp8AM
         GakPKS0y6XxMPrEOD7vtMNkN707z1pPKrKcmkx9GX8KndpC4VpsRrB7SVvVw0yJbA7aE
         Ehed9YUgOhatjEieJle++Q/QtEOlB07pmCLkmUuSE+3QApedUM0qeEWrnVwrW7RdWm6u
         qdoMMGMPr7k4bUJWItyx4JSos85sqR/GzVhLJUKOOyXbADS42bh/dyF6dMYSW4rXqYNV
         v1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790196467; x=1790801267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/NLzzVKxNDn2ENtNLz5RF0HuOFGSUxWDx/tiLwjYhuM=;
        b=Vn4eEZJX6+SNla7UG72cF5UF/ZhwL1oVl0/EIpZeY+2JCLsuABSbDihKCZuBZCaWXl
         ez3Dx8Vmw1Bj7sm6QUFx27pWtvoijjKjI0tL40/lMmGTFU9zMZtx1W9IEkCaWpbIGHz5
         JXIFnz00cpI3u5UdzwM4fV5QmcW3LxB//J2YNb4+SUOycdJOo0xeS5PI+A4PnbNckuil
         63RtUneUOczk1labpDhV4GMVy4aQnm3wgHv/XTUa3Tp1UP8PX0ipq+ptc3MW7CdrMIpS
         g0LcDHlfixQrrtlIAceow0amRT2UFjK30iGJ7CXZFeO+RRhLP+b9hAAqcHWNUB12fYTt
         yz/w==
X-Forwarded-Encrypted: i=1; AKwUvByQ98a6y/SlM4el2Bhtk9WIEgjfGVv8cmgHM+JDMUetb0PRz7Yj+bcjIEQgHMXWBJcqVhiqRLDbzsCBgPV85KAg@lists.infradead.org
X-Gm-Message-State: AFuF++mWfYwlCHt2DqFcFL9EZAezE1aojQRAz9IS4GomLmou2xBAj2El
	uCG7if0ECR+AmUEVN4YwvIt7gOVqyjuH5G60oH/2EWbSuTBIaeY6EnE2aXglBcx69ak=
X-Gm-Gg: AYBFou3m7WuQJ4D6SDcbxBGcIfwzQsumXJg8JlqBirP65QFevbNL5Ug6pC5tn5nEndX
	DfDfSbjBeL84HOp/TN5Atc6tHtQaanWVahvTeObThkc2k8matyq/2sd9RCFk5FrbsNqTU55JX3A
	vsbZpECIxJMxbE45xgaR1E+2Zf8hRC+RXTD9TVGHZneMj03dogfoIC09jy+v3ixRio7O9hAnCTU
	0O/OZ+OqCrBMr7PMZVI6UlhGuGm9EHuV4f21abb3xQ832SzcPkOPrgQthQN/KJ2C1HGYWbMXrWO
	h9bC/Zp38qUN9dYFrtLyV9o8je8qEgmgYibe1axLHwzGCywYPcrfa0YkrCRtnqwwv+yLoDQGYts
	s500Dt4aEv6ccohlPbcTbY3O4o74nO/UZmSl+uI4cIaaXddJe2nfjMn67BDZLlgMvaP22ZJ1EHM
	7DayU4REpDsuB6IEF49m3xnmlIH+r7+If6CMTRDm+aot9GRfct4VIjEh9dKHdBDCeSOL9zMSCdf
	z1VmUbTblLRYtWOng==
X-Received: by 2002:a05:6000:71a:b0:487:40d:af29 with SMTP id ffacd0b85a97d-488716f76edmr444910f8f.36.1790196467054;
        Wed, 23 Sep 2026 13:47:47 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868889337sm9555748f8f.34.2026.09.23.13.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:47:46 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 23 Sep 2026 22:47:33 +0200
Subject: [PATCH net-next v3 3/5] net: stmmac: sun55i: Make the delay step
 configurable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-allwinner-a733-gmac-support-v3-3-15735155a789@baylibre.com>
References: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
In-Reply-To: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Andre Przywara <andre.przywara@arm.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3766; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=u9upVCC3m/gwC2XGPIk9ZtnVEycENGqh8TgoKKLgrfg=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlbrN5++fKN4ddvzswl7GeD9uxYOzue282oeJfBhyx2d
 Xbd7V47OkpZGMS4GGTFFFlquKvF30lqfZk1Xec2zBxWJpAhDFycAjCRaD1GhmnNNr1V5r77khQ4
 HbX25/9bvu3Dzwuyn7OsgrnebXjtspyRYdbv72zn5HrC7edE8K44+fH1tYCm98+630TxzXNqrpr
 /ghEA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_134749_230898_DCF4B079 
X-CRM114-Status: GOOD (  17.02  )
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

The driver assumes a 100ps step for both TX and RX clock delays, which
does not match the A733 GMAC210.

Move the TX and RX delay steps to the match data and factor the delay
validation into a helper. The A523 keeps the 100ps step to preserve the DT
ABI, although the vendor reports actual steps of 180ps for TX and 530ps
for RX.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c | 58 +++++++++++++++-------
 1 file changed, 39 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
index c4df53285007..e759311f40fc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
@@ -42,6 +42,8 @@ struct sun55i_gmac_data {
 	int (*init_resources)(struct platform_device *pdev,
 			      struct sun55i_gmac *gmac);
 	unsigned int flags;
+	u32 txdly_step_ps;
+	u32 rxdly_step_ps;
 	u32 offset;
 };
 
@@ -62,38 +64,47 @@ static int sun55i_gmac200_init_resources(struct platform_device *pdev,
 	return 0;
 }
 
+static int sun55i_gmac200_validate_delay(struct device *dev, const char *dir,
+					 u32 *val, u32 step, u32 max)
+{
+	if (*val % step)
+		return dev_err_probe(dev, -EINVAL,
+				     "%s-delay must be a multiple of %ups\n", dir, step);
+	max *= step;
+	if (*val > max)
+		return dev_err_probe(dev, -EINVAL,
+				     "%s clock delay exceeds maximum (%ups > %ups)\n",
+				     dir, *val, max);
+	*val /= step;
+	dev_dbg(dev, "set %s-delay to %x\n", dir, *val);
+
+	return 0;
+}
+
 static int sun55i_gmac200_setup(struct device *dev,
 				struct plat_stmmacenet_data *plat,
 				const struct sun55i_gmac *gmac)
 {
 	struct device_node *node = dev->of_node;
-	u32 val, reg = 0;
+	u32 val, step, max, reg = 0;
 	int ret;
 
 	if (!of_property_read_u32(node, "tx-internal-delay-ps", &val)) {
-		if (val % 100)
-			return dev_err_probe(dev, -EINVAL,
-					     "tx-delay must be a multiple of 100ps\n");
-		val /= 100;
-		dev_dbg(dev, "set tx-delay to %x\n", val);
-		if (!FIELD_FIT(SYSCON_ETXDC_MASK, val))
-			return dev_err_probe(dev, -EINVAL,
-					     "TX clock delay exceeds maximum (%u00ps > %lu00ps)\n",
-					     val, FIELD_MAX(SYSCON_ETXDC_MASK));
+		step = gmac->data->txdly_step_ps;
+		max = FIELD_MAX(SYSCON_ETXDC_MASK);
+		ret = sun55i_gmac200_validate_delay(dev, "tx", &val, step, max);
+		if (ret)
+			return ret;
 
 		reg |= FIELD_PREP(SYSCON_ETXDC_MASK, val);
 	}
 
 	if (!of_property_read_u32(node, "rx-internal-delay-ps", &val)) {
-		if (val % 100)
-			return dev_err_probe(dev, -EINVAL,
-					     "rx-delay must be a multiple of 100ps\n");
-		val /= 100;
-		dev_dbg(dev, "set rx-delay to %x\n", val);
-		if (!FIELD_FIT(SYSCON_ERXDC_MASK, val))
-			return dev_err_probe(dev, -EINVAL,
-					     "RX clock delay exceeds maximum (%u00ps > %lu00ps)\n",
-					     val, FIELD_MAX(SYSCON_ERXDC_MASK));
+		step = gmac->data->rxdly_step_ps;
+		max = FIELD_MAX(SYSCON_ERXDC_MASK);
+		ret = sun55i_gmac200_validate_delay(dev, "rx", &val, step, max);
+		if (ret)
+			return ret;
 
 		reg |= FIELD_PREP(SYSCON_ERXDC_MASK, val);
 	}
@@ -175,6 +186,15 @@ static const struct sun55i_gmac_data sun55i_a523_gmac200_data = {
 	.init_resources = sun55i_gmac200_init_resources,
 	.flags = STMMAC_FLAG_SPH_DISABLE,
 	.offset = 0x34,
+	/*
+	 * The actual delay steps reported by the manufacturer are:
+	 * - Tx: 180ps
+	 * - Rx: 530ps
+	 *
+	 * Correcting them would break the DT ABI of the published DTs.
+	 */
+	.txdly_step_ps = 100,
+	.rxdly_step_ps = 100,
 };
 
 static const struct of_device_id sun55i_gmac200_match[] = {

-- 
2.53.0


