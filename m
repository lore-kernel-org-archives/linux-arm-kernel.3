Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C547C54754
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 06:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h1KqyEKcxC+CUI0aMo46riRGlJZ3V1OQMjQmARi8QTo=; b=nnbwSO7GBV6Q7ysaT7AGuG19BE
	InIyfzVi7eRYBuIyT2kBauc4oUX3p7QEfCVtWPfARVIn23UBzoimDVL+SpIkcCjF/CXG8Ijf3ZQr6
	B7ba4rPf2DB9AmWHCVPwci1n6cL9CijLBzEfXfsCbSi9iAQAvshFqPI/9rneLHimMDhD3w8zxNXMq
	klCeOlzDJ0kHYKFt1ReLEaMYpdOhUl2YSj3iuVoWLQ0KbqLh1rmmyV+2JegRHKEE43tggeSY6/aE4
	LJZLqpj+oTTdJV+kdMjqR40mHwujQYcKREEwbAxdj16XRua7Jt1ZV2yf4/h0tinJSEEi4tlcHjVL3
	k97pVvyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFS4v-0000000H9OH-2VvW;
	Thu, 15 May 2025 06:28:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFRyy-0000000H8Pv-1Wgp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 06:22:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DBA8E4A5C6;
	Thu, 15 May 2025 06:22:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 613F9C4CEF7;
	Thu, 15 May 2025 06:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747290134;
	bh=ZTlgG1xJ95iorV2kQ1uOOiZAmYCxNo5uxDZJjiFp5/Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JmoyNGrqnlSDGeTlhHgVhPuktusa7m6uD/BoDhrcyr7mIYKime4rv8Hdkh5DvjGjx
	 e7oAI0GAzGZDP5RTwN93AGBWp1h5BGIKzvrF2B9hn9nttLktLNN185t9tT1mTbevDC
	 6e3IjDVSEKf4e76yQ2FnKkp8C1cfkTeqK1TPrG0a0ZvIXklnL2z3vKuHc6BccpofND
	 KuDbqDuuQ3TN+vKqwNcUvhr4c6gCMYufyriUor+imsAeopVX3FTbSE57bOt9CsD2g0
	 nz5x+jDefPnGtVe8ws5QL6ALyfqT0tKEC4yX0wG2wn9KdMyN+JSjIxxwfX88mNKpHC
	 MxQPTdu+8ROPw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 566A1C2D0CD;
	Thu, 15 May 2025 06:22:14 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Thu, 15 May 2025 06:21:16 +0000
Subject: [PATCH v6 04/10] soc: apple: rtkit: Make shmem_destroy optional
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-smc-6-15-v6-4-c47b1ef4b0ae@svenpeter.dev>
References: <20250515-smc-6-15-v6-0-c47b1ef4b0ae@svenpeter.dev>
In-Reply-To: <20250515-smc-6-15-v6-0-c47b1ef4b0ae@svenpeter.dev>
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Hector Martin <marcan@marcan.st>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
 Lee Jones <lee@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=988; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=S6xAk2UkoAe3X4x66QooB7Xtvm6Gxfc3lvmrWufTKGQ=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4ZqBzdbfebvoIBftdcDeuLMnZ+uOBbEde78ixC3H6bOi
 WnJGk86SlkYxDgYZMUUWbbvtzd98vCN4NJNl97DzGFlAhnCwMUpABOxc2f4Hx/qcdw1LdnXgJlj
 RUuFaUmsTWDJ5ILZ81jdJhq516knMDKcca8pPqfWd9evsypv8RmPpF6jWZkzAya53OThCeYP/8w
 OAA==
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_232216_424876_E3E4956F 
X-CRM114-Status: GOOD (  10.32  )
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

From: Sven Peter <sven@svenpeter.dev>

shmem_destroy isn't always required for coprocessor-managed buffers but we
still enforce that it exists. Just relax the check.

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/soc/apple/rtkit.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
index 5fffd0f003dc2f4f377faf96cce0c1ce4ff0b788..b8d4da147d23f7e99e76eea314e4d976cddbd1c6 100644
--- a/drivers/soc/apple/rtkit.c
+++ b/drivers/soc/apple/rtkit.c
@@ -279,8 +279,7 @@ static int apple_rtkit_common_rx_get_buffer(struct apple_rtkit *rtk,
 	dev_dbg(rtk->dev, "RTKit: buffer request for 0x%zx bytes at %pad\n",
 		buffer->size, &buffer->iova);
 
-	if (buffer->iova &&
-	    (!rtk->ops->shmem_setup || !rtk->ops->shmem_destroy)) {
+	if (buffer->iova && !rtk->ops->shmem_setup) {
 		err = -EINVAL;
 		goto error;
 	}

-- 
2.34.1



