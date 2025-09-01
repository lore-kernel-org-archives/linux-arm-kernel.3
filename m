Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF97BCA1007
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 23:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1oMGXYzMskcrO4jxEYQxuxrzZ5aMbCzOb6wvN651AtQ=; b=pzuryHLVVAJOGP5F32bFytOXgF
	KNemfavq02y10qaoZSb0xE9znkifvfihr0Y9h0MskvEGq4ZEb4ewMTaWV0KsG3nB0G29Z61r3S6nC
	1nmgfETDTwkn5TaDkKrICuAxFdB+IuWzMpZU6D/GmgJowDvyJM5FrlqPONEbtsbkJjCR1/0sAquUc
	Sx4qv+uCwNn+wcOT7bs6nxgq1dIT31HS06o8R+GHbBjBzCFfd52EhjF2dZn+eiV1emX6V33uSIGi8
	iYNdbDUBd5t99Aqhhs2oXdu+CnEE+vWFv50ajBcj++AYnrZqT4K8iuh3d3oBwfX4VkYMciBWaQP3u
	UT9U7s4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDiE-0000000EFt6-3LwS;
	Mon, 01 Sep 2025 23:13:22 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut80s-0000000DPPM-1hjh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 17:08:15 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-55f78e3cdf9so1797706e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 10:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756746493; x=1757351293; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1oMGXYzMskcrO4jxEYQxuxrzZ5aMbCzOb6wvN651AtQ=;
        b=gYCkpqJjT5DgqA9sEf+Ie2/1InvnhZ6D1gUuVVjK1hjEXGNlG/wtt5rwGFes1vlhyC
         pHs5R0nDzscKvisCH/xQ1SM6V3dI0vfCOME2tAW4yS+Ltm0jELpt1ODJ0BF8TTirQQf+
         9FkTamFDiPB8voZ07iCA+xqMOKyXZI1tupUD6r8+upROrRdp4hfBVIHm1vHLhHm9OUmP
         coh9yDx6gj7SAUVQT8xPzjut2MM6GwbsbLfMP47Bt3DiSO9SKjXkbD4i3LdWWat4UEyD
         ETGEZB2Axf/B9uTv/EUi+hHJ6vs0NSBUVblUpm5AIXFLlUZjBct8dNkVLTPBh7xlorHn
         cAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756746493; x=1757351293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1oMGXYzMskcrO4jxEYQxuxrzZ5aMbCzOb6wvN651AtQ=;
        b=X/tOM/p2+fbuJwoq5QOgYcLaihuUN53Uz6aQuO+1HGkDOsdcufs24idrthC6JkXx7j
         ZiqWblZPM0iXvdmy91TaiPiz8yZksUNnc+UlWShFgUWMfJi0CZALn+kyE+52Jw2tG8gY
         P/usuw5hthmt8VjPAMXd8uWy/mEFvVsVv6bChY0paCcfwa/rOATSo1rPwQo4xbg+KhAL
         tlzQyGXVvToc/lp1eqRQUDVHcK5UI+DxLwF5ANhPFHHpaKUqzSl4o4LrPq01j1x2V1ek
         h+qJufXtEXu9uUb9kx0aaTJzsjOq/9izq+vw80gbWjNhcEwidbsZvftd7Y1/b2kVRQj/
         DNcQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8qeqbaHbyo0z5XjwzfTOf7Uj+Fmv0lU+XWmmk2ernAuToSzBMQCFSAyrOiEGHAYs2bbBigaSh+f+SdJbYlyca@lists.infradead.org
X-Gm-Message-State: AOJu0Yx41Hkb8iwrnt/rJrDXhbVG1Vpdm38+FKQbBpLDuzLGUncVdzSX
	6aHd+YmpvsoqKucsc4bih/05pG+m0NkzoOeXk5oy7QcS1bL3+VZxDAmA
X-Gm-Gg: ASbGncvJj4E34OXiqrhMtVuXWg9Ns/6fwUGoSaW/jeqcS4W24DJtBDiYHghpZ2A1sw1
	VJ7Xfb7TEdxMzDUMs0a3OE1V3rGtn3wV7jwfaj3EJVJ+eeWDIpqIljsyLQGgCYAThPOFvqMbQbL
	mvRk+i5WcDyWtX89HX5dN4PvMqlj+x7U+kfhvjBdnB7YulXoXwtwvQBLLvzvaRBqLWgIHSOMcaf
	8FLMriAYNohNHo63bbalxoMspYXd14Ipsp2uKHTEzy1+03P8wMq/eBrPhvUp5lqZG7h1EpqUjUz
	ZAht1STPrwFHTd2GI2UmlbFU9Wn+kx+viwqBeJ24alzxowkCFVdpLUhD/z6jApVYzpU08gnnxb6
	o21+pkwhPP7ez1lPPqQIs/WiZzLHOsm7kVZ4=
X-Google-Smtp-Source: AGHT+IFmSiaj+vRwEthsD30MDf0vVWZqAe7Z2k/D/eZwbwcsNhriILyTDHy0uXVAieL74oCefyGsdg==
X-Received: by 2002:a05:6512:a90:b0:55f:3faa:7c02 with SMTP id 2adb3069b0e04-55f7093eb00mr2230716e87.40.1756746492580;
        Mon, 01 Sep 2025 10:08:12 -0700 (PDT)
Received: from tablet.my.domain ([2a00:f44:892:8a37:6b0:21e7:549b:225b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f7abf7abesm1137666e87.55.2025.09.01.10.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 10:08:12 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Mon, 01 Sep 2025 19:07:11 +0200
Subject: [PATCH RESEND v6 5/9] clk: bcm: kona: Add support for bus clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-kona-bus-clock-v6-5-c3ac8215bd4d@gmail.com>
References: <20250901-kona-bus-clock-v6-0-c3ac8215bd4d@gmail.com>
In-Reply-To: <20250901-kona-bus-clock-v6-0-c3ac8215bd4d@gmail.com>
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
 bh=JuYT5UAjk8yWbra7ZXI5AZqez5OjuKeItEclQB5Yivo=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBotdLKdDLqHNQiSvycXFBx3bhT5oBFVDtOgxqx7
 pv2y8EwnjSJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaLXSygAKCRCzu/ihE6BR
 aMBUD/4jjje9188gdq6tOefi0bfAdRWNJKhHl2FU3XhZMMnzUJ+45Ws11ZaZeyl0fgzvimZFtC9
 EyY/vRPlgWmX5oB4lt7nTyRLIe72jHkLN1VncCpjmTfYi461t6GQ8TXsQ5HLlWGtpj3a2EnCX9O
 CM48drN/sqVkv95chIm8pDRlXKkQLKIPjStR50Ekthi4laUQthC4bhixd8gYWhv7KwsZr0abzR4
 TudSOUN3zBXIB7X4vRrH6T3o5Uk0MdBNSv2N8m791WSDu8QYMw9jSKfFJGGq2rXtOhQRYYOgBaX
 2DyWMsLPo9g0lN29/Jf8l8Y/3bcZrxEVH1zUWMQMZJ/2jDGfKQBa9oCQYr4eC5rhpF4vxSyqwnP
 XhOldhX28adRXC0bUbVOq8ZoKLOnZH1lh9RhL40QTWEvq7Hj4FvS8Qqdu8TdZoZiXWQLVy9Xx/M
 Pmwv1GaMrDnaX5fejEmYiX5g9shR7wyifoQYXc0QdCNKKE2oGuABAkHdKbUfMHbCShHStEmpBJW
 L3ZmCSFY+ZTIVe1PQ8vfJuUqYZ9Makl18/xD2qi3bkgAB0kjKvvRTcxQmy3lbSVR2SBEG151e1G
 aSgBsC3nl3fb8liWrrtCzHavShCv+jpgnAzU35BTFWz58DIj/DK4AiV0NBhWSlj408Jd23tg9ps
 i3KAEPvV+N21a0A==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_100814_572625_8B16587C 
X-CRM114-Status: GOOD (  21.58  )
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
2.51.0


