Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C30D5B85E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 01:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ykES3oDK4GWMgcJf+eyKS9L0HXbi9j2qtJXcGhbmlY=; b=JkPfb2lS/UAdGjKY6X62Q1lj33
	11OP8pjrhYSIzARAwcfGBQkwMiLXyFe/i56M2h4Cf+sFhGLfapWprMzOUalHULE2SvWZx4qNmEF2U
	J26GYPLW2N4L0j/Ru5bl9997n7S1iQq/8W+bxjOjCtNUmzOPdn5aH5fMLb9Q2i2g98Te7vNdzMHnV
	3CPvRqFBOg9JRHkHVaUn5ErpCSyaRd0u//1lPUHCyzzmH9ugi6mCRQWlQHLusxtjaxOwcoYLTf85o
	nPxPe35K9SVkcoZAxw/8t0rzCdIAkz0tTMGK+U2RCbLHpiXRIHx/RPHkwMDbjzbFY/xohvM4oHAg2
	sCEy/C5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5aju-0000000CpLG-20ZP;
	Tue, 29 Oct 2024 01:09:42 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5age-0000000CoTA-1mtV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 01:06:21 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-20c767a9c50so43210525ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 18:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730163979; x=1730768779; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ykES3oDK4GWMgcJf+eyKS9L0HXbi9j2qtJXcGhbmlY=;
        b=lZ3i/tppWrMLnAjktSMIDU1391Qg1uPnDpFR8dgj3NLltA62qaXZj1OSyqVsJ+K2Iu
         885OmatHEw432EDpmQDZa7yF4+n4T++/c7SDkuiVrcq1LXPgp9sx3uJjnx7zOmYvJx+z
         p5hxhuEL1R6yMzEyjGdLi+1UTN6cXbRwKC/x26820dxcq1I9mLXFGm1RJL1lMtCgRQ68
         n0n3jtOTmkwgtbTzOIy+yvvZJMX560YXfpyqkq4JFoH7AJpR+dKPBjCaeJjQqZS9Etvr
         pZO2/VTrrrPZ8Bj/x6Z1zY2eRds3cAY6QsAoREHb7qQFjMsHXpgibePEnrPJsDcoJQmo
         4KlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730163979; x=1730768779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ykES3oDK4GWMgcJf+eyKS9L0HXbi9j2qtJXcGhbmlY=;
        b=D9J5EOcbh83s5qa7ygA2rcmVChcSK6H9f5KhGzE3gwDjW0Pr5xe2LVdq0wbB2eamOK
         heyANrUcEekvsrBZHzj9syzaxavshrCPxLYv3z/rdgTnCGrvUomdRgAVNKjZHb1jC/Ce
         713i7bckCdLaZiU8CEkoUiWc9l6IF6ACcrmmqLTnhz9mLUZwS1bKwjlgVuCJ9dBreRlq
         szLgWknFWZnDWbryvkkn1zqN6KWisReKf7GIjqmTqOkGCxT2OTLZfqM9+Ghq1h0qcpWl
         EQAAXhE9iWo52g53FRCXSHuvphGy5dbMTd0d3bmhOKWQFcVpRwyaTnSVZPL+pl1E270k
         +LIA==
X-Forwarded-Encrypted: i=1; AJvYcCW9DdKLYjKb0+d2/m6z4hq8/Ydn7I5rRF446cM7hjDt27shBXuRjKimBzhIbtoL/EbnDzX6UJksjBa8oNTPj/Rk@lists.infradead.org
X-Gm-Message-State: AOJu0Yy80FgBUEwcs2FZB6dSB9LOhMEfEwti7fLI/jTqv9oVHpwTuJe2
	mPOa8mtLlegvXiHO2DDqvEpz+EyJxA5+HIxBP6eJ1flk9KsfXi2d
X-Google-Smtp-Source: AGHT+IFeHXHCcPoPLxySF2I8zRYb1t19CJOoicaN/3KR7j3X8ouOCXsEGoLKx9fWFvaUXkzRPg/WQw==
X-Received: by 2002:a17:903:41cf:b0:20b:51b0:4b22 with SMTP id d9443c01a7336-210c6c8f84fmr120951455ad.47.1730163979437;
        Mon, 28 Oct 2024 18:06:19 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-210bc02efb1sm56306225ad.221.2024.10.28.18.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 18:06:18 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH asahi-soc/dt 01/10] dt-bindings: arm: apple: apple,pmgr: Add A7-A11 compatibles
Date: Tue, 29 Oct 2024 09:03:59 +0800
Message-ID: <20241029010526.42052-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241029010526.42052-1-towinchenmi@gmail.com>
References: <20241029010526.42052-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_180620_485134_5AF4C0B0 
X-CRM114-Status: GOOD (  10.21  )
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

The blocks found on Apple A7-A11 SoCs are compatible with the existing
driver so add their per-SoC compatibles.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
index 673277a7a224..5001f4d5a0dc 100644
--- a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
+++ b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
@@ -22,6 +22,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-pmgr
+          - apple,t7000-pmgr
+          - apple,s8000-pmgr
+          - apple,t8010-pmgr
+          - apple,t8015-pmgr
           - apple,t8103-pmgr
           - apple,t8112-pmgr
           - apple,t6000-pmgr
-- 
2.47.0


