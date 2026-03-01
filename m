Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05999FD0055
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 07:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ojBU3qsJs2ejfRqpiuBbWHbl1eur015MogxwzTgNK1o=; b=WWkIsogLizkbKsYoRaG3bf5s81
	1Tj+tVcTAY7k0BffV2v3ImpsRpMBDEY12JdJpNXf4ggpoR0YSMCYeeDCKyN236qfhkvnWi5VQ02B7
	/QBNvAxmgxklvXcsVsMK5yASb5n1q7w2eDjWeGJg0GbP2aPgiPIxu03LuVkKO8aPB1cgWRggMFxr+
	a4b6LZmYqC98gtPA6mKCPSde31RMFqDTNZp/KgqRcnNzGFLOo79aBVIZKAxgQ3jo5T0S03RS9khsZ
	oUihHVsOV22ylp6e5Y8/dRA0Yf+ldPg6fOzG8BZKG+JRqOQuESnde82eQ9s19uqxD+npK7nA9Dzts
	C8gsQH5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwavf-0000000AtwG-3z6b;
	Sun, 01 Mar 2026 07:09:27 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwavd-0000000Atvm-0fQz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 07:09:26 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3598661fe57so68470a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 23:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772348964; x=1772953764; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ojBU3qsJs2ejfRqpiuBbWHbl1eur015MogxwzTgNK1o=;
        b=e3UlGJ7o/b3ZPpeEFHyjVEj2TxciDlLhzjRZ2UCMldsnddBQm+KZL32fH8VSCssxor
         k+dQNyfDXnp4KV0Z11JEuFjKhRLF6aIkN5KbSg1gTk17ls23/5JwVxlfO/VVI3mkpFEk
         c7vShs4Zr7fUtVgJUDRpfY07nlk3yzlwx3jNbg4Uzu9hXUMvIcJqMxDPPNjdo7FT6OuP
         3Vd88kae4Rrv69HmSQzMA/Ktiw8NLT4p/UtSCbq9IEWqumoWidbOCbUHuTkwFSUE0GO9
         ldktTZ3ARgUlv9NWFM0I40Bu6AJEnx9Zz5HnikHdjOY+jL/M3DWQiXsLvQg8jVqd/H4d
         qqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772348964; x=1772953764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ojBU3qsJs2ejfRqpiuBbWHbl1eur015MogxwzTgNK1o=;
        b=Y4eL4jOflBFGjI8+idRZqr/Yu0rdgJHuO9BhOdRURP5lQ8gvG1luE7V5DtquFh8LeS
         1F5mv9gPBZZ5E9/iZEKjPZWLbrXIJ1ZLBvovWeDm7/G8KF3OMQDBDCpYPGtrBcL2lXhj
         XkEPb1uPBrKJhs1PBU08c031wIyHpWXu2ckcI+g/cWDuTr1/JBkf2tOQA3gIpG7SVup4
         /DdOtZn0TGKEERHbhFYu+4Y7lo1SRoL8QZUgKcE3wTV8Acn3dgXPp0N+Cqkw0CJuzkTd
         rOuluZr+0pXftpI1goz4tyqUjl6/kIB59mjEhSfCH8n0p4H1cPsamlXEbsDaCNuZvA9b
         da3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWE6t9cdI1bQatfbfpQhWJoDz/EylSUxlGRCltJ+8lH3kLI93Vtl0/tDLbBVWi0j5Y+BoBTOHRdpXZ048xD6AMz@lists.infradead.org
X-Gm-Message-State: AOJu0YykfZInprvkbhu4iJP0ctUXJ8iVHWhMJ2AOmwAeQdGw0nHGF5y3
	QL8oJ1ysTXq0A/ydxDt+npBitL2LkihcgmR9Cs+RSNAnChtPKhHSPB0X
X-Gm-Gg: ATEYQzw8qLF32ofcdjSUSDMfqyvtV8RCWWmGJoXPSRLcMDW4+tzXKwLCbDjPNaSu63/
	A2zls5JXiVrXIlElE1gsIWMrDnQwJyOdtLythQ4oTeeo9sr5QBOLMZvY+t4AkmzjYmeQofJFGeG
	zrs4NugxESB9CqoNPVBe8u+l076D5YnqJIAcSjcu4rQy3YgfF6BbaoY1q43GcZsff7vJJ2QW06i
	svIWp01qVkVMEf1jgJLwTQV+QPNXh5wxt+eUJWUD9GuXDGwnkQdr/fdURbX0jgoa05OHgF1v1gR
	a3Qiw6Vx2MpfzpM+G6uNGrecPTMgi2PeuBMsTzIeY43e+5hu0mF0G1nG12F4jcL8ghvNc1scL8p
	O6alVJJZxpboCocdNfxLZrnIwp4FO9cz9wvOoc4mxq9kODyhMP2c1vULbyqWBZM+FTcFJasYNle
	UqNvJOY/pNQ+XUc2VLdNQdfUwhr23wSehr/Z5PZXG7mGMo
X-Received: by 2002:a17:90b:3501:b0:34a:4434:cf87 with SMTP id 98e67ed59e1d1-35965c0beecmr6172846a91.1.1772348963574;
        Sat, 28 Feb 2026 23:09:23 -0800 (PST)
Received: from localhost.localdomain ([240e:400:9c28:18f2:532a:7136:9478:4b8a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359814e3eb4sm2473463a91.16.2026.02.28.23.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 23:09:23 -0800 (PST)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Chen <peter.chen@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>
Cc: Gary Yang <gary.yang@cixtech.com>,
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [PATCH v4 0/3] reset: cix: add support for cix sky1 resets
Date: Sun,  1 Mar 2026 15:09:07 +0800
Message-Id: <20260301070910.6169-1-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_230925_244700_90C32984 
X-CRM114-Status: GOOD (  14.91  )
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

This patch series adds support for the System Reset Controller (SRC)
found on the CIX Sky1 SoC. The SRC provides reset capabilities to various
peripherals across the S0 and S5 domains.

Changes in v4:
- Restored the 'syscon' architecture to properly describe the SRC as a 
  unified memory region, addressing DT review feedback from Conor Dooley on v3.
- Replaced the fragmented 'reg' items in the YAML bindings and DTS with 
  unified contiguous memory regions (e.g., 0x16000000 and 0x04160000).
- Refactored the driver to drop independent ioremap logic. It now cleanly 
  fetches the regmap via syscon_node_to_regmap to prevent resource conflicts.
- Xueyuan Chen took over the patchset for architectural refactoring.

Changes in v3:
- Passed dts build checks (dt_binding_check, CHECK_DTBS).
- Removed initial syscon attempt (reverted in v4 for the correct architecture).

Gary Yang (1):
  dt-bindings: reset: add sky1 reset controller

Xueyuan Chen (2):
  reset: cix: add support for cix sky1 resets
  arm64: dts: cix: add src syscon nodes for sky1 resets

 .../bindings/reset/cix,sky1-rst.yaml          |  51 +++
 arch/arm64/boot/dts/cix/sky1.dtsi             |  12 +
 drivers/reset/Kconfig                         |   7 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-sky1.c                    | 372 ++++++++++++++++++
 include/dt-bindings/reset/cix,sky1-rst-fch.h  |  42 ++
 include/dt-bindings/reset/cix,sky1-rst.h      | 164 ++++++++
 7 files changed, 649 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/cix,sky1-rst.yaml
 create mode 100644 drivers/reset/reset-sky1.c
 create mode 100644 include/dt-bindings/reset/cix,sky1-rst-fch.h
 create mode 100644 include/dt-bindings/reset/cix,sky1-rst.h

-- 
2.43.0


