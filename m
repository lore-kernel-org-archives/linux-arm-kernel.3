Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489F2CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 06:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C/qSfn8XWm+oaCfY2V1Q0d+VxMXeZuMkTYlNsiNF8Y4=; b=QfqT47DAMxG90/nMO4TEt2Re+Q
	N9IFy3H9PU8DVryYmNfU7xwJ5qVaDJkVZOW3IRB5+qIrIzlU0JpmQ50aFpXuPZ+SY9RPDg/uzEYRW
	cd1AJ+OzsW0MHC7lhKTpFUw4vZ0BGSLE0nWm3iH5QS2jjA0/0Ke5zIxrX9KOYlnZxymkjJSDobiLI
	hj3Ajxc4uuYFzG9MR1TAMpU1rI5S9kRZjNgsgeVUzOIwtK4kprUOQ5nk4524/zWr82ZIK6jSb9cFd
	ucBpKbj2TsgWqR0WdDmY1jIPUHoh7jWDP8wHCEJSEjEpJkju6O6XSKmoIt1tdekAzoW8XETueciYU
	74l34N5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGtbw-0000000Ex0w-2nN1;
	Thu, 06 Nov 2025 06:36:44 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGtbu-0000000Ex04-1ggS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 06:36:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=C/
	qSfn8XWm+oaCfY2V1Q0d+VxMXeZuMkTYlNsiNF8Y4=; b=irJ0f6mCzGGHqQUWxw
	QusFlN3nZOAlsiLI+QxGYlOOVI9I/UlQ71MIJQPeitkxGu5qsBaB7T91cIM0wGWf
	FEiMl5ESLTelPqsFfaA5FszVutgIoA3bIwcFjnRMyu2uN5CklkULWGTM5sHDunFN
	+/97h97/sR6yonYdf3BcmBuJI=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgAnnZfrQQxpfqNrCw--.22232S2;
	Thu, 06 Nov 2025 14:36:28 +0800 (CST)
From: wangdich9700@163.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	wangdicheng <wangdich9700@163.com>,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH] ALSA: hda/senary: Replace magic numbers with defined constants
Date: Thu,  6 Nov 2025 14:36:26 +0800
Message-Id: <20251106063626.115358-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgAnnZfrQQxpfqNrCw--.22232S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ur47tryktFy5KFWfAF43ZFb_yoW8GF18pF
	n0kFyrKrZ3Jr10yF18GayfZFyrGas8WF43K342g3WYvan2krykX3Wjqryaq3W3JF9rK3Wa
	vryxZ34UCryqyaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi-tx3UUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbCwAzoOGkMQexNygAA3T
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_223642_834027_5DFC1749 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
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

From: wangdicheng <wangdich9700@163.com>

Replace hardcoded GPIO node value with a defined constant for better
code readability and maintainability.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/hda/codecs/senarytech.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/hda/codecs/senarytech.c b/sound/hda/codecs/senarytech.c
index 99af8d5e51db..d61d57538bc9 100644
--- a/sound/hda/codecs/senarytech.c
+++ b/sound/hda/codecs/senarytech.c
@@ -19,6 +19,9 @@
 #include "hda_jack.h"
 #include "generic.h"
 
+/* GPIO node ID */
+#define SENARY_GPIO_NODE		0x01
+
 struct senary_spec {
 	struct hda_gen_spec gen;
 
@@ -131,11 +134,11 @@ static void senary_init_gpio_led(struct hda_codec *codec)
 	unsigned int mask = spec->gpio_mute_led_mask | spec->gpio_mic_led_mask;
 
 	if (mask) {
-		snd_hda_codec_write(codec, 0x01, 0, AC_VERB_SET_GPIO_MASK,
+		snd_hda_codec_write(codec, SENARY_GPIO_NODE, 0, AC_VERB_SET_GPIO_MASK,
 				    mask);
-		snd_hda_codec_write(codec, 0x01, 0, AC_VERB_SET_GPIO_DIRECTION,
+		snd_hda_codec_write(codec, SENARY_GPIO_NODE, 0, AC_VERB_SET_GPIO_DIRECTION,
 				    mask);
-		snd_hda_codec_write(codec, 0x01, 0, AC_VERB_SET_GPIO_DATA,
+		snd_hda_codec_write(codec, SENARY_GPIO_NODE, 0, AC_VERB_SET_GPIO_DATA,
 				    spec->gpio_led);
 	}
 }
-- 
2.25.1


