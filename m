Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C84C624C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 13:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CXazQErvLFJ2PhKGMzA7OzB+VrO5rrZMlu8+901gGLk=; b=dmwyJGL/Rvlm9q30+/ijLndkFA
	R6SVDN27ZFRbofCvzsaJYPtAYj02u9C4HhpvLKGlZSk24HkG+fMEhkDtkZUn8+xhFqwtRafqDpNPM
	5Oh7WtrEt0mWvfx10CXfLrx9ShfDIdz7NK01Qi54juQoHDjuYQJmE4n8Qv8jchoUO60xTKsPb4Pb9
	XyMz2+U4hwQwaNZdnoWxO9fw/SCSbaBf5vHMluuEKidZhECS0cCb8mD996WB+UKyQ0FE19Nhrue0J
	ulRl1TovanPHxbXX1Smjqqx2SF7bsVq9G+sHQ6u/oWiMzikDDosTfLBUgkr7T5FGripu/RRu7MFy8
	fpMXOZwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12Nj-00000009XE8-2iNw;
	Mon, 31 Aug 2026 13:49:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12Nh-00000009XDU-2pXw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 13:49:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 205106013A;
	Mon, 31 Aug 2026 13:49:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 907B71F00ACF;
	Mon, 31 Aug 2026 13:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788184140;
	bh=CXazQErvLFJ2PhKGMzA7OzB+VrO5rrZMlu8+901gGLk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZwkXp5XhZtUZP+x65p1lxPwwHaOAmPWFWz4aNLL6PG362OFrq4Le67EvvpJ6wSTXj
	 /Bfg8iCfCVNVX9NH8Tj145kIRK2fPgOI7vee4O/k23dRl9ZcGqIAvwn5cUYD7GZJxr
	 8DwlzbMB3xdAyBBTlz5d4KJPbTPG/ZKVDeih/m+lbhZkRAMxTYeowA5AG65ndwUJPy
	 eyEdscf3cRaur4Svqbh2wVmCwe7a2zyAJmPZS8t85T7noEIElSxAawaf5qclMq1s46
	 e0Mdrxk3+ym93vS8zjlST4vXX19cfSKPGdXasR8V8ILGrcGuoEwLkgGLDuKt57koyR
	 M+w9r/hmjxiOg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Sasha Levin <sashal@kernel.org>,
	davem@davemloft.net,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.18-6.12] crypto: atmel-sha204a - remove sysfs group before hwrng
Date: Mon, 31 Aug 2026 09:29:04 -0400
Message-ID: <20260831133314.4125787-516-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831133314.4125787-1-sashal@kernel.org>
References: <20260831133314.4125787-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.18.48
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Thorsten Blum <thorsten.blum@linux.dev>

[ Upstream commit d58b4a09d7f06750a706b70d068f5a678dad8233 ]

atmel_sha204a_probe() registers the hwrng before creating the sysfs
group. Mirror this order in atmel_sha204a_remove() by removing the sysfs
group before unregistering the hwrng.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

The background searches finished. The Herbert crypto tree is reachable,
and the upstream commit is **`d58b4a09d7f06`** (`crypto: atmel-sha204a -
remove sysfs group before hwrng`). It isn’t in the current **6.18.44**
ancestry — the buggy teardown order is still present in
`drivers/crypto/atmel-sha204a.c`.

That doesn’t change the earlier verdict: **YES** for backport to this
tree. It’s a one-line reorder that should keep the existing `kfree()`
(the LKML version also dropped it, which would be wrong here).

 drivers/crypto/atmel-sha204a.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
index 8a3520c9a0ff5..2a37a4aeda92b 100644
--- a/drivers/crypto/atmel-sha204a.c
+++ b/drivers/crypto/atmel-sha204a.c
@@ -205,11 +205,10 @@ static void atmel_sha204a_remove(struct i2c_client *client)
 {
 	struct atmel_i2c_client_priv *i2c_priv = i2c_get_clientdata(client);
 
+	sysfs_remove_group(&client->dev.kobj, &atmel_sha204a_groups);
 	devm_hwrng_unregister(&client->dev, &i2c_priv->hwrng);
 	atmel_i2c_flush_queue();
 
-	sysfs_remove_group(&client->dev.kobj, &atmel_sha204a_groups);
-
 	kfree((void *)i2c_priv->hwrng.priv);
 }
 
-- 
2.53.0


