Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B88BCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w6L3QaVhgFzYQ29lWW6OlEsvKNadnP7rsB1TYXpG4yQ=; b=c0saikjaDKwIneRFAVxpsxdcRj
	/I5vigPW76k8f0LDWr4BjNbjoszfTqc166xxGfDfA0HJz4ZczcjGr0E5PmFVkO/9gznFk/VLapUGl
	iK/mxYRWbVY0S5N4rN15cRuDJ1sKaFUwhcYNvFY2/+EOYujaVECcBv2NhegAa4IkzkdMjVwwiLa+H
	lDqCk7Yxovs15zJVYbSbZff4kaVZ3JUfiCyw0v9mS2LayaI3CNCbjIRAgZSixb8Dx1Gb4yH1rAGKL
	kGY3uhcCLSUsXGC43sqEW6L783WwRpg+0XaeOKIebj8QhBCrw6SZoP2JOC45W/NIZ7JjNZsBUWU2P
	YpWC9rSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCWm-00000008HOV-0cLV;
	Thu, 01 Oct 2026 08:52:32 +0000
Received: from mta-64-225.siemens.flowmailer.net ([185.136.64.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCWg-00000008HKz-0z7q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 08:52:29 +0000
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202610010852200e0efaa7c400020705
        for <linux-arm-kernel@lists.infradead.org>;
        Thu, 01 Oct 2026 10:52:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=w6L3QaVhgFzYQ29lWW6OlEsvKNadnP7rsB1TYXpG4yQ=;
 b=ew3gH/qhLinU97JQEobLwagqDv4Cj726XeVfMqSZJsZ6MxfhgNZwyzPldU0xy39l2l2uzK
 JbOrlmYbME7Kl7maJcGCJYcBfDbBqiOvf/NyYOijEqsU2raZ1CkKhCoI0ODLCFJlyfpe4pOt
 e9ISAi9GIExZGGvEBMoDAdRi7/lSwbGQ08PS1Ne8WsOuasAE64ANXyjVLxZoOY5uouCDJaqw
 JJL7xLOIsIsEMlr/EO+y27fIvgh/eUP0h+4e13wKNLwsYPDMOEiW5m+nNGuM9huw2TcPzZqp
 KL52xEi/NU8Mta8fLGBz2GCVge49jzpWRXLGLWtzmnzonF+/v6IY4BXQ==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-gpio@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Linus Walleij <linusw@kernel.org>,
	Lokesh Vutla <lokeshvutla@ti.com>,
	Nishanth Menon <nm@ti.com>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/2] pinctrl: single: don't leak group/function tables on consumer re-probe
Date: Thu,  1 Oct 2026 10:52:10 +0200
Message-ID: <20261001085217.1778645-2-alexander.sverdlin@siemens.com>
In-Reply-To: <20261001085217.1778645-1-alexander.sverdlin@siemens.com>
References: <20261001085217.1778645-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_015226_901481_8192179B 
X-CRM114-Status: GOOD (  13.36  )
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

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

For every mapping pcs_parse_{one,bits}_in_pinctrl_entry() builds a
pcs_function, a value table, a pin array and a pingroup-name array and
registers them via pcs_add_function()/pinctrl_generic_add_group(). The
core deduplicates groups and functions by name and keeps the first
instance for the controller's lifetime, so the tables built for any later
mapping of the same node - e.g. each consumer re-probe - are dropped by
the core and leaked.

Free the redundant copies once the function turns out to be a duplicate;
the group is deduplicated together with it. Don't remove the deduplicated
instance from the core: its selector is a plain counter (num_groups /
num_functions), so removing any but the last entry corrupts the selector
space.

kmemleak stays silent because the leaked tables remain reachable from the
controller's devres list.

Fixes: 8b8b091bf07f ("pinctrl: Add one-register-per-pin type device tree based pinctrl driver")
Cc: stable@vger.kernel.org
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 drivers/pinctrl/pinctrl-single.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index e0eb7240a9859..e75e32723100d 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1097,6 +1097,19 @@ static int pcs_parse_one_pinctrl_entry(struct pcs_device *pcs,
 	} else {
 		*num_maps = 1;
 	}
+
+	/*
+	 * The core deduplicates groups/functions by name and keeps the first
+	 * for the controller's lifetime; drop our now-redundant copies when the
+	 * node is mapped again (consumer re-probe). The group is deduplicated
+	 * together with the function, so testing the latter is enough.
+	 */
+	if (pinmux_generic_get_function(pcs->pctl, fsel)->data != function) {
+		devm_kfree(pcs->dev, pins);
+		devm_kfree(pcs->dev, vals);
+		devm_kfree(pcs->dev, function);
+		devm_kfree(pcs->dev, pgnames);
+	}
 	mutex_unlock(&pcs->mutex);
 
 	return 0;
@@ -1235,6 +1248,14 @@ static int pcs_parse_bits_in_pinctrl_entry(struct pcs_device *pcs,
 	(*map)->data.mux.function = np->name;
 
 	*num_maps = 1;
+
+	/* See pcs_parse_one_pinctrl_entry() for the deduplication rationale. */
+	if (pinmux_generic_get_function(pcs->pctl, fsel)->data != function) {
+		devm_kfree(pcs->dev, pins);
+		devm_kfree(pcs->dev, vals);
+		devm_kfree(pcs->dev, function);
+		devm_kfree(pcs->dev, pgnames);
+	}
 	mutex_unlock(&pcs->mutex);
 
 	return 0;
-- 
2.55.0


