Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E83FEE4F7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 19:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=on0VhF10HvrGsC3xgVd6E3dtUeQ8UNCEMcYpUvxVQ8M=; b=Y3bACa4bBux6wHti8naFOIr6ew
	TAAjAyOzRqHoedVWKGgZJ3miTayZkhCAZt5ZDBP4yyWZYXx0Bc8CzgkV68mnolaRFIbHOyxImrt2j
	iQq+Eg0A8uUBbOvmWRiFdszboTTQkqXNJZjdyoNZdlWRnTMFs1r5MyZPW7ROtD1e/YZfDvJ3E3El+
	2oX1I+GonefFkAJQ4pAcKZQec10pV1i+WUs23rLzvQ8bab2khBcpuB5U6HZ3j3YY5zFvS4vZ+x/i+
	aRL67kkgev1ONckz7qNZGQ7dgTKwbyQylYLEAdFJOrWmAIsI5XCARzfQ+octYl7A+I6uOyPtmYmWW
	lWKij9eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwQDX-0000000ADEr-3Z2v;
	Sat, 28 Feb 2026 19:43:11 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwQDR-0000000ADDG-0Vxt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 19:43:06 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-8cb5c9ba82bso547060885a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 11:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772307784; x=1772912584; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=on0VhF10HvrGsC3xgVd6E3dtUeQ8UNCEMcYpUvxVQ8M=;
        b=gmY++xND8Vc+YQTsKzI0g4Gz8c76uHBTQR8rBOfZ/B8ReW3764z+37XMk5ZTfl2gy9
         GBwqFIKWS2EA57M3YKLTneMpPbCbuQlbKb5e2gMMikXJnAYmoC4cCpqRg2eNUVfpQCwk
         ZVgjX/CVGpx+8vQE70lYXxPsyiH0VqZF6cEJGAsfo5efJaArshtVvXZXvcJlgl4cxmr7
         qCSC7mQ+PhTdPhfZAz+t97LwrOIsR2lokGYJCDr/O/4a1DORSPA0G2yUI8j8YSZ2WCue
         W1QXo9kbVnzJwdShUtRf6S8o2iD5+HLnFV9lw0Z9jREe/Tog5uVG+gtSWBcDeEGaXr/Q
         I4Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772307784; x=1772912584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=on0VhF10HvrGsC3xgVd6E3dtUeQ8UNCEMcYpUvxVQ8M=;
        b=SEHuV2g8VA9qVvw21XbL4JJUNc2ePW8kVUlDIoanI09ULQSjSKr3wyqKZQINorBKoM
         3oQVYa5eVQoExrt2wn5sFbnTmBbWtyHfrERqrBWDuR2fFScHEhjoPJv7enkxdusPNcTd
         EGK1A4x8UEMmhyTpkK1RiDCKYzWbzr3ifkOJXVq5CjCmPGgZgBzgxBMsca6yBy8Q51Wd
         0ubdITZJ2rqi1o/s8ns5/puqVKuum3KzGHLUA/+NZCWbLF60RSlz2w2yq39c/1pAbsBp
         aFlNtP32gBsSIjYhnltlMpkx21tfVhvPpvLuSDow43i1/8IrqfN851O2fH8H+eYaX9h8
         vJdQ==
X-Gm-Message-State: AOJu0Yyy8Hu74dlVBdBhZ2gGZxVTlFmuHTou0dNRBkSU2m6j4b3reIzP
	Wn5DRMfnhsO2a9Tvo/yTivVZOr8PVXDWf3Kx+tJtONWzoJ+Byoshu2HH
X-Gm-Gg: ATEYQzyenkmyvpqLf8RMSqKbnVhgMbF66CVb2SAZXahuMQHj52zULvtMQnolX1joGYi
	8ZoepJAP4d5jSJnaPf6fpMdltEPFxWZMmy9zy4vkMbdqBJngt7IJa2YP4j/1E0vUwlC+DbRhUic
	IbpRy0oxf2dqCN8nYCWOijlihccVcVrxaCNO+ecKJAyqsM4/6KviuC1x/FMPG3ZtEVZPuJQ7sKK
	NRK92kXH5Se0bt/rl3aY2fv7xJkxndfFgbTZBpaxTcU58/H7M/9b8x8aag9LUhzGvM9s+RXNU6W
	Y09y9gtyPcHvbY02SvJOVzapB9zG2FyCplmSClVFxKicSAucBDxnvCoOC6Q2IAtm0q8Lj0nwPll
	ifarasVXADPEo5duUEBA79rwVs3o+xEF1NUCKhKvn2mIgGUO/oWz+P2T+bSJgpGYOvc1wd40TmW
	gbsa9flUzN0LWe6gcz1v27IGfSJfuC2ENFsBxqLJaLTv3bmOotd1h/PFHPAN4rXa21zRQWmVH45
	8Yx
X-Received: by 2002:a05:620a:1aa7:b0:8c7:806:386 with SMTP id af79cd13be357-8cbc8df4931mr1029210285a.34.1772307783602;
        Sat, 28 Feb 2026 11:43:03 -0800 (PST)
Received: from instance-20260207-1316.vcn12250046.oraclevcn.com ([150.136.248.187])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf6869f5sm871517285a.20.2026.02.28.11.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 11:43:03 -0800 (PST)
From: techyguyperplexable <hlcj1234567@gmail.com>
X-Google-Original-From: techyguyperplexable <objecting@objecting.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	techyguyperplexable <objecting@objecting.org>
Subject: [PATCH 3/3] arm64: lib: fix space before tab in delay.c
Date: Sat, 28 Feb 2026 19:43:02 +0000
Message-ID: <20260228194302.2467200-1-objecting@objecting.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_114305_319150_EE4F3E47 
X-CRM114-Status: GOOD (  10.80  )
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

Signed-off-by: techyguyperplexable <objecting@objecting.org>
---
 arch/arm64/lib/delay.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/lib/delay.c b/arch/arm64/lib/delay.c
index e278e060e78a..35e0ddd193b2 100644
--- a/arch/arm64/lib/delay.c
+++ b/arch/arm64/lib/delay.c
@@ -52,7 +52,7 @@ void __delay(unsigned long cycles)
 		wfit(end);
 		while ((__delay_cycles() - start) < cycles)
 			wfet(end);
-	} else 	if (arch_timer_evtstrm_available()) {
+	} else if (arch_timer_evtstrm_available()) {
 		const cycles_t timer_evt_period =
 			USECS_TO_CYCLES(ARCH_TIMER_EVT_STREAM_PERIOD_US);
 
-- 
2.43.0


