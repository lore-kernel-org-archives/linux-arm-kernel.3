Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E6ECD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 08:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CYbLJTcyGkPOWhCnzFzJEc5YHySHwwwqyvZml3ki+0w=; b=0RXGpnovP4mcJc
	kqvqhEv16MpnT0UX5ljne4lLj1c30WQ+0TN36hHVU00maLdMEiDDKbUzCno66CKCyqQPo/npNLVtI
	o2yFph9W/eEU8GB3JbxoezgdiS1zsjcxQc/OTCZtC/SSzEML0pn50+wC941zf36tu/uwU38YdAdoL
	yhF9AsCvn1TJpVX7xz/AZHp3Yzob1hQzhAxITeQJ3rinLiekBbRtWnzTnKGOsGOCaPN36Qm0EYi2Q
	zeicB1WHIL5VbMzGPsA9NSrvXGvXNaENdMn3z21MuFyyiQwuJWHcIo8lHsKU1jPlx/rd9u7sTK7F8
	fXo6hAsWUwBiv/ivxdXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyIW-0000000AP8A-3Rlk;
	Mon, 01 Jun 2026 08:47:00 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyIT-0000000AP6p-0iQR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 08:46:59 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-45ebafde87cso6412835f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 01:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780303615; x=1780908415; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CYbLJTcyGkPOWhCnzFzJEc5YHySHwwwqyvZml3ki+0w=;
        b=am3/z7bwVBobQ0AMRyfa3gydTs1/A33DQXn+V9278MmkdMMUvWIw3Bz+cGTiGr6HgA
         owZUhBghvEzB5JlRuZl2ucwvflaptwcEZC9zwc1akqDSfqCk12zGXXTY0KpcDbg347j8
         pUy3FWjj84thOTLsp8NBE1ylhHzxkidZemWbe122xNIZVOd8bztkhI72g3F1bfQk7gWU
         uxgXnSEIfd7XTxHEU0Fef7rQFREQlwJ5WyXmcvGJfnRrXoyA4LaEcXVsaFcRfQ2Ix5cX
         MtDj3neGH/Wy87aixVvtpLeopxWcENZ0QHK6BDtfDpt23C6CHlEIWwCxdiZ2Kxa2uVoB
         KPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303615; x=1780908415;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYbLJTcyGkPOWhCnzFzJEc5YHySHwwwqyvZml3ki+0w=;
        b=jruQ6yvBimHL+p/UEs8u/5MAosx8P/1CknjlEK6WnfkdOCjb/LMdTerGkj8jQZ7G6C
         wFcqV0o8C9xb30+D5ywD+0GP07KjgK0ntB8OJEXVN78Ciyk375x7trPFWQommF/Nx+8R
         LNNlrhxACu7otMTrExgRGZ5N6OYjYiGvN9y+tDkCin1DYozRZPthJAQgX/qr57lN+fYs
         t/6TnzO3pPVtaXLp/8iaLpbwyi8OKKmPKojT2tnmqxuwTVqqiou+ydh/BivlOSL7JHcK
         wos28TDdCK2fC6teSYGaTk4qYy2dzXKrLCosiD5ZcI3AOXZ1Z7Va47IhgNuIR6balh5F
         oAnw==
X-Forwarded-Encrypted: i=1; AFNElJ8phE1hf0j5kg6YLQ7dT4awN4ghsfw20IdMOnKcbnxVX/It/0efz1E+8YR64htn+JT5bjxWn880ez4LdQk9JNOY@lists.infradead.org
X-Gm-Message-State: AOJu0YxiLVbenj0Tufq5Yg6pv+GhOVf9+8Qi54qVlH+M3ElnfBDd8tyR
	ryeeL1favK3GJNOAceJrkvS+Q5YVbZGi/l6HiT6eGwtq61r0iF0kqGXaleZSwj3Seco=
X-Gm-Gg: Acq92OGMqQj2cUcjKmUySAi+itg1pV3NO+qGr2k4rkLV7CmzMMpAmK3zO/reOqLWOHf
	yqbcGiwzV7dPtXPOYfdf2H2z2aUYwPmPNkVoSEkT98RcQFZAB/pcPRuPEBpubzGlkmgGk31K+SI
	mV7qPFMlXQI7QZqdV2mD2+P7N4hAQuQDT9TJGmWIEINygduRydqfK5pvQWwjo75iRB/CcPlGs9Z
	ByHm+vQ+x/1A65lTWluW1RqUxggbZn54y96YNOwH+1kekdh2bQjS4V71y15t+39ddkJoZ9JOk4A
	ykpnCKASjAaoYibhCQEqcCEZmnOiuuOEM4dRAgVKgOPkVQ+JXcjEH3Dec/jhCeUIQu2iUvxGudM
	Kf1noz5w77qRVBTNkvItreeCBAbxOBbVuCQkerywJeuMhYg6MDHZ24JCrlMDv+ewWGYU/L5fNd/
	SCFXJRsumegswzJx5TdvxtDNN3I8IEDLQ=
X-Received: by 2002:a05:6000:41ee:b0:460:1301:dec3 with SMTP id ffacd0b85a97d-4601311220dmr3151152f8f.3.1780303614676;
        Mon, 01 Jun 2026 01:46:54 -0700 (PDT)
Received: from localhost ([2001:4091:a246:8595:a745:3210:d732:4094])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef3587072sm24459222f8f.34.2026.06.01.01.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:46:54 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Subject: [PATCH v5 0/5] arm64: dts: ti: k3-am62a7-sk: Split r5f memory
 region
Date: Mon, 01 Jun 2026 10:46:11 +0200
Message-Id: <20260601-topic-am62a-ioddr-dt-v6-19-v5-0-3856a023aff2@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANNGHWoC/33NQY4CIRCF4asY1tYEChpaV97DuICCHitRMXSHa
 EzffdBZjJmYXv5v8b2HGFPhNIrt6iFKqjxyvrTo1itBR3/5TsCxtUCJVqKSMOUrE/izRQ+cYyw
 QJ6gW1AZk9M4plL2KTjTgWtLAtxe+P7Q+8jjlcn99VfVcf1kt9RJbFUhQOCSHIRgZcRf8/cShp
 C/KZ/GUK75pChc1bJp2FBylRLbrP2j6XesXNd00Mso4TQE16Q+a+dMMbhY107SB0EXryXWa/mn
 zPP8A5wqo57EBAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3394; i=msp@baylibre.com;
 h=from:subject:message-id; bh=1qlcY0y259xbjnWTloWIWPE3d0CRfH7ESQKQ/1nYZ34=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhixZt+vbzRnXtSc+7J+a+vDBi13nb/e5LTSSVTvivGyHX
 DbTuuXnOkpZGMS4GGTFFFk6E0PT/svvPJa8aNlmmDmsTCBDGLg4BWAisrMY/scXB31vnJoa8+nw
 0q/cP0Q/cewL9+x6aZDA5O83N3dn4xVGhu+3iryLH6mY826yWlPUdnWPnPr6+QejpsUtSMsONiw
 0ZQIA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_014657_239637_CBE47E61 
X-CRM114-Status: GOOD (  15.38  )
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

The bindings are already applied. The remaining patches use the new
layout for the platforms that are capable to support IO+DDR. For IO+DDR
the new layout is necessary as it defines the location of the LPM
metadata.

Additionally the two important devicetree nodes for resuming from IO+DDR
have the bootph-pre-ram flag added as this data needs to be read before
the RAM is in use.

The changes in this series were suggested as part of the IO+DDR u-boot series:
  https://lore.kernel.org/r/814c211f-a9eb-4311-bb84-165b1a69755f@ti.com

Best
Markus

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
Changes in v5:
- Move all changes into k3-am62a/p-ti-ipc-firmware.dtsi
- Dropped the patch that adds bootph-pre-ram to k3-am62a stuff as it is
  already present in k3-am62d2-evm.dts and got moved into the
  firmware.dtsi file which covers am62a as well then.
- Link to v4: https://lore.kernel.org/r/20260429-topic-am62a-ioddr-dt-v6-19-v4-0-fc27d6ac753c@baylibre.com

Changes in v4:
- Rebased to v7.1-rc1
- Dropped all already applied patches that are the bindings and the
  initial introduction of memory-region-names
- Link to v3: https://lore.kernel.org/r/20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com

Changes in v3:
- Squash the enforcement of the memory-region-names requirement in the
  patch adding the memory-region-names, as suggested.
- Link to v2: https://lore.kernel.org/r/20260312-topic-am62a-ioddr-dt-v6-19-v2-0-37cb7ceec658@baylibre.com

Changes in v2:
- Make memory-region-names required if memory-region is present
- Fixup memory-region and memory-region-names conditions. Require either
  2 or 6 regions for memory-region and memory-region-names
- Reword and restructure the binding documentation for memory-region and
  memory-region-names
- Add memory-region-names to all uses of memory-region
- Link to v1: https://lore.kernel.org/r/20260303-topic-am62a-ioddr-dt-v6-19-v1-0-12fe72bb40d2@baylibre.com

---
Markus Schneider-Pargmann (TI) (5):
      arm64: dts: ti: k3-am62a-ti-ipc-firmware: Move wkup reserved memory
      arm64: dts: ti: k3-am62p-ti-ipc-firmware: Move wkup reserved memory
      arm64: dts: ti: k3-am62a-ti-ipc-firmware: Split r5f memory region
      arm64: dts: ti: k3-am62p-ti-ipc-firmware: Split r5f memory region
      arm64: dts: ti: k3-am62p-ti-ipc-firmware: Add r5f nodes to pre-ram bootphase

 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi   | 12 ------
 .../boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi      | 48 +++++++++++++++++++++-
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts            | 12 ------
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts           | 17 --------
 .../boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi      | 48 +++++++++++++++++++++-
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts            | 12 ------
 6 files changed, 92 insertions(+), 57 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260210-topic-am62a-ioddr-dt-v6-19-0da7712081d7

Best regards,
-- 
Markus Schneider-Pargmann (TI) <msp@baylibre.com>


