Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC9CE77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 23:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P4h1nqGewaKzsi8QNniPMbF/tinUcgzwDW10s57UOc4=; b=Fwb9vTofMzlR4EbTA2c4DVl9mO
	qS254Gx3BHHtQJnAwROBgVnfCwksCsfmA/cMFw03riOYqSnhW2VkB9cRwHBYwhxZea22oVjYvVH+9
	5fQ3PqKepLoA9ZsGt8/ZAqeF0Ip3T0msO8U98Mjd9wphWDgS7JS5vmBG+xA11fQ/zsL4C4dnbwnt9
	VFGx91P8y4yFRS3/6urUixNfCeT7astwdg3ZOsjufGSr4lVJFuyB8FN3RbBzWHNSankew6xWvnrAS
	2jL2UXeqbwip7COcHcZy8yWhjT5I5qDB9wTvn7qDOf2jErPhgmuI/fcpK30NjeVOkof7xJQpD0Duh
	oy3D9bcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJhdo-000000030e6-3dqc;
	Fri, 06 Dec 2024 23:21:44 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJhcm-000000030Zx-1bPx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 23:20:41 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5cec9609303so2707531a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 15:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733527238; x=1734132038; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P4h1nqGewaKzsi8QNniPMbF/tinUcgzwDW10s57UOc4=;
        b=E3oMkXq+oV/uQajZeQMtEB45gpwPKU9gW2RUekGG1vUx19LHzuss4FW0xN5b4ymOK4
         1V/jk9Lejg7EJflPsLEUqdNs+0+GTP73Gvtdyl9niaOVW0iwU2VQhHHqMTITqWAKsRIk
         2btps8sTNkZkuQ9zK2z21Rxgq1QHhB4hITAs8vTzSRJTYcZ6WyPXaLYVdWmkAq97XrKB
         Bwx87RytiYrRJgqgtdajkeG0CEjJER2ahNZKpnwFsG6CzPl4DZTQ197saFvxL61EX+xk
         F25/5YO36BcNViOjrPhn0Vgt8jAvo1/AlHGKvnEuDgrD8h4y56TXx2bCP3mjQDgAvIfy
         8A9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733527238; x=1734132038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P4h1nqGewaKzsi8QNniPMbF/tinUcgzwDW10s57UOc4=;
        b=SvPbC36TKe6fD6VV7tEUtLW8ZijOUQpBqQFyMYDM7yf7qKbxHAtq2ZOCAgNPDunnrD
         4EIkAzjBhILBm19BxLlVUoTQzGVEut+aY92LvNmJfbrkie0yHPyp/40XgdFBm2oaAlvW
         +Ln1HoWFJKxCK3rCv/y70t0wrdpzhntmNohW64aOWvBMUs2mA8TGy+nGtg7PReRhpKs2
         8TLwGQbniBeCniGW37kCr6YgUPNQpiUMhFAo52Ay1aFGQEmhxyerZpquFxwyETZeef+0
         6I32pvhnlsLk5pDiUyQziF5SkWEkRPXpwwgMqXgW/YCL5laKE6fnGoCA4M5GZleDAAdt
         505Q==
X-Forwarded-Encrypted: i=1; AJvYcCWnANpN54tHPXKIzMhij55ZgZDwR7maQk2qj5+ZkTAoRPwl7M1M7Tz1JH0BPCxjlUfOusdfFvK3YEwETF186RX8@lists.infradead.org
X-Gm-Message-State: AOJu0YxgCGMDx0r338bUhQUeghSAOjC+/phqJzRnUqaluIUbCQEEVRcB
	GT7ZeEAfyVu+dliSrh/sBaGpbQBDdUsPF9X8WEs7wfiL4roS7LI=
X-Gm-Gg: ASbGncugwA7UmD64RhQg17mTUmkuDevlXP7aIV3dJLS1CrzER+EwVdCo54Woh2qLK9d
	pMhHmK0ZgdqXEdxd+VpUIUyakTsbEEl0jZo/bgzQJ7LieSHvCmxXUaZ7cG796r77csbmhL8xfGn
	f8IESWNxSL312QDT/L3SL61iVGBQhQ5jegZ1stxfiTe1FcgIh/RGICg+PqiHtS/npkFTgMjgXg9
	IWIjVg/hdGrLLo6t7aGx7PXv/EjbOSdy6jKiAbfuoRNfm4VZERtARFfphGFYjgM0y/Qgg==
X-Google-Smtp-Source: AGHT+IE6Nj5sbj3vQqbPGZzxXqk+OdVeuuu8XMzGsoeDnc4KTpBBzFjx2ggheX/nQimxUwbTOd7Gaw==
X-Received: by 2002:a17:907:3a18:b0:a9e:4b88:e03b with SMTP id a640c23a62f3a-aa639c1960cmr293604166b.0.1733527238047;
        Fri, 06 Dec 2024 15:20:38 -0800 (PST)
Received: from vova-pc.cloudlinux.com ([46.161.87.65])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa62602cff7sm300794066b.130.2024.12.06.15.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 15:20:37 -0800 (PST)
From: Vladimir Riabchun <ferr.lambarginio@gmail.com>
To: 
Cc: Vladimir Riabchun <ferr.lambarginio@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: pnx: Fix timeout in wait functions
Date: Sat,  7 Dec 2024 00:19:34 +0100
Message-ID: <20241206231937.86408-1-ferr.lambarginio@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_152040_496834_27AD846B 
X-CRM114-Status: GOOD (  11.41  )
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

Since commit f63b94be6942 ("i2c: pnx: Fix potential deadlock warning
from del_timer_sync() call in isr") jiffies are stored in
i2c_pnx_algo_data.timeout, but wait_timeout and wait_reset are still
using it as milliseconds. Convert jiffies back to milliseconds to wait
for the expected amount of time.

Fixes: f63b94be6942 ("i2c: pnx: Fix potential deadlock warning from del_timer_sync() call in isr")
Signed-off-by: Vladimir Riabchun <ferr.lambarginio@gmail.com>
---
 drivers/i2c/busses/i2c-pnx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pnx.c b/drivers/i2c/busses/i2c-pnx.c
index d4d139b97513..9a1af5bbd604 100644
--- a/drivers/i2c/busses/i2c-pnx.c
+++ b/drivers/i2c/busses/i2c-pnx.c
@@ -95,7 +95,7 @@ enum {
 
 static inline int wait_timeout(struct i2c_pnx_algo_data *data)
 {
-	long timeout = data->timeout;
+	long timeout = jiffies_to_msecs(data->timeout);
 	while (timeout > 0 &&
 			(ioread32(I2C_REG_STS(data)) & mstatus_active)) {
 		mdelay(1);
@@ -106,7 +106,7 @@ static inline int wait_timeout(struct i2c_pnx_algo_data *data)
 
 static inline int wait_reset(struct i2c_pnx_algo_data *data)
 {
-	long timeout = data->timeout;
+	long timeout = jiffies_to_msecs(data->timeout);
 	while (timeout > 0 &&
 			(ioread32(I2C_REG_CTL(data)) & mcntrl_reset)) {
 		mdelay(1);
-- 
2.43.0


