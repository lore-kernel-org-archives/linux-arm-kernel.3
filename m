Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CFACD342C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 00:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vwCjmYDQDSbhK8A4q1s5JLoAl5JvbkQVBgszjF0OKGo=; b=MLxBHX1j26OzarB2CSxKsAF/E+
	Kwgg8LMnLSAjlcQASGbzxs+s7/PeSAexTu9EssUlVqYbvn3yfS51Yz1y9Rfj+48SyYGVv6t/x39Gz
	X2cro86NAtC2+snQz5ZxLRqM8szPB/Z0/+zC1nf3/Ct5/gcgd1zM8F8cW5SA/gJ3LzxMPrYys2NSQ
	8bPngy/F2w/EqJlbs/o1oJ7r9e4SLK2Vfd9AqYa88Fl5bYV0eYAgNNa/CwMTJdABdIcj2ec3H/FCY
	Etrc24v4WSAoUtEcHH64vdknGb55qaNSVtn/PSQVOFq0RlWHzWlzFHuxxQQ+Eum9BwIhdoHQosy32
	0Hw7zC+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK3ig-0000000EjA1-1N21;
	Tue, 05 May 2026 00:33:02 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK3ie-0000000Ej8N-0QOq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 00:33:01 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-8d736211595so319102085a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 17:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777941178; x=1778545978; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vwCjmYDQDSbhK8A4q1s5JLoAl5JvbkQVBgszjF0OKGo=;
        b=Rtln2Rc4Vm33/pCW6p16uWm2WzsyU72eX3iQ0cFD+xDhY3H3w8rqZ1WJDbhS9pZ3x/
         Q9TXnGsK/lKaUbhHvyvKnMY+0HG41Isa9sVGT8N/rPfk10EAfF0jHrbnCTGx3+ijtuNz
         OumD7pKr5ahhTRnYuJk80PkL+4+CxE0jF7U2OPBhADOF0LTJhULa+A4oNVH6zUTmixpW
         O1y8Q9H2D3kvFKWw9uCL3c/s0gqzLlfvTTSENbnRZm3qWGAsc6PpceAAGS2DOqQuSs8F
         nMeTm9kuZCwpKYm4jfbM3X6rnDF7XzA/+fE/pDW+W7XTBYMgAJZQ5Vo7PuvcTA+V/DRR
         83tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777941179; x=1778545979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vwCjmYDQDSbhK8A4q1s5JLoAl5JvbkQVBgszjF0OKGo=;
        b=AE5L6k7bB7eg29BPvcsFTcq6ui0JB+8kVz6kJGlV5MI6sE6C8/zd3n8cFYYwDJ+p9d
         PhXUPyc158UfsZbxvXTtZEWGtgTir74ic5r4Fvv7TCB3sO+SrVqIl4mE33DYUon5xPq7
         PBi8dvIKUhab2T73YEhnAK3Gt4zF8kONJi/Z2ygrdhkseIaDpNAUcBm3XWaE3uogZN3g
         GZ4MmsQYpjqX6hNLuvfjXLdbSMSO39TMXp7LWF/bVUlM50e4XhuPJ0B08/Cy6ccj8aKE
         J9WdoD0MucZhLuKW6O9e3TA791e7Z2uz1xx1M/5kbcTsYO0uz+72Yfi9pU541tMVZU5y
         YgQQ==
X-Forwarded-Encrypted: i=1; AFNElJ//v5SIYvwxW9+MS2SV5LgUJ7dJPXwQ2c6moGuy0zQRewYB36m8VkjhJQJW+Fp07Ll5MKbUqKfzjWsYtrEQGIf9@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7QuEOFlhkEOL7IaQBJN1ymBhEvIHUcrLNj7yd5TcANND4XNG3
	QQxF1DS4TZbM7oMDHmk4pmIVJEYL3K9sr90STobPfMwt9Gj5NBSVmSj7
X-Gm-Gg: AeBDiesP67GUlsYiwVc9h7P6SljSu5TCQbcwYgbACqLm6SB6/II5q1nBqakOb/AXXsa
	8UAYnO2uRBxkL2XtnWRn5RkgO5EpcpD+245T/FmnSulHuUtnK3quGXnksLNelJ42p5Iyxr9Zsfc
	VGKKNrZJX4u5h4fmG+GAdUy6S9Uml/cHtT1UlsI786bFKKnjPXXi5MIymqiZNz08GpNYKHg0X1z
	+/2xAFI/M6q2qnmP+ULiT0AeOGQe5MBstFJglTwiLz0DA8V+er1l5jTHSpV6ca7c0m3mruF+V9Z
	h0+aa1AqGZIwNy/+Na703PlxZ1LopVjExIYg8YT3anM4MQwP+mko1oWv3BAphp0ycE/k+iu/Emr
	ovxPe69DboBwhJru7h8IF8F6wluZ9Ie8pW9Tsn6r1iI4RLHyfpaz7pfBiPmj+yzAW8dbb7el+o4
	uPlEkOIwy1AI6TKWh/goMNScwS3IN2PCVPbxcy+viWGh2bTdbEMYY=
X-Received: by 2002:a05:620a:470e:b0:8c7:a53:4d17 with SMTP id af79cd13be357-8fd16aa5ebamr1929138485a.21.1777941178516;
        Mon, 04 May 2026 17:32:58 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2938e0b9sm1178632485a.9.2026.05.04.17.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 17:32:57 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Nishanth Menon <nm@ti.com>
Cc: Lee Jones <lee@kernel.org>,
	Kees Cook <kees@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] ARM: Feroceon: Fix OF node and mapping leaks in L2 init
Date: Mon,  4 May 2026 20:32:52 -0400
Message-ID: <20260505003252.2886028-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_173300_162917_797C2F0C 
X-CRM114-Status: GOOD (  12.69  )
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

of_find_matching_node() returns a referenced device node, and of_iomap()
creates a temporary mapping. feroceon_of_init() currently leaves both
resources around after init and also returns from the of_iomap() failure
path without dropping the node reference.

Unmap the register mapping after the register update and put the node on
both the failure and success paths.

Fixes: 4b8f7a11c9fb ("ARM: MM: Add DT binding for Feroceon L2 cache")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 arch/arm/mm/cache-feroceon-l2.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mm/cache-feroceon-l2.c b/arch/arm/mm/cache-feroceon-l2.c
index 2bfefb252ffd..1fe931a09d79 100644
--- a/arch/arm/mm/cache-feroceon-l2.c
+++ b/arch/arm/mm/cache-feroceon-l2.c
@@ -373,16 +373,20 @@ int __init feroceon_of_init(void)
 	node = of_find_matching_node(NULL, feroceon_ids);
 	if (node && of_device_is_compatible(node, "marvell,kirkwood-cache")) {
 		base = of_iomap(node, 0);
-		if (!base)
+		if (!base) {
+			of_node_put(node);
 			return -ENOMEM;
+		}
 
 		if (l2_wt_override)
 			writel(readl(base) | L2_WRITETHROUGH_KIRKWOOD, base);
 		else
 			writel(readl(base) & ~L2_WRITETHROUGH_KIRKWOOD, base);
+		iounmap(base);
 	}
 
 	feroceon_l2_init(l2_wt_override);
+	of_node_put(node);
 
 	return 0;
 }
-- 
2.43.0


