Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F95C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 13:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lJ+45IvRoWJ5YGcGkBPP+37icny9O5EOvwoloUYTRWM=; b=Bgal9T8rEtE93q55kLo0Wt7nO+
	J2td3/oA0oMao3ET9yL5ylEj01K3T0N5uo6/J/mOYaDSe3GFF58vIXQAGVvGra2+T7richWSQDjxG
	1tnWSlpALfMIgT8tjx3Vum6Lb8FJa2rzJYZX53lhO70feu/wJbrs8roRxyq/2sOpCnfxb5YE7aQMW
	/0n/SLpyafweKZ2zDNkz0Puo3KpzoO7Fo4N0Pcrj6umgggEUjprYcaFngwVnjhu3MzUDIjGx5FQdI
	fHn57TR1aUd5/0WvJ1eAeXd0Crr+PTW9nXS5wv3TjOXnUEtz1JMg21IaLvQb3SXKoJHAMuuBNN2iU
	p8Eg2phA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbNl-0000000Fep2-23qm;
	Fri, 20 Jun 2025 13:02:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZg7-0000000FRFo-1O7s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 11:13:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BDE0A44CD2;
	Fri, 20 Jun 2025 11:13:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD33AC4CEE3;
	Fri, 20 Jun 2025 11:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750417982;
	bh=Z+FfhbY2dIQj1OgYnBauCW6kLhQRKO0ds9VLINPnkqc=;
	h=From:To:Cc:Subject:Date:From;
	b=BDyuj5EwAviEGIEXuSCZoHjBq2v3OJqRI81UdNRoIs3x6p2SKoHURMU6pCVK+VuIr
	 PajUfp+Qg5iXaO11tioHL7nHhYflpctwSW6WBJWdv2M5toGaiyb8g5cT1optX3reHK
	 UTDNEClf1FJnA3VCEfkA9Bls/jNtm1T0q7CSNXa4bv3LQU0nDyadFoTLm14UpuPIZB
	 jzfU2iFmNOtJ4yCXzklVHh1UxxUr7uAsjPDYLW2r2iV2VJEvHdW03xtbGWvpUv6kvJ
	 VqsnqG2j0xf4Q1wy9RO0HgPdFJK8FaBubZbQ8NDSEGmPC0KW4saB9qlukrwrYsfBZC
	 /UJlW2X1sLPYQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Russell King <linux@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Abbott Liu <liuwenliang@huawei.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: export __memset/__memcpy/__memmove
Date: Fri, 20 Jun 2025 13:12:44 +0200
Message-Id: <20250620111257.3365489-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_041303_395469_3A607093 
X-CRM114-Status: UNSURE (   9.71  )
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

From: Arnd Bergmann <arnd@arndb.de>

When KASAN is locally disabled for one file, the string functions
get redirected to internal helpers, but those are not actually exported,
so this only works in built-in code but fails for loadable modules:

ERROR: modpost: "__memset" [crypto/ecc.ko] undefined!
ERROR: modpost: "__memcpy" [crypto/ecc.ko] undefined!

Add the missig exports.

Fixes: d6d51a96c7d6 ("ARM: 9014/2: Replace string mem* functions for KASan")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/kernel/armksyms.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/kernel/armksyms.c b/arch/arm/kernel/armksyms.c
index 82e96ac83684..1ff50106afa4 100644
--- a/arch/arm/kernel/armksyms.c
+++ b/arch/arm/kernel/armksyms.c
@@ -83,10 +83,13 @@ EXPORT_SYMBOL(__raw_writesl);
 EXPORT_SYMBOL(strchr);
 EXPORT_SYMBOL(strrchr);
 EXPORT_SYMBOL(memset);
+EXPORT_SYMBOL(__memset);
 EXPORT_SYMBOL(__memset32);
 EXPORT_SYMBOL(__memset64);
 EXPORT_SYMBOL(memcpy);
+EXPORT_SYMBOL(__memcpy);
 EXPORT_SYMBOL(memmove);
+EXPORT_SYMBOL(__memmove);
 EXPORT_SYMBOL(memchr);
 
 EXPORT_SYMBOL(mmioset);
-- 
2.39.5


