Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD69FED9E5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 15:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r0RfajJWwZmTYBapOkDrRSM6JA1jpPzYsQwAyl/wAZs=; b=cG2Jymh69zA5CqNsEJ7lLaDgoH
	7cv45di5H3gIFx6LAjMFuhgnOQgRSLilYkblQMr78KK0XRETeUorzMasymtofBl+MkC01UhOStT9w
	67gAkokqs65xbdo38osJEY+5Uraqxc4F4ndcKeFn+JOSxFBR2a4Kmjd8GYdEJrRUWmgO6JFg3/uop
	KlivBqhGOFttchOhfZGwAHGjo+O3kafM6dhRsDhqA1SNE1Kl9zL8Z6zb5DBE+QtKA7qB5yCLDlx0k
	zj0+xGOzOpt1IPHYtK8SRtuqi2MME+tKy13bHAR1qTmXzrQuO45Hcuxrn3OniDwpACoG5emyWgrOF
	9BZY9n6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2WLW-00000006k8t-464G;
	Tue, 17 Mar 2026 15:28:38 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2WLU-00000006k8M-08km
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 15:28:37 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2b06d33e84cso1438275ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 08:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773761315; x=1774366115; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r0RfajJWwZmTYBapOkDrRSM6JA1jpPzYsQwAyl/wAZs=;
        b=KQU6KM6PHu5PW5ihsKN9+MlEQttZ7/6N9gUhX3IqU9ufXxM437zt46HcjLvwcjd8Vo
         vgW+3PxvzF2nNBj3YbjaS6WT1f9liy2jDUsBm5GnCFIo9t8Ty1YLkdD3osUX4KDcnBcG
         QWTC7QTDNUguFw+rYHtkKp+xqM4rNS8nawII5FQ7CnxwGqrZxPxKJxv0s0Mc2RwUbf6v
         3Ugd5Cd+HJ5sDB2aUkeebEgyo97oqZCGpjjDh9996zWQLOgmyv7zVovmJB5lqYyNxM8X
         L49Ufiif8tvag7IAvmJdHHXt3hEw33TkwO0YoSkNj+SxvXIcSVwvScIyLRrKbia5F2p1
         AwkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773761315; x=1774366115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r0RfajJWwZmTYBapOkDrRSM6JA1jpPzYsQwAyl/wAZs=;
        b=HTXeF/fpEKHqw4URE/3oRmk3jFcRUVdNKHCg3sl9rstVSwW7Dyoo8S9oN10flQTUu+
         oZdJ1J2VZOGsx8GyNA2WxmsI4P/6/HbTUHT0DFez6mQbaAopjTTk+n1QoEKMzz15Bexv
         Cg1qAdl1JCUzyrdi5jBUp/+hEtHxjIRIDaTAITtuKKmtpKyoZ4xlOKteLgUS86NIvBIu
         5xwgdazr54qEoE+iK30kb0mgccZHaEry/oI0RGSZ/qKIF30aCXy2xwdu5PSVgTGNlX0+
         +gsEFl2ggACqLa53rvJ6qtseYEALl4ccDnbl7HuaPFNMNBjEjzIn4RrKnYbYqdgqhtdP
         pHfA==
X-Gm-Message-State: AOJu0YyEK2pc7omf/xInr6/xiGfyQJ6nwSTV8jZyQPWQUwbHnExfksUE
	+hCyCHmME1sls0djuHD7B7vACVA/97H9LcGe7WfkbaK1MUwYqF4etGSM
X-Gm-Gg: ATEYQzyf/vGlr2bOY7H+Nc1H8fuuq5aQac/9p622yFtCEA7sczTYHqtKIi1QCPZPUNv
	VrsMBDpBw/X6qWdqjUg1lW+xf8FBZLxmg1mI3/b/+ctT5fBxVyRmQFBOfkBO7gZpuY1z+BBctzH
	olGBoXmaivSX2KCCta5QPLJhVD8hlhtv+ilQb3/XiNEzqp2xC0zpUzEaBirh4JamDAEZkPOSpY1
	DcOpxDx9k71ZrgGnZfgm/MVmn7jnvF7q+01dn3/zhx+2ET6GIiralBdWtA9CpPXE1GczYxGglro
	iV8+fxTbPv1JgSYNtz/UU/Sar8SIWH+zKrxHG+sCqi2tCT1bfA96HoKQQcPXFyVQtxN4oaSzAkW
	yDpWAQjwZJfY7ybRcIbA4UNLcePjW7mb27PJfKCn4oWTA8F4h7gKwc+shyH86yXeQjH+5tJEaeW
	L/LyKVPsQU+RuU+kzuBxlY/5ZpeE8BovgbBKJ6jojHxy1G6zHL2JQD7Y5aFsyeH8ruSaCjaQ==
X-Received: by 2002:a17:902:ea0f:b0:2b0:6323:1739 with SMTP id d9443c01a7336-2b063231bc0mr44454175ad.41.1773761314768;
        Tue, 17 Mar 2026 08:28:34 -0700 (PDT)
Received: from localhost.localdomain (61-230-23-18.dynamic-ip.hinet.net. [61.230.23.18])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0542909d8sm105242455ad.31.2026.03.17.08.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 08:28:34 -0700 (PDT)
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: linus.walleij@linaro.org,
	matt.porter@linaro.org,
	syin@broadcom.com,
	laurent.pinchart@ideasonboard.com,
	csd@broadcom.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	visitorckw@gmail.com,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH] pinctrl: abx500: Fix type of 'argument' variable
Date: Tue, 17 Mar 2026 23:27:51 +0800
Message-Id: <20260317152751.21210-1-eleanor15x@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_082836_090718_1E298EB2 
X-CRM114-Status: GOOD (  12.48  )
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

The argument variable is assigned the return value of
pinconf_to_config_argument(), which returns a u32. Change its type from
enum pin_config_param to unsigned int to correctly store the configuration
argument.

Fixes: 03b054e9696c ("pinctrl: Pass all configs to driver on pin_config_set()")
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
---
 drivers/pinctrl/nomadik/pinctrl-abx500.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-abx500.c b/drivers/pinctrl/nomadik/pinctrl-abx500.c
index 8cd4ba5cf0bd..6650d3912acc 100644
--- a/drivers/pinctrl/nomadik/pinctrl-abx500.c
+++ b/drivers/pinctrl/nomadik/pinctrl-abx500.c
@@ -856,7 +856,7 @@ static int abx500_pin_config_set(struct pinctrl_dev *pctldev,
 	int ret = -EINVAL;
 	int i;
 	enum pin_config_param param;
-	enum pin_config_param argument;
+	u32 argument;
 
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
-- 
2.34.1


