Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11A4CE7AAB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 10:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5qnf43euh50xAz5oC9jatLweC4/+OTf4gXUuEO+dc9E=; b=cFgriM+P8EzCiVf0rJrl/gr8K+
	EIJH0CDQjtNc42PGbr+t+mgUY+JjQ5ikPsT2ZXTbMpYaCgUxgdh3MmOhtO9W30koCTrY8DCFa8Nn6
	rEK5cOTFZP/0bXqHs+pxGsDK6e7opur7hXtbiCBcit93T+xzJc9dPHRKm/Wjgg5WzT9hf9rn35cm+
	fxP72hccAAK886rgNs4xcorDrOPXOqqWFPrjlYmR1JasNokP78lClx5VvaDdDz9APHxDwwP2yku3A
	jOM+WniwAXtynhCTrU2uueaSQxhz9HvPJDfFDVsvwtpUQPHHwF13NjZgjnqjXHHaz3exl9+ZixzOa
	y3o8bbpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJrHJ-0000000C3JG-1Uk0;
	Fri, 14 Nov 2025 10:43:41 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJrHG-0000000C3IX-2f7e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 10:43:40 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b735487129fso266903466b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 02:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763117017; x=1763721817; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5qnf43euh50xAz5oC9jatLweC4/+OTf4gXUuEO+dc9E=;
        b=RxGerznUieUOJcG6bTm4SqSYqdOFSz22YeIbYfxmYKYIjUgwGtYhYdFrMEO+9qeRGA
         1fUZuXwgIJ122WB7KkAN7nVG9YXCvlL2Yr7lcglybNy7vHH5lt/ezP0KV0yN6379TiHu
         7WmhJ0o7MGKDJtQR0/dfkh+9uV70C7UgloZaQ4aTRwet1Hhxj4yw3nnW7y1YMLhFMZZg
         Kl54sSZgVSmZqFGwHfs9tyDdDNy99yBrmXZimEZF20biEctIbnNlmWoirxgZ7b8VY9zi
         cmSOX018UP/XDY9a4I3P6nmB7Ce9pPZpye2rm6uV+3ufong+v347SGpYNWCvrnZ6iHcO
         dhTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763117017; x=1763721817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qnf43euh50xAz5oC9jatLweC4/+OTf4gXUuEO+dc9E=;
        b=mQlfLG/E9fWHfSpqlMHq/ZQZq6/3hzJ59Gg5vSsMp4DARXdCqjXCC7bGt1OUJU9kyD
         CALMspu9grpFeR/j6fFmt/95CemFoujZj2pTwFM0L1gmtKJ31yCiKdyHcMFRvai8UQMZ
         nhHu108d5RT6zJPUu36eUFBBbf2oeJn/6LqaTxgnfUaueexTccihtzVQLxWj6J5Boizf
         pa4tBYBGw43RKmLEw7Tk5EK/ZfrdjDZga6kIVxbXGvMl9bkb1ck9DQnRMLQs0dV/93CM
         KTYm3WXrxLn/Elhza3PHyTFfG4GZbl/9HV/HoWGwB51dbWBMN83zmO5hD04d9/PW9Pez
         LvTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtuBLBVQIAGbKeKqoiE695wW2SJC0fX3T35zgc1OABhQyFAeDFK9Cz04xUhWZC6DxelftHSAJPw3VuDabUhgFk@lists.infradead.org
X-Gm-Message-State: AOJu0YyZU4jcquTzTykXz/YjWS+qCUgHV5t/JFS+nyimg8SZ6HHcDfdZ
	9rMcHoIrCnBGw+/MsMgJFcent3eOyoU1w7f9TzJf2OKzHYSfNM85QeXFTZzZ+s4xXnE=
X-Gm-Gg: ASbGncsQcdZSwYsgJAXqTOSJDNz2qcsglAfiXC0v/uGHo36COgH3A0d1NB9j8szHEBx
	C3wOb3rVuofzJSbuniMxKgwC33TNa5iHlWZTNRCZekpgfpFhtjGdnrzLAnjlmfiIzII4HNkRhC5
	wN+heMb+Lj4Ajz5rqyMDQykeJcHPA9VSgpb8P9R7oO5bz94D7vZiYaxM29wh/Z1ggrsv4A7rYfe
	BEBKd63VJUyPQyxNr7PW9LMP4q26HJirDFD3mJ13LJLwGxSEF47+OPCZ129xlH0QqZ2hL4sUzve
	q/bk1mK7vwMTykGWtC1lwKHsYkzS0NYMz1X+nRWU+SwetrZswCRcv9w09q36vV2wj8T6Fcd4H33
	Lg8JdvPVeWWNyeqBPJQjzop8QxEA4RY8afe7E7+XvlFxZz3vDf2hnCJrORot5L9LYQd0xMPMEAP
	XJrPaqgIkLPBpGjw==
X-Google-Smtp-Source: AGHT+IHMVj7O3E/KnHZI4uDJ5+oTdAiz5D+VVC1LG6ki9E2djSVIrRZEi/GgjbF6gY3JvKH3pseNvg==
X-Received: by 2002:a17:907:2d25:b0:b73:4b56:7a37 with SMTP id a640c23a62f3a-b73678eacabmr241701066b.30.1763117016492;
        Fri, 14 Nov 2025 02:43:36 -0800 (PST)
Received: from linux ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fad43dfsm360561666b.20.2025.11.14.02.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 02:43:36 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2] wifi: mt76: replace use of system_wq with system_percpu_wq
Date: Fri, 14 Nov 2025 11:43:25 +0100
Message-ID: <20251114104325.116471-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_024338_687948_EE01317C 
X-CRM114-Status: GOOD (  13.60  )
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

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistentcy cannot be addressed without refactoring the API.
For more details see the Link tag below.

This continues the effort to refactor workqueue APIs, which began with
the introduction of new workqueues and a new alloc_workqueue flag in:

commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

Switch to using system_percpu_wq because system_wq is going away as part of
a workqueue restructuring.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
Link: https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/
----
Changs in v2:
- improved commit log
- rebased on v6.18-rc5
---
 drivers/net/wireless/mediatek/mt76/mt7921/init.c | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7925/init.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index b9098a7331b1..95764b82da39 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -343,7 +343,7 @@ int mt7921_register_device(struct mt792x_dev *dev)
 	dev->mphy.hw->wiphy->available_antennas_rx = dev->mphy.chainmask;
 	dev->mphy.hw->wiphy->available_antennas_tx = dev->mphy.chainmask;
 
-	queue_work(system_wq, &dev->init_work);
+	queue_work(system_percpu_wq, &dev->init_work);
 
 	return 0;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/init.c b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
index d7d5afe365ed..e33ab4849e8a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
@@ -420,7 +420,7 @@ int mt7925_register_device(struct mt792x_dev *dev)
 	dev->mphy.hw->wiphy->available_antennas_rx = dev->mphy.chainmask;
 	dev->mphy.hw->wiphy->available_antennas_tx = dev->mphy.chainmask;
 
-	queue_work(system_wq, &dev->init_work);
+	queue_work(system_percpu_wq, &dev->init_work);
 
 	return 0;
 }
-- 
2.51.1


