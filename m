Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47DB8E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 09:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F+66VXGs6F5HU673/dKdLLlML7sMQZ22uvjCf12/lRU=; b=BVUIyfeWGtQsK9UifzW74pTaQ5
	vkCRud+0GvPacghEsg0rU9RWsWeP5MxXsFDFxqdCGJ35lmu05ODKHPRyfl8rP9gLw2pjiGQG297oI
	JQGnL8Y7foNCCxxGwjBx0QJYSbQWhY7gorQpHHVZ+XzfxMXuikd+hUxxd6+vJ5hyShzYZc4g0F5XV
	gKVzn0DVABBr5o3PCVv42xd5VCrDNI7yY4dHjKTnHMUyWOkVqsi+s1RC51Gvzdch/t1O0e8kOlO1N
	T6HvGgtihpUlMDZ2VTjGgJCSHsV/3HHR1y75b2rYS/skkE63TqFXaW6OG1qUCZLKFuayBHqKcH6rx
	Z00PxPBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMOLA-000000066Vv-2fJU;
	Sat, 14 Dec 2024 09:21:36 +0000
Received: from mail-pl1-f172.google.com ([209.85.214.172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMOK5-000000066Oo-2QH2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 09:20:30 +0000
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2164b662090so20883355ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Dec 2024 01:20:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734168028; x=1734772828;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F+66VXGs6F5HU673/dKdLLlML7sMQZ22uvjCf12/lRU=;
        b=HrFMDsYR/NSkZ89N0R3Yg2K77fAAllBJ6CRfFpj/ULjzwv/vcqcTtH/p4k86cZ43ik
         XzDgymAyACHtcOcUv/jsOW0hlxjDxCZiU3B0HlL6vQ8iFQjAflcPM5m5CXXgu25LwFjc
         J7fGKyKRUwjPdShIisIPKdwQozhaiQwQ/yPWEuY+1v+XmuNBFPVscsH1IkGd/s2TL37s
         Exz8W2hnN+v3Y2Bn/jcXvqXGlG3lstMzLQw36cIwbuLYM0/0z7/HnEY2YhEgZAtvaN4g
         RGYnBbmVMBp2xjWB/gPgBTnYEUgYnHDP5MDidjdVT+Et5uytgq8Ss5BFWic5IsChjTvj
         xbSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhHvKV3zrkTsCj4VGvGNAVydvjJFDKxgbd8eC9+g+t0BvPI0ziBMsB4gYTcMftLq5SOZwDwzTEmBsN8ogwHG/L@lists.infradead.org
X-Gm-Message-State: AOJu0YwLW60xwZULyMPONjVPdGmySEGSR5VGBBtgsHPtK/0Q17+ETFrO
	vXXDVBjtandRkFLV2ubJ+LCmXXpEPp9o4jEinaEsLPpgD+7qets8
X-Gm-Gg: ASbGncvRfFkdLigJSThETmYaD3IcYFampC8rEgVNF1RR1bo3jIblVdgxxc7YbKwyFV2
	yqNyayh6A9bY3ZcUgU7KU2akksJ3Kr9qo/B4Lf0o82hQ4ATnJxt8wERQRfuX6BHky4fSp1xpMXh
	332ldReenBMQ4/VVD+ja0uQEwFlc2IIRB7Ud43h+HaEzrg+CBEkN8LCmlLG2g2Ru7cWTY+PzzFP
	MCY6V+a7gY1rsa8dGIGh8YjTBAxJ4znTnacX8802EYhf+Tx8t6dpcBaUvg98uja
X-Google-Smtp-Source: AGHT+IHWmUuzFm2NgWrxBw+GJHPWsqa1auCQBreCR2X2pHOkHboY1h0+LNMOIgKnDqiL6+vqpgONNw==
X-Received: by 2002:a17:902:d512:b0:216:1cfa:2bbf with SMTP id d9443c01a7336-21892a41ecbmr76928745ad.35.1734168028072;
        Sat, 14 Dec 2024 01:20:28 -0800 (PST)
Received: from localhost.localdomain ([1.213.237.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e5d00csm9060345ad.202.2024.12.14.01.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 01:20:27 -0800 (PST)
From: Leesoo Ahn <lsahn@ooseel.net>
To: lsahn@ooseel.net
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] arm64: mm: fault: replace the behavior of fault_info[18]
Date: Sat, 14 Dec 2024 18:19:36 +0900
Message-ID: <20241214091937.203842-1-lsahn@ooseel.net>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_012029_616106_33AEEB40 
X-CRM114-Status: GOOD (  12.89  )
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

Replace the behavior of 18th element of fault_info with the 'fn' member to
do_sea(..) and 'name' to 'level -2 (translation table walk)' based on
the information[1] of the latest reference manual[2].

The information has described in the chapter, D24.2.40 of [2] and
DFSC[5:0] bit (stands for Data Fault Status Code).

[1]: Synchronous External abort on translation table walk, level -2
[2]: Arm Architecture Reference Manual, for A-profile architecture

Signed-off-by: Leesoo Ahn <lsahn@ooseel.net>
---
 arch/arm64/mm/fault.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index ef63651099a9..b1c08289a5cc 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -863,7 +863,7 @@ static const struct fault_info fault_info[] = {
 	{ do_page_fault,	SIGSEGV, SEGV_ACCERR,	"level 3 permission fault"	},
 	{ do_sea,		SIGBUS,  BUS_OBJERR,	"synchronous external abort"	},
 	{ do_tag_check_fault,	SIGSEGV, SEGV_MTESERR,	"synchronous tag check fault"	},
-	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 18"			},
+	{ do_sea,		SIGKILL, SI_KERNEL,	"level -2 (translation table walk)"	},
 	{ do_sea,		SIGKILL, SI_KERNEL,	"level -1 (translation table walk)"	},
 	{ do_sea,		SIGKILL, SI_KERNEL,	"level 0 (translation table walk)"	},
 	{ do_sea,		SIGKILL, SI_KERNEL,	"level 1 (translation table walk)"	},
-- 
2.46.1


