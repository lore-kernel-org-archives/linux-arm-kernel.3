Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B7D10BA439
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 08:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2HryrWoWtiuMl3LNqbcdlk98yeRL5cKfDbuBDTCXl6o=; b=H2/PINDpL5JaXAds0X4NlMmSNv
	p5Dtr5unHlEY/1ajZYB5i+sZaTx+SsgVCDqDrEri0y29H4T7goK6iHC7hdaWK0TALOFM5llQ1Ka5b
	Gdq4OJ9md3wovlTvCDO055JExiR7Pstie2h9r0+QWW2as52psxw9qHtALNTpnp3fIJ/42S5LY/QMj
	0liByps0pNkCT7U8AAiVNrH5gdfC+rtTe2XAhpCCLJzQ616Kv+4xleKSDRZZ1VndRfrc+fNMbdLo7
	PKCKyv58J5NND3QeNHvhH22Vuez43j8FFfOoI4d7RCA+5in6eEWnUuEf0a1/VprLA2hMx7sWwwFwP
	8Qgl+lrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w627x-00000006v9x-1nQw;
	Fri, 27 Mar 2026 08:01:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w627q-00000006v6Y-3jpB
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Mar 2026 08:01:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=2HryrWoWtiuMl3LNqbcdlk98yeRL5cKfDbuBDTCXl6o=; b=hqagPN/m+G4++c2TkiswTd/EsU
	WHtMPOaTf0GsaxmA9UUq3g+XWEhxgAly/z7icB/yfUaCHsMvbmO7MQ/f7n15bjHLeCluzbkr5T69t
	nauDgkfZlcyCZnt607uoEx2Va23Q0ex4iySnFVuCyLz1PKewsw+C/tgJ2O8jlus0GhIP/E/tnFr05
	7t7ik1cRWVp3DE+eRLIV8WnjodendNtaLUF2V4w4gYyABQGl6v79OQide0NOZSI3kkPKcQfhsM88f
	eBCZvtACJCTTqniTK4KMziN7Goql4Grz04xbwS8qeNi4ttQ2TIAY2RthQJolsvgaY0qG3s0g2Luk4
	R1pySTzw==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w627l-00000009vIf-3VTC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 08:01:01 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-48700b1ba53so16886285e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 01:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774598456; x=1775203256; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HryrWoWtiuMl3LNqbcdlk98yeRL5cKfDbuBDTCXl6o=;
        b=a2ObWdOBi6aiE9fHmvy1H/lv1aX2T+psk+U/0ynZCiE6dcznIa4cDiWl2ruxWdkSbp
         MrcSZK1m5483RkuzIlj6k0cNghgBtHTCag0ForuVHLVQyaJnpoPHkBxDy1qq5fkYUyKz
         M91bTzB6podg62L1q5xCsLYO8PMwqI3/K4WRd9qZNhGNIZj6qJz2PetZC4mT41IfyQgC
         hsjiQGLU56Z3C1FlQu3Ms88ZtRCF7SjSc64YG7IgdODp81ztUt64wYSJ4dVJZPV9nYJ2
         j38FOvC4o4ZofBpJbmxaP9/HHWdPFsf0PZnQPuBA5trYrT1pbJxNCzcinWoqo3HlqQzd
         hGfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774598456; x=1775203256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2HryrWoWtiuMl3LNqbcdlk98yeRL5cKfDbuBDTCXl6o=;
        b=LzcCYkYzS0In2wd84HaMSDK2C243Nosw9UiphIFQBw9o6klrzA0MHxPMrchTKGD6uR
         MX0+6zAg6KLOK2LcnmeQyyxHPBGLehW0oWTod6LOKueq4R1LkzGzc2i3iCMW5RNwA/BK
         tbOscPButJ1ItLxPR3P8j6ZngxUCpgedvxdTGY4HazhEalQPSwb3c2nvQNB77nJhMA3U
         SEQ87dML9yLL3Hx4aQwAeyXw4aPngpW0m6HNwGRYBRQFu1sZv+cKgSgpQ6MAoLJqCrOx
         Y83i8N/AAYQuDyMg5zF6UVDR/b31Kpm3UxYz4adtzQayai1blBa3qPmSwtCHqg3yG1Tu
         Fc7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUk06zLSG+Mq/SpePyeB6eI4bPVQUBnQJYM/lNIf0jVVp2wMSeKFXAo73GKnOX+b3TNJlaRa7t0g4+v8zaQvETv@lists.infradead.org
X-Gm-Message-State: AOJu0YyZNnEedJy9lSWZUe95/j2GQRV4HcGWlUNfUTdTi53ChoTad5wm
	HzfsJnTyCGtGnxCVcQHPE6iI9k9AUQj30MrOdA8AVw2lMt2IdJ2cLsR6n7KLK5wJIgE=
X-Gm-Gg: ATEYQzwc6gX6Xvl2gTPFg/4VmZYQGRNTUFWIUs4c8gA9jcHq3e5wkkndfYkrMbROIVq
	hFSEweagBl5oXYilNQxawf3UNb2tNE26/JDcSZ5YDfbOyFhPhrEiUlJEeKpC6nusWEckKuhqifV
	QAPh+0LGOJlKX+Emk0b5gN/pJdmQI5v4kt3eOQTLKLVYqXdzLxN1X8IcwrOrb3I4T83XNy5SsLU
	yvKJsJwccpvDGLICaGMu97/TkRhBYMdbMVCTF/Yl3FZvF/9aQdGMzhP9DfvbpfNSQDoRTr1d7m1
	MWztUIO06qS0TTC31mldNAitpUOaIOkNwJolEr1LINX1uacKfDDROQDuwIwvMqUYnBrsj5NP5eR
	nQwOEhglJ8NQMLMMkN3UjF//doYsuIHaRQSkA36OlxLYEgU+JPOhLm0JCnhbY/I7rk3YO8XEKNE
	tN88J01w8JEZDtLDwE0hw8/oN3rcPBm+d8o/moUnKm
X-Received: by 2002:a05:600c:5249:b0:487:386:3714 with SMTP id 5b1f17b1804b1-48727f7bb08mr24460995e9.17.1774598456054;
        Fri, 27 Mar 2026 01:00:56 -0700 (PDT)
Received: from zovi.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725fc4827sm12089735e9.11.2026.03.27.01.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:00:55 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Sami Tolvanen <samitolvanen@google.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	linux-riscv@lists.infradead.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] module, arm: force sh_addr=0 for arch-specific sections
Date: Fri, 27 Mar 2026 08:59:00 +0100
Message-ID: <20260327080023.861105-2-petr.pavlu@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327080023.861105-1-petr.pavlu@suse.com>
References: <20260327080023.861105-1-petr.pavlu@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_080058_009166_3A1CFA11 
X-CRM114-Status: GOOD (  11.51  )
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

When linking modules with 'ld.bfd -r', sections defined without an address
inherit the location counter, resulting in non-zero sh_addr values in the
resulting .ko files. Relocatable objects are expected to have sh_addr=0 for
all sections. Non-zero addresses are confusing in this context, typically
worse compressible, and may cause tools to misbehave [1].

Force sh_addr=0 for all arm-specific module sections.

Link: https://sourceware.org/bugzilla/show_bug.cgi?id=33958 [1]
Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 arch/arm/include/asm/module.lds.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/include/asm/module.lds.h b/arch/arm/include/asm/module.lds.h
index 0e7cb4e314b4..f9ad774b2889 100644
--- a/arch/arm/include/asm/module.lds.h
+++ b/arch/arm/include/asm/module.lds.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #ifdef CONFIG_ARM_MODULE_PLTS
 SECTIONS {
-	.plt : { BYTE(0) }
-	.init.plt : { BYTE(0) }
+	.plt 0 : { BYTE(0) }
+	.init.plt 0 : { BYTE(0) }
 }
 #endif
-- 
2.53.0


