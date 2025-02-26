Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E54C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 19:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VzAqOZsGB06Od+tZizvR/NiVyp5CJBZl2Wknj7QZr1Y=; b=dh6IrxwuqKIauNxt0hhxYjQ0HX
	aXHFI992A7WV7b95FHFUJ2jrE4LtkjoWVLDnIgcSH1PEySZ/ECIbOD8WnEvf6tH8DvF5eZ5K65CZY
	mVTRQ5EkS/JFodqZ2WL7uGCkHsM/VSzTAMWIEtHooraJ1MyINAsslxgBxq5xFJUAE/PQVTM150D3V
	tLT4EJ5BfDyedEREVVglIzIulGL57M6y744/UhT51+cFQLZ0VNiQKaHWY8ciFN8xTzSxbSCczvj9a
	QvvVQcab1jHCsGaBLbtSfNZpxWV/eZOF3ImxbPNM490c6a2IOW84O1PbqiaL32U5tbYkGkXfnQYer
	kD2tp0QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnMlP-0000000565A-2NYd;
	Wed, 26 Feb 2025 19:08:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnMdl-000000054cD-3hpk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 19:00:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 52F8A6152A;
	Wed, 26 Feb 2025 19:00:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DAA9BC4CEEA;
	Wed, 26 Feb 2025 19:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740596416;
	bh=+42kuksOlhzcBQPYk3PSr8n66m0DZ2Ays+BbNMN38cY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=U0Xm6pVmkP2OlUb3J4Cv/yIEuucen0nc8VsYSW5vwJonhMr68Uiwqjo7mB+7ZHvQ9
	 JrI8zTh8Spu3oNow/c9bIlP51XGoUHzmFv8d47gjq0+QR0U2tf90GmZOP7qFRFA5ch
	 L7bPUaCYHr/6V5NV/pyMcP3cauMbIzwvzsaMOkBjlEqui0/pMHdd1A5QaUF83tgg9C
	 iXGIW+fqc9ifLkGpHQ12yKobijT/oAxatH4sB9gEvJuuSgmKRKendZN6kB5JTKLIwo
	 xo4WVnoNRKl64Uk85ALl9wWkoPjFW9HoeV+oPybyUyCEtLlV1ZOAxGkHD5a+rtQfla
	 77CH70JYioL+g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D329BC021B8;
	Wed, 26 Feb 2025 19:00:16 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Wed, 26 Feb 2025 19:00:06 +0000
Subject: [PATCH v2 4/4] soc: apple: rtkit: Cut syslog messages after the
 first '\0'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-apple-soc-misc-v2-4-c3ec37f9021b@svenpeter.dev>
References: <20250226-apple-soc-misc-v2-0-c3ec37f9021b@svenpeter.dev>
In-Reply-To: <20250226-apple-soc-misc-v2-0-c3ec37f9021b@svenpeter.dev>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, 
 Sven Peter <sven@svenpeter.dev>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1047; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=J8uNhQd4K8sLsyiwKJwYYfLSFRN53J4ELGphw4z4HHQ=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ/r+lH1uAVs+eKaVxVdt0rz+94SbXkKDzbIZyQ1mUcv+a
 JxaF+DVUcrCIMbBICumyLJ9v73pk4dvBJduuvQeZg4rE8gQBi5OAZiIcR7D//TfGe0xl/Wt21bf
 Zdi9Lv2qgW5tVm7mim5lq2Lvki4PTkaG6W3nfsh4rJnOdmP2FS2WiU2Ha5LXhUpPLNM+Ntuoy1O
 FGwA=
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
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
Reply-To: sven@svenpeter.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Janne Grunau <j@jannau.net>

Certain messages from DCP contain NUL bytes in the random data after the
NUL terminated syslog message. Since the syslog message ends with '\n'
this results in a dev_info() message terminated with two newlines and an
empty printed line in the kernel log.

Signed-off-by: Janne Grunau <j@jannau.net>
Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/soc/apple/rtkit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
index 4b78463dd5a1..5fffd0f003dc 100644
--- a/drivers/soc/apple/rtkit.c
+++ b/drivers/soc/apple/rtkit.c
@@ -477,7 +477,7 @@ static void apple_rtkit_syslog_rx_log(struct apple_rtkit *rtk, u64 msg)
 
 	log_context[sizeof(log_context) - 1] = 0;
 
-	msglen = rtk->syslog_msg_size - 1;
+	msglen = strnlen(rtk->syslog_msg_buffer, rtk->syslog_msg_size - 1);
 	while (msglen > 0 &&
 		   should_crop_syslog_char(rtk->syslog_msg_buffer[msglen - 1]))
 		msglen--;

-- 
2.34.1



