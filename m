Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F6BC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 17:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Il8nAN1aEPjDnqjsyEAViz/RZCAHiRJ6twEAddhGQew=; b=VH8Ats0NI/JPV5skKdi9d3zyKO
	g9vKUNtTPP6WXx0O2gLANbD7BdszSWN5AN+wjVVwjfPvQVMxtVXOV6SfMZm2OWM7bFJ2rBM/hifc6
	T867R8yHvthhwaMdLVh0D4ujmDnVuewLduxuAm+I3Y7f4FHSeQI1NR8Yfnm7s2R0y3S4OPUBzai2G
	j3kcDrTgd/8kqjQG20pK7X311i1ruckKJtN2ETZO+kRt2oAG8QLMI08Pti3aepl0G/vDsIptbGYfH
	9R3kpbwp/nIRqaQMxR4hjVxW60TRtD/XvSWwbWjYhvWluW5x4Qh43A2w0JU2vH521PxfCJMrwcpqI
	Rsn8m3pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlsrd-00000008PcN-0Rle;
	Sat, 22 Feb 2025 17:00:29 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlsoi-00000008PFg-2h3V
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 16:57:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4B3B061127;
	Sat, 22 Feb 2025 16:57:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 91C38C4CEE9;
	Sat, 22 Feb 2025 16:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740243447;
	bh=WbAitZIglxWavPqRqVXLV21zKZHr6h1VYULp51wlyco=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=utTsuwllYtOc/9Tv29GaMqqQ0t8DxhuhkYgfOSM7sbvdMjsIp7wbEOYmaHGl03o3L
	 CVMUhnzg0+0sVaS2NDFvAH7/KaYB1xmhQsQPp2jZAUVKSKX4LGwZ122vAOU7YBMZyB
	 I/JokxYIRWlzKpFNvhwFlBwROMVkj0YefX98L0RN6OOHP9l4nkc5F7WLwmXouH2N+I
	 vESVhcXcL6D1StVXgzVey+SBWBtwmNu4suckBL2l4iOByd3icSzmQpQbRPlZuarEFX
	 D3lPukcQFSNPk9eTsMfy7AXpHlwN/hXL+/zMEryODNz6sWHeCkRG7Wxifo1/3xVr6G
	 eNVa5ykOF9zqg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86B0CC021B6;
	Sat, 22 Feb 2025 16:57:27 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Sat, 22 Feb 2025 16:56:49 +0000
Subject: [PATCH 4/4] soc: apple: rtkit: Cut syslog messages after the first
 '\0'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250222-apple-soc-misc-v1-4-1a3af494a48a@svenpeter.dev>
References: <20250222-apple-soc-misc-v1-0-1a3af494a48a@svenpeter.dev>
In-Reply-To: <20250222-apple-soc-misc-v1-0-1a3af494a48a@svenpeter.dev>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, 
 Sven Peter <sven@svenpeter.dev>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=992; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=XmS84SoHATsmW4yIuH/yX1sErrlBc4P71wmt3DfDGeo=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ/ouxi+/pm7Ov+GW8XbZ0X35fc+0Wo63t2ifWBm8oPy5x
 jLvS+p1HaUsDGIcDLJiiizb99ubPnn4RnDppkvvYeawMoEMYeDiFICJlE9iZFhQvnpuRLrzJF3+
 5Ieqeg3y7Jyb+Jd7Ha4yb1jQcCw2IIWRoaNu37tZWSsWV/06lORaflOEcalCfeqTvfdn1/md/LX
 /NxsA
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
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/soc/apple/rtkit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
index b7f4654c3341..595efce265ce 100644
--- a/drivers/soc/apple/rtkit.c
+++ b/drivers/soc/apple/rtkit.c
@@ -476,7 +476,7 @@ static void apple_rtkit_syslog_rx_log(struct apple_rtkit *rtk, u64 msg)
 
 	log_context[sizeof(log_context) - 1] = 0;
 
-	msglen = rtk->syslog_msg_size - 1;
+	msglen = strnlen(rtk->syslog_msg_buffer, rtk->syslog_msg_size - 1);
 	while (msglen > 0 &&
 		   should_crop_syslog_char(rtk->syslog_msg_buffer[msglen - 1]))
 		msglen--;

-- 
2.34.1



