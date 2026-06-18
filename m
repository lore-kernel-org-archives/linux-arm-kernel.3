Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56AE6CD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 07:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4bQGAYRRaV2+W1903QsWxmruXddrxMYSZxLh/ZQ661U=; b=SZFzknfinAMWf1
	QNStDoOUmcz+jgw30sMXbsmYWMvNomDzoCajSUicFCCW9KsZ9fDjIMzuNY2r/O2TBFQd1T6qpxurG
	pzb1PIT2jf1gh5oQBeXK9sQBD9wIadQHM7p70dOSoxu7p1TSmu4OT0yiY+1wp19YNUYg4yg0Ggal5
	/lQBeytNrumYW9ZZEQD4s+cDkrKPgp5CmWiaUID8ZiR6T+D07/a1pnp2LtLacfuTXga0YICIcOges
	TjolWkMIBrrV0PjeVC/Puu+w9EllORMk4ruR9EVMB8QGHl9x59OAM9/GUrcQnVmQMreVqXF6yRTz6
	ZA11nRoMzfjjOwZA+Ypg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa7Mo-00000000mtt-1OZi;
	Thu, 18 Jun 2026 07:40:50 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa7Mm-00000000mtX-1ia8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 07:40:49 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2c6bb8a5980so4477725ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 00:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781768447; x=1782373247; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4bQGAYRRaV2+W1903QsWxmruXddrxMYSZxLh/ZQ661U=;
        b=erHLnRvmZad3IPGpDwByYrCFkaCe41Jvmbip7P8LonAEES/9YYTI8h/wOWQDKZDBWX
         LwynZpfNorf/UHrZ/KTMoPjX/HnBUWafnK6yExSS18zI493fElofejIqHgLdaIGCyXT6
         dMUSLVi5Als4ODB8n7wNfRq3Yd3a1Jt1fsrjcUsgg2UMsRFz54CvvG7GTML2LR8qDQ84
         /GdGtBGNO72SVw6rmxJBAkHQWUDwIBEqmTqIMM6XR2P694qKkp/apjkqd/G94Z/BZPrk
         y4ucZbyZrrampIAdnjaEhP6osTKKI8EyxmGgrcrlFowHFlNA9aO/CUzj32giB4AQv0MI
         pTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781768447; x=1782373247;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4bQGAYRRaV2+W1903QsWxmruXddrxMYSZxLh/ZQ661U=;
        b=K6AJ8PdoNHrR2R6PTh59LQtezdBteVCgzkKfNo/Q1rWHswOaZlcwsAF7J1xoi4/OSV
         eziYw8ZtMJcjM3S+l7Os9tTTn1Dnhwu+tuW/utjg1K/u/suaVTlCMAv/OCt60nmx3JNy
         tSfq8aFJ40YeQflf9joy3wAgaq4g+ATMMHWqMZNYIqdh1F9w4eER1Lx2X6njjpEcVaeX
         Cx+RRYVoNljQpkrM/17grEFAcSBiuEGaKgQDk2ANM9Swe+3cn8TKGK9NNdU0qJbFNz6+
         +TtsH3iwsaNMgIBqQz4Nen1qPd3H67ErkU3WJPNmksYeGQzZ0mcKcFajzux6cTFswi/9
         FTDQ==
X-Forwarded-Encrypted: i=1; AFNElJ/r7aC0BGNm9p6q69X5wpQCrTKG9YE1l0QOomtYYtoPYaCPviEbS+Bmn1z+aM83b6L2RiHVQJQO9VEEr+5XBZ5w@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5Es06wJZiudLy/KtlIKW6z1nyZ1Kmq+GLBtALVJPUCearOnDq
	whZr+RIb392Hz+49jgWE5ahRT8BjGrTJ3vv0B9VTBstERL3MEYWDlw5+
X-Gm-Gg: AfdE7cmhj+9NTQXQPHvSD1z8E3ze6yU6vtfwWAs9BE2easjX+1CtLwoNNfLlwiSGNR+
	O/MLrirEjS1p6xz3stakHYlVO4eFaniBYJmLcHEdWQDEzjm6t7RDlNWK7mfMWv2ANG5RTAr6BU3
	ddbGVHqYD6nu/MYJjFPQ85QM0GmCHkaYeViI4+c+4vY2BDirmfrBrP9hrJ5rOmyZQM1iaTOQnCx
	8ALNrjYbCN/ehua8jOgavPt7BNV1IuNQ8CIaZCNj7m50FIMfElPeE64xYTpHYhV9rYWkJisJhcn
	5fvskLPlcU61s93z9Lt9fKOFldOoifgo5YscfxvXVK8QIXbB05IsvZ9S+apgrIBg4ibIiAVPFA+
	t8lSLCHhuRqrEV0d/v50VK/Z6ek/BAnkCYHUKey9LcvfQd3N/XYzQ6iwVTspD0AOBY49zVKUKpn
	OHR/0dy092nJeu9+l/7GGtQqsOnR0OpOpYzY6by0t+bBXH7rqzVQ5vNKbV
X-Received: by 2002:a17:902:ce09:b0:2c1:f29a:b554 with SMTP id d9443c01a7336-2c6e5276358mr27029345ad.21.1781768447233;
        Thu, 18 Jun 2026 00:40:47 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327ac80asm170465445ad.39.2026.06.18.00.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 00:40:46 -0700 (PDT)
From: Mike Hsieh <mike.quanta.115@gmail.com>
Subject: [PATCH 0/2] ARM: dts: aspeed: sanmiguel: configure LM5066i HSCs
 for PDB
Date: Thu, 18 Jun 2026 15:41:43 +0800
Message-Id: <20260618-sanmiguel-dts-config-hsc-lm5066i-v1-0-cccf959c9b78@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NQQqDMBBA0avIrB2YxDYtXkW60DiJAxolY0UQ7
 97Q5dv8f4FyFlZoqwsyH6KypgJTV+CnPkVGGYvBknXkzBu1T4vEL8847op+TUEiTupxXp7knOC
 LwoPYDI23DCWzZQ5y/hfd575/UlJw3nIAAAA=
X-Change-ID: 20260618-sanmiguel-dts-config-hsc-lm5066i-70f40e1b3c2e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Mik Lin <mik.lin@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
 Mike Hsieh <mike.quanta.115@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781768507; l=715;
 i=mike.quanta.115@gmail.com; s=20260522; h=from:subject:message-id;
 bh=6zTiz3w7GY/mvuRAIGS25k8loWak+uMbX/Tb1hT6QIw=;
 b=R8LnW7P5uTR3hdw1TZeBW8HSvfQD7fYHI9xc1necYSMYzKw9jzZdiu94yh4PMMYgeAVq/vigV
 vFPAg9cKrhjCTvvTTCFFjDEgtIjsqVID5CvUPSzpINlUFc7KvOFHrLK
X-Developer-Key: i=mike.quanta.115@gmail.com; a=ed25519;
 pk=DRIErV0xX0KMBlR/irAsbuN4L3egitHbC8FHruUH4HE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_004048_457262_F3E60C81 
X-CRM114-Status: UNSURE (   9.21  )
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

This patch series updates the device tree configurations for
the four TI LM5066i hot-swap controllers (HSCs) on the Power
Distribution Board (PDB) for the sanmiguel platform.

Signed-off-by: Mike Hsieh <mike.quanta.115@gmail.com>
---
Mike Hsieh (2):
      ARM: dts: aspeed: sanmiguel: fix PDB HSC shunt resistor
      ARM: dts: aspeed: sanmiguel: add current-range property for PDB HSC

 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)
---
base-commit: 57596c043ad59cf2e53fadebf6d1b418190e3a49
change-id: 20260618-sanmiguel-dts-config-hsc-lm5066i-70f40e1b3c2e

Best regards,
-- 
Mike Hsieh <mike.quanta.115@gmail.com>


