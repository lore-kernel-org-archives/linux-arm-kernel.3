Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF9AAC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 15:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KFq2GkDfRXlsOR078AWttqIDotbtBYpQKPjXjcs2jO4=; b=Y0+PSV4CNC5dpw
	LBFv/qM5ETMqyGP+4WYwHCEEGVVw7Qt2sAho3To1cZObmteSXeAbmRISl/tinsedkCkGwLYpK7vk6
	kitQFSjIEAy+dVIZt6q8NRB7LoN6ZC1dXl89GJk3Fake9O/hzIT2GyEED/GFen+kVy6ThItJOnPrl
	o83wQNG8RJ+4twKSkIkBelioO8i6i+BiFYtdz91680qVZ0SLk2p6lPZ9F/QRQA/kKjLjL701eWRtH
	J/ldK6kP4YmrzEKyAZ+ZFSUbk2erQl03WhIaoUv4QTgUyKlHwhbh9xQPZKJSgXdYU2OerdWUNsD5D
	bg7OIeSRe2Lzy+p9zdwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QUL-0000000CViS-00n7;
	Tue, 01 Sep 2026 15:33:29 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QUI-0000000CVh9-19pk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 15:33:27 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso11069195e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 08:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1788276803; x=1788881603; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KFq2GkDfRXlsOR078AWttqIDotbtBYpQKPjXjcs2jO4=;
        b=yb6GcQZVDGkthYejuHzs5745ymf7TPYfmJpMyzKGMjbkApz9aomvgKoNf5DMgejUSt
         h6pIM16Ave/3o7JrMqDkbCpmW3q/JwkyHIR4956nT4FG/P7nIkIN+K8Vr2Z5Ga8Dmgea
         Ij7Cf8kBa5Tc7Hu9frlfCwms95tKU1VkQw5X7OQ4OmnTu2yhpeSDpKFTp0BVENswxVbq
         T7pPkgg78R4ts2YobjveQYUZrEtgCEdsJx2PmHOICt/Twxs2+ojc9k5skHVucrjCS0Ot
         Zk5Ky1fouuO0sc2PMZSSRyLvySRJXkwvGDxNs5hNfH87HY0loQ0eGvt9KCi5iL3irKpH
         RuRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788276803; x=1788881603;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KFq2GkDfRXlsOR078AWttqIDotbtBYpQKPjXjcs2jO4=;
        b=jgYTxIUCJzqdbHNXhYQWOHBtocXfIWFpcwyNFOZlhNun7iQvqM2PIF1d2qdrxiD0yV
         vDMmRcYdBODA4DtG4QhfkY1BdB/KZKB45crzbCvYp8xGSXz6ZnigTsd6C8JoJCD57Y3N
         /RDVoSI+SUZOb2P3g0Z3sZ9mASmyL2hwEmuZNBXr+p+FRmEaGBy5zbYWeasqgWLIej5/
         l6c8w4jnDESYLzzyl1ZtLxKq5B7CVgcUOezMtu7PXd+Btw81Vy0zVXzwDGrXrnGRgRAt
         26bj5A93u2GUHMKJ7Ti2kEQSo8/sCtWNrhyHqr1VYsSwm7z3NOrW82wFHLpcSyOvXqDJ
         yLcQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro+2Ro8G+NqnME78IBWn/EUGfV5h8Q2nHD8qb9sEW2HsAcZMUve+UXHz/ENhHya+6rRF3Uxyuo+V9rq5BJIAJyU@lists.infradead.org
X-Gm-Message-State: AFuF++kIrl9D1J89P0Vp1NbaZ4yQcQnqwut/UgOTIch15kjgTLgXMxGW
	NivLdWRWjbVo3SuWBbBI5HtlRL1gs8Lkl6RAbanLXQCsO3del2cYQG/G0sXLzqPBfdfyAdiGnrS
	9Pk1M
X-Gm-Gg: AR+sD103g7hRDqBTN5ugWMSacYjJfoJwykO5TLTo1mysPn9TBldC8rCZ/ZbYGxsnlgq
	lk4yk57rjI8dT7m2tw82Cvf3CZA7zGw9m3c88VKCBuvXtCuWhcHczU2aOWmQbk7PHud9A12Tgz/
	RKYFRdqXHe2XREPTbrEOvb0PbB7GgvbvRU2rd9l4pb1O1xxFN5w8TNIi0mKIIUJ7JO4RO4VAczm
	UuzPzqN3vOaA3rWBwCePchUIgNTugAtcqqjUYBriOH41f7px/m3D+/m/75dPmdJWGHJoCAMEtfq
	OXooE0Q8yFjZ9REwxdaHHu/adfIhbD9KY9Cnsv3RBkLIfEnQ+qb1LAHvHQACLXWalaMxWks8Lhz
	bq4AwTfRCh9k1sbA+OLoDN7Aqm/iWVYVRiE35wO8rWPa1zu8hl7Wk0pO7Xy2R4i46aSlwT+Hs/d
	HUMU8MrQm6yEouv9OfNmdfOBJwhcvkMWb89lnV0YJPzi8sFgrrWCh0pAkaYSDoD4fP390LGVxuh
	FNwrWPfONSHbvjIJd4lgf0EfYQNaDQbHHJ6kehL
X-Received: by 2002:a05:600c:4445:b0:499:900c:9c69 with SMTP id 5b1f17b1804b1-49b91c44fbfmr487364265e9.9.1788276801577;
        Tue, 01 Sep 2026 08:33:21 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-2-51-220-108.alshamil.net.ae. [2.51.220.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c5790csm314541845e9.0.2026.09.01.08.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:33:20 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH 0/4] nvmem: Derive Rockchip MAC addresses from the OTP CPU
 ID
Date: Tue, 01 Sep 2026 19:33:10 +0400
Message-Id: <20260901-rk3576-otp-cpuid-mac-v1-0-ea9135270fc2@flipper.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBA0auQWTvJ0CKCVyEscDrCaISmBWJCu
 DtFl2/x/wZRgkqEe7ZBkFWjTmNCfsmAh27sBdUlgyFTUk05hre93kqcZo/sF3X46Rgt12QK66i
 qCkipD/LU72/btH/H5fESns8X7PsBL2E1JXgAAAA=
X-Change-ID: 20260901-rk3576-otp-cpuid-mac-3c90243d0884
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Alexey Charkov <alchark@flipper.net>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2718; i=alchark@flipper.net;
 h=from:subject:message-id; bh=265EXKY1LpSnh+xYZaVde+XE9Ub2EQ+extj0SjJz2p8=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWRN+2DnU7Gh6/4Mn5hdmn/laj6bZar7X7yrwmsYVtp9/
 JG/1cKujoksDGJcDJZiiixzvy2xnWrEN2uXh8dXmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKaaK5Lhf+m3u0Wrlz8oMrOT3VPHc+n2ojDpS7MyCstc1CsldpW2uzAy3A/u0Lg
 +/+CNNxViTpySi7QueS68sTeWTV8pb6vMZcYsNgA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_083326_367646_89231CDC 
X-CRM114-Status: GOOD (  19.06  )
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

Rockchip SoCs are shipped with a unique CPU ID in their internal OTP
memory, and Rockchip bootloaders use it to give boards which have no
dedicated storage for a MAC address a stable one anyway: they hash the CPU
ID and patch the resulting addresses into the device tree they hand over.

Kernels started without that fixup, e.g. straight from the SPL in Falcon
mode or by any other loader which does not implement Rockchip's derivation,
fall back to random MAC addresses which change on every boot.

Formalize the derivation in the DT binding and add a Linux kernel driver
implementing it, so that a Linux image can use the same stable addresses
regardless of the boot flow.

Only RK3576 is wired up here, that being the SoC I can test on. Other
Rockchip SoCs keep the same CPU ID at a different OTP offset - 0x7 rather
than 0xa on RK3588, for instance - which makes supporting them a two-line
addition to the driver's match table plus the layout node.

Patch 1 is a prerequisite fix. The OTP hardware has its own internal state
machine which only works correctly with serial access, but the current
driver serializes nothing, which results in timeouts and/or corrupted
reads (e.g. returning splicing a TSADC trim value into the buffer of a
caller asking for the CPU ID, or mixing up trim values of different TSADC
callers). Hence the Fixes: tag and Cc: stable.

Cross-checked on an RK3576 board: the addresses fixed up into the FDT by
U-Boot match the ones derived by the new driver, and the driver correctly
assigns them to the network interfaces when the kernel is booted without
U-Boot proper at all (via Falcon mode).

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Alexey Charkov (4):
      nvmem: rockchip-otp: Serialize reads
      dt-bindings: nvmem: layouts: Add Rockchip OTP CPUID layout
      nvmem: layouts: Add Rockchip OTP CPUID layout driver
      arm64: dts: rockchip: Derive GMAC MAC addresses from OTP on RK3576

 .../bindings/nvmem/layouts/nvmem-layout.yaml       |   1 +
 .../nvmem/layouts/rockchip,rk3576-otp-cpuid.yaml   |  73 +++++++++++++
 MAINTAINERS                                        |   7 ++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |  12 +++
 drivers/nvmem/layouts/Kconfig                      |  13 +++
 drivers/nvmem/layouts/Makefile                     |   1 +
 drivers/nvmem/layouts/rockchip-otp-cpuid.c         | 119 +++++++++++++++++++++
 drivers/nvmem/rockchip-otp.c                       |  10 ++
 8 files changed, 236 insertions(+)
---
base-commit: 89c07d98716a13454ec3fd9f97689e812cc71bd4
change-id: 20260901-rk3576-otp-cpuid-mac-3c90243d0884

Best regards,
--  
Alexey Charkov <alchark@flipper.net>


