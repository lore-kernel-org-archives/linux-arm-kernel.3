Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF30FC3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 12:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c2FlfXbn4hS/8cFqnyoFgpNVEhmx+w6APuLnXY7ftuw=; b=cdw0MT8yj//h59kf53KTzjCPoK
	6KmpclDG1fiHn4ArMXcO1MffdkrOXv54CmEZK5Q4i9xsyM2RH9SobhvpMjzzeveFl6x2sVJhC3y21
	+tZ6jWn3wLklgj7Ix1rDhx19kg+ZzuH7d0jtE0WvYWOcfsX1bZOwHaNO9XaGhmlBz3Xh0yACArlok
	tpccCdUBXv8JRDm1ZYtnHKAHiQBVd+catIbL9ohyWLLcMf9U1RKwjxb27XHwXCr31COPG8ipVWY50
	lcuIPHBeUlsxRCqxmw/8xEdUMqktQFXgRr7gSgX+js52VqglINLidoak+W0hi+vT+22bMa9Taqiaq
	VBO+vM+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uApoh-00000001xhQ-3cuP;
	Fri, 02 May 2025 12:48:35 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uApmk-00000001xQi-2tCH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 12:46:35 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso1839014f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 05:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746189993; x=1746794793; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c2FlfXbn4hS/8cFqnyoFgpNVEhmx+w6APuLnXY7ftuw=;
        b=fOELDstrUu/aJTanO/sX107ygxwPxAQ0bnbBEZ179b9uDCORT2EEpMs4wTvEckTjkf
         v2sN5YlgAUBva8AlAQmQZGn4zfcDlyBN2VdZiQt6rn/+9DS2PfqSLRC73p96/0Ogrfzy
         DVT2fGxlboJ+OGsN5GogHlas2dXpkh32xEmn22pT6gk+VA082fSCT2AmWZOoeHbEGmoq
         nAbbBfA16SsQpw1J39QL1bwrETYk6F1dAfeldGtaR6IJ7GzwZaqUPvwYPDbkjXYqyyYJ
         mxYLRTF49HmEM5QamzLKcWbbXi1i0a54qVd5yTOPqRBFQUOQflluFLVKJ7KaQWP+8S3W
         oYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746189993; x=1746794793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c2FlfXbn4hS/8cFqnyoFgpNVEhmx+w6APuLnXY7ftuw=;
        b=HiqGJp6PD7iS7bcYIev8hYmPu3KstZxv5j3gUIA7Q2pnKTcohZChLFsUESBORFxZC7
         f0EYBO8Tb2wF46SO5EdueFlPw2Xpmt/Q0q0QBPcifyuyRSiVlZ8PugPIO3gu/C08JGIo
         2ast+YgSaHe3nec6/6n9DgOcRlyD6DlAIad4KxAFD//B7zvUkNIjULwbdGBXC3AAS6nL
         FMXYJGptWS9ifpnRVvQ/RhJFLa+iI2lSrWlFNVjWh6dzsAUlcaJWihE0HCQzR6vgIobQ
         EucYTocqq6Wa6iEkC0jI2R4MW66jOXEWJ6+8JrHOLIS74eKiCc1d2sMb0SA75ivreOu2
         ZPVg==
X-Forwarded-Encrypted: i=1; AJvYcCWTDSdgyMEtJFs0bIs9NfXa6vKtgwK0fAh9qW1+6lMkd4lf/twSuNRToufWLQOShcTzYhG7ZRfv5emmDR4j2Gnk@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9crU2/cWh0W25hMjuB2msNvuWWlDdiMvNq7//qalxFI8pnZvx
	fJ3Z4GtPt+i8QFyFq+lahvF2lh5z3PHqyXW3VQTN4r3zF3QAIvO/
X-Gm-Gg: ASbGncvKWp1vnbAcqU3D6zb8dZRCyPrUOvaA4vYCHQNkpBmIdD5ouMpNmHJXundysSF
	JuIq6mddQkU8AId5aMQLDNvJYV6okAW1SZbSNTlzvaVFMTUNMwbpzrDZvmxb/BStroxXuGCyASX
	CxuBym4xRUaE8jFaDIxhhwQsHpotPE41ogIm/fIVwZCKH5TUpuftRnNxJuDTTkRuyYxk2+ENejn
	BgsxvSwfxQzqxyqGcGTY2fi2nA+5nFCDjwYOuPaJEaSviZCOIhfTa0bDiT7MB7Wh+oXbsRLo46/
	Dp4e79Pd8bon73/qPqDQTa7N+pu+oF5em8n9pMSDTHlcTzFhICfBzDcYN2KUSMJ0
X-Google-Smtp-Source: AGHT+IEO0uGPBo17YbzVD8A6eqC8NmxQ95EKCHHFrtSUvfPzFyesp/iA2RvWvGw6zbn1FJK1xRraCA==
X-Received: by 2002:a05:6000:3105:b0:39f:bfa:7c90 with SMTP id ffacd0b85a97d-3a094038a8fmr4804593f8f.13.1746189992635;
        Fri, 02 May 2025 05:46:32 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:10cf:e432:b2b:bf99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b0f16fsm2059134f8f.77.2025.05.02.05.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 05:46:32 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/2] Add support for Renesas OSTM on RZ/V2N SoC
Date: Fri,  2 May 2025 13:46:25 +0100
Message-ID: <20250502124627.69644-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_054634_728694_A07591C3 
X-CRM114-Status: GOOD (  13.42  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds support for the Renesas OS Timer (OSTM) found on
the Renesas RZ/V2N (R9A09G056) SoC. The OSTM IP on RZ/V2N is identical to
that on other RZ families.

v1->v2:
- Inveted the logic in the dt-bindings to require the "resets" property
- Instead of adding config for new SoC, changed the probe condition to
  `CONFIG_ARM64`.
- Updated commit messages
- Added a Reviewed-by tag from Geert.

v1:
https://lore.kernel.org/all/20250501123709.56513-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: timer: renesas,ostm: Document RZ/V2N (R9A09G056) support
  clocksource/drivers/renesas-ostm: Enable reprobe for all ARM64 SoCs

 .../devicetree/bindings/timer/renesas,ostm.yaml      | 12 ++++++------
 drivers/clocksource/renesas-ostm.c                   |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.49.0


