Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C60CD37AF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 02:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=biqWC6fc9dtlBlSRovb4ZiABJceyMIyfRNb2CX5GYOo=; b=WoJrb3P/ffICBsyFWnCSjFCxco
	zqPStpThvgD9xt24U43ZLVVpFgdZYIzRid7ouHzmugiS5Nw0FdYNDClmCsFmdux2RHQOkKHt/G/8y
	5FSXdnmtyyMA1OJBMgvr3/1zpphWoMiSsHQnSgyaZbscZOcBcGJ83xL7qiFVWBo50mle5SbDP/99F
	HVT+J1re7hQ25T1jVzZlA0NBzzV2j6Y/Da0el/sWzY56EvmwarrTLVHa787MclTl9af+c5PsOWjN4
	MQRII4Z81Nn7dwkXNwxDPBtc7ZpoxlefKkzY8+p0uBfzCvPVl2jPtlXbRriBDTFjmPoV9sb4imhNg
	iS/RTQbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLuDt-0000000A28j-3FEO;
	Sun, 10 May 2026 02:48:53 +0000
Received: from mail-dy1-x1343.google.com ([2607:f8b0:4864:20::1343])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLuDq-0000000A289-2MPE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 02:48:52 +0000
Received: by mail-dy1-x1343.google.com with SMTP id 5a478bee46e88-2f30a4601bbso3382152eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 May 2026 19:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778381330; x=1778986130; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=biqWC6fc9dtlBlSRovb4ZiABJceyMIyfRNb2CX5GYOo=;
        b=qGYwL7WeItovUSC5xorPegnwqi946w3p8GDXKTMcp5NpzJjcHq0RSxqeTa+hMBsnBW
         fywhkotitLSIvDYiZnR0yLqKFmmdrHanoD56VXl7hn9VEt3n9RPwRwPHc4B+IGZooS28
         j1T/SBPvh+ZvgNfpT8c1mQoKtc3Yw/gxwu8OJBat2m3VV+/w2a+AZyrZo5uKOo8ezwAc
         sWgAoX4IxD5NlGApUTLBnTGyhtQr9Av/y6fZe5xxNVJvie/WrMVO333GTEPY2PHwy+Tg
         GEs5AARHHMTSe7aMVJtEwNzoy1I4TI0pBGwjeXLMBDgnZRRVpHKnoDV1g8DFmhrzhvLh
         Ne1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778381330; x=1778986130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=biqWC6fc9dtlBlSRovb4ZiABJceyMIyfRNb2CX5GYOo=;
        b=jZScYwfmPfzpYyobWoykEJaMW7c5tYAAMqm82OpTpJ6Kagb8X7rUZUWp2xuBDMwaXP
         7HhlbQMlRBi9P5DPZW/iV5Kc20o+my8HqOcxql0b6GkAe/I3AuAGi2+aG56JnHa4fJwj
         L16XYPF9j9fHGndQqNTH1e8yndlWnu18jHmjHSAM6zQv+sZzqWvAQbq+rPOtCYYv5OyU
         tHNUsntNhHUkav2GStbJKNrYuctzPdzyFrVwLCFo1AEmISxhmdC1MJcmS1iniOQK2uxP
         S8NxEI3xXURZ13BOWIhqJU8NlDBRY0Mdy2JYmejnqPTZ1I4bv8mUR0/fqA0GGIfRCBwO
         fkRg==
X-Gm-Message-State: AOJu0YzW063E8ZhB2GZwtEA+8VJTuLZiEGB47CHwYvuuM7LNPV/pBYjY
	HF4HjOJ5JubwvmFwTOEUFVssZRG/ROEJoDstBqMOzhq2bbZ9lSDRsggrAuD3e3+M8Ns=
X-Gm-Gg: Acq92OFfa3at1U7xHc+O/0us9JmlfwDutCJfJ5e+trSe0vppA+j9vkz1bIQetoMhM24
	u3311cL7tzFrqnrB5TIomPH7u3gn2SmrOAlCowAAyBBKDoUu9Pm90pZqzyLF9MkXpoateLKmW/+
	HMLVa0eo9oLOwOvKFvzYALYAVhwHmq4XCS2+w97Nf5JEADFDdfLIBetpSRGpB7LehuM88FlBzNr
	v/OSC9jvWQ+SJE0LDNxsAUfEqSC3xhRJuTEhqbNNXmROq4sH86vM7q/hyoMW5r/bONEfMcG4oWe
	Ms7AJBZuHVg9HRp0JHEgED78xY1WWwkdrVWG6QEvWaNUOsvr1EtUwhHnMg0wFvQ4Wms77u8nHhe
	OyD2c6dEtQAwibuvp6QOrILxHwaHL5mrAHyVBAlHxNMKCgv7GCCzpJBblFg0Yo5mZLfVbO/8ZEK
	hl0ExscS+lPpwIswdJuYoHUX7NnQlVQFL/HxgH46ugjxNa1k8kBvMneh6oszRYATmdio9N8ZZl/
	rZqHH+dJ/qLDeQQ+lyKLaDQpIF05Nta43k5ehgRfTFKRtBOgHD+7FIdQmR6cnytUq3M86LZLetj
	2VVW1VuxqYXLW6WPlQ==
X-Received: by 2002:a05:7300:3b08:b0:2dd:6937:79cb with SMTP id 5a478bee46e88-2f54c28117emr9310800eec.12.1778381329276;
        Sat, 09 May 2026 19:48:49 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e4016asm8256565eec.28.2026.05.09.19.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 19:48:48 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>
Subject: [PATCH] ARM: remove unused <asm/hardware/memc.h> header
Date: Sat,  9 May 2026 19:48:36 -0700
Message-ID: <20260510024841.194249-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_194850_630575_D6D4EAA9 
X-CRM114-Status: GOOD (  14.14  )
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

The <asm/hardware/memc.h> header is not used by any code in the kernel.
It contains definitions for the MEMC memory controllers used in 26-bit
Acorn computers.

Linux formerly supported these computers, but that support was removed
in commit 99eb8a550dbc ("Remove the arm26 port") because it had
bitrotted to the extent that it did not even compile.

Remove this unused header.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 MAINTAINERS                          |  1 -
 arch/arm/include/asm/hardware/memc.h | 23 -----------------------
 2 files changed, 24 deletions(-)
 delete mode 100644 arch/arm/include/asm/hardware/memc.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 5d8a887c868e..b865ad67fda3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3400,7 +3400,6 @@ S:	Maintained
 W:	http://www.armlinux.org.uk/
 F:	arch/arm/include/asm/hardware/ioc.h
 F:	arch/arm/include/asm/hardware/iomd.h
-F:	arch/arm/include/asm/hardware/memc.h
 F:	arch/arm/mach-rpc/
 F:	drivers/net/ethernet/8390/etherh.c
 F:	drivers/net/ethernet/i825xx/ether1*
diff --git a/arch/arm/include/asm/hardware/memc.h b/arch/arm/include/asm/hardware/memc.h
deleted file mode 100644
index 1d4ebe0a9678..000000000000
--- a/arch/arm/include/asm/hardware/memc.h
+++ /dev/null
@@ -1,23 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- *  arch/arm/include/asm/hardware/memc.h
- *
- *  Copyright (C) Russell King.
- */
-#define VDMA_ALIGNMENT	PAGE_SIZE
-#define VDMA_XFERSIZE	16
-#define VDMA_INIT	0
-#define VDMA_START	1
-#define VDMA_END	2
-
-#ifndef __ASSEMBLY__
-extern void memc_write(unsigned int reg, unsigned long val);
-
-#define video_set_dma(start,end,offset)				\
-do {								\
-	memc_write (VDMA_START, (start >> 2));			\
-	memc_write (VDMA_END, (end - VDMA_XFERSIZE) >> 2);	\
-	memc_write (VDMA_INIT, (offset >> 2));			\
-} while (0)
-
-#endif
-- 
2.43.0


