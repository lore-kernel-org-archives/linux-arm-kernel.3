Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B07BCD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 05:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kHMzlmbLmk4stfG9PBhCRRViSNSziVCXY5qNwjX9cn8=; b=BLG7DCydXny6x7C5gvCVyg+h5u
	jVBDMX21iqmJU6ti0x1h3MSjMXbqj3Ej3e/z8+ir3cC7ANwJLSIohoeinJzhKJjbf+TFIo9F0c4G+
	fMqOdLwmGIGqo46iCO7RFy2DBCSLLsDz7d+50ZgH9UXNRrtxyo2rBtwaADtK2VpNM775XLMZoxI2j
	+o/3eFNu9cAszUQpOzlmyRhJBXK5V18JLXYGRscVOB+lPgvf98DAs1jz9M1jJSHLbGEHxo1GQLtQA
	7CGXTWzPz0Ncq18N/O9LX1p07xwIpU0tEgTg1VEMYq/dDk5mV0jbDHCJpLx2kteGVXMzkdZS5R6Fk
	n679I7lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXBZC-00000006pVK-3sTt;
	Wed, 10 Jun 2026 05:33:30 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXBZA-00000006pUF-0vOZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 05:33:29 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2bf2247e38eso65912885ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 22:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781069608; x=1781674408; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHMzlmbLmk4stfG9PBhCRRViSNSziVCXY5qNwjX9cn8=;
        b=llGblRoFvhYayJqNADZsClwZlCf1cpKTBWsMyQiZSI/JUIilfOjmIb1ApLRgUZw4jh
         W/ayFf+lX0zmckE6QODZyNOuuAtpzjtYBDRscxbhXuf6JNYSTPcqADnmYaDHcqsE83IX
         heS0kny/VmAxR4fDmBuFhq8cyvl9XBU0JNiWDAPBcyYgwYBWZ3yYqarBJU1ndYjvSJ2d
         1tuadqSJlucUrduqhm56MmwRt0jAzKMEADtHGsjS6BERw7APD2CXx4MEu9IbyBy0JsQ0
         KEiOVqLj9UHf1l3nob3C7tou/gr8lNCBXUNaTgGBQyNraGsxJpc5NggeXOzNBxEJK1Lc
         clOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781069608; x=1781674408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kHMzlmbLmk4stfG9PBhCRRViSNSziVCXY5qNwjX9cn8=;
        b=Vd8k9iPCdQmcKkVCu3lBO5F5ZwkqwTwnufH+YR8pa+vsKidvCwMeX5WFFZKkJc0op5
         Zane2Ve9l01C3FvegB/nGpndGzqw9dBYvITRr9q8QDEhdLPntsu4fF64aAz1VaxHBY8e
         TpP7PpqI9IOoqIBeOHevlWwoReupO+h74mNYsZeXpG3iiKbiBtpoJY+qbVuAe6SkanE6
         R9eumDb+xxfXklLmS4VwdTekvlOtojuZV0gOlzPKVJzBcDLXwq7pbTXptbV+Xnv08uvK
         qlCkNfeUScNo4RP7Tak1u/wa80/7tINGPc7Cq1jijWcFyoYdL5fdnccded8dGn8NMqyL
         ostQ==
X-Forwarded-Encrypted: i=1; AFNElJ9JU1/yv5Jq8GkhtMzuZ2MRJflDjgDsKu0Mir105z6sf93hU9QsfpfH/O+wHmV/mS3hW5y1xBQdnXF/chtRjw5w@lists.infradead.org
X-Gm-Message-State: AOJu0YzfF3THUQlAgLlJ5cRsDtTLQOA4sMHVLGzXvtKGzHjJ+rHw9/AA
	kPjGTfPIIGVp0IUZ7w42WH7t61eUjAaUiJMLlrqw5zUBZh2EZFp+CVAK
X-Gm-Gg: Acq92OEkP5HVzQDmIbdzd13/eZpTBLWcZWaq+yaS8SpE1EvxZsNY/kJll9BYOR72mY1
	NSWrNPNhkC3HATY3UvKn5VR/F/lzETBi9ziZNXqCzMcexA1iFBP5uSOXgV9RIR2JGI3Botd6Vtg
	72jllGjs9JemrgvbM3ih+d2g2EKKcXKjTYRbbMnXw0X9Ywdt2XNTHJG0uFdSOa12p0dTyy85UFE
	FWluUcT8QetsN1e9WmLgZrqsclqcTIdRRQ5f60JOYN1fVtdQlc+kUKTbJXV5IvBq+5ZbMBtmxW0
	s9JB3OCEmHgHwKDSrrHskUbEvGit2JFqm6LJPzUmTePDXj0wgz8xW2Sax1n3pPkz03/se4/p0Jl
	oLlcidr7eLXnSlVL6uQW6lG22dlnwBawZEOGkMCs5rX2tox9gjJ7aoAOQi27WtR5QuSjxnxORW4
	EkMudIcJ12urdbdnDs8PT/BhNuK0e+885EGS3umUtqK0dkHCr6A0oQEU69wfoyIAdC1hdz46UHw
	A0+azxXgYLB9kOMxqFN1PxCuFeerufJYhkXS4ZaC5JeFq+6V6iDY3dkcyRa4uHy
X-Received: by 2002:a17:903:3805:b0:2c1:98b7:ecf3 with SMTP id d9443c01a7336-2c1e849577emr238682945ad.23.1781069607639;
        Tue, 09 Jun 2026 22:33:27 -0700 (PDT)
Received: from localhost.localdomain (n49-176-80-106.mas22.nsw.optusnet.com.au. [49.176.80.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm242862735ad.27.2026.06.09.22.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 22:33:27 -0700 (PDT)
From: Weigang He <geoffreyhe2@gmail.com>
To: Daniel Palmer <daniel@thingy.jp>
Cc: Romain Perier <romain.perier@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>
Subject: [PATCH 2/2] ARM: mstar: fix device_node refcount leak in mstarv7_init()
Date: Wed, 10 Jun 2026 15:33:12 +1000
Message-ID: <20260610053312.2267307-3-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610053312.2267307-1-geoffreyhe2@gmail.com>
References: <20260610053312.2267307-1-geoffreyhe2@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_223328_289833_BBE1718A 
X-CRM114-Status: GOOD (  12.66  )
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

of_find_compatible_node() returns a device_node with its refcount
incremented; the caller must drop it with of_node_put() when done.
mstarv7_init() obtains the "mstar,l3bridge" node, maps it with
of_iomap() and never releases the reference, leaking it.

mstarv7_init() is the __init machine init callback, so this leaks one
refcount on the l3bridge node once per boot for the lifetime of the
system.

Drop the reference right after of_iomap(), since np is not used
afterwards.

Found by static analysis tool CodeQL.

Fixes: 312b62b6610c ("ARM: mstar: Add machine for MStar/Sigmastar Armv7 SoCs")
Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
---
 arch/arm/mach-mstar/mstarv7.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-mstar/mstarv7.c b/arch/arm/mach-mstar/mstarv7.c
index 871c0fd258e66..64262b8f10a0c 100644
--- a/arch/arm/mach-mstar/mstarv7.c
+++ b/arch/arm/mach-mstar/mstarv7.c
@@ -117,6 +117,7 @@ static void __init mstarv7_init(void)
 
 	np = of_find_compatible_node(NULL, NULL, "mstar,l3bridge");
 	l3bridge = of_iomap(np, 0);
+	of_node_put(np);
 	if (l3bridge)
 		soc_mb = mstarv7_mb;
 	else
-- 
2.43.0


