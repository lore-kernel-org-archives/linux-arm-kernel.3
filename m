Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F12CD149E8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 18:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rRtgBgW6s/EQDOLVk7vTju3fTexfS9nXJ3lju+LyV5U=; b=YJEEKJ3imBebkX
	BxrbsqeNa2UzhLbJ14EkrRvWUJoDe/kbuta0erev/9H8evF3jusJqUmzC+uLxYYLenTzQFVNInlM0
	M6oDf61JtowvPqbLG21W0ipOkldIpmLG/pFbNVjGrnHkDdgShCIOAntKZVskyuy4m0idiTcLl/VRR
	6V3ucZcAMnxbvtipEBvyX3Y/oIT9oEsI0GCVMefV3sWgyqEaoV6xvJSi7Fw2gj3UC4JuYPtBEMt52
	OUIYIQ56TTo+8OqyGiVOATQrZzmvjMBFuDCinVlkJCrsMjzWh7UM5RZ8XNT5t7b5xcVJ6lSJY/qUB
	hF5HrChGio5K4RUU2tWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4PVk-00000004sUq-0uKR;
	Fri, 25 Oct 2024 18:58:12 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4OHl-00000004dx3-3N1g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 17:39:43 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-7cd8803fe0aso1608567a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 10:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1729877980; x=1730482780; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rRtgBgW6s/EQDOLVk7vTju3fTexfS9nXJ3lju+LyV5U=;
        b=OYSioY2zbZgoFBl9Xp/+HuAOgNM8DV/KvwjQOjG4HQX6PZ5jhxFzWBBn4SV3+2ToWR
         jjr3UJNPw+F/K/WMAQAIPsF/DZ0BJwVkWAjbFWiKGVd9mufjN11Yfpp7zCdTdcb5jrCQ
         iu69UNFL6o1qoouAREkQ5CCp92UNiLudxzlhBt3B3ZuAngf5hrKZIrLrUdU34t6F/8v7
         K/usGW2IpqzSLvn3nY6EYD62o+ok0lkI8b9FuEIMERp+QHU24sCWuJaAFtj7+ETJCjVx
         NFRsJLNl/sLV1jd34jFOo8zv4jpxFPHofGWLdQv3Zdu6lt6rSCdg3SWanRHaNRNx35ba
         m+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729877980; x=1730482780;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rRtgBgW6s/EQDOLVk7vTju3fTexfS9nXJ3lju+LyV5U=;
        b=GDfMoFA47Vwo61rqCYr0dl9SVbdYPqWJUr6PZgy3QVXL9HHoFqDbEosgSZF1Iwe2Uh
         SFZJWFokp8MuLXsUqtL44J+PsBcHVA0RRWN1yUsygENM1PX73Sjcw51XMqEyrEN7QNCJ
         vOYAFI8tBTGAr+PybVWERu7k3rz92JtGkglZLwPLiLkhCff/N5qSrMnehUzOZvAMeUF/
         ffK5KZUZ/9fedWKCDT7VI7GylQbDAVHMNBeTyRZMucnvVAubg9bKtcF1jXlXy4+DqgHZ
         AC4Ci6O86MWJ0CwQbKmnty4YQNIpovpFKv+3aXm/Nqy0SLxikGy1qDow2Oz4sGtYRkZ7
         6Ntg==
X-Forwarded-Encrypted: i=1; AJvYcCUL3Hrz31ufDm3KoxKbQJEPvEd5fOPUFVmwJYo88LGUDFChw6DTaxa2w/oXqLKDTs/antfXD8k1RlVcUpCqEWcQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxophAd7OoyRFDPmYh8Ki6HX8eKxnGxLlE4cKFia1NYLhuRNyrC
	9VKdOUDLsQwxlzIpw/MRlAftbImHWsH3N72kklPCqUrfu2DSGc7gA0CJbQVjKpQ=
X-Google-Smtp-Source: AGHT+IEaYZjwmDMtPye4RiuOg02mqdtcGwqC0dAPHwGmLr3SmAM/hWVbsZOksmPjY0Qxh811xJrTgQ==
X-Received: by 2002:a17:90b:3ec9:b0:2d3:da6d:8330 with SMTP id 98e67ed59e1d1-2e8f10507f6mr183354a91.4.1729877980066;
        Fri, 25 Oct 2024 10:39:40 -0700 (PDT)
Received: from [127.0.1.1] ([4.28.11.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e77e4ca3fcsm3813961a91.13.2024.10.25.10.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:39:39 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Subject: [PATCH net-next v5 0/2] Add the dwmac driver support for T-HEAD
 TH1520 SoC
Date: Fri, 25 Oct 2024 10:39:07 -0700
Message-Id: <20241025-th1520-gmac-v5-0-38d0a48406ff@tenstorrent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALvXG2cC/x3MPQqAMAxA4atIZgM1WP+uIg6hRs1glbaIIN7d4
 vgN7z0QJahEGIoHglwa9fAZtizAbexXQZ2zgQzVlSGLaassGVx3dth23DbMvXENQS7OIIve/20
 ELwm93Amm9/0AtTd5gmcAAAA=
To: Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Drew Fustini <drew@pdp7.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_103941_883474_45A2B3F7 
X-CRM114-Status: GOOD (  21.23  )
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

This series adds support for dwmac gigabit ethernet in the T-Head TH1520
RISC-V SoC used on boards like BeagleV Ahead and the LicheePi 4A.

The gigabit ethernet on these boards does need pinctrl support to mux
the necessary pads. The pinctrl-th1520 driver, pinctrl binding, and
related dts patches are in linux-next. However, they are not yet in
net-next/main.

Therefore, I am dropping the dts patch for v5 as it will not build on
net-next/main due to the lack of the padctrl0_apsys pin controller node
in next-next/main version th1520.dtsi. It does exist in linux-next [1]
and the two patches in this series allow the ethernet ports to work
correctly on the LPi4A and Ahead when applied to linux-next.

The dwmac-thead driver in this series does not need the pinctrl-th1520
driver to build. Nor does the thead,th1520-gmac.yaml binding need the
pinctrl binding to pass the schema check.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/riscv/boot/dts/thead/th1520.dtsi

Changes in v5:
 - Rebase on net-next/main
 - Drop the dts patch from this series. It applies to linux-next but
   not net-next/main.
 - Remove repeated properties from required: in binding
 - Add Rb from Krzysztof for binding
 - Link to v4: https://lore.kernel.org/r/20241020-th1520-dwmac-v4-0-c77acd33ccef@tenstorrent.com

Changes in v4:
 - Rebase on next for pinctrl dependency
 - Add 'net-next' prefix to subject per maintainer-netdev.rst
 - Add clocks, clock-names, interrupts and interrupt-names to binding
 - Simplify driver code by switching from regmap to regualar mmio

Changes in v3:
 - Rebase on v6.12-rc1
 - Remove thead,rx-internal-delay and thead,tx-internal-delay properties
 - Remove unneeded call to thead_dwmac_fix_speed() during probe
 - Fix filename for the yaml file in MAINTAINERS patch
 - Link: https://lore.kernel.org/linux-riscv/20240930-th1520-dwmac-v3-0-ae3e03c225ab@tenstorrent.com/

Changes in v2:
 - Drop the first patch as it is no longer needed due to upstream commit
   d01e0e98de31 ("dt-bindings: net: dwmac: Validate PBL for all IP-cores")
 - Rename compatible from "thead,th1520-dwmac" to "thead,th1520-gmac"
 - Add thead,rx-internal-delay and thead,tx-internal-delay properties
   and check that it does not exceed the maximum value
 - Convert from stmmac_dvr_probe() to devm_stmmac_pltfr_probe() and
   delete the .remove_new hook as it is no longer needed
 - Handle return value of regmap_write() in case it fails
 - Add phy reset delay properties to the BeagleV Ahead device tree
 - Link: https://lore.kernel.org/linux-riscv/20240926-th1520-dwmac-v2-0-f34f28ad1dc9@tenstorrent.com/

Changes in v1:
 - remove thead,gmacapb that references syscon for APB registers
 - add a second memory region to gmac nodes for the APB registers
 - Link: https://lore.kernel.org/all/20240713-thead-dwmac-v1-0-81f04480cd31@tenstorrent.com/

---
Jisheng Zhang (2):
      dt-bindings: net: Add T-HEAD dwmac support
      net: stmmac: Add glue layer for T-HEAD TH1520 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml        |   1 +
 .../devicetree/bindings/net/thead,th1520-gmac.yaml | 110 +++++++++
 MAINTAINERS                                        |   2 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |  10 +
 drivers/net/ethernet/stmicro/stmmac/Makefile       |   1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c  | 268 +++++++++++++++++++++
 6 files changed, 392 insertions(+)
---
base-commit: 03fc07a24735e0be8646563913abf5f5cb71ad19
change-id: 20241025-th1520-gmac-78a76aa90c62

Best regards,
-- 
Drew Fustini <dfustini@tenstorrent.com>


