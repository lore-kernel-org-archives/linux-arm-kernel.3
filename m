Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2071F606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 10:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dUgex/Dv;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ENH9FpOe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=wLI3n7dT9jhrlDm7AKISWebGqJni218wwz7fppboSog=; b=dUgex/Dv0ouyeNkn8QXfDLvkO2
	8DY4n6ayBt0O2lnotF6QdVZ7PsVp674FBGFlQAfDexU9jYdg7DDJ3OAYTINYsggKIJlZWo7UQbgea
	CrwiwF04BJNZOjvU2LiGZXxh6nfsOk3pSzgF0IZw/XbQaRkZ84umrf2MsKJUKgW9oexQNXddeuyp7
	uOLHT1RG5D3gdJk+NiRzYJbQBIZ0gsZpIN8Xb28Qiyk4xbbfLDLrqt67d5+QoieXMYns815gFrv9u
	GfyW3KHU7DVHDvAhcRF8nnRE6FnmnAakhmEkAZIliJzsJF7orT87bLl+AwylOjm+PFPlU7ZqD1FID
	qm5ibB+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNpcL-0000000GDig-2fWu;
	Mon, 02 Nov 2026 10:50:21 +0000
Received: from cmccmta4.chinamobile.com ([111.22.67.137])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNpcH-0000000GDg1-3PqQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 10:50:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=ENH9FpOeuA591fFTlmdspBjtLKzeqHj4ycCM3nlnNCkNsFkCaGVR4YyEJa3+fsEe1j+hcPKx8iJ9g
	 Dyhz/F0TvuMO3qv1kxPzdoEH/qPZglTVksS/us34/SpP34qxhNjnWSnBMyqrIWjAUKe05luTK5tNdS
	 r60fAQ5vfSFgA5DM=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86ae86ae0bbf-29768;
	Mon, 02 Nov 2026 18:50:09 +0800 (CST)
X-RM-TRANSID: 2ee86ae86ae0bbf-29768
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16ae86adfc73-cfa2a;
	Mon, 02 Nov 2026 18:50:08 +0800 (CST)
X-RM-TRANSID: 2ee16ae86adfc73-cfa2a
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-pwm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH] pwm: mxs: Disable clock on invalid period error path
Date: Mon,  2 Nov 2026 18:50:05 +0800
Message-ID: <20261102105005.1007-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_025018_419547_784C7A70 
X-CRM114-Status: GOOD (  12.52  )
X-Spam-Score: -2.4 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mxs_pwm_apply() enables the clock when the PWM channel is currently
disabled, but when the requested period is too long to be represented
by the period divider it returns -EINVAL without disabling it again.

The PWM core does not roll back the hardware state when ->apply()
fails and pwm->state is only updated on success, so pwm_is_enabled()
still reports the old (disabled) state after the failed apply.  The
clock is shared by all channels of the chip and stays prepared and
enabled forever, and every further failed apply bumps the enable
count again.

Disable the clock on the error path, mirroring the condition used
when it was enabled.

Fixes: bf29c2ff82fd ("pwm: mxs: Implement ->apply()")
Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
---
 drivers/pwm/pwm-mxs.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-mxs.c b/drivers/pwm/pwm-mxs.c
index e1a3df654..ece42da8e 100644
--- a/drivers/pwm/pwm-mxs.c
+++ b/drivers/pwm/pwm-mxs.c
@@ -78,8 +78,11 @@ static int mxs_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 		if (c < PERIOD_PERIOD_MAX)
 			break;
 		div++;
-		if (div >= PERIOD_CDIV_MAX)
+		if (div >= PERIOD_CDIV_MAX) {
+			if (!pwm_is_enabled(pwm))
+				clk_disable_unprepare(mxs->clk);
 			return -EINVAL;
+		}
 	}
 
 	period_cycles = c;



