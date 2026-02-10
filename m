Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791EDEB2700
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 19:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=erTmcC4BRsN72TnU7ILsQhSKr9ooULobI3aSeUy7isI=; b=bxP5VrEbIqx/t1
	JhXN4ioWWuMvcxJFjI/TCpS6XEwv3BB49jAhvsaGU+q/AqynK8ONTGGZu5+pIc+G6s8d7QZJUswhO
	4WpIcLn3vGIseJz78AcJ4GUw5xb60mUmSRs2so+B0kKzgFs/4d1nHxGDCFbvdH0WCru1L3jnzhrDO
	m4jz/gNuZ2XFS4toOKIRrLx8OsHDFy7Eiz/kYB+JQPkqFqZXsggf7t11hagSnSKKPlaHGKrlAFN3D
	ZX1eX0yhfsma17tL5rd6EKND7Tnhq6h9T5uXOJBnixeBIxQsstsZUeFFOFSijuY53TOmMUm1SeB+c
	V9wlNQDAvANvyGSLjmrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vptUN-0000000HRC1-1vHL;
	Tue, 10 Feb 2026 19:33:35 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vptUK-0000000HRB3-2BmZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 19:33:33 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4359249bbacso115553f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 11:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770752010; x=1771356810; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=erTmcC4BRsN72TnU7ILsQhSKr9ooULobI3aSeUy7isI=;
        b=Nw6DNXpY8gy6xsrm26YEa4pPmdpft7QbexjTiwtnns6OnAYbMpe6E1weq6vQbWqLxB
         p/KfkA6ShBJB4nBOibg59XyWhFml6429sA3Qz5tSTnf5uzCbjQNRqGOElp7Ff/rIRWfP
         9cwa/bvyDj1VedHxtISGuIC8ZqXJld7+hHE/XMNEo6uwd0XV2HqIpnoS/IirLXvm+6ev
         GLjVtNH8nTpjF7+Z1xhHQob+H8TtlUAE88vKUTX+Rqh9k3TbMs/FF0/udSRpI2ZgdUmf
         o9WdEsePuL2nFL780TkK+/zIfYTFcLG0/RpFjmLzhxxRYa7WdvYrs/TjJZjZTZxDVzoE
         /zXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770752010; x=1771356810;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=erTmcC4BRsN72TnU7ILsQhSKr9ooULobI3aSeUy7isI=;
        b=Z9Zi9DTVdbCpLaih9pGiH9jNCeZVsCsJETP8811vKMycI86kbUc7NWCUBG5rvj2bQG
         7xNvxiV7f80V4yFzQ8NlFIeP3s4yrkkEu4+BnhQHl/2drwTwQnhd7wQEGszka1fampNl
         EJbFEuOEzOjXNlfyjEhG/Xu76dHe91xD6lqJL5ns4RI6jAjHG/47pKQ/uFW0tPUB8dPR
         Dat3I5Nc3T0WdX1AbYDHBs0YcLLrNtmiUd6jsyBJnhRvTmA3iCqvGNyZ7KFC4v+dmHre
         yXKYBRJR/J+rZgpWSkUi5elyTkUrQUaG+u3xN8uyum1z2JAGhUIXOEOHMhavIiS81s+W
         y9EQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1xUDdovF76D7DXZn7Bf2b9pTunju3cR2o9sV1BakEuEp+TiweSAtt26LiaWnGCdb76NRrIN5ubumekjdqoDHA@lists.infradead.org
X-Gm-Message-State: AOJu0YxZLgYZpupup8gFEaymYUpfvLNmKSoNV5fD9XhT+WqxXvF2Ccve
	k4kDylE7D+cdLKtSyUz/PqsVPyHD/nxtPl4d2DXVp/pQstJeFqvezZq7
X-Gm-Gg: AZuq6aJkZhWijSYhOtYIGsJZ8v4ADJYuNYcTo+b2FaXpQVVZwa0e1OT1JUKmjF/kSaN
	BzUMnYjNF1wyGhPOZRRkn82x4UL9dEnGhVH91eixv2B40LYVzssbpjQex5iIORnb6cvrPSKdeNy
	nO9rbbg8cohXY5WdV4PRhG6KQKyRHnqRYdcjMGYVf/z3J6JVCrd3uFZqiqNDZj9Rgvum4yqsaCD
	XV7pZuTmbF8Mk+8VHFfSFXexAsNxAMP9J8mPXU2NabyYcIkjHqNN/aYCy19NrdX2MydVzwOUq8a
	JO1JYpxWjWp9Weh0Ve+dTKTyhBLweEUMjQSFvdjsPi9k0xuqWfF+H2CtNp2e+IE5TPE6r6Lv1F3
	tWznt8GpOoe/syk8nDvASc9fNOjM0CastDKoYVYOMO+owaJMZC950xJ/WoQBW38gd43o+S5ofnH
	UoDenMpBO6MsyujA10GJSjBFuEyI5rc+SdpAhlywze3p/2oA7f
X-Received: by 2002:a05:6000:1847:b0:435:8dd5:ad4f with SMTP id ffacd0b85a97d-43779e433b6mr5594134f8f.9.1770752010474;
        Tue, 10 Feb 2026 11:33:30 -0800 (PST)
Received: from localhost (39.31.66.37.rev.sfr.net. [37.66.31.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362972fc26sm34029966f8f.22.2026.02.10.11.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 11:33:30 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Subject: [PATCH v9 0/3] Register the STM32MP25 RCC driver as an access
 controller.
Date: Tue, 10 Feb 2026 20:32:51 +0100
Message-Id: <20260210-b4-rcc-upstream-v9-0-17ca1db7613f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WPQW7DIBBFr2KxLhVgwGOveo+qiwGGBCmOU3DcV
 pHvXmovainLP9J7evNghXKiwobmwTItqaTpWkf/0jB/xuuJeAp1MyWUEb203Gmevef3W5kz4cg
 BgbDFaFEEVqlbppi+N+P7x74zfd6reN6PzGEh7qdxTPPQCBM7gh5d37XSWBMAraLWmSDJK2E1G
 CInHDsGDc0xJ6ZMX3i5/DeFSGAAUMkIwwLsr+Ocyjzln+3RpdtCdolSTz8tHRdcheg1CQlRi7f
 TiOnyWqM3V1UeeP3MQ+Vdq4K2sZPYwpFf1/UXYDjcDnYBAAA=
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
X-Mailer: b4 0.15-dev-47773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_113332_599598_A67F03E6 
X-CRM114-Status: GOOD (  11.80  )
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

Changes in v9:
- Rebase on v6.19.0
- Add Gabriel Fernandez's Reviewed-by
- Link to v8: https://lore.kernel.org/r/20250924-b4-rcc-upstream-v8-0-b32d46f71a38@gmail.com

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
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20250916-b4-rcc-upstream-8a8ea3af6a0d
prerequisite-change-id: 20250916-b4-firewall-upstream-dfe8588a21f8:v8
prerequisite-patch-id: e4a708d9c6df5725c9598fbd2169636e4e7dc46b

Best regards,
--  
Clément Le Goffic <legoffic.clement@gmail.com>


