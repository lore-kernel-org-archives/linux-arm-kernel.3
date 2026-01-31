Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7821D7977D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 16:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LquA6UvIHZojV0lXQ8Twrjt3A7E6bOJA9Lb19ucfhkw=; b=V5AbMHiiWi00miQcv7LdgKXzj+
	CIdf1jYbXy6E6WagCV4v8HlEBVxsep6GPxQC5P42jqF4d0r0ErBbhCEAVAhkTng3HhxySLvNtYhw7
	k0iiff1ZLszvezd0PzChvEh6L6HErPOY0qW6OyEM5ScKJ4xO4LLbY6qfloJgpdNPomtfPCcfFQNTK
	SCg14JHlwK5TZnrufYoAO1PeX+Jk7wVilZzuPz3JJOCIDk0zzzdqVPtpwmaV6Flo+lM4Bc3XaAcoe
	tATjMLrkE+JDwra16PEVbb6pBOejYuEgXzWHoY1Zh+lYr5rhALsVNiViTeMnhPJHZk+i3W0+ytUYx
	y0HVBbGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmDal-00000002nGq-09OD;
	Sat, 31 Jan 2026 16:12:59 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmDah-00000002nFv-3Oe1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 16:12:57 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-658d3d3ac37so5173122a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 08:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769875973; x=1770480773; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LquA6UvIHZojV0lXQ8Twrjt3A7E6bOJA9Lb19ucfhkw=;
        b=fKgrIk7g5WgqsXnDabeWTcb4pKOBGw0M6RIFkzhtEyGz2Dn0KYRlfqnVcF2EIuQVax
         btybhTJ/UabBVIOaE/9MscW8eNODgP2LNyUjR9Rn/9BTtV+lN8u2Q/zR9S/eYT87B+Cz
         YAZNGJPIJ0HTGn2PI2GwNML5xVRhrPxDheYUUOQvOMuhBMvYm5Nc7cR4YCCFByysm8Xn
         roOkZEt7/Bxe6tL5HILljmICinAyHPfK5Qe91sXGNXV2WD9B7KMrC+R3TwiDd6ZdL57v
         UvZntYzAdQ2z45bZgzYUVmx4evyEDQy/ZmFn6LNjCiGpWYwunGIcgxi93TpBte7CLu7F
         eDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769875973; x=1770480773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LquA6UvIHZojV0lXQ8Twrjt3A7E6bOJA9Lb19ucfhkw=;
        b=xC4eov1QcTDGDvqA5amEBtDxSYB/W5lb4uf0UO2Fvyk4kRDJt99LshfF0uRdbwSYtf
         84D/DkHztqr4EQZBibUGZM7mcFHzjXmlsWSMqcZKd5nRL+HMXWfbWpVVijGluzEtrblH
         N71cvhrECAllZyBYhDBHhBmp2tJLSJsS6TtQAK3avdkeA/lF8/IpZJUiRRwlz4CMc6Am
         1n3K5vCIC6tribFZW+23phsMWtAOQZd6XX/6IMNA4YZkqgp38nYsygwcPuOk5yM54nuv
         waKVF26NsC7KtUWjHf4BgXOb9B4WDJCqG6mezyPw1Ucs5u3tUhQSxxprmy5i8WK7cEgk
         Dylw==
X-Forwarded-Encrypted: i=1; AJvYcCXoRDwv0hn77W42RS6n0obZ6uEQFKBqcOo+4kJrPxSMWMLq8WF6Q10yCUDvEM0z0hKMeAwafdjlw5jJzI3wmrVH@lists.infradead.org
X-Gm-Message-State: AOJu0Ywi5k3aWDlYjyU5fNCRyEfcg+hg5r5Dg7zDa4/IsfgEdfYBxtt8
	ESwEPpDd6QzgkhNcf06eaJq/rTNs0xgpyXjSljGIc+xzljGoirHzwU7T
X-Gm-Gg: AZuq6aKGDgr02RBlnzmaYjS1+s1DMwFTcVhFkGskoaY+rcJrh1FLzRCeUTEfg7ODYA+
	PPdCY6Locdc+r3ZrMd25efDY/Oav1/WJZ4ze9GrcwN1+LJp/nqJoOg4+PfMuHyJhiUr2F0lr1ot
	QT+MG3oD8JMJgXKXJaBoYqpQfr78H8Mjz9AnYldKVuf3P9PzdN5t1tBKyW7ksJ1uMoiJEcsKmMG
	Dtmf58poptM0ozWxtE9J6ifW3nJA1559IX6kXfdyU7LWl4Q0vQlhq3t6NLflBQyKHiFSgy2/Es8
	EFGrmdJlaS65376gdqhxIdXep46JsShz1QgdPTbUULCy5aPLWimYmTvIDbgOz+B7yXh5/GPUNBY
	Sk/fuyfPSCWCtzqypMPtb+1iK7vJzgkJ+mE7+0a/+rINeQN8YTCjQ1nw7JKWw+bz6TmMisZGHnL
	zyGH+GWPN3GOvp6HyyzGjEL43s7GOW7TlqN9Y=
X-Received: by 2002:a05:6402:399c:b0:658:c140:4edf with SMTP id 4fb4d7f45d1cf-658de58b52amr2912149a12.21.1769875973316;
        Sat, 31 Jan 2026 08:12:53 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:46ad:7674:ff90:13f3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b46ac0e8sm5433232a12.34.2026.01.31.08.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 08:12:53 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH net-next v3 0/2] Add support for Renesas RZ/G3L GBETH
Date: Sat, 31 Jan 2026 16:12:41 +0000
Message-ID: <20260131161250.5047-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_081255_863499_31C18216 
X-CRM114-Status: GOOD (  11.32  )
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

From: Biju Das <biju.das.jz@bp.renesas.com>

The Renesas RZ/G3L GBETH IP uses Synopsys DesignWare MAC version 5.30
compared to other Renesas SoC such as RZ/V2H that use MAC version 5.20.

The RZ/G3L GBETH requires an extra clock compared to RZ/G3E and has pps
interrupts. Document the Renesas RZ/G3L GBETH IP in bindings and add
support for the RZ/G3L GBETH in dwmac-renesas-gbeth glue driver.

v2->v3:
 * Fixed the typo ppt->ptp as pointed by netdev-ai[1] in bindings
 * Keep the tag as the change is trivial.
 * Collected tag for the driver
v1->v2:
 * Separated ethernet patches from series [2]
 * Collected tag for binding patch

[1]https://netdev-ai.bots.linux.dev/ai-review.html?id=495cbea4-c154-4027-9ecf-0167906492fe
[2] https://lore.kernel.org/all/20260128125850.425264-1-biju.das.jz@bp.renesas.com/

Biju Das (2):
  dt-bindings: net: renesas,rzv2h-gbeth: Document Renesas RZ/G3L SoC
  net: stmmac: dwmac-renesas-gbeth: Add support for RZ/G3L SoC

 .../bindings/net/renesas,rzv2h-gbeth.yaml     | 77 ++++++++++++++++---
 .../devicetree/bindings/net/snps,dwmac.yaml   |  3 +
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      |  1 +
 3 files changed, 70 insertions(+), 11 deletions(-)

-- 
2.43.0


