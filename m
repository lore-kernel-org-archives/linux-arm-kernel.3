Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06FBFC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 10:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FI0KET2396AG2bmzWPUfgR4dCIu3JaSFpp6lmpHGh28=; b=HdHiCps6UxNEIk8ZLRKXBVT/AG
	huHniLWe32GqZaysvmxc3AT9MZh4XkZoudDXjttCFafnToj4nhAxWx+loYA0bSF2qBdAHhU8HaXLt
	utjutASVxOIOcV7Bbpa0fF6GhdR5qP5Uo0zO29ffRWC/qb0QuuCZy04bAAjE4T+PGW+Ljt+A0LvKS
	2Jn8A9T65WRxt6Y47SlVu4bfdaZMJWo0KC9rpWsMqBJNYhsRk1zFZL5ISDVSe4FbLTK8gNJojGZ1l
	guzp4rPzOU1qVYIOT+2XgFq+4cUwzBCMicYTSUI4Nf41EnAtYFQV49rVrFnZeGU6tfLJhXyGEdV0/
	hNdOg/yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7Oo-000000093y8-24RN;
	Tue, 21 Jul 2026 10:08:30 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7Om-000000093xd-1xYZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 10:08:30 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so79091445e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 03:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784628507; x=1785233307; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FI0KET2396AG2bmzWPUfgR4dCIu3JaSFpp6lmpHGh28=;
        b=H+y2Y364uWdNgQXTvQ+ZupHz3I7ysyrzCzjLV8qCAQV2e+eG5Y9fyrOYuBz/Vv1tZg
         XwJYSirkQcm5KJvz73YvjpXbg/gi+jVFx2DaRzeCvZt+SsB+3Ij7fg95Gk1t3L0X5K3Z
         oREgNiE6lcmUcbSNZ5YR2OffzMmMQY+i/apM/SX9i3qxzOMY0WlZ/jeSKVpxJEx5Kim4
         9aCCMbj2kGgtnqrfSLC4y+4fNexC7TphNoGM0e7iE5sQRPfv2p8oCL/F7tzF8IJXLqFg
         xLbIex0OiKT284CmImjEMbIcbl2j7gBYeJIMNpTaCOhLoRmp4RYDiSbdCnxxkkaFK4Ba
         XtwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784628507; x=1785233307;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FI0KET2396AG2bmzWPUfgR4dCIu3JaSFpp6lmpHGh28=;
        b=ok4ipCUg9t1IADR9M96Jh7NcvhZjf+1U8nIg1bGl2loDRsdzc699y9KFxSnvj9AC+b
         YFZkuH2k+wRkXO3bqT4vzIVBapkIqRebZeh4R0Frlw3npMkpeFDpcdHJrlbOL4o074B/
         cGdj8qhNmn0f4hOQccPZh7i7A++ecZ1+Efv3jwqIxNy4W7UoVsuYiof1LGs9G6RC6TSm
         DpY3z9CKiB2tkfVY/LCnrPB3h/kLb9ZYkNkCJKd5hBQ+/pPRrdkLR9DCuQa9rTvvFSAx
         ovNSDcfbJkJK1sv5WEgteo7KReTA8Hh/VtXtThhmLjILfhpOK8BgrW3kCnckdiadeM5Y
         F6mQ==
X-Forwarded-Encrypted: i=1; AHgh+RpgqIs+SG2L/F5Y5BUH0X1wD5c2oecQiaEhgGZ68JS5z2ed3O/FKTcJR8Yvdzj/yf3b8fd1aiANj4ucF3GKkpRN@lists.infradead.org
X-Gm-Message-State: AOJu0YzkwC0QFuyceM3SIIDtgRHtCbS36Lw+lA4GOumissTAiJ4T+2ja
	Pe0tWbKe9U/vGphICylF9Jt1Hcux4lgnxRMBnxpvXdSjG9QOtFJmwVaW2n1/6HYBzPI=
X-Gm-Gg: AfdE7ckjJw1VDtA1JoKq3WqADIMwbaB1wsThsYU9zu5+hRWtkMhhoVk5jCBjOiZINS1
	s7oKBEKnwhWam36rk0CvgTIychGFio6CEKCcV3IABgrimJ9DLNNmqRC38h0E2wnloE+FU9bBVK3
	D/TsmcP9VjVPvAFUZupaBDa4nC3sOpT7bd7WhCvrzvBnpnlWMX+wJlW8KWgIiDuFCCe994LPOkL
	svodzmhLzzwvj1NSjg9wNtBmV7bjzMOvvsbzSrfw70PdWg5RqJSk3fE3tS0Jo5N2AILDmefXnHF
	KYMwtXuqZZWBDD/rotUdk/8rWQqefYIDQ10S/cvda6o3qFnaSKdmQb21XvPkFC4wI54tQm6w1JE
	rLJ281fO5fDeKspxwG7JEH+OemyZyaIxPCM/S0zZjaJABOsrJJt+KpIiQu6/q6bFlGF91B8zWdG
	IB
X-Received: by 2002:a05:600c:3b2a:b0:495:5e86:4e11 with SMTP id 5b1f17b1804b1-4955e86514amr81586145e9.12.1784628506512;
        Tue, 21 Jul 2026 03:08:26 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:3b11:1fce:47ee:c5bf])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-495686a8600sm17987115e9.6.2026.07.21.03.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:08:25 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 21 Jul 2026 12:08:17 +0200
Subject: [PATCH] clk: fix self-consuming provider module pinning
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-clk-provider-pinning-v1-1-63db2e667993@baylibre.com>
X-B4-Tracking: v=1; b=H4sIABBFX2oC/yXMQQ6CQAxA0auQrm3CFAXjVQwLmClQNWXSUUJCu
 LujLN/i/w0Sm3CCW7GB8SJJZs1wpwL81OnIKCEbqKS6bMihfz0x2rxIYMMoqqIjOqqas+vpegk
 d5DQaD7L+t/f2cPr0D/bv3wv2/Quu+Y/SeAAAAA==
X-Change-ID: 20260721-clk-provider-pinning-123741b285da
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8923; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=7axfKhlFixgj6+iB7x6Qmp3+YuxjTQjdJCNQX8ekAXE=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqX0UXqVsuU1cko6N5fhYepVqAFGEWnJE1WrZSz
 MDGob/tLyOJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCal9FFwAKCRDm/A8cN/La
 haRoEACW8JuaPuS5hInuF58y4Ik59KEw9g9+PjhrilOntlEntZR1cpuuf9TpPoJAfLIyBnlFKcX
 wsFBfmFjJM89yVBOAWbj9R81dftchc5T/xruDlN1+NXq1MsiALk49chA9gRUgnGdNcwW2cdVenN
 u7H6iWulJpT+2U/Y0t8t5m4/U2lJr7czoqHVckEh2vG8GYL4Bd/zahtrbcx17AbhTEXfZJr1p8k
 EUKoLQikB61l2EFrU4K8pKGMLq7w+ScXzYq+96rxMWWgsS676jgss4tj7Z6IARyC5VxCmhj5qJd
 RzblA37eLfToU77SamNms2JcIie64fnP8a5RagCXVp9mMWopqspbWs1HsDJwbFQvEPYitbSD4c1
 VOHU8z1CLyMz2bNCoOB4OaLskYdALj/8BNgxzLg0Tb3W79mVVzGFTQuzEsAQYaVU6tRWofB5Lwh
 3fYo1sGQuSNjr42eWE232/KEgbXscUNn8mN3pG0ehrHCay83ibXMbBlWtwYqUS6oUI6QVNsj4BR
 TRCq64luGHwupYUD+t1pU4tvmelLoUx0jRqn+5WVr7/MsNC7ry187ChcLgRoFlnxiBtjPzHuwb7
 cqEWBNERjR86CO9KbL5O0WmWQns7wMcv4Wt6AWmT2+FRspmM8eQxv8BAI/+n/QgevMhCqAZHrKB
 NyeJR2XqmG/4c9A==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_030828_571881_8A564F36 
X-CRM114-Status: GOOD (  27.05  )
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

clk_hw_get_clk() lets a provider get a struct clk for one of its own
struct clk_hw.

When a struct clk is created, the module usage count of the provider
is unconditionally increased. For a self-consuming provider, this means
it pins itself and the module can never be unloaded.

Increasing the module usage count should only be done when the consumer
lives in a different module from the provider. Use THIS_MODULE to
capture caller's module and increase the module usage count accordingly.

It is OK for consumer-only APIs such as clk_get() or of_clk_get() to
pass a NULL owner. As a result, any provider module will get pinned,
same as before.

Fixes: 30d6f8c15d2c ("clk: add api to get clk consumer from clk_hw")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
This issue has been present for a while. Virtually all users of
clk_hw_get_clk() are affected. The majority are compiled as builtins
according to the defconfigs. It is not problem in this case but it is
if the configuration is changed to module.

The following modules are using clk_hw_get_clk() and are compiled as
module with some shipped defconfigs:
* drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
* drivers/phy/cadence/phy-cadence-sierra.c
* drivers/pwm/pwm-meson.c
* sound/soc/codecs/lpass-va-macro.c

Currently those module cannot be unloaded once they have been loaded.

"""
rmmod: ERROR: Module blabla-module is in use
"""

I initially thought about using the dev parameter and compare it
against the clock own device but this proved unreliable. A clock
does not always have a backing device and some paths, such as
clk_get_sys(), do not provide a device either.

With this applied, we can get back to removing the direct usage
of the struct clk in struct clk_hw and eventually remove this
struct member entirely.
---
 drivers/clk/clk.c            | 40 ++++++++++++++++++++++------------------
 drivers/clk/clk.h            |  5 +++--
 drivers/clk/clkdev.c         |  4 ++--
 include/linux/clk-provider.h | 17 ++++++++++++++++-
 4 files changed, 43 insertions(+), 23 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 048adfa86a5d..519160f0bb8d 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -115,6 +115,7 @@ struct clk {
 	unsigned long max_rate;
 	unsigned int exclusive_count;
 	struct hlist_node clks_node;
+	bool pinning;
 };
 
 /***           runtime pm          ***/
@@ -4147,7 +4148,8 @@ static void free_clk(struct clk *clk)
  * used by the framework and clk provider respectively.
  */
 struct clk *clk_hw_create_clk(struct device *dev, struct clk_hw *hw,
-			      const char *dev_id, const char *con_id)
+			      const char *dev_id, const char *con_id,
+			      struct module *owner)
 {
 	struct clk *clk;
 	struct clk_core *core;
@@ -4162,7 +4164,13 @@ struct clk *clk_hw_create_clk(struct device *dev, struct clk_hw *hw,
 		return clk;
 	clk->dev = dev;
 
-	if (!try_module_get(core->owner)) {
+	/*
+	 * Pin the provider module only when the consumer lives in a different
+	 * module. A provider getting a clk from its own clk_hw would otherwise
+	 * pin itself and could never be unloaded.
+	 */
+	clk->pinning = owner != core->owner;
+	if (clk->pinning && !try_module_get(core->owner)) {
 		free_clk(clk);
 		return ERR_PTR(-ENOENT);
 	}
@@ -4173,24 +4181,19 @@ struct clk *clk_hw_create_clk(struct device *dev, struct clk_hw *hw,
 	return clk;
 }
 
-/**
- * clk_hw_get_clk - get clk consumer given an clk_hw
- * @hw: clk_hw associated with the clk being consumed
- * @con_id: connection ID string on device
- *
- * Returns: new clk consumer
- * This is the function to be used by providers which need
- * to get a consumer clk and act on the clock element
- * Calls to this function must be balanced with calls clk_put()
+/*
+ * Internal helper backing the clk_hw_get_clk() macro, which passes the caller's
+ * module via THIS_MODULE.
  */
-struct clk *clk_hw_get_clk(struct clk_hw *hw, const char *con_id)
+struct clk *__clk_hw_get_clk(struct clk_hw *hw, const char *con_id,
+			     struct module *owner)
 {
 	struct device *dev = hw->core->dev;
 	const char *name = dev ? dev_name(dev) : NULL;
 
-	return clk_hw_create_clk(dev, hw, name, con_id);
+	return clk_hw_create_clk(dev, hw, name, con_id, owner);
 }
-EXPORT_SYMBOL(clk_hw_get_clk);
+EXPORT_SYMBOL(__clk_hw_get_clk);
 
 static int clk_cpy_name(const char **dst_p, const char *src, bool must_exist)
 {
@@ -4712,7 +4715,7 @@ struct clk *devm_clk_hw_get_clk(struct device *dev, struct clk_hw *hw,
 	if (!clkp)
 		return ERR_PTR(-ENOMEM);
 
-	clk = clk_hw_get_clk(hw, con_id);
+	clk = __clk_hw_get_clk(hw, con_id, dev->driver->owner);
 	if (!IS_ERR(clk)) {
 		*clkp = clk;
 		devres_add(dev, clkp);
@@ -4759,7 +4762,8 @@ void __clk_put(struct clk *clk)
 
 	owner = clk->core->owner;
 	kref_put(&clk->core->ref, __clk_release);
-	module_put(owner);
+	if (clk->pinning)
+		module_put(owner);
 	free_clk(clk);
 }
 
@@ -5280,7 +5284,7 @@ struct clk *of_clk_get_from_provider(struct of_phandle_args *clkspec)
 {
 	struct clk_hw *hw = of_clk_get_hw_from_clkspec(clkspec);
 
-	return clk_hw_create_clk(NULL, hw, NULL, __func__);
+	return clk_hw_create_clk(NULL, hw, NULL, __func__, NULL);
 }
 EXPORT_SYMBOL_GPL(of_clk_get_from_provider);
 
@@ -5307,7 +5311,7 @@ static struct clk *__of_clk_get(struct device_node *np,
 {
 	struct clk_hw *hw = of_clk_get_hw(np, index, con_id);
 
-	return clk_hw_create_clk(NULL, hw, dev_id, con_id);
+	return clk_hw_create_clk(NULL, hw, dev_id, con_id, NULL);
 }
 
 struct clk *of_clk_get(struct device_node *np, int index)
diff --git a/drivers/clk/clk.h b/drivers/clk/clk.h
index 2d801900cad5..5009380863a9 100644
--- a/drivers/clk/clk.h
+++ b/drivers/clk/clk.h
@@ -23,13 +23,14 @@ struct clk_hw *clk_find_hw(const char *dev_id, const char *con_id);
 
 #ifdef CONFIG_COMMON_CLK
 struct clk *clk_hw_create_clk(struct device *dev, struct clk_hw *hw,
-			      const char *dev_id, const char *con_id);
+			      const char *dev_id, const char *con_id,
+			      struct module *owner);
 void __clk_put(struct clk *clk);
 #else
 /* All these casts to avoid ifdefs in clkdev... */
 static inline struct clk *
 clk_hw_create_clk(struct device *dev, struct clk_hw *hw, const char *dev_id,
-		  const char *con_id)
+		  const char *con_id, struct module *owner)
 {
 	return (struct clk *)hw;
 }
diff --git a/drivers/clk/clkdev.c b/drivers/clk/clkdev.c
index abaa0f9e0083..919fc680ae4d 100644
--- a/drivers/clk/clkdev.c
+++ b/drivers/clk/clkdev.c
@@ -88,7 +88,7 @@ static struct clk *__clk_get_sys(struct device *dev, const char *dev_id,
 {
 	struct clk_hw *hw = clk_find_hw(dev_id, con_id);
 
-	return clk_hw_create_clk(dev, hw, dev_id, con_id);
+	return clk_hw_create_clk(dev, hw, dev_id, con_id, NULL);
 }
 
 struct clk *clk_get_sys(const char *dev_id, const char *con_id)
@@ -105,7 +105,7 @@ struct clk *clk_get(struct device *dev, const char *con_id)
 	if (dev && dev->of_node) {
 		hw = of_clk_get_hw(dev->of_node, 0, con_id);
 		if (!IS_ERR(hw) || PTR_ERR(hw) == -EPROBE_DEFER)
-			return clk_hw_create_clk(dev, hw, dev_id, con_id);
+			return clk_hw_create_clk(dev, hw, dev_id, con_id, NULL);
 	}
 
 	return __clk_get_sys(dev, dev_id, con_id);
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index b01a38fef8cf..22e131b8c97b 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -37,6 +37,7 @@ struct clk;
 struct clk_hw;
 struct clk_core;
 struct dentry;
+struct module;
 
 /**
  * struct clk_rate_request - Structure encoding the clk constraints that
@@ -1401,10 +1402,24 @@ static inline struct clk_hw *__clk_get_hw(struct clk *clk)
 }
 #endif
 
-struct clk *clk_hw_get_clk(struct clk_hw *hw, const char *con_id);
+struct clk *__clk_hw_get_clk(struct clk_hw *hw, const char *con_id,
+			     struct module *owner);
 struct clk *devm_clk_hw_get_clk(struct device *dev, struct clk_hw *hw,
 				const char *con_id);
 
+/**
+ * clk_hw_get_clk - get clk consumer given a clk_hw
+ * @hw: clk_hw associated with the clk being consumed
+ * @con_id: connection ID string on device
+ *
+ * Return: new clk consumer
+ * This is the function to be used by providers which need
+ * to get a consumer clk and act on the clock element
+ * Calls to this function must be balanced with calls to clk_put()
+ */
+#define clk_hw_get_clk(hw, con_id) \
+	__clk_hw_get_clk((hw), (con_id), THIS_MODULE)
+
 unsigned int clk_hw_get_num_parents(const struct clk_hw *hw);
 struct clk_hw *clk_hw_get_parent(const struct clk_hw *hw);
 struct clk_hw *clk_hw_get_parent_by_index(const struct clk_hw *hw,

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260721-clk-provider-pinning-123741b285da

Best regards,
--  
Jerome


