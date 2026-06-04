Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1B6CD6E6E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 20:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iJnZuwuMHvW8L98BhZe5fgrtMJB4sNolVVw/sf9vpDk=; b=daX9U2VOzJEAJUSsMatjy9EDp3
	5QbDDIoZaUVB3VWV7619kgqAylt9yHqxm2YHGy8ppamqivTud2nJRLCKowKdoZAEygR+vGC/K1vD4
	vZkL9PzDE/lzH5+IxxRUHEDbBIXqg3D1OLdDpmbhqtyRwkrnZuI23+pOqyeMSB6Nb+TQkJCgg0MmB
	BEceMeSB+W4eVf/M7JRKWdNGVQfEg7PDKXSMMf3VaxoGpDWieJPHJE+y+RBgIaG0okPLR1RVEoLWA
	V7pBiWh/phfwcOzVdTWtb+9wvXq8CK2Tg2FI6DBP75S2wSH6vOeUB+DzVrN+sbE5WX73KEKEvnPMb
	wWk+JsGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVEo6-0000000HHoO-2Ito;
	Thu, 04 Jun 2026 20:36:52 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVEo3-0000000HHnz-1df3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 20:36:48 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-8422f148dfcso646938b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 13:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780605406; x=1781210206; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iJnZuwuMHvW8L98BhZe5fgrtMJB4sNolVVw/sf9vpDk=;
        b=Br1QmTFo0qFVQoKmS4tX55/hL4114OjKIElh0nLD4EAUovQ72M6Zi8PhuIvKkloYNZ
         3vS9AC98dimbS9Q0T/kgKd+1Kk1r8PPwsc2DleWx9eM6YncoKCW/bEg5x1sNbzBzINkz
         VmN6guc+aiLYgaCiu90fohkDYPeuFyidmKnnLyiPmCU5XGC5tOmO9yvx7JW74Pkq+idW
         RzrbQzVxiqB2JCAw0D+cWHj1uWOPlC4/WOEJqrxnDbY+OLgl+qbNInmiqa6/SAniY8SJ
         NlBj2nK0qT6hxfzynYgoBqzJ9FP0RNEwRu4x3Ns8zp/hMPybnuCjSjvmaVZvxtXF/VcE
         CpDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780605406; x=1781210206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJnZuwuMHvW8L98BhZe5fgrtMJB4sNolVVw/sf9vpDk=;
        b=sTIrjO8EWsJbx6aBwvOpN1K3n/0ie1huw6991DQGIm7MKgU25NRNif86WUr+e/vbix
         8CbfzQWVdkqm5OHGKHhGinuOFXkUQI+dAomfb/0r8kFuZPsXoGiHb0Ta2y09oAqOU53h
         +bKQco8xGDoTtfJ85rMqpJCZTr2Xy6Z8iJxpunP4qLr+INxiyGMPS6VCLq9K+RFSx1PG
         COh+FDIrU1yNz+VgSTOqndoYA/S9xGHc6IeSs9vfmiVfPCZEQ7mrcLpqmhnLRH8vT7yV
         Nn++pGRTjVTVEKsaZejFj1q9XsuTBQ+DF9Wed7vlzwy5fRMEKm3MhbmavoztWfTfVJmo
         YyIw==
X-Forwarded-Encrypted: i=1; AFNElJ8rLZPfqBcFFxH3GsfhHQc7a6A9bWAjV1JCLYK+hCN91bxH6P0nHLgFkYyBpOHJdEQ+zkzUdbUAgVwW5rbj3PJk@lists.infradead.org
X-Gm-Message-State: AOJu0YyXhgQuBOgpMgVEi0qWhWgGypb0vTwcNwEU1/bEzDvq/9B76yMM
	S/L5LdGH9VuWbMdDO2wxWde3uPNh3kv+6B+8DTyEr3jFqMPDWZMB2mLi
X-Gm-Gg: Acq92OHThW9na/veLzC3IChVIz47J/wrq/H7MLF7PufMP+XXMwhfvGef3C6KJkXC+Ij
	M6u8kuruiriw3/msnvLf88XUN+SuX1MOBJshdrwtMyvgTzldwnf3+Cl2/UV+H+SQtArGG68KaX+
	mwZw/sArPOAS3JrMvNjG1VZE6NfVxS1au7wGg/9V4W2UL49X1jYlp/mLqI3nDfjpcwLlqDLbLQZ
	SUm651rvsh62W/8vUsu8RsbSBDTruEbGKmCPfhpEjoOObJ3WJJCZtsepyKtOnCu5AUH6NCQPXK6
	X5EtdxJ4RG/dBjciYpK4kqvZ+KDtGg8cRz/knnqVZgoXN2G+Y1lgVRJEKKJ+BGz86UarQKGOkOH
	dUjZr7Dcj142GTe/MDlo+ZPliYFQzG5wL2X+tVeNZPmoo5FjMqpwkbNa3zEhAnqxPj6dviUJHfx
	I4ph9/wZvA1vrAoAS2LdcHaZ1ykCy6Xyme4HV+Vy3JcqxOIjX2s8njy8flIRBrNpMWwIo0vBK6b
	pCR
X-Received: by 2002:a05:6a00:4216:b0:82c:24d5:63e6 with SMTP id d2e1a72fcca58-842b0e619camr323397b3a.15.1780605405545;
        Thu, 04 Jun 2026 13:36:45 -0700 (PDT)
Received: from Ubuntu.. ([49.37.171.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828fe634sm7118257b3a.52.2026.06.04.13.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 13:36:45 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	manishbaing2789@gmail.com
Subject: [RFC PATCH 0/2] ASoC: atmel: ac97c: Fix IRQ handling sequences
Date: Thu,  4 Jun 2026 20:36:21 +0000
Message-ID: <20260604203623.162640-1-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_133647_437747_BE6436D7 
X-CRM114-Status: UNSURE (   9.79  )
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

This series addresses two hardware initialization and teardown issues in 
the atmel_ac97c driver flagged by the Sashiko AI bot.
The original report can be found here:
https://sashiko.dev/#/patchset/20260530052812.115994-1-manishbaing2789@gmail.com?part=1

- Patch 1 moves request_irq() to the end of probe to prevent a null pointer
  dereference if an interrupt fires early.
- Patch 2 reorders the teardown sequence to free the IRQ before disabling
  clocks and unmapping memory, preventing a use-after-free.

I am submitting this as an RFC because I do not have the physical hardware
to test these changes, However, my manual analysis indicates these are 
valid bugs, and the series compiles cleanly with W=1.

Manish Baing (2):
  ASoC: sound: atmel_ac97c: Fix IRQ handler null pointer dereference
  ASoC: atmel: ac97c: Fix use-after-free on driver teardown

 sound/atmel/ac97c.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

-- 
2.43.0


