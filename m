Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A20C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 12:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hV7WOWtVzsWUafxQtaP9Rv4gkIegzwV0WCsPbafI4b0=; b=WqWVS73P+Ww6Pa
	0wZcNxQyaMnPN1Hd//WzGSyxLOJIToyDowyEvP4vetBOwhpv8qQgnsljTTcPbueJu20ZePlspuq85
	I2ytaZ8cRtXAvhlbBPHF5aPBmRGaAUrxXQa7NhRohHvapM0sZVp+pSbkxGhOwJ64atxarecNtKkeI
	bXVJBRHHsVWDbVShvgfvXcx+wtfvZTix9dbEtQFV/UpBfdNRFIY1Dcm4sALmGMUY1Ps0SGHn4K1BE
	PiiTYjtA3L2jHRTLumzRzzhFqjfuseVE7LyE+ixXLqEsOiMLg0I0I2K5GIY7aRiaFXVx92raWYbkp
	N4A0KdRDZ9ufhC3XqCTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUPOt-00000008e9l-0JjM;
	Wed, 25 Jun 2025 12:38:51 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMLW-000000087Lr-0jQK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 09:23:11 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-607cc1a2bd8so9550569a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 02:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843388; x=1751448188; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hV7WOWtVzsWUafxQtaP9Rv4gkIegzwV0WCsPbafI4b0=;
        b=BnSPH7R/sHjzqSdNvDkyKUdnUgZFpiUK08vS3ZY16v1ibohcRYJFbyJXrLOSzMCqAB
         whP6kbzfeOtd0qKoGd8kccNfH91phSSRtmtOB9LLl9x1Hgo6/4SrfSb6gdG+fLISyyAi
         XLuWafmScDYUojom+K5JsbrtufSvmQ3CABoBlrAUCQkBKG3Km2amgxz2crSrfTr+bMmi
         eCP/ezgKLySde4xbQJfxulD/ZLfdgDVdbfGJkUN46Mko1C0uj1e46QqcxZ1BZa8xZ4YB
         Oh57/QGPRV5cHHsQebIXtjn2Due9Ig63UWVVJFXJ7zyYxHDrR51s6tphm73tIxh08aaZ
         bwJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843388; x=1751448188;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hV7WOWtVzsWUafxQtaP9Rv4gkIegzwV0WCsPbafI4b0=;
        b=PyFP/Y7mSj2GwD2//A2Nqyr2hZh+ZYH2g7Yh1ujYHom553H1OOFNge2FNRmO/M/BBb
         e9dl29WK3Y78oeZgwxB/AB7HA08BEi0Qk+oz6Dm+QwNW+Y2FQHH+yEBRHhxD56Lef+Bg
         YteY9HNpyB4WKe+jTZHKBhfLiaTpvgn/oxV9ngpvtT3irPnCq3Kng58TXLx7//eOg5k7
         xi9rsVyD4YXBqizn2ReRfRgIu38l4Ddh76pB2WVdsWx/Ql7Ub1pis7qClag0Ho1IDfZS
         8zw3tc8kqt0mq3J9w5O8vEjAVBKTAuVmfWKViPzkJyeNy/hk/l0QqKjmynz/Skada8Qu
         p0bA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ7KV2AJL3BTMzLGv3Y27c8OVClSo6ja43bZPgek283W4cEC9NNBIhDtreFzsFfYRFttRX38JMvAS9yTraGSE0@lists.infradead.org
X-Gm-Message-State: AOJu0YxDHCWrM18e6KJvrl7mt+AVjbRKO28hMUFxCt/0+EWCk7yTPoSs
	2FcuOJfuTq/UVtNJARqfotzn2Fq+WVyaEvPgW1W55CJbBh311RNt8xrtJPul2EzeVBYcF4S2ATc
	88cyK
X-Gm-Gg: ASbGncsfZOnCNEty+TVqFpCOQ3XINT960J8eihtSQXL0ilV7vpu5+r3LgX70Br2aNeJ
	HwWz8JMYMKtSSWafdRmgrFCr8ANHFniIE2iUcGV/tZDuZ07+LEUNUhWsi2hs0JQjLfotUVmgEFY
	yR3oa3rwHG+TkPVGlDGIPoWdAe4rk200RSWk163a2MjaKqeKP36qBdHOY382E9qvUE8VREpC3/U
	QwVfpgUJFbyppqhbzLwrb4ShZMXp8M3/lFZ7hs3vW9CoE8hXjJXZjX/hvd08syu9nY7+b/KkfzL
	y54F9W5hGepthI70vU5BTZqhrj3eq4x9rLTLKbsLVL+EsZkYl7GI3qpOivcxhTGUu0XyFFqCqjn
	hbMDys1KN6Sx87DgVUSYprxQS8/PMIVxI
X-Google-Smtp-Source: AGHT+IGBfPWLF14udRjA4rTQL7Xmj57jJQlVSw3nSt80zUa+Z8byzZivAhETKB7aMXe+Sl/ni3qeIw==
X-Received: by 2002:a17:907:3e0e:b0:ae0:c7b4:b797 with SMTP id a640c23a62f3a-ae0c7b4b8e3mr103550666b.45.1750843388241;
        Wed, 25 Jun 2025 02:23:08 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0aaa0a854sm270277766b.68.2025.06.25.02.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:23:07 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 00/14] Various dt-bindings for SM7635 and The Fairphone
 (Gen. 6) addition
Date: Wed, 25 Jun 2025 11:22:55 +0200
Message-Id: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPG/W2gC/42TzW7bMBCEX0VQr92CP+KfXqXIgVwubaKWxJKyk
 CLIu0exkaSXQD4RQ/Ab7M6AL32jmqn1Y/fSV9pyy8u8C/6z6/Hs5xNBjrvuBROKaSGhTUZLBal
 oyHNes78AVzSwRElJjP0OlkopP99Mfz/ddaW/1917vV9+WY/d3ZhroGsLAioV8itVWK9znk+Ql
 JaSow48+XET/f9zfcIGWp7KhSDWCVKAjAjWDZqjUs5x+R0o2Mc6bcE8pwUsaiIbrUAXx413P7q
 lrHsk/nJgUPKMa72ASySj1U4OOuwGBxReFvzTwGjnopQ2ojQPQ1NuCCxJ5Xy0kpE/JmuZziVCx
 KAiMq2RxDH0HiYNThEjrTlzx8R7k1DO/yDK4IMeLMbEH8Q++2fR2KSUEY6lBzajaVmp1AUb8MF
 Frwdmh2CPyTLljXE2gBy8Ns5JE2/VH2LPVQjJgEgpb7W3KL4vXO7vjVJsP6qRKtya2Ic+NWCaW
 UMqSO8+og2+EeAyTXkdu03/2j9HRd4/vb6+AXIeQHavAwAA
X-Change-ID: 20250623-sm7635-fp6-initial-15e40fef53cd
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Das Srinagesh <quic_gurus@quicinc.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-mmc@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843387; l=7315;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=X3UlS9d7TlY6Pd12RdYn75CPVuzcGSmzvT+aXKx0h9I=;
 b=PhYFkq1F/db914X03xPoQB5gZpwOk1nGvWuuwEpN40VtD7TEu3y6t9uK9TA7paxOaRoimK4Gk
 /NuLWry4HChDv0DC0NE795vB+PtWL7GdDfNCJ4mvxYQEKrdHOXw/hQF
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_022310_221029_41249F91 
X-CRM114-Status: GOOD (  10.62  )
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

Document various bits of the SM7635 SoC in the dt-bindings, which don't
really need any other changes.

Then we can add the dtsi for the SM7635 SoC and finally add a dts for
the newly announced The Fairphone (Gen. 6) smartphone.

Dependencies:
* The dt-bindings should not have any dependencies on any other patches.
* The qcom dts bits depend on most other SM7635 patchsets I have sent in
  conjuction with this one. The exact ones are specified in the b4 deps.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (14):
      dt-bindings: arm-smmu: document the support on SM7635
      dt-bindings: cpufreq: qcom-hw: document SM7635 CPUFREQ Hardware
      dt-bindings: crypto: qcom,prng: document SM7635
      dt-bindings: firmware: qcom,scm: document SM7635 SCM Firmware Interface
      dt-bindings: qcom,pdc: document the SM7635 Power Domain Controller
      dt-bindings: mailbox: qcom-ipcc: document the SM7635 Inter-Processor Communication Controller
      dt-bindings: soc: qcom,aoss-qmp: document the SM7635 Always-On Subsystem side channel
      dt-bindings: thermal: qcom-tsens: document the SM7635 Temperature Sensor
      dt-bindings: dma: qcom,gpi: document the SM7635 GPI DMA Engine
      dt-bindings: mmc: sdhci-msm: document the SM7635 SDHCI Controller
      dt-bindings: soc: qcom: qcom,pmic-glink: document SM7635 compatible
      dt-bindings: arm: qcom: Add SM7635 and The Fairphone (Gen. 6)
      arm64: dts: qcom: Add initial SM7635 dtsi
      arm64: dts: qcom: Add The Fairphone (Gen. 6)

 Documentation/devicetree/bindings/arm/qcom.yaml    |    6 +
 .../bindings/cpufreq/cpufreq-qcom-hw.yaml          |    2 +
 .../devicetree/bindings/crypto/qcom,prng.yaml      |    1 +
 .../devicetree/bindings/dma/qcom,gpi.yaml          |    1 +
 .../devicetree/bindings/firmware/qcom,scm.yaml     |    2 +
 .../bindings/interrupt-controller/qcom,pdc.yaml    |    1 +
 .../devicetree/bindings/iommu/arm,smmu.yaml        |    3 +
 .../devicetree/bindings/mailbox/qcom-ipcc.yaml     |    1 +
 .../devicetree/bindings/mmc/sdhci-msm.yaml         |    1 +
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml           |    1 +
 .../bindings/soc/qcom/qcom,pmic-glink.yaml         |    1 +
 .../devicetree/bindings/thermal/qcom-tsens.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 arch/arm64/boot/dts/qcom/sm7635-fairphone-fp6.dts  |  837 ++++++
 arch/arm64/boot/dts/qcom/sm7635.dtsi               | 2806 ++++++++++++++++++++
 15 files changed, 3665 insertions(+)
---
base-commit: d9946fe286439c2aeaa7953b8c316efe5b83d515
change-id: 20250623-sm7635-fp6-initial-15e40fef53cd
prerequisite-change-id: 20250616-eusb2-repeater-tuning-f56331c6b1fa:v2
prerequisite-patch-id: 5c504d171a4d1acd9ec376e01e0dd0fddbad92b8
prerequisite-patch-id: 0c97dcf5472fbed8ef4cffbd482f3169fe1e972d
prerequisite-change-id: 20250617-simple-drm-fb-icc-89461c559913:v2
prerequisite-patch-id: 1ce32150adbe39ad43d9a702623b55937d92a17c
prerequisite-patch-id: 3562d9a85381bee745402619a7acba9b951f145c
prerequisite-patch-id: f8447266657b779a546ecbbbc2e38bd61c422f08
prerequisite-patch-id: cb9d07c82e73ab3691e0ace9604bfa69cdd6bb64
prerequisite-patch-id: 18ab6ca6a024e5b8ea8138111064db593d72da35
prerequisite-change-id: 20250620-sm7635-socinfo-8c6ee8d82c9d:v1 # optional
prerequisite-patch-id: f1b2e11df96c271c9e3d010084809f361ee4249c
prerequisite-patch-id: 1471abf17230db340c67a84b5a9009f1f2ea6e0e
prerequisite-patch-id: 57bff00c4fedce1b78615375f12517b955dd1d16
prerequisite-change-id: 20250620-sm7635-pinctrl-9fe3d869346b:v1
prerequisite-patch-id: 43b88c44c6fc5b72a490cd3acc5d2585206e81f2
prerequisite-patch-id: b3b6ebd4a288bd4abf227c939a1a92eafb2cf2c8
prerequisite-change-id: 20250620-sm7635-clocks-7699d338dc37:v1
prerequisite-patch-id: 48485e0e7e8a992695af1690f8cd2c09c227a4bf
prerequisite-patch-id: 4685ceba3f900ad6d1d2ae35116d37f64a171d5d
prerequisite-patch-id: 80f71dad0c0a77da98e5e66b592f38db6d81b4b1
prerequisite-patch-id: 49a2fa1a14931d9143da232969e7487061466930
prerequisite-patch-id: f5d1794f61488235644f78ffc28e3dacdab215d1
prerequisite-patch-id: ab257573067ff09c94270e1fa6ad4de1480c06b9
prerequisite-patch-id: 6608bd3f2e198a0780736aebcea3b47ee03df9ef
prerequisite-patch-id: c463d0d2d84c8786ed9a09016f43b4657cbc231e
prerequisite-patch-id: e113e76af37f01befaf4059ee3063cb45b27fd6b
prerequisite-patch-id: 40f8b8acd07a9ff7da8683b1be6a58872250e849
prerequisite-change-id: 20250620-sm7635-clocks-misc-0f359ad830ea:v1
prerequisite-patch-id: 127f332296fced39a2fd2f9a1f446ba30ec28ceb
prerequisite-patch-id: d21a0c8ceb06523c9f3f4ce569d28714878b3f84
prerequisite-patch-id: 87029a8844ef174ab3e0f953a1d16957fe6c13cc
prerequisite-patch-id: 095c767d7b7aa67d47026589c926636e57349ca6
prerequisite-change-id: 20250620-sm7635-rpmhpd-dcb5dc066ce2:v1
prerequisite-patch-id: d71fe15334032610c05cb55aeb28bfaa44e3530c
prerequisite-patch-id: 729544e856b8046f7a311b719d9495f8b33c1e1f
prerequisite-change-id: 20250620-sm7635-icc-e495e0e66109:v1
prerequisite-patch-id: b387217215d6f83cbd50c380171b159a2f1406d8
prerequisite-patch-id: bffd82274c35f6d520f524aa2a9c1c4bef7e047e
prerequisite-change-id: 20250620-sm7635-eusb-phy-d3bab648cdf1:v1
prerequisite-patch-id: c242c9b099d738214def29d2e464b64be5f14e62
prerequisite-patch-id: 8c1eb426c08bc1ec9462e77139b3b64d5e1453e9
prerequisite-patch-id: cdbc469ab33002c6bf697c033755b598dd1a621e
prerequisite-patch-id: 6bb2900bb530880091622ef47d141fe1f5756a52
prerequisite-change-id: 20250620-sm7635-eusb-repeater-0d78f557290f:v1
prerequisite-patch-id: 5c504d171a4d1acd9ec376e01e0dd0fddbad92b8
prerequisite-patch-id: 0c97dcf5472fbed8ef4cffbd482f3169fe1e972d
prerequisite-patch-id: a618abb349c3de5b49f79b4b0f86d9ab502ad500
prerequisite-patch-id: 09f91ff3a25c16a0375bdfec80604a64eab0b4fb
prerequisite-patch-id: 8fca8b09d70409c5c78f9f1b77d0a4c75bce38cf
prerequisite-patch-id: f5c2c24d2baefcd7ff91718529ab2f2c264ab99f
prerequisite-change-id: 20250620-sm7635-remoteprocs-149da64084b8:v1
prerequisite-patch-id: 3c95a20dd456dfee100f2833de4e9931a2073c7d
prerequisite-patch-id: 5292d77663ea9c44346b8da86bda36e0cce3fe56
prerequisite-patch-id: 015edcb2a69b5e837dc7edfbc7adc22145ba611b
prerequisite-change-id: 20250620-sm7635-pmiv0104-34a679937d9d:v1
prerequisite-patch-id: 8fca8b09d70409c5c78f9f1b77d0a4c75bce38cf
prerequisite-patch-id: f5c2c24d2baefcd7ff91718529ab2f2c264ab99f
prerequisite-patch-id: d7a06ece910e7844c60b910fe8eed30ad2458f34
prerequisite-patch-id: e91b741c9cfc80aa149bfd8e43cae90ca58e17f2
prerequisite-patch-id: 5ba4a49c3792cb208ee064a6ba13545e40cb70ac
prerequisite-patch-id: 5bdfcbdd226f7223c04a65c1a3cdcc3ecad38858
prerequisite-change-id: 20250620-sm7635-pmxr2230-ee55a86a8c2b:v1
prerequisite-patch-id: f0bd6e083324f954b988647bb42d4e2be179fbda
prerequisite-patch-id: 8fe1c0fc544e8bcb35522c5eba0b36e83bfd0c19
prerequisite-patch-id: 525c9eb0087025024bb0aaec1ed1d7d2c0bc8f03
prerequisite-change-id: 20250623-pm7550-pmr735b-rpmh-regs-06087e5b3a99:v1
prerequisite-patch-id: 7360606a06f8fba3ea9a8f84b4ecfb8209e91ab0
prerequisite-patch-id: 7a06a346abdb7f7386912b92f2b84af87e7439a9
prerequisite-patch-id: 1e1a6eb9c5421812c07421f9fa7e3f16b26a42da
prerequisite-patch-id: 224df3e4068bee3a17bde32e16cd9366c55b5faf

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


