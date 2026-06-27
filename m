Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67ED6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 09:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=huwj658y+0lST56S2QLTZEs/tSbFD/6igDv+cH5caLA=; b=UKQuLzDmhENMKULMX95GEa5diK
	fld3Hdudvg7rz82WvPYbsNxLzcITeMeH8rjfQg7doI9HiGPfIYZogMz2QweZ1kYv1lBWcDiN9X4W5
	667ExWUWwUdfl3Wzwi3ljYExuaVk+0qm8zc6rOpq2qX4xGa2ds3r3/k4HijczwJKIlu9zXhOiq8lY
	jLYlcOR+xxR9/q7z676cBfVKLu0vzVU33Yfd/RFasYy0yltl45GiVFzaPdWQM5Cct7ak6d/fpaxsX
	BwXnbYDIwBjm37J0vhrBE1YmOhhER/IM344MpoVgMZbisqZexkYRwq4iCQ5ANMX6L0daG3gv+5xFh
	IKyoFfOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdPIa-0000000CK9n-10gA;
	Sat, 27 Jun 2026 09:26:04 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdPIX-0000000CK9Q-189X;
	Sat, 27 Jun 2026 09:26:02 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gnRx104Wfz9sbf;
	Sat, 27 Jun 2026 11:25:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782552357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=huwj658y+0lST56S2QLTZEs/tSbFD/6igDv+cH5caLA=;
	b=uJRjJ6qTA5eUDeLqZgB5ThOXa6/QdRhKpKZHja/TSlBwbZAQ+59dOpmzDHvnQnPHL+3qUP
	nAfUH1CN/unsdG3Wq0u1KZZcCai9riaAhshBVWkL4ecf+iChpr46v9tjTk+XXO1g4qux9D
	AV6btM8uOLZ4uOkaJeFGLm+Acp9VW4+ZVv3JxsnutMMcOTFiGDqXqGUYilOvLtXE6z++7H
	8WC8c1VfQgG/ZSdypaZkPJAFXfiqAinK5xKc+brT+xdQq3asuBXjVDDSMikcpBkSubqvHi
	63NgQQxpSMad/ZKldGp2Fs7i5Io+3PqGhJKgQB77RA6GsiY8PkQRnAbCaO/btg==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782552355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=huwj658y+0lST56S2QLTZEs/tSbFD/6igDv+cH5caLA=;
	b=Ofa3rOghLUuylScM1yHMFeuo0obYmru4CVN4ES61/jFPDuq7ooDvZYenAmYiaJ2eHGEWc4
	T7I+yUhxCZfuoknas667akxLpazHLC/iVsNoi4Grq2MgFdTIiHw2yim54RFQXRW4jKGTeg
	oFmBOnqqhtbo0qt0czBKdAAngxnFYEWd20G1vn9stB8sN+EIn8AJ03zVFUKg31dfZHUXKP
	s2Y9wMP9wOJAOLbLqUWsdxGmuCdQj39KS1Eb31AG014rEmTLxn3MeqZqfFhGfIbnaaoLBH
	f0xWO3KSUvobWoPNHM2SQhp7IZWOuS1csl59MpRHVj66/sYCiY9B0zI+/UnMew==
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Andreas Faerber <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ACTIONS SEMI ARCHITECTURE),
	linux-actions@lists.infradead.org (moderated list:ARM/ACTIONS SEMI ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	Randy Dunlap <rdunlap@infradead.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH] Documentation: parport-lowlevel: Fix curly bracket
Date: Sat, 27 Jun 2026 11:24:00 +0200
Message-ID: <20260627092359.30044-3-manuelebner@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: bct8kj3xjoo5igabb6dnd88oxgzxazz9
X-MBO-RS-ID: 9082b7b8b23da4b51a9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_022601_481899_418F26E9 
X-CRM114-Status: UNSURE (   6.80  )
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

Remove needless '}'

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 Documentation/driver-api/parport-lowlevel.rst | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/driver-api/parport-lowlevel.rst b/Documentation/driver-api/parport-lowlevel.rst
index a907e279f509..af73741289c9 100644
--- a/Documentation/driver-api/parport-lowlevel.rst
+++ b/Documentation/driver-api/parport-lowlevel.rst
@@ -341,7 +341,6 @@ EXAMPLE
 			/* Try to detect a device on the port... */
 			...
 		}
-		}
 
 		...
 	}
-- 
2.54.0


