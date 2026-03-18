Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C44B103E195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/yllf7A2iKXDpzRGmszNp9+Jv/HEAfql39j2Q2qp1aI=; b=ZAP9Li/Maeh/Oa
	K9CU9jM5S8bknStwa1R6EOk5wWWObnu0K8snZD9OLFsN07QyoJybdqBK/tDDSeyIIaYkRCShHzsWB
	/cYmmAGHbs5zKvTHkZ8rve3l6o/UhQqNxU/Y9iyDudlrkvLnuK6tDZB8ijc2oqjkvV5XockPM6GxB
	Q3SPptZXa6FUWLqbzlClOndjVpp/acvwcpZNzCOzDNJo+dBiPSFgyXmIqrfLMAGyPXfkmEkVuwoi/
	qFBqs+UpVlrOOGBJeRGXHxBqRqye8VKO0PIoat4sIbxJ9R+xBwVZzm3wDdeUnUNjlIzNWAnrOjOTc
	53JNvMCHlyy8IdkGJcyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2sbD-00000008fJJ-2yji;
	Wed, 18 Mar 2026 15:14:19 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2sb9-00000008fHs-460T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 15:14:18 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-48374014a77so77714665e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 08:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773846854; x=1774451654; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/yllf7A2iKXDpzRGmszNp9+Jv/HEAfql39j2Q2qp1aI=;
        b=KJvmNgsMInnov5ta5R5/9WGYx/97eMIPTspuAWDIJcTAzeWIrijwk7s8/YfxwgsF1I
         RAPf3mXbK/R7L60Q/Zq9dLXmTETjxlzX3mEKIel9hvGl/unYfkcjJwcqlWSCgcbfhf5a
         xD1S9CeC7RS44StsiOig5R2odLQRDttym/PNLV4PPQjKHOL5Z3ciw78xVENkUntKdv+n
         /u6jHR+BvPXLrpPJL4OcwYeqXbfPNkIKPNbz1aG/92DwVQ69fEnadaaEunz0wvOvyqLT
         BG1TXlcL4ePp0jewr2Fv2ZC3YFimDIkYnMJbfrA7mjbZDoq02LM8W+kRzq0c3q0mMd8J
         htfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846854; x=1774451654;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/yllf7A2iKXDpzRGmszNp9+Jv/HEAfql39j2Q2qp1aI=;
        b=YDDq9Rmz1GfrIZD3C97NPifXGntum9CJfQA2K33kLkBUOvmlPSnL+MWGaYUL7jhr3Y
         PEMYCFrRJF42invkucsiQpORTR2+prImy4ACufPdsc2V0IX2FG2788dTuAiH+YFLGc1I
         61gwRqCfqYhRjuFdNFAed9CMnW854ee9MsTzIfeS+I22/o2E+Z9FD7/or0dOo5MqSTrb
         0uoNpF8CIrPc4IwnLnXTCmUrRV5B4QmMJ77AUcHMzkZyJFuHad58GWcGosEzlc1OEXFL
         mXvlW4Kn3oFkx6YEnwDcoQuJT2mpCOraOA7pmtX6ren2Awo5tjRrG6gqT+IIOQ9VAS1F
         CbKw==
X-Forwarded-Encrypted: i=1; AJvYcCWfn1vK8gvr+tKAp3xBsftDepEAp7dkTh7MkAKHVgEBWprR7CtEW+mkFWGo4GIEv1qEH52uShDn7PyG6sFa3AFF@lists.infradead.org
X-Gm-Message-State: AOJu0YzTsY7beV+tqcJ/1IOpAIYkzVKFZ+AQAq1ZSmct9BAxCAZWnKd9
	JykQsE3vbqcPZTHV1wcrVRQ3oR7y4NfDvDwIsDjEWEGHFRWRsVwJ5DYpD4wLgBmdo60=
X-Gm-Gg: ATEYQzyQyefzHe6kh+bzvcXGnHpCAM8RYnGghDpb6hiymHQzfh0McY4RzGi+HPqc4Ml
	KcDrWD9g2TPZsWdxcPCMYGVBW3o3zBVn27ac2N1yBPGofNNWgo8m5fqK1/IRbL9KkMzenxTOuL5
	joY8J4GTZtPZMdUNzjD92iQcyqpWgooZO91GdprSMxjUJzaLOKVZolmpJo8hLcN8wdyFbtGsnkb
	TF5S7prxbUsN3fqd/xxM8jm1neJHrRvr3DW8mpY19dFnwTgYaXldqDyyK6t/6TJJ+mWWdEQM8zq
	kpJYmvyaePG9R3eOvRGWjBXeFW7Elfw890UAHtl0EldabagRzjzv0ZdestGDnDyhwiMwu6jBB38
	pSLB+izpiODD8hS5vc+QOGBO6Z/2yYaI4o5DmBuv+OAcw40VamjRjsdmX+dMOzbKLivgVehtG0L
	PN/Ew53nJbUBR+VgHy8hU/
X-Received: by 2002:a7b:cd98:0:b0:485:30d4:6b98 with SMTP id 5b1f17b1804b1-486f443c6f1mr42988885e9.15.1773846853405;
        Wed, 18 Mar 2026 08:14:13 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f45f7e96sm43046295e9.0.2026.03.18.08.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:14:12 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Subject: [PATCH v3 0/7] arm64: dts: ti: k3-am62a7-sk: Split r5f memory
 region
Date: Wed, 18 Mar 2026 16:13:06 +0100
Message-Id: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAALBumkC/33Nuw4CIRCF4Vcx1I6BQUGtfA9jwWXUSdzFwIZoN
 vvustoYC8v/FN8ZRaHMVMR+MYpMlQunvoVeLkS4uv5CwLG1QIlGopIwpDsHcJ1BB5xizBAHqAb
 UDmR01iqUWxWtaMA905kfb/x4an3lMqT8fH9VNa8fVkv9j60KJCg8k0Xv1zLiwbvnjX2mVUidm
 OWKX5rCvxo2TdvgbSAKZrP90aZpegFWQFIQFQEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3689; i=msp@baylibre.com;
 h=from:subject:message-id; bh=O7KJbMSkvzvMpAGjjOIeIlfXCIp/PPoZz5+LKET/qs0=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxdB9kVur1rF5s88AqfFGHq2L//yN9zKkIhW/2lflxb0
 T5Rzda+o5SFQYyLQVZMkaUzMTTtv/zOY8mLlm2GmcPKBDKEgYtTACbyIZmR4eydIIXbS4wmO+xc
 bRS6KN65RPv/mVsvAiNTPuw6Jno1RYrhf9y65om3fthpfOibv4xP/n7P/vS9+sdFO+1+7VZ+KSN
 qwAIA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_081416_324007_B62B9C76 
X-CRM114-Status: GOOD (  15.14  )
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
Markus Schneider-Pargmann (TI) (7):
      dt-bindings: remoteproc: k3-r5f: Split up memory regions
      dt-bindings: remoteproc: k3-r5f: Add memory-region-names
      arm64: dts: ti: k3: Use memory-region-names for r5f
      arm64: dts: ti: k3-am62a7-sk: Split r5f memory region
      arm64: dts: ti: k3-am62p5-sk: Split r5f memory region
      arm64: dts: ti: k3-am62a7-sk: Add r5f nodes to pre-ram bootphase
      arm64: dts: ti: k3-am62p5-sk: Add r5f nodes to pre-ram bootphase

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


