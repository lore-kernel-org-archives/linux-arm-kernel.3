Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19E5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 14:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GRKzJ39vfI/VxfM8xDjRWpeEOzGtJPnQVVzERHr8+NM=; b=2yeMrlhDki5Cw73YYE/PsPaVLt
	JNeCb13VW4mJbut1Ox3A0QdUS6wWY1hxfXOc68jO+Q0a7AdL2jrH6LE8k8FTRXKdqAbpAiUeOeubv
	R5lFhqdaxwj5JhcvvUsF9gixxx5QeXEfgqMH/pxM5NfMeJ9nkWwMPhjngF0piPpR4wilYz+5wge6k
	0BmM/8MdcliudAmoCwB5C/b8WdziXph5/CvvIHVDLCoh3DIvwtlfJ6NMxDWCJWKOBSCuo6o01vwyT
	rPulo3+bZNPO65LG0nJ7YMtp/XUChcdk1y0Vx8kVc3Er2FNEcdp5tAiELCV/+8+jx4aRwpDXOWH3f
	iQe7Gw1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTAN-0000000HIcy-19bN;
	Wed, 08 Jul 2026 14:22:23 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTAA-0000000HITO-2tRO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 14:22:22 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2c6b67d5fa1so8367895ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 07:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520530; x=1784125330; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GRKzJ39vfI/VxfM8xDjRWpeEOzGtJPnQVVzERHr8+NM=;
        b=hzRRsXqgfnU3u7ihg/4yZkCaqNrdYiV4RRVLLjcuNrYMJdLXhvtmOOCpG9afZbvqbl
         eVE8yUc0hSuAZBp3aS12qoZ67v3nuBOw0IvHnNgIlQ7AGa7Z+DSkBsP3+GZA6P5ZuY8h
         kXp2wcm87kRxz/bm+2EuI9JLUw3MVp/+/4Ca+Hr7nLOEBqHgh6rgEiXWDjqK3IxF+NLh
         yNAcP9hNhBoZUt6HZc+hSjqAjc4RFlZDpiL625SJMY9ODTdKXLw+0/RWgXpPHbypv8lp
         TJLfSTC4i3O9xnG09lofr+L1gvtmbsO4LH31eO1OdbQBTZjMVZJsBa3vOqTISORabF96
         X7Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520530; x=1784125330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GRKzJ39vfI/VxfM8xDjRWpeEOzGtJPnQVVzERHr8+NM=;
        b=EvmNXlE+iXAbuBR1+CqujkXVdtqtSvDCsnGZ+uY8XcxsSdYz1zpGEoSP9ThIJKNPVo
         CLqVqiDb5oyGicUu5jZkYRPCWHmFnintBp7R5ZwnXbh1ZkhpHOj2427OczcFU2cD0LDZ
         S9Sccns5iGs9fuUouHhFdOm9TIppuSFijBNQtLlelC23A2ehqQOW2++txuW6IOSqrzfC
         stwLur9khiwx6RWWVWOnMSzheupK3tshqjyJn0NL8elgzLDysanvFHgMdXmc1fntJpFh
         K4v1WTUhRY/ggZOqvbXaNe2tSDjDYWLFPq6s0FDte2LbJCY/CFbH3jGrxLYGvjhEL4Zq
         mZaA==
X-Forwarded-Encrypted: i=1; AHgh+RqqRt0LNgY9mO7nnWZhI914jmEf+tq7eSLwp3FMrEpmOXMFOn8sEumxBTXJ9630eY3XbBKmcn9BSwqJTtPE5e+V@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+04trxDvZbp8ZvyWLAHK5YpH0r8eD4eaGh78vz3BJZkJHAyV8
	WoJK5njlQH1ArZEYR5u1yFet0Q9IhSp2G+bXcXQaFTNFlADdwS9Cv94xuK9rmA==
X-Gm-Gg: AfdE7cn/GwiY3RU6dpqo3vRICdBR1YD8GVwUM+ahRrEHwIWrBzP8LIQVmoso5y9xszR
	GtNQctEQHWIvpe6ZWG/d8Whbc+iw1HEi12EvcFn+V4GK6hSbXfMK12EU3VqzIuujpVcC48pJrHr
	KtZs/7NQ/1mCbnanIUo48wsqZT0ibETP3/WyssGATda/mr5vBA658aqnB74BdPDNS0aSq+NQ2ZM
	m/+OS85aUipuLoRs7YmsOCiepHbBiZJAkYhfX/BUdFebAo58L3NC52B1RCqbEtx07h7zrhVWAll
	s5o8zKM87B1AVOjzgoDX5fXVMN+4eOqN9XiOxk9QzoQE9RW/hd5sKxquZlhEcYMhRWEl1QXxhLd
	3x3NNAq9/z528gmdc6Zcg+m/pegyFtFaBkoKes6VRmVDqLHUj2Gqy1KB2C77q9HmqaZQlf/aPuy
	kbfGxSfG+xOUPbbxiAfhDzj2+ziJX/rUEzNuGqtBdrvuQgM5c=
X-Received: by 2002:a17:902:d58d:b0:2c9:97a7:71b1 with SMTP id d9443c01a7336-2ccea5828acmr29807815ad.44.1783520530129;
        Wed, 08 Jul 2026 07:22:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:22:09 -0700 (PDT)
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
Subject: [PATCH v2 23/27] ASoC: codecs: rt700: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:30 +0700
Message-ID: <20260708141734.578926-24-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_072210_733710_5345F8F2 
X-CRM114-Status: GOOD (  13.66  )
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


