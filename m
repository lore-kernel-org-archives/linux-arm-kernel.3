Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B89D6C291
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 20:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IuBF/jyZa1fWhByoPH2uDt0SCQ6NW4jeLx2e8mQF3JU=; b=CqGCli0SlZG4l3wD5WjzZgcG4h
	3iq5mwiRRbcXt+N6tRR5nmhq114koO/gVsgdIYzyvZA/k9e33s8lnMouTz4ddfI1UiM1Ghes9yk5A
	mHlAUrodubYG+zYzzhxNb4HlHXVi4yQGGyTiIQ7hLkdLDgNEHsTnw7FFHxoBAGWh++017W8hvYsD+
	dg3ffjioUxFkys4E/RozRSA2pHPcbhI41FcozzZB5BtLtNkbeSGfuKNMWY/UdqaSf0UfYzkFxtnj4
	QtF8JThf7iHljkb08Tyn+dvmRkiEZuf/9GyL74d6pas/iYUZM9eagp5bsWDHWvhTq2dXKaGK+p6JG
	r2f/onpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDUZT-0000000Debn-0eEm;
	Tue, 19 Nov 2024 20:11:35 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDUXp-0000000DeEa-0gCn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 20:09:54 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-21262a191a5so7310455ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Nov 2024 12:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732046992; x=1732651792; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=IuBF/jyZa1fWhByoPH2uDt0SCQ6NW4jeLx2e8mQF3JU=;
        b=AWAUQvXpI9jUg+bscgLZbT4u2mA2HVZc1Akw9eeYQE0XP9N1rKRwmoIu/YhbBOCIil
         fr4QiOFkytkEJa0ZQ9j5dsJc+/I1rWATGXgnddtrWCt7xPeHoU6dtMe9uBWUhOicCFQN
         MSue/CwBkj3ab9U3RLtCGh1GCj0I8rN9qr56yeBcNfl81VAUXedy2hCo9BFnfRo/5BQP
         miFMUjEiXaKXEyIYVN6h35cjD+vIsIFfXcJfW/aDjirtK4olRxHXkb2vZWWcQw2qBdAu
         TZ/ekavj+oqJr/YblW6Chg4TnUsWrQ5yrzU9mpRCmIDN8Lok293HgFZdAIvjdZWdY4Ix
         nH7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732046992; x=1732651792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IuBF/jyZa1fWhByoPH2uDt0SCQ6NW4jeLx2e8mQF3JU=;
        b=DNEvwnl76ob1+DauOCXLX+wK+OCL0wsCRCK3SY77hrcNlZ76c9z/lswQc+lIyh18Dd
         H++p3ClpochzND1e4zWrCMgU+ddECspkDJK7QrDuwjrxmT5zxHuYjcekRwHGh/JKS+Wk
         wnENytnN7YbktxHosaIiAK8CjliZlnPcSz3dj1Xi1KWCU/ugV/ArJNdu5aCY77O7k9/a
         biK0uOIAXh1QrdATUBlJAIE7md/uPldmAoUQv7jKmYBom9qB8xI213SuJzJEXZ0GzgfC
         rZz1UscMOm9z6hh4jIBwh7ubhcWM5eWcxXB/8zoyXVGHeHeP6MmsFhGlE07KpsjIGLU/
         3i5A==
X-Forwarded-Encrypted: i=1; AJvYcCXySDpbgZ+9qDgA36UCn+0cEFmklSbPpyNPb6QgHDA3fYTLdJ+gM3RBO3b06uNgsKLHHl78bSQmGxvcPI83sgN6@lists.infradead.org
X-Gm-Message-State: AOJu0YzgPKe3tYnzVImU4S48ySygRjO4wShBmErhJgDo2NGkpr9NVdhB
	Y8le3owXNOTLJQiO7PipWnp+lm8CjnnO3Rqy1CSOvNCyU/Q0AB/h
X-Google-Smtp-Source: AGHT+IHSJbQQzEacbk+aDI0c9br9UZqfXoKQDJaJdc4lpo48KzIVZ5DrNO8mFyN2NrkRl9vX6v2KYQ==
X-Received: by 2002:a17:902:f549:b0:20c:ab33:f8b8 with SMTP id d9443c01a7336-2126b10c8eamr362545ad.15.1732046992126;
        Tue, 19 Nov 2024 12:09:52 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2120c7224f5sm49006665ad.189.2024.11.19.12.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 12:09:51 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Lars Povlsen <lars.povlsen@microchip.com>
Cc: Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	Guenter Roeck <linux@roeck-us.net>,
	Steen Hegelund <steen.hegelund@microchip.com>
Subject: [PATCH] net: microchip: vcap: Add typegroup table terminators in kunit tests
Date: Tue, 19 Nov 2024 12:09:49 -0800
Message-ID: <20241119200949.2865160-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_120953_196697_02739B3C 
X-CRM114-Status: GOOD (  11.85  )
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

VCAP API unit tests fail randomly with errors such as

   # vcap_api_iterator_init_test: EXPECTATION FAILED at drivers/net/ethernet/microchip/vcap/vcap_api_kunit.c:387
   Expected 134 + 7 == iter.offset, but
       134 + 7 == 141 (0x8d)
       iter.offset == 17214 (0x433e)
   # vcap_api_iterator_init_test: EXPECTATION FAILED at drivers/net/ethernet/microchip/vcap/vcap_api_kunit.c:388
   Expected 5 == iter.reg_idx, but
       iter.reg_idx == 702 (0x2be)
   # vcap_api_iterator_init_test: EXPECTATION FAILED at drivers/net/ethernet/microchip/vcap/vcap_api_kunit.c:389
   Expected 11 == iter.reg_bitpos, but
       iter.reg_bitpos == 15 (0xf)
   # vcap_api_iterator_init_test: pass:0 fail:1 skip:0 total:1

Comments in the code state that "A typegroup table ends with an all-zero
terminator". Add the missing terminators.

Some of the typegroups did have a terminator of ".offset = 0, .width = 0,
.value = 0,". Replace those terminators with "{ }" (no trailing ',') for
consistency and to excplicitly state "this is a terminator".

Fixes: 67d637516fa9 ("net: microchip: sparx5: Adding KUNIT test for the VCAP API")
Cc: Steen Hegelund <steen.hegelund@microchip.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 .../ethernet/microchip/vcap/vcap_api_kunit.c    | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/microchip/vcap/vcap_api_kunit.c b/drivers/net/ethernet/microchip/vcap/vcap_api_kunit.c
index 7251121ab196..16eb3de60eb6 100644
--- a/drivers/net/ethernet/microchip/vcap/vcap_api_kunit.c
+++ b/drivers/net/ethernet/microchip/vcap/vcap_api_kunit.c
@@ -366,12 +366,13 @@ static void vcap_api_iterator_init_test(struct kunit *test)
 	struct vcap_typegroup typegroups[] = {
 		{ .offset = 0, .width = 2, .value = 2, },
 		{ .offset = 156, .width = 1, .value = 0, },
-		{ .offset = 0, .width = 0, .value = 0, },
+		{ }
 	};
 	struct vcap_typegroup typegroups2[] = {
 		{ .offset = 0, .width = 3, .value = 4, },
 		{ .offset = 49, .width = 2, .value = 0, },
 		{ .offset = 98, .width = 2, .value = 0, },
+		{ }
 	};
 
 	vcap_iter_init(&iter, 52, typegroups, 86);
@@ -399,6 +400,7 @@ static void vcap_api_iterator_next_test(struct kunit *test)
 		{ .offset = 147, .width = 3, .value = 0, },
 		{ .offset = 196, .width = 2, .value = 0, },
 		{ .offset = 245, .width = 1, .value = 0, },
+		{ }
 	};
 	int idx;
 
@@ -433,7 +435,7 @@ static void vcap_api_encode_typegroups_test(struct kunit *test)
 		{ .offset = 147, .width = 3, .value = 5, },
 		{ .offset = 196, .width = 2, .value = 2, },
 		{ .offset = 245, .width = 5, .value = 27, },
-		{ .offset = 0, .width = 0, .value = 0, },
+		{ }
 	};
 
 	vcap_encode_typegroups(stream, 49, typegroups, false);
@@ -463,6 +465,7 @@ static void vcap_api_encode_bit_test(struct kunit *test)
 		{ .offset = 147, .width = 3, .value = 5, },
 		{ .offset = 196, .width = 2, .value = 2, },
 		{ .offset = 245, .width = 1, .value = 0, },
+		{ }
 	};
 
 	vcap_iter_init(&iter, 49, typegroups, 44);
@@ -489,7 +492,7 @@ static void vcap_api_encode_field_test(struct kunit *test)
 		{ .offset = 147, .width = 3, .value = 5, },
 		{ .offset = 196, .width = 2, .value = 2, },
 		{ .offset = 245, .width = 5, .value = 27, },
-		{ .offset = 0, .width = 0, .value = 0, },
+		{ }
 	};
 	struct vcap_field rf = {
 		.type = VCAP_FIELD_U32,
@@ -538,7 +541,7 @@ static void vcap_api_encode_short_field_test(struct kunit *test)
 		{ .offset = 0, .width = 3, .value = 7, },
 		{ .offset = 21, .width = 2, .value = 3, },
 		{ .offset = 42, .width = 1, .value = 1, },
-		{ .offset = 0, .width = 0, .value = 0, },
+		{ }
 	};
 	struct vcap_field rf = {
 		.type = VCAP_FIELD_U32,
@@ -608,7 +611,7 @@ static void vcap_api_encode_keyfield_test(struct kunit *test)
 	struct vcap_typegroup tgt[] = {
 		{ .offset = 0, .width = 2, .value = 2, },
 		{ .offset = 156, .width = 1, .value = 1, },
-		{ .offset = 0, .width = 0, .value = 0, },
+		{ }
 	};
 
 	vcap_test_api_init(&admin);
@@ -671,7 +674,7 @@ static void vcap_api_encode_max_keyfield_test(struct kunit *test)
 	struct vcap_typegroup tgt[] = {
 		{ .offset = 0, .width = 2, .value = 2, },
 		{ .offset = 156, .width = 1, .value = 1, },
-		{ .offset = 0, .width = 0, .value = 0, },
+		{ }
 	};
 	u32 keyres[] = {
 		0x928e8a84,
@@ -732,7 +735,7 @@ static void vcap_api_encode_actionfield_test(struct kunit *test)
 		{ .offset = 0, .width = 2, .value = 2, },
 		{ .offset = 21, .width = 1, .value = 1, },
 		{ .offset = 42, .width = 1, .value = 0, },
-		{ .offset = 0, .width = 0, .value = 0, },
+		{ }
 	};
 
 	vcap_encode_actionfield(&rule, &caf, &rf, tgt);
-- 
2.45.2


