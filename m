Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD07FD6C29B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 21:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O3o7KNI2hGFv6gMwjG91XpYbsNxBQO475xkwrT8XXYM=; b=43VbQvn1WDC+oDN/4BGHYr9AaX
	6sUxOApYlT/MuKNjL0YxOqvt2lVX5xVfYTnlIpT0RaiNxeXV3z/+xNqW9QCIVYQqiVNJ9fM4FKYnM
	BSmjIE5Gdn1s+xzuSvhLdybYsa4UJEFgbXjDodMyIxuuzepYtUasxuEq4kDhrFV1T1gmpCU/SsysD
	qxWsYfWB3oE26F8CHDKLaMe2HPF5QeTXDUvz2niFbwPXMIzy/ettE0d6owPFM9bAyqVYKWrQt/en2
	VIDtsvqCCJwL3Ar3E3/GnayeSlixACH9ZNGhVn3ye3xKB1bKHX/hQa1NGdbllm2rj2K7dTOma/vnz
	zLqdi+xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDVqK-0000000DouX-42u5;
	Tue, 19 Nov 2024 21:33:04 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDVpO-0000000Dol0-2T9E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 21:32:07 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-7eda47b7343so1077300a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Nov 2024 13:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732051925; x=1732656725; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=O3o7KNI2hGFv6gMwjG91XpYbsNxBQO475xkwrT8XXYM=;
        b=T5ZWYfqz+B3a7UjJSvqXf5bbwuQAEb/nai/Hgpsc3u2URk8u7iDhmTRqKj9+zeT04w
         6Zwa5mjPai816WMrx6PUbXj2EmF+NTsMLU9Wp/beWBj1VtrUzUZhfQt/pDdTQmySJtt4
         Aig4E0JjyNVMNd2G5LN2OZmi+/FQcNiyF/+hJMpftwKrnxWk6kXvpGGW3gVkZQC0Z7gf
         AtefiXbIPYu9rE+m1ciSBjGPv6znzn4rPVZ81snaH6YgOpZaQws+dfi4qbOWZfZuOnl8
         2IqTeQr6haltJS5TLUtqCoxXZRu7JNbdU6qBgPqJ8CR0zRKNR6dEIZflMGdaTXJBipT+
         dj2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732051925; x=1732656725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O3o7KNI2hGFv6gMwjG91XpYbsNxBQO475xkwrT8XXYM=;
        b=giP63kUbG2uJFNElNSfHUij/aDiRZI19nMqq0Iea+k4cuKk9mnANNCcSLy/W8LdLdB
         nBy6WlK+H3RH0J/CW6HEBe91N2Ao03V1jcxCsTQHZQWe8XVWXHF+00MJPAuIfKgawe2I
         38L7Tn8EDmJkgbYB0ToNHJBiUtv0O2lZmCR30M3R8Hwrs55bqQ9SUIK3PFlj408tJ8U+
         BUABdO5bxZtD1e0kFsasdQsEYu6EdYx4g/gWYQ4v2uJDJE4RL+v3E3+t/JgsDCwZY6fm
         lmIlImPwDw9V9WsbEpdR0WUKW9lie9etMi3Cvg2DKmVb9ECN9q/7dCIVhY4lqECMJCgR
         VOOA==
X-Forwarded-Encrypted: i=1; AJvYcCXoEXw56GSJecP5hm+bTazkSERFZn3GcfZr4hkq+8opCFY3TmyhfbxwnidElgWitblha6BYj8jMut/AR6XVvQqB@lists.infradead.org
X-Gm-Message-State: AOJu0YwOVpNrRGk82pPGk7GIi3VUVC/r2uYoKgsJf6hfQ0TdRHMz7kC9
	Gp2Fa0pr1oAVobB94qGxGqgNbIyCxbNRkARL7yDvQRuvTIIsythRHs2Csg==
X-Google-Smtp-Source: AGHT+IGjXTrCZrjFrmwL8uPXmyNLdwiSuGIuCddplYQq+V8h055S9uTuHLjnVk9EnmuINXG/Fgexng==
X-Received: by 2002:a05:6a21:8ccc:b0:1d8:a3ab:720b with SMTP id adf61e73a8af0-1ddade0ad86mr926004637.9.1732051925108;
        Tue, 19 Nov 2024 13:32:05 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f8c1c1752csm8275765a12.4.2024.11.19.13.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 13:32:04 -0800 (PST)
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
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Steen Hegelund <steen.hegelund@microchip.com>
Subject: [RESEND PATCH] net: microchip: vcap: Add typegroup table terminators in kunit tests
Date: Tue, 19 Nov 2024 13:32:02 -0800
Message-ID: <20241119213202.2884639-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_133206_624488_39AD0B9C 
X-CRM114-Status: GOOD (  11.77  )
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
resend: forgot to copy netdev@.

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


