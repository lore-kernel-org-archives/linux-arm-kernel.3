Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A285EC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 15:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fUMtOGS8zyhBJC5CYlKc1rnb8z62m4Hv9NO3LFP4g2Y=; b=NpBKLyxqWBRPSE
	ai+wO7QhZRsnOhzzGLNziYnyCuTMeyYuJmV35QZZgPyfRyS8KdMfuhN7qsqAE+Rf83TPl299pTars
	bfjg8veguziOX+4Th3uXTOCW9wc/xpjysAfY313ujLASWQRHl54t5hRDLmCUepA7G16smQ6nOUtwb
	cNg/7hCFNoiRKvwKPgqhbQYPixPGuxM77lE1z0ugnyoRQQmDOOQUQlhTgqZDiVcy1W6gyMAW4Y9Cs
	5mdN1Y9U2vqQI7oogIUlRMBmr+Sx3YjCQht12FLPSXLaTOaOR8wk8h1YIZCrA/z64m5nGedPyXM44
	Ym7aoHCDO20rZzSVvxpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxnKG-0000000EcUM-3287;
	Sat, 22 Aug 2026 15:08:04 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxnKE-0000000EcU3-4BGx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 15:08:04 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso1528996b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Aug 2026 08:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787411282; x=1788016082; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fUMtOGS8zyhBJC5CYlKc1rnb8z62m4Hv9NO3LFP4g2Y=;
        b=kTWxU2rV+XR0e8rsCK3sXAfsRCyGzCAP+ooh37T+Kv4ckUv3Q0D26Nnf/WYdCSi3x/
         smogTdIKNBk007brBiie2222ik4BKHiYuml2XHSeiy54SOuj34W79Vn7W+Zj4YGsYLTb
         g1slSR1dKjj2pbR1EYS2gQOt1SV9iJzwJZvR/GyP2uMDjnRj2ywtQAmmoN478//MRLim
         ZTp128UnvN0KNQ9O8CeSD1q/He4ucY0RVzJKSJrHBof4Ie9Ikp/Mw08jJ2xC74FSaYYW
         5HyX3OOaHcZaP91YDBksGJThxrldM/Tw4568ssh45vVfYv/36NY70vyXd0TrzhU1MH8v
         l9SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787411282; x=1788016082;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fUMtOGS8zyhBJC5CYlKc1rnb8z62m4Hv9NO3LFP4g2Y=;
        b=lXPsuKN0iiESydi+0zoqCE7FZht/90Hj+QXoyh6igH5ZgYGgEHESg2aOs7WO6kheLN
         JvbRucWQvWm4NiGTyN6zhQeZ4OlwQa3ajwXfaKfUp5ca/y31bO5iT0/6yaJj++Tl9lc/
         JLzl+KOjB/oHZ+Dgor3cmHw5kRCtDzImefi9u3iEwh0SVfE/1PLriutHf+rt+hDdsi+2
         Csb8RP30GnQI88gh6svqo1xV4L10Oy6rZcfmQ84AfadHMsCyNYzGwwYVFzSVgtv2tGiC
         Liwtti9THMAws1buDT4YA66JRV7EW3Bx2HAY6r9FxIvmTjS5RjgK92wvuHEmYsl/i12l
         GVkw==
X-Forwarded-Encrypted: i=1; AHgh+RpRvyUKYNoxdfKwd0eoYjkPzw0d+/MevK0N41HBPxNLLXNayAs19onzqy2qRiCOnEF7YOqcoB7T5/v9ReMr4aGK@lists.infradead.org
X-Gm-Message-State: AFuF++k+ODbQUCMvfHLZ2q1+I/DyxCYB58/oMP+oApg3jPmxknwDZPeW
	uFwwBzHcshqB9kwcRW0rt7vxH0Zqi/WVgi7S5ht9XZho+TjunCQv+1Tj
X-Gm-Gg: AR+sD11ulDp/H+9bpeAOpYZSd7LeI8qNboyIX4dUO48m7XYFwP+ssGGJuff95jk3GuT
	VNaeGYCToMPqMltI7l0QsXOZ8aPgzEqASfqxFazq7RG27uItSRsw/8bW5DHrese6z2ljRxNMWNv
	aF+A0g+mkXPL2PLK0gizer2SLowWXUe7M3PTcLo5EzO099C8ElGmqMfPFn/ARRXDKPhUhwnSNph
	urEsrwsFa5QtjuweQDJXXClhuFkhVW8fBBSs7F82sQs8OaZwIE0PrgjKJinXOPW20cEC1HjmVFG
	NZAsmaVF4b9mfofMQAz14mfTbtbHwOL1Hh6LLD/v4SUb0IfeICNGWk/dVcTORZhLMwc8o0G9rCm
	YfP9K3bQwD/kxaP8VU3OOrMt9SfYeMe10c4XTnLAdSRCakFUVOLWXr6m8kNOPV51TIegMjGhtr/
	iqf8q4TSZ/zMUVkzcCe22qmu6O81j7neGNYqIWfDUO0e48y/WdF9Ez2bhDstHxTr6BeyrSXjLH+
	UElharWsaCq25zRzPPC9Vc2MKhlKIwz9w0Byk+KBgNMWqEp/wBtJzvY
X-Received: by 2002:a05:6a00:14d0:b0:848:42d0:bc91 with SMTP id d2e1a72fcca58-851f9f95fc7mr21277878b3a.12.1787411281658;
        Sat, 22 Aug 2026 08:08:01 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520f03b1ebsm628242b3a.30.2026.08.22.08.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 08:08:01 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Subject: [PATCH 0/3] PCI: dra7xx: fix resource leaks in probe error paths
Date: Sat, 22 Aug 2026 23:07:46 +0800
Message-Id: <20260822-dra7xx-v1-0-23e204d5548b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEK7iWoC/yXMyw5AMBCF4VeRWWtS41qvIhbKYCyQFmnSeHfF8
 kv+czxYMkwW6siDoYstb2tAEkfQz906keAhGFBiIStEMZiudE6kSmGuSWeYKAjxbmhk9x017W9
 76oX6413DfT/2cu1bagAAAA==
X-Change-ID: 20260822-dra7xx-39925beb4219
To: Vignesh Raghavendra <vigneshr@ti.com>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Sekhar Nori <nsekhar@ti.com>
Cc: linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787411275; l=537;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=fM/v5LfJ7wD6zkHTL7r/iIf5dy1yBXXY+Csxk9byOzE=;
 b=nRvz5HHIz8g2YI3VEGB1Qw2A519Mv7ta0J4annH4nPc7wj0hYrfySM/gTClQZT0ijV6yohPmy
 pjxILiQUbKNA702EBlHiLsSmzd0RTyknl08z/9SNgFtDLvrdsbDqwip
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_080803_048393_EFC9AE55 
X-CRM114-Status: UNSURE (   6.90  )
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

Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Felix Gu (3):
      PCI: dra7xx: Fix clock enable leak on probe failure
      PCI: dra7xx: Fix device link leak when devm_phy_get() fails
      PCI: dra7xx: Fix device links leak when dra7xx_pcie_enable_phy() fails

 drivers/pci/controller/dwc/pci-dra7xx.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)
---
base-commit: 903c1cf6dff9964e71eda98a39e2e5d442050472
change-id: 20260822-dra7xx-39925beb4219

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>


