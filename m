Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBAECD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 15:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ro1i2bo/fiOtrp+LZ50fadTzcPAmmFr3V+jYLq5LTYI=; b=VYcm3zuyjyhYl6MqsyqaCOLeUv
	hjBTItRhnHN1drVAVxB9i/DdJs56W1PmlCq2sfwlCQe2hzI2Dedn7BP+V1PDQhYcYzntINB/7MjbH
	Inv4YVPSlew1IEmiRyurYSz0lPxbJPMdnCTTTS5AjlAOnWayftwzTexjLhN/CreIoFPSUhwpfvaE/
	C62tVUB52dcSckqHCaYAXjxkm+T9ZFCv/nC8mR3kf5T3pwQd5W+uIOI0G0loZ9ZAs7XpCluGpmgmT
	nRx+aP7UFy51grUKyJWirjM1dqOtU0Eov8ef6qJKco4+jxcXhmXU0q/IJTVA171stJhJNf+/2gzvE
	OXlxIcZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNDZ-00000006rjz-1L1v;
	Fri, 08 May 2026 15:34:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNDP-00000006rX8-2aOi
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 08 May 2026 15:34:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ro1i2bo/fiOtrp+LZ50fadTzcPAmmFr3V+jYLq5LTYI=; b=kw5v2MgLAB1HFJxgA5C86Dqvlf
	D3G0eS4J3DGAgafJ8QT8UXRkLOxDi0in7L7vZ/hNimr9ZqAp0e8PcicJJaPxeQNfA22co41ixt5R2
	D76rGyIBoSD2SnWBj8UJTYeE0vxPCA9T8667ITBvO7dbFU8Tq0lmRcFkB6WdXfVsmGfcI2ZqaajPF
	mRFXC5a/bQP6VietaU8Oma9T4jRGNtUH6DF0Mvu/sy7Ep2VuM5LSkTMzvaiiz3cqnmwvzaPisgGEK
	6O8TLPZ3jWMbKDQEQ4Lk2H3b9dvqvClqwawWr19hG0X6falJh68r/kAXNBet3EnoYH19NfIFK28Vg
	SMn0UEQw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNDM-00000006iRA-1BvY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 15:34:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32CBB35A1;
	Fri,  8 May 2026 08:34:02 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2114F3F836;
	Fri,  8 May 2026 08:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778254447; bh=At/1NpD+zdqtqKE6HMLapbaZvJjKAhoJJTEqLPkqWfI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QZ6TouT3ZGJ7qEAg8FD3TpLIafElxJjwmuyEGROlbpoHTelSmQwt3xHbAexTMv1dk
	 2L6z3dliHwtwV0aUvqG+w/ZLWio+J95UzuVfN+njTOvaq6gJimMwPQ/z/P1KJ1Auh1
	 2r+MPEoumi0f/gpx79hdaUubalaOalb1NO2F2X3w=
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
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v4 13/15] firmware: arm_scmi: Use bound iterators to minimize discovered rates
Date: Fri,  8 May 2026 16:32:58 +0100
Message-ID: <20260508153300.2224715-14-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260508153300.2224715-1-cristian.marussi@arm.com>
References: <20260508153300.2224715-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_163408_910759_F5837748 
X-CRM114-Status: GOOD (  18.33  )
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

Clock rates are guaranteed to be returned in ascending order for SCMI clock
protocol versions greater than 1.0: in such a case, use bounded iterators
to minimize the number of message exchanges needed to discover min and max
rate.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v3 -> v4
 - Fixed dev_dbg() to printout tot_rates [Geert]
 - Fixed broken build by renaming to iterator_bound_cleanup()
v1 --> v2
 - fixed final ret value in scmi_clock_describe_get
---
 drivers/firmware/arm_scmi/clock.c | 90 +++++++++++++++++++++++++++----
 1 file changed, 81 insertions(+), 9 deletions(-)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index 8ce889dfc87b..955bb9565ce3 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -160,6 +160,7 @@ struct scmi_clock_rate_notify_payld {
 struct scmi_clock_desc {
 	u32 id;
 	bool rate_discrete;
+	unsigned int tot_rates;
 	unsigned int num_rates;
 	u64 *rates;
 #define	RATE_MIN	0
@@ -483,15 +484,16 @@ iter_clk_describe_update_state(struct scmi_iterator_state *st,
 	}
 
 	if (!st->max_resources) {
-		int num_rates = st->num_returned + st->num_remaining;
+		unsigned int tot_rates = st->num_returned + st->num_remaining;
 
-		p->clkd->rates = devm_kcalloc(p->dev, num_rates,
+		p->clkd->rates = devm_kcalloc(p->dev, tot_rates,
 					      sizeof(*p->clkd->rates), GFP_KERNEL);
 		if (!p->clkd->rates)
 			return -ENOMEM;
 
 		/* max_resources is used by the iterators to control bounds */
-		st->max_resources = st->num_returned + st->num_remaining;
+		p->clkd->tot_rates = tot_rates;
+		st->max_resources = tot_rates;
 	}
 
 	return 0;
@@ -514,8 +516,8 @@ iter_clk_describe_process_response(const struct scmi_protocol_handle *ph,
 }
 
 static int
-scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph, u32 clk_id,
-			      struct clock_info *cinfo)
+scmi_clock_describe_rates_get_full(const struct scmi_protocol_handle *ph,
+				   struct scmi_clock_desc *clkd)
 {
 	int ret;
 	void *iter;
@@ -524,7 +526,6 @@ scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph, u32 clk_id,
 		.update_state = iter_clk_describe_update_state,
 		.process_response = iter_clk_describe_process_response,
 	};
-	struct scmi_clock_desc *clkd = &cinfo->clkds[clk_id];
 	struct scmi_clk_ipriv cpriv = {
 		.clkd = clkd,
 		.dev = ph->dev,
@@ -544,17 +545,88 @@ scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph, u32 clk_id,
 	if (!clkd->num_rates)
 		return 0;
 
+	if (clkd->rate_discrete)
+		sort(clkd->rates, clkd->num_rates,
+		     sizeof(clkd->rates[0]), rate_cmp_func, NULL);
+
+	return 0;
+}
+
+static int
+scmi_clock_describe_rates_get_lazy(const struct scmi_protocol_handle *ph,
+				   struct scmi_clock_desc *clkd)
+{
+	struct scmi_iterator_ops ops = {
+		.prepare_message = iter_clk_describe_prepare_message,
+		.update_state = iter_clk_describe_update_state,
+		.process_response = iter_clk_describe_process_response,
+	};
+	struct scmi_clk_ipriv cpriv = {
+		.clkd = clkd,
+		.dev = ph->dev,
+	};
+	unsigned int first, last;
+	void *iter;
+	int ret;
+
+	iter = ph->hops->iter_response_init(ph, &ops, 0, CLOCK_DESCRIBE_RATES,
+					    sizeof(struct scmi_msg_clock_describe_rates),
+					    &cpriv);
+	if (IS_ERR(iter))
+		return PTR_ERR(iter);
+
+	/* Try to grab a triplet, so that in case is NON-discrete we are done */
+	first = 0;
+	last = 2;
+	ret = ph->hops->iter_response_run_bound(iter, &first, &last);
+	if (ret)
+		goto out;
+
+	/* If discrete grab the last value, which should be the max */
+	if (clkd->rate_discrete && clkd->tot_rates > 3) {
+		first = clkd->tot_rates - 1;
+		last = clkd->tot_rates - 1;
+		ret = ph->hops->iter_response_run_bound(iter, &first, &last);
+	}
+
+out:
+	ph->hops->iter_response_bound_cleanup(iter);
+
+	return ret;
+}
+
+static int
+scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph,
+			      u32 clk_id, struct clock_info *cinfo)
+{
+	struct scmi_clock_desc *clkd = &cinfo->clkds[clk_id];
+	int ret;
+
+	/*
+	 * Since only after SCMI Clock v1.0 the returned rates are guaranteed to
+	 * be discovered in ascending order, lazy enumeration cannot be use for
+	 * SCMI Clock v1.0 protocol.
+	 */
+	if (PROTOCOL_REV_MAJOR(ph->version) > 0x1)
+		ret = scmi_clock_describe_rates_get_lazy(ph, clkd);
+	else
+		ret = scmi_clock_describe_rates_get_full(ph, clkd);
+
+	if (ret)
+		return ret;
+
+	clkd->info.min_rate = clkd->rates[RATE_MIN];
 	if (!clkd->rate_discrete) {
 		clkd->info.max_rate = clkd->rates[RATE_MAX];
 		dev_dbg(ph->dev, "Min %llu Max %llu Step %llu Hz\n",
 			clkd->rates[RATE_MIN], clkd->rates[RATE_MAX],
 			clkd->rates[RATE_STEP]);
 	} else {
-		sort(clkd->rates, clkd->num_rates,
-		     sizeof(clkd->rates[0]), rate_cmp_func, NULL);
 		clkd->info.max_rate = clkd->rates[clkd->num_rates - 1];
+		dev_dbg(ph->dev, "Clock:%s Num_Rates:%u -> Min %llu Max %llu\n",
+			clkd->info.name, clkd->tot_rates,
+			clkd->info.min_rate, clkd->info.max_rate);
 	}
-	clkd->info.min_rate = clkd->rates[RATE_MIN];
 
 	return 0;
 }
-- 
2.53.0


