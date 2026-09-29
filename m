Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B8B1CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 10:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rGvPl8En9vQFk7BFZDJEBDExAfjn0FzJiGJJ7lWPWO8=; b=vBzPUVL8FGx6G79HupMrujXTXh
	qMjjODV6S5pPMp05HEAVPuf4+BFvasFlade3MH4FT/KSqsmXNSK/jq1yo4W2xRW6BOTiQcP6Ypki4
	pVe1d3HGqufez5o+b0+Zbm+/JAu8S6epzjxNXX+dHOf9My3PvMjeoQXZ3NjASCv5Jhw546hTchttG
	rTZ/91WLai1wX3sx1tko4IvRpXOHrItVio5xUWHczKmAfQ+MzbnosbSlD+4DLKTQvvE+pIMLh8S+D
	SV84r1x2AMJprjYY6wcu0WJ3X5UrEB1TUDwz9AgF4duxmuQwyu2odAhu788tnD/2vxw0G3ANmPZ8E
	9bjZ4fFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBV4r-00000003A5g-05LS;
	Tue, 29 Sep 2026 10:28:49 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBV4k-00000003A0g-42b3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 10:28:44 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-4885a1480a2so2344666f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 03:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790677721; x=1791282521; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rGvPl8En9vQFk7BFZDJEBDExAfjn0FzJiGJJ7lWPWO8=;
        b=FRyFvKfY1XuJZNKfIQ+R8Q6k8kSpNvWcQN1WtSkKZtXZmN8ARHGyhWF+7CwQ9/WVdZ
         05QU9bOssNj070yxJB13jfRwYaiA+iuX0vxUIOnJcDcknhU8zZF8QZWQVfFsRL/jQ/k7
         CeW1ov5NjSn5Vd3HYHjGfV+bByHoGLXPbJj4UJdNWsyY9pIVZplUlfTLa1o+80XISWto
         HqcnQvD3x86J9H2xkoeihsChW7+DcM/RyDAruuv5LXiwEzzC20FKMIiI+XJic3zWXitZ
         8wwp5fGvfzKCa8FpJBq36eo5XtqzrUppgRlYKgrV4pa8l6DHvGoaOddKcNudV2d706v+
         SgwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790677721; x=1791282521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rGvPl8En9vQFk7BFZDJEBDExAfjn0FzJiGJJ7lWPWO8=;
        b=1xinmC22WkVCQx/LnYNhv6qxSuMy1ZFFwsloLUYPImWB0Xm7HkDivStpK7dePiRS5X
         43FyGzdrz60+drs2TUjCfvolXCIzSVdK6BSU2YdU5Z2GRL1PaQYY/sBrdJzHd6f+vb2q
         m5lhntAPw3QrLrrZsNOjpml5XxZYHrbH6AZ5u4dhGz2LvYemgKszK4WR4KVMo6vZ8xNg
         OrIOkWRfZxmUdTMfdsUAVEORsAv6nsSi+PKqAD5ySgdIg0JQnGXsU34FAx7OjzyiZhZ8
         0gHEqhEfu/tqpwBwUTKzENPpVe64RgtedyPqpsgH1Y1Kw1GWsCbm2lgMAeYTyrRO7H2g
         mj4w==
X-Forwarded-Encrypted: i=1; AKwUvBwjllsEVBZTQqnMCxeSXE24bC47+qrJXxdKBGZp/c63WcX9HtEHoYtprHVNpOE7gi8INd4eukIofBlvS0KZ8t+9@lists.infradead.org
X-Gm-Message-State: AFuF++kPlOnztP9ZLsTEmruwOAZpoGxReVzj+vuOjJCEQESU/k8GqXXJ
	C9OKof+LrMnzmsTe9Aaq9vwzD9NJLa2r+JzmXJv6XxUwPEGjz13zKRsrq2bbWiDdGSw=
X-Gm-Gg: AYBFou30QVbzhukKUCVozRVxQOVlDhaF4Dcw4ugNkOd0c95yrRvVAZUUpjMRVsMaFpu
	9itGRP86BaWo4NgdWanr2dC9oQKZoqcPB5UkREOwqwSnW2y/tI56etcSnL1TQ1NJ4+48spP7pP+
	HOwED2pd4lTJP8So0JYEyoh6ky9bVw0F7WGVZdU1Kc1Wy7soH8FodBUA7Nj4v5HUN4EoJ2VFr0k
	jQuj+cJ+QSIEXLWx1ItB5ylABG1iIRJ10mJAz+XSc7Xo9MKK6aqXqfkdNaf2Mf7QTdi72KWvnhI
	t0GMfe/isNZ+Y5Qfxq5ijyMPHagFFXfN8I8AHoN9wzBoap+FwOnJ2yHpn9dFUC8RQ5g6YvIK3RO
	PF+b5+zjUTYFNWT60C8xhHs+QeYCXOiB4K1QT7azFgJTAo6EHKiMi86mzuvGJ/1i4Ke1p8+3VS/
	/OUdExe9u1RaFjP63kcCEWlwiQF+VbshIm05audROzQHcatUEeR+MFu9yUxagdm/zIz0uacT1kZ
	tcSa5O9/4EhMYiekg==
X-Received: by 2002:a05:600c:4fc9:b0:4a0:37d:9e21 with SMTP id 5b1f17b1804b1-4a0037da3c1mr96548565e9.29.1790677721312;
        Tue, 29 Sep 2026 03:28:41 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfb479asm66579305e9.15.2026.09.29.03.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:28:41 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 29 Sep 2026 14:28:20 +0400
Subject: [PATCH v2 3/5] power: reset: syscon-reboot-mode: enable supplies
 for the next stage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-b4-rk3576-reboot-mode-v2-3-5a34ca72065a@flipper.net>
References: <20260929-b4-rk3576-reboot-mode-v2-0-5a34ca72065a@flipper.net>
In-Reply-To: <20260929-b4-rk3576-reboot-mode-v2-0-5a34ca72065a@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sre@kernel.org>
Cc: Alexey Charkov <alchark@flipper.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4101; i=alchark@flipper.net;
 h=from:subject:message-id; bh=5ADyit8Ijsc5TQdkw96Oigh6pxYDNfJpvW/Ssz5MCwE=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTtnnRR7eaco/P+HJ1ifNh4tcP6XSrCzSVz2xfYiq+2U
 l2f4PR7QcdEFgYxLgZLMUWWud+W2E414pu1y8PjK8wcViaQIdIiDQxAwMLAl5uYV2qkY6Rnqm2o
 Z2ikY6xjxMDFKQBTvTGRkeGoj11uZuRb4QuXDK9NCzNw8bj+45Sxrf3X7VeNbjMsWfmM4b+3ztk
 vQSceHTN9e2i2duqkxByDpXMqCv/JGJrtmf74iA47AA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_032843_045076_5AD047AF 
X-CRM114-Status: GOOD (  23.57  )
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

------

Current implementation of of_regulator_bulk_get_all() never writes the
supply names, instead leaving them uninitialized, while the regulator
core uses the field in error paths to provide meaningful error messages
to the user. This has been highlighted by Sashiko on v1, and is addressed
separately in [1]

[1] https://lore.kernel.org/all/20260929-regulator-get-all-v1-1-e887c66a47f1@flipper.net/
---
 drivers/power/reset/syscon-reboot-mode.c | 41 ++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/power/reset/syscon-reboot-mode.c b/drivers/power/reset/syscon-reboot-mode.c
index e0772c9f70f7..5ef882d81816 100644
--- a/drivers/power/reset/syscon-reboot-mode.c
+++ b/drivers/power/reset/syscon-reboot-mode.c
@@ -10,6 +10,8 @@
 #include <linux/platform_device.h>
 #include <linux/reboot.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
 #include <linux/mfd/syscon.h>
 #include <linux/reboot-mode.h>
 
@@ -18,6 +20,8 @@ struct syscon_reboot_mode {
 	struct reboot_mode_driver reboot;
 	u32 offset;
 	u32 mask;
+	struct regulator_bulk_data *supplies;
+	int num_supplies;
 };
 
 static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot,
@@ -28,6 +32,20 @@ static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot,
 
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
@@ -36,6 +54,14 @@ static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot,
 	return ret;
 }
 
+static void syscon_reboot_mode_put_supplies(void *data)
+{
+	struct syscon_reboot_mode *syscon_rbm = data;
+
+	regulator_bulk_free(syscon_rbm->num_supplies, syscon_rbm->supplies);
+	kfree(syscon_rbm->supplies);
+}
+
 static int syscon_reboot_mode_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -59,6 +85,21 @@ static int syscon_reboot_mode_probe(struct platform_device *pdev)
 
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


