Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC918C55174
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 09:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5/n5vs24CVZDYo6NRZWyHt3f4uc0JNiNtoLIec7JOs4=; b=XAKV7KoDt7pKq+HxQ1gV8qCB/U
	BPrHow4hCwGuzZzFqKqhSlZVLOc5g6nZvT9lKYpbPDHpR3b8gaqDo95YSmtnYNyaO3zNuGbLsuvyp
	RcrmjYXUOOeLydnEghbHZ+XW7WpbXI0pCXLCV59UuB7FP03olLd2XASt4PBfra6n24m7aut23vHbW
	8ZWH9IYISUpvVhFKcpVT0AqQGjcaqZ7Msg2mqlOk6qGrzJhql6xZXukNN6moUI6v3arbroMi/t1hE
	duEDVXBEmMaeWECssNocu/bXjFza3PAWD2A2ItO8KWYpZIn2QJQ9MNTJkppPx1g2JxhF/DERp8GhQ
	HPb98luQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsdKT-00000009DS9-3Jqg;
	Sat, 08 Aug 2026 09:26:57 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsdKR-00000009DRo-1RlD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 09:26:56 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-8485ef63b68so663658b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 02:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786181214; x=1786786014; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5/n5vs24CVZDYo6NRZWyHt3f4uc0JNiNtoLIec7JOs4=;
        b=NfgCQPqVTq+JglG5CcwEZ3ogSzohMISACETjU8YdSxBVNFE1MeuwqQXH85ise0kI5n
         J92VSalKi9KZi61cpRq/LMG2PTTHdKbT0mDtZzIGShqiVNoJf23psl9qzToBfDwcRuQ3
         EfZNo0zqZ3Dl+G1Exxzz9TCnO780qEzIlWEUWlx9j65Bja4EIi2URu6CdsKPy5DkPIoI
         hAkVdOsSKVLVP/Okqo6NFu2VKnSSGWEe0gcMjCfpP20sRMR7PHuaXB2cmo1eGC304NYt
         v0XzGRfzaJ3i77JGykbsweswH0dwSvpgQVljk34VDkvjbGsikGiC1bf4iyuSmpU2oPzU
         kfmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786181214; x=1786786014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5/n5vs24CVZDYo6NRZWyHt3f4uc0JNiNtoLIec7JOs4=;
        b=DT0tthOCpUw5kTzv8grWmbjE53UrJVs6bvpiaepYlEpMhE/h5Mr2c7U60l9/UuyI3D
         zF1NdT33abe/mo56DK2XKapRxr6Q8q4reT62eAOosM8+4M4HhtAmACe54ATqPIQF1yUi
         3/+2EnMZ5TSdbbXpgSOg6I09ku+OyO/ZwCqXYARCLmhHJm5wanLG8Zyvmu0PsLJqDQog
         zv6ABD2phtyulpLW3QcL0yArSs0kz+WayUX1V9U8VWlg52q/o/VupLpZjK3hqAWG76Ql
         dZqNgshKX6zmaOVZIwnC4wILDJ23UCVJQPlgwqtH5rcLX9C+TeyMtFdQzDIpXYgPStIw
         6FRQ==
X-Forwarded-Encrypted: i=1; AHgh+RpC4A3nEGmbsEwfGrEqU1OhJ4WZmBc36tlVRmXJ8eNzN9V1QahS7GP5r79OvQ7uBykFYG5Pg7WgM4DeN8w1LhWp@lists.infradead.org
X-Gm-Message-State: AOJu0YwzcxJfeblW/VJxvlpNHjia8MjI8fyrGP2ljMJItBllgWAABqEP
	0+J4JMtBF0YlAQZZwcKy6TFUVORS2L+Gkw0W5HAiqcnY46bKwuvj9oZD
X-Gm-Gg: AR+sD10A6NqUk+G/VS6S5MDVpbl6nr3W1zpPp6OcF1rafC4v69CE7EFM6T6ndGR2W5U
	btsjl0vs7T+Zt5pWPhJ975LqG4TjS2jHqQ1EIqMEPD+B73QK8R+DYKs1WcEeTqg72DRuz5Y5aLP
	FS5I/8X7gEqrudXtY7un25d87oGNIDmoAbFf56cm7RtPD31hVV9ynzCn0t1jAJWLur1eJCbvJxx
	6Vdd4Dej+/xebLajDp84Y8g2A3zheMnWmA5uMoflLDrw2AjG+VtyMYLqJp+GqNH1NMM0z6u/LQf
	FSo+7gM/ebzbfWluHDIfMCr0lj51mXSFECH+4kyypPrezPYr2QMWgxPIvodBodKdYhiUIGOas4H
	Al9CzV3ZO6mgILCKl++Q75aGzx0W93bwCjGsNmyL6+MYgNYfQ3soO/xtbjD/fvGsd1FyFMQKuoL
	rtru7db3HqUnWZKwYsPYI0/w25ctvZKMRsQkZYKVc4w43lWfGs2eKIvfj7Rg==
X-Received: by 2002:a05:6a00:a247:b0:845:4126:222b with SMTP id d2e1a72fcca58-84f2e00ea1amr36933658b3a.28.1786181214390;
        Sat, 08 Aug 2026 02:26:54 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a51f166sm1943751b3a.35.2026.08.08.02.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 02:26:53 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linusw@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] crypto: sl3516: fix autosuspend cleanup during teardown
Date: Sat,  8 Aug 2026 17:26:33 +0800
Message-ID: <20260808092634.2734292-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_022655_384871_3CBA4CCF 
X-CRM114-Status: GOOD (  13.03  )
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

sl3516_ce_pm_init() calls pm_runtime_use_autosuspend(), but the
autosuspend setting is not undone if pm_runtime_set_suspended() fails
or when runtime PM is later torn down by sl3516_ce_pm_exit().

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during cleanup, this reference is not dropped and usage_count remains
unbalanced.

Undo the autosuspend setting when pm_runtime_set_suspended() fails and
in sl3516_ce_pm_exit() before disabling runtime PM.

This issue was found by manual code inspection.

Fixes: 46c5338db7bd ("crypto: sl3516 - Add sl3516 crypto engine")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/crypto/gemini/sl3516-ce-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/gemini/sl3516-ce-core.c b/drivers/crypto/gemini/sl3516-ce-core.c
index f7e0e3fea15c..f09a7f3445e4 100644
--- a/drivers/crypto/gemini/sl3516-ce-core.c
+++ b/drivers/crypto/gemini/sl3516-ce-core.c
@@ -381,14 +381,17 @@ static int sl3516_ce_pm_init(struct sl3516_ce_dev *ce)
 	pm_runtime_set_autosuspend_delay(ce->dev, 2000);
 
 	err = pm_runtime_set_suspended(ce->dev);
-	if (err)
+	if (err) {
+		pm_runtime_dont_use_autosuspend(ce->dev);
 		return err;
+	}
 	pm_runtime_enable(ce->dev);
 	return err;
 }
 
 static void sl3516_ce_pm_exit(struct sl3516_ce_dev *ce)
 {
+	pm_runtime_dont_use_autosuspend(ce->dev);
 	pm_runtime_disable(ce->dev);
 }
 
-- 
2.43.0


