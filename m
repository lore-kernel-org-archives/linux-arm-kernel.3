Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF96DF3ED55
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 14:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sXiZV9+jNfCTqb1kpRrOCPDhkoywHHddqhZQJ9yG43Y=; b=yWsEHLYJSzYoR3
	RbnYeJuhYVl7ppLSmu7lZy8vOfdQoLRL/YvRwOIQh/FiqFcqEJnZi9cy5ZfthBLAcuATUrSJWfPvv
	G1VF/4VgHEDA/KMoh7IuBoFyoajuFREf5u4ct57htRwGdze+reiSpjFWMkpl2lsCUCLipxgno5+hu
	0iFyhlvOmL4UQDv6wTxC4XHtudkE/lwm/hEOTL285mIJTmUvWOQXYUYrYCSTv1hQy3ba3wE6sO0m4
	MuLOQCPCja+DwH2Go2K9ASbLazIkxmL1yDSCd3Ix484EvJojzqKioN0wrivpZY7Txj8J9r1pqlOOp
	CF5fXVAoHzy3PUfyroUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBZme-0000000DXbq-1vwq;
	Sat, 11 Apr 2026 14:58:04 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBZmb-0000000DXZi-08sC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 14:58:03 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-488b0046078so29493595e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Apr 2026 07:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775919479; x=1776524279; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sXiZV9+jNfCTqb1kpRrOCPDhkoywHHddqhZQJ9yG43Y=;
        b=h3On04gDX7iCazvlO/KbimW+Iqiu+8AzF6/hbdo2dnCLAPZA9tTqtQgVhoXaeOIskr
         5krbwC76GAUYTYLSI4MS26bhpuRlCD40cGReXgNM5dYJGRsgXW5z5YXWPzobuw+AbUFH
         rZgvzmsoyZc67C3LH5YSo47anTUX+XA+q19y+c6Jv1BDkKXWiX9ZvC2IAyy39LkTzeJu
         ouwTMNLisIN+x/9D9AqVAlRnEcZPLMpPd7GJVmCcM8RJFtQy3Jcs/1REk5sL2Q/JaAtv
         TCOE+D+WrBKoH+j5CYl+X3l2JHfZcrqK7bIABInlRdAN9VDDZqTzMiwl9j72TuhEuP8x
         cGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775919479; x=1776524279;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sXiZV9+jNfCTqb1kpRrOCPDhkoywHHddqhZQJ9yG43Y=;
        b=VI44QqomeYx6xY1VDS52kDHTW1DC8VCjMlrpqXzjkN8BWiFq8v2X+2lpBolhH2uqjR
         yO2AztDP6QH0j4LJMQKbGb//2bo/TAkbT8SzOD3csRitTxWg/DOjDS2L0WS4v9fhaRT/
         YfRIXEN+1TPEQEzHEo/mvPh88dW3uWSa7xvbCiegW1MTYpWgKWWfcO7MnDs5yTtX3M2D
         JmOyMVNtd9a4N6k0t2pS5tk5doyevibXZ6Sn300CtprCw+uXEjcMMOrU/kpxJFJaaEC+
         gELiv7/riHnUgZDC2ClMfcd7OY7Wrn7EupG2+ugP1vXmGnWbXuyl9JtMrqcHGc3srAjw
         PuDw==
X-Forwarded-Encrypted: i=1; AJvYcCXD9q4S0GrzVhsVzrE/DLVXAHxHMXVHYbGPfymHibiPtMoSO2Sadwpw8WSVOTClgvFs63tJg7ZiVoJ13WBHwxUy@lists.infradead.org
X-Gm-Message-State: AOJu0YzIcqfDJbtprynhy4rvRdemQ0bF9oR3MrCezUtpfJwkV99Je0mW
	iNKiqLTUS8kudqSEpLjDxYU9RQsfx9N7w5QfmQB4158JbtcssNYNFlu59vY0xGpmt2A=
X-Gm-Gg: AeBDieu3qwNjwkEWnmKCuRIOE8O4f2fNChLgbvZ2Wn+K8+EU7t5wCoLyD/4bGJQw7Yi
	Vu8CEi/U9I1foWZhLxqTd9WiwA7Vwc2GtyTjkcbdoqbinCbIWROQusvP4X7MTuxqjzEN8OurTod
	wjG+wBXcvWGM11Kq5I2YbjmN8lTW0Lqj5lOCZs6BeSsMEiofC8pozJjDRyx7Zet7a3ltvUwWiha
	IVzP7b/zdjX3bUYPlVAGgiyaChbaGlw4AssIAX0hpwVLCcZjC+TzXW8neopzoHNOcpokXDc0gBr
	WCHSQuhh6Fas9r5z5PB3lGC5BESiRhAhhSdxnF1bbP4zFFEjeAnlltPdV0OnJ88iLeYn5DEEu/j
	+usTHBQPEmm7P9w9BZfYQhnEi+HlcjchT77gZtNxvQXrjYeyKH9XywzpmDTPaPE6KqO/mG1Uc5c
	p2r/hQAVsHB4vdMTqim5Bf
X-Received: by 2002:a05:600c:5303:b0:488:b196:d249 with SMTP id 5b1f17b1804b1-488d67bf74fmr94580245e9.5.1775919478531;
        Sat, 11 Apr 2026 07:57:58 -0700 (PDT)
Received: from [127.0.1.1] ([151.61.248.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5dc7070sm48882375e9.10.2026.04.11.07.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 07:57:58 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH RFC v2 00/11] Add support for AUDIN driver in Amlogic GXBB
Date: Sat, 11 Apr 2026 16:57:25 +0200
Message-Id: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFVh2mkC/zWMQQrCMBAAv1L2bMomTcV6Kgg+wKt4SNKNXbCtb
 GpRSv9uEDzOMMwKiYQpwbFYQWjhxNOYwewKCL0b76S4ywwGzR6tRuVeHY9KYlDGVj742NRkK8j
 9Uyjy+/e6wuV8gluWUaZBzb2Q+29qNBp1jdo0pUVjD0qrJdE8c+vd58FeqAzTANv2BYV9E0GdA
 AAA
X-Change-ID: 20260410-audin-rfc-243bcbf95e43
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Valerio Setti <vsetti@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4155; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=3L+gTDPXvRqyUGB8yEtL8RbSZ9xTZaawwb3B9aSZ2Eo=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDJm3EvMrp3xIYrqlk9QyY03Z7YcCk2RnTMt/5L3ztJD16
 VYB7eczOkpZGMQ4GGTFFFlYpt/7XVCq9tA44WQBzBxWJpAhDFycAjARgRpGhrvchk/fnHOIk1ri
 yDjFt/HV32ob1/Wp05Mt9ect9rr904+R4UTGHruHeRNEnj0r+DB3uXUYl6LVwqV9ARlRjcKspdp
 HGAA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_075801_264892_95BC279B 
X-CRM114-Status: GOOD (  19.39  )
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

This series adds support for I2S audio input (AUDIN) on the Amlogic GXBB
platform.

It has been largely reshaped compared to what proposed in v1. Instead of
adding an HACK commit to allow AIU to export its clock so that also
AUDIN can control it, now the design closely follows what was implemented
in the Meson AXG platform. "aiu-encoder-i2s" becomes the shared interface
for playback/capture and it controls pins and clocks; data formatting
is implemented in formatters which are named "aiu-formatter-i2s" and
"audin-decoder-i2s" [1].
Formatters are DAPM widgets which are dynamically attached/detached to
the streams when the latters starts/stop, respectively.

As of now only I2S input is supported, because it's the only one
I could physically test in my setup, but other input sources (ex: SPDIF)
are also allowed according to the SOC's manual and can be added in the
future.
This series was tested on an OdroidC2 board (Amlogic S905 SOC) with an
NXP SGTL5000 codec connected to its I2S input port.

Since this work brings GX platform very close to the AXG one, once this
series is accepted, follow up work will be done in order to unify
GX and AXG formatters so as to minimize the number of implementations.

The series a bit long and it includes changes to drivers, dt-bindings and
device-tree. Of course this only happens because this is an RFC and I
wanted to give a full overview of what will be the final design. If no
objection is raised, this patch series will be split into 3: one for
reshaping AIU and introducing formatters, one to add AUDIN driver and its
dt-bindings, one for the device-tree changes.

[1]: Different naming for the aiu part is related to the fact that
"aiu-encoder-i2s" is already used for the interface and the goal
of this series was to introduce the minimum amount of changes that allow
I2S capture to work. Renaming can be implemented in the future as follow up
activity.

v1 -> v2:
- Reshaped design so that GX platforms will use the same design
  pattern of AXG ones. This helped removing the need for an HACK commit.

--
2.39.5

---
Valerio Setti (11):
      ASoC: meson: gx: add gx-formatter and gx-interface
      ASoC: meson: aiu-encoder-i2s: use gx_iface and gx_stream structures
      ASoC: meson: aiu: introduce I2S output formatter
      ASoC: meson: aiu: use aiu-formatter-i2s to format I2S output data
      ASoC: dt-bindings: amlogic: add schema for audin-formatter and audin-toddr
      ASoC: meson: gx: add AUDIN I2S Decoder driver
      ASoC: meson: gx: add AUDIN FIFO driver
      ASoC: meson: aiu: add I2S Capture DAI
      ASoC: meson: gx-card: add support for AUDIN FIFO
      arm64: dts: amlogic: gx: add nodes for AUDIN decoder and FIFO
      arm64: dts: amlogic: odroid-c2: add support for I2S audio input

 .../sound/amlogic,meson-gx-audin-decoder-i2s.yaml  |  49 +++
 .../sound/amlogic,meson-gx-audin-fifo.yaml         |  63 +++
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi          |  32 ++
 .../arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts |  34 ++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |  26 ++
 sound/soc/meson/Kconfig                            |  17 +
 sound/soc/meson/Makefile                           |   6 +
 sound/soc/meson/aiu-encoder-i2s.c                  | 219 +++++++----
 sound/soc/meson/aiu-formatter-i2s.c                | 106 +++++
 sound/soc/meson/aiu.c                              |  37 +-
 sound/soc/meson/aiu.h                              |   4 +
 sound/soc/meson/audin-decoder-i2s.c                | 218 +++++++++++
 sound/soc/meson/audin-fifo.c                       | 432 +++++++++++++++++++++
 sound/soc/meson/gx-card.c                          |  14 +-
 sound/soc/meson/gx-formatter.c                     | 304 +++++++++++++++
 sound/soc/meson/gx-formatter.h                     |  47 +++
 sound/soc/meson/gx-interface.h                     |  50 +++
 17 files changed, 1567 insertions(+), 91 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260410-audin-rfc-243bcbf95e43

Best regards,
-- 
Valerio Setti <vsetti@baylibre.com>


