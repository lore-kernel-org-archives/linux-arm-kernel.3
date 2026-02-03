Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE87E87842
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 16:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L5M1ZbJBKUwOtAuomtIJGP1xLtlDmn08RXJLiC0W3qw=; b=Dn4UahTHXW59g1pbFs4TI+t6Ja
	eQNl+prjn0H7xmGX/cVezb5bFnqbARzdvxk1Glqj8Zk4N89MlzfbFU3SLNHckzjSsu4ZuvvCZgM4g
	LBwFr6AhXgna3UqQ8r+8fKt56cpUO9fjkhKbfmaX31CrivHV4OJyDjEnbPYWdQFYt/Do1QozpDqjU
	YCp9v6Q6jCIPk/J2IlpoZvCbHawSOCHjJs91S6P7VN+8bf58MJT+gAb/rWnDPbrZzb/T1jLT7bvTo
	wAO4fphq0j34eU1F/Oa3QrbeYgjK4JD1qVhBmYAUYs7kGkojI1PfBdSFOoUFtHAEjbLYUs+X1xAbH
	g2RNz93Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJ7k-00000006v7l-1Ljn;
	Tue, 03 Feb 2026 16:19:32 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJ7f-00000006v0b-1CTz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 16:19:29 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso59555015e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 08:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770135565; x=1770740365; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5M1ZbJBKUwOtAuomtIJGP1xLtlDmn08RXJLiC0W3qw=;
        b=mV6vZG8SbZCJTnd8/dXCTtjw5SbOgHaaVpDmqfjoNll/z9KgD9uaMsH2x55oo7PyFW
         TfFhvEs7IAMy8FxxBWNKKUO0uDalWKCY41EsyxN2l4GG/F6oNAW2govRt75YmUZvec4W
         xZVHEC/0wUa6kH06Sn5hwXh9/xL2zxMsDQlOJkUgYI7Q0MpppKss2+CX5R8UOoNwZ47l
         Y9fEiYiwWpw+azSu4ICT+Dj4E3v+amrsGx/3ZiLZCMznJYgtwt67u7NB7nUPgRho/hSX
         mMgJGkN+pJ9RwO9uAtnbeFL8Fl8gKbQviQy8XtKbGDmiCkqsMf+HdbeN3QfAvRAxZA9K
         skmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770135565; x=1770740365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L5M1ZbJBKUwOtAuomtIJGP1xLtlDmn08RXJLiC0W3qw=;
        b=mWcNNhl3qZpiezoxBw4JIth2YjUEYJPWA+xnPUCUPjwH3P4S0dq5P3MUc2ZBVqt7ux
         1NyI5RkNVR/FrCQ/3EUrtOE2k0py0VVX6pQ07SZBMn4srbhhbf3ctksh6v4Q2f51F3NB
         2CYS8t62zasAWEe8spU4c1fT+Aum9LRaiAJrYuGfu7q/ecPi8lABfCLcwpOLRmT3tqFf
         lYxFJfljuchm09zkUjobD6h271xp4EfkED3EoTYthoVg00MS1Oya48Kcsslfa92RBu8R
         +TE8I8bTeapY2iOr6vYTnOyhcPEvJxIIVUAWXQuUHBnL9J0cX/WVvrxFgd+F5u7SlbnO
         dnPw==
X-Forwarded-Encrypted: i=1; AJvYcCXaXsEfw+/LdcvC7+IW1JqpIDpR3F8yABp+noupxhxeT5tyYMQqWoC4lSEnJxzMEtF+lBSYnMEcocDEaMZ+wyvA@lists.infradead.org
X-Gm-Message-State: AOJu0YzrbpPSDO5MQmbPxfDWvH2nR6BUOZNVuOpFXJUcB6O7DI64QU87
	sazWHHfB0U+HSzTZ7l8/lVTIzsNDdC0q/5dGMtzxQ4Hpxhx14HOUSmmYTkFszXancdc=
X-Gm-Gg: AZuq6aLONVfQH8VWzcAAkE1tzTK1jO1dmiGFFiN6uuP3xNP7yJUxgEu7BF9x1HyXtnp
	J4fzy7ckgOS2HL/nPzXxDw9wboL4Hk80YEXPRwrDZzzQGTGdysp7xIl+5EaBub5aae8dyZf7Apm
	HkCZPfJ2O6mTrVKw194TwMt9UDtW+K+GDnAiE2yLEuWl1AlWIRyMd/rn3KsUrk0fnXuA6dQ2I9m
	TeNrIeXrDvw19mUOEl/wy1Gx1AnSl939KaVzVC4HcsVOG9Cwm99UGEoWw7BGwJd6Ng1/oNPkvRz
	4R9jul47xnQxpso/vBSvksMDZrUzakD0qRMXVOZ5igdhthGi2/3nqKxpRbfYr/infWrro8MZO5S
	bzx7nV1EIp+5dnlGLJjBY+0jWW+eKcX0eEGHarF3lxRfp8vWjDK/xpJw0X3GikyviTDeFe0xdwg
	V1/Y87i+hNBN6Wr72AgKY=
X-Received: by 2002:a05:600c:820e:b0:477:df7:b020 with SMTP id 5b1f17b1804b1-4830e96abaemr2199595e9.18.1770135565342;
        Tue, 03 Feb 2026 08:19:25 -0800 (PST)
Received: from vingu-cube.. ([2a01:e0a:f:6020:81d1:b874:c1dc:42e5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482dbd21f5dsm144120785e9.8.2026.02.03.08.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 08:19:24 -0800 (PST)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ciprianmarian.costea@oss.nxp.com,
	s32@nxp.com,
	p.zabel@pengutronix.de,
	linux@armlinux.org.uk,
	ghennadi.procopciuc@nxp.com,
	Ionut.Vicovan@nxp.com,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	horms@kernel.org
Cc: Frank.li@nxp.com
Subject: [PATCH 4/4 v2] MAINTAINERS: Add MAINTAINER for NXP S32G Serdes driver
Date: Tue,  3 Feb 2026 17:19:17 +0100
Message-ID: <20260203161917.1666696-5-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203161917.1666696-1-vincent.guittot@linaro.org>
References: <20260203161917.1666696-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_081927_387406_7CF63353 
X-CRM114-Status: GOOD (  10.67  )
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

Add a new entry for S32G Serdes driver.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 67db88b04537..fab748292821 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3206,6 +3206,16 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
 
+ARM/NXP S32G SERDES DRIVER
+M:	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
+R:	NXP S32 Linux Team <s32@nxp.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/phy/nxp,s32g-serdes.yaml
+F:	drivers/net/pcs/pcs-nxp-s32g-xpcs.c
+F:	drivers/phy/freescale/phy-nxp-s32g-serdes.c
+F:	include/linux/pcs/pcs-nxp-s32g-xpcs.h
+
 ARM/Orion SoC/Technologic Systems TS-78xx platform support
 M:	Alexander Clouter <alex@digriz.org.uk>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.43.0


