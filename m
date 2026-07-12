Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D24C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 14:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n7Wan3BpmnpABOkhMGTFpss7z1lqzP+pREkrztnqYrU=; b=RBGUWWZyEfMUN52uti5twMaw3P
	xxLUcrc4uVTANmilX3diAQFQEEy5+LTjE2DQXTjl7g0MwgBYqZ9drwbKbDDfXk6S0fWYmE3s9nmpr
	Qkx/NGOPoBWeeVUXVmurEJ4lp41uYHsdzdkx6R9MDBwu7VujyB6p+G/Vlh72eMLQREZ7uAXFXeoYg
	/Qc6zzsJoChJChyhdudNYXCs/B5907KV3qdb897I1CUxMdIkin9NKKq8S+fRUWHtwWWNkt9hdNs5+
	qx4V0feo5G2bD4mkXeF4PSpV6t5x4mYCkBdQvajEIe+3V9XDhHg3CZ+BB1tsZwrBFAd3iEAq2LC2U
	Of60Cu4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiunj-00000007UjE-1UuT;
	Sun, 12 Jul 2026 14:04:59 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiung-00000007Uht-3nL0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 14:04:58 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-493c733f15aso23098885e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 07:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783865095; x=1784469895; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n7Wan3BpmnpABOkhMGTFpss7z1lqzP+pREkrztnqYrU=;
        b=gdNtmX3MEls5Y+IgN1PTkVh3k+7PGGgYhFjojzjBFsq8Tebna69prOnKyxiSHyXBAp
         ABosWY8YhWy2yGAitIpgqT91hRfvQih8K5uYE56uBi9QPKardIrHeFYAqx/09ddhme02
         zmqu1ZOn7ZLVvqZgvrZGWTIvPVKgG5ZzuwqngqtMosPznYaXfYTB1ZgIfpctPXQH8dLA
         U6k8kHElA5+QFoLFx7GggbTB9NhzwH/WbzqJZX4s4oV0GKD3GgLYchi8GCegPKiJDSud
         AzEQTdT4ucAbwsMOQcmWTWuO9x4vdUIzmSQ6/IH1m/zenNHvujw05cTmw4j63bQF3UQN
         NuXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783865095; x=1784469895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n7Wan3BpmnpABOkhMGTFpss7z1lqzP+pREkrztnqYrU=;
        b=AVyvUp1nBmQjYorNUzuQTlFiBIL79tj05/oIYAHoieyGYhqX1ISzCUwk5kXXLC9cQ7
         Kyw+U1wKqfqFw3r83QhwtXTozVHamfu8D3nCTQGba9nbORYLPp3neSHJwX/tZDMYxklJ
         2x1+jCsOw3v1R/UE3dulmuyY1xwJ9onGjG6FznddHNgyDYjnDC0mTwXPgB4PSyvSDJ73
         +mDMtr89GWyVdNLOH7kV2ncB2ErOzhVexIHJHBwPEa473wAdKWW53LLJqbf/6622uAtU
         39Hx6aDBS10Q9/FNSghiUJeS6vBnPfCpXkuSEh0GrR7fehjUh085YRx7R2fEokyCotpn
         6JHA==
X-Forwarded-Encrypted: i=1; AHgh+Rq+1BB745BSUD4exNO6XUCZi9zfbxhd3YLfptGKNS5HQ2Ib+IiZb9ushkglCeQ3OvOWcVuyIYfHuLYpD64wzOWi@lists.infradead.org
X-Gm-Message-State: AOJu0YyIuu7uDNLpbwtYMPabJukD1dUj44MltrdPV1ReJ7ndprXzxeTv
	ZSHnaQBxr+bZvn7hjhveUiAeDIUrxueOjf+PBo3N/a6kshKKz+NVOPsF
X-Gm-Gg: AfdE7cneYV2rfuhNKIfdVjjtMA68rQvtMGMqBpzda4GOnZ4rdf9wB2tzMEsOOX78cog
	X2JHqJi9YeumpQQJaLQCaC+aRVSznY4yIfTpMKZXhJ72vb5X8Frn+2qai6VPfaNENyDmA+WJnFc
	dhU4J7+BYROIKUPbq039n9un6Ri29ZsQ0QMfdVHBHpgrCbne37SJq+GhnJsQ08wfbwSacyDZg9y
	1uJ0J2wb9lloX1FzawBXwiQuss563Fz6t2/4zK7PF/vnGU5u+UZZUSOK/L4NtF5pOxLaBqA253Q
	DhMz/4cURBz5aVndEsZNeMdyCPZfRwdhv6joVT8GhwHwJWH0mYgQjCZrhJTjR4cWb7XcYWEf9Sj
	zQKoyV5l6IRO1WKQN8tsFtD+a6YIQ9JajDrSIUIDU2I9nPm+YdYlRlve1hf00BHVFuqaMjNWutq
	RuAsD6AEDq+JmZGogEp4lpNRcgL5lZbw0F4SfILDC/UT/5O+sc97UvemRIm142RE3yD3WRc1/2x
	9dxBo9BZGNwyTj5ImdPd3AN
X-Received: by 2002:a05:600c:55da:b0:493:c182:6b08 with SMTP id 5b1f17b1804b1-493f88390dbmr36351225e9.36.1783865094860;
        Sun, 12 Jul 2026 07:04:54 -0700 (PDT)
Received: from GLaDOS.station (122.red-80-39-213.dynamicip.rima-tde.net. [80.39.213.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d843csm76330888f8f.14.2026.07.12.07.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 07:04:54 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	matthias.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: [PATCH v4 0/3] Add support for Variscite VAR-SOM-AM62 and Symphony board
Date: Sun, 12 Jul 2026 16:04:47 +0200
Message-ID: <cover.1783864932.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_070456_995799_FB602DAA 
X-CRM114-Status: GOOD (  12.15  )
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

The series includes:
- Device tree bindings documentation
- SOM device tree with common peripherals
- Symphony carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v3->v4:
 - Fix gpio expander interrupt

v2->v3:
 - Add audio_refclk1 clock
 - Removed pinctrl_vdd_mmc2
 - Fix reg_sdhc1_vmmc regulator
 - Add missing properties on pca9534 node

v1->v2:
 - Fix AM62X_MCU_IOPAD macro
 - Fix OPP table comment
 - Remove reg_vdd_mmc2 regulator
 - Fix reg_sdhc1_vmmc pinctrl
 - Add reg_ov5640_buf_en pinctrl

Stefano Radaelli (3):
  dt-bindings: arm: ti: Add bindings for Variscite VAR-SOM-AM62
  arm64: dts: ti: Add support for Variscite VAR-SOM-AM62
  arm64: dts: ti: var-som-am62: Add support for Variscite Symphony Board

 .../devicetree/bindings/arm/ti/k3.yaml        |   6 +
 arch/arm64/boot/dts/ti/Makefile               |   1 +
 .../boot/dts/ti/k3-am625-var-som-symphony.dts | 555 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi  | 483 +++++++++++++++
 4 files changed, 1045 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-var-som-symphony.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi


base-commit: 5c73cd9f0819c1c44e373e3dabb68318b1de1a12
-- 
2.47.3


