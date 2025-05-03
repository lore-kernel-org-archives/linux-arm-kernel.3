Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F942C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 11:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g10XSPgHLOdjLV91DDilUhysjPUWEuAqpKjpDemrB7k=; b=td4T9ulOM/gdo+rSsIKj7UR66v
	rXRyfF8ekyyDsqaO26t2jgo5bd4ANxR3Joj5808guQo09rumeUBRd94ILTSr/Qw9mMrIllusBbJZw
	1xpghdjKdcrSu3cVdGH1beV8JDb4JJ7Pxzodof/DVYqeOAuOZfAUNIbMYJyT7QaBYPkVTfg8+9bFa
	aCxIaV8r5fsYb6gMUqYVIW8beG2eR8Ax4CvO7PmpBpLuK2MHwFT2ZngWi3RSfvWV/Bs5PNWzpf0/9
	6L+PvrgLH2VfoRwYCXYVSODHYQpb3BPfo2BwCcL1KZklp/RM3djPkGP38oOA+3CPo2Xy+L/gkz1/T
	CbFwDCKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBAzC-00000003oDc-0xQu;
	Sat, 03 May 2025 11:24:50 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBAxG-00000003nzK-1U26
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 May 2025 11:22:51 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43d4d15058dso19994765e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 May 2025 04:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746271368; x=1746876168; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g10XSPgHLOdjLV91DDilUhysjPUWEuAqpKjpDemrB7k=;
        b=IiDzpmXCMjWt2UCgnpK6bXE9yPAxdaplFBaTbmpmJjcZZRwthO2b5c0jmui0EwbGwz
         KodN5GC55zip8NBW7uDKIVQyZ7uWjIS4kB6Dndqs6U/3HvcPuMkoF6lP6yLn4DwIlKz5
         M/BKDyndowEkDnM+lKu/dQYcmjWFBusqEiWoyOZd5kUpqrHEUs0XyFeIgMqUg3Hj6cCc
         CZymEYMCWZ5pVQk5qwvfEDVFvu9q8FfcX4McZCqHX4+eWBETkyGvQB/8XzWTeNUrBgA2
         121IEg/X7c96Tn+3/wp3o6kkrecRIYxIVhbPCUeTV4vFW9/xMWVD41KKkYduV41vwEPQ
         hfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746271368; x=1746876168;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g10XSPgHLOdjLV91DDilUhysjPUWEuAqpKjpDemrB7k=;
        b=vltBINtoO7xnEcWX7U4dA7sa3eas1Uc8WAMis1en4Dox4+60s4TtPO0qoKFdwDL55U
         kN0eObN7iYZT/MoxaE+IMafBW1SM5Cd4+CL+7hhhpAYPDW0Jv3k2HU6awelFT6qaONlv
         Ddt+pnXv2ECEMVCdoC2u4B5U8RORtfxEk7HMKgs/W+IlLMd90qibANKZcMNZUNKNDHFx
         sChfjfoJqk3Ahn8sZxhX11CkphNjVebibyEbetHSwFrIJmRbGLSzBIY7FdHTLfL7kCw1
         AQvg6lJIhiZf1xOTgxtI1E+HEyK5B8sg2kqCicNFKLOn4hn4uMxqwV+KpmRFuyjB3Zj6
         SqKw==
X-Gm-Message-State: AOJu0YwIFR0H3b2v15LXy/XMFbUQrH9erzHIatTxRBZRMgoor5rX6ePV
	too9JeuwRRP3Ox4S79edQPZxl3/gE9oEPq/ipXl3cK2poANT3nt2rNYW+J9yk+I9XLIND5/l5bY
	5Q+J3GUOzg6RNye5+zLpFJReloV+H+WW8vzR852T1p+J74CfPm6HHeM9vQV6j2gP98+ZUauO45S
	aA3KNAhSGxQI5en6Rq4olkel2nPB0X3XPxgE1OE+lm
X-Google-Smtp-Source: AGHT+IGS6gc41WjV6YPvRsSPQdPyW4NetHk6qUna9dd3u1qrw83UJK08+9UNNoppy2euDQxSVhPngjde
X-Received: from wmbds22.prod.google.com ([2002:a05:600c:6296:b0:440:58dd:3795])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:45d1:b0:440:6a37:be30
 with SMTP id 5b1f17b1804b1-441c48ce8d8mr8110115e9.16.1746271368179; Sat, 03
 May 2025 04:22:48 -0700 (PDT)
Date: Sat,  3 May 2025 13:21:38 +0200
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=843; i=ardb@kernel.org;
 h=from:subject; bh=ubkPW3t5PeWznwLH2AP8mn83R+MI2lE8Zn0E3117kbQ=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUP0j9MBQ5VoV94LcyxvV/w88bfPnGvT/Naf27+0Nu62m
 pur8Yuxo5SFQYyDQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEzkzyRGhhnOXaEhYVd3MH5l
 XDOnbl4h903768vOGdplr2CxfvW9Vojhr3yC8pf/V/o2BbP1n137b5+LSfHN3J393y/l5Aqvuy4 YxgQA
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250503112137.1962910-5-ardb+git@google.com>
Subject: [PATCH 0/3] arm64/boot: Forbid the use of BSS symbols in startup code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_042250_412666_A3B27179 
X-CRM114-Status: UNSURE (   7.96  )
X-CRM114-Notice: Please train this message.
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

From: Ard Biesheuvel <ardb@kernel.org>

Move any variables accessed or assigned by the startup code out of BSS,
and into .data, so that we can forbid the use of BSS variables
altogether, by ASSERT()'ing in the linker script that each symbol made
available to the startup code lives before __bss_start in the linker
map.

Cc: Yeoreum Yun <yeoreum.yun@arm.com>

Ard Biesheuvel (3):
  arm64/boot: Move init_pgdir[] into __pi_ namespace
  arm64/boot: Move global CPU override variables out of BSS
  arm64/boot: Disallow BSS exports to startup code

 arch/arm64/include/asm/pgtable.h |  2 -
 arch/arm64/kernel/cpufeature.c   | 22 +++----
 arch/arm64/kernel/image-vars.h   | 68 ++++++++++----------
 arch/arm64/kernel/pi/pi.h        |  1 +
 arch/arm64/kernel/vmlinux.lds.S  |  6 +-
 5 files changed, 51 insertions(+), 48 deletions(-)

-- 
2.49.0.906.g1f30a19c02-goog


