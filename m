Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E785EE57F7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 09:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hS6XZTtAqHnnW+f1AAVumjb0R3JxUAZPLUP82F/FDSE=; b=cUwpt2+pE/CmtQwPg/aBBE3YYs
	WrGlrHy4icdzde0aPKdxYqImPDMp3XKJtj4zyfiWvd90uQLAea+fMQNbNw+k4M/ox4Ck+4okeA4Oy
	YOj4K6kowflcwkd2P9owCiRoRmIf3Z9rKmUD824BLyFvI5kkS84T6J5e03RpJhqVU3nL8b7BtUsCQ
	c/H0gL3Z95NW/5pgdqk1i7XisfLgeQkNLDf3AXzK9w91Z1k84qUc5i+2ZfZzD6/7g8QzQDEImV9gK
	RL7oxUQvaP4uLsZ5OvpbT1Jozi3xCZIftLCNhcdHGNu91QNzsTqGAE6q7kOmqsKUFhUrOWismusfQ
	l7wZWsrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vasis-00000005q0m-1os3;
	Wed, 31 Dec 2025 09:42:30 +0000
Received: from fhigh-b8-smtp.messagingengine.com ([202.12.124.159])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vasip-00000005q0T-2feu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 09:42:29 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id CB0807A010C;
	Wed, 31 Dec 2025 04:42:23 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 31 Dec 2025 04:42:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1767174143; x=1767260543; bh=hS
	6XZTtAqHnnW+f1AAVumjb0R3JxUAZPLUP82F/FDSE=; b=MLgsVcf8hl1RFoBH9J
	Mnoa9A7Frol7Yuopv2Zmd6Y+RnjfAASz8BrrVbvaRaRfS0sZGcHQCNBwpCBZO72i
	Y9q/w1KUc+qWpbHv3jkTLlNSRhCzhyuRa7JRPLwk9X85JVHCdYRHJ2xDVKPB07yz
	bgoSmtYuUFoZUDjlC+t4ior8/twz4UXzSI6qKbvtf3ASIFQq5A3t7gpgv5uaLhaA
	1zhaB6cXXGd1Lgis6P9BCtDoaVvGuS6hgR9gM9JZBBG9E+NO7/u+/1hjImwEhui7
	7aXaS/3fp7WhXdyI9TgZZPn3CriVvoMoxUEJIaYQAkdWA9RenQtlJ1Hknnwe4CJ6
	0Hxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1767174143; x=1767260543; bh=hS6XZTtAqHnnW+f1AAVumjb0R3Jx
	UAZPLUP82F/FDSE=; b=zTD6P0KXMWm8MksJkqFWViwQbVeLN7xOf5vzohBLyH8e
	HgXseWuBlF/EPwgyY7+9v1M3ZuuicMCEOANT+Di18c2yNwon/AWF/kL9Gal3UYad
	CN7oOA3VjEWt+pH2AzSJo3t9G4TI13oSYTzXh4w/7XFrkQ+jGC3E1FcQ9PsMA4vX
	/oQ2l+YpyvqLso9wLJFQoZIr4S6NCvrPosyD6IC862iHGhhjsJ679Gs5Httxa2TI
	ycvpyibiFTGeejBaRy8FFst12hdJ2jxvYfw6PElfstUl/YUP8sRcndT12xjSTNAM
	QD0EBXYw0zySnLne+XPZjEykAOfhyvq8Ciq/GgVnmg==
X-ME-Sender: <xms:_-9UaQN8Ui9W-bVUdfMBhs-JSMHfjZXX0BfJqsrHHqz7JfpaABE_IA>
    <xme:_-9UaZhfAWF1U2JALUoZ2pXRYc8wyIilU5Umc1QiQz07ofyA9injRxa8O5hdaU_KL
    UJ6Fy8NenmMMInia7nC4HJcn9W0OEsbX7uwMRUcpPPclt0onlK2xw>
X-ME-Received: <xmr:_-9Uaa4YtgC15-kLQLWiuKEwHRJNbr0Ob6SaMd3i4JLc70s0dO9d7kgBI2L9CHbBEbONPgXuin0TbSTZ6DCBMFxCoR_8-IDjRGitEQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdekvdehjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomheplfgrnhhnvgcuifhr
    uhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpeefheeltd
    ehfeetjeefvdehteeutddtteelgeduueetjeevteeifeeuvdefffdvieenucffohhmrghi
    nhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepjhesjhgrnhhnrghurdhnvghtpdhnsggprhgtphhtthhopeekpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlh
    eslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehnvggrlhesghho
    mhhprgdruggvvhdprhgtphhtthhopehjsehjrghnnhgruhdrnhgvthdprhgtphhtthhope
    hsthgrsghlvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhig
    qdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlvggvse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopegrshgrhhhisehlihhsthhsrdhlihhnuhig
    rdguvghvpdhrtghpthhtohepshhvvghnsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:_-9UaY2LqZmifgtncPRph7siEYH5HgDR5m875leypgLKIsoAlbZ3PA>
    <xmx:_-9UadtIDS5WzDV--0QiwS0S69248s0B0igaklc_HEGC9sjkjbLlmA>
    <xmx:_-9UaW59orB_iAPMtfWG-5qTF4-kLtukCX8vKbQjPgoAPGS6_wYIFw>
    <xmx:_-9UaRc4TwCfDZL9KJyYxNe7cRNXq1Z4gfXPTKQKgcpotlecHxRsBg>
    <xmx:_-9UaePBSgTnhK5OVDJpjSyQhH-c07gXY4nWWc1Ks4oJ5sadIwaAvRpo>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 31 Dec 2025 04:42:22 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Wed, 31 Dec 2025 10:42:12 +0100
Subject: [PATCH v2] mfd: macsmc: Initialize mutex
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-macsmc-mutex_init-v2-1-5818c9dc9b29@jannau.net>
X-B4-Tracking: v=1; b=H4sIAPPvVGkC/32NQQ6CMBBFr0JmbQ2tLYgr72GIGcsgY0IxbSEY0
 rtbOYDL95L//gaBPFOAS7GBp4UDTy6DOhRgB3RPEtxlBlUqUzbKiBFtGK0Y50jrnR1HcS672j4
 Uou0R8u7tqed1b97azAOHOPnPfrHIn/1XW6SQQsuKGqq0rk/m+kLncD46itCmlL5blJHyswAAA
 A==
X-Change-ID: 20250925-macsmc-mutex_init-80d7cb2aacfa
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1305; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=xJzCPQmr76VNl5jCxm+Qduv0QwPM15gusEARXhaF7Do=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsyQ93+WP2h+Itt+OWydBMfzVeZX3+h8vvVm5UyVTK33n
 49ELeln6ihlYRDjYpAVU2RJ0n7ZwbC6RjGm9kEYzBxWJpAhDFycAjCRbltGhudFh+5kPZmxNr5e
 65HNZL21e75WtnHKyN2ae+swR7rpK2ZGhv2+0ec7ls3Tya0PuFo6TShHrzHB23uFlM0rPYU7slr
 GjAA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_014228_113041_2A042283 
X-CRM114-Status: UNSURE (   8.19  )
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

Initialize struct apple_smc's mutex in apple_smc_probe(). Using the
mutex uninitialized surprisingly resulted only in occasional NULL
pointer dereferences in apple_smc_read() calls from the probe()
functions of sub devices.

Fixes: e038d985c9823 ("mfd: Add Apple Silicon System Management Controller")
Cc: stable@vger.kernel.org
Signed-off-by: Janne Grunau <j@jannau.net>
---
Changes in v2:
- rewritten commit message
- added missing Cc: stable
- rebased onto v6.19-rc1
- Link to v1: https://lore.kernel.org/r/20250925-macsmc-mutex_init-v1-1-416e9e644735@jannau.net
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index e3893e255ce5e4bb4832d80ad1fc002d413a291a..3015e8d36d6e5bfdcea342c7d05a7b34788d7845 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -413,6 +413,7 @@ static int apple_smc_probe(struct platform_device *pdev)
 	if (!smc)
 		return -ENOMEM;
 
+	mutex_init(&smc->mutex);
 	smc->dev = &pdev->dev;
 	smc->sram_base = devm_platform_get_and_ioremap_resource(pdev, 1, &smc->sram);
 	if (IS_ERR(smc->sram_base))

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20250925-macsmc-mutex_init-80d7cb2aacfa

Best regards,
-- 
Janne Grunau <j@jannau.net>


