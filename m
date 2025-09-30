Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622E6CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 08:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fVsl8vGcfYK8AgATkYy0L7h3lyqmmijzRq6HHy2CfXM=; b=4SPsMYkPZTPVDN
	uEPHXLQ1cAsH8D68HLqNS2UPumOmuPLI4QA2ho3BkkW5k4BenjAdBRy3gkV38sCtNFU7Pm9HDOgMs
	ezQOYiiN99zS/xSYYuwB0+bN4NA1ywTqs+ouRegISIKG8SynLd2u7r6Wg9uDUHHNEsWD8czCBwmNZ
	47dDCzRS5pakL/P9AtIimpNEDiYzsHj339AhMC/DyWsGokj8RLKPigNsl3Eq9jW7JRDZS5FevdP8T
	40rA2wwGClIcX+ZreEDLLwc7P8Ey8BQIW9DMB9ysCwjc6KkC2RX94o2rKdZe/GbqHCjRrT0wYCBTY
	w8gHTEtdM10ex+8SL5cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3W0c-00000004gld-1m1w;
	Tue, 30 Sep 2025 08:46:54 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3W0Z-00000004gkb-432v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 08:46:53 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3f2cf786abeso4060910f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 01:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759222010; x=1759826810; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fVsl8vGcfYK8AgATkYy0L7h3lyqmmijzRq6HHy2CfXM=;
        b=QMc5Qs58fHBir9HFcofDSbvx9Klt9FKAaywdniu8Zu2OCoyx8Y/du2FWrPvMtJoB7z
         34IGjTOBQEbsbb8Ac/MgS2ZhB4T5+DP+CuvOb43zACCosAsJvieyZ5sXYkottxeijMKT
         p7ImsEL2pJYZ+95Tn4tuaTru2TMj62lR9iFuy66VamhDLw4WRWoGw+RBValh9y8SytsZ
         qloSJ9Ph8Q6QtYQKA8ukBMIq9+Qv2QUSOYQ7UE1HV65Jsi7rLkfiLxyNCPbxrZ5BMPfd
         QDpcT4mISBdDDLyZfa9gJOHQw+VwNl16cP+yeNpQ/A2GDAIsNzzmJbHGjTkiR0uNu0gY
         7aDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759222010; x=1759826810;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fVsl8vGcfYK8AgATkYy0L7h3lyqmmijzRq6HHy2CfXM=;
        b=qgJr9dK50y0NDBaHV846NFyln0HsWEBZeRksB4CZgKDpc5SaGNy07U5QyDZmAuGd7S
         RG2QNYou1uL3+ujYtB5lXGfGmF4e+pth2ayxjNYLiwTAzr0YWXtJgys6mF8Us2C5j9E0
         6fSxHC06i+zylmwaWxtvZ2Ixgn3qnH7MRIJ5iU8ZObSynM9aZ8juwcPRInGqgJ3AaWBc
         4mFLPgr//6KqXTFudciDA7aPrPou6j1t/5+MapKHY8wSoAlOlObRqUVnExDWvaS5xk7H
         na4NHdqWsGTDPKtZAjRhCohGuX2RuPk0+tLrZFhnAc87Et1xqIto80l8tIpEf9us8NvM
         IkQg==
X-Forwarded-Encrypted: i=1; AJvYcCVKf5zI+XomP4DJSvNZEl2pljiu9xT3SZIibK0zB8fdpGKjiyd5WPH4olML7tFqCRumtu11oKU+1AgF9Ua2UUmZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzK381PwX5PTkQgniXUnaL0H45igh4qly8HBR1gH6OjI/CbQBny
	5u0/CCizamiTbrEEojUy9Ue/RGDvBx3oA9XSGsNaC3plvAbmWdQ3eijo
X-Gm-Gg: ASbGnctFn5hA5nuV6U0sbpiPGL0K9QKogt5+sRgUyApbLGfZX6goos+tQjf1yNaVLle
	0eO6Ux/kCxeAx9KElGqAGZOb5Yyk320fbhdQTIm2G2ML2JSxRnL5f5VcNFb+3EsGdx40+tvFNQS
	3eQz3g8QFmzXxAOM44UsZV5yMwpLGyn7+8WvSJypSRGVEoFLzhCDVg9V66UcHlwuiJy0why7Dma
	IyPLG2X9zyHeqkduNz209PG6utDcg2jzJTtGzGVEsTp63xbyzSUB9Pp3BaATpZok+2QXckxY4WR
	sLPz5lQyAjZMI22LlNp1xlJavNEQC+K4DUM+RUiAmf0vXzrLDCz70g3F3BFDmECtoxQoHU5HLBY
	FCa1svHJzjv6MaD6WTHWNVaEWxH+RxqxFvsWfHbrEQA68whOkq+1K85qFlJoMRMZfsP/0/Whwfx
	+hWN9JFLJ4AWafrEHO1Nlq5xM3ik7tQZr5FxUX8eOdS7wASKTnjzRbbGpaaPT/BQ==
X-Google-Smtp-Source: AGHT+IFNKqn3I7Ak0yCQK65+PzvDoYV8kvut0/aco1wX5M8V/khPAzAoVBU1h3CVCUW6iDQw7YuIxA==
X-Received: by 2002:a05:6000:178b:b0:3b7:9c79:32bb with SMTP id ffacd0b85a97d-40e4ff1991bmr19424072f8f.44.1759222009713;
        Tue, 30 Sep 2025 01:46:49 -0700 (PDT)
Received: from localhost (2a02-8440-7149-a758-f461-9bc4-1c75-ebc1.rev.sfr.net. [2a02:8440:7149:a758:f461:9bc4:1c75:ebc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc5603356sm22122689f8f.30.2025.09.30.01.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 01:46:49 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Subject: [PATCH v8 0/7] Add DDR4 memory-controller bindings and factorise
 LPDDR and DDR bindings
Date: Tue, 30 Sep 2025 10:46:43 +0200
Message-Id: <20250930-b4-ddr-bindings-v8-0-fe4d8c015a50@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPOY22gC/3WNQQ6CMBBFr0Jm7ZhSaFFX3sOwoMwAk0hLWkM0h
 Ltb2bt8L/nvb5A4Cie4FRtEXiVJ8BkupwL6qfMjo1Bm0EobddUaXY1EEZ14Ej8mbEpbcsWqG4y
 FvFoiD/I+io828yTpFeLnOFibn/3fWhtU6CoirdjU5Ox9nDt5nvswQ7vv+xcaQSS5rgAAAA==
X-Change-ID: 20250922-b4-ddr-bindings-7161e3e0af56
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-0dae4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_014652_069375_1615FAF8 
X-CRM114-Status: GOOD (  11.04  )
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

Introduce DDR4 bindings, which is the first DDR type to be added.
As the DDR and LPDDR use the same properties, factorise them in a
sdram-props bindings file and rename lpddr-channel into sdram-channel.

Changes in v8:
- Globally fix typo/grammar in SDRAM props bindings:
  - DDR4 bindings compatible description:
    - s/lpddrX,YY,ZZZZ/lpddrX-YY,ZZZZ/
    - s/in lower case/lowercase/
    - s/statis/static/
    - s/~/-/
  - Add an "s" where a plural form is used (e.g. registers) in the DDR4
    binding revision-id description
- Fix the number of chars that an SPD can contain in the part number
  field.
- Link to v7: https://lore.kernel.org/r/20250922-b4-ddr-bindings-v7-0-b3dd20e54db6@gmail.com

The v7 is a subset of the v6 and other prior versions, split to simplify
the review and merging process.

Changes in v7:
- None
- Link to v6: https://lore.kernel.org/all/20250909-b4-ddrperfm-upstream-v6-5-ce082cc801b5@gmail.com/

Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
Clément Le Goffic (7):
      dt-bindings: memory: factorise LPDDR props into SDRAM props
      dt-bindings: memory: introduce DDR4
      dt-bindings: memory: factorise LPDDR channel binding into SDRAM channel
      dt-binding: memory: add DDR4 channel compatible
      dt-bindings: memory: SDRAM channel: standardise node name
      arm64: dts: st: add LPDDR channel to stm32mp257f-dk board
      arm64: dts: st: add DDR channel to stm32mp257f-ev1 board

 .../memory-controllers/ddr/jedec,ddr4.yaml         | 34 ++++++++
 .../memory-controllers/ddr/jedec,lpddr-props.yaml  | 74 -----------------
 .../memory-controllers/ddr/jedec,lpddr2.yaml       |  2 +-
 .../memory-controllers/ddr/jedec,lpddr3.yaml       |  2 +-
 .../memory-controllers/ddr/jedec,lpddr4.yaml       |  2 +-
 .../memory-controllers/ddr/jedec,lpddr5.yaml       |  2 +-
 ...lpddr-channel.yaml => jedec,sdram-channel.yaml} | 40 ++++++---
 .../memory-controllers/ddr/jedec,sdram-props.yaml  | 94 ++++++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts          |  7 ++
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         |  7 ++
 10 files changed, 173 insertions(+), 91 deletions(-)
---
base-commit: 30d4efb2f5a515a60fe6b0ca85362cbebea21e2f
change-id: 20250922-b4-ddr-bindings-7161e3e0af56

Best regards,
--  
Clément Le Goffic <legoffic.clement@gmail.com>


