Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BBF0C79FBF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 01:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MYl7DgYw3pPECQ79mBvyISUl5xXzjI6JeiWJOfwAtIc=; b=H0R4ietGkyRVxFV1WUyFvxX5pI
	t3hqKn8dCugm3dJ2987rLNGo+HQKGfYKrNVpIl2W/iSJRU0bj2F24mDdsYa/FE6mGG9jiOatdXUZH
	LXH9xsMq2P+mPvEBX+bV4Dd4kJvUL5UZjTlyrOYSm2HO2I9d/J+2g5o54MihwuPzhRstyu0/PH6Oi
	F+S5Hh9Qt77aG66xagKJJcVYnPIULrkeLCW1ahCxkIXvgz1AqTAO8IRkXCP3KusyI0lX1YMQ2lHrY
	hNaMXsLfj8mZn2/x0iFe2b2Dn4ZyY8ZY//alzj5l+rE0KOwt2O+mBW3cCTJdM1eKmg1eUW55SmPAe
	Dv2F7gvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Tex-0000000DBqo-1DuA;
	Thu, 10 Sep 2026 01:33:03 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Ter-0000000DBo5-2J97
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 01:33:01 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso68933385e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 18:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789003975; x=1789608775; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MYl7DgYw3pPECQ79mBvyISUl5xXzjI6JeiWJOfwAtIc=;
        b=eoHl30BEhN/nQ0uFX/5Uz6i8GP8A/YHLNZii7PA2iiztjzR28HVheCKhh9f7880uZe
         X/rJfYGPeyKWBtxkHVa6P5SqTbx/4uzdOn8YyOBFXl3fj9MyodhS8dYn5IxCzMer73R5
         LudDvL0cvnWG3P1jEpjKCpHnFoDH3dqqUvHniO4TX67mlFsCaCmkGzPcGNjEocSlhSRt
         bGswvbOU/1EpbiG/hq9S+VxXrcWrbZpkEUziOjM/RyIpuiuW6Z4+8qJ0N2kBRGvqhl1J
         ATQoaekNNbsiMl5MO6mqcm+G/6PSS8x0qGXjMcNyhsP+SKkexlxCeMzpf7YzBHaEI4Mx
         qgYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789003976; x=1789608776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MYl7DgYw3pPECQ79mBvyISUl5xXzjI6JeiWJOfwAtIc=;
        b=ZcTRnI+a7kdbQJhDeuxpTKT7XaJqtTI1czqNELc/YNr6Dpkkkl8OM4mjpWEzcXqeHz
         m9XJRfJekU+Mlpf7/ErtMkPgrtkhf9jIul9BupwM1X1DFzfdZ6zgM0lZylxUiyMrBstB
         YfazknzBeBZ98xKLu6J9FtiLgNWTWY9xlenZXd3EcxV9IB33VVRKnwKD6ISyCjuGv2a5
         9e34vmaVnnJD/O97buVEZ2oaZ/DA8vrAQuledkiD9h9sJj912oFM7D4oUInskp0M5lbl
         rebcM0rWyUrFbRN1HqMvPBCYkG0xgRCGg08oUbhWDm/4zi3KoXaFsec4nXa5Ob/2uGI0
         Wyag==
X-Forwarded-Encrypted: i=1; AKwUvBwgzheHW4dKjxGNT5JCLK+qERkZHksyj0tX1UD4/Quo/zYLFGDbrMWiIobT2frnrk5z+6UPeDP4zwVWKrgH8fQC@lists.infradead.org
X-Gm-Message-State: AFuF++lTgJQsfuiGCqblFP3EV6+d74Q14sF4v/8dFYk8YV6K3Jzf3gFG
	m5hHVf+T0WCiwdBy70plAShTKjzaDBMQT1LuS73WucmrgMTLvYBXyXeG
X-Gm-Gg: AYBFou2I7PsZfH3oKKiOBk1kZi///iVlgz9xUWowdkFn+eoJ96i4SLjQSAJ+4fmW75C
	/xKF+R/H6xEQKFnAdhcGEzNt40WvtoiCEDnhCmJnoMhfsyA4nrYoIAvziEbKorn7eVsGBKDxUzT
	+QP/AqyeuVYTnVZ2cZR9u39rnVca1DU7iXJTChz5AykSjPUiei170DK/wp9hXtyowKNczxD4dFo
	eDG9HCYdg7xsgl3T180OIl6JUdzJLOgDLKsJR5VI4IZN2S2tgVnjIlQl6zq/1RbXXSvPrZbYz8j
	0LkkEjrhbxlXzdHToZvBr2Zz6SRFrdYJNP8bSPNHNPD0RB8zPorGOYebZ2kyBxFPmwh/GTL/zKg
	+RY2GzFpvzkb8s5R4i9f7hAfmTW/4uP0OAl5m1bgulo72Hj4ZCJLRPUjhjdmk0UOByPYyOhL7Bm
	dOfDsA5f7qpca1Wm/UTHNYn+Vk5w7X7Npltb9Hf7a4n6QIbErNg2xXpU2dN8V/mCL7wDrVl+pPE
	ubrSG6vcTLIQx2P2wl+m+st5oUN7O8MvFfJqB+FTEiEUTYxtq1d7/JAdbbmjUv1L+Hkx4zJDINf
	Spk55hflx6T9bqtEWwl3Zk/ZI+y3AH5CmZ9s/cAIHZTKtCbAQ5+oL8dnVVxEleGleMhsVxyjJk6
	dBw==
X-Received: by 2002:a05:600d:849c:20b0:49c:fe46:7219 with SMTP id 5b1f17b1804b1-49cfe467228mr261724915e9.20.1789003975492;
        Wed, 09 Sep 2026 18:32:55 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b090-6201-5565-e933-e630-1831.310.pool.telefonica.de. [2a02:3100:b090:6201:5565:e933:e630:1831])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26d4e3f3sm35852735e9.15.2026.09.09.18.32.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 18:32:54 -0700 (PDT)
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
	Michael Schmitz <schmitzmic@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v3 2/8] docs: kernel-parameters: Drop the bau= entry
Date: Thu, 10 Sep 2026 03:32:39 +0200
Message-Id: <20260910013245.8619-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260910013245.8619-1-kmehltretter@gmail.com>
References: <20260910013245.8619-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_183257_622490_B3D617E0 
X-CRM114-Status: GOOD (  12.27  )
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

bau= went away with commit 39297dde7390 ("x86/platform/uv: Remove UV
BAU TLB Shootdown Handler"); nothing parses it any more.

Drop the entry.

Fixes: 39297dde7390 ("x86/platform/uv: Remove UV BAU TLB Shootdown Handler")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Steve Wahl <steve.wahl@hpe.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index c8d96de4c00d..99d5bb68968a 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -624,13 +624,6 @@ Kernel parameters
 			Format: <int> (must be >=0)
 			Default: 64
 
-	bau=		[X86_UV] Enable the BAU on SGI UV.  The default
-			behavior is to disable the BAU (i.e. bau=0).
-			Format: { "0" | "1" }
-			0 - Disable the BAU.
-			1 - Enable the BAU.
-			unset - Disable the BAU.
-
 	bdev_allow_write_mounted=
 			Format: <bool>
 			Control the ability to open a mounted block device
-- 
2.53.0

