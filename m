Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C36DCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 09:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QNvi+wp3wynpPPhrWSTZf0UAlT0FrurlnalPogZVUb8=; b=UgJFYpeoLHilnDH0oa4UUiU942
	dUOI+VEk9otBb2G8WwfoxB7AaO7CCX2iZXVBTwtIpfUzYQw3vPkM1qpp3vVboiL0bmiQoCNO1Gf1Y
	d4LzzYbpLhBwrnraP7JV5O5g9IRFgdrjmtGH1qz4ha8uZoJc06JTkI1g1bKpeossvOeXK593ypukL
	EZuhMwOFh5g6gS7hKSk8/p4S9ak+m4aE7Q2Qiw6z1rYO3V9azuJhTTZ1yHzNpVuZZrjTYBu6EKDo1
	tpjg02Zx8q4Ajr8T4yRv+6gntPNitUzJGO0QfzVt7W/IiZkEQbLMm26lB2MPwcGNWiPxakVvdbu/W
	HsbWuHWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0cuq-00000009tbS-1fFy;
	Mon, 22 Sep 2025 09:33:00 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0cum-00000009tZc-2oeY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 09:32:58 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-46c78a1784dso2689975e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 02:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758533575; x=1759138375; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QNvi+wp3wynpPPhrWSTZf0UAlT0FrurlnalPogZVUb8=;
        b=fROklUFT4L2j8SYR2m4qUnepQjTSe13txwvQH96Dp2NXj1mD0bHcKQNOLBxantugJX
         iMztEQ0j/odnk7oB1G1nTEEA/RmQxQfPJx1gTGd/0NRwBC0dR3Dk0Pfy12EmVbNxsGlM
         kNoxW8LxAe75JaGxd76jLMZIhEZHNrml4a2qzahDHMuzJVSrY+QRUDUQj7BGURmVG87s
         5qpGYMoWMiVjaZWobgGASUTzMLouAmx20VtCspXLsQNvJT9eW7f9FUIaNISxZ67Y65US
         x3zClI6DVvIwFhNSROs5B283MuBI6IiZJeUU09KWYMGV8/XK2erMwuviQ1YXoK/ceBTf
         hlVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758533575; x=1759138375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QNvi+wp3wynpPPhrWSTZf0UAlT0FrurlnalPogZVUb8=;
        b=GuuJYBN84ZtLVrKCK7Pmrnp1vOCF0ULY6/U1sK5tZMGRY3w8QrwN/hzU1J7v3hWexU
         pCqOYP6VpGvrly4k7PzWDtiNo32RDL8jMJQVpQ94XMY3EFyq2nQiFpzUVdp9FuJOqPqf
         x5dcnjZ7Y6kcdp8UIdQADaX8LufmhSGx42W+KG9dvFkNMijwEDD73CyCbdVr7xyDq6p+
         wsX2e9azToMVNLlHS2sf2hzN9drFqJFxGh9zk2iQNothA/sz5EDHS36I+DOR2z0OOmsq
         OR2zp8k9debAuWdaHNydBmN+M2MJZxKnwmxDmB/vZiezmlm3Eg0GNFCZv4cAxa14TQQ4
         gy6g==
X-Forwarded-Encrypted: i=1; AJvYcCWheFVvNTi2bRw7249EBFOaJsdWO1Aprjz/KUcPz2ael3Jc6FNI33grCqsdEjWOdMEJsKWskbYScj0FRLU5y3tP@lists.infradead.org
X-Gm-Message-State: AOJu0YztOFCyo62B59QFRz7vCPjsYTdPD5l49KZCYlAR43DqLObgl15E
	RNL01w/maTzmyw2EAwCrHYEIVPlmu/1wCDS9FADGYApylOnaa4Ej9Ugjl3tesRg2+LrCQv998vm
	Lh6E+
X-Gm-Gg: ASbGnctIdkUVR5O7GHzAJ8GBoXzXP1lKnfpUqAMzTN8fxSNHmLLnDCEoe5AcJb7eC0i
	dh/QwzBF8fW6j1rS9C8ppwaEiDM6yc3ZBNRRPoRlHZW+ID44CIt7tcneLKWpBxXlkNLmauiZYhh
	hK8kXZa2aTes/YN5UmdvUrTbpdfj43+7BCAqEl50DU1iyyo1MtL7KgOkk+a9Ag6cvWKf6WmjLQ5
	wtPzXE9FEf6xuRMhgAoy/pyRCxGRdhLu/BulOvrjgO40OkEFecEQ3odBqVQYDYjUi6P7yWQ6lAE
	C8XgrLSQl0c5aSqdeZFRrDsnYaW0TeoVefvbaNIC7csn1iCO+uHzJVnNceeKAgLpbGDloF8VeQv
	CSZaGTrmI3nHQHfSdgNdkoHtSDQIwlXVPvzgUNVbzcyjh9yg=
X-Google-Smtp-Source: AGHT+IF172Viy+N81eYJ2CoLILxSyY4CzYyBCvvGt0Ua73puGJtp9nP2xby0yD++08WnBK7gTICZyQ==
X-Received: by 2002:a05:6000:2c01:b0:3fa:2316:c20 with SMTP id ffacd0b85a97d-3fa231616fbmr3621066f8f.5.1758533574771;
        Mon, 22 Sep 2025 02:32:54 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee0fbc7188sm19735964f8f.37.2025.09.22.02.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 02:32:54 -0700 (PDT)
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
Subject: [PATCH mt76 1/1] wifi: mt76: replace use of system_wq with system_percpu_wq
Date: Mon, 22 Sep 2025 11:32:43 +0200
Message-ID: <20250922093243.140946-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250922093243.140946-1-marco.crivellari@suse.com>
References: <20250922093243.140946-1-marco.crivellari@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_023256_735795_9F4E6142 
X-CRM114-Status: GOOD (  15.22  )
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

system_wq is the per-cpu workqueue, but nothing in its name makes that clear.
Because of that, a new system_percpu_wq has been added and all the system_wq
users updated accordingly.

system_wq will be removed in a future release cycle.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
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
2.51.0


