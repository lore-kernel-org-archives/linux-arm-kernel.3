Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C260C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 06:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GRKzJ39vfI/VxfM8xDjRWpeEOzGtJPnQVVzERHr8+NM=; b=y35rEXcFR5onZHq3+xyAX/xuiY
	cqsG1Y7N5q8l86h0g1MOMZhBVx7HUsw29MPjn1ltc0CTzdW470uWBW8pN/hQpANDDLSI/2EifFZJG
	vm+wspyr6r6rhCVm1AvXb6O26cMH3VNca4ci+OwN7lLTnc/i9YyY30ByjLH97ocsXqNgYS0ICnibJ
	wh//Xttxq+ORKYhdkr4InPiB/KChlCIZGALQZB3dRjJB/U+4wQNIerSsD0V4RdOHEdLe6Oz4ywq9P
	W/Jz2NMHOzau9kPrD+OXli9s0vvDiXDi2pqWt9Ibdgnsq6ue6TDfGOe8fQZiNZ5mwwVtiP6QNlxQs
	LJ1KH+Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS72-0000000G0PE-2rRv;
	Tue, 30 Jun 2026 06:38:28 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS6y-0000000G0Kx-35Lq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 06:38:26 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8454160043aso3420449b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 23:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801504; x=1783406304; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRKzJ39vfI/VxfM8xDjRWpeEOzGtJPnQVVzERHr8+NM=;
        b=OOyFCijC49gXdN/LPVmZ99uQhSalsgfgnNyYCx/hHNF80QHi8KJHfxvUmc4R6NTZ8h
         QpS6k6eL5papokp6pW5hUSsBUWYd/nIDjEllbGHw+WRyyPaBSHTIbm1V3IyoSV3s0bgo
         Ta+Jsmhu8Tu20QTt01KzgZRdm4mJvnbsNSczlS/ULux9E2yJEwtA05LNjvL76e5hb04b
         YIBeCZ18GcqiX4olBjzjzollQbEJW/pWTSejKwXD7vRjMz49vRkyy/4b9QEiLKxfONxX
         p2rPHjzJyg4vcqY66WC71Ods74uqxVoa1QnHsxiQcpcdOFcaQYAcEtnvbRSuKo5/hMtk
         kHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801504; x=1783406304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GRKzJ39vfI/VxfM8xDjRWpeEOzGtJPnQVVzERHr8+NM=;
        b=CIj3QHZaBnFolggBJs9CWSxp+i9uIG2jMnK0UfJxjipXVMJ2plBCPi66rMPZli15rR
         xOsSbc6PUdUY4Q4rhnFqUO+EFUx+fb19X0XpJkipbhBtZwmUdJj64r8PLmCpgYFDsSso
         HYVx+oBcNUaEjSLSBpTFFEi7OZ0yPa5HSror/ASqYheG1YtoN6XLnGznXFdXXHuRN3or
         h/NEaiRvJRC2TtcUXCsFTyRsKRU334jt/0px4PumDNJrQeBixNNZxDjN87U5bf6zaiFB
         ZDZbq3hprLWbO14W49jCFQh/YdCD7atZXhhiRnCYxc0yZL3q4MngAEybYwIi+BSv4nhk
         sWCA==
X-Forwarded-Encrypted: i=1; AHgh+RqZZpDBU0Nide7jxVLDQJ6Jw9jOf2hNhI0HrMNxZk9qCWEXPfE55zn0nOK/6HiF0u0MEMZ2KGLQeblxsobtI3b+@lists.infradead.org
X-Gm-Message-State: AOJu0YylOLZl/+9geh3VfHHXkunjDp5+riqyPZgh2n2h7PLLLLnnqNix
	k2tFHytIvXIkQjhR4iCBQW5EY/lFIo3vfu9mojtfzoCOaEL2t+cwzWBP
X-Gm-Gg: AfdE7cljvBBXy6OK/PyDFiXlZhug/ka8A/TIDXbmhTgSa8wLWdHfEVTzxtUqjkzvxYC
	5zAju/jIAGrkfWLjlm6S1HAbKgnS8ULPEjmJG9rIPMByVx2iCL5kYMul7NxEX3J+Hv2/zNVqtFp
	xxYQkkwigQFLxur4Yt3PHg/QmvNhUlbLu8MqFZsVHX3Fgkwvu1pbFmqsOdtsczbuOKAC/Ct8kmO
	v4pjX7JrJ9tYGw+Q2AVBvFMg9U5QCDExRohmfKjIRBdNQYez8EdY0wsL6NzgBIkVtj9jkGvNITU
	vd/TgAc9RaEFYKr5BbyEV5mRM20kmq8xakVVHDyEdXlbqGiNkbFVAe6OI3agI0zfla4FrPxcN1H
	ZJFexypnBS26aXWKgrPnfbwUVC6u2cy8Lgi8aZ0Y4K4e5AXO9vZwsG6+DiEMzbQIuNKFud7I2wP
	ZspmP19S9IRdej9RkvNBHO56mv/aRP+g5HemTxx7bzeBPpK2E=
X-Received: by 2002:a05:6a00:1ca1:b0:847:7f6a:c56d with SMTP id d2e1a72fcca58-8479f233abfmr1895233b3a.30.1782801503940;
        Mon, 29 Jun 2026 23:38:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:38:23 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 23/27] ASoC: codecs: rt700: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:45 +0700
Message-ID: <20260630063449.503996-24-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_233824_797160_EE5A86E7 
X-CRM114-Status: GOOD (  12.98  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/rt700-sdw.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index 6bc636c86f42..053ccb92c726 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/mod_devicetable.h>
@@ -416,12 +417,11 @@ static int rt700_interrupt_callback(struct sdw_slave *slave,
 	dev_dbg(&slave->dev,
 		"%s control_port_stat=%x", __func__, status->control_port);
 
-	mutex_lock(&rt700->disable_irq_lock);
+	guard(mutex)(&rt700->disable_irq_lock);
 	if (status->control_port & 0x4 && !rt700->disable_irq) {
 		mod_delayed_work(system_power_efficient_wq,
 			&rt700->jack_detect_work, msecs_to_jiffies(250));
 	}
-	mutex_unlock(&rt700->disable_irq_lock);
 
 	return 0;
 }
@@ -502,11 +502,11 @@ static int rt700_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt700->disable_irq_lock);
-	rt700->disable_irq = true;
-	ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1,
-			       SDW_SCP_INT1_IMPL_DEF, 0);
-	mutex_unlock(&rt700->disable_irq_lock);
+	scoped_guard(mutex, &rt700->disable_irq_lock) {
+		rt700->disable_irq = true;
+		ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1,
+				       SDW_SCP_INT1_IMPL_DEF, 0);
+	}
 
 	if (ret < 0) {
 		/* log but don't prevent suspend from happening */
-- 
2.43.0


