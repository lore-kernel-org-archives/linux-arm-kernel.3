Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9931ACCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 01:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vh/klwh3MVS0nfleb2OS2faqnpk2ska4Q8LwsS9GzMA=; b=2js9Kdn3TsQZqA4XsiYGDyTwYV
	G/1FlZFIde665JoGzd3zchaP5wsOvGnIf+DolYxFUSWbgcqeBOnFBgQC775b2X/yAIpSpg1EanWp/
	t4ADC9YSD1aWqduggj3p0Lwf6l7eCwBatEYcFeveumdGUOZNm8YOJF6s7hSyygQbNxENqSk72OOfW
	RAFsk/FhYZWpfSU3myzY6DYWjlhDdudptswQTk4j1M/8EC5GYREIpvZj8jwBpn7Qhodv7+4aBSbSk
	Ov9WL7+rAVz3/96hhhlwg5sxweWkFuMSFkvpP8EcM32ZiKSa+7YYA/mJJXDuYjB9S+DvDlDn7FkX6
	kIyg1Y+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDvDP-0000000Gw2G-2zVx;
	Wed, 29 Oct 2025 01:43:07 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDvDL-0000000Gw0X-48lb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 01:43:06 +0000
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-03 (Coremail) with SMTP id rQCowAAXnWEgcQFpeS8SBQ--.2182S2;
	Wed, 29 Oct 2025 09:42:57 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: antonio.borneo@foss.st.com,
	linus.walleij@linaro.org
Cc: mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] pinctrl: stm32: fix hwspinlock resource leak in probe function
Date: Wed, 29 Oct 2025 09:42:52 +0800
Message-ID: <20251029014252.178-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAAXnWEgcQFpeS8SBQ--.2182S2
X-Coremail-Antispam: 1UD129KBjvJXoWruF4fAry8Kry7Kr17GrWrGrg_yoW8JrWkpF
	s3JF1YyFsxXw4avayUt348WFyYga97G3y2g3y8t347Zr4FvFWqqF1rKFyDZr4qgF4xJ3sx
	Jr1UGry5ZFy0yFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AK
	xVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j
	6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUd-B
	_UUUUU=
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgoKA2kBDmHzgQAAsw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_184304_410261_C04FD36D 
X-CRM114-Status: GOOD (  11.25  )
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

In stm32_pctl_probe(), hwspin_lock_request_specific() is called to
request a hwspinlock, but the acquired lock is not freed on multiple
error paths after this call. This causes resource leakage when the
function fails to initialize properly.

Use devm_hwspin_lock_request_specific() instead of
hwspin_lock_request_specific() to automatically manage the hwspinlock
resource lifecycle.

Fixes: 97cfb6cd34f2 ("pinctrl: stm32: protect configuration registers with a hwspinlock")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 823c8fe758e2..d9a2d20a7e6b 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -1671,7 +1671,7 @@ int stm32_pctl_probe(struct platform_device *pdev)
 		if (hwlock_id == -EPROBE_DEFER)
 			return hwlock_id;
 	} else {
-		pctl->hwlock = hwspin_lock_request_specific(hwlock_id);
+		pctl->hwlock = devm_hwspin_lock_request_specific(dev, hwlock_id);
 	}
 
 	spin_lock_init(&pctl->irqmux_lock);
-- 
2.50.1.windows.1


