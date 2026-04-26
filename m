Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D802FF8850
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 21:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iLR/opeNBhDfGIgJhq5deg39/VYXY2JhgaAs8rpPWvc=; b=h0Qsn2Ijj2ooYpRlWcfVgiaUmo
	uKKm/+SP0m2Q8C06Fm0SNEWJQ4UGU+tg0Fj9fw83WicRvD33AQnBvpncpuLOvT02P1v0AT9AXsDfD
	XIckcXZPtmZL+cZWcb2BdJt5rfyBk8ZenionzPCWWNId/4p0JqrpMOOws7oGTzNgKoJuTgN3IzvuV
	XOEkHKvHMuUXJdPfCA9x1Vmnmu5SgBhlgi5XQPkbwQQnXVOAHTb/Nw5ItDa5fGOdE/9fAX78RZCIq
	OU9g+lno6Y76Zp9EIAFpVmYZGZ7PNl6JBW3D/CmHsZL8QbokoqqjZXhenor6VXCYuJmSLrcHu8ILs
	TWtKzqFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH737-0000000FrXQ-3eiD;
	Sun, 26 Apr 2026 21:29:58 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH735-0000000FrWr-3FD7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 21:29:56 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-43d7b879691so1128182f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 14:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777238994; x=1777843794; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iLR/opeNBhDfGIgJhq5deg39/VYXY2JhgaAs8rpPWvc=;
        b=bQQpTsKIU+5UzJAVroTlKlnviO+Q0AbLe2JLsSTx4Iu8yATAhh6wL2UcuX3WdNL5Be
         ezR+9U8/U4IKLsGtbJFy2pjAE5d3IZiSPBa2govUZ5P6vKK8qzTL3g0ILAcEosrCYqvW
         ydpGq9b0ToifyIWVXfbvGFg6Q0pWZRlmxPtjqSbFKiGULLGGFhTfVfGkA9d51TGQeYrQ
         NG3Uyr5f3RCaeihPSrfgcHPPYwUwKwqR7V1nGu30lzQjEPgfDjV/w45vQ92GGish3jno
         NuEM3MCsEAzU1BZoFl338X/8nWx+ffGOaoeudEuIDTVXM/XHqcYbj/5LNk6WCwg3SRPj
         /G9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777238994; x=1777843794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iLR/opeNBhDfGIgJhq5deg39/VYXY2JhgaAs8rpPWvc=;
        b=Frw1R8XagSR0Q7j6GTcooY5BNYxMDFURO8fXrWG1AqCe6mar8cxpi7ea1uOf+uNwT5
         xMnBrqLR8j+E09oRX+1n+Nn0oOBRLX2/amGkPeHGJSe21pMMU0Cpb500n+fLPJnlIuQA
         SXFGu6OSdZ6ORZGjpq8YOt/ERREZ1oB32GaHsaMuuw+BDtaIyuIKp0+rPm/A36+E3Jiw
         1SmtGtr3mVETsQy0QHujBhHCg/ZHpEOeCeqov1fdHI7BSJARyU0uYVKs4iqtvrylAWp3
         WmxCnwnrW8Kky5PJLfSu1kFzx6JWpgHIhOaLnz4TfY0Kf+NJ46kzBRqp7HlglkOUXkQ8
         7zvw==
X-Forwarded-Encrypted: i=1; AFNElJ+oo3vgdfOi4PX0LcrBv1OeEJWfmNmVngkbUPtu68ipYxHhCKY/+tYl2/bo8WSVud39EyvnCQpTuy6zmQWEuuLV@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4flYl0eThQLlVM1n04xvb6adTG1RY9pS7NO3bUINiywbUg1GK
	ZLfpWWuUW5LWUMh+A2aaOVRZSh6sp1uOfos0T+gt2Y33aI3LmjX/wlIY
X-Gm-Gg: AeBDieuvksDiFCSmA3KsrvqYDInKcTTtToj0jhsYhnf/xjZqL4jSZsKcUSvF9NXvOfV
	1tzEfk76DIflZOn7u7W+lYxb+Cc1DPXRYZpeZu30aYDsomMylvYIE6afehC4TAHDbbhH6k1LoaV
	zjwiOC+fgAPk/Dw6DyM4N3VCi4n9RpctxsDQ77gBLpz4Sy1Y4TIYVf0jpk5UT2llxoy/QotB4qq
	CAlo+qjdvCeS8YidrvSzA4CT+9EE4u7GzPwEvoT5aXtLPretE4EvAHCqJLUSHelV5JEisUU3ks+
	IimAtlqTONYo0DlyXoPfMZbD3leLFol62lqUkqm0x9RG2lWzCoGmQTYDa+acfXejzXe5aBmZQk7
	5zxex5o+k77NaH0qs8qRoBSWZXUnj1ORnBjGgomFD5DJHHGFXcIaxMnoUb+5hu2NoMc6Jjg4N/E
	1DSD3R8WiHGRDjWrMYJ5kpo9n0J6cqLMIyZXp/W8i5L2WxeI9Zd7LpAM3enyVkvKmynn45y507Z
	g==
X-Received: by 2002:a05:6000:2d0c:b0:43c:fdfe:bdda with SMTP id ffacd0b85a97d-43fe3e26512mr16823929f8f.6.1777238993569;
        Sun, 26 Apr 2026 14:29:53 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a79esm79047320f8f.17.2026.04.26.14.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 14:29:53 -0700 (PDT)
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
Subject: [PATCH v5 0/1] crypto: atmel-sha204a - multiple RNG fixes
Date: Sun, 26 Apr 2026 21:29:46 +0000
Message-Id: <20260426212947.24757-1-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_142955_818791_57E6A2A6 
X-CRM114-Status: UNSURE (   7.98  )
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
v3 -> v4: rephrase commit title; fix typos in commit message;
          replace index literal by `RSP_DATA_IDX`
v3 -> v4: Reduce seet and set focus on RNG fix, blocking and nonblocking
v2 -> v3: Removal blank line, rebased
v1 -> v2: Removal of C++ style comment
---
Lothar Rubusch (1):
  crypto: atmel-sha204a - fix blocking and non-blocking rng logic

 drivers/crypto/atmel-sha204a.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)


base-commit: 5db6ef9847717329f12c5ea8aba7e9f588a980c0
-- 
2.53.0


