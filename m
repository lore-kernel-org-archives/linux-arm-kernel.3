Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A946ECCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 13:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uDsIUcT69+lr8zHAx2R3kYezBCEsGf1f7Zkur+ptzrM=; b=NdGZdImSFjyZ3bPR6or5mogQrw
	/8cPNEKCxv2APmh88ywyxiW02RUtc8CvEUipeAtPymmnX6pl4AmsCITd4Xgx4rguHgsr4poOswNs4
	0uGRtuHF7xvT13KRtciYo3nCJSlPAswTHNB/9oqY5s9s+RI2J8VDI80nUy70bESHHKyNmYIRo9FNJ
	970YJ1EfYsxiOO93gNx1FRgorBsmtMvAJqTSNOAw//iMeurR0J40NPRA5IaoqBN1zMLFQ1U9sLtDj
	woZ+EYz2xhetEz/xLcAwf4pwoONzz0t7lcwzvH2Z151iDbpk1ZqTfCydMnINvLDxmayuOS6/8N9GL
	7GURBdVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8IoV-0000000DFaZ-3XzV;
	Mon, 13 Oct 2025 13:42:11 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8IoQ-0000000DFUP-0941
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 13:42:07 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-63bc12a5608so730701a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 06:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760362924; x=1760967724; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uDsIUcT69+lr8zHAx2R3kYezBCEsGf1f7Zkur+ptzrM=;
        b=GLU6STi2tPcLD5hMf7frNJ6O/ELHaMkhAe00OC8JiAMv51ULlBe14C0syb2G3wBwfM
         aSTDaS6Tp75ASNckOvm1nG9R3qt2Pn332eL9bqZMeEjWK9sJoUoBf+zxLgVT1zn0RAcm
         /H23BCmF+JRK2SzYvx6CBhCWmzyfZkanR4FhaV72uWvoWxouJvGw3duw8OGszNOo/MMM
         iFQLlZs08wWyS20qLsLbE022rMDqhFPoZj1OqrtgNeU5exSZz7nvmMK54MjLs27i7xKJ
         +Eh+91l9KslQt4LXwxx3sZAdWAU09dFVDpviTC3YPdgJ4rK3XzkgIleO31c6opjEM29n
         pCjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760362924; x=1760967724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uDsIUcT69+lr8zHAx2R3kYezBCEsGf1f7Zkur+ptzrM=;
        b=XT47f4zGBf20PJ/61zyWdhr0F6vjeKg5PXBR02lkSmlpv3EpGQT5j+nf69BYjMT1cn
         f3Ue4FuYxHyA2bcbeNCZvbavlHUkhLOT6CV51pPQT0OFgvjiOZwhIU8woUl6WKh8EHsu
         vD4CYJ5W6I8xk8ytlvIE7rAg94eiH71y7Q4hQdGBy8iFy62NoK1Fv4Bek7MZfcHsyZD5
         YATeB7GDiEvgDvt9KCkEfz2Ka9HA699viTPJZp5dvge4Gn2ULHturn/5Nr12ovZDi+hJ
         Plog9DA55RyVITyS3pT8uKSsH6yN23p0TL3ubAZM2qVS7FuuLhXXaowIc2NB5w2wudz/
         BJtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGE2hEy7Bt5SNXlQ2qGBkC60kvwrdX4zeLlZsV8WOb0P/uMOHWCRXPQexPYTgCuU8AGJjMTU3ToH2moTbBuV9n@lists.infradead.org
X-Gm-Message-State: AOJu0YymS2D/Gy4RUX44xoZcU4aj86LktZ5fi96oSqxeBtyDN77usarc
	nlQNKF013mgW7ZvXjc2ZyTGXoqTXhH1h6CkMjUClCIrFHTm9KeVrw0Ij
X-Gm-Gg: ASbGncvWV5kmv83hqFAxPTgtYDA3X1mvyzK9aSIVRaKxJHDsld4PkhH7qiUrIZWzr4D
	0ax88QdfDOC/1i9ME3eOTaaUtXliShxmEzWt3Ldz/dMTODKNIwWA9XbRim8fo9sueAE5S4dEleD
	cfPyy/Q0gZKe+S+qUguG0jW5JDD1yBMrQwt1AoqNrYlQriZayPEoaKV42Decq6Nf5ivmFi9S+L9
	aR0Qoi47bjxLv5X72XWGyaEVZy/6qVDHvUTKEytPVCg1wxme/kIzevtAoRMu/yYt/3xuqwu7+Hg
	F5jTkD+FqWCPtCUZzoYr+qK2Z7lqSnAE7dSweWjipVH+0Hj7xV7gqY3xWr+/rCSdPqeKGssEw8i
	EsQR2pU/HFcg9VqAlz3eFf0d8+Wd4tVblYtf4SyFCKF1rw8dYTDSHAjbDh7U1/YKAhTleNUnr5T
	FhJQDzZ8ERMVdS
X-Google-Smtp-Source: AGHT+IGGy5bOEIdbTRCX9VjTp4JbQvKPIyynjwlcAYml0w04UOhKYJOZKDHktFv9b0IwmGae+dBN2A==
X-Received: by 2002:a05:6402:26c7:b0:639:dab5:d610 with SMTP id 4fb4d7f45d1cf-639dab5dab3mr17930765a12.15.1760362923968;
        Mon, 13 Oct 2025 06:42:03 -0700 (PDT)
Received: from tablet.my.domain (83.21.75.22.ipv4.supernova.orange.pl. [83.21.75.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5c32249esm8729019a12.41.2025.10.13.06.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 06:42:03 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Mon, 13 Oct 2025 15:41:52 +0200
Subject: [PATCH v7 5/7] clk: bcm: kona: Add support for bus clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-kona-bus-clock-v7-5-8f473d99ae19@gmail.com>
References: <20251013-kona-bus-clock-v7-0-8f473d99ae19@gmail.com>
In-Reply-To: <20251013-kona-bus-clock-v7-0-8f473d99ae19@gmail.com>
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
 bh=byZ2PEJEhuWM5oD+6omq24Dtyls2EUrqjqS1m6PZQzw=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBo7QGggUlmntn06shwxxBJJItsJTa8h3XGC48cz
 ezuJX+66BeJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaO0BoAAKCRCzu/ihE6BR
 aCueD/4p1ztMpwT6m/x4W6BqpxrmoKkjD4hMjLNUKVNjYlMzat2q3iDiKe5X8oEnz3veh6xx1Wa
 7ugTyp41yVeR+AY4aqgblZc80PmWgw/HREJBhx8wEAgzn47BIEzvujtgPCmwlPJ+1h7Ylm/lfLW
 dbrudwSVmPfFDMcwLa5OdkogOuJcQe0jrrtpuoAtfFcM+1TJ7j21QJQMwnoiQ9WgyGMxenn2EcZ
 71XkP/cPoc4g3KfzKMI6dhGpPeEcP68HnhHx7Nj943ru5qw3PKsFS2l/18W0XmMk0h74LpVLwsj
 OqM9gIlsAO8eZ/pkBE5v6+H1WAmMrcxBVEJD9qBwxwJMGp4Q82SMYiY/00wwzxG4L76HtqKFu5O
 LbbQhDuzR+l62YRuSlgBOF4CwbeDtN3J78fpm7XmbA9Ct8e3+pbnndwGoABWrKYQ9ktQPjTwkZe
 DSbn3NBoyf5u3d4OvjyL2ArV5BP8SYnmuSr7uh0PnqJHULa+yCPpYAbmvNuOMMiQUZj7RJgHbo5
 9IUbxwwgBWW8KnWkzfYLNZOLjttQ5EsuASHZ2mryb65dXalS0HcWOVyCq7XHiEmxZaiFgnU+xIc
 nhWo9hlJiJJqULeWUtJNbZ1HPT3PEB+31FeMZiA31P6gKU6fvn8/0zDx/ISBtLqmIAebd6w0aHQ
 by5jsGRVRyvb1GA==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_064206_148288_376E9FD1 
X-CRM114-Status: GOOD (  20.86  )
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
2.51.0


