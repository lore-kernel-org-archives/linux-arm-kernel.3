Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39302C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 21:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EwWclVah/YRkPJaFZHhqL/2zz+tz0AvliH2xKO7SDhw=; b=kxl49nhgw3DQlyccvCIclXE+i/
	2Z2ZH8b7Ni3W6zylgodnldz4ZEU/J+qBGCRaiah2Bh8mrQO3yWUJurSKXB4jPzgBGRYKSDJuR+IBF
	vFqGVy8KtcsVq5WDMSTYFvjOLBe6UZMKtmhvNSOEX0r6Ul+OLoyAcRHgkIy+7XmxqHX3SuZiSoDc6
	eg+tcisg3lcfFBsV41DdCebyJ5JTEw7u8jqkC86dJpYRoSHXcExwDTeO7SpAKr8yNamEc77+Gyeu6
	FydstSzeNnkMVqr0dRxcNZNgqhNs59AnJHwW/QiiTdJSQzqSZZr+qqKsjCW1V3MTv9EnlDmlCkQ1k
	9F2apVgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTof0-000000040MN-1x80;
	Mon, 23 Jun 2025 21:25:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTkB6-00000003SCm-1tqj
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Jun 2025 16:37:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=EwWclVah/YRkPJaFZHhqL/2zz+tz0AvliH2xKO7SDhw=; b=MsH3/Sp27gVJoJMxo++aSNVAcW
	WzBJI4PLFi8VRJBmYzFGEc9LHcbwM+jFuCvzhK3hCird+HQYgKq03bV7cIxVPEnSw+9d5hvB5IB+4
	7HX+vDNEGKxNNBlSvMDc5eWMmec8EnJuIzkefxzKQ1lnrhpladQrk6oAHMZQezOIapZq1+98vYuZ2
	9t3b86b+kdYtH1KfCGQd9EMkY0zpoWGXyi6jOM1IjKgHQidy/knfyecA8xOiwlGLPMXdE/YQMuxfk
	NmdBlY8+3BuhiomFZHdGfnNAH24xKPJOHtTMKIa42W50RIup4TaMeYGjOcqItP4e+TqxODQxhdDCQ
	USgJGC6A==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTkB3-00000005G2E-1pPl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 16:37:51 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4530921461aso33046975e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 09:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750696667; x=1751301467; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EwWclVah/YRkPJaFZHhqL/2zz+tz0AvliH2xKO7SDhw=;
        b=XkEZI2n9TtbeIWfi/ohj2NsUuHHzF9pAyYjLANM8ke97oJmA9LaJ8KdCa87RBDgkBd
         NmhlKwxh5BDnZSxyQ1uAH+me5NO2hA+Oj2DwqwBRcSCXovN1ziRg1Fz4LrKrr2EqHJTe
         0995KVGCvwhfBH/XMfMvaxte3n/nGeMHQx+zxSbSdQDtDspFAa1vWK6ixoxPAzd3vof3
         GSUh81is/yK8x+MXIPq62S95RASu9gD+fVI5jKbbybCy3oJUWvMT8zLw+Mjp6TElTqBj
         liAMkKqwpIf0uHZVV+JKKL8ny783KGIH57Ru/F33A9QQiUev4g+Fmw/HUuAKaJkeRctJ
         Qoiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750696667; x=1751301467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EwWclVah/YRkPJaFZHhqL/2zz+tz0AvliH2xKO7SDhw=;
        b=POvPVOyC+DfqTx5060y7wWOfz3RpCd6MkmAU9St5s7dypzynd3VURed1dRAAJgUvug
         U+1oq5msspPDcC+UWlkJ5txMqO9gXvU9G2poTy0gQ1z6hrBCWRNjxqZws5D4PXmmKhhy
         CVV/DGXHMEASYP/RDOUqU1Fu80EbZPbjuP0+rIpLs2YO14v3I5pEspv7Sp6wfnEvXQh9
         V+3Cbtf4Ci0AbclUyldiEL6av5iDp53qrC1Bp10u+xaG2PJJEITts9iXLViCmY7aiYD3
         3O7uXQRMAoejUs1sOIHEZRsCEmmdLZ5Gw3IEcWImS6OEHDeKE8hf1JlMAZFWCtVmaKvP
         o5Lw==
X-Forwarded-Encrypted: i=1; AJvYcCVXMpXS4Y1wMF00qrglkbkz8Y09gBIB0bd0KjpFsAUQ5YY6X2/1+Y8pP3SMSEA2bE8NHHm5GlbeMSh8OamHR+up@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw1LvIWR8qjL7WHfJRt3i1VdRIbaizfYTrYS9+znzoZqbrscL2
	V1ZgHrR61geW2Kd4m5mH8A7Cgt1TczWwJ/Ay3vKJk5turfcs7PILPsk9dOGpkMOurFk=
X-Gm-Gg: ASbGncvExqFA9XCFdoyhH/PDNJBoEv6lkUBxWM/oJ0/rCo6Cg1qP8lyfg0bBJan9iRM
	tKtmvWF9hdKI5z3fp4PQuQ3CazmtW9Zp2N+4n8JflJAWKRAPGG1rem/XGv9Iwd2Vkq3UJbzX8Fp
	ZCwOSMbR83gzU93847BPBPNqac79QAD9Ct/MSuCwXOxn8Q2NXJvGoxJpkWy8stef3bLAm0CKUl1
	rkQbKTApiuk7FaL3jRVBEOSWI2cpDemNjq1fRwN0K0/LIokOkd/R3bHs1ec5oTWCb2OzpBm8gii
	M7rResNgUIqwfjLx2vVafdfTEpLqY0zQ8ttJF85TCWcB8x+xYaxJ690dv8RCf8H3x9Ftt+CrQV+
	1
X-Google-Smtp-Source: AGHT+IGAt5JaqbdFh4BbIml93Yq1HshC6NamUyp60cmO4+k32Myv7A2N/ioGnh73m5I74idOIRyUww==
X-Received: by 2002:a05:600c:3acd:b0:43c:fe5e:f040 with SMTP id 5b1f17b1804b1-453654ce6famr106759915e9.23.1750696667135;
        Mon, 23 Jun 2025 09:37:47 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:7b0f:c522:cad6:acd1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a6d0f1011fsm9852947f8f.7.2025.06.23.09.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 09:37:46 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 23 Jun 2025 18:37:37 +0200
Subject: [PATCH v4 1/3] clk: amlogic: get regmap with clk_regmap_init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-amlogic-clk-drop-clk-regmap-tables-v4-1-ff04918211cc@baylibre.com>
References: <20250623-amlogic-clk-drop-clk-regmap-tables-v4-0-ff04918211cc@baylibre.com>
In-Reply-To: <20250623-amlogic-clk-drop-clk-regmap-tables-v4-0-ff04918211cc@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12558; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=haY78uNrJ4Ey96lQHgkTqTLRLQNigrpN7McUZ9yvUI8=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoWYLWTStrX8Vq0C/y4WEwnMx+xzJ5bfzACITN4
 BpgCtCZtEyJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaFmC1gAKCRDm/A8cN/La
 hTlQD/9zJ+YCaovCXEkERY3jqQOHRcOj8CZlJLBlVLIMWBuSEZohaMnVLPoZO/6z+2YfLIaIMGd
 +Slj2ZL3/PSgkq5dUXXBmEkFpFG4FP1/XvYK+CE2TrYI7nQbQRPND/SIbI+zCEr/1JxxGkglv6L
 S5wXeLXASQdpxjV/09qhNtiEhwEZQdfdzzpGcMCCecaoQNYFapZpvOlmHzTltU2RcmPxatiAuCB
 4mSVE4wXTI0B3O1OkxIqt/1NOjvaPPtV1QT1zL8O3Lu58EMNmdtV1D0wlkt7sxPCl0T/fTf+5Am
 iGiVSXm3LgRtlOR01wIbpiG+Xz0D18nAffHOEFB/DJ7buW4CUvzmVstx5cGPa6Y3bpgG1M4kv3i
 xl7RyF/M/w0j/PY57U5TLBaESDb7pd/aSZwpb0wxEFSrZjYYxQ3RtYZnaCLym6CpQu8T0h09ljv
 efHN7BczdaHu4JdnZrCCOZHlYPXImTtaiOqcKzhJKH9mEYAc8EOqSLpO/wmptMEkLetONiIZcW2
 74W6m6/dPSNoX0SpLE/TA0b7BRxPx2F372y54B+s6y1Vx5kpwinZx5XLNuzY1+IN/FYCGNuLtPK
 Cf+HyrKUDt4Zt1evjChZobTrXcZ6w6DsLdroTSpTtT8NxVk2S6nvSB251E311mQN0ocd1SHUNhT
 jJmsJleg1esgoRg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_173749_784853_7D0662F1 
X-CRM114-Status: GOOD (  23.39  )
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

Add clk_regmap_init() and use it with all clock types which derive from
clk_regmap. This helps initialise clk_regmap clocks without requiring
tables to keep track of the clock using this type.

The way it is done couples clk_regmap with the controllers, which is not
ideal. This is a temporary solution to get rid of the tables. The situation
will eventually be improved.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/Kconfig          |  1 +
 drivers/clk/meson/clk-cpu-dyndiv.c |  1 +
 drivers/clk/meson/clk-dualdiv.c    |  2 ++
 drivers/clk/meson/clk-mpll.c       |  6 +++++
 drivers/clk/meson/clk-phase.c      | 11 +++++++++
 drivers/clk/meson/clk-pll.c        |  7 ++++++
 drivers/clk/meson/clk-regmap.c     | 49 ++++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/clk-regmap.h     |  4 ++++
 drivers/clk/meson/sclk-div.c       |  5 ++++
 drivers/clk/meson/vclk.c           |  2 ++
 drivers/clk/meson/vid-pll-div.c    |  1 +
 11 files changed, 89 insertions(+)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index 5c669b2e2f268c7608c8d9c64bba3c5b54da39b2..7197d23543b8bb8a9020cde316170b50bc359a6c 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -5,6 +5,7 @@ menu "Clock support for Amlogic platforms"
 config COMMON_CLK_MESON_REGMAP
 	tristate
 	select REGMAP
+	select MFD_SYSCON
 
 config COMMON_CLK_MESON_DUALDIV
 	tristate
diff --git a/drivers/clk/meson/clk-cpu-dyndiv.c b/drivers/clk/meson/clk-cpu-dyndiv.c
index cb043b52b65d8a6ae0933935f07fb14c40855700..83aedbfd2891d1099d4fb5e25d2306a8328f29db 100644
--- a/drivers/clk/meson/clk-cpu-dyndiv.c
+++ b/drivers/clk/meson/clk-cpu-dyndiv.c
@@ -61,6 +61,7 @@ static int meson_clk_cpu_dyndiv_set_rate(struct clk_hw *hw, unsigned long rate,
 };
 
 const struct clk_ops meson_clk_cpu_dyndiv_ops = {
+	.init = clk_regmap_init,
 	.recalc_rate = meson_clk_cpu_dyndiv_recalc_rate,
 	.determine_rate = meson_clk_cpu_dyndiv_determine_rate,
 	.set_rate = meson_clk_cpu_dyndiv_set_rate,
diff --git a/drivers/clk/meson/clk-dualdiv.c b/drivers/clk/meson/clk-dualdiv.c
index c896cf29b318ca3debf7447a9c44be01523abe47..787df6cdf841641982f20eed7dd276669e7b7b6e 100644
--- a/drivers/clk/meson/clk-dualdiv.c
+++ b/drivers/clk/meson/clk-dualdiv.c
@@ -126,6 +126,7 @@ static int meson_clk_dualdiv_set_rate(struct clk_hw *hw, unsigned long rate,
 }
 
 const struct clk_ops meson_clk_dualdiv_ops = {
+	.init		= clk_regmap_init,
 	.recalc_rate	= meson_clk_dualdiv_recalc_rate,
 	.determine_rate	= meson_clk_dualdiv_determine_rate,
 	.set_rate	= meson_clk_dualdiv_set_rate,
@@ -133,6 +134,7 @@ const struct clk_ops meson_clk_dualdiv_ops = {
 EXPORT_SYMBOL_NS_GPL(meson_clk_dualdiv_ops, "CLK_MESON");
 
 const struct clk_ops meson_clk_dualdiv_ro_ops = {
+	.init		= clk_regmap_init,
 	.recalc_rate	= meson_clk_dualdiv_recalc_rate,
 };
 EXPORT_SYMBOL_NS_GPL(meson_clk_dualdiv_ro_ops, "CLK_MESON");
diff --git a/drivers/clk/meson/clk-mpll.c b/drivers/clk/meson/clk-mpll.c
index ee91e32b4050bf40cf6f19c8152ae11c2ab4ec11..7f8dada66e16fd33cb5d0e628577c39fba5e4e25 100644
--- a/drivers/clk/meson/clk-mpll.c
+++ b/drivers/clk/meson/clk-mpll.c
@@ -128,6 +128,11 @@ static int mpll_init(struct clk_hw *hw)
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_clk_mpll_data *mpll = meson_clk_mpll_data(clk);
+	int ret;
+
+	ret = clk_regmap_init(hw);
+	if (ret)
+		return ret;
 
 	if (mpll->init_count)
 		regmap_multi_reg_write(clk->map, mpll->init_regs,
@@ -151,6 +156,7 @@ static int mpll_init(struct clk_hw *hw)
 }
 
 const struct clk_ops meson_clk_mpll_ro_ops = {
+	.init		= clk_regmap_init,
 	.recalc_rate	= mpll_recalc_rate,
 	.determine_rate	= mpll_determine_rate,
 };
diff --git a/drivers/clk/meson/clk-phase.c b/drivers/clk/meson/clk-phase.c
index 7012111206107a25ca77a5c51cb5b19d9755f3c1..58dd982e6878afd481cdf6634f70a69d5d2b5e5b 100644
--- a/drivers/clk/meson/clk-phase.c
+++ b/drivers/clk/meson/clk-phase.c
@@ -58,6 +58,7 @@ static int meson_clk_phase_set_phase(struct clk_hw *hw, int degrees)
 }
 
 const struct clk_ops meson_clk_phase_ops = {
+	.init		= clk_regmap_init,
 	.get_phase	= meson_clk_phase_get_phase,
 	.set_phase	= meson_clk_phase_set_phase,
 };
@@ -83,6 +84,11 @@ static int meson_clk_triphase_sync(struct clk_hw *hw)
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_clk_triphase_data *tph = meson_clk_triphase_data(clk);
 	unsigned int val;
+	int ret;
+
+	ret = clk_regmap_init(hw);
+	if (ret)
+		return ret;
 
 	/* Get phase 0 and sync it to phase 1 and 2 */
 	val = meson_parm_read(clk->map, &tph->ph0);
@@ -142,6 +148,11 @@ static int meson_sclk_ws_inv_sync(struct clk_hw *hw)
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_sclk_ws_inv_data *tph = meson_sclk_ws_inv_data(clk);
 	unsigned int val;
+	int ret;
+
+	ret = clk_regmap_init(hw);
+	if (ret)
+		return ret;
 
 	/* Get phase and sync the inverted value to ws */
 	val = meson_parm_read(clk->map, &tph->ph);
diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index e8e53855b00a81bc8eaa4213173948c964debc8a..1ea6579a760f35fd669b5e7260df8edfa083bf29 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -311,6 +311,11 @@ static int meson_clk_pll_init(struct clk_hw *hw)
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
+	int ret;
+
+	ret = clk_regmap_init(hw);
+	if (ret)
+		return ret;
 
 	/*
 	 * Keep the clock running, which was already initialized and enabled
@@ -468,6 +473,7 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
  * the other ops except set_rate since the rate is fixed.
  */
 const struct clk_ops meson_clk_pcie_pll_ops = {
+	.init		= clk_regmap_init,
 	.recalc_rate	= meson_clk_pll_recalc_rate,
 	.determine_rate	= meson_clk_pll_determine_rate,
 	.is_enabled	= meson_clk_pll_is_enabled,
@@ -488,6 +494,7 @@ const struct clk_ops meson_clk_pll_ops = {
 EXPORT_SYMBOL_NS_GPL(meson_clk_pll_ops, "CLK_MESON");
 
 const struct clk_ops meson_clk_pll_ro_ops = {
+	.init		= clk_regmap_init,
 	.recalc_rate	= meson_clk_pll_recalc_rate,
 	.is_enabled	= meson_clk_pll_is_enabled,
 };
diff --git a/drivers/clk/meson/clk-regmap.c b/drivers/clk/meson/clk-regmap.c
index f3e504f6757152868e60d5a9fac5c5e5bf3e2e56..1ed56fe63caedc16a332b28f211d8b0a7663aaa5 100644
--- a/drivers/clk/meson/clk-regmap.c
+++ b/drivers/clk/meson/clk-regmap.c
@@ -4,9 +4,52 @@
  * Author: Jerome Brunet <jbrunet@baylibre.com>
  */
 
+#include <linux/device.h>
 #include <linux/module.h>
+#include <linux/mfd/syscon.h>
 #include "clk-regmap.h"
 
+int clk_regmap_init(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct device_node *np, *parent_np;
+	struct device *dev;
+
+	/* Allow regmap to be preset as it was historically done */
+	if (clk->map)
+		return 0;
+
+	/*
+	 * FIXME: what follows couples the controller implementation
+	 * and clk_regmap clock type. This situation is not desirable
+	 * but temporary, until the controller is able to register
+	 * a hook to initialize a clock type
+	 */
+
+	/* Check the usual dev enabled controller with an basic IO regmap */
+	dev = clk_hw_get_dev(hw);
+	if (dev) {
+		clk->map = dev_get_regmap(dev, NULL);
+		if (clk->map)
+			return 0;
+	}
+
+	/* Move on to early and syscon based controllers */
+	np = clk_hw_get_of_node(hw);
+	if (np) {
+		parent_np = of_get_parent(np);
+		clk->map = syscon_node_to_regmap(parent_np);
+		of_node_put(parent_np);
+
+		if (!IS_ERR_OR_NULL(clk->map))
+			return 0;
+	}
+
+	/* Bail out if regmap can't be found */
+	return -EINVAL;
+}
+EXPORT_SYMBOL_NS_GPL(clk_regmap_init, "CLK_MESON");
+
 static int clk_regmap_gate_endisable(struct clk_hw *hw, int enable)
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
@@ -45,6 +88,7 @@ static int clk_regmap_gate_is_enabled(struct clk_hw *hw)
 }
 
 const struct clk_ops clk_regmap_gate_ops = {
+	.init		= clk_regmap_init,
 	.enable = clk_regmap_gate_enable,
 	.disable = clk_regmap_gate_disable,
 	.is_enabled = clk_regmap_gate_is_enabled,
@@ -52,6 +96,7 @@ const struct clk_ops clk_regmap_gate_ops = {
 EXPORT_SYMBOL_NS_GPL(clk_regmap_gate_ops, "CLK_MESON");
 
 const struct clk_ops clk_regmap_gate_ro_ops = {
+	.init		= clk_regmap_init,
 	.is_enabled = clk_regmap_gate_is_enabled,
 };
 EXPORT_SYMBOL_NS_GPL(clk_regmap_gate_ro_ops, "CLK_MESON");
@@ -121,6 +166,7 @@ static int clk_regmap_div_set_rate(struct clk_hw *hw, unsigned long rate,
 /* Would prefer clk_regmap_div_ro_ops but clashes with qcom */
 
 const struct clk_ops clk_regmap_divider_ops = {
+	.init = clk_regmap_init,
 	.recalc_rate = clk_regmap_div_recalc_rate,
 	.determine_rate = clk_regmap_div_determine_rate,
 	.set_rate = clk_regmap_div_set_rate,
@@ -128,6 +174,7 @@ const struct clk_ops clk_regmap_divider_ops = {
 EXPORT_SYMBOL_NS_GPL(clk_regmap_divider_ops, "CLK_MESON");
 
 const struct clk_ops clk_regmap_divider_ro_ops = {
+	.init = clk_regmap_init,
 	.recalc_rate = clk_regmap_div_recalc_rate,
 	.determine_rate = clk_regmap_div_determine_rate,
 };
@@ -170,6 +217,7 @@ static int clk_regmap_mux_determine_rate(struct clk_hw *hw,
 }
 
 const struct clk_ops clk_regmap_mux_ops = {
+	.init		= clk_regmap_init,
 	.get_parent = clk_regmap_mux_get_parent,
 	.set_parent = clk_regmap_mux_set_parent,
 	.determine_rate = clk_regmap_mux_determine_rate,
@@ -177,6 +225,7 @@ const struct clk_ops clk_regmap_mux_ops = {
 EXPORT_SYMBOL_NS_GPL(clk_regmap_mux_ops, "CLK_MESON");
 
 const struct clk_ops clk_regmap_mux_ro_ops = {
+	.init		= clk_regmap_init,
 	.get_parent = clk_regmap_mux_get_parent,
 };
 EXPORT_SYMBOL_NS_GPL(clk_regmap_mux_ro_ops, "CLK_MESON");
diff --git a/drivers/clk/meson/clk-regmap.h b/drivers/clk/meson/clk-regmap.h
index e365312da54ece08098293b1a831c803415db814..f8cac2df5755b0f894570305604485f54c17ea49 100644
--- a/drivers/clk/meson/clk-regmap.h
+++ b/drivers/clk/meson/clk-regmap.h
@@ -7,6 +7,7 @@
 #ifndef __CLK_REGMAP_H
 #define __CLK_REGMAP_H
 
+#include <linux/device.h>
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>
 
@@ -31,6 +32,9 @@ static inline struct clk_regmap *to_clk_regmap(struct clk_hw *hw)
 	return container_of(hw, struct clk_regmap, hw);
 }
 
+/* clk_regmap init op to get and cache regmap from the controllers */
+int clk_regmap_init(struct clk_hw *hw);
+
 /**
  * struct clk_regmap_gate_data - regmap backed gate specific data
  *
diff --git a/drivers/clk/meson/sclk-div.c b/drivers/clk/meson/sclk-div.c
index 9c4945234f2682ea4c4e9c2fc2158fe37dc46f74..4ba3d82810e8f2f456c349b3e56e6b48e1c7290b 100644
--- a/drivers/clk/meson/sclk-div.c
+++ b/drivers/clk/meson/sclk-div.c
@@ -222,6 +222,11 @@ static int sclk_div_init(struct clk_hw *hw)
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_sclk_div_data *sclk = meson_sclk_div_data(clk);
 	unsigned int val;
+	int ret;
+
+	ret = clk_regmap_init(hw);
+	if (ret)
+		return ret;
 
 	val = meson_parm_read(clk->map, &sclk->div);
 
diff --git a/drivers/clk/meson/vclk.c b/drivers/clk/meson/vclk.c
index 6a167ebdc8d74b9e5371100c6461ae395b7cc8af..009bd11930427f1f6465bf70acc35cd7de68d358 100644
--- a/drivers/clk/meson/vclk.c
+++ b/drivers/clk/meson/vclk.c
@@ -45,6 +45,7 @@ static int meson_vclk_gate_is_enabled(struct clk_hw *hw)
 }
 
 const struct clk_ops meson_vclk_gate_ops = {
+	.init = clk_regmap_init,
 	.enable = meson_vclk_gate_enable,
 	.disable = meson_vclk_gate_disable,
 	.is_enabled = meson_vclk_gate_is_enabled,
@@ -127,6 +128,7 @@ static int meson_vclk_div_is_enabled(struct clk_hw *hw)
 }
 
 const struct clk_ops meson_vclk_div_ops = {
+	.init = clk_regmap_init,
 	.recalc_rate = meson_vclk_div_recalc_rate,
 	.determine_rate = meson_vclk_div_determine_rate,
 	.set_rate = meson_vclk_div_set_rate,
diff --git a/drivers/clk/meson/vid-pll-div.c b/drivers/clk/meson/vid-pll-div.c
index 965ed7281f57edf3c5d550dfdbe0c61b016e4684..2a3cdbe6d86a828a31724c49c59e300ec5b1fa54 100644
--- a/drivers/clk/meson/vid-pll-div.c
+++ b/drivers/clk/meson/vid-pll-div.c
@@ -90,6 +90,7 @@ static unsigned long meson_vid_pll_div_recalc_rate(struct clk_hw *hw,
 }
 
 const struct clk_ops meson_vid_pll_div_ro_ops = {
+	.init		= clk_regmap_init,
 	.recalc_rate	= meson_vid_pll_div_recalc_rate,
 };
 EXPORT_SYMBOL_NS_GPL(meson_vid_pll_div_ro_ops, "CLK_MESON");

-- 
2.47.2


