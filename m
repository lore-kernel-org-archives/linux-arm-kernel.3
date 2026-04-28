Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66969FF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 20:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DwoEHFbZoqV8IWNbmjT7jydHH5gOnG+Nk6sje2mVw68=; b=fGcQoFgm6IvDeWg+U5NMRWIBK3
	hnfrMEZjNtpNfL0vB+PUTDy1smIFosuhUSWoiG2aWffiZkJGcZGzYqyECM3RLFmVXtMvMsJiigzaT
	cz9Dl5yuEmo1zI4+Sgu0hlG5x0DKtKibZfFin03vj3hm65KDsNm2iustmbgrQfxtYRGz/aF+5AYRh
	RAjFZxxEyPdLjLktm1aoNeFpPymCOxVestryNlaFvfae34pgfk3Aqi0yly11fPyBBXouYBONoBM1H
	P5xkCV03drhfTH4Md3ogj+XL0TGXxEJuceouCRoejcxFA6END3uWCI+0SonIs5WJaXXFJJVa4b9C9
	SAovu1xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHosO-00000002Q5H-47bB;
	Tue, 28 Apr 2026 20:17:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHos2-00000002Pfo-2nPC
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 28 Apr 2026 20:17:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=DwoEHFbZoqV8IWNbmjT7jydHH5gOnG+Nk6sje2mVw68=; b=EavcvoqYB3vrnE0jht9TH61z76
	ywOsbfRsxO8ayD4U5IRn8vWd/qtwvUcwb+97WYnj30UewurSbfIAWgdQZ2oVOntH+vYl4NDxGcD4r
	HE4+WoGVYIPwDp5dTN6Zs6fjlygP6Hk8tt3XPYie5X9P/lQ2Ur1f/mYGsScOv4DLuUI9k+prb2if2
	IE0X9rth9kwwU58mp240NBIccIQLZUth9ZzOCLvYTDOQ/EkfsE2hBqlVAUuj7rc/njg4oUFKkqXG+
	WhRrHkdUjaken7FbfqP0xmAGNiMLwKdV5gCl+0hSsOFaQsdtSbjm5CqTfnVT6y1H9oJ4LY1q2QSBY
	kqb0uB7g==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHorx-000000040hn-2hNH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 20:17:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C3FC3296;
	Tue, 28 Apr 2026 13:17:15 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C44323F763;
	Tue, 28 Apr 2026 13:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777407440; bh=cinOs3FUzEPcdTbTkmYDC2KeojNRYuDSqaYF95xRaEE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NtgNhkQOPzrpXCvuuBj7InMLpjtPlyueQ0+wSAnEIlKG6qH9rONfJiyyoGZGn82OD
	 wxZu2++vFuX3jjcCy9nQ7d55xoFhEgRhP59P5E3qxLf3oKiae7i4G0D8aux6z1eEcC
	 ZnMyHwl1KV0FBl9laXYPeM4doJ9EztzKwJXDVtOU=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: sudeep.holla@arm.com,
	philip.radford@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com,
	marek.vasut+renesas@gmail.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v3 15/15] firmware: arm_scmi: Introduce all_rates_get clock operation
Date: Tue, 28 Apr 2026 21:15:22 +0100
Message-ID: <20260428201522.903875-16-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428201522.903875-1-cristian.marussi@arm.com>
References: <20260428201522.903875-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_211722_143841_2B19FC61 
X-CRM114-Status: GOOD (  23.81  )
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

Add a clock operation to get the whole set of rates available to a specific
clock: when needed this request could transparently trigger a full rate
discovery enumeration if this specific clock-rates were previously only
lazily enumerated.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v2 --> v3
 - collected Reviewed tags
---
 drivers/firmware/arm_scmi/clock.c | 85 +++++++++++++++++++++----------
 include/linux/scmi_protocol.h     |  9 ++++
 2 files changed, 67 insertions(+), 27 deletions(-)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index ba25a9c6d3ae..316d3cd90c81 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -159,10 +159,8 @@ struct scmi_clock_rate_notify_payld {
 
 struct scmi_clock_desc {
 	u32 id;
-	bool rate_discrete;
 	unsigned int tot_rates;
-	unsigned int num_rates;
-	u64 *rates;
+	struct scmi_clock_rates r;
 #define	RATE_MIN	0
 #define	RATE_MAX	1
 #define	RATE_STEP	2
@@ -469,10 +467,10 @@ iter_clk_describe_update_state(struct scmi_iterator_state *st,
 	flags = le32_to_cpu(r->num_rates_flags);
 	st->num_remaining = NUM_REMAINING(flags);
 	st->num_returned = NUM_RETURNED(flags);
-	p->clkd->rate_discrete = RATE_DISCRETE(flags);
+	p->clkd->r.rate_discrete = RATE_DISCRETE(flags);
 
 	/* Warn about out of spec replies ... */
-	if (!p->clkd->rate_discrete &&
+	if (!p->clkd->r.rate_discrete &&
 	    (st->num_returned != 3 || st->num_remaining != 0)) {
 		dev_warn(p->dev,
 			 "Out-of-spec CLOCK_DESCRIBE_RATES reply for %s - returned:%d remaining:%d rx_len:%zd\n",
@@ -486,9 +484,9 @@ iter_clk_describe_update_state(struct scmi_iterator_state *st,
 	if (!st->max_resources) {
 		unsigned int tot_rates = st->num_returned + st->num_remaining;
 
-		p->clkd->rates = devm_kcalloc(p->dev, tot_rates,
-					      sizeof(*p->clkd->rates), GFP_KERNEL);
-		if (!p->clkd->rates)
+		p->clkd->r.rates = devm_kcalloc(p->dev, tot_rates,
+						sizeof(*p->clkd->r.rates), GFP_KERNEL);
+		if (!p->clkd->r.rates)
 			return -ENOMEM;
 
 		/* max_resources is used by the iterators to control bounds */
@@ -507,10 +505,10 @@ iter_clk_describe_process_response(const struct scmi_protocol_handle *ph,
 	struct scmi_clk_ipriv *p = priv;
 	const struct scmi_msg_resp_clock_describe_rates *r = response;
 
-	p->clkd->rates[p->clkd->num_rates] = RATE_TO_U64(r->rate[st->loop_idx]);
+	p->clkd->r.rates[p->clkd->r.num_rates] = RATE_TO_U64(r->rate[st->loop_idx]);
 
 	/* Count only effectively discovered rates */
-	p->clkd->num_rates++;
+	p->clkd->r.num_rates++;
 
 	return 0;
 }
@@ -531,7 +529,13 @@ scmi_clock_describe_rates_get_full(const struct scmi_protocol_handle *ph,
 		.dev = ph->dev,
 	};
 
-	iter = ph->hops->iter_response_init(ph, &ops, 0, CLOCK_DESCRIBE_RATES,
+	/*
+	 * Using tot_rates as max_resources parameter here so as to trigger
+	 * the dynamic allocation only when strictly needed: when trying a
+	 * full enumeration after a lazy one tot_rates will be non-zero.
+	 */
+	iter = ph->hops->iter_response_init(ph, &ops, clkd->tot_rates,
+					    CLOCK_DESCRIBE_RATES,
 					    sizeof(struct scmi_msg_clock_describe_rates),
 					    &cpriv);
 	if (IS_ERR(iter))
@@ -542,12 +546,12 @@ scmi_clock_describe_rates_get_full(const struct scmi_protocol_handle *ph,
 		return ret;
 
 	/* empty set ? */
-	if (!clkd->num_rates)
+	if (!clkd->r.num_rates)
 		return 0;
 
-	if (clkd->rate_discrete)
-		sort(clkd->rates, clkd->num_rates,
-		     sizeof(clkd->rates[0]), rate_cmp_func, NULL);
+	if (clkd->r.rate_discrete && PROTOCOL_REV_MAJOR(ph->version) == 0x1)
+		sort(clkd->r.rates, clkd->r.num_rates,
+		     sizeof(clkd->r.rates[0]), rate_cmp_func, NULL);
 
 	return 0;
 }
@@ -586,7 +590,7 @@ scmi_clock_describe_rates_get_lazy(const struct scmi_protocol_handle *ph,
 	 * If discrete and we don't already have it, grab the last value, which
 	 * should be the max
 	 */
-	if (clkd->rate_discrete && clkd->tot_rates > clkd->num_rates) {
+	if (clkd->r.rate_discrete && clkd->tot_rates > clkd->r.num_rates) {
 		first = clkd->tot_rates - 1;
 		last = clkd->tot_rates - 1;
 		ret = ph->hops->iter_response_run_bound(iter, &first, &last);
@@ -618,16 +622,16 @@ scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph,
 	if (ret)
 		return ret;
 
-	clkd->info.min_rate = clkd->rates[RATE_MIN];
-	if (!clkd->rate_discrete) {
-		clkd->info.max_rate = clkd->rates[RATE_MAX];
+	clkd->info.min_rate = clkd->r.rates[RATE_MIN];
+	if (!clkd->r.rate_discrete) {
+		clkd->info.max_rate = clkd->r.rates[RATE_MAX];
 		dev_dbg(ph->dev, "Min %llu Max %llu Step %llu Hz\n",
-			clkd->rates[RATE_MIN], clkd->rates[RATE_MAX],
-			clkd->rates[RATE_STEP]);
+			clkd->r.rates[RATE_MIN], clkd->r.rates[RATE_MAX],
+			clkd->r.rates[RATE_STEP]);
 	} else {
-		clkd->info.max_rate = clkd->rates[clkd->num_rates - 1];
+		clkd->info.max_rate = clkd->r.rates[clkd->r.num_rates - 1];
 		dev_dbg(ph->dev, "Clock:%s DISCRETE:%d -> Min %llu Max %llu\n",
-			clkd->info.name, clkd->rate_discrete,
+			clkd->info.name, clkd->r.rate_discrete,
 			clkd->info.min_rate, clkd->info.max_rate);
 	}
 
@@ -732,7 +736,7 @@ static int scmi_clock_determine_rate(const struct scmi_protocol_handle *ph,
 	 * If we can't figure out what rate it will be, so just return the
 	 * rate back to the caller.
 	 */
-	if (clkd->rate_discrete)
+	if (clkd->r.rate_discrete)
 		return 0;
 
 	fmin = clk->min_rate;
@@ -746,14 +750,40 @@ static int scmi_clock_determine_rate(const struct scmi_protocol_handle *ph,
 	}
 
 	ftmp = *rate - fmin;
-	ftmp += clkd->rates[RATE_STEP] - 1; /* to round up */
-	ftmp = div64_ul(ftmp, clkd->rates[RATE_STEP]);
+	ftmp += clkd->r.rates[RATE_STEP] - 1; /* to round up */
+	ftmp = div64_ul(ftmp, clkd->r.rates[RATE_STEP]);
 
-	*rate = ftmp * clkd->rates[RATE_STEP] + fmin;
+	*rate = ftmp * clkd->r.rates[RATE_STEP] + fmin;
 
 	return 0;
 }
 
+static const struct scmi_clock_rates *
+scmi_clock_all_rates_get(const struct scmi_protocol_handle *ph, u32 clk_id)
+{
+	struct clock_info *ci = ph->get_priv(ph);
+	struct scmi_clock_desc *clkd;
+	struct scmi_clock_info *clk;
+
+	clk = scmi_clock_domain_lookup(ci, clk_id);
+	if (IS_ERR(clk) || !clk->name[0])
+		return NULL;
+
+	clkd = to_desc(clk);
+	/* Needs full enumeration ? */
+	if (clkd->r.rate_discrete && clkd->tot_rates != clkd->r.num_rates) {
+		int ret;
+
+		/* rates[] is already allocated BUT we need to re-enumerate */
+		clkd->r.num_rates = 0;
+		ret = scmi_clock_describe_rates_get_full(ph, clkd);
+		if (ret)
+			return NULL;
+	}
+
+	return &clkd->r;
+}
+
 static int
 scmi_clock_config_set(const struct scmi_protocol_handle *ph, u32 clk_id,
 		      enum clk_state state,
@@ -1067,6 +1097,7 @@ static const struct scmi_clk_proto_ops clk_proto_ops = {
 	.rate_get = scmi_clock_rate_get,
 	.rate_set = scmi_clock_rate_set,
 	.determine_rate = scmi_clock_determine_rate,
+	.all_rates_get = scmi_clock_all_rates_get,
 	.enable = scmi_clock_enable,
 	.disable = scmi_clock_disable,
 	.state_get = scmi_clock_state_get,
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 5552ac04c820..c710107c2120 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -40,6 +40,12 @@ struct scmi_revision_info {
 	char sub_vendor_id[SCMI_SHORT_NAME_MAX_SIZE];
 };
 
+struct scmi_clock_rates {
+	bool rate_discrete;
+	unsigned int num_rates;
+	u64 *rates;
+};
+
 struct scmi_clock_info {
 	char name[SCMI_MAX_STR_SIZE];
 	unsigned int enable_latency;
@@ -85,6 +91,7 @@ enum scmi_clock_oem_config {
  *		    clock calculating the closest allowed rate.
  *		    Note that @rate is an input/output parameter used both to
  *		    describe the requested rate and report the closest match
+ * @all_rates_get: get the list of all available rates for the specified clock.
  * @enable: enables the specified clock
  * @disable: disables the specified clock
  * @state_get: get the status of the specified clock
@@ -104,6 +111,8 @@ struct scmi_clk_proto_ops {
 			u64 rate);
 	int (*determine_rate)(const struct scmi_protocol_handle *ph, u32 clk_id,
 			      unsigned long *rate);
+	const struct scmi_clock_rates __must_check *(*all_rates_get)
+		(const struct scmi_protocol_handle *ph, u32 clk_id);
 	int (*enable)(const struct scmi_protocol_handle *ph, u32 clk_id,
 		      bool atomic);
 	int (*disable)(const struct scmi_protocol_handle *ph, u32 clk_id,
-- 
2.53.0


