Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CCFC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 11:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g7iuRz92HCVIT1exQjMnG0/dtwvtLcUKiQwnTs/Nc7g=; b=nyfMJ02vdar0sjVP10THY9d0b1
	Y8yAKfdcF681nL2Is6oMQcLLR+/dOBMMQUCOM784wqXNBU/SbmPlZIAE9lxbes+f1pGLvkV9sSWLM
	jh58VhVoyp6B7qgzFcmwdwxl8MGI3Bjxl96Vri8MwP5kWvcKmjxxQ9huAGDZeVZyfzpUe1mMcC6tn
	aavp63ty7adPjcYHWZYKx+v7uRT6vdULj4Of7Zn4bY+DKU+VHrC9TnunuiF2ai1glbtA6L8GlXkQf
	pVyqNuaJKFmiRKHH8+6nvJKXWmTpAn+3GHMeB5tFZp7u/YYKf/apX8BqRkea3RNem5aCrMIRfRnew
	b2QtzhKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugiQ4-0000000GcH6-0x6l;
	Tue, 29 Jul 2025 11:22:56 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugiMZ-0000000Gbsk-0Ami
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 11:19:20 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-451d7b50815so35409015e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 04:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753787957; x=1754392757; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g7iuRz92HCVIT1exQjMnG0/dtwvtLcUKiQwnTs/Nc7g=;
        b=VfI6Rxlh6hq1WzK1KPk7+00yCpsTaFvW7DiwHKcKZYF9xPjVHIunzacN7J+eWwYwO2
         UXszyzBtvALZw5nHRP7X30nzDDQgtm5loP3rVagLMphq+1wip7xMbBZrYd1rbPXJr1Qs
         dXAOzTUJ+2VRAPna71/CkF1bG5Kebqsjk67XtqMzAD/w+FFAYiWPlt3NwAJrIrXIdhfr
         XEDbbhoOImMz/fBN9ixaEhKqfD3E9JVP7/Hrq9ho9XIlhfxDaauWkMWEU55SZAR0vDQi
         0n71I8OPyxdOApkzIirgCGXmLrAfPLOddEq+pyw2AM8Hj3McSZu9LZ+Eli/HHmiK1SMI
         l+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753787957; x=1754392757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g7iuRz92HCVIT1exQjMnG0/dtwvtLcUKiQwnTs/Nc7g=;
        b=fIHfscEDeHXRJnHAeAaxKvrrwi3LNDwUI30DlOYEc0hhoOj7x7OrkFmChRSwGij+HO
         6k3CFMFF7jQh8DYuTbzWbaX6rkgeUrHVd5BQSyvVNGNj3WaMoKXSfjn91GJSXCi9GE4q
         UiJpEWa5PFaIbSvdnX85C9/EkSL+46baPPSIu4RL6HqYoEnz8rjugHU5NsHJ1+skVBo1
         GYcjrywDBpElLE2t7k/Ph023Iif+Xy4QXZzOYvjsGfYI5Evi9YGAsJMkFYev3ToI+WAR
         EFDMdd7wSD5dSAxEWd1g49rinRLUI1WdYIpH/fdyLe5+0dvexoKZrMQpwUi0QkOJ3tzm
         jfAA==
X-Forwarded-Encrypted: i=1; AJvYcCWT9H9IELuQAxn7RljE3afUsjrSy/vXfLT11iRI8p/IJMdYoMDsUtuJwir/WdILkqmSwtqDWeCpDWnVw14U1Qg+@lists.infradead.org
X-Gm-Message-State: AOJu0Yxs7uSMX6pSfwa6FX4cxr1XT75NzeqlvRaFnWUb6f6t8iTr044i
	CeOKKx1VDIPXUZMZoxHjid2WUynXFLsiIGfStBPvWYi7fMellVDGjdwHud8JnUy8
X-Gm-Gg: ASbGncsLVgkds5Zz780QR4YntWyIZdS4sn15Ks4TBmSg7nklIl1661b/U9Gs8YT8rbu
	Igza9CnkSOliwkocN595n6dYTlFFI0hj618PsWaW8Qp5048bNppQWV8w5moTTN9fLTKxIAom4sL
	zlCJRESSzHiFVKetk2nNIfYx61m6iZaeWRCfGvwlKyXRc9yvfmrxaJ7fjOYRkg2e9UzkFSZhUOv
	U7aK8oE4oshOX+/6GJxO7fkSLotPsZVakg7oLTZvUKmiy0w/5U4JrWMWfEH39cLN+q9kyUodUbj
	lon5NYKhZoXOnWrLs17C1jJy9jnSPhFC6qHUiTFj/RsDyaUqjfiJcHkACTFRJZgbLOFIYOHRmyM
	aJT4YXaSO/gUGpOJ3U9GPVRnGetmMX8A=
X-Google-Smtp-Source: AGHT+IEn8baAKkdjQiKjD+OkAvGRUrXrS2YdK0Poq0GfjeJLzaXTkGoyXCAUov55fzv/FaoSuH9ICg==
X-Received: by 2002:a05:600c:c173:b0:456:18f3:b951 with SMTP id 5b1f17b1804b1-458788a2116mr129642095e9.15.1753787956726;
        Tue, 29 Jul 2025 04:19:16 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4588e5c2232sm23268075e9.13.2025.07.29.04.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 04:19:16 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: mach-sa1100: Remove space before newline
Date: Tue, 29 Jul 2025 12:18:42 +0100
Message-ID: <20250729111842.1923915-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_041919_077521_BEBB6B7D 
X-CRM114-Status: GOOD (  12.94  )
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

There is an extraneous space before a newline in a warning message.
Remove it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 arch/arm/mach-sa1100/jornada720_ssp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-sa1100/jornada720_ssp.c b/arch/arm/mach-sa1100/jornada720_ssp.c
index d94810217095..983988395488 100644
--- a/arch/arm/mach-sa1100/jornada720_ssp.c
+++ b/arch/arm/mach-sa1100/jornada720_ssp.c
@@ -144,7 +144,7 @@ static int jornada_ssp_probe(struct platform_device *dev)
 		return ret;
 	}
 
-	printk(KERN_WARNING "SSP: initialization failed, trying non-irq solution \n");
+	printk(KERN_WARNING "SSP: initialization failed, trying non-irq solution\n");
 
 	/* init of Serial 4 port */
 	Ser4MCCR0 = 0;
-- 
2.50.0


