Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8F3C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 09:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RKMxlaeTxaJWI4z9WHO98X3QgiKdQ3qKVb7b/rUt++I=; b=plhMbRBdY91pD1Q/FAtg82bXqP
	gAY2vIpgoWyR8ZVK/2MYqydBkgWEmcDZtxv/T5qz+Dn1p3kt1uWQnC0FixB/zi7rgIpE1SVMG4dC5
	BAmibGr0SZhb0i3O59I8rGmEa5gHiy5JcciOGx2w83Q1w0BidGtPilC6gR/4CxA1yrYONOvFhzXvf
	ynZ9xvrszAGXaj/0hQxfCAgUJ9GtnTI3U9EG9f186/P9bjKkfZikhLObatAJerL3KoWHN/K09J8lx
	HyifNlApBhsw7wPr4wyla99HM911QlEFhqY11ymRJp3+hFOTxssSZeE3ICdu+kaOGPYlxJlKg3HBR
	1jYTQNlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzBdx-0000000HXYF-0m1D;
	Mon, 31 Mar 2025 09:41:21 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzBcF-0000000HXJB-0daA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 09:39:36 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-227cf12df27so60280605ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 02:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743413974; x=1744018774; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RKMxlaeTxaJWI4z9WHO98X3QgiKdQ3qKVb7b/rUt++I=;
        b=PoU+0rLXbZ5+s7PDKv70wAUj0Zquv63UKQhE8F4KdiLLmm9I3mmchebpZRD+mBeMCs
         wdTBcZHHd4OGcYFI1ipXQ6l0yxtyqNXjb+Bc0Nq58M+sM8x4/ux/4xb6WYUdmWqPF9PY
         arug1VHdMcT8HB8c/dlAq/Kz1cBgNr5T5XyvwSrnp8vJZznvm3SHRfo4nYUXK/ltjpQs
         bW5TBuXnOfce+2Seu/Dr2stebiw2bK4sLSiiSVKMX1MO1fXRGYzSGPgVRuBaecdagM/N
         KOPorTR45/8WE937H9+8NdfHdpf8Y0d1vDuOOSrvL4L8giNrazL4QwSAOPH2eiS+UVuF
         AmEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743413974; x=1744018774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RKMxlaeTxaJWI4z9WHO98X3QgiKdQ3qKVb7b/rUt++I=;
        b=k+EcF42xbuGFCryxGIQIre12iJkg3piHGDPRcsjZKryqwYxqpnP6uDALwOxrXIk6nQ
         iGC1iyn91S8mmkN8KuDxgdpfd/tsbXPpKd7p09Ay/JznnHK+Qj8UWT7+t1EIxwMF8f2y
         fJc9K2JKF/hAQB5I/vE4zMwTB3XZj0gQ8MmCpLzwvXtXJ0gDRciR02Zs6iI8/3wf2kCa
         K10hStD0i9ybe9YugJ8kJNppjyRtkmLgn6vCY1ytky5M7MJN9elEqG71DaTluzuyHbix
         tg9MtHtCIZVwXKPiK/4X3Pppb4aQLv44BfmBZdV71hrOIqZebsg4cVyEdUW/g8hIyn0g
         fhZw==
X-Forwarded-Encrypted: i=1; AJvYcCXuOKyx6zW/6eYlMweAqRUr7MS180ZIbTI9ezIywDixvZXPbVbviqAcOMmcJnRtbrSB6uRcsfzrtxsY6t2+PPmF@lists.infradead.org
X-Gm-Message-State: AOJu0YyZr04IJbnsNDvexKyAtY1cxCZA9qXUIjgEiMRjJkCimdBgBUGn
	uLbb++IdxONXcmKhzqpoDHvcKuyrpuRFcqi/ZbJAEcNqcG+veg0JK9XMedwVnzlslq8p
X-Gm-Gg: ASbGncviiXYEC+TLkSz5c4jssO4xNoJcP93kETAfIKqXvUSQVerYQXxc+JUy8J5Wo6a
	7eHVV3Tp8nYQYbWnvvzxqk+QSRY7YXdskFnI58NgpOjSqKa/F3Wq17b3cjysLlJDmf+IyjFh39r
	zQwPWDxrs2GHDAI5Tn/sreRcP72LMx+FtPROVx3R3nhavWhqNiwZKSn/3lj9T7Jt2k6VRio6oj9
	1zzFZ2zqzpxo+AAf/AVfM0tNKokS76qqLbKW2hhY5ZBQ+4ennhK40TxfAGGhw46I7arECChmLiO
	piAG5YLmJjBnE6C3piR2xUvhKOHUSulzPd4HJOvasiBVntMcY+CAKnPn2KDDi9akewykZGI=
X-Google-Smtp-Source: AGHT+IHaTuotKrQ7H6Jwshz7QKSz02e2BY1SJ5EVZ81Mmzdz+0YDdgOAsdLuQKnlKlj+InQ4FWeA1g==
X-Received: by 2002:a17:903:46cc:b0:221:89e6:ccb6 with SMTP id d9443c01a7336-2292ef33b00mr156170785ad.25.1743413973635;
        Mon, 31 Mar 2025 02:39:33 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1cf93esm65083725ad.154.2025.03.31.02.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 02:39:33 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: herve.codina@bootlin.com,
	gsomlo@gmail.com,
	heiko@sntech.de,
	andersson@kernel.org,
	u.kleine-koenig@baylibre.com,
	bsdhenrymartin@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drivers/misc: Add NULL check in aspeed_lpc_enable_snoop
Date: Mon, 31 Mar 2025 17:39:22 +0800
Message-Id: <20250331093922.7735-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_023935_188365_65A6CE13 
X-CRM114-Status: GOOD (  11.23  )
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

When devm_kasprintf() fails, it returns a NULL pointer. However, this return value is not properly checked in the function aspeed_lpc_enable_snoop.

A NULL check should be added after the devm_kasprintf() to prevent potential NULL pointer dereference error.

Fixes: 3772e5da44542 ("Aspeed LPC snoop output using misc chardev")

Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index 9ab5ba9cf1d6..376b3a910797 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -200,6 +200,8 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 	lpc_snoop->chan[channel].miscdev.minor = MISC_DYNAMIC_MINOR;
 	lpc_snoop->chan[channel].miscdev.name =
 		devm_kasprintf(dev, GFP_KERNEL, "%s%d", DEVICE_NAME, channel);
+	if (!lpc_snoop->chan[channel].miscdev.name)
+		return -ENOMEM;
 	lpc_snoop->chan[channel].miscdev.fops = &snoop_fops;
 	lpc_snoop->chan[channel].miscdev.parent = dev;
 	rc = misc_register(&lpc_snoop->chan[channel].miscdev);
-- 
2.34.1


