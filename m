Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E6FC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 22:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0bAI9mmXm3rd1fs6JBz3Pfb/OV3Rxah7vPEmWuwzOx0=; b=o9QOdMsWkUutW966dkaHmV58IT
	J+3mjml3PjCdABHvZLpr56cF8s4dPf+qzjUTsvgWszrBWMFrfDP7LAxxZqQ4nxYc3DGjQaXHQ/N0m
	V4oxrOyo/jHtiFHgM93nNurKc/gC70m80jikuEBk0KlNAxpoXwZa9Jhrnc09xPXdN/LZLjYJu4Cao
	m8sJcByBfDwIDyXYkAkMvUTBfxzCrY49TuPstRFlGnCY2lmKqbacrYXeo2PWSgu17SmKIbCYQgZgt
	tKsrQI9TGFfonHGWcwVRIhbBhk3nLWXd+QRff/wCfRL/4qQJ4ibOJOIKScQDnn2CmYkte6BtXaZk0
	BL1hJ7+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5siU-000000024ht-2jyr;
	Sun, 13 Sep 2026 22:30:30 +0000
Received: from mail-qv2-x10.google.com ([2607:f8b0:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5siR-000000024hZ-3zIh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 22:30:29 +0000
Received: by mail-qv2-x10.google.com with SMTP id 6a1803df08f44-910704e63a9so6503236d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 15:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789338626; x=1789943426; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0bAI9mmXm3rd1fs6JBz3Pfb/OV3Rxah7vPEmWuwzOx0=;
        b=DCziUMTdrriymzcA26WkdxE+92w7GTk4+ujkgcsdMuZwCe+RQ9KwAG9SPH2zHERQZq
         aTeDxnfwmuCXDzIe2kZ8t0dtMutWFIGTjdqc/fQJOo6WJ6YBSEXEjDGL9zlRfBF9DI98
         7/A/hIBYYVUAwkV76DFslbL/LDuIPuJil1hh6ITPZVabDiB23r+Xv7IUB4mkIu+8A/LO
         pOPmDeF9kSbFaHzcDXt7jwnUScu6jubeptqDoFQ4xi6GTJHvKRW7lJi9m29caHNyxYs5
         dsgggE7c3zJfPUaHpB/yikywLUshflLp5VFa1hTQCT0RKYVeBeIB6zrUExcFVD64aPFP
         HDiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789338626; x=1789943426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0bAI9mmXm3rd1fs6JBz3Pfb/OV3Rxah7vPEmWuwzOx0=;
        b=IZtIqQJ7JHuXyij0Yx3Kg6YmKNemy4iyo7A5lC+kQNwoNfV7m26IDmON+NunSDGQCH
         my3ZK0U59CVV+Ev5WVd0YZu2h624S8WvIg/Km7rP5qwS9V0euUxmjWd7OAtj2o22mTNk
         Y2+ho/+EV+nQrLciQW2Gch3xFpnfpbMiLGjg5Fm3kqwItJEbYQB9L3oSiQKIDLt9ERwc
         pS50IjvUBbHQX1ariy7Dis3TDDv9FK1O8Eht8YZmZzJN4GbmJfvTijVeSwScHteMHwb9
         +ycOVaqcUzS3zu5RaoasFrbvKB6REss0wpK4qCe+vTGTNXR0TV9xYhEBCcTgs5Q183WH
         bhHg==
X-Forwarded-Encrypted: i=1; AKwUvBwwxRd2KjFnkIq9hnaaQ0Y7Tvqb6RDE5TjBhhSBOk4FJdKzhO+3KcOsxPoJYFXUWAOblJXFVad3L413PGJPkkkJ@lists.infradead.org
X-Gm-Message-State: AFuF++lJkYUU/Dxaabn89TR59z+KLeis0dJeYq/xKWd+ShCW9ME6VB7Y
	u8p1oDY/RuxMiQ6aWYV77kzEUnQfJyx7Jkf+54HZetvbP/8BkMv42dI=
X-Gm-Gg: AYBFou1gh86gvJfQwQ+PLjwhVaPVR9lp0ZHTrtrhTEIA1IZ43uVhtn5+41LDpWLaaHR
	ghSQceQD2hwGYL28rivKKwVLWWnMvVdo9EqW3gAKgg1I7AwArcooNp1VpHr9TRbFjmRukOVzSR6
	Zy6DfQxmOAP1g8eHr3QAajYe5y6tqTy0PtdjwcsRvoP68+41uW16RjbdYoE7w4E+rjv588wNXUK
	BXvfrJ+D4pmRIAoNuDC6QqQzCvTRLGsbtgyyI46Es+xkbDV4q0e5krhiZVqI2/0t/rVX545c9/y
	V+ph7JmAwLzDV1Tgaj7d2/xhmtQz5EFxxrxo4tPDGY1WFXwf5XZKCxOUa70JCM3jFgkmu4dktav
	XbT8MckbRHjyI3Vepochb9Q2UUGdNZ1lY0OMgj5AKrJJpo0d1ZCkIEb8JJ9/vXrbBDk3MTDc0xp
	0iPd84Cyg9u/OAaoIAXJdhfqnapLbr9Fm6fZwaey86+lE+PmIbXFvVT4NSi/3Dqh0p3IF+3sloW
	1A+hnzrIrYxOottQkreX8JEGsOarN8sUBCHaChmDldbi30eVZ1hNk4OcZbvRHR/2CXWUNNx/s0U
	lqEAbgw2ichQ1iX9GzWvqe1V8OQ2XKQArPM342gaGQkq
X-Received: by 2002:ad4:4ea4:0:b0:911:2a7e:abbb with SMTP id 6a1803df08f44-91226b71087mr49832196d6.14.1789338626502;
        Sun, 13 Sep 2026 15:30:26 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120ef650a6sm80587576d6.0.2026.09.13.15.30.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Sep 2026 15:30:25 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	=?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
	linux-aspeed@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] drm/aspeed: Balance the display clock enable on teardown
Date: Sun, 13 Sep 2026 18:30:19 -0400
Message-ID: <20260913223019.89651-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_153027_999899_E96AC5B0 
X-CRM114-Status: GOOD (  12.46  )
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

aspeed_gfx_load() enables the display clock without checking the return
value and never disables it on probe failure or removal. devm_clk_get()
only releases the clock reference, leaving the enable unbalanced.

Use devm_clk_get_enabled() to handle enable failures and automatically
disable and unprepare the clock on probe failure or removal.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 4f2a8f5898ec ("drm: Add ASPEED GFX driver")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
Assisted-by: OpenAI:GPT-5.6
---
Validated with an ARM64 W=1 object build and strict checkpatch.
No hardware runtime, clock-failure injection or unbind testing was done.

 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index d4577663a..aa36b79d0 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -189,13 +189,12 @@ static int aspeed_gfx_load(struct drm_device *drm)
 	}
 	reset_control_deassert(priv->rst);
 
-	priv->clk = devm_clk_get(drm->dev, NULL);
+	priv->clk = devm_clk_get_enabled(drm->dev, NULL);
 	if (IS_ERR(priv->clk)) {
 		dev_err(&pdev->dev,
-			"missing or invalid clk device tree entry");
+			"failed to get and enable clock\n");
 		return PTR_ERR(priv->clk);
 	}
-	clk_prepare_enable(priv->clk);
 
 	/* Sanitize control registers */
 	writel(0, priv->base + CRT_CTRL1);

