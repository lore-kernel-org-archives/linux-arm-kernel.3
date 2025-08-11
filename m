Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE17C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 10:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gQ9eh9/zvfBpPdf1yOHxLVFMwlIvEemowzDPpcMhBiw=; b=qHus6CspCxZRs0gkgBdb2zdLBO
	eCJheG/tcs4bmdvxhChBReG+7HiO66l8Td9d0EyB+Q4HYVJ6HI9M7BDgF94dNFHGV8e52ixC1T+qB
	0UrbDjzmkDpuB2lIBH5HYh0L+zsKN1RLcNIbJXQ+O1RAjw46uUgYe3I/Mf3YrxUrzCDGVzipJ4k4z
	OQm4Zub6hx3ydJAc6nXdhW7OxfHPGAfOvfNSKTh0xq3jjn0Q8Hanivh5UgB13A/VeU1P9PDidmgln
	i/iRXnKzWawvkXikLbsWSCf3/fVKDb6bddZQa8KbmoSCUERu/tKMKEVNsxAUpbVjO3npO90Zs3nuS
	LbZyieYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulQB9-00000007Q35-1gtI;
	Mon, 11 Aug 2025 10:54:59 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulQ5V-00000007OqQ-2rQQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 10:49:11 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754909347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gQ9eh9/zvfBpPdf1yOHxLVFMwlIvEemowzDPpcMhBiw=;
	b=26q3kVXq+tvWpcx/uph5sYEnfSm8PK4NJLGLfaHmsbuaFK2HKl4QtEyUjPW6lbFaEyQIhA
	ieKZBp2CIs5LfnpMEuvwlmhIzYolzpEEZpIYv8EedMvLDBTaHiyf4TptK5szgNNbNuycRW
	Rhwzd6rA7ovLJu46hMGJlwW/LSyRiQa2MI0OLY8JBUWIuAAcN46dwO7j6jhyKzFzx5IJF8
	5PaBrCc+vJhGdNNYUP1rqikyC5510IY0EMxTWQCXAOmqckWn3q9YjUdyTfZwpoWyq4ND9B
	huyUEwVUYYOdTwW0Dgd0bT15YAOg0O61hPKO0tLYYaMg8L3QRmPS80+4mB59Ag==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754909347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gQ9eh9/zvfBpPdf1yOHxLVFMwlIvEemowzDPpcMhBiw=;
	b=lq/81gBDE3//kJOfgqNcJMGNoOW0xEXf1xPqOgZkVVz/JhV9wMp3sCgakArU9Pg6BDq2Jr
	RobtYWg2KPI5DaAw==
Date: Mon, 11 Aug 2025 12:49:01 +0200
Subject: [PATCH v2] ARM: mm: Don't use %pK through printk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250811-restricted-pointers-arm-v2-1-74bac42f3699@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAJzKmWgC/4WNQQ6CMBBFr0Jm7ZhO1aCuvIdhUcogk2hLppVgC
 He3cgGX7yX//QUSq3CCa7WA8iRJYihgdxX4wYUHo3SFwRp7MpZqVE5ZxWfucIwSMmtCpy809fF
 yaIm86T2U9ajcy7yV703hQVKO+tmOJvrZ/82JkNA5Z/rWWqazvz0lvLPGIPO+Y2jWdf0ClQljZ
 MIAAAA=
X-Change-ID: 20250217-restricted-pointers-arm-07493b11c0fc
To: Russell King <linux@armlinux.org.uk>, Kees Cook <kees@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 linux-hardening@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754909344; l=1462;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=uujVNNdVW9U8D1UA5bK3BeelcyOCRx9wp/Szp8PjOrs=;
 b=gW95gA8CAxjgBbyt0Lk1m/IVLgeB7Er6bzFTRV+h6PPf3GKicD4VoCDU4d77LX2Paa/BOkOFB
 X2A9TK2FJYmDTzmXxSWIXj+G9t2gfGNK2pVLpPDB+l0iP+S9/xYWaKa
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_034909_860324_8CD018A7 
X-CRM114-Status: GOOD (  10.61  )
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

Restricted pointers ("%pK") were never meant to be used
through printk(). They can acquire sleeping locks in atomic contexts.

Switch to %px over the more secure %p as this usage is a debugging aid,
gated behind CONFIG_DEBUG_VIRTUAL and used by WARN().

Link: https://lore.kernel.org/lkml/20250113171731-dc10e3c1-da64-4af0-b767-7c7070468023@linutronix.de/
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Changes in v2:
- Rebase on v6.17-rc1
- Switch to %px instead
- Link to v1: https://lore.kernel.org/r/20250217-restricted-pointers-arm-v1-1-aaa0fb22e18c@linutronix.de
---
 arch/arm/mm/physaddr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mm/physaddr.c b/arch/arm/mm/physaddr.c
index 3f263c840ebc462e13c34d33be0161e7a473173d..1a37ebfacbba969b9341fe17518cdd81fb2899b6 100644
--- a/arch/arm/mm/physaddr.c
+++ b/arch/arm/mm/physaddr.c
@@ -38,7 +38,7 @@ static inline bool __virt_addr_valid(unsigned long x)
 phys_addr_t __virt_to_phys(unsigned long x)
 {
 	WARN(!__virt_addr_valid(x),
-	     "virt_to_phys used for non-linear address: %pK (%pS)\n",
+	     "virt_to_phys used for non-linear address: %px (%pS)\n",
 	     (void *)x, (void *)x);
 
 	return __virt_to_phys_nodebug(x);

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250217-restricted-pointers-arm-07493b11c0fc

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


