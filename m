Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08437C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 21:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yoqurlPSvAJxWv157dNwPLL8InVlGkCToDlg+t76AwE=; b=gnN0kK6ZfmvqNyJxI0DG5EY6BA
	uI5BCYwd55Y7/tzqXYA/6qJv7gT5iFPBLCsRCfCIVP0147OhDwnIhxuptavtjY7BNW4IJEcbUF494
	72JbBmSxOmelL0T4j+q93jHYPXbu7DA9VvA7PBR8W3JnoQaHUFGDDwzXrMwb2twOVL5DC7HtCxxws
	hmZwTs52sFyf+Q73n031AoI/0MUguFhjrzvwnC1g3TTIEhqXlD7ry3Wb1ll43U8pWgpLnodGiSLlD
	K+moqQ27hd3CoT6Z2vDaEF7xE+TLtUStSaI9ycj1FdBzQEOv9sJ+eSohrDU3lRpmOPL3MrsiJCSxy
	l/BrvpyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlYpX-00000005MoP-2GZE;
	Sun, 19 Jul 2026 21:13:47 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlYpV-00000005Mnn-0Sgj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 21:13:46 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4954aff6088so14254385e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 14:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784495623; x=1785100423; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yoqurlPSvAJxWv157dNwPLL8InVlGkCToDlg+t76AwE=;
        b=jbyymCchmg6adgzYZgVA58hoRy41Gxwq/vjcEFzvEqL/P8jpUCFOGTWSiA9oM+LZKl
         BxsN0jDltSr08VEOs7nhKh2mk76Ox62B/sLzOJgD1DRro1Z+5vf9CCe9E6FgacG1wEDv
         vdlHG7eXlcXMbZlWMhSVh0PFkOlmBgF8koUSYe9SBX62rNv7b2dSst/rISPP+XWby74O
         +CZeObsHVfKs8t856ZXZImzbkQsc2i1ORErGLdoY3Uhp1OAOa/5yCYUD/aPSmTyi2BIt
         VjFgDUvniNokylOTIBXY0ZDxV4iNb9gwFT+PfHqXf4xD0PdDqYHZLGH8kDmWFguFYmJX
         PaJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784495623; x=1785100423;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yoqurlPSvAJxWv157dNwPLL8InVlGkCToDlg+t76AwE=;
        b=VJKMkubEGt4tNMD4G3/zTPYvpg5aSBt5bgrwSt6DZj1dIf2YrGBiFmb78w20MdtSTe
         /oj4KpdEP2/HBdBjiP7ThfGAyRxMEslwCzdt750mN+qUH4x0eewDi49dzy3ddj3UZQju
         Fjski6FhDFqba8qQdzTgINEOggb6FZF4OEvJJWoCBJUoFTrjpVUVGLqT0NvVuIh7uX8A
         SgLoLNqT8KoIvg/eZ2N7/NmNAPDIXJNzh6SePsXGXr/Au2VM5kUMC6UPzjJE7myFe4jL
         03LrITPaZkrQjNZN+NZV3EvPJfW4LxXicV0rfVO52w0Bv4UKtjf7ZniLyOZYcAINeX9R
         jWRg==
X-Forwarded-Encrypted: i=1; AHgh+RrUobXHiKA5LLFycnV0NUZ/fr9RXtyYZbdXGwGQUEHcLsHCefubyJ+fUQh/YD9zLTzKZpwM+AMaEPlFZXXagCEz@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl4zWho2AJMQPJxFrAq9uMAR7licUg06fy2FOfy/NN4dShrozg
	46/38XjQeXA43f0os7YVSIzz9HtCsUC+7oYThbvNWUu7Us6VofNv1W2X
X-Gm-Gg: AfdE7cmPtIhMF3dWHSWLfLxV3422RgveA3i8LT6TUASBQA1efLDk+eKJw1BpN1YTiQC
	D28CVksE6zYPBle/bLpfUK8t/bAtCc8AxgbRHOtM8gQEBzSj3TRcXA1eIGDZMWsQE4AqdgvNo0Z
	yyJC/NbQjWRmJMyfkphhvLet+ntb4CghgDnbEw/6t+2Vao9NxmFV8a1hYaayAfjpI/Em7PnnfiD
	0Ig9+cxI//DPvwj++cVnD/TKbiFbfmZZWHNRk8B0aOc+etTtwQHrRWK07a7XPEcJmUqTH1tiPT7
	Bcp7mB1BMjx8eZb0PYnQa2Xt+sfuS3eqm/EIOCIvL9UrHZM9ndVb/xnQdp9nIX0ldhv3/9Qw1FV
	PfnsXG9m6ylSbPMqIPBGLKo+eqQp4fq0Ni4HLPAKK0wj7lFsIjumYlXBEefArvec21mJGcaEpV7
	M3gJRMKde7h7YE9ybiAtzwNsdyw22Qpogz0h2y8xbNCpkTRVE=
X-Received: by 2002:a05:600c:3b10:b0:495:4aff:5fce with SMTP id 5b1f17b1804b1-4954aff609amr121711955e9.32.1784495622909;
        Sun, 19 Jul 2026 14:13:42 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:3344:2841:7708:a101:2b8a:f76:a00f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a3e2a9sm224108815e9.4.2026.07.19.14.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:13:42 -0700 (PDT)
From: =?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
Subject: [PATCH v1 0/4] clk: sunxi-ng: fix the A523/T527 GPU clock model, enable GPU DVFS
Date: Sun, 19 Jul 2026 23:13:15 +0200
Message-ID: <20260719211319.982285-1-juanmanuellopezcarrillo@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_141345_169523_900CC16C 
X-CRM114-Status: GOOD (  15.07  )
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

This series follows up on the discussion in [1], where Chen-Yu pointed
out that the A523/T527 GPU mod clock is not a standard divider but a
fractional one: GPU_CLK = Clock Source * ((16-M)/16), with M 0-15.

I checked this against the T527 user manual (v0.92, section 2.7.6.58,
"FACTOR_M: mask M cycles at 16 cycles") and verified it on hardware:
with the current linear model, forcing each OPP on an Orange Pi 4A and
measuring the real GPU frequency with the Mali cycle counter gives

	OPP request	programmed	measured
	150 MHz		600M, M=3	~487 MHz
	200 MHz		800M, M=3	 648 MHz
	300 MHz		600M, M=1	 560 MHz
	400 MHz		800M, M=1	 749 MHz
	600 MHz		600M, M=0	 599 MHz

so every OPP below 600 MHz silently overclocks, up to 25% above the
vendor ceiling, and thermal throttling to "400 MHz" actually raises
the GPU frequency.

Patch 1 adds a small ccu type implementing the cycle-masking
semantics.  Patch 2 switches the A523 GPU clock to it, drops
pll-periph0-800M from the selectable parents (the vendor BSP removed
it citing GPU job faults) and drops CLK_SET_RATE_PARENT (pll-gpu loses
its CLK_SET_RATE_GATE protection once the GPU runs from a periph
output).  Patch 3 registers the existing sunxi-ng mux notifier so the
GPU is parked on pll-periph0-600M while pll-gpu changes rate, as
Chen-Yu suggested in the same thread.  Patch 4 adds the BSP operating
points to the Orange Pi 4A DT, which enables panfrost devfreq.

With the series applied the same cycle-counter measurement reads
149/199/300/399/597 MHz for the five OPPs, all from the intended
parents, and devfreq scaling plus thermal throttling (emulated
temperature) behave correctly under load.

The higher speed-bin operating points of the BSP (648-792 MHz, gated
by a SID efuse bin, running from pll-gpu) are left for a follow-up.

[1] https://lore.kernel.org/linux-sunxi/20260719153122.892013-1-juanmanuellopezcarrillo@gmail.com/

Juan Manuel López Carrillo (4):
  clk: sunxi-ng: add cycle-masking divider (maskdiv) clock type
  clk: sunxi-ng: sun55i-a523: GPU clock divider is fractional, not
    linear
  clk: sunxi-ng: sun55i-a523: reparent GPU while pll-gpu changes rate
  arm64: dts: allwinner: t527-orangepi-4a: add GPU OPP table

 .../dts/allwinner/sun55i-t527-orangepi-4a.dts |  30 +++
 drivers/clk/sunxi-ng/Makefile                 |   1 +
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c        |  47 ++++-
 drivers/clk/sunxi-ng/ccu_maskdiv.c            | 199 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_maskdiv.h            |  71 +++++++
 5 files changed, 342 insertions(+), 6 deletions(-)
 create mode 100644 drivers/clk/sunxi-ng/ccu_maskdiv.c
 create mode 100644 drivers/clk/sunxi-ng/ccu_maskdiv.h

-- 
2.47.3


