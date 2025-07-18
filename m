Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F0CC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 13:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mo94wdkZNDuu5QGZVvAPQQVCJz7QXGr0/48yptUJ974=; b=B1ex0ddsucEqGZ7fyuy6EA+XjY
	+mda4Aa8O0aMgVMKVbTJdZBQQD5JLTfm+fyCp/UrWrggmwdOh2IlFwItBnYXovdV8H4HSG/8/Hf4q
	Sne80xy+vl7uz5BKK17NO5mI4z2nWrw6szpDg+IwPuGZ+iKVkJRi4klHLZ9Thw/KazvuJNGBUDMO/
	J9Gek3wad25s27VQO2T1ifaJMatQXHkaKaHXluVZqAUsQj+ZeIXRc3PCs87FrpvzkyiZYTFyhvh/P
	Ov1v54ZyFC7fFqFOslhXBwZ0jtXnkgfKEEgpkmTEZnIYnmjjKGCGft3MR30Z/eTEJ/ztpujOGZV9D
	AjvPAT1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uclTL-0000000CjOc-2b4F;
	Fri, 18 Jul 2025 13:49:59 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uclKH-0000000CiLX-2ant
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 13:40:38 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1752846034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mo94wdkZNDuu5QGZVvAPQQVCJz7QXGr0/48yptUJ974=;
	b=pMluozIdK72HGQH3aouNde4Sy8FLnoDw6EvYthFAqhtDJApHP5b1VV+saucTVGPZgSvLQ/
	QPLsAXqCHZGRX+d5JUkvEtWbrUs2AxC8mZJU3iDrNGT7OG8pCVxZUSzSSs7QVbO8p3oVXQ
	2oIhEA/kAH8FiYUPCksu+tHQfSOwad08orrYTL2N6uh62iwybs4gacV42V36szUcY7XChG
	KWMPtZJy5oaUJN0E/0eoEhusNgkjD+conIob31AwIl+wZtr9MhqVxhSiMbdcHUBGk/wjH/
	nL2iy8BUNh1Ya5Nd9zNKsPvwqx+QS12HxDP7fzZgzlWKwELqXGij6EcdJe2gaA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1752846034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mo94wdkZNDuu5QGZVvAPQQVCJz7QXGr0/48yptUJ974=;
	b=hdIzQ3dUq2/DyohiQtlXkFcSpDOfDUbpjTBI6U0HUYlN6mwq22xDvpd38/KwWEDeG3g+jX
	3vo3dZXc5+T2ShDg==
Date: Fri, 18 Jul 2025 15:40:32 +0200
Subject: [PATCH] soc: ti: pruss: don't use %pK through printk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250718-restricted-pointers-soc-v1-1-c0d0d0bc2e39@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAM9OemgC/x3MPQqAMAxA4atIZgMqFn+uIg6aRs3SSlJEEO9uc
 fyG9x4wVmGDsXhA+RKTGDLqsgA6lrAzis+Gpmpc1dU9KltSocQezyghsRpaJGyHoWt77xytBLk
 +lTe5//M0v+8HPaDLd2kAAAA=
X-Change-ID: 20250718-restricted-pointers-soc-499748d55cbc
To: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752846034; l=1493;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=LjAcRieKgnMNYcLnZrs27PGMwV9sd+uOX82BwodEtro=;
 b=q94Q80T1q0imLgWgj4Y25ibsdl1Sv4feNSwafmljzXXGeaVEusmw2CTN8r+ycppoVa+Ucmoy0
 sBNWr6vfvfOBJ14oQ6CDECTADQr+MVkI4HMGBiJ9XboQffjJawv2ag+
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_064037_806928_E5E29354 
X-CRM114-Status: GOOD (  10.42  )
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

In the past %pK was preferable to %p as it would not leak raw pointer
values into the kernel log.
Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
the regular %p has been improved to avoid this issue.
Furthermore, restricted pointers ("%pK") were never meant to be used
through printk(). They can still unintentionally leak raw pointers or
acquire sleeping locks in atomic contexts.

Switch to the regular pointer formatting which is safer and
easier to reason about.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 drivers/soc/ti/pruss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/ti/pruss.c b/drivers/soc/ti/pruss.c
index d7634bf5413a3421da296103fc1591030cd00cbc..038576805bfa0f8dece569cf6faecedfb43a392f 100644
--- a/drivers/soc/ti/pruss.c
+++ b/drivers/soc/ti/pruss.c
@@ -449,7 +449,7 @@ static int pruss_of_setup_memories(struct device *dev, struct pruss *pruss)
 		pruss->mem_regions[i].pa = res.start;
 		pruss->mem_regions[i].size = resource_size(&res);
 
-		dev_dbg(dev, "memory %8s: pa %pa size 0x%zx va %pK\n",
+		dev_dbg(dev, "memory %8s: pa %pa size 0x%zx va %p\n",
 			mem_names[i], &pruss->mem_regions[i].pa,
 			pruss->mem_regions[i].size, pruss->mem_regions[i].va);
 	}

---
base-commit: d086c886ceb9f59dea6c3a9dae7eb89e780a20c9
change-id: 20250718-restricted-pointers-soc-499748d55cbc

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


