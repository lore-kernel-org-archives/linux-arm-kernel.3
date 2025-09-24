Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF631CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 09:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aU7V00+zuQKk7Voi/XulM/d8ejeausZ1gHzc4r7h4R8=; b=GyaAF9EExOxWzK
	U7Ig4avpdUt9DVO5kcbZ9+ZtLAiKmB7xdNjPIKdL9KMLss7NbXN/tHETaZ7tA94+U2zAlmHYIQVH+
	RTvpopSc5F2hQQ1lkaYpwL2a/jVG8xShOvZ4kJLym6BEAxu5qRHB/LeVALlK2Ll/14Hg78V/WR8Hb
	ctgBnLtJSNYqrCt4h9gTmgKGWe8wZIUs6CniN74Q9eZvqn58YjJLIWKq657qeHoLJeMIGWjpFKFbM
	1b1pyx1sFeZgl0M0tzMSNgpKahgQ+gVpe+dOQK6Bs3JTl2749ZtY9+LuisWuZyDGFy7A8leYV9YJq
	W1vTJ8bXzdwhTOwumqYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1M3P-0000000GA7k-41lV;
	Wed, 24 Sep 2025 09:44:51 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1M3N-0000000GA3J-0TG2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 09:44:50 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3ee12807d97so5715549f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 02:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758707087; x=1759311887; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aU7V00+zuQKk7Voi/XulM/d8ejeausZ1gHzc4r7h4R8=;
        b=m3Y8eQPnxlixnd4rA4ss+Eyr/J7klTwdwDJCbWXouCjhVPVdKnFrCpQDH06eNNUQKB
         jMsFsXFH3Z9pgvYxPDN1Wev0TWapdD3aFiWpdNCvX68CqtRYnSwEnnSAtHcVfwx/Hz84
         dAUpAeKYpNc2Umz6K6+UNEdTrGH8o99mGAjqsX3baZ5pPBps7b32RqZrvjUrmGMqjUDa
         uOCmyWNOR2KO0ZuhVT+F9dwsZ13qk/dLhBhPe4XzIXZ/MapHSHWlbHzYEZWcxiGfxMIf
         h+qe5gLDwn2KzCxWLoOf3rN+mpZa+9L7xMZWbRehGgOENKQLSaYvJ3PBvRCq8thdYmA6
         BvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758707087; x=1759311887;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aU7V00+zuQKk7Voi/XulM/d8ejeausZ1gHzc4r7h4R8=;
        b=mlIN3TZN+ak1k1dJ4aZ+iLNsfi9B8czGbIhopJwcYUqYpMNaEODLe+uBZu+RD9b6+n
         1xgDvBPfDt5LrNDDdAbx5Wdu/gm9raJM//PTg07GNypCimTNexTNgHPkhBHsWOfXXwpG
         KTUkeSC/ka6YKvfcn0nfz0UxDwr/Im1ZGmWlmZTfCXoLhwgEDTftbEpKKIqrgY3Urjpx
         rn235wPpUSM7RYyq5ipchipncQKQKToq7w3G+AEPj4LGjafhWn5idlxXh9Oow/uOsfHu
         KovFulHIHshA6aaGK7jCTx2s4yBUfSLCp9X1kRr3y8LT5hoEe5/1sd+fQlyAawKzxLtM
         thVw==
X-Forwarded-Encrypted: i=1; AJvYcCVPq/JFL73ekxeySulSFX6yy/LOGwPkP0goedBHcD7CrFvo5VAWeHtFgRfV7RS01vBK8pJPX3A0S8ODv5tRaIwi@lists.infradead.org
X-Gm-Message-State: AOJu0YwWoiBz+4fAgqw2r46HJ6Vwd3a40EDTN8Dx7yNk7ovnmzb3EewE
	JnRB8CZ7Vo5zBYvMcsHjoNKN+S+CoBlPFNM4Bvp35dDWfFlUkQRuMWKE
X-Gm-Gg: ASbGncu7woPs+lfa073lQbh4gELlWMy685SxOi3/2inHB4H9V3XFrqSLtZEVLPiX4bj
	CvDC1ou2c21Bd8+1PdZX+RUL5rVPm7ZVljYUYifUphocjKaAcru6frGuNxsS+768iipiypRqjb4
	rcLM0s313BkMrGLcixB3C0gnPwI4vB3owg0Z/eZLaiGgWMxPfFXFc28nnkl2yWYLGSCc8mRuSzh
	PvhnxFHAqFZOfuT8Xx1hyskwxT6JaxlZ57MVizNXTzxwmyx6OAdc8zOLV4Dul2UMaYGXtxksEsY
	7MWbyetgqRIKyTff9O65B+1tutI78OyJ0ZQjXpRX0OU7hywYmUPndpsdzAT63tLOL5/tmgxBwP2
	zo8OwCOpqOwUKENYJgOyMG1+ceDvvEhNB9gUOmyrkVWF6qGh7sYcNG+k4HMuw3fX3gUPGOTmG7U
	j/4Og6EojMV/0uHA==
X-Google-Smtp-Source: AGHT+IFpHasan3pFJOdP5ZGB5ynPDa66E5OeJLF7PLwNIJrHXHfWU8ia57w+wOsWZehdESEd0RRK+Q==
X-Received: by 2002:a05:6000:208a:b0:3ea:6680:8fcd with SMTP id ffacd0b85a97d-405c49a250fmr4780811f8f.13.1758707087081;
        Wed, 24 Sep 2025 02:44:47 -0700 (PDT)
Received: from localhost (2a02-8440-7503-805b-0076-f865-8f03-23d3.rev.sfr.net. [2a02:8440:7503:805b:76:f865:8f03:23d3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2a9ac55esm28446145e9.6.2025.09.24.02.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 02:44:46 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Subject: [PATCH v8 0/3] Register the STM32MP25 RCC driver as an access
 controller.
Date: Wed, 24 Sep 2025 11:44:41 +0200
Message-Id: <20250924-b4-rcc-upstream-v8-0-b32d46f71a38@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIm902gC/2WP0Y6CMBBFf4XM83bTFiiFJ//D+DC0M9oERFtk1
 xj+3SoPa7KP9yZz5twHJIqBEnTFAyItIYXpnIP9KsCd8HwkEXzOoKWuZauM6CsRnRO3S5oj4Sg
 sWsIS2aD0kK8ukTj8von7w5YjXW8ZPG8l9JhIuGkcw9wVsiHdoFembFtk501b9pSfKdVLz0imJ
 GlUzfAp1BWfOhwi/eAw/Dl5Jltbi1qx7ZYGXh6nkOYp3t9Dc/US2SBa/9u0NEIK7dlVJJXlSu6
 OI4bhO0vDYV3XJzN1wsI2AQAA
X-Change-ID: 20250916-b4-rcc-upstream-8a8ea3af6a0d
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-0dae4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_024449_165535_85F70935 
X-CRM114-Status: GOOD (  11.28  )
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

The STM32MP25 RCC peripheral as an access controller is allowed to know
whether the clocks are secured or not.
The STM32MP25 RCC peripheral knows about the clock secure configuration
of all non RIF-aware peripheral.
In parallel all the RIF-aware peripheral configuration information
are known by the RIFSC peripheral which is already an access
controller.

Changes in v8:
- Use uppercase for peripheral name in commit message
- Add the '#access-controller-cells' property to the RCC in
  stm32mp231.dtsi
- Link to v7: https://lore.kernel.org/r/20250922-b4-rcc-upstream-v7-0-2dfc4e018f40@gmail.com

The v7 is a subset of the v6 and other prior versions, split to simplify
the review and merging process.

Changes in v7:
- None
- Link to v6: https://lore.kernel.org/all/20250909-b4-ddrperfm-upstream-v6-2-ce082cc801b5@gmail.com/

Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
Clément Le Goffic (3):
      dt-bindings: stm32: stm32mp25: add `#access-controller-cells` property
      clk: stm32mp25: add firewall grant_access ops
      arm64: dts: st: set RCC as an access-controller

 .../bindings/clock/st,stm32mp25-rcc.yaml           |  7 ++++
 arch/arm64/boot/dts/st/stm32mp231.dtsi             |  1 +
 arch/arm64/boot/dts/st/stm32mp251.dtsi             |  1 +
 drivers/clk/stm32/clk-stm32mp25.c                  | 40 +++++++++++++++++++++-
 4 files changed, 48 insertions(+), 1 deletion(-)
---
base-commit: 07e27ad16399afcd693be20211b0dfae63e0615f
change-id: 20250916-b4-rcc-upstream-8a8ea3af6a0d
prerequisite-change-id: 20250916-b4-firewall-upstream-dfe8588a21f8:v7
prerequisite-patch-id: 1ead960f405c7a2dcc9111acd0bb4c95ed33954f

Best regards,
--  
Clément Le Goffic <legoffic.clement@gmail.com>


