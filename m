Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30539C88E6A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 09:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=phiJHwRkepb3+2i8AgNorxLeG3jmpMTw91eiZ14pBcE=; b=n2GR3mBqhiYfLLrA9CDbi/Wgrp
	sgPyDXaMP/Hs682pObwnVCz0Xc0bZ4SrHiEHQbQLLf3mN6Ra6VNM8bsDcHX/yStpQ4q+ij8K8X0b3
	AT+2aoA66zZHNbrNXdVb+I2yHRzfXrWbTrk6NUdzZYsOboFQcdytT0VXQ2UNFZIsYd3SrGZCIZTeN
	fWYiJtNCsDUJBCj6r0dWBfM6KwIVuf+COYKYSHXx2bOwYlPzw9qdb6HWAkwOi378hRuc5pWBwlk5y
	2WB4/urPVWAvSQ9Cv9Pn38cPlJXvnHM6dMGEGWMdDbIj3IHSq6uO6UXLvlYbLiMz5GkPe+JTtxg2l
	QFqU7KKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62nC-00000002tKg-05tD;
	Mon, 14 Sep 2026 09:16:02 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62n6-00000002tJk-2Y1I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 09:15:59 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-869d181419bso2797873b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 02:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789377356; x=1789982156; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=phiJHwRkepb3+2i8AgNorxLeG3jmpMTw91eiZ14pBcE=;
        b=lUlNbeeVKKX2YhEPJ7m/RUEAw5pwxfjVC7Kv7pIj6Fudv2tF0CENTe6mLtXXdlSfi2
         3uhNT3AhE/OtfdDab0cPp+8ZldoAiJ6YJEBNn929JiaLAMUSdR5ohFb1sNc/5Mv1mD2F
         41w6jZNtxAC1hOaDClASGw6yWEKdu4WWNUr7xnNnHiBlV9kcF9w4y5z8wIwYXZHxbA3o
         oSzpKE1kk5nww9aW11kVXWIa5EEEniZPKeh2tDmAICye6WQepoJAyhMAxAIuB7rQS2dF
         u2Ae23h06NaDRdGITk6kPOLsgN0XXOoPpdxStGYqP1DONczx4xksdDn+fzxdJs2D+/zc
         2gSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789377356; x=1789982156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=phiJHwRkepb3+2i8AgNorxLeG3jmpMTw91eiZ14pBcE=;
        b=kk9NfHfxsvHdqNRSaJLdro9v5KoG/TRgF6bV1VGEKk44Ite8iGuuHQ6M0RQeTLx4jl
         El6OeN/mXGGtqMPNqoSfzH8i4q6CC9mhx6DWbSM5IKKklwFc7ABuedEOHoIMHBFGdSfJ
         80elCxYwU+MwybXh6982/+OZHxmUMSQ2vV7+xiVMB42dYA1k6jPpjc3ZmiZCkB6Eyqa7
         PzAzhxgN3xLthj/Hfo1y17Nz3qT3NEGelG06exp+ZI2mRt5nzk8scv94IdGUdiPStcxR
         U2tiyf8IPiIguRgZ+M6fAOjDCZdjao9tC0YJzMt7dpp/d7bjcE+0fB5tWzbZGP8GRpBV
         pcUA==
X-Forwarded-Encrypted: i=1; AKwUvBznUHLg1jejr71Dn4YPl1DQ7gsA7+bjW09/g71ZyliOThtSIKnpeqR8PwCiDvxZcfQ/jmD2HJZhJBGtR5V0/gNN@lists.infradead.org
X-Gm-Message-State: AFuF++lYelqqEg8JBbmvuyaA4ACOX2p94LvPERzxj9JhMUEFlQtS9/lu
	TLJOSYd/HQ/EUEcDBZOdOYpKVr80T74itc6oHLmro0lnPn4C61D2Al72
X-Gm-Gg: AYBFou1FRWZF0kLxXrE9OoCdy4dH2V8T7TLP95giRBwLoIBezOQEAoMYXuPT7P6doIA
	aaD01j7jBWFvaADTEO/UQfkz01hm/TqjilkGdm/X4BrzbjYS4JgQbGCLYKfQYSBb95Q9pzUpgOG
	bXOfkDjEbOgbnMGbGHvG+vpnGeY55mYLe6+kmbKHHd8cmc874S8k5wGXKvs/uIfSZrwXpP8qEkC
	MA8+NJB73Il//fYh35qzmyY/8UyMZ5m3U/LNidrbM4V9sD38tZaDgavWFvkng3+xSyiIfIwCp1g
	HY79Ao3uzKP1o4/aEVDOhCbjkvM7lbVrXzKIqHD1npwKTW/GMZpc8AuYa6bPejuU2rw4cMpjcqi
	iXoq7E4zTP6b0BX588tMydgoazB4agJ0BnvbJlNerPQje8h/WTJ725bv90QYKM3kkohBNVdHxsj
	5PMhJi3M5cS0BW/dhsjrm2qcdqWOaOpXzNowuZzpDa4WVnVPgKh1N+Zw==
X-Received: by 2002:a05:6a00:4288:b0:845:c694:5c3d with SMTP id d2e1a72fcca58-86f83346552mr3922964b3a.1.1789377355574;
        Mon, 14 Sep 2026 02:15:55 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b287c0762sm4480614b3a.13.2026.09.14.02.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:15:55 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Gao Pan <b54642@freescale.com>,
	Fugang Duan <B38611@freescale.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] i2c: imx: disable autosuspend on remove
Date: Mon, 14 Sep 2026 17:15:44 +0800
Message-ID: <20260914091544.1667137-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_021556_683884_CAE42A70 
X-CRM114-Status: GOOD (  11.63  )
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

i2c_imx_probe() enables runtime PM autosuspend with
pm_runtime_use_autosuspend(). The probe error path correctly undoes
this setting with pm_runtime_dont_use_autosuspend(), but the normal
remove path only disables runtime PM.

The runtime PM API requires pm_runtime_use_autosuspend() to be undone
with pm_runtime_dont_use_autosuspend() at driver exit unless runtime PM
was enabled with devm_pm_runtime_enable(). Leaving the autosuspend flag
set therefore leaves the runtime PM state incompletely cleaned up after
the driver is unbound.

Add the missing pm_runtime_dont_use_autosuspend() call to the remove
path.

This issue was found by manual code inspection.

Fixes: 588eb93ea49f ("i2c: imx: add runtime pm support to improve the performance")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/i2c/busses/i2c-imx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 19ec056b00af..4dc3df6a41a4 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1920,6 +1920,7 @@ static void i2c_imx_remove(struct platform_device *pdev)
 
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 }
 
 static int i2c_imx_runtime_suspend(struct device *dev)
-- 
2.43.0


