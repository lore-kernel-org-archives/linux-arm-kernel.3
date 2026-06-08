Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A002CCD8C90
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 02:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9/UZPLDL99uE79PZBqTgEFaV7YHrnGQJQrwQrbWdnDU=; b=wZBAEybW07t8mqO+nv0Vc3upy8
	j3DFZplM98XvZalSDtqkxP1JCnxHJ1VTxF7eU6p7vF9w4WF0pcH8MClLKPQ9bHBzUaLm5EKh7+1U9
	tU5OBo6/Gmpwm7oFoKAebXaGejVaBiJUP7OtJYJGPLg7GTlsqOv8X6+STEhom7SZUH1ZAsNdZZoka
	JUByKTapguEUzyCLRZB5s4gdtrNdImqEDdds7WM4LeyIcPSjWZ0mLuSotqroVFv3CGDUW2t1KsZhE
	vnko4J3rfQNqlAN1irXQ3WP8CHUwA9bnYL/m87c6/Gr+3CPy5ojlYYiKXkGXcvl3D6PiYpC0ThPYC
	e77mJ8oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWPS7-00000002i1N-05ss;
	Mon, 08 Jun 2026 02:10:59 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWPS4-00000002i0g-1vcd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 02:10:57 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-8cce87d7995so44701486d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 19:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780884655; x=1781489455; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9/UZPLDL99uE79PZBqTgEFaV7YHrnGQJQrwQrbWdnDU=;
        b=OYaaQw7w0fG/Kd510SAYS2WIeDUPM8UJ1Id/8N22R/De6OWnvxNl7AsBlgAIvyQfVp
         ebTjH0AOEGygilO6k1MiKezo3Pa4YNj9tUhConCcRTWLL+WT01/BbZWAFeku4DaugTGR
         k2FDKv2fH2oxyFCK7SEc2mdy+Fn2x6qV8W9GLsQqK6gWi4q+ayj+iUbLB4Aowy9h3DRZ
         UHqZVPCUhJGMiLtEuCkZVZqjnCATFomAQc3bAXAVky9ReZA2FHSmSuvBVvNClNsieMCx
         C13UhifPD863ool/cLIg6i3kg/B88zklkigmZ9rfG50DnYCVHV6y1e6qq1ByOwiIAxhH
         kC4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780884655; x=1781489455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/UZPLDL99uE79PZBqTgEFaV7YHrnGQJQrwQrbWdnDU=;
        b=qvI9ZS4BWGncMMII3Wkzdme3xOveD6B3ShsJIotR3Ib82tTOyM+XI4mGIQj3Zjh8r9
         6HNAAZH82BGSfft85JTkVLMy6KwOiu9E/x5M6W38b0nWWHR5wdG/ReVose7+BPhjx9rn
         HBB2iPTjHROaN+peYlgwIEGNPU1tLybp5BIlooMirozcscRE3sWusuosvgnkPo/WGyXp
         Je5ktLTbO5/1ObOWlLGrRSvVrqtCBhLgkVdKTMR8vAY4S5VC0cv1ir9g40qcq8iKRYKI
         qmY9Hn57Z52osD6EdRelMm88fwsSM8iz07yfEXNj1crJNfLYNToySIxxcfK4HJiT7svs
         oSBA==
X-Forwarded-Encrypted: i=1; AFNElJ+DYpFgQPbWjM+P9cVM7YXhaLz+WZKZx+sU8z8WnVjqMjqN8ZOPtnl/bb597/vFkmjFccL2xFfK1KcuxQj5DtKw@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6GlRs7wvUxQH+7K4RomgkIIP0KEjxllWOVQsPejBfiOiFAT9H
	wBT5TVwoZRnONhV9ly56u3NSc1JuYeC+FSHWJNvVJp9yP7RqYcnyFVPF
X-Gm-Gg: Acq92OH+nsmSGeeTb51S1+G7FRwOJloifCH2ist5TxZt6JPJ+u2QUNQS+GFSYCmVHWJ
	a79M3BHSfiEwxvCvG92rjqPK7V9HhQfz9Ac31ziRRLP3ItzIFYcyuOcRClAd5Rn+tM+DHefu8D/
	VgpPLTDTGJ/yWkByNWclBdzZP7vWUCcjqkB8Oz9Sq48zAaxSW0A3haisGELKC2ebGZRywgt0UeW
	Q23nrSFdwWyhWeUsvSjf71GS1eDXhqAFgqnU/hGtZrtN+1n9O/G9uv1r8YB9qDXj5rbzFgbSA79
	6Yz8/AuKmhEV9wo0YZtTJMNIHt1jv5RcyhqWDhx9O/fj8L+NHDCRGBdQMWjc+syOEE+lGAfJUZ6
	SoVBqf/ZYnTgPVn1dh+dpygLvpVJROHqlWGOKHvl5U4BUP/zh0m/JRJGzAqGbVVJxrQwYmmhBiy
	y3MOzdJ6t40hwN9Z8c8L7ZQqEwUFI5oYbLVYoH5siRMsO+9mYKfjA=
X-Received: by 2002:a05:6214:808b:b0:8cc:f135:52aa with SMTP id 6a1803df08f44-8cee5ffe18bmr244656026d6.21.1780884654739;
        Sun, 07 Jun 2026 19:10:54 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccd9fc7dsm151466216d6.5.2026.06.07.19.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 19:10:54 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] mfd: mt6397-irq: Fix PM notifier use-after-free
Date: Sun,  7 Jun 2026 22:10:48 -0400
Message-ID: <20260608021048.2577577-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_191056_533521_5EC312F9 
X-CRM114-Status: GOOD (  14.23  )
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

mt6397_irq_init() registers chip->pm_nb with the global PM notifier
chain. The notifier callback uses container_of() to recover struct
mt6397_chip and then dereferences chip fields.

The chip structure is allocated with devm_kzalloc() in mt6397_probe().
If probe fails after mt6397_irq_init() succeeds, for example when
devm_mfd_add_devices() fails, devres can release the chip while the PM
notifier remains registered. The same lifetime mismatch exists when the
driver is unbound.

Check the register_pm_notifier() return value and add a devm cleanup
action to unregister the notifier before the devm-managed chip is freed.
If adding the cleanup action fails, devm_add_action_or_reset()
unregisters the notifier immediately; then remove the IRQ domain in the
remaining error path.

Fixes: 4e2e7cfec13a ("mfd: mt6397: Modify suspend/resume behavior")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/mfd/mt6397-irq.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/mt6397-irq.c b/drivers/mfd/mt6397-irq.c
index 5d2e5459f744..8947f7e732fa 100644
--- a/drivers/mfd/mt6397-irq.c
+++ b/drivers/mfd/mt6397-irq.c
@@ -169,6 +169,13 @@ static int mt6397_irq_pm_notifier(struct notifier_block *notifier,
 	return NOTIFY_DONE;
 }
 
+static void mt6397_irq_pm_notifier_unregister(void *data)
+{
+	struct mt6397_chip *chip = data;
+
+	unregister_pm_notifier(&chip->pm_nb);
+}
+
 int mt6397_irq_init(struct mt6397_chip *chip)
 {
 	int ret;
@@ -233,6 +240,17 @@ int mt6397_irq_init(struct mt6397_chip *chip)
 		return ret;
 	}
 
-	register_pm_notifier(&chip->pm_nb);
-	return 0;
+	ret = register_pm_notifier(&chip->pm_nb);
+	if (ret) {
+		dev_err(chip->dev, "failed to register PM notifier: %d\n", ret);
+		irq_domain_remove(chip->irq_domain);
+		return ret;
+	}
+
+	ret = devm_add_action_or_reset(chip->dev,
+				       mt6397_irq_pm_notifier_unregister, chip);
+	if (ret)
+		irq_domain_remove(chip->irq_domain);
+
+	return ret;
 }
-- 
2.43.0


