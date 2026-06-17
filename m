Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9AACD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 06:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zi7bJtc6YWd0kE62wpRt5fZoTo2Bu+AejfibFRsUbNM=; b=ejsvv0qUWSrJUkIpIdpHYJeAUg
	bbbGLJxKn38pve2sF70++K1uRI+HypUlGx57Nc6bj0Mi2rYoM8McmuCCXXhzV3zBU7F3/e297qckc
	0ANxKek6QV3B9QMNNrzg1ofcQTEpnhGlVVKJtLAr+3pOEAKIwUtFA0OmzqZNW0Z40GZceAkSt8sK+
	kHGNCXJnjeoeofyI0oKu2X/KM6LcLW4F/xa4rgnYrqhXDzTE2Lmut5HnyB/O3rgIMki8fKQ83/kBd
	aU+o2ovksjRLn5LKWNHj00U4Rlc+a2ZbRg7NTQO+tKwkBwwDkUth2rn844Cs9dUdZR0ZOLJVOBzYk
	7+gINwHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkBq-0000000Gko0-0GSm;
	Wed, 17 Jun 2026 06:55:58 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkBh-0000000GkgD-3Muo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 06:55:51 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781679344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zi7bJtc6YWd0kE62wpRt5fZoTo2Bu+AejfibFRsUbNM=;
	b=i06CKHNF3P9ayFrqPakUUujfP/xEcSGugoL5+tlD+8UKTbX2qJUlYHNadJJ4gQc6sX6FXv
	Q+GbJsaeLTUyld7/VQcfe6qn3gKdoG5TD+AgEu1YKKkDZtN2a1RHMXDb7WaXIbo/xya4cE
	85KLBD/CX+jotJcd/XxluSYtzapCDiplDVv2Dn64j102A5AYZvK9DzovNUIHrBBc0UcjXY
	jgWkcDRLHpS5ctpDHQzQIWon3RFlIFunuJAGgYuBbHeBfyotLHD8iYPCLoS8qRdjcIIjKA
	Zi35e9tqkp78ZNdKxwnJM2+CxLRoJhWoVl15HRrn73u4bi3KevU9eCxpGg9Eyw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781679344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zi7bJtc6YWd0kE62wpRt5fZoTo2Bu+AejfibFRsUbNM=;
	b=7G1rpFUAPhXKOS2LGUVkf8TEJ5GR4/5rZ9knOYLeathW7ZT4PB3Zei+2xhGH+RmNKWf7zP
	rFTesBrFJFLbywBg==
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
	Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH v3 01/10] mailbox: imx: Forward the timeout/ error in imx_mu_generic_tx()
Date: Wed, 17 Jun 2026 08:55:26 +0200
Message-ID: <20260617-imx_mbox_rproc-v3-1-77948112defc@linutronix.de>
In-Reply-To: <20260617-imx_mbox_rproc-v3-0-77948112defc@linutronix.de>
References: <20260617-imx_mbox_rproc-v3-0-77948112defc@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_235550_002955_7B7780D6 
X-CRM114-Status: UNSURE (   9.19  )
X-CRM114-Notice: Please train this message.
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

imx_mu_generic_tx() for the IMX_MU_TYPE_TXDB_V2 type polls on a register
which may timeout and is recognized as an error. This error is siltently
dropped and not dropped to the caller.

Forward the error to the caller.

Fixes: b5ef17917f3a7 ("mailbox: imx: fix TXDB_V2 channel race condition")
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mailbox/imx-mailbox.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index 246a9a9e39520..0028073be4a71 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -227,6 +227,7 @@ static int imx_mu_generic_tx(struct imx_mu_priv *priv,
 	u32 val;
 	int ret, count;
=20
+	ret =3D 0;
 	switch (cp->type) {
 	case IMX_MU_TYPE_TX:
 		imx_mu_write(priv, *arg, priv->dcfg->xTR + cp->idx * 4);
@@ -259,7 +260,7 @@ static int imx_mu_generic_tx(struct imx_mu_priv *priv,
 		return -EINVAL;
 	}
=20
-	return 0;
+	return ret;
 }
=20
 static int imx_mu_generic_rx(struct imx_mu_priv *priv,

--=20
2.53.0


