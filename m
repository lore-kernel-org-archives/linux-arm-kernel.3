Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80DEFCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 16:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n4P5XrME9c3SWpKLIiNC29eNfEaqnPTWRx49nOE3Gwg=; b=P6D9cb0v9d0MryjPR27wcZeyf/
	4SqBeF6wrGUHxqILsjB1nXwNdpH6gpLjnsXli2Inh3YHDp4G04nMFOBXfpsL5f8UFZ9tqg+WWQxoS
	4vimUehjz39qodQ68bLqzZMsJEf42WlGWM3Fgx2IGsD0N6YWRXDCarXc5ffbOlBczr/HCGfNr4EvR
	uCac9MhmEkTDGlh6G71aIppuJ8Y4BpTqbWIt0npLHxBYsunFmMJxnbHGqmiYvhvrkfYN+IKiO+M2R
	uN7qk25gYlYDjSyvV6yczVKIy5RUM9j3biYsfYhuyEXl2W+WlGn+QQjnHWpJ4DFN9FQg5SzPI4Vys
	SiaFT6bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJwS0-0000000Dkhd-33q4;
	Mon, 04 May 2026 16:47:20 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJwRy-0000000Dkgd-1Pib
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 16:47:19 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-8f231f3b130so301107385a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 09:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777913236; x=1778518036; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n4P5XrME9c3SWpKLIiNC29eNfEaqnPTWRx49nOE3Gwg=;
        b=tNorZLssWDlGgC4qKTydYkqohUsBuPBZDHJh5irCnN6woM7P+NiTpJc5RJzV2V09PW
         J+E/SZleFG0YEBrdq0l8HNON+a94b+0TDJFQTntKo8wdC/V/fhhkAr+Z4q87LOmqGgvf
         LOzR2uKczjIbJkHl0YmBT6Y1zIHhANpXSg90k9+d/lokbqQAmJFHb1mGwOmvdinf44Pt
         DhO4AZlJ7QGHLIobVDanXVk8RUM3FpEw9aeB1CjYA5wET6aJwp+kl+ai8L6yhfNETHZ3
         AlaI2H23m9o5GoRlp76JhdtwBneXnPgplXo/oJKt2DPoe47qqPCxvPv0JE5rz+ttaAfY
         vo7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777913236; x=1778518036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4P5XrME9c3SWpKLIiNC29eNfEaqnPTWRx49nOE3Gwg=;
        b=OXSP5aQy9EWLa6B527X+4TZUjDzfr+nkV/gSddn9bnPgTdYL5OdX32ZtPPQdFGDc3L
         bQV3ySSjCQCxtX0G1sEuEBdTI87JoHAh3jpfNogzrbGdY5ryOOkvXMFgHOz9WIGnyqol
         V4+Z/J5EgLsAf3NlJj/f6Y8jywmK1nW01T59x4HZCYFj84IvHKcQqmOsLYW474E6jEk0
         3vFruH1y7TxnstJ+B2g+yHixSxnA2v7n03wunUP/4BKAd7W79jeOVuuhvFhva2fMfUYo
         gvUk2KIkVMQXWdRfkULkfNqRZNqmUP6mcbDV2YelyHlv2fwQW6yvUb0dNhk+KvItC5Dj
         Ep+Q==
X-Forwarded-Encrypted: i=1; AFNElJ+DyyaTrZW5OJYLUst2NAO9Y27l0FMp0aWEC46YSEvsca1UZIy8lAYnJ0rBFQDjz74Qzb4hBO7TJxPjfhm8JpuV@lists.infradead.org
X-Gm-Message-State: AOJu0Yycmp65WBiSxIJFcVMKykM0C6wJN1VfTd4Y+4dVEyCagaPtsxma
	gQTArOoGoiDk5DZCNNTghDxoWFzn1yV4Qkynh8d9amIxxzyqiEOG6HB9
X-Gm-Gg: AeBDievKkgdZJykKXd680JA000eJosVkVN5gUD3F/Bhx+zl/zB6yJkprPJTdqQ1zfKc
	WRELHvevdhq0g5VH92OYafhmKXxQZOTy+ivcEWHpBeDj3wkrgS1igGpWN1voFT+WEwZIKGvCVYn
	B0OXPHnYhh5bH0hHxZP/jIqwzgil/uTL4hSsCFETXq2yWntYQ5wooeMPBj9ymxcbe4nxp//j6EQ
	UdyT44BxsPKcYGrdw6GxK0vsnZ+07UdwL7RiLLRLl+LCrqIat2fPLubGMinEnWvNGknp5YPdmjk
	lKAXopssboSEcEq1pHJbRT+J3Am7nSFX1LmEZBGDsiWDpWEh54Q27Ll98qIVXhH4NTVcK9zd5Vj
	iC5yFklJH1Vi6SPlCZb2KnmT2JWiucfJts68L4m16VfsiK94qJQWZ8Ekaa60MrW2TcYLgzsQ4kh
	3LIm+qzCOim3yNgPndF1FTZjDPqBJ4hAJbJ9H7OgtR+32tww+tC98=
X-Received: by 2002:a05:620a:4106:b0:8ef:ca26:dcf8 with SMTP id af79cd13be357-8fd12d929cemr1711202785a.0.1777913236290;
        Mon, 04 May 2026 09:47:16 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2cd04de9sm1116747885a.44.2026.05.04.09.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 09:47:15 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Paul Walmsley <paul@pwsan.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] ARM: OMAP2+: Fix OF node reference leaks in omap_hwmod
Date: Mon,  4 May 2026 12:47:11 -0400
Message-ID: <20260504164711.2854116-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_094718_384051_8A8C3A33 
X-CRM114-Status: GOOD (  16.75  )
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

The OF helpers that return device nodes acquire references that must be
released by the caller.

_init() leaks the "ocp" bus node returned by of_find_node_by_name() on
all paths after lookup, and also leaks the child returned by
of_get_next_child() when parsing module flags. Route the post-lookup
returns through a common cleanup path and release the child after use.

omap_hwmod_setup_earlycon_flags() leaks the /chosen node and the UART
node resolved from stdout-path. Track them separately and drop both
references after use.

Fixes: 1aa8f0cb19e5 ("ARM: OMAP2+: Remove unused legacy code for interconnects")
Fixes: 4f2122473363 ("ARM: OMAP2+: Check also the first dts child for hwmod flags")
Fixes: 8dd6666f4937 ("ARM: OMAP2+: omap_hwmod: Add support for earlycon")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 arch/arm/mach-omap2/omap_hwmod.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod.c b/arch/arm/mach-omap2/omap_hwmod.c
index 974107ff18b4..03cd523dff87 100644
--- a/arch/arm/mach-omap2/omap_hwmod.c
+++ b/arch/arm/mach-omap2/omap_hwmod.c
@@ -2331,13 +2331,15 @@ static int __init _init(struct omap_hwmod *oh, void *data)
 	if (r < 0) {
 		WARN(1, "omap_hwmod: %s: doesn't have mpu register target base\n",
 		     oh->name);
-		return 0;
+		r = 0;
+		goto out_put_node;
 	}
 
 	r = _init_clocks(oh, np);
 	if (r < 0) {
 		WARN(1, "omap_hwmod: %s: couldn't init clocks\n", oh->name);
-		return -EINVAL;
+		r = -EINVAL;
+		goto out_put_node;
 	}
 
 	if (np) {
@@ -2345,13 +2347,19 @@ static int __init _init(struct omap_hwmod *oh, void *data)
 
 		parse_module_flags(oh, np);
 		child = of_get_next_child(np, NULL);
-		if (child)
+		if (child) {
 			parse_module_flags(oh, child);
+			of_node_put(child);
+		}
 	}
 
 	oh->_state = _HWMOD_STATE_INITIALIZED;
 
-	return 0;
+	r = 0;
+
+out_put_node:
+	of_node_put(bus);
+	return r;
 }
 
 /**
@@ -3608,13 +3616,13 @@ int omap_hwmod_init_module(struct device *dev,
 #ifdef CONFIG_SERIAL_EARLYCON
 static void __init omap_hwmod_setup_earlycon_flags(void)
 {
-	struct device_node *np;
+	struct device_node *np, *chosen;
 	struct omap_hwmod *oh;
 	const char *uart;
 
-	np = of_find_node_by_path("/chosen");
-	if (np) {
-		uart = of_get_property(np, "stdout-path", NULL);
+	chosen = of_find_node_by_path("/chosen");
+	if (chosen) {
+		uart = of_get_property(chosen, "stdout-path", NULL);
 		if (uart) {
 			np = of_find_node_by_path(uart);
 			if (np) {
@@ -3629,8 +3637,10 @@ static void __init omap_hwmod_setup_earlycon_flags(void)
 				if (oh)
 					oh->flags |= DEBUG_OMAPUART_FLAGS;
 			}
+			of_node_put(np);
 		}
 	}
+	of_node_put(chosen);
 }
 #endif
 
-- 
2.43.0


