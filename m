Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0800EFF885D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 15:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IQNSYuEKSp5nerKY7s4NoQ7aeozw2OgexDJkLVaxoww=; b=LbhiqIJAi/GAGbUZf2aJWw6/jp
	8D5GxPQyItjCfX//ETwk6ebdf6/IyQhOOHfAP+StZ7GcNPQqyzlJptW7eEWZVxJ2Cu21OfgEtSHZt
	wPKwCCvRmMewAuj4ofJzZUmW4jF9Ju10+Z32NJeJsPyExjQcXZUlTAOXDo4Zt6hqxl+psvhquCAG7
	saoWYYTDiCCd5BqkmaZH2Da36sKDCEr5ZPDncvkbkS8b9qivXDyk5UZXY1ClrygibBqMLw082PT7D
	wWMATnr4txf5s3OODowNhe4RpxcOFgaKOE8H5h/R9GDmGVqBMDKl8x8XPgIrGqZbHdH90clPHxPIx
	Kx3F/7ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH1k0-0000000FgEn-0N9V;
	Sun, 26 Apr 2026 15:49:52 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH1jw-0000000FgDB-0Aw6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 15:49:50 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4891cd5927dso10971405e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 08:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777218586; x=1777823386; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IQNSYuEKSp5nerKY7s4NoQ7aeozw2OgexDJkLVaxoww=;
        b=Uz4ucVfeo4s9HSLsROkPsgwZ1az84EpQA/Pfnykp7U0a2dLdpLj68rZTJgmQ1dg6BD
         h2+Whl50o4pciIy1O8I3/P45xuWWaphV69oZJADzzHqPSY2jXsBT5hiTdB1WipYTMALx
         /ngpFRqKHVt+JpHUIo1hFTGxKzMwMmQ366OJ1M6lLc5Fjmg1qGrWfVj4266/e8rKaFuJ
         hJzxXMa04KMupB44bPpku1dwnGvx0BskK3NtqotW8TGfcM8SmaeteX1abLQ5l3J63VuU
         Ix5KexgoNtgj+6X3RoRKXjLS1xYMeoEUn0VGDibadgladfnVXHV26qv0yMgLz5FKlmHA
         RvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777218586; x=1777823386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQNSYuEKSp5nerKY7s4NoQ7aeozw2OgexDJkLVaxoww=;
        b=WRfF7F6mERmv66+5wL6G0rjtYzpXhvq8DjaxV0au15AnjZvFzymR/ueQHR0ymTluPs
         rFKJNqftV8BE2kP9lL+iscSD66YTR/m6nynW0k4vQEwzJJU3S/5Jpz4c5pEWYUOfTyJj
         zfJDmVL/way+13uhjtbSVqxcSddGW/YIM4GDJyVhX7/x3cygNBHqHqXcoP2JuxiB/XQX
         iW7RVJ6aN6jh9AGOutO+R0zWVfnQcQKFVl0eTCtcb0GKB3IpN5xzmm70syKjea02/ZhV
         W17m0JhYv65e6shsOPb4cx0gJnoaw2i0TxDMPY9FdG+d6aFjUv7CUW+5b11AKgpJPNAV
         LP+g==
X-Forwarded-Encrypted: i=1; AFNElJ9CIq+x6abuZSzMOs01ntUnZnSpm+fGrs08LJVO5xrXmvhi5gWEagSwUFoGMgw8R5RDotOejwsy9L5lRNPqHlen@lists.infradead.org
X-Gm-Message-State: AOJu0YxWuTvnjY5PRSWbBRZtn6CTcVMnleVUfWd3YOin2h8nBkVI2sli
	9wiFoNuz8AQM3QTyX4bZX/5J0ztrGZCgl9FTsr05VpQ9hoAxrfAQA7x6
X-Gm-Gg: AeBDieuU+484Sqh63FEjs+SvXJgoF6snfQARoLgNvW5WPcXXQSByJoX3lMqV+SYq9x+
	+iwZBZqQbCf6MNbeXMIRuyhy8Kcz5JNRIQY8a5IlgYp99tlmcNMrW3tNVleyZuZJD8vUU9FUXrX
	GwZ+BDquOYLTh7XuMoAhgFHdMuTRUCyrh5J9vkmBlWnApUmW8u5GvbT7kD91NUrgCgpPr1cJrZa
	wbD9lQHBvZOMofZ8Qf7mCfcvr+eGcsArkZGPezjC8qtnRD8rQP9afQyi7VmJGg0GwvxqDKUIPC3
	uDzArdzLCHOiQC+vg/hftYFTOhJ11iq7/Llk4sNIWnzr/Je1qwa3juH3J8V0s5C4CWHerZyVpj+
	iKdnx3p3fk7DUVtCuXA/WO/09Xv2FsL37IgV5u3YfnAebfOIvhOl1t3FbS2Tug9ARfhuH73CRTR
	bb02q+kN1AnnnJoJQ3pzxGdd/LCwlj+3UDgNWXQqG8ILmksj/7cFjoBvLM/9oo79bZy0eBS5fXE
	d6GJ6AlV57E
X-Received: by 2002:a05:600c:4746:b0:488:a2ac:a338 with SMTP id 5b1f17b1804b1-488fb7685f8mr288589875e9.5.1777218585703;
        Sun, 26 Apr 2026 08:49:45 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a341sm79799339f8f.24.2026.04.26.08.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 08:49:45 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: herbert@gondor.apana.org.au,
	thorsten.blum@linux.dev,
	davem@davemloft.net,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	ardb@kernel.org,
	linusw@kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	l.rubusch@gmail.com
Subject: [PATCH v4 0/1] crypto: atmel-sha204a - multiple RNG fixes
Date: Sun, 26 Apr 2026 15:49:39 +0000
Message-Id: <20260426154940.24375-1-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_084948_081670_CA39991F 
X-CRM114-Status: UNSURE (   7.84  )
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

When testing the RNG functionality on the Atmel SHA204a hardware, rngtest
reported failures. Fix start of reading and size of fetched data.

I verified and applied Ard's solution (tagged it with sugtgested-by, pls
tell me if I used the wrong tag).

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
v3 -> v4: Reduce seet and set focus on RNG fix, blocking and nonblocking
v2 -> v3: Removal blank line, rebased
v1 -> v2: Removal of C++ style comment
---
Lothar Rubusch (1):
  crypto: atmel-sha204a - fix non-blocking read logic

 drivers/crypto/atmel-sha204a.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)


base-commit: 5db6ef9847717329f12c5ea8aba7e9f588a980c0
-- 
2.39.5


