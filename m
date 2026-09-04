Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DCBC624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 12:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eFTOTrjj7XSWJTGyJNIYb5D6sM8s37aw4r9HKigmpj8=; b=iMRV8iSwAR0MySOzqpeiIyQhqk
	bdJ1albHOXYCiDWb8EYxPB4Xo7aFnn67oT187BeaZKY4gcKSMZUwc94XJr+CrcUl2VZNYslSlR5Uh
	bdyOJXTKIuqYAcx3VpmHdfp3TtT7E1KUdvgTFy4twRv6fTxduTlqqdrbGUEYsgFeybaGx1CavKwY2
	Z3Jx6+AK8i1HobngYV5ou5gQ4wJfPE2R/5IBofCgPo7KcDwPU2rL8ZdRQpXA64uwVzrsh6+3axE+T
	SSzFLfZZZd5i76NEPeLxzYiD4I/+RMZkHMw5P+/hLnkLrcizBTFFTBwE8++qdIJmoZeATBGn779zH
	x5PFjnGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2T6U-000000022jy-1o7n;
	Fri, 04 Sep 2026 12:33:10 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2T6S-000000022jZ-3o0L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 12:33:09 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-4a483a552efso421719b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 05:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525188; x=1789129988; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eFTOTrjj7XSWJTGyJNIYb5D6sM8s37aw4r9HKigmpj8=;
        b=eZwvGhCb//A9DyulNbUfFPuogXgeo6//9+uILhK4D+wn2PvnTdE/kTPrmpS6LIh75S
         btmAxyeIwLGm42c/X8GmGdGLOekHx+1UUY2ycpU0+bK2C9JYgCBzP9BUG2ClhewnmghQ
         gPsq7DScJwO5SjrjZK6uupNhv36e4Njawew8ZzYUeoiaXAem+soP0SOW9i08IR1phn+N
         qMjFT5lBmceNPBXidNet2L4NFQhVBQQBu2RfrAc7ZxWkMsQh302Ey1Y2pTM/ogahCxif
         HtGSG4mfQTQ2wxBYWX3lkbrIcV90B0oFSMhd1OcXEdbrqe1PULAb6OFGc2EclmLUtRHX
         1ALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525188; x=1789129988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eFTOTrjj7XSWJTGyJNIYb5D6sM8s37aw4r9HKigmpj8=;
        b=Xazg7NTYhJGGHKsnd+MDjHPd28bL7wASNmG8Pa4axrS+F466XFFwPVydb4y1ZSkdJp
         xyh/1BRhxWY9ilDpj5Uu733GzJFECMvDy9NwshZzAdyWieO7zU6goktZhfiNOPKRlSdd
         rs9f0zGFsvUuEaPfDm1EwmgBQpGMVsPk9rgwGx7WFgYQOVzHxnQWrbfBpmJMJXmCVF+G
         FkHlmH+C20Ug1oR/5xNRlGsy3hZLI+hu/vvsnO08iOqhYZTYzc6HRqUrhR30Mu9siNv5
         JrUoP5S6jCxOPKn+jcciyhFubx7n/L6ux6fyvcqVcHEfX6fTLbotj2Koy3ug0zLWuKze
         kwTg==
X-Forwarded-Encrypted: i=1; AKwUvBxIQJMH/aaIZtuhQMZ/K3WdKF7aSMpMhNu51Pv+oFwA6Cs7cM2NEHoZm2Kd+8yHXrszOr4ALh0vU8L8sdVvZK72@lists.infradead.org
X-Gm-Message-State: AFuF++mTnIafWI9FJnf+PxLENZX/8jsLGij6qyxZSNSCNujPrAtTC4fo
	mp7Ms7qit+pa7NzAMYAN4qgXjuP9I+H4FI+uWXYp26DmVM8G+Eel3Bj4
X-Gm-Gg: AYBFou2N7424qr/c2KDhk3keM27ji+zEfyHHorRfPJTlMzf/LbzrdiCs2TNgi9Fkns3
	XJKTk+ZkognP+h32aZJ6yQbWJwD8Qz7GtBbLp+aXULAX7DJJG5COexQcTKGOI2uUGxMJUFdka13
	IBNcwWPMqYOnM1nLH7q9cMyUJK4QDp3zgGzsUEMLKHJ7GeEUgSpt2q0uCYYwQRhIV5EvULUAOzH
	Qa5UKt8087S9xrD2fABY0ZNdC3hylE/pHs0+iaUlrBlunVrdCk11lBkxES9WEz1tQa67m7IjNIY
	7RV+ve56BzE+g1DipoAIQfQktCYdhP8On23UzFOcq4o93H0h7YREuj6TaAWL8mf0mY/C+S1X2ks
	alNKGPYeqL9Rz2QuABkWQnxO3kI9KqyjtoyG+GX1MCkmWHOuo4FafgL9LAieiiG7zE7tq1cIui0
	RF0ht3K4/x69Rx7hUURRYYhL+2R1PyUhUq64JZTJbFOUOgj8Zf8XjiZCPMWMnPwaldtQo9G4FeD
	AlFW7Z7EB6UBBcB6GoUHPOueg==
X-Received: by 2002:a05:6820:151f:b0:6b3:bb82:2736 with SMTP id 006d021491bc7-6b6fcac57fbmr4027560eaf.17.1788525187615;
        Fri, 04 Sep 2026 05:33:07 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf26c5sm6343458eec.27.2026.09.04.05.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:33:07 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] pinctrl: fix typos in comments
Date: Fri,  4 Sep 2026 18:02:56 +0530
Message-ID: <20260904123300.36778-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904123300.36778-1-hemanth.selam@gmail.com>
References: <20260904123300.36778-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_053308_969344_9C7E37F9 
X-CRM114-Status: GOOD (  14.57  )
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

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/pinctrl/core.c       | 4 ++--
 drivers/pinctrl/pinconf.c    | 2 +-
 drivers/pinctrl/pinctrl-st.c | 2 +-
 drivers/pinctrl/pinmux.c     | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 1675dd36bd5c..ba6c71e6fc2c 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -147,7 +147,7 @@ int pin_get_from_name(struct pinctrl_dev *pctldev, const char *name)
 {
 	unsigned int i, pin;
 
-	/* The pin number can be retrived from the pin controller descriptor */
+	/* The pin number can be retrieved from the pin controller descriptor */
 	for (i = 0; i < pctldev->desc->npins; i++) {
 		struct pin_desc *desc;
 
@@ -1747,7 +1747,7 @@ static int pinctrl_pins_show(struct seq_file *s, void *what)
 
 	mutex_lock(&pctldev->mutex);
 
-	/* The pin number can be retrived from the pin controller descriptor */
+	/* The pin number can be retrieved from the pin controller descriptor */
 	for (i = 0; i < pctldev->desc->npins; i++) {
 		struct pin_desc *desc;
 
diff --git a/drivers/pinctrl/pinconf.c b/drivers/pinctrl/pinconf.c
index 81686844dfa5..ecc888b029d7 100644
--- a/drivers/pinctrl/pinconf.c
+++ b/drivers/pinctrl/pinconf.c
@@ -311,7 +311,7 @@ static int pinconf_pins_show(struct seq_file *s, void *what)
 
 	mutex_lock(&pctldev->mutex);
 
-	/* The pin number can be retrived from the pin controller descriptor */
+	/* The pin number can be retrieved from the pin controller descriptor */
 	for (i = 0; i < pctldev->desc->npins; i++) {
 		struct pin_desc *desc;
 
diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
index 8ce88e591f47..59ecc295fb8e 100644
--- a/drivers/pinctrl/pinctrl-st.c
+++ b/drivers/pinctrl/pinctrl-st.c
@@ -1148,7 +1148,7 @@ static void st_parse_syscfgs(struct st_pinctrl *info, int bank,
 	pc->pu = st_pc_get_value(dev, regmap, bank/4, data->pu, lsb, msb);
 	pc->od = st_pc_get_value(dev, regmap, bank/4, data->od, lsb, msb);
 
-	/* retime avaiable for all pins by default */
+	/* retime available for all pins by default */
 	pc->rt_pin_mask = 0xff;
 	of_property_read_u32(np, "st,retime-pin-mask", &pc->rt_pin_mask);
 	st_pctl_dt_setup_retime(info, bank, pc);
diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index c705bc182266..574fc95b6712 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -636,7 +636,7 @@ static int pinmux_pins_show(struct seq_file *s, void *what)
 
 	mutex_lock(&pctldev->mutex);
 
-	/* The pin number can be retrived from the pin controller descriptor */
+	/* The pin number can be retrieved from the pin controller descriptor */
 	for (i = 0; i < pctldev->desc->npins; i++) {
 		struct pin_desc *desc;
 		bool is_hog = false;
-- 
2.48.1


