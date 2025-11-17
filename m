Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6CFACE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 21:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ztw2S/9TdbV5pr9Z6JYx0AXFtBg6AP2dg0jB76kE09I=; b=og7dR3UDxkQEuwWNZ3i+n3oKG4
	kiVHS3xMiLsnAlV6INzzE8o/5EkqnNL2rTIVJKid+e3JOy1SUkuoNpIIUi7CrWci5FYFuzYstTZyG
	TAfqWzl+GKcTkZv2Te+T7L3sexJRZLIoaQqor2XZGdvtQLm0M86CbHvrnCt/OuGaHnX0pRV8dnNlK
	2KNbIVDYPNHgUR0NJB7kVSWKb2LA2afYHdOQaIUhCwDgik6FtKh62+h7PEtaTauwqYynM7K0hnjwX
	5UC9waKoa08X/Tf5mnS823GNWbuNipo5PdxSXMovLs3+ZivkXEc2WoNPpALgN41/GbwEPt1+SKPZ/
	K1knqWdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL73t-0000000GtZd-2gte;
	Mon, 17 Nov 2025 21:47:01 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL73r-0000000GtYs-1BF0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 21:47:00 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-4500a6fb71aso1875957b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 13:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763416018; x=1764020818; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ztw2S/9TdbV5pr9Z6JYx0AXFtBg6AP2dg0jB76kE09I=;
        b=iSGTtOTuM/gMY4TT39dirltsbge2DYzQkNAEPKt53BFBU1GWIPUnTHuIVZCHw3bEjZ
         5sxuSevijSoX/H6Kq1IZHKvZa4ijnlNZxgmBGA84crb4fHTHDPHdvj56f85vz4klAiB/
         RxEHSHHCaSDmPuek2PLdrWhX6zdtKZlA1o1+CUhPGB0f7JRqKCcME+AufqrWsQkQm3Wa
         3WiKpLXsayY4yC+l/l1pJXoy31x7Xi9VMW2cfI/YcUyxuZQYFfsmfuSUh2u1ye8Xg6uf
         ASnp2wGgxYivGfAVpjkMnf0jXoX6PqFG38neorKqm3MufjaVwct/iQT5+pRuoyNzHX5p
         rCKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763416018; x=1764020818;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ztw2S/9TdbV5pr9Z6JYx0AXFtBg6AP2dg0jB76kE09I=;
        b=Sz8Su/+zknMzF+j2Xy0Bm/g9880CciSezaTPHIufheLB2sEqsHh95/TNZNOE1oH2gD
         qiTC5+0Sn9bn/kALBKz84k46Q8/X0m+T1ltOpUlcmhZ3vPYjElEphUl4Au+w0teW78JX
         NzpAp1YUlikw8UidTP18JIV2590k1/cgAa5FjRvT1X6IjKoYQ2EtoqtjZRAkrX1m2NfF
         1mxTUeAnIp4pVlsjivWBdtwWhH7B699p/JT9Gxeysu4SriPoSo5zlin0wcEdnH4gjTRx
         KzGdLcCY+Bb6zFgTyyapKpc5mAA4aHLG9Bo3TYzvdDi15J8KZdglWM+hVejcevfNbSRk
         IDyA==
X-Forwarded-Encrypted: i=1; AJvYcCVnHPS3H9+y8l6plTP4lH7aXdzNZ8kAx1FK8HZ0mo2XUjBkp2A8nd2ONLtXIFGtGHn/b2YPWW8AZOHSPFS6wq3M@lists.infradead.org
X-Gm-Message-State: AOJu0YzmNPEN1qw/eIYDMaR0lPNUFYs5NOTZ8LqB5yoanOYkUqCxaYvM
	U7BSP1mlCcHlkdQAusgvKZ7oK/Ca/8CxYGeS9QiGC0ZS9k78SLfr2SBL
X-Gm-Gg: ASbGncuKw5mx0yiOlDGHxQNXZGG3m8PVbOVigCUgjgWsjVD/+N6ooNuI6mDWO9W7rnQ
	qPiFb1z1p65g38AdPLv5nwXFohOf+fd+5ZsaGAJR8ebiuclhxXb0PoICg4fpJoWHsXuUxWiUX51
	iFBBmijW6MoZaS2B6ibduywVbjezoseCtaBsSGW/Yq9GA4Qd+FueOhEkckpz5G50SLDVPfPAOHL
	kw4Iy8S1X7jb4pS2Rk5y5FDdbbadJHniuJp7W21I0BTYzFdInYPk6L/2qba4qvrvKnCbB78wk4u
	iiXcrOzsPGKrX6i1jMN7B1QK8xo6W+6/3EezR3DfL8Hw089/EGBiRJdsTRGkvBuB06ReZEtEBJa
	B6zgl2qXHCoPKCA0SmgsADRiHgzWNCJPngoFLFQE4oynNm9u1M/fAlMtdxbGc2akH1hASpZahMC
	5UcgkiONiR1g4On+d8cz0=
X-Google-Smtp-Source: AGHT+IE2vvEkzYPE2YeNk5ikw8gx+yWVLzAS4i95En/N092Es//XEtJ9aw1jpXdrlGJlPu0ojIqUyQ==
X-Received: by 2002:a05:6808:1b14:b0:441:8f74:fd3 with SMTP id 5614622812f47-45097637992mr6914942b6e.64.1763416018072;
        Mon, 17 Nov 2025 13:46:58 -0800 (PST)
Received: from geday ([2804:7f2:800b:a807::dead:c001])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4508a6df248sm4594480b6e.22.2025.11.17.13.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 13:46:57 -0800 (PST)
Date: Mon, 17 Nov 2025 18:46:43 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Geraldo Nascimento <geraldogabriel@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>
Cc: linux-rockchip@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/4] PCI: rockchip: 5.0 GT/s speed may be dangerous
Message-ID: <cover.1763415705.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_134659_327922_3F3ADA85 
X-CRM114-Status: GOOD (  11.42  )
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

Dragan Simic already had warned me of potential issues with 5.0 GT/s
speed operation in Rockchip PCIe. However, in recent interactions
with Shawn Lin from Rockchip it came to my attention there's grave
danger in the unknown errata regarding 5.0 GT/s operational speed
of their PCIe core. Even if the odds are low, to contain any damage,
let's cover the remaining corner-cases where the default would lead
to 5.0 GT/s operation as well as add a comment to Root Complex driver
core, documenting this danger. Furthermore, remove redundant
declaration of max-link-speed from rk3399-nanopi-r4s.dtsi

Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>

---

Changes in v2:
- hard limit to 2.5 GT/s, not just warn
- add Reported-by: and Reviewed-by: Dragan Simic
- remove redundant declaration of max-link-speed from helios64 dts
- fix Link: of helios64 patch
- simplify RC mode comment
- Link to v1: https://lore.kernel.org/all/aRhR79u5BPtRRFw3@geday/

Geraldo Nascimento (4):
  PCI: rockchip: limit RK3399 to 2.5 GT/s to prevent damage
  PCI: rockchip-host: comment danger of 5.0 GT/s speed
  arm64: dts: rockchip: remove dangerous max-link-speed from helios64
  arm64: dts: rockchip: remove redundant max-link-speed from nanopi-r4s

 arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts |  1 -
 arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi    |  1 -
 drivers/pci/controller/pcie-rockchip-host.c            |  3 +++
 drivers/pci/controller/pcie-rockchip.c                 | 10 ++++++++--
 4 files changed, 11 insertions(+), 4 deletions(-)

-- 
2.49.0


