Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E342ECD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 10:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HtVdZNScTofI8P3tHPj6mAWShd/HrYu5mi6gsoESwBk=; b=2TmsxOP7eazte9zDJ1oSrqMsv5
	BDTgGZnXL5/10oXNjGP3S8Bu3hI6AaIzhxIF0RWJ1MzLY2b/aF6UWiV8OtiHp9Id2fIIbK8k3dqG+
	6StRgQwz3f0MhNgsSzqDc3eAeObQoMcBjUjujI4os5G0P5YuzMGxRLoQygmLiA11j6oHGTyz0Q/2k
	7+m2sau7gD6ltUNKcnYfzDz8yE5WQEleTgLtt/I5S1WMFefhp3Y6ypaACQrh6JIcjPcFl4Z98qpN+
	74yRX8MwIQ8LkC72B1LnLeyDqyLDbUt3qLlMZF71G+SvF0u4E03la4Z5pAmumc0VyNjylVPZmsMcW
	fMvZejGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuIk-00000007AO8-3crE;
	Fri, 29 May 2026 10:18:50 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuIh-00000007AJH-1Tj3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 10:18:48 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-45ef189aa1cso432409f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 03:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780049926; x=1780654726; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HtVdZNScTofI8P3tHPj6mAWShd/HrYu5mi6gsoESwBk=;
        b=oePTIlVE0OY02temQWgQ3JiTennzQma/6kLcDZgdtFoupK4E9fTlJX9GQOitven6L+
         UIvBpnPFo7vJABgfPtpWULdi0v0za1jbd2CXVYwXWocYTbCPKb5KB9HKK0+sxduQFXRB
         0/AKaGBDKeupbiNUkQI8vDPjSlhVT7+ySAl8rXGYpyMje89n35OPARbtP/8S+8KQzisO
         +zwvM/M9usA8BanN67b53le2KQTG+kL78S3rwdRd3fAhe7RmPlf8dX61zQJqLdjQ+ETf
         vhIcqs9DdAgur9n/Q3Qoe8G/q/VEo0WpUUvyZ6T8iEQ5AE5Fl9Y5j6UdE01KleRcDG3e
         +Rfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049926; x=1780654726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HtVdZNScTofI8P3tHPj6mAWShd/HrYu5mi6gsoESwBk=;
        b=GdS7sns2jVI7ksDDj9sYwJrcBxeVGSpYGeWQ+Rvl0zEOnQdrMQmF+OqkgZPk0MQtHo
         ItCotNjvhi8SOXlgcB/DMso2j0xOQPgXr2jJNX1dbR2eCsDAUZKmj9CcKjqX+nZ38Qw+
         KfVFhFKLzHqvjVx/iT3VjiGhCmhYspLfeLMIzbTygi54Q6HoNnHO4Sr0tQUsI7VX2eX+
         mmIeivFEaAsCzb7dW4jsODY+3lNDZTmCtb1YJ/XZbobGyTDvLcIwhM+wr0LfPsmFmt7q
         G5jwPjE+EfScdh0XmbYoC0c10k44ysbRGTXyoKsqSkNhhSQ8bPgr/bvxLhWNXfIhwib2
         3GgQ==
X-Forwarded-Encrypted: i=1; AFNElJ8KLxEVEljJHLhVZ42hONrahLkodxFAxCAUt+cE1TR3YqiJZ8Ol+mCPxui5yIII6jvf1NLnYExHfjv0cIx1h9Uh@lists.infradead.org
X-Gm-Message-State: AOJu0YyDkSOUdpdxcAtSaq/QCdOhC5DIgYgXuegPECo42uYNlzNmIliq
	ykexfxJpa5b/suSiOyFgbWauPfPq+krVpGdIsFWhjPCDoBIXrGHpzMKttLNlL6wj+ps=
X-Gm-Gg: Acq92OF/fFeOP0QHhx7x7kmku8cxc33p5sklzljK6+lMXYHvuTrjl0I8M6BoEWnKHY1
	u+e7IqjYSKk71qSA/qJcKA1FeihmqR+WAVRVc15QzX5K19UAlGEzv3gPzFypvj7vwbbmgPG9jLH
	F6BCmF0B1yHM/d27tOyw/Ht8/RKOM6x5ZzR7QAWIO3Bwkxua+X8XCwlhrW8REzN2rWapDa0VBAN
	DvUNoEAGksGsuPapeX39Ea6PwHEIz9V5XuZZV4y+AM4rb8C324UXidlwUiKw56nysuGtfNUREUK
	ixALWC8wPUrnPBnIjjIlLYunIl8KO6c1l9OG2Vs2Oy9nut5J0Q3RYSXDfga6hURDRskfOty/I4d
	xewYFXUbe7qOm0aVXsrK2fmlYu64upV5wQKiOTVf+3j1T9l3W9i+g03b58rjs3tIM9taytwkZCl
	bW5j27H6zRfSPAr1gYYjL7mfOdyTnO+irgWsunCEH4PMyek9rHLXSwu5NRQ2/ywL7aLjaA/7cgU
	IbvhQxg+caf0KQZMguSx/PnEu0qzwf5v/8m
X-Received: by 2002:a5d:4602:0:b0:43f:e272:edff with SMTP id ffacd0b85a97d-45ef13ed7e4mr2873909f8f.4.1780049925683;
        Fri, 29 May 2026 03:18:45 -0700 (PDT)
Received: from localhost (p200300f65f47db043f932d8b97293bf6.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3f93:2d8b:9729:3bf6])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45ef35874b7sm2392386f8f.35.2026.05.29.03.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:18:45 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v1 5/6] power: supply: mt6360_charger: Use of match table unconditionally
Date: Fri, 29 May 2026 12:18:20 +0200
Message-ID: <ff94de5fb3ee6aeb1c0256e1a00c1c5ac350b430.1780048925.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780048925.git.u.kleine-koenig@baylibre.com>
References: <cover.1780048925.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=900; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=j07x97s1Wf+YOc3AIBt+BDtOm6zhVtK4xiYixM5/hT0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqGWf11W6GNZFuwWjHh5SRVpp0Kru/KhvgdEKCj YGOEfu6ShmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahln9QAKCRCPgPtYfRL+ TsQVCACKqsRzsVd97fbfB0uKqFDSIesz/zHQ38cfBH62FRQ/svd1jcnpSkZl4aTnLgP7wiBUZD8 1xG7eoyDmqnsfMqVUwLSuzym3mNgbUzzX5HTrsXhEn8RTQW/8S1RVLXRlAwsgwXn/EvbWtnmDzZ 90atHov9BC9xEpCgBvITrSSuWiG2RTu4Lg24HfdgR9pnPprAz0R2pTH73ClFSOMGhGJobKyDYQR hSnllS526cbx07AycnVtUY2A62G5w8IMbGn0M2YmtZKprJ5RFT/dwhiyRdx3LN1xOqXaj6N6Ygf P8kLbsbwpWiW4P367QSKZT8LykSDYHZSHIRlpa2tvLg6y3bG
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_031847_416078_8607AB23 
X-CRM114-Status: GOOD (  14.68  )
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

mt6360_charger_of_id is defined unconditionally, so it doesn't make sense
to not use it for the driver's .of_match_table member.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/power/supply/mt6360_charger.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/supply/mt6360_charger.c b/drivers/power/supply/mt6360_charger.c
index 69955f255091..d3b0731f6562 100644
--- a/drivers/power/supply/mt6360_charger.c
+++ b/drivers/power/supply/mt6360_charger.c
@@ -849,7 +849,7 @@ MODULE_DEVICE_TABLE(platform, mt6360_charger_id);
 static struct platform_driver mt6360_charger_driver = {
 	.driver = {
 		.name = "mt6360-chg",
-		.of_match_table = of_match_ptr(mt6360_charger_of_id),
+		.of_match_table = mt6360_charger_of_id,
 	},
 	.probe = mt6360_charger_probe,
 	.id_table = mt6360_charger_id,
-- 
2.47.3


