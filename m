Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2FFC43327
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 09:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BrzVHDAthuvQX8kZRzEkQTt99BQ7t+ZkrFrff05bWS0=; b=cHJKMa4dSNiA8mx6qh5XToHi7O
	afzWYEfqt+81o1FTkZTGXP0iWBc6QTJWGUWcc8+lTCMYwNf7zCsTP+tjxNP6O5vPZBlV1oV6luRhL
	3Acrd3RWErtbVY7KjKKNxV4djDdVWTYWi/zcdtlquQkebBV2CMP0nANxDbK3b+siW6ABYrglp6OPa
	isZDuwNMDkSJz0HM3/R1vJ/QI8JYI/UqQul+oo/823NJI4U2THuKmXNYD+fDYMl0jcwF72jMs+CnI
	T8pSLoliWHc8UUB5gGkNWwUAJSU8f7tktrcIEJB4SfU74vglRYFX7Kv5IYfVaK8kOE+Hc2yXCOA4z
	SPQERZLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdPez-0000000CLSc-3EI5;
	Sat, 27 Jun 2026 09:49:13 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdPex-0000000CLRw-1elj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Jun 2026 09:49:12 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-30bc871ecdfso2385896eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Jun 2026 02:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782553750; x=1783158550; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BrzVHDAthuvQX8kZRzEkQTt99BQ7t+ZkrFrff05bWS0=;
        b=gUj1NL6czBBFkmHYIuF4+OwwAOX3efD85uSvYQckgHKDfQhLNrEYMSL4CGOx3YbbHh
         VqnzolL4Y+PlHYfoi+xenO7lTyB06PPkmyZHFVrdaG0aJlZxtJGyS7mdz9woftFBtXGF
         UDucnfH90xnZ2DC1q/OSixAL1W1QaXZo0iNHl2XwWtnUZg///+BcOywOxE87j1AcUgdC
         bnc/rgHHKZxV1DV5DhOG4kKJxWT1VBINOqQBu65icDQc5w2rfv0YsjmQ9JxHHC+6hGyS
         XtY9fKF09NmisnakOInhVOOCsFDl6ahRnIKdYWYVQdC4yOK8a7ZukqK7GR5BbXyxjhml
         qvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782553750; x=1783158550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BrzVHDAthuvQX8kZRzEkQTt99BQ7t+ZkrFrff05bWS0=;
        b=ET0Qiqepag7KJyKfgdRuEKkrMdeEMLIA6MDHCPseHMOiuuPd9CMtmTiZhbOzxtJMZo
         xmdtL44ntPa2j5X+XzCAcp0Iy7kGjBn5r8+eLlRlw1LqFdn3DESEO/09h3JgczTOMHaS
         8EArp6tMHnhF6LBBfV9vbrpE/lRh4CmCrQO9x9N6YyQlabJkCOX1vnOd3TyMdoLEbzyB
         4rdl9rFdzzEQNsgW7Mv74hs0a5pJ8LWFrC2jso35qq0FE5qoVmT2TQJpmgoJpboV41Mp
         I33CDnOv4gxyRaiDsYj1+elgISCxq7DRBLdwpZi/hTVE4MARenPfXMtfWGdqErLyD6KC
         D0Zw==
X-Forwarded-Encrypted: i=1; AHgh+Rrqy0CRBKIxsDjQ96ATpkrlj3TK3CbKPr1jnWYcas/Cr/qXXnGaHiNRbDGNlkT568+/ao0wF+gZYiVikEvCPJCF@lists.infradead.org
X-Gm-Message-State: AOJu0YxVN+vSmLk7JGOaVONcyirB315UdDAXuGu4dHSsCWf6hIya0u7R
	UDruSQ23gsZc6EpliFB9o8UMZ9BtzcOVrz7h0X8glAH8EFECQa7X49sD
X-Gm-Gg: AfdE7cm9yGVtiKqrBxDNaOytkzwhz4BOOm5HbINjAX0+rwtics+MOyZTNUAnZ9mruue
	qIg+oKCzuAAiP8mzLg6fRT8x9w6AmweLAZSQULCn2IUETlYLaCzJAdSZ/w/vLgcVrU6baTi4BM2
	jQQ2Eh2diacBoVjUWNcHaIVi3YfGxlboaSO/xqnRl7awML4VLUaMiCShMBH5R5Bggs24yRLU/Dj
	Jl9ukmtJgFLSaGkgArQMSuTtVAw88LSwsdP7y5JwLH6T3Q/o8jd3AWcEZ7EvOccmDkCP49ddQP0
	NQcqw1D5ZgdSul3OqDkcS3Csi83LpWhfJQLUIZeS0Qwd9Xf4BPYOJH0g0+xSe7ZvCWc3LXcQer0
	DSXJuX9NX8OzpD/ix0gjqbhlNOeFQUTiTMxKja2EJG8ZmOVSp01iNSsQJSPr+t3c5v70WEzQSoj
	vKsgT+duGVW5+7phknkvE=
X-Received: by 2002:a05:7300:3256:b0:304:997c:d4b6 with SMTP id 5a478bee46e88-30c84eba0d2mr10419252eec.17.1782553750413;
        Sat, 27 Jun 2026 02:49:10 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7ca8b918sm28854789eec.28.2026.06.27.02.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 02:49:09 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH 0/2] arm64: dts: rockchip: Add Vicharak Vaaman2 board support
Date: Sat, 27 Jun 2026 15:18:52 +0530
Message-ID: <20260627094854.81564-1-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_024911_448957_AECC2FD8 
X-CRM114-Status: GOOD (  11.68  )
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

This patch series adds device tree support for the Vicharak Vaaman2,
a single-board computer based on the Rockchip RK3588 SoC.

The Vaaman2 board features include:
- RK3588 SoC
- eMMC storage and microSD support
- RK806 PMIC and multiple RK8602/RK8603 regulators
- Real-time clock and status LED
- UART serial console and SARADC

Note: This series was generated on top of the pending Vicharak Axon
board support patches (v7) and includes the Axon entry in the context
of the YAML binding patch.

Patch 1 adds the binding documentation for the Vaaman2 board.
Patch 2 adds the actual device tree file and Makefile entry.

Hrushiraj Gandhi (2):
  dt-bindings: arm: rockchip: Add Vicharak Vaaman2
  arm64: dts: rockchip: Add Vicharak Vaaman2 board

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588-vicharak-vaaman2.dts  | 547 ++++++++++++++++++
 3 files changed, 553 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-vicharak-vaaman2.dts

-- 
2.47.3


