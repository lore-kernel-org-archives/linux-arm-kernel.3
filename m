Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5488FFF885E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 15:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=68cWQlXwjgEl1dmYGzLjO4qteIR6dZpj4xoC1U4PHsU=; b=DqhzXfG0Jd09Qjf4+t4Gl8yzw4
	dACwQJl/QS8K0iSvNDdXu7X0B4gHMFjJKDVnhVgsUu0UIrfQvKmt2juErGG1N3aV02z+w+9Zig9Uv
	xYMy30iruecEDoS1VesJCiAZail5s7gfCv85g0m7X2ZzYlfyaA1SKkVaEsT9KkV/aO6OZs4jct8uS
	FTIGaZOH34dseosbEPDdhOevCGQFnTkidDMX3nGe3IX7HgJA1tyKyEbJmphY6da3H0Ph35VygcSW0
	xCudc1SsQFd4iEWHwiqnWMMH0bohzlMBwxklmv8rLfs3CYuwCEthT8zyOfDN2koNbxjuEhaGOmk2V
	i4ciNp5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH1k0-0000000FgEs-1XAO;
	Sun, 26 Apr 2026 15:49:52 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH1jw-0000000FgDO-3zgd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 15:49:50 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4830b67aa6bso13173185e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 08:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777218587; x=1777823387; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=68cWQlXwjgEl1dmYGzLjO4qteIR6dZpj4xoC1U4PHsU=;
        b=ZtY3Z3dzy1VQKrq4QLs0HlXO3HbqB3qMZ/04aFo1CCMekzZWTthKwOqZalXB4C+1Kb
         IW1/eIINfHiKTz1mQXmtQ0YXhuihyNvSdvQNL/UkMb/gnlwWDORNSYexlv5eZV4sV9FX
         NRo9RYw4kM6XhbHMcpM13OXGHJqzDa0CNrAQg2b8+GVTXPytad44Kc4I2KHPv1GviiEO
         w7J46/hiGqaoU1i5BtfYffcx0dxBWH99adLmJnJplNqhTsrxMQdocGWOHU+MFTdeeQVL
         wUYafQwzDKj3b0ZRbB2E9ZgFEtghwyfqA24d4ACs2l8gvriuKkKD0T6f2P4CY1CHScaI
         IQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777218587; x=1777823387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=68cWQlXwjgEl1dmYGzLjO4qteIR6dZpj4xoC1U4PHsU=;
        b=ILY3VvWGruJ8xrY0iEROTiGvu/7v5iDsOt64csbGlodoi5Su60Xfg6OjP6aKDUWX5s
         bak0K4S2giYMByodr1itcyhDn8QpUZvBZo7mccGROgHljnvvCh3NGhQGqGyJJLZn23Ay
         sgY9bf91puzDwhUaNhu7ydPji5aOqUuf5gvuEN54Ai4JUxaODdPRAwJZTG4MaLfq60eT
         Z34lvOVTXt5ABKQORXKsPlEK8BMTP2qLSbfj217YMKRSVObBodZtJvWOIZ5LIOLu/tbC
         85FJAUJq8cO+0+9MS+usp1mzlz2UQ15O01Pzf1gJZxsIyWMefAJA5M4PJBM64bHU3cZj
         AwQw==
X-Forwarded-Encrypted: i=1; AFNElJ+b4Nq0rfJ2soAXoN4apsjgpdfLmJAw9eqVLMOapdEMuq2G4B/4ZylGdN71/Gy9obnUZiON4Ti4fZLiZCq4w/7g@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm+0DfvGyB9JjJ6JezuvQo6X49+T7TiarIVdzzz59ym6k5DtzJ
	94uKnP2jKLYEB1A3JJwg0iOUDThpGEZ+xoZiLdj9kD8WNj/FKXIso1on
X-Gm-Gg: AeBDietZ7rkmvVNyeEAbk78upZHIdgMMmWWJAMInMOwG6gFwr2SGKrX4Bgh5JX+JBGP
	wm++PBZ7oJiWeD962EUKVgBdZBOcaA/+TGxF76IaXLP/aAMzcpNaKarOxIHCTEFfh/O/9CA3Nx0
	bzX/gEyB6CQT9dBWXSbQi4QQGh6ECm6dbZXSYwdJxVcQQiGJbrHSmJ27iVmIDyCTRlAxDbbG3kk
	iU+W9Dr5xRxRAsf5XXx5H9Zni5r2IbSn4KKu9cPsQbCxBAZNJ5duiw5OXfaJSwsgBjCYKogJd/R
	upQDd6LEQmIV4sAbdzi0J9WfJt4IYiDhNIEt+yeglcm2fPw+bVbnQ2sKi0HIg5BpnZucOVB0B9T
	Z1KIPbKg8plPhTWXRMnTwPKC4RONZBZstOYMnJm9KE2cZVgEw3G8IshNNWm7F4uqJodJs0w1XAI
	UcBZDVUDDKaylGvTRR5Zf+m4tu8UdsExNLFezi8++kd8kz2v+mTP/CXBhI7rbXyvVEISYOEWypj
	T683sDbpP+p
X-Received: by 2002:a05:6000:1361:b0:43d:627c:21ca with SMTP id ffacd0b85a97d-43fe3df01c5mr21025546f8f.3.1777218586806;
        Sun, 26 Apr 2026 08:49:46 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a341sm79799339f8f.24.2026.04.26.08.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 08:49:46 -0700 (PDT)
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
Subject: [PATCH v4 1/1] crypto: atmel-sha204a - fix non-blocking read logic
Date: Sun, 26 Apr 2026 15:49:40 +0000
Message-Id: <20260426154940.24375-2-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260426154940.24375-1-l.rubusch@gmail.com>
References: <20260426154940.24375-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_084949_003632_D3569E5D 
X-CRM114-Status: GOOD (  13.34  )
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

The blocking and non-blocking paths were failing to provide valid entropy
due to improper buffer management. Read the buffer starting from bit 1,
only fetch the 32 bytes of random data of the return message.

Tested on a Atmel SHA204a device.

Before (here for blocking) tests showed repeadetly reading reduced bytes of
entropy:
$ head -c 32 /dev/hwrng | hexdump -C
00000000  02 28 85 b3 47 40 f2 ee  00 00 00 00 00 00 00 00  |.(..G@..........|
00000010  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
00000020

After, the result will be similar to the following:
$ head -c 32 /dev/hwrng | hexdump -C
00000000  5a fc 3f 13 14 68 fe 06  68 0a bd 04 83 6e 09 69  |Z.?..h..h....n.i|
00000010  75 ff cf 87 10 84 3b c9  c1 df ae eb 45 53 4c c3  |u.....;.....ESL.|
00000020

Fixes: da001fb651b0 ("crypto: atmel-i2c - add support for SHA204A random number generator")
Suggested-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-sha204a.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
index dbb39ed0cea1..39a229086a84 100644
--- a/drivers/crypto/atmel-sha204a.c
+++ b/drivers/crypto/atmel-sha204a.c
@@ -48,8 +48,8 @@ static int atmel_sha204a_rng_read_nonblocking(struct hwrng *rng, void *data,
 
 	if (rng->priv) {
 		work_data = (struct atmel_i2c_work_data *)rng->priv;
-		max = min(sizeof(work_data->cmd.data), max);
-		memcpy(data, &work_data->cmd.data, max);
+		max = min(RANDOM_RSP_SIZE - CMD_OVERHEAD_SIZE, max);
+		memcpy(data, &work_data->cmd.data[1], max);
 		rng->priv = 0;
 	} else {
 		work_data = kmalloc_obj(*work_data, GFP_ATOMIC);
@@ -87,8 +87,8 @@ static int atmel_sha204a_rng_read(struct hwrng *rng, void *data, size_t max,
 	if (ret)
 		return ret;
 
-	max = min(sizeof(cmd.data), max);
-	memcpy(data, cmd.data, max);
+	max = min(RANDOM_RSP_SIZE - CMD_OVERHEAD_SIZE, max);
+	memcpy(data, &cmd.data[1], max);
 
 	return max;
 }
-- 
2.39.5


