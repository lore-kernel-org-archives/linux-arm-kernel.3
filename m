Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8A1C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 02:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sc2r2klq9bIyV1XXapVYTBuFntdUrMrqc3FpTwDvDDw=; b=YnLIjuCsgRCqd4
	utilQr24M/YThEwHH7VqNYQi2JrMc0K81SzhRYRGDyinMMvGC2JawXJrNTLItU1jGnqWsL8Bnw87G
	aw1ptiro3H5LUZ+S9LxkgAgc0/h9VthuUeytTsnWxFWrWOdXlHblfT+ra0U/y2NpK8HEsIukx/aOs
	c8Lc3PK3/CeSwKY8BY5XA+CJeFvwHpctmox8GmeKC/j7Q/yGz8aMldbQa47V39CeWJeH78iNmqrBL
	7VkFYRD0vpiIJ/o6B/PGLzaOWx35VOyZjpfNkl0xHFlEjap0fvmbxLmq83kQ1cMEuZg2krvuTcghl
	WIVmBSQMjwS2NBdcARLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7OD3-0000000DIFi-0UVW;
	Fri, 18 Sep 2026 02:20:17 +0000
Received: from mail-oi2-x0b.google.com ([2607:f8b0:4864:32::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7OCx-0000000DID5-1TsS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 02:20:15 +0000
Received: by mail-oi2-x0b.google.com with SMTP id 5614622812f47-4c112aaaee4so110585b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 19:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789698010; x=1790302810; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sc2r2klq9bIyV1XXapVYTBuFntdUrMrqc3FpTwDvDDw=;
        b=WuBD5bRLHNxunQcaSTwtIAzecnqM17nfmKavtvyOjvCVI1vcMqc83YaxBljSgJQwTh
         QbFEBdLvLyLQwSJRyZYl4/JqsbK1oIfEUpugPImpZjFUlc8gDTVeADJn427kuUwThpyC
         s9uHPX/qXN2jpAHJXCo9V7Zxns/QSFeEHyLzaKmoApvvyNCcN28OYA4u8SaO/vZHXDNS
         jHTbZT0uAQX4JPsW9M4YyYVxmHfM4sbrm6ehiFti5ZgYKzo1Sh+FUl2pqWpyWZUeQaM9
         QobaBmjhCoDn6Qb9jkr9EswP8K0Ev4SD9K9E6WGMiafXYHMYhTIQIUQfVt04UqQs2ILd
         H4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789698010; x=1790302810;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sc2r2klq9bIyV1XXapVYTBuFntdUrMrqc3FpTwDvDDw=;
        b=o1X6NIcJU+FJjNFlHRLb9asmf6/dCidGJ3RAjawzO+3rhcVtv2bGPn7DkeoIUY3mND
         FTX/AbzYYqOw2ovbGQqdTE6OJBPDY8Po3BQbAh9bXHv5Ms+KwGIb1YPvGyiUgPBMPuGy
         1D1nK5usXindL54GFcK+ak55rFtyuSsO5JPuBp0UE1shH8Wbc0rUbY5kWODuhrJ+ezpr
         duS+jTBP/VrcIqUn8cU5e+q6f9U9JOopCq7KxSNQ+yCiAa8BsgNJXO/9CDsuec9H/PPG
         YbOr+yXz7CvctmRBHZn4PzleJiBlD0PCAml2ejkL9E+BflfHl/gZr4dV7HIjSxIfjAaG
         5FSw==
X-Forwarded-Encrypted: i=1; AKwUvBzinovkRo5K3TfJ5IQHzvcMTnYJm1ueYM7fRAO1MLhryP32XHY+zVAWt0YHD5CFXrU0nuosJSYCQuTUhEQrYxoo@lists.infradead.org
X-Gm-Message-State: AFuF++k6HrYS3a+ljkBH5ihkEDz2VQWjEYjHpftNAqEUZdBcf9zJ95QU
	HgIf/qd87r2kdva6qqlAraAW3ftr1Ohjn4N3nrhe4CAV87wxzn54lOfz
X-Gm-Gg: AYBFou1137j7N0EaDvaywf6mCPzFMzT/c6OgjH/dgnjiKpbPKhOHJa6SBYexfGOJZaG
	zWw1BxZCpyAIackGAWSdk8n47Uk4PDMz5GUq7rYtfhyscarieMqqYRaMdXJqh1sbx7sVvh/JyRx
	67La5O30g3ZKI4jo7CP0v28I6NVLLsTcKxQB6akS8zI44O+GYjL2pbMHx84QgEfspiELD8rG7t9
	w7uQ8yzZN//ttbQU62VZTkBuj79Q8W9gBftrHMXEg8MKDnQssZ9nM1syrir8nEbunYdgPaa2tfM
	8d5g3E2MnI0EbOxt44rDWIY8J1jTcg9h1ABtBygGaLAs0vcyTxTSwQPm91haFqek4pol2r96q7L
	ChaOugOYDmDm5/4eUvUzvNV9KlAEfQ1vysiSAXRKxpqbIyaKTKhTh/ilF82ltqrcw1IsJFeT6ek
	jaScyJUM3mnp5yWrmSFLrMJvDWtd1+Z/iLJDaJGJ2k7aVgnyOcgoyUrDFzhTG39VUthw==
X-Received: by 2002:a05:6808:1687:b0:4b9:a829:f00a with SMTP id 5614622812f47-4ccf6e76820mr1386242b6e.22.1789698010143;
        Thu, 17 Sep 2026 19:20:10 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80e5226786csm295476a34.22.2026.09.17.19.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 19:20:09 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH v2 0/3] iio: adc: add mt6397 PMIC AUXADC support
Date: Thu, 17 Sep 2026 21:19:49 -0500
Message-Id: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-0-db35882a6080@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NQQ6CMBCF4auQrh3TFoviynsYFrUdYBJLSUsJS
 ri7lcS9y/8t3reyiIEwsmuxsoAzRfJDDnkomOn10CGQzc0klxWvxQnCIySEmPANaYxTQO1o6MB
 NVVmfQadFWwMKhZQXLpVRnOWrMWBLy87cm9w9xcmH167O4rv+APUfMAvgYEtlpTalrVp+65ym5
 9F4x5pt2z71T+yd2AAAAA==
X-Change-ID: 20260914-rbrue-suez-upstreaming-mt6397-auxadc-5e1228025c50
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, mfd@lists.linux.dev, 
 Roman Vivchar <rva333@protonmail.com>, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789698008; l=6852;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=y1XijeL7ERuaPsHwAqTxsTx8YvMIXk+ce3oHtZNzHHE=;
 b=FCTap6xMVd8AUK+hpvcJVgk4cUYYkXyTqgE1215eBhIbPDxwSKbDPiV3mwBUvfJfMEljyiFuh
 TmSXQurH25iAqdTLf6NrBwRHXlqr6IVrBxX3zPmRt5+JFeYot8yuenp
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_192012_106580_B988B2A7 
X-CRM114-Status: GOOD (  28.73  )
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

The MediaTek mt6397 PMIC has a 10-bit AUXADC that nothing in-tree can
reach. On boards built around it that ADC is the only path to the battery:
the SoC's AUXADC is wired to board thermistors, and the charger ICs these
boards use have no ADC at all, so without it there is no pack voltage and
no state of charge.

Patch 1 adds the compatible to the existing MediaTek PMIC AUXADC schema and
the header naming the channels, patch 2 the driver, patch 3 the MFD cell
that instantiates it. The cell comes last so that no commit in between
registers a child no driver can claim.

The mt6397 is not given mediatek,mt6359-auxadc as a fallback because the
two are not register compatible; patch 1 has the detail.

Only the two channels a board needs for its pack are described, so patch 1
ships a header naming them: a channel ID is an index into the driver's array
and not the PMIC's channel number, as in mt6323-auxadc. The register
sequences are the ones the vendor kernel's pmic_auxadc.c programs.

One note on patch 3: it adds a cell to mt6397_devs[], which Luca Leonardo
Scorcia's MT6392 series converts to the MFD_CELL_* macros in its patch
4/9 [1]. Whichever of the two lands second needs a respin. Mine would
become a single MFD_CELL_OF(), and I can do a respin if that patch arrives
first.
Cc'd Luca.

Tested on an Amazon Fire HD 10 (2017), an mt8173 with an mt6397. Both
channels are exercised: the battery channel by a fuel gauge, which reads 817
counts, 3830 mV with the pack at rest, and the thermistor channel by an
ntc-thermistor consuming it.

A new driver was created here, instead of modifying an existing driver such
as mt6323-auxadc or mt6359-auxadc, for the following reasons:

 - Both mt6323-auxadc and mt6359-auxadc select channels through a request
   register (1 bit per channel), while mt6397 uses a 4-bit numeric field
   CHSEL in CON1 (10:7), and then pulses a START bit (CON1 bit 0).

 - For mt6323-auxadc, which is the closest I could find to the mt6397
   (CON0..CON27), it has 13 more registers than the mt6397 (CON0..CON14).
   It uses CON22 for its request register, and reads the result value
   from the same register as the ready bit. We don't do that - the mt6397
   has a factory calibrated value for each channel at 0x16 higher than the
   raw value. mt6323 also has a 1800 mV / 15 bit scale / resolution while
   we have 1200 mV / 10 bits. We also have some per-channel preparation
   that we have to do before the burst, that the mt6323 doesn't have to
   do.

 - For mt6359-auxadc, it has a more generic framework for describing the
   AUXADC, but it assumes requests are channel-per-bit, and so we would
   have to basically ignore req_idx, req_mask, rdy_idx, and rdy_mask.

 - We also have our own software sampling, which the vendor does too
   (Amazon Fire OS based on Linux 3.18). We'd have to have our own
   sampling callback to do it.

I have two things in the driver different from the vendor (Amazon
Fire OS based on a 3.18 kernel). Verified with over 150 interleaved reads
per setting:

 - Leaving the ISENSE input enabled between reads, as the vendor does,
   makes no difference to the value, so the driver switches it off again
   and leaves both ADC input enables clear when idle.

 - The chip's sample accumulator makes no difference at 4, 8, 16 or 31
   samples and costs no measurable time, so it is left at one. Software
   averaging helps, but only by about a quarter: 0.92 LSB standard
   deviation for one conversion against 0.67 for sixteen, where independent
   samples would have given 0.23. Conversions in a burst are correlated.

The reading was checked against the charger, which regulates the pack to
a programmed voltage in constant-voltage mode. Over twelve such voltages
from 3904 to 4080 mV, and charge currents from 111 to 778 mA, the driver's
reading is a mean of 0.9 mV from the regulated value, well inside
the charger's regulation tolerance. That also settles reading the chip's
trimmed result register rather than the raw one - the raw register is
20.7 mV low at every one of the twelve points.

[1] https://lore.kernel.org/all/20260902193351.185771-5-l.scorcia@gmail.com/

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Changes in v2:
- Add justification for this being a new driver rather than folded into
  mt6323-auxadc.c or mt6359-auxadc.c, in the cover letter and patch 2.
- Drop the "ret = ret ?: ..." chains, and let teardown fall through on
  errors, allowing the chance for all bits to be properly torn down. The
  errors are now held rather than discarded. (Andy and sashiko-bot)
- Run teardown even when per-channel setup fails part-way through, so we
  don't leave bits enabled that would have been cleared. (sashiko-bot)
- Set ISENSE settle time to (1 * USEC_PER_MSEC). (Andy)
- Write the two channel descriptors out instead of using a macro. Also
  gets rid of the padded column. (Andy, Jonathan)
- Move the MAINTAINERS entry for the dt-bindings header into patch 1, as
  the mt6323 series does.
- Declare the sample loop counter in the loop, instead of with sum, and
  split the declaration of sample and ret. (Andy)
- Keep the two CHR_CON16 ADCIN bits as BIT()s rather than turning them
  into values of a GENMASK field. Fix OR operator on the bits, treat them
  as mutually exclusive. (Jonathan)
- The rest of Jonathan's v1 review: two-space indent separating a register's
  fields from the register, a blank line before the settle times, a lock
  comment that says why the lock is held, the two CON1 START writes on one
  line each, the single-call init helper inlined into probe, and { } for the
  of_device_id sentinel.
- Add the additional three CHR_CON16 ADCIN defines that make up the 5
  single-bit enables. These are currently unused.
- Link to v1: https://patch.msgid.link/20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com

---
Ryan Brue (3):
      dt-bindings: iio: adc: mediatek,mt6359-auxadc: add mt6397 PMIC AUXADC
      iio: adc: mt6397-auxadc: add mt6397 PMIC AUXADC driver
      mfd: mt6397-core: Add mt6397 AUXADC support

 .../bindings/iio/adc/mediatek,mt6359-auxadc.yaml   |   1 +
 MAINTAINERS                                        |   7 +
 drivers/iio/adc/Kconfig                            |  11 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/mt6397-auxadc.c                    | 378 +++++++++++++++++++++
 drivers/mfd/mt6397-core.c                          |   3 +
 .../dt-bindings/iio/adc/mediatek,mt6397-auxadc.h   |   9 +
 7 files changed, 410 insertions(+)
---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
change-id: 20260914-rbrue-suez-upstreaming-mt6397-auxadc-5e1228025c50

Best regards,
--  
Ryan Brue <ryanbrue.dev@gmail.com>


