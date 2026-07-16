Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B842AC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 13:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZFzMVT/fxpUw3oGY/5v1mJvn+DMLkKwLSq2ofWAuoMc=; b=x79rXZYCj0Z/LFui/wpCBMOXI6
	tTk2xra4uIFvwx0LzbjJMou3Ho83LNNjpTUWRAlpP4a32p+h2xfulzAD59x+zz8HgDk+OIaNGJ33n
	T1wsb0uuz0r8P37gHpoPyH+S/BIKrgcSqdjR8hzFwRuzYkRUU3ROqZMRJeyG0gmk4NctpWe5rvUbH
	txS+UCU54LFcTh5DYLMUvHbTEJSpjg4l7XF+29pPB7SFH/CnREMVLiiNm6sSpDPcEyQJo2WZT1/Zk
	L7qPLe0eBU+udw7gRFE0WY66XojZUqnLWw4BUgpOPxE/2bc1Q70UsGhQ0EJIoaDZQ587SHftYcbby
	+lyWmd0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkM6a-0000000HNtm-2Dzn;
	Thu, 16 Jul 2026 13:26:24 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkM6X-0000000HNtO-3w2r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 13:26:23 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-47defd0c1c5so2552252f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 06:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784208379; x=1784813179; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZFzMVT/fxpUw3oGY/5v1mJvn+DMLkKwLSq2ofWAuoMc=;
        b=giOCt9sJ3jUbIARpLBjhl93nhXdrYsUjv9RKD/WGBwsUHBLJo2ytwjZKg8kuxy3MdX
         tZDkJwqoEXTC+HJVLtPy+ubTflQSIchPJaUIGdK1RXzgXUOnbVNlgzE43R42p7BkR23O
         1xr/N3Ml3+mqVfvK2sWG6kDX1FoK2X2fG5Tep2lAGgAmEw0UF5EIkpVHtXlV0viKCCW9
         wBR195i7j052DPO/iBxF04zh6YByQ5jkWGJQ6SkFNL6vn40sFkj7yoDybLMOJz9wTpLi
         nzW7n1oVc3xwIX3DVi7CuE9cTWIJBGPfWDaCS484prSR8qI/rpolR0CfpjfUn47qLqiM
         dMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784208379; x=1784813179;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZFzMVT/fxpUw3oGY/5v1mJvn+DMLkKwLSq2ofWAuoMc=;
        b=F+rIbtY3i/Yr5tKv/iUght4fptxgkBZP9K1Q+uKTYvYL3CCtFSi/rGjo55OACcsUCc
         wgcDlNeT04I8Dq3tFIgclgRj1VwMOy3+Yag/1+ZWh0NT0zpWolIK0rOGz8gIiV9WMzj3
         1+i6bciwyRih1fgr7aQctgns3s8eTd2g0EkuIgh06pC84fJWDyw5M7rOb3sRta3OFr+I
         ZgPR0kHcCKL4w7bPl2zTdWKauUAfNi1M9G41GLBNXxnQef11VhNOIcBYb70xNFVIpPEi
         dn2dpAfPWL++PprMillyKilSxKyZtO4rp0V7J6xvTVeIXJK+7GQN+oI/oRnGZ3AtHJig
         qbHA==
X-Forwarded-Encrypted: i=1; AHgh+RpyfVD6Rm1XYrctaWB73ujAiSSUXbaUfQw+Jccmjb+OZLfkoG+cnlKOwSGHkRWefVYigoN3UQ9UPZA3f5dYHZHt@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6GLwFwKnaB0JW+9aldCohOig4X975Jt1kYxv0MMkybdY4qwo8
	AIdqKAfACrvC+TtMTHt5LrX2VBC/nSL+DxyTdtWWDGfTFiW3kSaH5WqNl8aQYJy71CM=
X-Gm-Gg: AfdE7cn3c22HWdjCrQY4ijedAixcHGgw994WJoLJGxfyuYqLzKueHWH0kWIsKtirgdW
	WlrYrCCc5HSh4RQZ/9sRuMroTPe0VUfB2Ypw6jUBJ/O1M9z2ojq6NJXW64N64vvyo+nfqxkBF8j
	azKJa68s0J9R6/qnEB30hlDHzeAAK2ymsmrH17IYkqeVkcbI05ejsoIgoBMbe+CXK3dp4hholu9
	/lH6yEeU+ZZxENajRWpU/Rip2aNF2As07u6yJNmuS36CaPX1KgYFtiL/rkWw3C034eAABb1yd7v
	V7ptdo9W47r725PUUzn+CpYadIzsLepcap3KB82QBYqFq6bwuSpMwpobnokIbSr5Zf1BZ2FHtxN
	Q1EphLQJaxsRhZdR+fcr0tBmlrhRi4iet4IDU1bH7+RLwcmTwhp+c0GiWa6NuNh5zqocYp5uPyn
	XWRj6KAgOKIAVPwrmLGiZYaRb7fEvNd9mvWlzwNp4LduE7/1x93YSaBOWo1pnIGIfgeA==
X-Received: by 2002:a05:6000:4020:b0:474:d7a5:4b7a with SMTP id ffacd0b85a97d-47f2dcd7881mr26682749f8f.28.1784208379566;
        Thu, 16 Jul 2026 06:26:19 -0700 (PDT)
Received: from localhost (p200300f65f47db046a548a0537ec1e67.dip0.t-ipconnect.de. [2003:f6:5f47:db04:6a54:8a05:37ec:1e67])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f4635c86csm24865590f8f.16.2026.07.16.06.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 06:26:19 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	Xu Yang <xu.yang_2@nxp.com>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pmdomain: imx8m{p,}-blk-ctrl: Add MODULE_DESCRIPTION
Date: Thu, 16 Jul 2026 15:26:03 +0200
Message-ID: <20260716132603.2327847-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1475; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=NHARLWYGn7PxNM5VybiPt8610aUjwy8ufPU3G4O7DKc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqWNvr7p362KrSgGq/MwLyX8ePENAWBwuUho0S1 lBUfqJ+5pyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaljb6wAKCRCPgPtYfRL+ ThA4B/9DIt4u0eyuHj/nw4Z16VgiLTd8MFcgifqNi2C8wE6iMPf1Zrnp0omeMA/j5+vNpgbrl1b 4kV0Lnmg20mwZG+5yg7Ql0i/JqOSnv7SsM1fuhOHM19Hj8Gma+5H8Rk9T8aZtgxA05fXFrRJrRY wHgH3WWKLd6+TTw/qQHH+Bur8l+ACjmM4uKMH5t/5HmbwkrIQ8MlVVS6ETk8MwfWSVeq9cOjFHq nxA8HWCFjQBuoQQBICzPidpgeR5Lx+otFs9lV6TzFmz2vYRuOg0x0D7q/Ar8H267Ztm8rJFHFPZ A4FQIv2xwLveDoTdFYFpyClqJUquC1pZUib48KBQZ468YQ9F
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_062622_013758_CA328DBC 
X-CRM114-Status: GOOD (  10.91  )
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

Without a module description modpost emits a build warning:

	WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pmdomain/imx/imx8m-blk-ctrl.o
	WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pmdomain/imx/imx8mp-blk-ctrl.o

So add the required string to these two drivers.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pmdomain/imx/imx8m-blk-ctrl.c  | 1 +
 drivers/pmdomain/imx/imx8mp-blk-ctrl.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
index 99d100e1d923..479789009c7f 100644
--- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
@@ -953,4 +953,5 @@ static struct platform_driver imx8m_blk_ctrl_driver = {
 	},
 };
 module_platform_driver(imx8m_blk_ctrl_driver);
+MODULE_DESCRIPTION("NXP i.MX8M power domain driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
index 3f5b9499d30a..d255c20f58e2 100644
--- a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
@@ -890,4 +890,5 @@ static struct platform_driver imx8mp_blk_ctrl_driver = {
 	},
 };
 module_platform_driver(imx8mp_blk_ctrl_driver);
+MODULE_DESCRIPTION("NXP i.MX8MP power domain driver");
 MODULE_LICENSE("GPL");

base-commit: b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
-- 
2.55.0.11.g153666a7d9bb


