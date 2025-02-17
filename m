Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCFF6C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 07:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9mlA1/guLuh60WCK2DaO4DFUk7OzFKB8ZoIzCPZt1mY=; b=W3G+vVU484ALv32npNfdJgy9MU
	J2fa/vboVAnqXlfKgCDPQPUmxcs9r6CJ2JuOdB5cwF138r0Uiy7QGmHHfv8zDeTLsEINlzLdFQ1xV
	z57B0dHCf3OM1IT9iZxpRHLfNHf/AX+/7NVg0vOIwyyI+3SA4XWYa1hWxJjIMHg8eETQMK4Md7Vj3
	Qf+tXCr2W6hntKieOf/dG8UkiWVDv+4t3DELz6OGjuaEBb8x9hrpleEvT+vZfcmJ/hLrizx45vcBX
	2hpEMgq7F9PpIxhXIlFShtQcZRZP9i9I3UEflAMQV4yOOek1l0NKHtfiIB8a71LFHYYrPD+6VcPeN
	FXK0oi4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjvjp-00000003dJw-2Ts6;
	Mon, 17 Feb 2025 07:40:21 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjviE-00000003csZ-3ueQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 07:38:44 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739777921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9mlA1/guLuh60WCK2DaO4DFUk7OzFKB8ZoIzCPZt1mY=;
	b=34ofnFwJEtJouMlmHF/ZUBiNwYQonokDI5vQpMrQM3qDz67jnqeJkccZcW6beWTPUZ2ue5
	Bq5MCDR2bOnu9jRb4qJQNMp2y3+BYTQZuG5QL/99UV2UqBSfCvqORA5N4shU44WfB2m4cm
	EC22fQvSAZwpjDdI8SpI4GXkjancGrc6fhusWp4mCEujwQjRaDVjGsuPYUVcuqOMfyZ1Mo
	40oItNWQFLMpXi4+aSS+9ZtrBrsZvabMvc+sqwP2RM8rvTqUvfSMdCYTFD5AIaMtKuXmmV
	ZB7YvxCH6MQMOUnX18S8vEwLrqxJ1WcaLSD/S9+T0jEWtv9AO9rC2e9+0BqBGg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739777921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9mlA1/guLuh60WCK2DaO4DFUk7OzFKB8ZoIzCPZt1mY=;
	b=HSAYgVR5LjY0wopQ0uT/pTTiyDNoGSLVbxLXLr8zMLUWUqj6wC7uRwyO4kYaGXEoCij2W8
	IC6LhJ4fdiAZ1UDA==
Date: Mon, 17 Feb 2025 08:38:37 +0100
Subject: [PATCH] ARM: mm: Don't use %pK through printk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250217-restricted-pointers-arm-v1-1-aaa0fb22e18c@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAHznsmcC/x3MMQqAMAxA0atIZgNtVUSvIg61Rs1glaSIIN7d4
 viG/x9QEiaFvnhA6GLlI2bYsoCw+bgS8pwNzrjGONuikCbhkGjG8+CYSBS97Gjauqsma4NZAuT
 6FFr4/s/D+L4fTLOUwmkAAAA=
X-Change-ID: 20250217-restricted-pointers-arm-07493b11c0fc
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739777921; l=1214;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=DzCmSKwn2Q7/+q1uLCVQqEVP2Z5fvNZrI1/dmAalTWs=;
 b=200qmgczWGefMX2ALuAf/85dinyilfNwPpX2sxD3XwPMd2kkWZiDqLpEYjJlwj4Qi4xhvljNT
 oFgGutxHif9Cda1CoQXuqQSHMJtVnbE8ch4HqSEFCXeTgBz4FySfAzP
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_233843_125354_E87ECF37 
X-CRM114-Status: UNSURE (   9.11  )
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

Restricted pointers ("%pK") are not meant to be used through printk().
It can unintentionally expose security sensitive, raw pointer values.

Use regular pointer formatting instead.

Link: https://lore.kernel.org/lkml/20250113171731-dc10e3c1-da64-4af0-b767-7c7070468023@linutronix.de/
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm/mm/physaddr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mm/physaddr.c b/arch/arm/mm/physaddr.c
index 3f263c840ebc462e13c34d33be0161e7a473173d..1176c75ebf74f9b948041d3356c411e0693d7873 100644
--- a/arch/arm/mm/physaddr.c
+++ b/arch/arm/mm/physaddr.c
@@ -38,7 +38,7 @@ static inline bool __virt_addr_valid(unsigned long x)
 phys_addr_t __virt_to_phys(unsigned long x)
 {
 	WARN(!__virt_addr_valid(x),
-	     "virt_to_phys used for non-linear address: %pK (%pS)\n",
+	     "virt_to_phys used for non-linear address: %p (%pS)\n",
 	     (void *)x, (void *)x);
 
 	return __virt_to_phys_nodebug(x);

---
base-commit: 0ad2507d5d93f39619fc42372c347d6006b64319
change-id: 20250217-restricted-pointers-arm-07493b11c0fc

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


