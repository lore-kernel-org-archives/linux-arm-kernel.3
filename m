Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E507DC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 14:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pcqleVpMtucnbrU4qqD3CqHSTuUaJLwoNghGZhsgkT0=; b=p0iBP3RDlsBnDAYDbizFqyQdNB
	U65aSQMFzxvumhdD90VCZowuKKEsaGqhIHC9B3nkTo0Ta4TpsBDVc3Ye6XUYLsPJUOLvweJEC2OCe
	ENX9XRAaxfuetqQPII/5CtiegsXSY79S6DdeU9W3ZxlLRZKZ6Tsc+4gFoO8bzP/9ofzOXkb2Y4/bS
	7Bg4sg0q8hLFWXP4rZTXhwyt1hKsWIkJ+2RGlEVslVJjvJbZqIDNEYiIg3y17KN8JsCZCgbq/9nIt
	+csxOzJDO6Jro6wEbm2Vmj2lAovE8uK+lH83pM3axu/O5+cesQfsdhQ0ouURMPfdnszyNgWpCdnFA
	1EizN/zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubJmk-00000002Pbf-1faG;
	Mon, 14 Jul 2025 14:04:02 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubJdl-00000002NOQ-32et
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 13:54:46 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4561607166aso9659815e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 06:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752501284; x=1753106084; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pcqleVpMtucnbrU4qqD3CqHSTuUaJLwoNghGZhsgkT0=;
        b=frkK5I7qq93IkjqtzcYgJSulQK/ose8zDmuVQoY2Emv4z8DEz0uBNPbrY5R+KrOFwK
         V6kCdDRxRzoNnIrN9NhSbhWOh82blxjh0SmsuY+ZZERq5PklQQUkLZvkxSmwxwEyBvmY
         6HlDosg2lJsIBCPtBbggPlV242xysBn6C53M0L3vnmInegalTCQspa/9MCAuPQI5fpUy
         A6+KasF6dM6RjqXGh8qNMHWPMcX3azvAgjQj7xUASRjRiDjJLsgBv7F8hNas+h32yDqs
         QfSOmHeYfyR56D6sVBVN3UgJ77lTqCjjjuc5qcs0JOSgHtBHNVuojWyFDP6JBiTuklUD
         bo6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752501284; x=1753106084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pcqleVpMtucnbrU4qqD3CqHSTuUaJLwoNghGZhsgkT0=;
        b=OBBkyTcHDyqG1fDng5zFgme7kJWo9GmkJxTF/RO6zuUHrHzfXZqP2AzQM9qi/iGXa7
         yDyOqc8ehFD42w6FDsmhzwE72hg3597y08bB0xZGJ/4vzO7UBT3qa8BRE/AjgM6bo4/B
         QdgTnVI4bfOEaq+7IIgglp82KsYy42EJrSOMX+/1UqMKoMyj1Ng/araAKi/lHooG0oNp
         XDVkE5ozyKFhnRrk05hlnS+mT1OgnfpqXwAz5uacWYOHiETGS/70ALWRQiotviM8o9s1
         cW5PvbJ+kkRGCFMxWjCqxDLJqRSlac7YZ0AaE1fbW1ZKCMJ23XHBjFdoAIHTBuX+TtE0
         l4SQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEVwtIAWAMwE3mpZO8wunegx7bWHdW+77ylUxfCuECPPlDUuYL2wRU2cV+9Xhd2KG72qvQ91le4FS/tIDGzvoT@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi3ljmfLP0+h/+8diyVIvXzrL/qOb0e9bFNvGMzgVEp6UbpUhI
	uYR2aEI7P4m3UBgCLo0Y+nt6kJmjZzZoiFnb6foFnB9sAhOFOkDztlOU
X-Gm-Gg: ASbGncvf9MqZnldvtSMQPhjUPnkhUKejL5lzF+44K+4VxmgdDAr/kI+QKFQaJzQGucz
	4bc6WlZ8JFhpMdoABFbfjaOqFTcOLb8+KYB4JzheRmQs5zFNLV+NsSPgc1ishJct5ALtLQwTDZJ
	Z+WYb0gF0xj2b/qT8Ehs0l0ppMkuaHtdUQeJjQlAJH7SWbAqJKmZ5v2YwY+t1ohXe3U0Ntm0i2O
	w1kyGS5kGRW5YvHzuzvsDX3M4HTOeYvt5PxQEXVxks8Rzwb/nd4ZjhF7f6dyYvvTU52bHrpT6gM
	UnnNRoBEryLl2tlKBvyc4I5xMZgwBPnSa29U+BquYa4rx3E0783mczaaIX1uyVaLpv9ZGK9vPpw
	2D8PZUe1Y3//RLI67SPTU6A8=
X-Google-Smtp-Source: AGHT+IGX4nZxTd71nlcw2Kk+v9/hfjfQlnt9nodc7wlfOD+cS1bfZJPMYAqLuDznPo73eEAn9miMeg==
X-Received: by 2002:a05:600c:4f07:b0:456:24aa:9586 with SMTP id 5b1f17b1804b1-45624aa96fdmr1209585e9.21.1752501283902;
        Mon, 14 Jul 2025 06:54:43 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:2acd:89a8:83d9:4be5])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-456084873b0sm73656355e9.39.2025.07.14.06.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 06:54:43 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 14 Jul 2025 15:49:15 +0200
Subject: [PATCH v2 2/3] ARM: sti: removal of stih415/stih416 related
 entries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-sti-rework-v2-2-f4274920858b@gmail.com>
References: <20250714-sti-rework-v2-0-f4274920858b@gmail.com>
In-Reply-To: <20250714-sti-rework-v2-0-f4274920858b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alain Volmat <avolmat@me.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2325; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=ipzPiez7hh5J1Pn5le5PfVDV0631DokeqQWJXnEH7lw=;
 b=owEBbQKS/ZANAwAKAechimjUEsK1AcsmYgBodQwg1NtKf3vjzP23TWLMiNSkGQX3dchxNjkrM
 f+ceEjrLBKJAjMEAAEKAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCaHUMIAAKCRDnIYpo1BLC
 tRdeD/9xLXRor76BApIiv+yXhvqUfSD1+nJ6F+mjzAIql19wBWphKwRyhbhgyO6twGz2aN9erTK
 m9KQyxS/+Xq58lt+rCfJ9tgfvWP6fgaNB5uVStjomdd+zo3q8JBP/VOPmTmeCV5ryWpNNyBzTEm
 YnmiA7tJzB6W7rTlo1gukHV6LiqYwS2M/EnnbcT8vX3ezYzICw3H5T1cfm848OvxJF+kw7m7TQ2
 VEjrW5N/uqQtJYUpQ/KElmiCoNUB+8fFwUsilqdSU9PJN+YCNDo4dXEKMkVUyzMEh9ZKk2wqsKd
 wGRQ3wLspch1ISRcwmw9tewruuFB8dE618E6P+qORJr+4uHlVS1Rvn/DFcUiXRQqhdQCd/hPVQb
 MTZm+flaHf30NMvDiSd1LfyP8UnoxZ9n9MJMD/WRtHDiWm01mUm6D2k8mI6GffyBJlFpZZIWUmd
 GaDaVWXPFM2JRU/pOBPlSB2pFujJbE7uTtSiPTTrWLKXB20yIVuEwk1218IeubfZpv14PkOZKzq
 56m5bGehlfk0+zcZUM4QPmUE8wTjbTK5nprjgXJUhXZ6hNwq7OeaHMA+KMYeUXwPv5UaI2NpWoA
 Ua+zzv1Yvv2ff8xoOecEgIYXHNBQGMjWa/USjsELCOYawZB2qwTugz6tarDonEw+NZCIv/ALnaD
 EWG3rCVXSN7W/Pw==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_065445_762701_BECC3287 
X-CRM114-Status: GOOD (  11.93  )
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

From: Alain Volmat <avolmat@me.com>

ST's STiH415 and STiH416 platforms have already been removed since
a while.  Remove some remaining bits within the mach-sti.

Signed-off-by: Alain Volmat <avolmat@me.com>
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 arch/arm/mach-sti/Kconfig    | 20 +-------------------
 arch/arm/mach-sti/board-dt.c |  2 --
 2 files changed, 1 insertion(+), 21 deletions(-)

diff --git a/arch/arm/mach-sti/Kconfig b/arch/arm/mach-sti/Kconfig
index b3842c971d31b80edaf88ab907f4377bea0a2af5..e58699e13e1a55ce46e68908c7ef51e18b040dc9 100644
--- a/arch/arm/mach-sti/Kconfig
+++ b/arch/arm/mach-sti/Kconfig
@@ -19,31 +19,13 @@ menuconfig ARCH_STI
 	select PL310_ERRATA_769419 if CACHE_L2X0
 	select RESET_CONTROLLER
 	help
-	  Include support for STMicroelectronics' STiH415/416, STiH407/10 and
+	  Include support for STMicroelectronics' STiH407/10 and
 	  STiH418 family SoCs using the Device Tree for discovery.  More
 	  information can be found in Documentation/arch/arm/sti/ and
 	  Documentation/devicetree.
 
 if ARCH_STI
 
-config SOC_STIH415
-	bool "STiH415 STMicroelectronics Consumer Electronics family"
-	default y
-	help
-	  This enables support for STMicroelectronics Digital Consumer
-	  Electronics family StiH415 parts, primarily targeted at set-top-box
-	  and other digital audio/video applications using Flattned Device
-	  Trees.
-
-config SOC_STIH416
-	bool "STiH416 STMicroelectronics Consumer Electronics family"
-	default y
-	help
-	  This enables support for STMicroelectronics Digital Consumer
-	  Electronics family StiH416 parts, primarily targeted at set-top-box
-	  and other digital audio/video applications using Flattened Device
-	  Trees.
-
 config SOC_STIH407
 	bool "STiH407 STMicroelectronics Consumer Electronics family"
 	default y
diff --git a/arch/arm/mach-sti/board-dt.c b/arch/arm/mach-sti/board-dt.c
index 488084b61b4acafb569ee9c51f5769393d55a9ce..1aaf61184685d754de57b487aef9a6b45a759b23 100644
--- a/arch/arm/mach-sti/board-dt.c
+++ b/arch/arm/mach-sti/board-dt.c
@@ -10,8 +10,6 @@
 #include "smp.h"
 
 static const char *const stih41x_dt_match[] __initconst = {
-	"st,stih415",
-	"st,stih416",
 	"st,stih407",
 	"st,stih410",
 	"st,stih418",

-- 
2.50.1


