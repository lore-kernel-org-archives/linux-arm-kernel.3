Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C25CCA5FA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 20:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W7dESHL0vifQnHIeAhXaCrb7JvaI9KDwDeR5hQlydKw=; b=kSVTqQ6swDb3lw
	INqU+suENE5emsQNjOFtUTSyqvP5oGRQPfbUO5S5mbJh5dsg5ZXCaL2/rK/IPkJbdqNw/r1BHsTCv
	tL2xN/Q5ckGQIc4yDeFIIAJ+S4ryC89Gk6q2d7vNgDuZDhZI6oObu/9vPCnhtKGTE16G8eLveweIy
	vUth36bieV90cS26hAlPcmGkfKbaqcxiUh9mdzrtKhZmS5a0dhS9qGwfWIcLCZTOcscxHXMpAv/qj
	b6/9J5HePrCtYX0Y8vcUZW4Gc3QUU3JQqB2YeLqCEKfjLGv9X2RQ/bftezqTEswfLtAKUN3sRAojZ
	Yqjm/xYgx/M6WRcbaTjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBIQ1-00000001dS8-3Eye;
	Mon, 28 Sep 2026 20:57:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBIPz-00000001dOw-0kiF
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Sep 2026 20:57:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=W7dESHL0vifQnHIeAhXaCrb7JvaI9KDwDeR5hQlydKw=; b=kCjxUtsZffy3rCRRjY5FXszlZJ
	6Z9HUOlOKwxDF9skXMF83+AB4aWVQci15wULf77BQNjRt05Z5uq83iKkwIj0uK1ktRqKBGrpEUiCu
	vOEHdevDAjqQS5a+cvldMZ8DGx8vF2MunT+2Fo25IwnP+0aD5RV7tUOOYQyfV6d6DSLCRIEsbtnQD
	WkYgJE737+HNmk5Wg0/kwP1sRViz/CpOjJ9Q8lbmf8oJLRxPF5FwcdjjKga8IqBKmlS8T+sCfgm7v
	gUxAbXBbFUcI0Y9nySixJriNPCyGLBqX2u878fTIwH5OdsnwQoLsmmF5xC8tBFHHJjlHfckQbqYz/
	TGwkKUYw==;
Received: from mail-qk2-x04.google.com ([2607:f8b0:4864:34::4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBIPg-00000001tqP-3mLB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 20:57:42 +0000
Received: by mail-qk2-x04.google.com with SMTP id d75a77b69052e-530e7b7a366so10596841cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 13:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790629046; x=1791233846; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W7dESHL0vifQnHIeAhXaCrb7JvaI9KDwDeR5hQlydKw=;
        b=paRnyBgp2tOhC9u3HWgL0LKCTQTKGdv3QV994+AKbC11/rtpTif9HJgM0YgRmcLce6
         7BkU9u5olZw0oKtDcjtvwUfKAtuRDzNTLoXJENOTHgVs47fe3OtVhQJIUH02seNXn/WP
         2KZL7nFDVXCZiWEyS6FTEk92nEAla2If6ZkeuIw2TnqUF6h7KNrUyzLhkL2c/V5F4n5I
         Qlb0pHVDAaPH4VYoSPvdf1gRtpGvazvsgo6CwxBurjT+8XvRfoKgWZc+b+iVEsKFqEoa
         xMT4vWSytzXgIxGdVTTjoUkw6yBmDpOwbPvCH40VYlPX5GPiZn4bQDkB9I9Vjxd7l0Aj
         HzRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790629046; x=1791233846;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W7dESHL0vifQnHIeAhXaCrb7JvaI9KDwDeR5hQlydKw=;
        b=lAl9Q1Bs15giraL8BMRW1NEu33nk5QCHCS9F/Vbxv98k/1deHK4nawlAPyli7Cws3n
         KAwq29YTPr9WhFJ+p3E9+cdxRq10u1iEaVUHtOIEzOi1gJ7W/CQkfRhX4xM8bZ+xNUok
         iGWM24NZd77fdCdws+qD8r3tkYbHjkI7JD+0CClRmWdAP+wVCWoVJBXBLshuP1ob70IC
         ecQzPESIww34naBXi3II49GK3ExIWhfp81lCJX73TYgDuu9jPsKM8BRPT+kjZJAhY7JX
         SfE21R2lNeB6OpP+EgzFrK95keGCDuus5UqQ5Qp7H/aPLbcMTOZqmQXikrFw558e/HC9
         gQVg==
X-Forwarded-Encrypted: i=1; AKwUvBws6VKd+qCGj6XlZCBorC5wU6ZaliIb3yZJcu2Qqfi2Tj4AUyE2ilSQ2HeidcdamCVKziJsSE1VOx8Z6nF/u0UR@lists.infradead.org
X-Gm-Message-State: AFuF++nKQBwlj4h2AFurQ8+VRduqQmGxQ+clfTJqINFCT8ou3M/CKhy6
	O2u2fxJozNuUL/Ne3bId+2DQsIPdUZXbEizP46U8Tds2YmxtvW9Dl3lc
X-Gm-Gg: AYBFou1lSP/xVyjcLmhUKgKYk9J/R5KySn6V5gr1ktJw1W8nvIYNYSk7QX5lLgXBFrb
	qGb0krqebY28yTgLLdvBZ8O+EC65e/LnucUmhnqi8fn+aGlOkXDN6gW6s5Q+9UG2A9JSzQ4iFTi
	BjjqiKgo1moPQ1Im2WyjWEUPiFZsK0bovAt+uNH8UBVdYtPFWUUSlxqEQQWq3Ft0V/Lpny29OQW
	wVrgEyr48gHgSNY6tqG5YDgyHQpSEYSuWiOGGaD3RfVuqZDEDSxW/FmjbIUCzEyQCC2/9RDhNQG
	w4kx0V87J7kkxJhskPrNa8EMBIhnsAI+iYfEnzS7A70aJEgV8uvYGNfuCnCviyxPGXIiQyE+SF4
	z+Tawsqkbm0xtxQJ6zqQAxhEjvlfRyzyGKdAmbj60D00hlhL/zUu12fatRDzBfNSgpsEGjiPnl3
	o7Vl5tGq+UbfXBY4l3Ujxnr4CvT7fgBb+Rw4OU6UyQkxOR5eoGpI67l75vOSYMDn7hD/kqjAcTL
	FaftNB6XJLbyQ9aCRxI5H2Mc5E5/pwwopRxCAvZeoVvgVH6yPQtgB6gQn+3QNJh
X-Received: by 2002:a05:622a:491:b0:532:a2ba:c3d with SMTP id d75a77b69052e-5330b5572c9mr235921541cf.10.1790629046042;
        Mon, 28 Sep 2026 13:57:26 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-533223c6d82sm71443421cf.21.2026.09.28.13.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 13:57:25 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH v4 0/3] iio: adc: add mt6397 PMIC AUXADC support
Date: Mon, 28 Sep 2026 15:57:18 -0500
Message-Id: <20260928-rbrue-suez-upstreaming-mt6397-auxadc-v4-0-23533a0d30e3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NywrCMBCF4VeRrB2ZTppYXfke4iJNxhqwF5K2e
 KHvbioIBTddnrP4/reIHDxHcdy8ReDRR982aeTbjbA301QM3qUtCEnjIcshlGFgiAO/YOhiH9j
 Uvqmg7rU87MEMD+MsKM6ICiRlFYpEdYGv/vHNnC9p33zs2/D8Vsdsfn8BtS4wZoDgpHJkrHT6i
 qeqNv6+s20t5sBIS3S/EqUZLaUqCjIaiz9ULlDClahMqEVkZ2zJrPMlOk3TBxPKj3SCAQAA
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
 Ryan Brue <ryanbrue.dev@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790629044; l=9791;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=X7rWD2jzzHbsWFfZ3PsGJIz721WPwrvFp+KPtPDgD9g=;
 b=LzhRpY3f7y28sCPo1w0Dus+9fZPfV+dyY5AItrh98GZKaCBTgm1Pv4YK8Cq15vaV472K18L7H
 bGtxQrr4LU1DbeLBNEoIlL0TZSEf/H/z9I2MioA8eyebWad/veuCsvR
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_215730_279211_E1D8E40E 
X-CRM114-Status: GOOD (  38.00  )
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
ships a header naming them: a channel ID is an index into the driver's
array and not the PMIC's channel number, as in mt6323-auxadc. The register
sequences are the ones the vendor kernel's pmic_auxadc.c programs.

One note on patch 3: it adds a cell to mt6397_devs[], which Luca Leonardo
Scorcia's MT6392 series converts to the MFD_CELL_* macros in its patch
4/9 [1]. Whichever of the two lands second needs a respin. Mine would
become a single MFD_CELL_OF(), and I can do a respin if that patch arrives
first.

Tested on an Amazon Fire HD 10 (2017), an mt8173 with an mt6397. Both
channels are exercised: the battery channel by a fuel gauge, which reads
817 counts, 3830 mV with the pack at rest, and the thermistor channel by an
ntc-thermistor consuming it. The error paths are driven by injecting a
regmap failure into each helper in turn. The read returns the injected
error, and every bit is cleared again. The teardown writes were also made
to fail, one at a time. When one write fails, the others still run, and
only the failed write's bits are left set. The next read clears them
anyway. Run the same way, v3 stopped at the first failed write and left the
later bits set.

A new driver was created here, instead of modifying an existing driver such
as mt6323-auxadc or mt6359-auxadc, for the following reasons:

 - Both mt6323-auxadc and mt6359-auxadc select channels through a request
   register (1 bit per channel), while mt6397 uses a 4-bit numeric field
   CHSEL in CON1 (10:7), and then pulses a START bit (CON1 bit 0).

 - For mt6323-auxadc, which is the closest I could find to the mt6397
   (CON0..CON27), it has 13 more registers than the mt6397 (CON0..CON14).
   It uses CON22 for its request register, and reads the result value
   from the same register as the ready bit. We don't do that - the mt6397
   has a factory-calibrated value for each channel at 0x16 higher than the
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
   makes no difference to the value, so the driver switches it off again.
   Both ADC input enables are clear when idle, unless a teardown write
   itself fails: the rest of the teardown still runs, and the next read of
   the channel clears whatever was left set.

 - The chip's sample accumulator makes no difference at 4, 8, 16 or 31
   samples and costs no measurable time, so it is left at one. Software
   averaging helps, but only by about a quarter: in one interleaved run,
   0.92 LSB standard deviation for one conversion against 0.67 for sixteen,
   where independent samples would have given 0.23. Conversions in a burst
   are correlated.

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
Changes in v4:
- Attempt every teardown write even if a previous one fails, so a failed
  write doesn't leave the buffer, bias, or input powered. Reverses the v3
  change. The teardown neither checks nor logs errors for failed writes,
  similar to mt6358_stop_imp_conv(). The next read will rewrite those bits
  anyway. (Angelo, sashiko-bot, Andy)
- Move teardown into mt6397_auxadc_release(), keep error paths out of line
  with goto, and use mutex_lock() / mutex_unlock() rather than guard().
  (Jonathan)
- Reword the comment above the BATSNS disable prior to ISENSE enable.
  (Jonathan)
- Collect tags.
- Link to v3: https://patch.msgid.link/20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-0-c00edacbee64@gmail.com

Changes in v3:
- Move the sample loop into its own function, so read_channel() is setup,
  then a conditional burst, then an unconditional teardown, with no goto
  mixed with guard(). (Andy, sashiko-bot)
- battemp_bias_off() and isense_disable() now return on the first failed
  write, as mt6323_auxadc_release() does, and twelve other teardowns in
  drivers/iio that I could find. A failed write can leave the later bits
  set; the teardown runs at the end of every read, so the next read of that
  channel clears them. (Andy)
- Drop the "if (!ret) ret = err;" accumulators with it. A teardown failure
  now goes to dev_err() rather than being returned, since the caller cannot
  act on it, and read_channel() takes the iio_dev so no struct device * is
  stored. (Andy)
- Split battemp_bias(adc, bool on) into battemp_bias_on() and
  battemp_bias_off(), and drop the bool. (Andy)
- Make the SCALE case an if-else. (Andy)
- Move the "why a new driver" rationale below the --- marker in patch 2,
  out of the commit message. (Andy)
- Reduce the CHSEL regmap_update_bits() call from four lines to two. (Andy)
- Drop the comment above guard(mutex). (Andy)
- Say in a comment why lowering START needs no settling delay. The ready
  bit survives the fall and is cleared by the rise before the next
  transaction on the PMIC wrapper can observe it. I measured this, and the
  details are in the reply on 2/3. (Andy)
- Cc Luca Leonardo Scorcia with a trailer rather than in prose. (Andy)
- Link to v2: https://patch.msgid.link/20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-0-db35882a6080@gmail.com

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
 drivers/iio/adc/mt6397-auxadc.c                    | 377 +++++++++++++++++++++
 drivers/mfd/mt6397-core.c                          |   3 +
 .../dt-bindings/iio/adc/mediatek,mt6397-auxadc.h   |   9 +
 7 files changed, 409 insertions(+)
---
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20260914-rbrue-suez-upstreaming-mt6397-auxadc-5e1228025c50

Best regards,
--  
Ryan Brue <ryanbrue.dev@gmail.com>


