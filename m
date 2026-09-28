Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71BCCA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 17:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qzUE7F0kx/Sy/yA3+E0ssA+mT7Axk9cKYyuMi26SVJU=; b=nu+J/otveaQv+iD1cScQsrC2yx
	ryNqpSzdSLdCD6bs8OTvkDlFQTaEY6SzpaIVetQJkOB6JPTgMdhilEmHDi2kg2lCxTpKHpfzUD2Zd
	oqdnaIG2fpUDyfxUjV3PidJ3xyTSce0O0H+6jUJ7hQykDivCoEkCgwdIUJLwQD2xhjw2qhDmMaAuy
	SHmls3HNPKONE10WASPftrDVtVz4lclBuBS5RLuu4fMPyb9huaXzTBPczDaj/6zUpaAnGDy9qB9MQ
	uG21u9HNbRpz2O2NQc0CmnBFbK7X8mHbjluVzXBG4rA+/UoTAEfg+Gn3CTy6+EnrSsjqhoMJVmMCm
	vzwCK1nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBF0D-000000017wp-1CkX;
	Mon, 28 Sep 2026 17:18:57 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEzq-000000017gd-1YEw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 17:18:35 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843c3ee4cfso1582148f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 10:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790615913; x=1791220713; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qzUE7F0kx/Sy/yA3+E0ssA+mT7Axk9cKYyuMi26SVJU=;
        b=1gcnaea+HlJsd86187+m4FZDGzftFEdHyM4pVVOpe51FUb6GmpgJqvov6nIKX312wR
         aLmGCG/hB8ROffjx5iTgJGKfeKVhDUJUvGqsJLsaf7aqlxwtIMffZDKHy85fZT2hlGUs
         rQolLdthiUq/PG/ZZvzHM/CXLZASZFSL5HemnyYPozL1SNnxTOpZVJywcRq0d53EYv1o
         ctR11OSZ1C6kd7roDbhvgvWKbF3IvwxkShYqYR5UG8Ls9kqv5qgwEtafLBJXKnb/Bt8A
         G7ET96e0NJCJgmVQ0/VZpTklm5P3sXVnIEdyG1QLshyXmHx/EMnfcRFOg292cIvz3RJ5
         Yr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790615913; x=1791220713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qzUE7F0kx/Sy/yA3+E0ssA+mT7Axk9cKYyuMi26SVJU=;
        b=i7r+22Mset5CaowlsXJjHU7Hah2j/JSvLqpExF+VCyWGZcipOq+4qxK1HUdTlHosxr
         zcfsniIdFH36RLfIU6a23XyWEZMJayOHA9rKa4EEl/gzLUBFgMFIg1JP9kUJkNctahCZ
         Y4kxHvpPzYQ0EahmISuGiZzU3tugrwJnfv94AF066Su1OXi7FYimlRfSd0MIUsoliZNf
         lp8A17nsPR74mZb6p96wsJ5/g4NHj+qNprYIj/hvmg8lSVY8BRmki8r1Pt2oOMoHV5rG
         guPzfGeiFmdL+V6E7qylihpY8pUzhKZQ9uWtg9qTCxQfrV1BbjQXsM/rgstGYh3DE500
         1Atg==
X-Forwarded-Encrypted: i=1; AKwUvBxtnIOtAFVQzJYuBPxo+Zd+e9rnUt4N6btUWp+bA3a6L1e3wTi70bU8qUsZxbw0TCLQIFnN8YosV3PD+DwIdqTq@lists.infradead.org
X-Gm-Message-State: AFq9FYKc5i1pCoL3afWXoUTWPEuFCQIHDkV6MWDb99mbQGHbR+fVHIrW
	+yE4XKo05V/PXuo+skMb8uEbQcdGrIUya8DVpr00K1pV+Rl3b4SnCt9zfZH86RC5gh0=
X-Gm-Gg: AYBFou0fR98l+1wKM+Ci0fFEbcB0Zh2Z8+NGRBKrqt0AKLMu3DevW6e9wKwiW75Zc7X
	6GQmiNPxxkRuixdK/IJg7gNpdouxyVE6KmRnJ5yDNtb2JeXCRG+dIudsVgXyTTup3rpgUSxqVEb
	tTQrFZsjUm6UzI1OAjQJzoZTgmXJwXt7qPgA+fkV6mXgrzYdSvy2O35t1XizwzXtVGheEvXHOkc
	W2wV3btZj6wJKR1EZgYnFg03XgDokBxB5Wnce0xVe0T9L4IgdiS7o4PRWZSJWp7YNZzFWq8KnEh
	ZQbAsg+cu1Wtmemnn5zIcxRfUul/avZIQivtDUYBKDR4oJ8CpjQnzwt8wHisdL4D75rbsgKwLg1
	6/6HgDMPfbW6vQUDfBKe79gnmk0ZPqzSxlKrhyU9arCu5q6awC0hYyrz9ipX46vVKr/aWXTllQU
	d8MqK9YGjUuyUVDfi60Y5dwLB8GRCyOhfZevOWW4F/2EFcfHrZNjqapvk3fPa/neStkGfIEJHzV
	c2ugHpGVz1ZgDyDSMfvHKn7u4M=
X-Received: by 2002:a5d:5d10:0:b0:488:641b:2dfa with SMTP id ffacd0b85a97d-488716b28c5mr30171327f8f.2.1790615912742;
        Mon, 28 Sep 2026 10:18:32 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a84221bsm29224973f8f.36.2026.09.28.10.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:18:32 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 28 Sep 2026 21:18:18 +0400
Subject: [PATCH 3/5] power: reset: syscon-reboot-mode: enable supplies for
 the next stage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-b4-rk3576-reboot-mode-v1-3-65486b03bd41@flipper.net>
References: <20260928-b4-rk3576-reboot-mode-v1-0-65486b03bd41@flipper.net>
In-Reply-To: <20260928-b4-rk3576-reboot-mode-v1-0-65486b03bd41@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sre@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3628; i=alchark@flipper.net;
 h=from:subject:message-id; bh=YoPcT+r0NPwyBnJxWK4PIEC9nGCY4cC6HMWtxjxy0e8=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTtWhgXXaSTtI/Hu03nsp35v1ky2hOMxY/63+Pgd2A+t
 eZtM8PVjoksDGJcDJZiiixzvy2xnWrEN2uXh8dXmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKZaqIiRoXNpqZeOWp7gt8Wz/obaz1Q48eCojm67ouwvuYUNHLOX2TIyfCyaxO5
 9yPuJvSOjW6208LV7aXatE1/nnLD4wT5ntXQxLwA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_101834_477078_9D0CC7CB 
X-CRM114-Status: GOOD (  22.24  )
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

Requesting a boot mode on some SoCs such as the Rockchip RK3576 hands the
request to the boot ROM in a register that a full reset would clear, so
any reset that carries it has to leave the PMIC untouched. This means that
the regulators stay in whichever power state the running OS left them,
which may be unsuitable for the early boot code. E.g. on RK3576 the DDR
initialization blob runs on the way back and accesses registers which
Linux normally leaves powered down, resulting in an unrecoverable abort.

Get every supply named in the reboot mode node and enable it when a mode
is written, which is when a mode is being requested. The supplies are
deliberately left enabled afterwards: the system is on its way down, and
what runs next cannot turn them on.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/power/reset/syscon-reboot-mode.c | 39 ++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/power/reset/syscon-reboot-mode.c b/drivers/power/reset/syscon-reboot-mode.c
index e0772c9f70f7..3072922f1716 100644
--- a/drivers/power/reset/syscon-reboot-mode.c
+++ b/drivers/power/reset/syscon-reboot-mode.c
@@ -10,6 +10,7 @@
 #include <linux/platform_device.h>
 #include <linux/reboot.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/mfd/syscon.h>
 #include <linux/reboot-mode.h>
 
@@ -18,6 +19,8 @@ struct syscon_reboot_mode {
 	struct reboot_mode_driver reboot;
 	u32 offset;
 	u32 mask;
+	struct regulator_bulk_data *supplies;
+	int num_supplies;
 };
 
 static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot,
@@ -28,6 +31,20 @@ static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot,
 
 	syscon_rbm = container_of(reboot, struct syscon_reboot_mode, reboot);
 
+	/*
+	 * Whatever acts on the mode (e.g. boot ROM) runs before the operating
+	 * system, and may need supplies that the running system had powered
+	 * down. Enable them here, and deliberately leave them enabled: the
+	 * system is on its way down, and what runs next may not know how to
+	 * turn them on.
+	 */
+	if (syscon_rbm->num_supplies) {
+		ret = regulator_bulk_enable(syscon_rbm->num_supplies,
+					    syscon_rbm->supplies);
+		if (ret < 0)
+			dev_err(reboot->dev, "enabling reboot mode supplies failed\n");
+	}
+
 	ret = regmap_update_bits(syscon_rbm->map, syscon_rbm->offset,
 				 syscon_rbm->mask, magic);
 	if (ret < 0)
@@ -36,6 +53,13 @@ static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot,
 	return ret;
 }
 
+static void syscon_reboot_mode_put_supplies(void *data)
+{
+	struct syscon_reboot_mode *syscon_rbm = data;
+
+	regulator_bulk_free(syscon_rbm->num_supplies, syscon_rbm->supplies);
+}
+
 static int syscon_reboot_mode_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -59,6 +83,21 @@ static int syscon_reboot_mode_probe(struct platform_device *pdev)
 
 	of_property_read_u32(pdev->dev.of_node, "mask", &syscon_rbm->mask);
 
+	ret = of_regulator_bulk_get_all(&pdev->dev, pdev->dev.of_node,
+					&syscon_rbm->supplies);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret,
+				     "can't get reboot mode supplies\n");
+
+	syscon_rbm->num_supplies = ret;
+	if (syscon_rbm->num_supplies) {
+		ret = devm_add_action_or_reset(&pdev->dev,
+					       syscon_reboot_mode_put_supplies,
+					       syscon_rbm);
+		if (ret)
+			return ret;
+	}
+
 	ret = devm_reboot_mode_register(&pdev->dev, &syscon_rbm->reboot);
 	if (ret)
 		dev_err(&pdev->dev, "can't register reboot mode\n");

-- 
2.55.0


