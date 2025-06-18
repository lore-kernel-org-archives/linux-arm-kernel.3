Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61424C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 09:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6V40YgN3JCSrvwEwSTqFhPuQ1J7Bi4GuX5wKRadAVp8=; b=1V9eOiDjyEF83o
	12FJDJcoMwuikZzJJ5xIpoWbEFx6GGnM+WxFLyNEuEulWnayXrbdfW4Wm5ErAbk87TN1BnZ9jfH7J
	X9TxnxtbBsXOS6VilH7pyRTh7Fl89QMV+GNOJo4j5sWoK1Ny39Q33zsDCEh52gbVRfFaewuVRld+t
	WmfT2Hoa40sxkDdSs6fVOzXih/wdZrBlaRVMz4nlu/5Av9ctoxb945I34EWMSa/GSH0eU5sS0DVvp
	LG2hXd4bqvxhtlwDLsdkXZEyuyHjwm5FaAUTDxaMVcA7CnpmdhbstSgl4dXidWIuQnj3mwmKxVDlj
	nakYE4dWC0eUXOHUK65w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRpVW-00000009fgn-1CE3;
	Wed, 18 Jun 2025 09:55:02 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRpHL-00000009d8c-1MM8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 09:40:24 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-73972a54919so5694780b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 02:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750239622; x=1750844422; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6V40YgN3JCSrvwEwSTqFhPuQ1J7Bi4GuX5wKRadAVp8=;
        b=gnrzEgR1eRCWSHrIMeIR4e4zfWMhv3Ef/0ywlEP3wQto6hmgfJKziBAwFOue4KYauT
         ej4r/d9qgZA80nj64w5wERQGLGYTUvYkmQL1eqlvxw/JF7ID9+T+JwIaa04qrRgsRi1h
         8wN5oiFxNCKb81YgV3nzXCWmxumdg+1TXJ0Kk6qJbRs6/J+D77ZpyJD63e8JNSA9SoL6
         Yn1l3q1XVRm0cjw+/VzeV6g4Oy9Lq8tFiAnQNLYga4H6KlNvVpsevH4c996uKpj2IvHv
         R0KYWpNiICAYnus4r6ZkXABXckmLk3epO486hp8A3vh1FyRMs30qW9bgv6K7mUa9kOiI
         iP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750239622; x=1750844422;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6V40YgN3JCSrvwEwSTqFhPuQ1J7Bi4GuX5wKRadAVp8=;
        b=LBveUUPrQFNzha7YZIaZPCl5wvdTnGVfJerkAmxj0wSkiF0lE4374G/VXPSSOvhAZC
         HL5oJwijOE+F/XfszXVkMBTYuQaQjXIBLfMCiwe5dbu4f3UN+bjYxZ1g/tt0Py1QWpNq
         vtnaly5AEJF1aZTaMg79Uco5usGVLeVH34HHhLNFH2Ofih6MqCtwhdgmLemgIw80hHJT
         Ni9oMB2i5693RYM3l/yF4g2FZVyLGiXso3qQEJrtJE19xVuqEPO773NXEDqZOP8iPmau
         vleSBZj1usZNrt8CkPJz1VDGMT/uRRhRXPSvyZ3q9gKfrwMPbe8YUAIuroNqa/QqSdeo
         z18Q==
X-Forwarded-Encrypted: i=1; AJvYcCUhXEPrxUbkkPaPOq0pxjge+OBf9fBlQ4vOhIDnsmJ+ukXwhIRf5CP0y3QVutFdgOhNt+rW0CSUss4Nkzj61Jfa@lists.infradead.org
X-Gm-Message-State: AOJu0YxW12xv/GjVWeoa/+Ss2KaQ6DVJvfIOBVvRphfo+WfBJT8IEVyJ
	26RGb258J8uXa3scbitbIf4k3iWcc7Tuc8i51bEDideCWYM+vMcsvXjs
X-Gm-Gg: ASbGncvj9t1Qt7H/6EFgGMbOlq851QFV0hbWe0Cofg1vxkIijHr9MBb3Vo922RJRE+r
	HT2OwzpNEjnaWqSJp1QAIuk22+OUANVJ11yNaEY8pSYZNigpbx5yax6UunXPhDp+tLkaVx0zfT3
	/zZI66roOMjmzFTFPUpMPPCkLT1dOUEdF3ud36Zz4+flcpSTcExICyV5uj5VjgrNpN0fDpuc/+U
	iAQn8LxwU4AwfZu8TNxQNvzRTPj4QE4mYw/1kYx+2yU2sfozmQjfVvoUoNFIJEzkEv6Fc+bB4E6
	Ukq9Qdb2A3upWgH0XKSMjugnB62abeRuLuKY2K5Gk+BA1MoYPaAAXCjx2AWXEIln1249dtMcW5S
	NtgyRZ0rUDyDQoi+X8cmGQKLazqPxZlY=
X-Google-Smtp-Source: AGHT+IFmAvBRfvLjEgPAy4QPPhzpRWWfiaUQs2yaKoSBQwrcGyeXathdmws3LB4L9psUMRmX0wfWdw==
X-Received: by 2002:a05:6a00:b95:b0:730:75b1:7219 with SMTP id d2e1a72fcca58-7489d006780mr23000088b3a.12.1750239622126;
        Wed, 18 Jun 2025 02:40:22 -0700 (PDT)
Received: from [172.17.0.2] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffee2aesm10527123b3a.24.2025.06.18.02.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:40:21 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Subject: [PATCH 0/2] ARM: dts: Add support for Meta Clemente BMC
Date: Wed, 18 Jun 2025 17:40:01 +0800
Message-Id: <20250618-add-support-for-meta-clemente-bmc-v1-0-e5ca669ee47b@fii-foxconn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHGJUmgC/x3NTQqDMBBA4avIrB0wqYr2KtJFTMY60PwwSYsg3
 t3Q5bd574RMwpTh2Zwg9OPMMVSotgG7m/AmZFcNutNDN6oJjXOYvylFKbhFQU/FoP2Qp1AIV29
 x7pXpx3m1g35A7SShjY//Y3ld1w240TVkcwAAAA==
X-Change-ID: 20250618-add-support-for-meta-clemente-bmc-941a469bc523
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 bruce.jy.hung@fii-foxconn.com, george.kw.lee@fii-foxconn.com, 
 Leo Wang <leo.jt.wang@fii-foxconn.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750239618; l=815;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=OTnlEGQTaKca/djlqzs4ZnMpNa+lx1vDcpsU3Ydt1XU=;
 b=1KW8ySCD1lwOEWatymBInvgFZuKSAzEDiUjjNsKMpzBXo3w6/oThvGLzJ+lhEBQwV4vpQyNeG
 x+aTVtGRByCBMpJ7qfGgfxJFPMKDEVTnYCfzsgOMohBlUUAbl+ku1p+
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_024023_365424_45EF411F 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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

This series adds initial support for the Meta Clemente BMC based on the ASPEED AST2600 SoC.

Patch 1 documents the compatible string.
Patch 2 adds the device tree for the board.

Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>
---
Leo Wang (2):
      Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
      ARM: dts: aspeed: clemente: add Meta Clemente BMC

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    1 +
 arch/arm/boot/dts/aspeed/Makefile                  |    1 +
 .../dts/aspeed/aspeed-bmc-facebook-clemente.dts    | 1254 ++++++++++++++++++++
 3 files changed, 1256 insertions(+)
---
base-commit: 52da431bf03b5506203bca27fe14a97895c80faf
change-id: 20250618-add-support-for-meta-clemente-bmc-941a469bc523

Best regards,
-- 
Leo Wang <leo.jt.wang@fii-foxconn.com>


