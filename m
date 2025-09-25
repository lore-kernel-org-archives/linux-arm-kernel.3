Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E708CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 12:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JrqoW50S86GQruERN9yWcjsCpx5n9qTugCw8eRLUCCw=; b=EuuKzjFxC9mnjIGjSsvBwTX6pN
	6+yBFXQV9V+unoZLgkKEvywP1zpOeHvXQzuXXlU9CzqsOZBrWtN7Qe2ft7z0SBN0C10TV/UO3CGLl
	rlqrOIVB958Uom9iBDenidb/kyg0olXQWExU6iy+OZKq0ztJ8idyB4/e4rN2sdy8e2SO+YuQxgz8r
	MRA/JNZyz1+mKBLdfKZudv5DVsaMjqLeiebmlOAqwkXZ6ZrtlMgzfeC+CIJXBwPvGYz26TfvF6tL0
	WE2Fl+Jh0lCGup9JEaRBpbmh2+J4aZab6ay+/ZKB297pjF90A1xeHY3nMs1qmVn6C4qvBIRrn+BYN
	MwHqYvCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1kdh-00000008kRs-0cdy;
	Thu, 25 Sep 2025 11:59:57 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1kdf-00000008kOG-1Hiq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 11:59:56 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-578ecc56235so836845e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 04:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758801593; x=1759406393; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JrqoW50S86GQruERN9yWcjsCpx5n9qTugCw8eRLUCCw=;
        b=Vk3wO1HH7ymh07KT6OP55vhn/A9w59AhIP4nevB/8iSdVgkDi9ufJXcmaADj4sj8+L
         Ob0hI01JDs1Ovny5hJYz8+A5bklc22tsgfFF+Fr3Uw48AljIXP/Aasli64OgTOvkLKld
         B8Mpd5QHRwyiFreGwY0Hpyk/2idWHUBNOu1YtqTB6DRGBjH2C+uGljKpcoH/p9KnIWUu
         A5KgeKp7dsw0ScTh0jfAMc6t6P0TygxnwjW7kQeYXCXPZOnMnEZrabOTRsg9skWNk5Yp
         aeE6S1diBcQc8TBE0PmAhIl7elDR8kKZcM4oMG9WOg0UMD+ohblqaNfglO9q6BnKsaNq
         XO/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758801593; x=1759406393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JrqoW50S86GQruERN9yWcjsCpx5n9qTugCw8eRLUCCw=;
        b=Pd1/qBIslGSgR8ZgfvcI2tbi1mrYvdy82BXKpuHnlqTb6HNo+Gow1Cqhq6pgIlQFSG
         /mGDFX+9amHCtBhSIi4y/wY9ijLMdX3zjiHJfap1NBU/h0KbD9pLaKimdJXxIl89vucs
         YOCq9YtTngFaDChBsFFGrm3VSNoYZgkP2VUHzjivzik4ZvbomMR1A15ZjGDosIUnKlRc
         nmlTz0Rq6pU4TaRbjCH64nO+BPUsKBMWwEZuWwzVfITMbuLsd4TGCamlpZjzaN7KVLtm
         9NsjnZm+hij3ryI0l6Ww+y4wE1JJufCKSnXULDzwSO6H6QoPiFCV88r1TuJsjQjWxXnB
         D/4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUPQE6kOgM8sQFIyGbaW2FTc+OJrOkMKJcYDTHY8njAUyq6kZsOU1MCyCoyMV+gVUBL8u6yLatfnORHo09pCLWZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwKhj3faWX3Wu3aIuG/V+hQR44J002+VYaRLmeT5jOxOCUY8YzW
	QGptE40WV898QJh91Rd/6DwTfgpAjC+bXc44J4ddawUG+QlwFwhy2OiWWSVJ0UVVvCk=
X-Gm-Gg: ASbGnctAmJif9dLgwLF7swG3R+3V0xWFk4bUakEUCC4isFLrCD7i22QD5AyNd1fmllJ
	mdCEB4wvOqgdUgRZ6Tay0nVsQYNxLG35xSIiVZUjKLZAzG5qdck0Nenx1v+jSocJe/UILAq1MoR
	ztBR63qZwo7yA4gGkNFIEr0XePi5BhtzBtdP4lZFtwsNj58ltxEWWr+NNDSMzvAlFedqQRE+/L8
	/PICmWcr+G7NaRpJBkySlRwF6PDeb83nHoVTn7n7Fer9FVAkA+TiFj6r8eAHZMW1XsR6IixP4hc
	yPH7sksa6jxZ5cV2ppXldkcdFXTSia4pVYyiLHUJdav65i2ySuovcF8xcipaKWeXLJFOf+IsAs4
	HudybdskDGwg8UpEZykYbhdisn6HzdttEFCftR+l3MkIb3voQl8eArFqK3IvI43RWy003s3/L
X-Google-Smtp-Source: AGHT+IFPtHO+U+hfSDkSoOkmowZhRO7citbEHLMZx0tIaudapfQghvW6tgSpLLBuhT/gfWZEbOcBFA==
X-Received: by 2002:a05:6512:238d:b0:579:ec3a:ada2 with SMTP id 2adb3069b0e04-582d092e4b4mr1134751e87.4.1758801593122;
        Thu, 25 Sep 2025 04:59:53 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5831665697esm675382e87.78.2025.09.25.04.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 04:59:52 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@google.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-pm@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] driver core: fw_devlink: Don't warn in fw_devlink_dev_sync_state()
Date: Thu, 25 Sep 2025 13:59:24 +0200
Message-ID: <20250925115924.188257-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_045955_379287_845DA2AF 
X-CRM114-Status: GOOD (  15.34  )
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

Due to the wider deployment of the ->sync_state() support, for PM domains
for example, we are receiving reports about the messages that are being
logged in fw_devlink_dev_sync_state(). In particular as they are at the
warning level, which doesn't seem correct.

Even if it certainly is useful to know that the ->sync_state() condition
could not be met, there may be nothing wrong with it. For example, a driver
may be built as module and are still waiting to be initialized/probed.

Ideally these messages should be at the debug level, but since the
->sync_state() feature is under an ongoing deployment and the prints
provides valuable information, let's move to the info level for now.

Cc: Saravana Kannan <saravanak@google.com>
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reported-by: Sebin Francis <sebin.francis@ti.com>
Reported-by: Diederik de Haas <didi.debian@cknow.org>
Reported-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/base/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index d22d6b23e758..97eab79c2f3b 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1784,7 +1784,7 @@ static int fw_devlink_dev_sync_state(struct device *dev, void *data)
 		return 0;
 
 	if (fw_devlink_sync_state == FW_DEVLINK_SYNC_STATE_STRICT) {
-		dev_warn(sup, "sync_state() pending due to %s\n",
+		dev_info(sup, "sync_state() pending due to %s\n",
 			 dev_name(link->consumer));
 		return 0;
 	}
@@ -1792,7 +1792,7 @@ static int fw_devlink_dev_sync_state(struct device *dev, void *data)
 	if (!list_empty(&sup->links.defer_sync))
 		return 0;
 
-	dev_warn(sup, "Timed out. Forcing sync_state()\n");
+	dev_info(sup, "Timed out. Forcing sync_state()\n");
 	sup->state_synced = true;
 	get_device(sup);
 	list_add_tail(&sup->links.defer_sync, data);
-- 
2.43.0


