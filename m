Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B075AD1038E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 01:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sYpfrlq0V0bV9nsDJv9ukMK1/gCt1wSxEcrYWbmTl9Q=; b=nYRnDCMZeV6XGXctMlhjAdIxE2
	fJ981AgbMQm5nuRNJ67xZoiOZkmaeSNKGfxk7twuvnxYcxg/NYnPbkXAOTgUJyMpkWx3IpmWQaTVt
	dMCXHu4gv0eZR00NEF7h8UIeP9zN8h5YDqa1cW5KKGMWIPgYNa0OIS4QVHvts3Mq5Ndsa8uUbKsPW
	d7w9d98bAdc/xNPYYwwi6tWggMmIZbLj9en6XpECE54wznhRXUSHM7E5z/SB8YG+9/F4673Qv9AJ9
	ABmJkZDha8FQ4COmdAwlfgpG4XYtq7skieQb+tjkGVbCknrIVQhdKrApeSUE7YgragShvRA5Vdzhm
	40IVp2iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t48wt-000000029UL-3LX8;
	Fri, 25 Oct 2024 01:17:07 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t48qQ-000000028R3-0JbR;
	Fri, 25 Oct 2024 01:10:27 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-71e5a1c9071so1118066b3a.0;
        Thu, 24 Oct 2024 18:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729818625; x=1730423425; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sYpfrlq0V0bV9nsDJv9ukMK1/gCt1wSxEcrYWbmTl9Q=;
        b=H+RiVxHMBkB8LXdJm1arUm9oel0lz6uDPfCOBjgXZ1Lv7V82wAB/iiqe+PUNCaUmkM
         HJ3s+emm7jWqw222tuy3CNMf26z3PzEIkegvnIN9XnEdiNtCCTTQD54a1Yn5IPOvAh+Z
         q8JYy1nZzaau5tlvCP/yRX+TLRmHW4SYVXyNGTlf9S4WhyIqzpUHbNOagsSurvAkmt85
         IyeGeXHAlV3tDa1Kkb20GS8w40nZzlZLeLE591weUMGQhCMw3BBlsMYDen1VhBaEVzzY
         virj8eH7SF2HbACJ6oXr6RJIEnSP8RoKdnf/6mI+0hTu3yFi/qqdbfsHAF8c83FVf3f2
         5qVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729818625; x=1730423425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sYpfrlq0V0bV9nsDJv9ukMK1/gCt1wSxEcrYWbmTl9Q=;
        b=A+zAZdkwFYGFsXgSh1eLfX/3SQ6/Tarf+VZKcJ6PlouDhKbJbV8FyJBbJpx3oYUbMV
         W49/v2FIeb7Cu1QpVxqIks5WNjcvyd8hBrPeAaxeaae2YrvpcOwR4+aElXq082vwHPIy
         jbl05SvPGLSlOoIwEVuQmV+uur/8li0QFMXoiG7uBYnZErviNFnJ0pfcwOLCTvGsM3Pd
         gKx1ADpR78FngTlDXdadD5hYMgZImPVy2TO/w77UnuSDWx8founmSlxyFpK23RhnvbG4
         qWtpjHNnqohJucurOlAHaOag5ZG/4lBkGQMrnu3Hv/xpOZYIEoP2Gip6ZQqjAqLqzIPZ
         QC4w==
X-Forwarded-Encrypted: i=1; AJvYcCU6tyckhjgMLci6QBa/OPhWGphciCQ+gH2zzwKYcYEJMlJtotS2hHwmQWDnsN6GJybuW90l+y0JwbQAKfo=@lists.infradead.org, AJvYcCXsrJ9DCEXm8dZ7f7lq0qclqDoahaiuX/yuvNg5JT/EF3M4rj5GmLw4pUEQWt0i2e3SfdMzOLuDQaYqVDqloQBe@lists.infradead.org
X-Gm-Message-State: AOJu0YwuUm6EhKSjkIhhXSsCv/xrxurHe17CCYnkvG4iRaLwhV0uDkF0
	4+FkRieR/gnqV3WCffmLPjfHXUFAVCABE1UQjil1nRgi4khfFBzw
X-Google-Smtp-Source: AGHT+IFpOd28fEHMTcKxVcGsg5KEPz6mrlaxZYvtZFvJjTxq2WDoP6vXaOQgIFHT9LXF1AJwY1a6nA==
X-Received: by 2002:a05:6a00:190e:b0:71e:4c86:6594 with SMTP id d2e1a72fcca58-72030a51d13mr11382153b3a.10.1729818624886;
        Thu, 24 Oct 2024 18:10:24 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a0b9b1sm53397b3a.133.2024.10.24.18.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 18:10:24 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/4] riscv: sophgo: Add ethernet support for SG2044
Date: Fri, 25 Oct 2024 09:09:56 +0800
Message-ID: <20241025011000.244350-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_181026_230508_7F1202A3 
X-CRM114-Status: GOOD (  11.98  )
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

The ethernet controller of SG2044 is Synopsys DesignWare IP with
custom clock. Add glue layer for it.

Since v2, these patch depends on that following patch that provides
helper function to compute rgmii clock:
https://lore.kernel.org/netdev/20241013-upstream_s32cc_gmac-v3-4-d84b5a67b930@oss.nxp.com/

Changed from v1:
1. patch 2: remove sophgo,syscon as this mac delay is resolved.
2. patch 2: apply all the properties unconditionally.
3. patch 4: remove sophgo,syscon code as this mac delay is resolved.
4. patch 4: use the helper function to compute rgmii clock.
5. patch 4: use remove instead of remove_new for the platform driver.

Inochi Amaoto (4):
  dt-bindings: net: snps,dwmac: Add dwmac-5.30a version
  dt-bindings: net: Add support for Sophgo SG2044 dwmac
  net: stmmac: platform: Add snps,dwmac-5.30a IP compatible string
  net: stmmac: Add glue layer for Sophgo SG2044 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml   |   4 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 124 ++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 109 +++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |   3 +-
 6 files changed, 251 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c

--
2.47.0


