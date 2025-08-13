Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDBBCA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 11:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RrxTd0fZrSZoXHNLmGLsVXRRO9yazGCbbT+JQ4l++eQ=; b=BphQVKs9Cw7/dpUORs9EBNIvgT
	t6tiGtXu/D7Bis//ltljr2lzM4kuY74raRflwu/a/6YJxT30rBMV9kfX8RNfFz0MFbK7FF1bR1eGY
	wcqS2Nwz5eLeTmhG7CE88Sy001DzXaIz+UtMHAopXuRCyY+9NkXM+SK0bedo1HKx590sLAeEL7Pvb
	VSHKSF+VaLE/S/icrQSKoGs+upfx7FblpLIWGUmxOtfyIjB6Tnv1QVqDA1iwDEqdNh1SWkPzULzTp
	sKWY2o1HsIBCkbUerjjPuap1Vq4oUKafzxOcl9j0Z64WSJSzvLqo8kkdNf/icqdgZOtu7leGEzz9J
	lM4CooBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umA48-0000000DZOG-2hIS;
	Wed, 13 Aug 2025 11:54:48 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um9Db-0000000DSDC-1kc4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 11:00:32 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-af958127df5so191102266b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 04:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755082830; x=1755687630; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RrxTd0fZrSZoXHNLmGLsVXRRO9yazGCbbT+JQ4l++eQ=;
        b=TRbIWaCxYmU3fCjOd2FDFjQzBk3GM8ldSF7fGYpfruzrt0LEc2Wf3fxc73XpWr7ruz
         neZzhEuG3Jx0hkmgV+27UvxAe6lop9F9Z4fxYHOWUb9ZGZK+abxOGbqheJbZZFpdK9O+
         5BvpoPk1pSpF6HqOH1z9oTUBmqt8Iv2vwaxnRfqDoKC6qBOfoIwYdnIihh/AY3gv+Dv6
         snbFDxvhf/3RxpD4ZhhKpLihkLHC8ed5T0sfpIDAIqICwrV3ehDlqXBYb8lNxDeU1IRV
         iFddl0fMrlFLTePbSwzU768TRXjRwYVQ3dSy3EGnHPxJwAouMa5u1dr9wcy/rSUUup/6
         eV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755082830; x=1755687630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RrxTd0fZrSZoXHNLmGLsVXRRO9yazGCbbT+JQ4l++eQ=;
        b=kFj4uxTobUpKZOZx+121tpO0xtqGKNI0SB9ikBG0siiqTgAHSQDB7AUx2c5hV8xzpe
         SSMLcjMv6NK1dO2WCm79tboJhViJz6/ko6mB7s0lOmgRoZuEXbBLlf387nViQXpW7wup
         y+xsURSuAjMEszlfYENbFxIc5QOvqc/4gMHidJIZhIb2oyW8BxVhuQaYDEtll2Z3OjsL
         DF1ba8sK1F6muNTrzK1w0RVCTQd1RPSRAxPEkyEV/uHdkJTwqfQnX3Eie2MFNcoEcKrd
         4gH+9vwVSnYDXEKglKfAZjgbjx7W+0hmmluJdMZNIncbrBc9WICcczSnFXe0iDjhyC3t
         hgbg==
X-Forwarded-Encrypted: i=1; AJvYcCV3S1MEi3UaxnJpN/2noiyAfiCWmg2YrqCrmi7XyaCmckpdWK6tQXc0IRfvcBe0cwi4wiz89o6Ju0kEoVMF8Xbm@lists.infradead.org
X-Gm-Message-State: AOJu0Yxk2u6+UfVwXzZdTEr7PhRmd1cJG1/HaquMl80Gbpq9EiKlHNQj
	PLzT0bXG37rB9wl8VcBiCtB1tB5oXWLOCDLWtRw9LyMho9u778xYnSSD
X-Gm-Gg: ASbGnctK6A3OfG1iNFzGP2jaJyP7vHB+AvqEOOTW4KFDadL9ViDTTokdgMooTiAhQ6I
	+Bq8ET0n1FUr7J5Wf7FRZ0j6msoXCRk8unjIYZdrTmpELV+ixsWkffRj0dB1gcovIlo0SWQxG76
	lZEZvl01LHsy2TDkypiWF98TJF3BF6bS6uSwmx9vXM0O5iad1lIqN5zUucqkeDwwfqsF34+oNWq
	ZCQYdYIYdup8PHGAvv1DU9t+IE7pNY2JAzTflsaWh3LOMhZSRv+q5oxtHeUS7kjADQV+zY4C/zT
	8ttBHRA4P1UojdwPv4DufiNXdHndBn4lBNNSw7dTSbOQw9SOfORmkq6V+AWelDDFVY+/AKlRlDr
	bPF2Ka6eEHi4IOoxddR/WuiV2v+OXCINtePT6TLKy3oq4Xtyle5JHD1+WjfE9LQTXNYk4lGzpkE
	be63Nk
X-Google-Smtp-Source: AGHT+IGQh5Gbn8MpaOPIc2Nelb2/hYtoGCvEdRAzGUzlr5r7mYnmJGK+4eLPd7dnjwh8T3//2OAVGg==
X-Received: by 2002:a17:907:d18:b0:af9:3c05:b73f with SMTP id a640c23a62f3a-afca4ec18c5mr207774366b.41.1755082829423;
        Wed, 13 Aug 2025 04:00:29 -0700 (PDT)
Received: from tablet.my.domain (ip-31-0-121-4.multi.internet.cyfrowypolsat.pl. [31.0.121.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0df10asm2377046966b.59.2025.08.13.04.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 04:00:28 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Wed, 13 Aug 2025 13:00:11 +0200
Subject: [PATCH v6 5/9] clk: bcm: kona: Add support for bus clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-kona-bus-clock-v6-5-f5a63d4920a4@gmail.com>
References: <20250813-kona-bus-clock-v6-0-f5a63d4920a4@gmail.com>
In-Reply-To: <20250813-kona-bus-clock-v6-0-f5a63d4920a4@gmail.com>
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
 Artur Weber <aweber.kernel@gmail.com>, Alex Elder <elder@riscstar.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8647;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=PQfvqcpjdMtq6dnMREILfbHm2mHMjDZ7krmRMywS8YQ=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBonHA9zUcRlsPl4gpUgcKLBdo20HqqhvF3JeUa/
 2bb81G4/iSJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaJxwPQAKCRCzu/ihE6BR
 aLEzEACAo1GqsJJt7brS72zCsUFnz7CWIRSAyCI+7wsuOPWIvtN9v5f2bXRmGMLF0ybmSBUwIgi
 CR1hVkyr7MZnoMZn01tFuJmY1sGu3qkDp2xOibl4NHMUKFjC1+nrGJcnY49n1EZV5zjCBcoOyye
 RiIWx2e/JCAWo9D/WaHY8y7u9pXyt2v4F1amzbe+4UqbypgJnKw0EFLKvQOy1bQTz1zXb6wBNCF
 5SSMBnS92kmqYRoIOLOSmUo1PRLQ51QFXPkbGiQnuJakOU5dBqer9awXuCQ+qwvUp1Y6nHMzIVs
 3NH8b4AcrjINPamT5iOz77bISvqaTnnfscggbS2QMp/NwK7vbuBxChaoJsRmrO00xovqlXZ+hY9
 Hi7B9rn6N2JtjpcngdSvUK2YYJP7lFAuu7WnGOr9U+lekfkGdxIgEkRmRxIh9NJnGqcGd+0ON4i
 j6Dwue6DbunOF2jPQMxICQIgARunJlPRMrCcMZrMmxETw+dxzO6D+J+08a1RbCwXSzm96Z96hcM
 v6KIU0bdLPl8lqwnYDFCI4QPTJOgWzZW4q9SUeXITNJTRSrpDIupXTcB3RKgZI3wspmmKnRNtAZ
 jo6rj/3gUPqhS3DMCsXTDuNPI4RPRlreFmXYvW7RnlX6xcenxVnq/MQjiWYMmHv3oubvWCUzKjX
 EikIhlKVyBk6HeA==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_040031_466109_FDA54F5A 
X-CRM114-Status: GOOD (  21.23  )
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
index 338558f6fbaec27418497fc246de17e15236ca0d..8b6123e188fbc035cda2cf394035d35197671d06 100644
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
index 2641eaa4ca52c2724aa1dc9b4bdcbee5bcac95e4..fbe0d902dc8064289fa4db346f06594b56bb7236 100644
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
index 7064ce316981ef8f32cf20cd4cf674e5f0169101..a290f8870e24c286e53c0ad68c0946c8f891f9d2 100644
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
2.50.1


