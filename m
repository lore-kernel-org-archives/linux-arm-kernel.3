Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4381C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 10:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hUg3LnMKjV9MVE0n08fRIjqBr7ECB//Eerd8cLFE4fg=; b=OJ5LKuiw+4dwOuoBcrO0V+3IDV
	Rw4/sdUHBGGRpYwc2+sYr5sMVPlvJ4Qvf5UiIxWjnKg67LiGuQ//lyb+N7N10iu9ueeSYEzFYhsP8
	DjdB21/Uv68yjDuk9omNlZH8SdTqoXV889fMPzD4MuqWW6wlSKvY96dMDR+pyLYtqpln3ilqK/2UA
	UjBAZjsygZKIh4AWJY9VSj+inEf0ACErz+InsRSS1w6enitcizhJg84hIpy8/I618s1IGPm9G/7Nh
	h7v1EZF2qBlTE22jwl9Zcvu0QWzq3jjHMJJe4fI/qSLWn+mXEDJpjWopNyNuRCJEhofe8tY8cmsQE
	H0/IFFtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0cia-00000007eFN-30fh;
	Sun, 30 Aug 2026 10:24:52 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0ciX-00000007eF0-1v5d
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 10:24:50 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4hXpCG6pNlz8v1Y;
	Sun, 30 Aug 2026 12:24:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788085482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hUg3LnMKjV9MVE0n08fRIjqBr7ECB//Eerd8cLFE4fg=;
	b=xJWjiFX3MDMvqVROFKNrk7mkZgZsK6kOo1AgkAeTvkjLV1uBgfEwbLIhbUGM3CG8FKKoWH
	2IM/VGqJ0jm4xvGnl7UDA8NgEPKkvf7zrRjO5YXE6tT255ixz4rXSrFEt6XBgyFUrMvTVV
	bZQG05k0jt7GExNpZt76yGLGxCzjzcyUGTqiyVNqcXjCtPmIZTusIjR+i4AMKr23Zs1HBd
	CtcgUXprBzLQ3xPEeSIWdhhKah0gs897b8nCBuegIsC/VTvAiDYn0VE0pA3uzeHN7KWqGZ
	tlwga5nri3/5vqFHFTe2JjmNo4SxD1D2xFOraybRdexIHUvrYiXbGSXvg/s7og==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=xJNuYAFX;
	spf=pass (outgoing_mbo_mout: domain of manuelebnerli@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=manuelebnerli@mailbox.org
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788085481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hUg3LnMKjV9MVE0n08fRIjqBr7ECB//Eerd8cLFE4fg=;
	b=xJNuYAFXEVdbkpwFYuvr22tl1ozi5iicKwEomIUH6TPHkkArizub3FiJZl0KIAxxFC7qta
	2zY2yIH6u8+X5nShRPFQ1fDvgqcU8vmGpUaGpvMsNYJCZIQCcofd2e/JvvgqaLhv2CMKrV
	8mtnfqoHUDh3KbGG0+/C6CliIACOaIG91HLNBATxWobkxmZ5Q+6NAvvrv9udx6iEHWY//Y
	2PLGrJk9tERSsq28shulSVaoMxAfbZ5DQnZxugIluN+53o5meM0SmtOO0UR0Oy24eXLhRE
	taP0U0ZUFTf7Eo92gzkctj4rvmmcVOnqNHwf6/nnSK8tDy+QDGQZnqLbP5d23A==
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Cheng-Yang Chou <yphbchou0911@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	Kees Cook <kees@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: arm64/aes-neonbs: transition to kmalloc_obj()
Date: Sun, 30 Aug 2026 12:17:14 +0200
Message-ID: <20260830101714.625728-3-manuelebnerli@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ipfna54i738khrgexqrc7bq9u1f7nd7i
X-MBO-RS-ID: 592fd02ed3e8ea0018b
X-Rspamd-Queue-Id: 4hXpCG6pNlz8v1Y
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_032449_645624_3A1ECE04 
X-CRM114-Status: GOOD (  10.46  )
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

Convert to type aware allocation as suggested in commit 2932ba8d9c99
("slab: Introduce kmalloc_obj() and family")

CC: Kees Cook <kees@kernel.org>
Fixes: 652a3017c485 ("crypto: arm64/aes-neonbs - Move key expansion off the stack")
Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
I have a couple similar patches lined up but they could be automated or maybe
the script is already made by Kees.
Kees can you make a script assisted commit (again)?
---
 arch/arm64/crypto/aes-neonbs-glue.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/crypto/aes-neonbs-glue.c b/arch/arm64/crypto/aes-neonbs-glue.c
index 5bcbac979..7cb1aede9 100644
--- a/arch/arm64/crypto/aes-neonbs-glue.c
+++ b/arch/arm64/crypto/aes-neonbs-glue.c
@@ -66,7 +66,7 @@ static int aesbs_setkey(struct crypto_skcipher *tfm, const u8 *in_key,
 	struct crypto_aes_ctx *rk;
 	int err;
 
-	rk = kmalloc(sizeof(*rk), GFP_KERNEL);
+	rk = kmalloc_obj(*rk);
 	if (!rk)
 		return -ENOMEM;
 
@@ -128,7 +128,7 @@ static int aesbs_cbc_ctr_setkey(struct crypto_skcipher *tfm, const u8 *in_key,
 	struct crypto_aes_ctx *rk;
 	int err;
 
-	rk = kmalloc(sizeof(*rk), GFP_KERNEL);
+	rk = kmalloc_obj(*rk);
 	if (!rk)
 		return -ENOMEM;
 
-- 
2.54.0


