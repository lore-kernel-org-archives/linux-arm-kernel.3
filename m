Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CEAC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 18:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rLmL0UWh2UzlPfOvcpQnJu8m6y3UesOtRIguVui1r2A=; b=hiD1jhxg3B2WzeOLbMR2H7WmYZ
	ep1e7ayYf+TZQ8+I5/4q+Rqcm5d9Thtje1Qvr2B1Xx6HPHBNX2H1RPyxwNuRME7pHQGMqCYQq7WbP
	agTI2eWir3TWY8AvJcsXBh8a/i+2r4en5Y/uDpkQ62Jb3Mrh6EWkav1XKUZQRCC377frNakvaTGEK
	a+qwCGBTc15PC1eg+q21VXNS1YoRDOmGUMHJamN/LYpOIdUtdCIO9lZ/3H83a73YsciCXbkrq2V9I
	1Aqj8fgbTLfhPZNIj0wQXD3zlHPxrZ+gkqxB+e/vFUipTFSQdxjY5JOe5UjXvjaTKIxoPrUxg67KM
	ZE56JP7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk5bB-00000005ZQw-3kLm;
	Mon, 17 Feb 2025 18:12:05 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk4U8-00000005NMo-0SEe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 17:00:45 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-abb7aecd39fso356664366b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 09:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739811642; x=1740416442; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rLmL0UWh2UzlPfOvcpQnJu8m6y3UesOtRIguVui1r2A=;
        b=g20ylk7JlDyKC+oVESY4XDrTE0GeE0NbVR+NbvT2J89EExFeze9wWJ1yF4OLbPVeWl
         FCcfQSwXy1+DsJenvrc9NQiP8mK7wfRnHxfBJJkEjJoBDz42A/gVCphsTHv8IfbY34A2
         5Z2kVqle7rnEGF/iIZGwBWnBLgowj0aRmc1hL4uQC9xpoaxrj5PLKeUZ7aVpJUyV2Ncz
         is4C30lHGKhTWN48P8Ib7htrNERQRNrWnkCJQimgkkQHz9K9ep+aq7PmG2shQNTAzc6X
         aQZL3iX/ly7AIQXzpXrOMyybySPZnEbi7OZ++NKe9JrX9co18CmwKsAW9Ipy4hAQGuD7
         rmUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739811642; x=1740416442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rLmL0UWh2UzlPfOvcpQnJu8m6y3UesOtRIguVui1r2A=;
        b=nrCTkBTeM20+6Ua55bQof8QyuXrrdYYnf3NzThBLb/pW+tWzdty+I39hUscPdG9EAk
         0QDlTVcdOuF/U33N/vh46tYIeZFXLiPC3FHWn/afraxmyNf+xhyftfaVOaLhLNu5LiUY
         WTVgZr+mGp/AVhgx4yqzQlNDX5+KJ8vGRtJ5pUC9pYhx9yAV5bNofNx3CvIg2dhSGxLG
         EyyR2zePrdOg6ZehU6hKBujf/PVZEKmhRnHaRwYSLDCWsMmaur6larqtTp1h8Jusntzm
         KYa0c887k2n8uP0fXpXNtWNq5MmCG8QVjH4b7/SL4SRYF4MkVSba3Xeteu7kxrVfr576
         yuDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWr2iiiFhJsxdh67nmdWbdG693puL5siAeclcjYSt0n5sO9FVTUCIPBX8gqSymmWmy7CKKXLawOIC1TatF29ENN@lists.infradead.org
X-Gm-Message-State: AOJu0YxKBRJi7QSdZwemWiU3gQp7i6RwdaXMaY+fq0kU/4y+E7EEqPX5
	dcZYTE3C0cqOdEvrhVxH3joF3waJ9N3u4ngHTconS2WPyKHXEQhw
X-Gm-Gg: ASbGncvME7YAsJWqwZb9z0TvxYyl0WKTT6ia/ovezcUuKaeR4C9IeKqughTUwsHZ2tq
	l2dS2/qmGmYycU2bP9VLtHqc0ppQaqXD2jmf69OHMgTQ8/hoRmo5Wc3HkFU9BY8OcDiIgRh6Jy4
	2IKnVIWA3+EKIpDDQattuqXfyBj450eybJ3GZUZkqMWWQWudMHoE+HeIJNoAiyDXCQqiY4xXD2o
	gJap4Iuyz72GrLM3t+rweoP2g77jToobKLgC1zgTZoYpszg1BK9P5BKWF5Z4vToysObax7h+eCP
	gDwI3vrr4uR0ytzJKgdgi0EosfcbkQfpYfSJ3KUU7hT9RM4oJ7qP2A==
X-Google-Smtp-Source: AGHT+IEQjpAvGijd0ctj4hjtd2+w3lCuwj9m7YB2SsgjG2XRGOIZCHqfT/+w91RWWa9Hip9qD8kxRA==
X-Received: by 2002:a17:907:60d6:b0:ab6:ed8a:3c14 with SMTP id a640c23a62f3a-abb70c8e70emr1013316166b.27.1739811642166;
        Mon, 17 Feb 2025 09:00:42 -0800 (PST)
Received: from playground.localdomain ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba53376aa2sm920570766b.103.2025.02.17.09.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 09:00:41 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] clk: imx8mp: fix parents of AUDIOMIX DSP/OCRAM_A
Date: Mon, 17 Feb 2025 11:57:14 -0500
Message-Id: <20250217165718.74619-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_090044_149385_26B5AC99 
X-CRM114-Status: UNSURE (   8.90  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Correct the parent of the AUDIOMIX DSP and OCRAM_A clock gates by setting
it to AUDIO_AXI_CLK_ROOT, instead of AUDIO_AHB_CLK_ROOT. Additionally, set
the frequency of AUDIO_AXI_CLK_ROOT to 800MHz instead of the current
400MHz.

Laurentiu Mihalcea (4):
  dt-bindings: clock: imx8mp: add axi clock
  clk: clk-imx8mp-audiomix: fix dsp/ocram_a clock parents
  arm64: dts: imx8mp: add AUDIO_AXI_CLK_ROOT to AUDIOMIX block
  arm64: dts: imx8mp: change AUDIO_AXI_CLK_ROOT freq. to 800MHz

 .../devicetree/bindings/clock/imx8mp-audiomix.yaml     | 10 ++++++----
 arch/arm64/boot/dts/freescale/imx8mp.dtsi              |  7 ++++---
 drivers/clk/imx/clk-imx8mp-audiomix.c                  |  6 +++---
 3 files changed, 13 insertions(+), 10 deletions(-)

-- 
2.34.1


