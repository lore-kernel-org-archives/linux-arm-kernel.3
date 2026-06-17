Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50DC0CD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 06:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPOpKVPNdPb4TOM3bAV+KOhZxWjDtfTT/2PKcxNL+lc=; b=CS1iPECi5qo2Wcmzj/iZ9KsWmg
	3UXWxm5iQ5VY0JIcYjqh298n5snqWadw8aG5SDIJWUZ2vgE/G6W39dxRlWQEpB/73LR6d9i0dMS7Z
	TlXG0eNT/K8YYLfLCxT8uu0VIEHfKzvJMQuN7Sye8ZxrpV6t7ODskF5WP66hnRRwBbG/i2471h6kY
	gLResRhzS8IGfG/poqAjwg9SizCDrStxfJ6BwbocFuxMljbRDI/SeArLGPgqnViPf9coDfp+fVZ8/
	1yQSrKSp9M4Et+dZoCJEiOAwec90FayABL+om0ZoEV9UvZWJMMSHdOy3kMkSNuZYevd6peWaQKbus
	w/556huw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkBq-0000000GkoD-0ile;
	Wed, 17 Jun 2026 06:55:58 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkBh-0000000GkgA-3cgv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 06:55:51 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781679344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CPOpKVPNdPb4TOM3bAV+KOhZxWjDtfTT/2PKcxNL+lc=;
	b=yIsxAqn1Qg1C2ffORupU3YGBYG9a6TtH56vcueHWecnXvqr4C6RhNyCT/856JnuMAYURwJ
	emzriGnEvGE5ldCVZADsR04WvQ/Yl4RquNsL7Ss4wYEAJWsh9COfVWrYFxOXismhSo+aXA
	Mm0o9Q8oUZsLbcK6ZSIAxL1yvs8uSG4KxEwHxb/ZBBrbS0T+BJLX01ZOtbrNS3ZM308Shn
	PXmYdzzPP2eyhixaGFZ5IAi38VQwDV/R1p7pAFdTOtrP1UgvgjGHv8UrGljO2ij882fA7p
	QqmN5VbkRxWMwsYrxbUoQEK6v0PViiNfmQbgk7CC5q0lfyI4TSjZst6cnzJRuA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781679344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CPOpKVPNdPb4TOM3bAV+KOhZxWjDtfTT/2PKcxNL+lc=;
	b=mMknssX2ZyXne0SXjNOz7eCEHnUC24neDm8fTVGFkXEMrEMhgLqUUtICNeMRMnwXfINjaj
	sp2ET7KY2f9/bFCA==
To: linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v3 03/10] mailbox: imx: Use devm_pm_runtime_enable()
Date: Wed, 17 Jun 2026 08:55:28 +0200
Message-ID: <20260617-imx_mbox_rproc-v3-3-77948112defc@linutronix.de>
In-Reply-To: <20260617-imx_mbox_rproc-v3-0-77948112defc@linutronix.de>
References: <20260617-imx_mbox_rproc-v3-0-77948112defc@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_235550_066635_915CD76C 
X-CRM114-Status: GOOD (  14.18  )
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

sashiko complained about early usage of the device while probe isn't
completed. This can be mitigated by delaying the pm_runtime_enable()
into the removal path instead doing it early. This ensures that in an
error case the device is removed (and imx_mu_shutdown()) before
pm_runtime_disable() so we don't have to do this manually.

For the order to work, lets move devm_mbox_controller_register() until
after the pm-runtime part. So the reverse order will be mbox-controller
removal followed by disabling pm runtime.

Use devm_pm_runtime_enable(), remove manual pm_runtime_disable()
invocations and move the pm_runtime handling in probe before
devm_mbox_controller_register().

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mailbox/imx-mailbox.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index e261b382d5c90..516a05b64daa1 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -966,38 +966,36 @@ static int imx_mu_probe(struct platform_device *pdev)
=20
 	platform_set_drvdata(pdev, priv);
=20
-	ret =3D devm_mbox_controller_register(dev, &priv->mbox);
-	if (ret)
+	ret =3D devm_pm_runtime_enable(dev);
+	if (ret < 0)
 		goto disable_clk;
=20
-	of_platform_populate(dev->of_node, NULL, NULL, dev);
-
-	pm_runtime_enable(dev);
-
 	ret =3D pm_runtime_resume_and_get(dev);
 	if (ret < 0)
-		goto disable_runtime_pm;
+		goto disable_clk;
=20
 	ret =3D pm_runtime_put_sync(dev);
 	if (ret < 0)
-		goto disable_runtime_pm;
+		goto disable_clk;
=20
 	clk_disable_unprepare(priv->clk);
=20
+	ret =3D devm_mbox_controller_register(dev, &priv->mbox);
+	if (ret)
+		goto err_out;
+
+	of_platform_populate(dev->of_node, NULL, NULL, dev);
+
 	return 0;
=20
-disable_runtime_pm:
-	pm_runtime_disable(dev);
 disable_clk:
 	clk_disable_unprepare(priv->clk);
+err_out:
 	return ret;
 }
=20
 static void imx_mu_remove(struct platform_device *pdev)
 {
-	struct imx_mu_priv *priv =3D platform_get_drvdata(pdev);
-
-	pm_runtime_disable(priv->dev);
 }
=20
 static const struct imx_mu_dcfg imx_mu_cfg_imx6sx =3D {

--=20
2.53.0


