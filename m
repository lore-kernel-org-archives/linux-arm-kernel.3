Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55CED65C7E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Nov 2024 11:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mvRYbzWmy3Az0rIC9boe0S3YngFvnXy/0X+eihz5OIs=; b=dICr0c8wItbyImJDwVCPcSp3o3
	Twc7U9xGi1SYQr2tkDYqaUrvmbfH3SujQu8Mmf+Bd/vn9k4POaoFI/3BMJjAcE2IpFwjkX3VzsFP/
	/6rbeCdKWxzuDRDEQgp5t5hVVFmP6JIQmPXfRIW47ocTXdQ2kkFzV0FjGq1r6nCl6mlAxpHRLj0rG
	kpaWey+lE+jGb7Xbi02m7fcZ1bCIZTIMbaERjL5j0MC/LkxHIOmFfZB2DkmLUqAw4ZL7jhk4X9tcv
	julRJxEqeuKSMZ06YP1R7/S4QUC5Ggsj5X+OvWahWKtsa5h+P9b0bj1KnjJyxDLmNBGha1Vp7ux+f
	i3liPMHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCdjn-00000007FnW-3ar4;
	Sun, 17 Nov 2024 11:46:43 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCdir-00000007Fj4-1x0c;
	Sun, 17 Nov 2024 11:45:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 15E22A40D50;
	Sun, 17 Nov 2024 11:43:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FD8FC4CED8;
	Sun, 17 Nov 2024 11:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731843943;
	bh=WaUpZJgl59YzipJ0kAPa5ZUnQ2h5lltdWBavhDkQf0M=;
	h=From:To:Cc:Subject:Date:From;
	b=eGUEgnSVL17XsKDEl+xI+13lYs6hsEHSWhiTNo9PwYvPuuuII/oTVCsODqD2h82Vy
	 stqkD9tA+NibANaR0xiIO40MYVJJntPO9nJycF2HhgVzjp2qFhCf66bQ11h3I6CDIE
	 4mT4PIQ8/aR74+2/pP4xiR674pcGWEoVnx1RyKyucAVDZ0NPCo/u2q9nESfOVPnStv
	 KA3KIyEAc908v4q1nWIYnhjTGG6//y1gEuzjXJJPk+NI+eeI44gyoVuGN9ElNv/IXc
	 hCOFH4CsnVKRhg441fDQyWLn4wcQtcU6gtLmWMna7NKGii/1MSixpqS/fQash9tRAB
	 afPTnVMN371wg==
From: Kees Cook <kees@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] pinctrl: airoha: Use unsigned long for bit search
Date: Sun, 17 Nov 2024 03:45:38 -0800
Message-Id: <20241117114534.work.292-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2769; i=kees@kernel.org; h=from:subject:message-id; bh=WaUpZJgl59YzipJ0kAPa5ZUnQ2h5lltdWBavhDkQf0M=; b=owGbwMvMwCVmps19z/KJym7G02pJDOmW15OY+ArTEmyFrWfl7Re2OJn69UpMy3EDQ1cXuRt13 1MnzHrWUcrCIMbFICumyBJk5x7n4vG2Pdx9riLMHFYmkCEMXJwCMBHpI4wM3yJmvOF8+Y0h59rR 30xq5pGlQnqPBbZ8Leuqvnynb4FyGsM/mwsHM21iXz3xTfm8uUg6+Feka63IqT1HHFTnzA5c6b+ UGQA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_034545_635352_C7A13E36 
X-CRM114-Status: GOOD (  11.51  )
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

Instead of risking alignment problems and causing (false positive) array
bound warnings when casting a u32 to (64-bit) unsigned long, just use a
native unsigned long for doing bit searches. Avoids warning with GCC 15's
-Warray-bounds -fdiagnostics-details:

In file included from ../include/linux/bitmap.h:11,
                 from ../include/linux/cpumask.h:12,
                 from ../arch/x86/include/asm/paravirt.h:21,
                 from ../arch/x86/include/asm/irqflags.h:80,
                 from ../include/linux/irqflags.h:18,
                 from ../include/linux/spinlock.h:59,
                 from ../include/linux/irq.h:14,
                 from ../include/linux/irqchip/chained_irq.h:10,
                 from ../include/linux/gpio/driver.h:8,
                 from ../drivers/pinctrl/mediatek/pinctrl-airoha.c:11:
In function 'find_next_bit',
    inlined from 'airoha_irq_handler' at ../drivers/pinctrl/mediatek/pinctrl-airoha.c:2394:3:
../include/linux/find.h:65:23: error: array subscript 'long unsigned int[0]' is partly outside array bounds of 'u32[1]' {aka 'unsigned int[1]'} [-Werror=array-bounds=]
   65 |                 val = *addr & GENMASK(size - 1, offset);
      |                       ^~~~~
../drivers/pinctrl/mediatek/pinctrl-airoha.c: In function 'airoha_irq_handler':
../drivers/pinctrl/mediatek/pinctrl-airoha.c:2387:21: note: object 'status' of size 4
 2387 |                 u32 status;
      |                     ^~~~~~

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Sean Wang <sean.wang@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-mediatek@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 7692e6d9b871..547a798b71c8 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -2384,15 +2384,16 @@ static irqreturn_t airoha_irq_handler(int irq, void *data)
 
 	for (i = 0; i < ARRAY_SIZE(irq_status_regs); i++) {
 		struct gpio_irq_chip *girq = &pinctrl->gpiochip.chip.irq;
-		u32 status;
+		u32 regmap;
+		unsigned long status;
 		int irq;
 
 		if (regmap_read(pinctrl->regmap, pinctrl->gpiochip.status[i],
-				&status))
+				&regmap))
 			continue;
 
-		for_each_set_bit(irq, (unsigned long *)&status,
-				 AIROHA_PIN_BANK_SIZE) {
+		status = regmap;
+		for_each_set_bit(irq, &status, AIROHA_PIN_BANK_SIZE) {
 			u32 offset = irq + i * AIROHA_PIN_BANK_SIZE;
 
 			generic_handle_irq(irq_find_mapping(girq->domain,
-- 
2.34.1


