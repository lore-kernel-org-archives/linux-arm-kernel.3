Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F11DC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 05:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=li+qf0ogeiJJV/dt6j1H68lCeDSe/pGSxo0/wCxLe7o=; b=CWL0EVOAgbIzJESBsJI0SwmGTW
	zGLvf+lPLRTVAEtwTZW19tFPaABfeEoNt8y/svncAXnrhUafWbEfzoc+c++n9635SK2E+wqDpoh7F
	Ls3tqRb84FSTyXoDxdtN6pdy/pXq5iGEZgbjPf7aDahmwicnjNuxkBgeyxlY3qAI/MUGOCikn7wGj
	gE0CcvsmaTTw72ySXqOtc68mRM7NQ1Md382ShZ8ypj9aLr8zH5UqRte5b+4fWX8qdb3BWhmUbHl7H
	Js5lNGNVZ6gznmcioBOPlLoMrsToydKFJ7w6A/Twax+QHK51VJl0p9HfsEpKsX3DfwMZJNPZSFPop
	ycCYFydQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxHUk-0000000CXzQ-1JBq;
	Fri, 21 Aug 2026 05:08:46 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxHUh-0000000CXyl-04Ov
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 05:08:44 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2ceab75934dso8892795ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 22:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787288921; x=1787893721; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=li+qf0ogeiJJV/dt6j1H68lCeDSe/pGSxo0/wCxLe7o=;
        b=okZmr0ggnJc3ifHXiSPSS31AETgBR3M7U9Ls0Ls8tHAcM3QJqZ84bpcN28RZnhAcSW
         eHV4aryEzYW+79+Q9G2fHo9rPKz7/oqCOevzHwdZrif3DjqGB33vWFYvHzRVoywUeWqr
         lAjG2DNhSUOumB2fqbNzsO+CAn2cZ9vdYtKmR6o6F6PsRQz4rH2EfGCx7yQ/2O4K3Uzn
         krSRSHm6MX31sOiGuytK3npd1x3bcuLg7g8NZwy4kukIoJeS9rmt6m5l3uclnHSO5n+O
         EUFw4RaNiGXUeX6qmy20kqh8tVNc2NED4rCE3rSiQnoH/MzHrvR4CcPwMn3Ot0ShB1ra
         4ZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787288921; x=1787893721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=li+qf0ogeiJJV/dt6j1H68lCeDSe/pGSxo0/wCxLe7o=;
        b=X1uYjx7fU98wGzDxoKb+0HJd0pAtQz1fynmKvYoKYZScaeMOZWdxx0q6lWgvFSVBw+
         eMAdKK4vNILXcNSagqF1itPz2Aqm2TtJYPVfYBEuJY6ThUME3/o6wCfkSbtDDZGfyIey
         6GaymPU/5Dsx1Fwqj8XzckO97Az50KuMvoY/p0Fb4mbAERl1nQSlo7hwG8jHCA/dkonb
         DhaUmq3c++/MfItjaRIu7NMEX2eUujPZ/L7vILJsmqxodsiQ1SGdXyjfLZ0hbwNnpNNu
         Wk0D3O5r89v9RuJYMd5X8CZoAT2H2BNrXL7mnVoKCeOlON71Qvq+FoYRXgdLdsDcwiV/
         SU2g==
X-Forwarded-Encrypted: i=1; AHgh+RqFBvtvyNi/N8UIl7vRPDvT6L3FDSqGpdT17gLoP7rbkE2/WjLhAo80Ph17PmHOemlTdMPpLddCHTElaFJH65K5@lists.infradead.org
X-Gm-Message-State: AOJu0YyfyoxxR9aGstNgu8Ri/eDT/1WH/SvU2kV3GsTOQYyq2VT1le4r
	RIC8hszz3GKbCb0UJ+PEeGjv8/wHHQvyqVhbD4+s7NiVYtjJUyFN49X1
X-Gm-Gg: AR+sD1093uX94R4fQNtmdEOg7JvLvi9XHJIvOw9+S+CXO0X9qAQ71j97Ztq9uQNpvkT
	4zLy27jP3nf8eMmTLCxYlEzVXj1FN52CRLOTgNrBxpngIsCt6hnEVMJ/bjbJAEqTAZJw8iUYNa+
	q+jvnKQWpkZnMAOIPFnK7oN2/iSZWFrnKsI4t2S4xELsaCrbyTaJlmVZD1wqgZsM9qsGZ/8HYhp
	ep4yeWjlMTFFlSvSNBPwWgUbr8aRpYMpUwdouXn5wD/OSv7LqCRRu89ryYFg0bAKVp04uhIzUl8
	JoLbewbwcq+xZ4dCQqMMkjJYPG0vsmRUhmYuzRsGg6dsYuo1CAHw8QBaARvVRxlP7oC33HpLNYJ
	DSMjkOtr2o8NEczemyj7crXh6MAdlB2wxwzJEzCucram3j2Nx/Vp/UFSDbAkY1pAUs5GsqK7V+c
	InKA1a0MHmkYhHsHv8Vsb5jTkirmkcjkIkmQwuDuRqMEPGlg7O9DuP+17x0vfQa6GY4TejiZlUU
	nr2VDe3GFizteS3PnXM9mXBRhwheRVcMHLlegF7m3fd2Z0=
X-Received: by 2002:a17:902:d4cc:b0:2c9:aae1:a61a with SMTP id d9443c01a7336-2d64b0c6a16mr64910855ad.14.1787288921196;
        Thu, 20 Aug 2026 22:08:41 -0700 (PDT)
Received: from DESKTOP-8BCFI4I ([202.12.123.126])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef3993dsm20673822eec.5.2026.08.20.22.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 22:08:40 -0700 (PDT)
From: Md Rabbani <rabbanyhmm@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Linus Walleij <linusw@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-gpio@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Md Rabbani <rabbanyhmm@gmail.com>
Subject: [PATCH] pinctrl: freescale: imx1: Fix device node leaks in imx1_pinctrl_dt_is_flat_functions()
Date: Fri, 21 Aug 2026 11:08:13 +0600
Message-ID: <20260821050813.739-1-rabbanyhmm@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_220843_060365_E783ECB9 
X-CRM114-Status: GOOD (  11.10  )
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

imx1_pinctrl_dt_is_flat_functions() uses for_each_child_of_node() to
iterate over child and grandchild nodes. When the function returns
early upon finding an "fsl,pins" property, it does not release the
acquired device_node references, leaking their reference counts.

Switch to for_each_child_of_node_scoped() to automatically drop the
node references on early return and loop exit, matching the pattern used
in pinctrl-imx.c and elsewhere in this driver.

Signed-off-by: Md Rabbani <rabbanyhmm@gmail.com>
---
 drivers/pinctrl/freescale/pinctrl-imx1-core.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
index b7bd4ef9c0..4a6bdaefa4 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
@@ -547,14 +547,11 @@ static int imx1_pinctrl_parse_functions(struct device_node *np,
  */
 static bool imx1_pinctrl_dt_is_flat_functions(struct device_node *np)
 {
-	struct device_node *function_np;
-	struct device_node *pinctrl_np;
-
-	for_each_child_of_node(np, function_np) {
+	for_each_child_of_node_scoped(np, function_np) {
 		if (of_property_present(function_np, "fsl,pins"))
 			return true;
 
-		for_each_child_of_node(function_np, pinctrl_np) {
+		for_each_child_of_node_scoped(function_np, pinctrl_np) {
 			if (of_property_present(pinctrl_np, "fsl,pins"))
 				return false;
 		}
-- 
2.55.0.windows.3


