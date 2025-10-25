Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80EF9CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 04:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OEVFVM/l2psTi4+scJeyVhhgmazdGrNFi6gMHZXJLQg=; b=fsqtt6VtL915oNRw7Co5THpr3M
	Af4bHw2q2sPfBW03zg2QwDHs0T8d/UbeHAVssRYbYpp707vxFe2Ax9P48ZhUlG26S9kWW9Ke3z2tn
	E/NTjoD2LrKgE19KCZIRlAuvkQ0KhAXc4yEX+DZOkK3Ecx3bKSKh9LgEha0DzWA+kl3Qm17ejysoy
	FplzRybN5UTmLb/WscZReBSOc4rw2g8putYhbyK+y5HrJ01OMu+CMRQlmJ/yevp7R21jtLNSa/SBE
	iQBQ8gEesgXw0+nEaNQqV20srQKUF5g+MBuuo5XIF+UPyk0gkb63YrwoTZ7FD7qFrz4XWYrQVGbVm
	45tNa3vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCVwf-0000000AwPe-0kFM;
	Sat, 25 Oct 2025 04:32:01 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCVwb-0000000AwPG-3rqX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 04:31:59 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-378d65d8184so37576291fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 21:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761366715; x=1761971515; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OEVFVM/l2psTi4+scJeyVhhgmazdGrNFi6gMHZXJLQg=;
        b=UV72kQyjLHnnxmtT+/ubg8bc0/wDbWx7K5fSUSle84BHF0ujuLLUb3uJNGMB/akQ+c
         6rLaafqBYWD3nQ31daz/rBUUtisN4nO11CV97CnW7bvDmzdkqqxNRIaXl6Lts1qTfa5V
         98Fcjw7yPAC0aSMcZjnoqnVTgYEnGmUx51h4J3Pli7dWNfNPMDEEKX5O4Prq4tdEtuhC
         Wnagt4dOR63v+oZjgkfEp+jlVZ0c1KWjODaTt3tDQDdwNxSfi7AxOCNv3K0i/899qlkO
         nWgoELaCpUjXyA7sY9LqeuVuxfzr7JoEkaq11rB1zZ7qjR32TCE/t9667bt/aY8N7+Kt
         IgaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761366715; x=1761971515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OEVFVM/l2psTi4+scJeyVhhgmazdGrNFi6gMHZXJLQg=;
        b=SAGmcfAZ8UMoypT7Klfr1RNBNDp3/PIW6m4bwa9z0mLDig8007JkiNWwaIUqL2dVy+
         XmLbPOr5NsRGm5pgNY85ci8pUmKfiwj9hEKw2ua9ncL0AmbzGMxWoqKhwkqA4+uYZdry
         ICrg+mBApJqldYtbFFROS3nd00ZayalYfX4oeZ34FvXTcRcxjiJIo4wtkH2E2skfaES5
         djZja+sjWe71yb8tSI7Ttcpf/Dm114XJU4Gx+WhRievlRe9xFn1paor1IiIkh26HKo55
         QJ0pCi0hNVhFBzPSxn4yeHViEn2IAyoY6hVXm1Ybg5MQIlrPNfpp8s8Qcgr3LE19RXW7
         KfhA==
X-Forwarded-Encrypted: i=1; AJvYcCW0k7pUGvXIQc99sg1KudXKZLg1ZuZJ+5VuRxNvMLY/XVDTLRm91Ei4a6xSnBZ/eiP/RsFOlqSBjJ2KfOAmOe/4@lists.infradead.org
X-Gm-Message-State: AOJu0YwZvb86IZPBDl4AycQd8pLnIxnb/h2kimNtS3Mbt1cgIUwIokAt
	PpvTP55zTnI3F+GVxmFIGSZawcN1SdMzCQiqsBcu+eXpaG0PavIyMnjH
X-Gm-Gg: ASbGncss1zfpZObNHz0GlDQN7dctUMKHM9mIUbWvPKv5bY7FE09umLAr8QNk+tQ30VH
	qJQ9NCi9rEnLb7edQk5FK9c5hIv56MQkRuUMvBNixAvJZmn687kX4Zv0gHOCjlEEZ5leWz37Hir
	uc/ezTIjC4pdbJLGuLhQf/FIs7NTBICFqjyXwRkgD7sp4ib33cjKV5HITS9pz39xOyeKLn1EgIM
	B50dGt7T8W26WeKRmXm3MLiZqO+ZFI/yHDRuSXNQ2eOhi6qOHgswg9gYZR72lITV8HB0O3BHV63
	Nk1CF1WlVjXECKpnhgTYFCuYB7NdVRWTldnZAsbOm5z9V42NiCuxYhJQZYPm8+o6yNKY8QCogG/
	kLan4BLvqHU6NaQ/HHoX3eA5PEGtFyIVeo31EM5NbdMtllDhtki5rE+d9ngndVh+fTygAajKT8X
	F6
X-Google-Smtp-Source: AGHT+IFXzz4JrbCccLfkZ2ZXGDknqpjtngSJ7wok4+tdSDfFKxhBjVek1aHX+t+1GLDollUvLiPj9g==
X-Received: by 2002:a2e:bc25:0:b0:378:dd60:38c9 with SMTP id 38308e7fff4ca-378dd60520emr22966101fa.38.1761366715050;
        Fri, 24 Oct 2025 21:31:55 -0700 (PDT)
Received: from junAIR ([176.106.241.81])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee0ca7a0sm3409241fa.33.2025.10.24.21.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 21:31:54 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andre Przywara <andre.przywara@arm.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/6] Allwinner: A523: add support for A523 THS0/1 controllers
Date: Sat, 25 Oct 2025 12:31:23 +0800
Message-ID: <20251025043129.160454-1-iuncuim@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_213157_991200_7B7A5B60 
X-CRM114-Status: GOOD (  12.81  )
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

From: Mikhail Kalashnikov <iuncuim@gmail.com>

This patch series adds temperature sensor support for the Allwinner A523
family of processors (same die with H728/A527/T527)

Based on 6.18-rc1.

Changes v3~v2:
x) dt-bindings: nvmem: SID: Add binding for A523 SID controller
 - previously accepted, therefore removed from this version

1) dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
 - added changes as requested by Rob

2) thermal/drivers/sun8i: add gpadc clock
 - removed undescribed changes spaces to tabs

3) thermal/drivers/sun8i: replace devm_reset_control_get to
 - changed the commit description to the version suggested by wens
 - added reviewed-by tag

4) thermal/drivers/sun8i: get calibration data from two nvmem cells
 - added spaces in the description block before "*"

5) thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
 - added alignment of functions in compliance with open parenthesis

x) arm64: dts: allwinner: A523: Add SID controller node
 - previously accepted, therefore removed from this version

6) arm64: dts: allwinner: A523: Add thermal sensors and zones
 - no functional changes

Changes v2~v1:
1) dt-bindings: nvmem: SID: Add binding for A523 SID controller
 - added new patch

2) dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
 - changed clock order
 - added additional nvmem cell with calibration data
 - added requirements for new controllers
 - added description

3) thermal/drivers/sun8i: add gpadc clock
 - removed unnecessary call to clk_prepare_enable() since
 devm_clk_get_enabled()includes this

4) thermal/drivers/sun8i: replace devm_reset_control_get to
 - original function replaced with devm_reset_control_get_shared_deasserted()
 - removed some of the repetitive code executed by 
 devm_reset_control_get_shared_deasserted()

5) thermal/drivers/sun8i: get calibration data from two nvmem cells
 - added possibility to get calibration data from two independent cells

6) thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
 - removed magic digits
 - changed description of calibration data procedure for A523
 - changed numbers of array elements with calibration data

7) arm64: dts: allwinner: A523: Add SID controller node
 - fix typo (sun50i->sun55i)

8) arm64: dts: allwinner: A523: Add thermal sensors and zones
 - cell with calibration data divided into two
 - added passive trips for gpu
 - added information that information obtained from BSP

v1: https://lore.kernel.org/linux-sunxi/20250411003827.782544-1-iuncuim@gmail.com

Mikhail Kalashnikov (6):
  dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
  thermal/drivers/sun8i: add gpadc clock
  thermal/drivers/sun8i: replace devm_reset_control_get  to
    devm_reset_control_get_shared_deasserted
  thermal/drivers/sun8i: get calibration data from two nvmem cells
  thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
  Allwinner: A523: add support for A523 THS0/1 controllers

 .../thermal/allwinner,sun8i-a83t-ths.yaml     |  56 ++++-
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 154 ++++++++++++
 drivers/thermal/sun8i_thermal.c               | 234 +++++++++++++++---
 3 files changed, 401 insertions(+), 43 deletions(-)

-- 
2.51.0


