Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB89E606D813
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 16:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oTIbwWzu;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=deegLFnn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RJUGZOoWFzjXGj7HBosfKmIH9trO+YlXBEC99HJVpAw=; b=oTIbwWzupy60kL4EIV8u59wCNb
	xOI4BNXy0yhbLH0vaVLDOPkIpWIVkB7OCtOqTHW0eFNit0QPosyBTGZpjWikdGsZBJ8VVaukZObQk
	Syl8GcQVFa8o+ae34JSTRiJQ6CIGzjZXXhEcM36AWnA89fQRujubbq5tj3QJFK3GFMb1vS9jnowU6
	FVj/9zt3crcs83hziWdAmKta0Dj2/j8owZKeKBAOhq+ZWQ8hTws7zXnFGQSNvL8bUcg1u1csviJZS
	hX1dJB1kxW+WtfGRgFs/Puo9qBlBhjARGAxXCzrBo8dcf3HE5KMcnUPbJcpbSkUl+0nPMKOP9tfpd
	1H8njR6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHUC-000000038p4-1Kbt;
	Tue, 03 Nov 2026 16:35:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHUB-000000038oR-0hkr;
	Tue, 03 Nov 2026 16:35:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 532EF60136;
	Tue,  3 Nov 2026 16:35:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793723746;
	b=pONuBpSCKNWWQ7nMk5SXNcL1jVRaxc5im5rR027z9LquqhOLvI8qGEd+RsXgf+bTWgUY
	 lni9cr03R87KIH35oZ2ySGGS9MZTHbbXcpMsk2YxpWZvcgAQqQ+KwMvuW5pzM6zqtij+s
	 pyyFDPLt57iZNo2/x4BuVHm8NMXW5iIyJPLGVO6C3K95wKkimgxBnAFbb+fZMWMVq85c6
	 bZ08d2CtcRGwXtjPk+2cvrJSqqtuP0jlAGCo9omZ9ssR3guhGXkyzZKI5x5/XeqoPIZxZ
	 zjnsoTERIPJAttOetvIQ4qsPUa7TYQsAC1jLmIm34O7Tw0viB/Wn/5en9bTgCckjBJQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793723746;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=RJUGZOoWFzjXGj7HBosfKmIH9trO+YlXBEC99HJVpAw=;
	b=pbXm+J89Uk6C4VMX7wV4kqQef4xeBPHIjfEyLoiIRXIUkROHIYJoozIAXAqcaVhb9a7+
	 ZHsjyu8vYr+G7ilXBZojMxABd3egki5ESqiWP9OImIBL8ILtwmo3yohq+t1ALmu9qAKBY
	 MCWIAGCv5bOduY8jrC1NmThPlDnSBnAr5XZBulNzZadT+9FrRhF5ZumebMvm+Z6IWV8k4
	 gkx5juEZyrLAnsDJf4j7/Tcc2vpeklL6hN0AR8pjepAyCSzAYKr0OPzdjPXmhdRcTpRfF
	 Xw6fw1Su93dg3Cqper9g+DanR1/ZPSyt7HnyrZJMg7dZucRm2YaIqpsgRZXR+8+NOpA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 53A5B1F000C1;
	Tue,  3 Nov 2026 16:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793723746;
	bh=RJUGZOoWFzjXGj7HBosfKmIH9trO+YlXBEC99HJVpAw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=deegLFnnBRiCFClbYSMoewN7ye07SiAELhyHEQlfjmbHH1nfWeD+jUt9CNR69iwrn
	 fY3qoybAUkRaOdlyKrEdagu/Stmchh3FJLDOnBld11wSM+PhGEw6zNkeeHKiUFUlQR
	 5r13a9N9UxGQrCFuzKfOaKAtcm54JXxOBJNLY10y7EjsJdUZVHWHltvwMoYDri5bBi
	 9n1oRyjuVjYUdAT9UO6SjbXQtV6AcIOSPVZxOz1i/lzD4nvhnxeHbowWt95VYBsxZg
	 b24MMX4/IzODXFfzBuG79dEGZtRLoSAqYz8B+6KGOm+YpA+lIWi2m1hNPTgcOokwy5
	 hS5gWfbkiDT3g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C871B46A3A;
	Tue,  3 Nov 2026 16:35:44 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Tue, 03 Nov 2026 18:32:08 +0200
Subject: [PATCH 2/3] iio: adc: mt6359-auxadc: mask conversion ready bit in
 mt6358_read_imp
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261103-6768-6358-fixes-v1-2-2a868a33152b@protonmail.com>
References: <20261103-6768-6358-fixes-v1-0-2a868a33152b@protonmail.com>
In-Reply-To: <20261103-6768-6358-fixes-v1-0-2a868a33152b@protonmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Roman Vivchar <rva333@protonmail.com>, 
 Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793723743; l=938;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=jjtR8g7xmupL+XnlrkZOXO9Y/4V6fAf1ol/Gk6qBx/4=;
 b=PcG0apM9yu+7SfOsGLh2XjIaQra7NYavUchHZ85lr2Omw/dKnkzYLD6wOGrGXJVvSfg6U4pEr
 7RlGITrGEsUCXPqC94DM43/U8X4Nv02n4iELKlNhQtcHUltkgrPGxJc
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Roman Vivchar <rva333@protonmail.com>

In mt6358_read_imp() the raw ADC value is returned directly without
masking out ready bit, resulting in incorrect battery voltage reporting.

Apply the mask to strip the ready bit, matching the behavior in
mt6359_auxadc_read_adc() function.

Fixes: 3587914bf61d ("iio: adc: Add support for MediaTek MT6357/8/9 Auxiliary ADC")
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/iio/adc/mt6359-auxadc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/mt6359-auxadc.c b/drivers/iio/adc/mt6359-auxadc.c
index 951d236f972b..09432d0974cf 100644
--- a/drivers/iio/adc/mt6359-auxadc.c
+++ b/drivers/iio/adc/mt6359-auxadc.c
@@ -502,7 +502,7 @@ static int mt6358_read_imp(struct mt6359_auxadc *adc_dev,
 	mt6358_stop_imp_conv(adc_dev);
 
 	if (vbat)
-		*vbat = val_v;
+		*vbat = val_v & GENMASK(chan->scan_type.realbits - 1, 0);
 	if (ibat)
 		*ibat = 0;
 

-- 
2.56.0



