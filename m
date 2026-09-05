Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356F5C79F90
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 09:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8xnteEJpCubomPwB6glv59IEZPm5BMjzUqWSxe52tsE=; b=0pRo0tQGHcBPi2gtm8KSisttK4
	PeNODwb+z31qZV7E4LYhD4hHc0EdcInotVNOXMYsYEPT2RZFjzYkZr3IGXPJcRupgntKWUKHdwzZO
	mLPL/y7whGQE8FC2zXBup37F2r7zZE4iID6o3WwUmfzKjGNcQg2JwhZsSb/yLD4AoLZwuBe1AvOWv
	Xw2slN27pJjgrWSQTTEGT//AifY03oaQYFxtFVitKme/CWBAJs+LEckgRo+UaV7wZ7Wc6dFZc3wzb
	1tVy9MuNYrTA5yjSE6UPE+SE+gbU/wMyb6uvdQmoAN8nzh1gFevJ/3Jh6R152XZEnFJ8ALHcnauTC
	yQWjtvXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2mzY-00000003wO7-3IkM;
	Sat, 05 Sep 2026 09:47:20 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2mzU-00000003wJY-12je
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 09:47:17 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48586861639so1303852f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 02:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601635; x=1789206435; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8xnteEJpCubomPwB6glv59IEZPm5BMjzUqWSxe52tsE=;
        b=K545te6VXqzc4hw6wMg/UDkJAxV0TNEXS0VLjGDku2r+QjM1gf29faCB1eE0M5J5M7
         P0+o4C4nQfn6ZmSwYYcOaB43d8t1kDnpN8U/c6NI+5umEWIokrX97zPkN6x039/3vJXh
         ZQ4/fncStcuguMiqCDv0Crz/vUOzsH1rKffqr5wpGa706zrRQq6t46Ymi97zOHedQP+2
         LktNz9AYjYVocAPB45OdiYIVpla8j/3UJiDR9mlL6eBO25i9JF8VrLrVo3m+gOnhHPMq
         ZFcRS3dyciUS82rVZGNFj1izA01lGnOzY/UKvNz/FLTd0P+caRrKEdmK7temcTOsKUwD
         rmFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601635; x=1789206435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8xnteEJpCubomPwB6glv59IEZPm5BMjzUqWSxe52tsE=;
        b=jyd8J7OOVl+OupShwk7TLBAFfEep+JwyWdOsZMN8E9reRZ1/BtZa6WXEoAheqHDBK/
         jgF9O/Mh7gxOcV+vO/LxBG20kniLQl4hDWS22ooYXlQxwrH7tt2gL3KgvzcN9I7jaXbC
         AOSI4kKOXfm5ljDMWiZENEoEatR01CuMirkRpdxwYTF3laSKOxZXdOSjAKjSz4GekOqe
         J+zT6XVENAzb4enmXloOZtdC0Wfvm00aFAdcmlBkQtmnniwu0u9Wzlrox8bAb4F/S34J
         taopevbyJA42B9iba4M3cE7Jwd2ZsO6v/x0Qwhwvt4+NwUc45S0Nuk0FEHnfxkloGLT2
         eorA==
X-Forwarded-Encrypted: i=1; AKwUvBykFz84olZrL2AXM2R1DqJu66YL5GySLte9lEQmZ39qSrgAY9grDxkPNNu15CchJYgNF/BfzxPJx3SAFIYihaaA@lists.infradead.org
X-Gm-Message-State: AFuF++kGSeaUxD05DNbYtkcQw+bFRjNZ+Gn6yoa7at1jwhEGImDGim+0
	tL6nfE47dE3s0EHUj/yhBELBqn+zQ8gAntla6/dK6GLc5s0vE94ac36q
X-Gm-Gg: AYBFou0n5cIBaV475DcRsUwhNPlaTUXKMzXhrgMAyuuKeSedypyHNeL+MoYxw9MIwxc
	YIZGiZxl9TsOkAGfZtQ2pHWBnFv/I1Bh3h3+Mfd1MOb0OOfwUyuHl41QYGWv2PNsQS8EBg+H0ON
	JixWJZ9k/rfREIPw0G1h7Mcq6CfUYJjqijRm4JWsTsaPsyWQT/4jH9fy0TapOPTQbctSgCJ44Gc
	BBc+7CuKaiSvEQim5jAVJ3e98lXOb1CnKV6kpmSY4uv7mtNViyblV2IiF4PCPWT7bplw4lOREhI
	e9lNZs21NIuAZiCUZt0tTTFcgcKSWaecVne8KXNSwcnS4WpumNEHxJc8H8onskKlIvGikuPFivk
	ZFg2FCrQxKyuImX2EJJF9+l9K+B1rwAStxtNCSL6ZuP4p/zHa1bjlYw62kKrS3BwokA+o4cddDD
	XUbqqH9xzSfgPwS9Acwkc0YiZlzBJX89t/O+8pt6ewUT6diCPopRyord3+qE8TlDEkSUxnWEB1s
	HjB8qeO8X9HVvVFhUhZ5yJLpp+sZQkj1OjMSjdq0HxQnm2CnGPzjDdyWl7I6AEGhcoYppHZpwq0
	RowD241gmJCng1dT8Dw5+kv8Wfv057lHFmGgmKDJk7j9Yj1Q7N48RWgpmVTeWoGG3X4=
X-Received: by 2002:adf:ecc6:0:b0:484:49f8:b56a with SMTP id ffacd0b85a97d-4857e4f4adamr18253955f8f.8.1788601634554;
        Sat, 05 Sep 2026 02:47:14 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm14232013f8f.25.2026.09.05.02.47.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:47:14 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Steve Wahl <steve.wahl@hpe.com>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
	Mike Travis <mike.travis@hpe.com>,
	Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Tony Lindgren <tony@atomide.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-omap@vger.kernel.org,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	linux-ide@vger.kernel.org,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Michael Schmitz <schmitzmic@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 8/9] docs: kernel-parameters: Drop the pcmv= entry
Date: Sat,  5 Sep 2026 11:46:48 +0200
Message-Id: <20260905094649.41996-9-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260905094649.41996-1-kmehltretter@gmail.com>
References: <20260905094649.41996-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_024716_297371_2E1AE9F8 
X-CRM114-Status: GOOD (  10.88  )
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

pcmv= went away with commit 7aeffbf2ddec ("pcmcia: remove unused
pxa/sa1100 drivers"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: 7aeffbf2ddec ("pcmcia: remove unused pxa/sa1100 drivers")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 48dd273eaf6c..4864e37005be 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5311,8 +5311,6 @@ Kernel parameters
 		nomsi	Do not use MSI for native PCIe PME signaling (this makes
 			all PCIe root ports use INTx for all services).
 
-	pcmv=		[HW,PCMCIA] BadgePAD 4
-
 	pd_ignore_unused
 			[PM]
 			Keep all power-domains already enabled by bootloader on,
-- 
2.53.0


