Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED57CEB2CD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 09:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6NmPq2vIfN4PvbOp0GMu+PlVPyVQhuun4x+h09lqtVM=; b=XPYflaOZHuTWuV9cfkzh3oltdu
	2I74YTl31cJOrWBvNPAxp4pyxG8rsqvwgIUwPfzZ6f/RxSfeRHyuFKPl1QPfl0nzHOl67151gUQRJ
	Oqfv/ssCd44GJqv2eP+FA3fC5ffztrwWbNDBsMORqCHrJYZHg8TJZZQ9tSH1QjaZXMqybvD2c8D0I
	aNmIRqpZya16r+dFx9SUOWINFMqrPgwzCMbXT8QX8oBRMVyOuxZYKp9ML6mSSgtEQp+bqovR+ouwn
	WjBvX0sy3uVupvPM/7o7JIAJ2NClmBZ67jRb66AidLci+uHHwUziMIJlcXkJwQwP9Z2nk6TeDRcSz
	KWu0rr/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKC9b-0000000Dc0n-3uwc;
	Sat, 15 Nov 2025 09:01:07 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKC9Y-0000000Dbya-3huR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 09:01:06 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so2623635e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Nov 2025 01:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763197263; x=1763802063; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6NmPq2vIfN4PvbOp0GMu+PlVPyVQhuun4x+h09lqtVM=;
        b=fZNUbrPLrHadVLCKN3cyWkz7alca9ANCuz0FAi1ZrNYN5SUqdtfU8RffMFDMYy8ucV
         yuvyRlDCm5ZLdN8DrwY/eiC392585BqBmLssYc2p49Gh90ciNq8u+AARDwsLMWIDxXFq
         VxIfZUC45DMIOSHMIiIXS6ZW9ypd+Qq1KyMxdarrOWzVRweDqGM9NAnkCt/sT3U6FV5p
         oIGpPs04OCrOMY8rmEo7Fufup24cInvfRmMYBIsQkgEh0xTh2JLnVkor4ZZ1NGdg1IZT
         Wb1/IoYXRCXWN8ilQN2xJCR6uxTM7Gjjx/5SOrzXBFZ3pVjA2ZzXtti9c4T3+AL/LcTH
         oDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763197263; x=1763802063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6NmPq2vIfN4PvbOp0GMu+PlVPyVQhuun4x+h09lqtVM=;
        b=b8KanVgkSQ9UtVpCkG/JI5UaLIjA5/xo0yUprG7mGrnEwc47XY/ceCAKg3MtQgQ3z3
         486of8ON9NakAapslMS6CPPjaEW3ejMf6uGBduQJXS4DSRkmPiZB5P+iHteIRVB9Qncn
         g8yViw3CU67rXaKqSFeqs6wW1pc2OmcOvpYNcZwK4VgR+QAR60N6x195WagOULk0qvAD
         uo8u54TzsUtGUpkXDBcsxzlJW/LjWJSPZrN3fAd5z8/n64Xw2MmzKTGZRdz3qMVpsNBO
         AHHOvSEHQg9jceKo776LsaHStz2kSP7YsLH0SDOhMaoymuZGpkOCnU025JZTjxtoZHhd
         2Ngw==
X-Forwarded-Encrypted: i=1; AJvYcCU3N4zSqyt2lRmdLaAEqVnCXHFg+gKj8qRk+mFFk7Yab2nsi32baPaMT3dZUaHT5fUchgx1G31KT3dGC8UswaxQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzFZKKUVjP345N0LsyXvDz5QKvB/QFQ1yQDGENQpQVALWDH0a4m
	LobaQcYW/DLloAn/EIzXMQnPyyKsH4lGnIrb0XWC/S6chobOLw/oQABQ3sm3Rg==
X-Gm-Gg: ASbGnct9v+3DNYnvu57g6dAclaWQXW3oP+62wNfZQSMID3/LnEb+8soPI2G//p6AqUN
	f2g0NvZNuJ9RX7ELKYjvVeRV5EEOU9KTlB3omxirFaDzT6bVIhtJ/ZIBSD/JT7ZqQnweJsbvwMB
	CkbWojROYWio6Yl4z6EvVxTazRah3nhJP9WvjdR1wIJE2Rfl8cJbpQ14gkS3bMK1PcqAhCQQQdY
	BXFbpf5hOEJdsadYMHiFrVdS6/7YLlsOgeL/Zk54sBKrn9dCGZYZ0pwRtE63uac4HpjZp6g5uqk
	k0ZhNrv5tcw08JwGfB+yMisDy9PV3gTI1XPccHS2wxXq6o3/pIdYSAiUCzlI/5d4GsJvdBeW4va
	taI4Kky/N5CPyFfNH9v7Z3yOkgv+ibGeoPrpaaImJnbuxg8jwns0ZXuNdY/iGakP+wwJOhTFGJx
	SbubkggsOs+X7dFBFz7BZU2PWN8oDWvM7HvGeGlC9guyzU2feQxldCzivHOnfIdERJReEJH57r7
	tmPikI=
X-Google-Smtp-Source: AGHT+IHYtVjjbV83ei1n6TC4jPxlxk2Cr9Io5XeSyAGj/Ci1P0LZPNejeCahGUTN0PRdBl+3ZD2IMA==
X-Received: by 2002:a05:600c:3546:b0:477:1326:7b4b with SMTP id 5b1f17b1804b1-4778fe7973amr54525965e9.19.1763197262830;
        Sat, 15 Nov 2025 01:01:02 -0800 (PST)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e8e6acsm200553165e9.9.2025.11.15.01.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 01:01:01 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 7/8] arm64: tegra: Device tree changes for v6.19-rc1
Date: Sat, 15 Nov 2025 10:00:42 +0100
Message-ID: <20251115090044.3140331-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115090044.3140331-1-thierry.reding@gmail.com>
References: <20251115090044.3140331-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_010104_964317_0C99666D 
X-CRM114-Status: GOOD (  13.62  )
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

Hi ARM SoC maintainers,

The following changes since commit ccec1069246ad121c1cbb6494d75140d512a9b5b:

  dt-bindings: arm: tegra: Document Jetson Nano Devkits (2025-10-30 20:29:47 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.19-arm64-dt

for you to fetch changes up to 0936fa80150ef9121c6a4340fa2369bc9f16a520:

  arm64: tegra: Remove OTG ID GPIO from Jetson TX2 NX (2025-11-14 22:55:12 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v6.19-rc1

This contains a bunch of additions and improvements for older devices.
Tegra210 devices now have empty reserved-memory nodes to improve inter-
operability with certain bootloaders. These chips now also support more
multimedia engines. A new variant of the Jetson Nano is also added.

Jetson TX2 sees some improvements. PCI endpoint mode is improved for
Tegra234 so that reset interrupts are properly routed.

A new RTC device is added starting with Orin.

Rounding things off is a flurry of small fixes for DT validation and USB
OTG mode.

----------------------------------------------------------------
Aaron Kling (10):
      arm64: tegra: Add Tegra186 pin controllers
      arm64: tegra: Add NVIDIA Jetson Nano 2GB Developer Kit support
      arm64: tegra: Add ACTMON on Tegra210
      arm64: tegra: Add interconnect properties for Tegra210
      arm64: tegra: Add OPP tables on Tegra210
      arm64: tegra: Enable NVDEC and NVENC on Tegra210
      arm64: tegra: Add reserved-memory node for P3450
      arm64: tegra: Add reserved-memory node for P2180
      arm64: tegra: Set USB Micro-B port to OTG mode on P3450
      arm64: tegra: Remove OTG ID GPIO from Jetson TX2 NX

Diogo Ivo (2):
      arm64: tegra: Add Tegra210 NVJPG power-domain node
      arm64: tegra: Add NVJPG node for Tegra210 platforms

Haotien Hsu (1):
      arm64: tegra: Add interrupts for Tegra234 USB wake events

Krzysztof Kozlowski (4):
      arm64: tegra: Add default GIC address cells on Tegra132
      arm64: tegra: Add default GIC address cells on Tegra186
      arm64: tegra: Add default GIC address cells on Tegra194
      arm64: tegra: Add default GIC address cells on Tegra210

Niklas Cassel (1):
      arm64: tegra: Add pinctrl definitions for pcie-ep nodes

Nino Zhang (1):
      arm64: tegra: Fix APB DMA controller node name

Russell King (Oracle) (1):
      arm64: tegra: Mark Jetson Xavier NX's PHY as a wakeup source

Shubhi Garg (1):
      arm64: tegra: Add device-tree node for NVVRS RTC

Svyatoslav Ryhel (2):
      arm64: tegra: Drop redundant clock and reset names from TSEC node
      arm64: tegra: Move avdd-dsi-csi-supply into CSI node

Thierry Reding (2):
      Merge branch 'for-6.19/dt-bindings' into for-6.19/arm64/dt
      arm64: tegra: Move HDA into the correct bus

sheetal (1):
      arm64: tegra: Add Tegra264 audio support

 arch/arm64/boot/dts/nvidia/Makefile                |    2 +
 arch/arm64/boot/dts/nvidia/tegra132.dtsi           |    3 +-
 .../dts/nvidia/tegra186-p3509-0000+p3636-0001.dts  |    1 -
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |   13 +
 arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi     |    1 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |    1 +
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     |    6 +
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |    4 +-
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |   12 +-
 arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dts |   59 +
 .../boot/dts/nvidia/tegra210-peripherals-opp.dtsi  |  135 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   90 +-
 arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi     |   11 +
 arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi     |   15 +
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           |   72 +-
 arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi     |  108 +
 arch/arm64/boot/dts/nvidia/tegra264.dtsi           | 3190 ++++++++++++++++++++
 17 files changed, 3708 insertions(+), 15 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra210-peripherals-opp.dtsi

