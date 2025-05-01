Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AAA5C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 12:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QarYVaH0v20mTotvxQdSp+TNmjgBdUC/EhjLO8cfUNQ=; b=aiYewrtwUxyFfu6vkO9jbJ822C
	7bEuOoUjNfE4ecVRzrNljILjPubgMUFCCdGERReJ6lDBzPV5kmalJ46leF41bqCyT7FXbYqxgHXHg
	3ruWpSgUOT/tVMt31Ua5zhi8JgYbUZQB5Flg1AXF0eGvq+6c/aLqWSjST7PJm1lD1CZhoi6A3IX/Z
	ajo1VMU9mb8WG/+IKeJTTxfzf9e/vD2WoI4hELSD99FYoB9IArrFZudPL7RlyAAe4upbSd/ScrQ/N
	y8pMhTsdodM1A1pp1NYnnGAWkhkFy6CQj0b8Z1HvQAGcZrZHdDbv82S6QhQwMC+jlmU7iegzxfnp4
	OwhjGN3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uATMG-0000000FjSo-1cEs;
	Thu, 01 May 2025 12:49:44 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uATAF-0000000Fhnj-2Z5g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 12:37:20 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4394a823036so7957605e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 05:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746103037; x=1746707837; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QarYVaH0v20mTotvxQdSp+TNmjgBdUC/EhjLO8cfUNQ=;
        b=HI4adjVeJxrAUjm8/DafNeBRo55kRXAM24Iq/QGeVG9mtVAm++neH6wKrQD9keHRcO
         UrmyweFME3FU/SeDi7aeFsPkcVCJlkRzYgVECF6r0SzwVIxX82akTZDtfqpSrdC3mfr1
         GF42VB9ybkXV6MD3wih9U5NW3yF5la/fPr0YwGGCu4Zkh/OBB1dQeUixJZGSD4+aoq5N
         YMnmDqW11+BgNJkGNYuXkgp/KTJ0mGbWF1cN24nZ3RSEKOsYYoJZTXN0ZXeB7feAiOCm
         uQ0lMnfmp1gmjBlsA+4ExB9zoNeRsp8F+Cz1ekN2rfy2jn3X8K4FAZZ77Wz9HsOldA5V
         yDbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746103037; x=1746707837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QarYVaH0v20mTotvxQdSp+TNmjgBdUC/EhjLO8cfUNQ=;
        b=p1GZPZSlFrKZCwUPY7znzwWlUb5FVlVe0jf7ARvmEnxTrK7AGXLB6ptsVs1Z6M1JNW
         9lPWXjC+ppE6UJfXo4H4s2c4+yi3M8Yn7B5ObWk9zj8BO3PVwupmIrhz40cHwuPC4KH9
         WV2uCcPWDFWnG2RHIoZxO7MhiNtkdCBKzieOrznHRdgNG3tgN+lWxbXYBHdRLCvB18C7
         Y82MaNmPVfJhI6kyQp8pT1wU/dQXRA3Fpn+Ew8F00v5bevpOwZ9P/2im5Kg0GPgTszJe
         H2XDu8F5m8/TNP68QVuEm1GISCNscDDcZLKEaFYWlkhrHar8fHZ82MbRHBVcyxdnxcLP
         x3Dw==
X-Forwarded-Encrypted: i=1; AJvYcCXeRp/Cjjy+PMXbIWyCKDMRvyb/w2ANSjsfYIu8OhQgV6w3QoJ5sFsTDDpWwwEeqyvTMG6JJqH/yKvRKu/E4qYf@lists.infradead.org
X-Gm-Message-State: AOJu0Yzke4RG4slrjCfuG7CV3dwp2V6VufLtrl7a9f+rhQsmBGbqVv1C
	DSIMc1RzdWPU0rfTYtGssTjyJNZ0kljIrMeaa93nVpiViFr6SpLIsstre2Pd
X-Gm-Gg: ASbGnctdGDZvBas0yn6IP05eACVmHkFWUCSWcsd1t2oLVV2R3HO2vfNvl0Cph9UYG0Y
	e+yASW+4Pnllbrx+snX9SfFhH9/OzpMTdcpPiTVuGPHwKMjIBgyQie8dWXfG6eBB05ht0FGMadt
	wUbLF2pG51yvM0IfcZiiXBDcw93KGsCGWhP/9/XK+jHSKEaNfT5Xln262f9B6DX/c8PJnn/UwCM
	052MUBy3kbHH4ImyZDYGgBdeML/Te+Y7bVSDt708l1/96XPpZ55x63Ik3vH7HjPO+HCJjlxDSZO
	IEr8NqfoRcIlKIv7pvjLU7QqACAPHCJDGc9S0ntjBHqLnSwc7XsindoyOz/ldWsw
X-Google-Smtp-Source: AGHT+IG8jggn8A7KlYdw5KvTYjXV5NzOswZFTlK/eHsc27wVMfwBj6SLLMeFwc//UR9osY5bfEFJpQ==
X-Received: by 2002:a05:600c:3b0c:b0:43d:745a:5a50 with SMTP id 5b1f17b1804b1-441b1f388famr64205075e9.19.1746103037104;
        Thu, 01 May 2025 05:37:17 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:f0e:4490:d947:2c92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89cc469sm11144765e9.6.2025.05.01.05.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 05:37:16 -0700 (PDT)
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
Subject: [PATCH 0/2] Add support for Renesas OSTM on RZ/V2N SoC
Date: Thu,  1 May 2025 13:37:07 +0100
Message-ID: <20250501123709.56513-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_053719_654383_9CA94CBD 
X-CRM114-Status: GOOD (  12.78  )
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

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: timer: renesas,ostm: Document RZ/V2N (R9A09G056) support
  clocksource/drivers/renesas-ostm: Enable OSTM reprobe for RZ/V2N SoC

 Documentation/devicetree/bindings/timer/renesas,ostm.yaml | 2 ++
 drivers/clocksource/renesas-ostm.c                        | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.49.0


