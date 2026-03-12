Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B6B106705C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 15:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KeehGpxCmRtRJHUVE1AIUDSSmmOUpqcmolBf5xwx4fM=; b=pdpOFBVzFLoOoL
	J7KD9Z+kq5QLMPRnRBlVuphvzF+6igyZJgnlotqi1fQ/5ME79pMEQdhkvB7Pl2Sp9ZaeVdtY4tXZI
	m+v3tD6cXi1li62Z9BKyvuzkL+ckW4fv1dnAksZo5oPKYbQFB+oMoqWmQMmL6lWkPZtheoTp37CNr
	WU+HcEQNvZfXQpHkY0cLE6EaJKBGRFS3RmaJBhSsezLJrBXE5AwjErI6N9rSocLQ6eujILIdiLkZr
	+ON5kPstyBjocpvE5fiLCXxuYp9Vl01JkN9xFMZUta5Ed7f49zzD1rKE2f5zwEMMQPyzjGcjjbc/L
	H5MnfjQq20XNsOorJtCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0iIj-0000000ERX9-2hwE;
	Thu, 12 Mar 2026 15:50:17 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0iIb-0000000ERT8-20Od
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 15:50:11 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-485409ab264so8461865e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 08:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773330607; x=1773935407; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KeehGpxCmRtRJHUVE1AIUDSSmmOUpqcmolBf5xwx4fM=;
        b=D2pPnyvEA+qAuzyRen39pkz+gwGPJotE4BVXtYMK1u5ijv+SxfFi6UJePpNmflOyt2
         fthTRHQilyRr9WDl9/ZRDFwtu/6MiSttFSSmWTtjn+THKGUsnyD3Q0A4h1Lz21aSqT/z
         5tgYhF+5LF/9xm5/Kp5CwF4JaTMyU84LFob59ufOI8jm9ClumySFvtFOj4+itgPK8P0X
         Auomb0Higl5SE2+aiPKlfSe+wyl85Z2yoUqFNXOsvOYWfKgsm1Hf43YPlvDTsEKq9l6u
         /tFHruODfc/YOOlQOT2UqeGNuMyDRskGyaFartFbzVsIt8OIVVGnE23INk1smvmpSAvN
         eVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773330607; x=1773935407;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KeehGpxCmRtRJHUVE1AIUDSSmmOUpqcmolBf5xwx4fM=;
        b=QqSVG3O7G8rfoaxcP6iqgfJL5cBYSvwLl7vfKWhQ1BOc/QtZMC5NP2eaLH3hkXxt+Z
         GEszVzURAHRD9Q59RztC5nkxRE2EoAuhLe1lgSj2vAoeI6Y8nb0VbzrGM3IZOnl0qkRU
         g3VTPQ0AyfqtW8n+rvzOQoiaaWonUCpzIDYrOfdQ4hGzsEahK5+syeUhQkGBuAvWQc5W
         TaIWhdNhjqBYjs8X75MG0Zu4NCizFtPGY1igNaGquqMku7t1aB3gJsG95vWhWlxy++eP
         +9HYkEh+Q9/7TKfd+Yh/t8eMe8F4lSiXvx038GeCDTd+QjXXqnSejjtNuYBtIWVSRxuE
         nWWg==
X-Forwarded-Encrypted: i=1; AJvYcCW31J+E35pQ8hPI5JgrqKj9bD/PVjCImv0MBhHQVNOKI7DgA0z7KV3NpMs/k0Rb6LSSXLfqNRl54QNiOBRM+Cg8@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz5Q5t0R/85M4wc2/pqB8UmRdfpZWkl/Qy2D2q4rVRJxXtuIik
	OgvTBD5YtlkPnc58iLUahozYiVil7HrVi9OR5gMEJfxDuEVa9hy7+SPKaOzXUP+38Ck=
X-Gm-Gg: ATEYQzw9ZCNwo19oVhH6OZJZWGzdzdrkpCkCVV6HJ4GLMOHziLwwkC0ZlUayUq/M1hp
	7bg7MLjpvrDdy/HuHOhH/BOO8KeUO2TMG1aXJBzKgiK6/X9x79t59wVQoDYsP6lKvMEzWL0z1y7
	R3Vy84GHjpCCGPrTgXAWa3XPNFnTriU10tXvLZU19E1Irj2+hmUZLcEXmA9jbeIJ0ZZOK4eZY72
	qRNrn77aNZ/v0TRCVSfd+D7DA8l9VWWpOvVQ3OKnXuFgoFtcM0GVBMcb5tswZaI6Nnf9Q1MZfFa
	iSx1WxyEkVDYAlZhrbMegr8+SONiLb/ZIKEYlIosxiSNtNefYiWQzgxzYJnswNa/FgRWjvYvY49
	LdYcGMuIecJEJqt1wnwtglIAm9UoviGYhDVlc4kaZTZvbFZ+kaCH8oP63D3IhHVw1aqIa30P8CE
	xndJtkLSg+iJnyyEllV0lK
X-Received: by 2002:a05:600c:1f0f:b0:485:3f58:da2 with SMTP id 5b1f17b1804b1-48555b4b087mr2534445e9.16.1773330606655;
        Thu, 12 Mar 2026 08:50:06 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854e67ea40sm98150185e9.7.2026.03.12.08.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:50:06 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Subject: [PATCH v2 0/8] arm64: dts: ti: k3-am62a7-sk: Split r5f memory
 region
Date: Thu, 12 Mar 2026 16:48:54 +0100
Message-Id: <20260312-topic-am62a-ioddr-dt-v6-19-v2-0-37cb7ceec658@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGbgsmkC/33NQQ6CMBCF4auQrh0zHQxVV97DsGjpIJOIJS1pJ
 IS7W3Hv8n+L760qcRRO6lqtKnKWJOFVgg6V6gb7ejCIL60IqUHSCHOYpAM7NmRBgvcR/Ay5AX0
 B9NYYTXjW3qgCTJF7ee/4vS09SJpDXPavrL/rj62x/sdmDQiaejbk3Ak93ZxdnuIiH7swqnbbt
 g/0ods9xwAAAA==
X-Change-ID: 20260210-topic-am62a-ioddr-dt-v6-19-0da7712081d7
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3504; i=msp@baylibre.com;
 h=from:subject:message-id; bh=6jsNMOL+D8KolGRI7DunLwHkPvgs8sfX18pRqxzELco=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxNDzJ+ra8/MHX3rUrnxOPRp/fzLI+3fvHEc2HpyWdtO
 wKEtVTjOkpZGMS4GGTFFFk6E0PT/svvPJa8aNlmmDmsTCBDGLg4BWAiTKsYGS7lfJ/59qBRTkvn
 i/IstgU3F/IY9c+6tudMDJOCWI1/vAgjw+LiT/8V0hneBy2T2mG/LCLIwaFvmfVThzN71CpLXQ9
 1MgMA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_085009_805587_F6B80DDB 
X-CRM114-Status: GOOD (  14.82  )
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

Hi,

Split the firmware memory region in more specific parts so it is better
described where which information is stored. Specifically the LPM metadata
region is important as bootloader software like U-Boot has to know where
that data is to be able to read that data and resume from RAM.

IO+DDR is a deep sleep state in which a few pins are set to be sensitive
for wakeup while the DDR is kept in self refresh. Everything else is
powered off.

The changes in this series were suggested as part of the IO+DDR u-boot series:
  https://lore.kernel.org/r/814c211f-a9eb-4311-bb84-165b1a69755f@ti.com

There are currently no real users of the memory-region that is split in
this series. The size of the memory-region in total stays the same.
The new layout is derived from the software running on the r5f
processor:
  https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62ax-sk/r5fss0-0_freertos/ti-arm-clang/linker.cmd#L172
  https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/source/drivers/device_manager/sciclient.h#L459

Additionally the two important devicetree nodes for resuming from IO+DDR
have the bootph-pre-ram flag added as this data needs to be read before
the RAM is in use.

Best
Markus

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
Changes in v2:
- Make memory-region-names required if memory-region is present
- Fixup memory-region and memory-region-names conditions. Require either
  2 or 6 regions for memory-region and memory-region-names
- Reword and restructure the binding documentation for memory-region and
  memory-region-names
- Add memory-region-names to all uses of memory-region
- Link to v1: https://lore.kernel.org/r/20260303-topic-am62a-ioddr-dt-v6-19-v1-0-12fe72bb40d2@baylibre.com

---
Markus Schneider-Pargmann (TI) (8):
      dt-bindings: remoteproc: k3-r5f: Split up memory regions
      dt-bindings: remoteproc: k3-r5f: Add memory-region-names
      arm64: dts: ti: k3-am62a7-sk: Split r5f memory region
      arm64: dts: ti: k3-am62p5-sk: Split r5f memory region
      arm64: dts: ti: k3-am62a7-sk: Add r5f nodes to pre-ram bootphase
      arm64: dts: ti: k3-am62p5-sk: Add r5f nodes to pre-ram bootphase
      arm64: dts: ti: k3: Use memory-region-names for r5f
      dt-bindings: remoteproc: k3-r5f: Require memory-region-names

 .../bindings/remoteproc/ti,k3-r5f-rproc.yaml       | 55 ++++++++++++++++++----
 .../arm64/boot/dts/ti/k3-am62-ti-ipc-firmware.dtsi |  1 +
 .../boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi      |  2 +
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts            | 42 ++++++++++++++++-
 .../boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi      |  2 +
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts            | 42 ++++++++++++++++-
 .../arm64/boot/dts/ti/k3-am64-ti-ipc-firmware.dtsi |  4 ++
 .../arm64/boot/dts/ti/k3-am65-ti-ipc-firmware.dtsi |  2 +
 .../boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi      |  4 ++
 .../boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi      |  6 +++
 .../boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi     |  6 +++
 .../boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi      |  3 ++
 .../k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi   |  8 ++++
 13 files changed, 163 insertions(+), 14 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260210-topic-am62a-ioddr-dt-v6-19-0da7712081d7

Best regards,
-- 
Markus Schneider-Pargmann (TI) <msp@baylibre.com>


