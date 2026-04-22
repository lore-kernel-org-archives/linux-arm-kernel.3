Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D39FA1FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 21:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oFbIAxTdzhK2l/tqKW0C6io62S5s+Mdv160kLRimrJs=; b=JevUscHPSAmrYwduPmZZ1wcJiz
	261YXQbKyBh37QWBwb/NDzB3T3AMmHaWTjNA26IEuoXHNZi9ojWJ+W4F59DubjlYRFs4Vt9u+BjMz
	S+5PPwQeBIy4AHEHsQdAHSiaxGPSNyDQJsGTMGo/cJPOZniuzkMli8s5WQ7fXEWCeKD0/wByzxzS7
	RDP6xmvkYW5bj7dxGtAk/GUXtrCqyY9vpBj80L222Ntd2lB95iGWvsgPJYDXoBqQRVGy62Pcs9jeD
	9qaRjNdFGF/uYJOxSX6Z8T0jfbVAI35UkGutqN9LDu5/BMqXk2w53GTekjkDrZmsz2HA7d5J78fdg
	EEk/aS0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFepb-0000000AkKZ-0P8r;
	Wed, 22 Apr 2026 21:09:59 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFepU-0000000AkHh-23bd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 21:09:53 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-48371104ffdso7068205e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 14:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776892190; x=1777496990; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oFbIAxTdzhK2l/tqKW0C6io62S5s+Mdv160kLRimrJs=;
        b=WqEIkP5TaKVTc5xmItKRz1lIsAiBjUmH48IyAEX1VYzDmprvlFnERGedP39eh0blT+
         NfRCnnz6Zlfs8rmEmN1TPcqRERkwlGqOeIcDwuOs8d5mNn1cbl2yjVvYARPhXrPxyXUT
         N8Fgoomg+rAEWcG2LkAmDV+Dq/O2w3KPnnvX5KjKibsJjMhfDNEnkCT4AmIE2HMXiurF
         LtBtbKwopVthUcYmLTD+Jy9II1VHPbAHU5vqIysenFGXiDUbdrmhEnQxPvhH1UdGidwd
         8A6w40COIo243h+JRkNRABz4N2346DLT0KVidRze/SQizm06iur1kbhrSyODPoJZDggb
         72/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776892190; x=1777496990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oFbIAxTdzhK2l/tqKW0C6io62S5s+Mdv160kLRimrJs=;
        b=lLzZCVIMwZysr14fIGvm9j+r/HWzVCFQs+OhOzsN1dtubuGasANwiH15psYXcp4cVv
         cFx/l40pjUDscxSINPPU2p3tg18rR0LPRx8gBkR5opBeGbPsw/jp9mMhk/1qaZuPpw4C
         GilDqJBnuBtaJN1TKCYy67iT44RW9rl14MpNhV68aWZJgdCJakbJP+vStUCbq3YKd9xA
         L8F1yNwEH8ehjfoCYSvC06ND22SRDEYtPdfaTM7tLVR0fpxi9VbNhPVQb0ZVRnATei/A
         VDdGESKV92t2SrcaGKZG5hY761XmdMAISb5qc+GRuiOZiY/Iz3sE4ef5kGL460o1YuAV
         HTug==
X-Forwarded-Encrypted: i=1; AFNElJ8RGYpvA/juRLVcF/x67tpEure9Ip6Xp5iiTQzO1zHdRGtA4NM715OLf6goBmjajqc+xFmXJHmolDjRxAgKnOgR@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7gjchoBEQK1BJ95W7JPBxPZCwsrHoAqU07F4inDmXycC47ToQ
	j/cDDBiTt6fhWbyS5dzqW64ROBAYyhdXnCCGtV0wYhEgvIX2+6h7jXdh
X-Gm-Gg: AeBDietDktgT1514K3yIjJgUbAaBzsBkzroIk2OQvZItj1oglKztrBd00S4VH8+lplk
	el6v8NBo51eoWD/WRzIu694L/WrlrXT6qsWoS6NToijgHlZfI+9N29rZ9KvRx0O81P951pU7EKv
	GfBQfGDW0aUJ5KWLsXdkwkg0AwF+6GPsGpDRRCv3bR0cB2yMzl1Z2Ms7AhX46mrm/u/pO9gpUzS
	Xa8ssKsmtvmkros8MdRTnVtrtE7H0JgiDAiVSO+Fa4BeurAaOP97vVo0kXOdXZUkbrDztgexS6/
	6KZw2CBB5txcuyiC6h2NoA/tQUDQZslNvoXkTow03xEEC0YhvONrkU8cbx8RjtX6+EgJKBHz1HJ
	Ewj4cVwwbNclDuE9Fo/V2pPejqs8YP/qSibw6lZNmzBOYga/5An3qmMaEJiM01Ptnq6GnFc6+G6
	TD1uKgzQT1IrhT/T9t6Hemtl8KU/9RXPub0ChH5V1M8wx4eAb4Q/b1IvtHpt5pInF5gI4//6zat
	A7W0HBdlEBs
X-Received: by 2002:a05:600c:314c:b0:48a:5664:f44a with SMTP id 5b1f17b1804b1-48a56650076mr69908225e9.2.1776892190398;
        Wed, 22 Apr 2026 14:09:50 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a4b329542sm352469085e9.3.2026.04.22.14.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 14:09:49 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: herbert@gondor.apana.org.au,
	thorsten.blum@linux.dev,
	davem@davemloft.net,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	ardb@kernel.org,
	linusw@kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	l.rubusch@gmail.com
Subject: [PATCH v3 2/3] crypto: atmel-sha204a - fix truncated 32-byte blocking read
Date: Wed, 22 Apr 2026 21:09:35 +0000
Message-Id: <20260422210936.20095-3-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260422210936.20095-1-l.rubusch@gmail.com>
References: <20260422210936.20095-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_140952_564411_8C0382C0 
X-CRM114-Status: GOOD (  14.95  )
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

The ATSHA204A returns a 35-byte packet consisting of a 1-byte count,
32 bytes of entropy, and a 2-byte CRC. The current blocking read
implementation was incorrectly copying data starting from the
count byte, leading to offset data and truncated entropy.

Additionally, the chip requires significant execution time to
generate random numbers, going by the datasheet. Reading the I2C bus
too early results in the chip NACK-ing or returning a partial buffer
followed by zeros.

Verification:
Tests before showed repeadetly reading only 8 bytes of entropy:
$ head -c 32 /dev/hwrng | hexdump -C
00000000  02 28 85 b3 47 40 f2 ee  00 00 00 00 00 00 00 00  |.(..G@..........|
00000010  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
00000020

After this patch applied, the result will be as follows:
$ head -c 32 /dev/hwrng | hexdump -C
00000000  5a fc 3f 13 14 68 fe 06  68 0a bd 04 83 6e 09 69  |Z.?..h..h....n.i|
00000010  75 ff cf 87 10 84 3b c9  c1 df ae eb 45 53 4c c3  |u.....;.....ESL.|
00000020

Fix these issues by:
Increase cmd.msecs to 30ms to provide sufficient execution time. Then
set cmd.rxsize to RANDOM_RSP_SIZE (35 bytes) to capture the entire
hardware response. Eventually, correct the memcpy() offset to index 1 of
the data buffer to skip the count byte and retrieve exactly 32 bytes of
entropy.

Fixes: da001fb651b0 ("crypto: atmel-i2c - add support for SHA204A random number generator")
Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-sha204a.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
index 19720bdd446d..f7dc00d0f4cd 100644
--- a/drivers/crypto/atmel-sha204a.c
+++ b/drivers/crypto/atmel-sha204a.c
@@ -19,6 +19,9 @@
 #include <linux/workqueue.h>
 #include "atmel-i2c.h"
 
+#define ATMEL_RNG_BLOCK_SIZE 32
+#define ATMEL_RNG_EXEC_TIME 30
+
 static void atmel_sha204a_rng_done(struct atmel_i2c_work_data *work_data,
 				   void *areq, int status)
 {
@@ -91,13 +94,15 @@ static int atmel_sha204a_rng_read(struct hwrng *rng, void *data, size_t max,
 	i2c_priv = container_of(rng, struct atmel_i2c_client_priv, hwrng);
 
 	atmel_i2c_init_random_cmd(&cmd);
+	cmd.msecs = ATMEL_RNG_EXEC_TIME;
+	cmd.rxsize = RANDOM_RSP_SIZE;
 
 	ret = atmel_i2c_send_receive(i2c_priv->client, &cmd);
 	if (ret)
 		return ret;
 
-	max = min(sizeof(cmd.data), max);
-	memcpy(data, cmd.data, max);
+	max = min_t(size_t, ATMEL_RNG_BLOCK_SIZE, max);
+	memcpy(data, &cmd.data[1], max);
 
 	return max;
 }
-- 
2.53.0


