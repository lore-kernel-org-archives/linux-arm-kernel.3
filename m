Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C6AD715EE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 17:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qkAYbw1P//ms4g5sKeB++qe37tbbTNP4LnBeMSB+xS8=; b=wTMJwn2bS7hUf2J9XLcsX3OLRe
	4uOtRG78VQb0hdR5iDt5HpdDMLq4W9fw5RHY+ByWEs9PNT+D71aWlh3zUP/It4CCsakdBD25WAEBI
	LR9vmkR9BlLf1XJuYioFCL9h+u0sgwtaGCwzFZpd2eDS7dBZeeZEn8lSyRYqJU7hC7nc7+Yf71noG
	XFGUKxhzzNxqcjOPN6aMbb8HFM0s1k+8HjS3V763BAHth4/nQBO2Ao1GLhLn1OPQ2tR1y91c2N0ll
	R+YpKFk5p0b9RgCEdxDtKpMfghbeH4foArYbjpwTGlAain51DjpknO+9NS96uKcC+sVu1PwVxxG6u
	OqAloFOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjh9g-0000000AOGI-3GQ0;
	Sat, 24 Jan 2026 17:10:36 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjh9K-0000000AO5c-0KmQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Jan 2026 17:10:16 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b8837152db5so429729366b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Jan 2026 09:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769274612; x=1769879412; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qkAYbw1P//ms4g5sKeB++qe37tbbTNP4LnBeMSB+xS8=;
        b=hDQZrikJv8bRHuTXVkch7apEj55jpZFWTxigc3PpSQCJ4YnadRVQghPo5KNQwmrQOk
         nOd5MJngKqg1VgXyV3iMYEWZIBdDyytfqyxIKhxlIYrFkMS9BhS4fxAoHd4X6FS9yUIF
         lnQQ79y6UNYFZDRu3tfCbteDVksswWy5Mnr3ZEqhOePYFJY9me/ChvNZcXfpocI7SEI1
         6BSjjOm2Wrjm6oXkgYKUvE6bo1RYBmJ655FzZ77Fk9Wi643QVVGC2a2UJ2sOPDE/QFag
         7Q6kLnDMu7MABKdjMDAepyqnAjmLBhFmD6LCEn1NGD8GWBKeYFLnAVR3/GU2C7btzdBZ
         QGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769274612; x=1769879412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qkAYbw1P//ms4g5sKeB++qe37tbbTNP4LnBeMSB+xS8=;
        b=Afm0Uc9nmo2dzQ2yBD9JLMyRiqydSYKaKJYD+vSnL6u0qmAjEuhgOFQt5GSeRLlCC2
         3GKcgalQRHJgSMUEnfZXLQeirrnk3mqrOFmTRLB1evR79328OvaGsZzGAQU0T3817vXW
         AeXtRMf3VyCBQpmg9IR9E5B66XyzNjVhCN76euk5sOjF6nAwcjtdeTL/6eBC1AK8A486
         /9c4ZVHxY6vmif4FYoHBypB0VfOcMxCSBy00QzR3EbiFj4Nl1Mm9syBZjF8AXt/OcvSU
         6YPTkksBbjFg+/n3brwr5OC+wt6RORCnMBt2u+6sWXLK150e7dEBqS6f34KZQBchFVF6
         NlPA==
X-Forwarded-Encrypted: i=1; AJvYcCX/yR4lyv4N+VtFDLY541Hhdnm1KtPnKikmCc4oU5thrpbX5XfZxnqJIr9GaLF42PVhlhJgKXHvXuJawZkTU0XI@lists.infradead.org
X-Gm-Message-State: AOJu0YydWFPGNPB7MCf3pOjQqSV+W0Bq1ASafZTVhQ/MMUNRasSiT3mT
	ZyBVcBuKzmMeh5n3Id1B1ZG2CJqudHWxTbNKxzpjoFEJ/Omvyoa3gAnh
X-Gm-Gg: AZuq6aLYFTW/Xdrl/QziKCqNGqaULBBVoEvo8X5SgxPpORa61mj2f44L65VZmAHvCJd
	e49kjGubRAEZjuG1gTwHnJZxmjlRrheScR+byZoxPza+uEUmN41pX8lDrpeUDGUrei+n4Hw7So0
	w8RF0jzgoo79c4BtEqwjWej3GArOzM0yS/pMdtuGGngzSLelLFHyAXryJILP7zNbIyLhQRCbuYc
	25s6fIgQu4Mrin9cFWDgLPu5ZyfitsvPY1QVmeSXNdZUoig4SmL+GFGKBRMD5xboosjL+gRkn15
	4NEama/i1SGBuBIdnf/X3WFQzv6o4YHD0EUifJy1XaQriwYFwM2N85roOMVHzI7pUIXW1LB0yFv
	AcL3G0wbZ+QaaDs68HyTli+jpkMi+nekFUM8NYkGezwZfRSDHzUR5JwF/ybm/WcRxdeCq62Gl2h
	rYsojG6fmzpXVnDgdLR0w0Zr5gbcb7zriqKywaFI3YQ0mHGSv2K97Zb1B2IyJggC1Hj3aFF3V/Z
	XP9pfPAb56TTEVxOxGZ9B+rassmiWmBwj9E1aY86Sl1zg==
X-Received: by 2002:a17:906:209c:b0:b88:5bd7:63b3 with SMTP id a640c23a62f3a-b885bd77b43mr296217266b.19.1769274612000;
        Sat, 24 Jan 2026 09:10:12 -0800 (PST)
Received: from tablet.my.domain (2a01-114f-470e-6200-4c6a-9244-66ab-7c8e.ea.ipv6.supernova.orange.pl. [2a01:114f:470e:6200:4c6a:9244:66ab:7c8e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b3dac6esm302680866b.7.2026.01.24.09.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 09:10:11 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sat, 24 Jan 2026 18:10:05 +0100
Subject: [PATCH RESEND v7 5/7] clk: bcm: kona: Add support for bus clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260124-kona-bus-clock-v7-5-9dffe1bdc08d@gmail.com>
References: <20260124-kona-bus-clock-v7-0-9dffe1bdc08d@gmail.com>
In-Reply-To: <20260124-kona-bus-clock-v7-0-9dffe1bdc08d@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@kernel.org>, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org, 
 phone-devel@vger.kernel.org, Artur Weber <aweber.kernel@gmail.com>, 
 Alex Elder <elder@riscstar.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8542;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=E/+Vw9F7Uvr2yppAoFwMqE4mYWZlreB3QzMhNngRC0E=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBpdPzriqsluyjagdys9/FEx2+XV/RmsOvTNJOBx
 a0M/1hJ4w+JAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaXT86wAKCRCzu/ihE6BR
 aAe9D/wPQ3RRLhfE0AMGkG/Q+xtBT0eNMV7a2s2/dGSFdp3AynYxOohBcvZayoIEKD2vLFDNDvk
 ts4epLTk6vkPJgWFvjmRrKR7CHqWkHdDkUT+O0gy70reKq9e/OXKo5Pfj3jvAwSHF8TgV93zoZh
 r6V811uzfwFmqGGiBSAxQtbp+d7/V6zjR51NYFx53bYFO8PIqD5ywywST6ag/S8xjfnhQcMDpkK
 evq5wXmWp1PG1tHkPvSl+brmv9kJzUNvZCiYycBOhP3umE5RiVfBhrjaN3G1721Ag74LDUuomFV
 f661qTHUhIfSc/2GlYms6stmV4waE+kgzdA/1aVhmDlgeL6PBeUfShm/SsdTY20QXfX2FLDNTTR
 F89JcoTEvS75HJeIcEOaDh18fjOsX0hJXTM862+Nu65XgkavAV6+88EmX91Oj7YBRun0bVIro35
 59gKpExrjkhr9IVlrQLrHrMYJ3isS3VpcSkiQOo0CtudGuGvPH1aj7OWE6DeJWrtAE1NQ5/j+1i
 LuBpY6U0fXnl36t/wgl4hsW+ZReg7RsCM8uzzn81l80NAa9kIyba0kvOg7G6Y3Uiz0oPHF1SmQF
 mxYyvSlP+gk2eNmoD3jy+TLj3Z6Z+jlw26xfO3szI9baZJyduUTxGVZCDbvz0D6oeCPR212A/0+
 wHyYtlZ1gabwg+A==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_091014_178315_E19B55ED 
X-CRM114-Status: GOOD (  20.20  )
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

Introduce support for bus clocks into the Broadcom Kona common clock
driver. Most of these functions have been adapted from their peripheral
clock counterparts, as they are nearly identical (bus clocks are just
much more limited in terms of allowed operations).

Reviewed-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v6:
- Made kona_bus_clk_ops const
---
 drivers/clk/bcm/clk-kona-setup.c | 116 +++++++++++++++++++++++++++++++++++++++
 drivers/clk/bcm/clk-kona.c       |  62 ++++++++++++++++++++-
 drivers/clk/bcm/clk-kona.h       |  10 ++++
 3 files changed, 187 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/bcm/clk-kona-setup.c b/drivers/clk/bcm/clk-kona-setup.c
index 338558f6fbae..8b6123e188fb 100644
--- a/drivers/clk/bcm/clk-kona-setup.c
+++ b/drivers/clk/bcm/clk-kona-setup.c
@@ -167,6 +167,58 @@ static bool peri_clk_data_offsets_valid(struct kona_clk *bcm_clk)
 	return true;
 }
 
+static bool bus_clk_data_offsets_valid(struct kona_clk *bcm_clk)
+{
+	struct bus_clk_data *bus;
+	struct bcm_clk_policy *policy;
+	struct bcm_clk_gate *gate;
+	struct bcm_clk_hyst *hyst;
+	const char *name;
+	u32 range;
+	u32 limit;
+
+	BUG_ON(bcm_clk->type != bcm_clk_bus);
+	bus = bcm_clk->u.bus;
+	name = bcm_clk->init_data.name;
+	range = bcm_clk->ccu->range;
+
+	limit = range - sizeof(u32);
+	limit = round_down(limit, sizeof(u32));
+
+	policy = &bus->policy;
+	if (policy_exists(policy)) {
+		if (policy->offset > limit) {
+			pr_err("%s: bad policy offset for %s (%u > %u)\n",
+				__func__, name, policy->offset, limit);
+			return false;
+		}
+	}
+
+	gate = &bus->gate;
+	hyst = &bus->hyst;
+	if (gate_exists(gate)) {
+		if (gate->offset > limit) {
+			pr_err("%s: bad gate offset for %s (%u > %u)\n",
+				__func__, name, gate->offset, limit);
+			return false;
+		}
+
+		if (hyst_exists(hyst)) {
+			if (hyst->offset > limit) {
+				pr_err("%s: bad hysteresis offset for %s "
+					"(%u > %u)\n", __func__,
+					name, hyst->offset, limit);
+				return false;
+			}
+		}
+	} else if (hyst_exists(hyst)) {
+		pr_err("%s: hysteresis but no gate for %s\n", __func__, name);
+		return false;
+	}
+
+	return true;
+}
+
 /* A bit position must be less than the number of bits in a 32-bit register. */
 static bool bit_posn_valid(u32 bit_posn, const char *field_name,
 			const char *clock_name)
@@ -481,9 +533,46 @@ peri_clk_data_valid(struct kona_clk *bcm_clk)
 	return kona_dividers_valid(bcm_clk);
 }
 
+/* Determine whether the set of bus clock registers are valid. */
+static bool
+bus_clk_data_valid(struct kona_clk *bcm_clk)
+{
+	struct bus_clk_data *bus;
+	struct bcm_clk_policy *policy;
+	struct bcm_clk_gate *gate;
+	struct bcm_clk_hyst *hyst;
+	const char *name;
+
+	BUG_ON(bcm_clk->type != bcm_clk_bus);
+
+	if (!bus_clk_data_offsets_valid(bcm_clk))
+		return false;
+
+	bus = bcm_clk->u.bus;
+	name = bcm_clk->init_data.name;
+
+	policy = &bus->policy;
+	if (policy_exists(policy) && !policy_valid(policy, name))
+		return false;
+
+	gate = &bus->gate;
+	if (gate_exists(gate) && !gate_valid(gate, "gate", name))
+		return false;
+
+	hyst = &bus->hyst;
+	if (hyst_exists(hyst) && !hyst_valid(hyst, name))
+		return false;
+
+	return true;
+}
+
 static bool kona_clk_valid(struct kona_clk *bcm_clk)
 {
 	switch (bcm_clk->type) {
+	case bcm_clk_bus:
+		if (!bus_clk_data_valid(bcm_clk))
+			return false;
+		break;
 	case bcm_clk_peri:
 		if (!peri_clk_data_valid(bcm_clk))
 			return false;
@@ -656,6 +745,14 @@ static void peri_clk_teardown(struct peri_clk_data *data,
 	clk_sel_teardown(&data->sel, init_data);
 }
 
+static void bus_clk_teardown(struct bus_clk_data *data,
+				struct clk_init_data *init_data)
+{
+	init_data->num_parents = 0;
+	kfree(init_data->parent_names);
+	init_data->parent_names = NULL;
+}
+
 /*
  * Caller is responsible for freeing the parent_names[] and
  * parent_sel[] arrays in the peripheral clock's "data" structure
@@ -670,9 +767,23 @@ peri_clk_setup(struct peri_clk_data *data, struct clk_init_data *init_data)
 	return clk_sel_setup(data->clocks, &data->sel, init_data);
 }
 
+static int
+bus_clk_setup(struct bus_clk_data *data, struct clk_init_data *init_data)
+{
+	init_data->flags = CLK_IGNORE_UNUSED;
+
+	init_data->parent_names = NULL;
+	init_data->num_parents = 0;
+
+	return 0;
+}
+
 static void bcm_clk_teardown(struct kona_clk *bcm_clk)
 {
 	switch (bcm_clk->type) {
+	case bcm_clk_bus:
+		bus_clk_teardown(bcm_clk->u.data, &bcm_clk->init_data);
+		break;
 	case bcm_clk_peri:
 		peri_clk_teardown(bcm_clk->u.data, &bcm_clk->init_data);
 		break;
@@ -702,6 +813,11 @@ static int kona_clk_setup(struct kona_clk *bcm_clk)
 	struct clk_init_data *init_data = &bcm_clk->init_data;
 
 	switch (bcm_clk->type) {
+	case bcm_clk_bus:
+		ret = bus_clk_setup(bcm_clk->u.data, init_data);
+		if (ret)
+			return ret;
+		break;
 	case bcm_clk_peri:
 		ret = peri_clk_setup(bcm_clk->u.data, init_data);
 		if (ret)
diff --git a/drivers/clk/bcm/clk-kona.c b/drivers/clk/bcm/clk-kona.c
index 2641eaa4ca52..fbe0d902dc80 100644
--- a/drivers/clk/bcm/clk-kona.c
+++ b/drivers/clk/bcm/clk-kona.c
@@ -944,7 +944,7 @@ static int selector_write(struct ccu_data *ccu, struct bcm_clk_gate *gate,
 	return ret;
 }
 
-/* Clock operations */
+/* Peripheral clock operations */
 
 static int kona_peri_clk_enable(struct clk_hw *hw)
 {
@@ -1216,9 +1216,69 @@ static bool __peri_clk_init(struct kona_clk *bcm_clk)
 	return true;
 }
 
+/* Bus clock operations */
+
+static int kona_bus_clk_enable(struct clk_hw *hw)
+{
+	struct kona_clk *bcm_clk = to_kona_clk(hw);
+	struct bcm_clk_gate *gate = &bcm_clk->u.bus->gate;
+
+	return clk_gate(bcm_clk->ccu, bcm_clk->init_data.name, gate, true);
+}
+
+static void kona_bus_clk_disable(struct clk_hw *hw)
+{
+	struct kona_clk *bcm_clk = to_kona_clk(hw);
+	struct bcm_clk_gate *gate = &bcm_clk->u.bus->gate;
+
+	(void)clk_gate(bcm_clk->ccu, bcm_clk->init_data.name, gate, false);
+}
+
+static int kona_bus_clk_is_enabled(struct clk_hw *hw)
+{
+	struct kona_clk *bcm_clk = to_kona_clk(hw);
+	struct bcm_clk_gate *gate = &bcm_clk->u.bus->gate;
+
+	return is_clk_gate_enabled(bcm_clk->ccu, gate) ? 1 : 0;
+}
+
+const struct clk_ops kona_bus_clk_ops = {
+	.enable = kona_bus_clk_enable,
+	.disable = kona_bus_clk_disable,
+	.is_enabled = kona_bus_clk_is_enabled,
+};
+
+/* Put a bus clock into its initial state */
+static bool __bus_clk_init(struct kona_clk *bcm_clk)
+{
+	struct ccu_data *ccu = bcm_clk->ccu;
+	struct bus_clk_data *bus = bcm_clk->u.bus;
+	const char *name = bcm_clk->init_data.name;
+
+	BUG_ON(bcm_clk->type != bcm_clk_bus);
+
+	if (!policy_init(ccu, &bus->policy)) {
+		pr_err("%s: error initializing policy for %s\n",
+			__func__, name);
+		return false;
+	}
+	if (!gate_init(ccu, &bus->gate)) {
+		pr_err("%s: error initializing gate for %s\n", __func__, name);
+		return false;
+	}
+	if (!hyst_init(ccu, &bus->hyst)) {
+		pr_err("%s: error initializing hyst for %s\n", __func__, name);
+		return false;
+	}
+
+	return true;
+}
+
 static bool __kona_clk_init(struct kona_clk *bcm_clk)
 {
 	switch (bcm_clk->type) {
+	case bcm_clk_bus:
+		return __bus_clk_init(bcm_clk);
 	case bcm_clk_peri:
 		return __peri_clk_init(bcm_clk);
 	default:
diff --git a/drivers/clk/bcm/clk-kona.h b/drivers/clk/bcm/clk-kona.h
index 7064ce316981..a290f8870e24 100644
--- a/drivers/clk/bcm/clk-kona.h
+++ b/drivers/clk/bcm/clk-kona.h
@@ -390,6 +390,14 @@ struct peri_clk_data {
 	struct bcm_clk_sel sel;
 	const char *clocks[];	/* must be last; use CLOCKS() to declare */
 };
+
+struct bus_clk_data {
+	struct bcm_clk_policy policy;
+	struct bcm_clk_gate gate;
+	struct bcm_clk_hyst hyst;
+	const char *clocks[];	/* must be last; use CLOCKS() to declare */
+};
+
 #define CLOCKS(...)	{ __VA_ARGS__, NULL, }
 #define NO_CLOCKS	{ NULL, }	/* Must use of no parent clocks */
 
@@ -401,6 +409,7 @@ struct kona_clk {
 	union {
 		void *data;
 		struct peri_clk_data *peri;
+		struct bus_clk_data *bus;
 	} u;
 };
 #define to_kona_clk(_hw) \
@@ -488,6 +497,7 @@ struct ccu_data {
 /* Exported globals */
 
 extern const struct clk_ops kona_peri_clk_ops;
+extern const struct clk_ops kona_bus_clk_ops;
 
 /* Externally visible functions */
 

-- 
2.52.0


