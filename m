Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483E3E66886
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 09:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F5nB8fHKMaIzWNuSxdIiCgEFq4ZfOznDuDPNBRfGesY=; b=EiVegrjgo9JQyz
	2azT9KClzQksT9anEE4Kq/HR+85/x2pdAg14tABrkWj6XBVYJnpth34uTcNqWUZby4UFLXCIHtyvt
	5/D664XkZNrxRiuD5ZJTF8uWgnwd5S08MocVBsh/ugOWtSnEwdtaZqJstOtTIMpXxmrhx7P0TTZov
	59thu4rkwOxtER53tUdVWtWUll1rGNLRKL3q4ZQyMAAhz9CV8lfwjqxe+4pZDdLU6H2Dk0DNttzXO
	IQ5u299VNfmtNvgmF2cYfCzF7ftup9sVklJex2J9yRz8EI7tY/0X6ybK+dzqF25qWUIGLVTteLxP6
	i7/w84GDrYzD7bQD2zAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXFrd-0000000CHqd-1QaW;
	Sun, 21 Dec 2025 09:36:33 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXFrY-0000000CHqG-3L7u
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 09:36:30 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso33254275ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Dec 2025 01:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766309787; x=1766914587; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F5nB8fHKMaIzWNuSxdIiCgEFq4ZfOznDuDPNBRfGesY=;
        b=bXpH+Rp0sUJU/xq0LKvGZeTvzvyhKX0XtwIBZ+/oH6/V/XID9lmFuHE3YF5PGezV1S
         LP2nGmuQFeis7O9MFRLE3gnHpXy1q0m6pqwze+MQcuJAZwTVG+bAYo62DyPK5NZDVLpt
         VPt0U1To0qTj0JMRTztz0dIIlNcsgbedri9VY48IOMJiPCdW9ZE2vI//19oVBhD0d/Ud
         azOcT2gPM5nd1KjVgYg6rAl50ykwElgPNaAXwasJAlUMqsOdnMoTsQvv+ofE/K3wDkcw
         rg9otOI7BXN5+tlPDgF3BWKcdd2YDL2YThJVVDartrmZZsijv5BdkEU2D6PEttmN7zpg
         ED2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766309787; x=1766914587;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5nB8fHKMaIzWNuSxdIiCgEFq4ZfOznDuDPNBRfGesY=;
        b=PF68Ce93/3C+HKRJMe4kJZT5q1Otjh2wwvOzjcEdSiE/x2k+di24GVhaKRDViCpPQS
         3zK3By+k4J3hq0OYLgRBNv3ucGKua4SUiWimB/T/RtWD3oi/8qnS5Z/hb+jZZcAMPRup
         zNVIbKfpLDrZakS17kVLV1ZCv8xQvfeD29J6da15Ny6DAPzUQCrWuHsLCGJGR+2m5Vrt
         wWAFSgj04V58BqIJ0hEhe8D5TQ+AVg4xnkzM5S1TSeJEJS35rdegBGmxaXQyveuojw4c
         pm4gcjJ8ojthkrKjP50rD7do20uc7PRjwCC0zirQgZHO6Nf5MqhpEnxemVZD9SQ8uuT6
         fk+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUkk40XnE09Ff1dwX4h12FeaDvjfjyrnx1ixaE/vSAxcuGzMqYSeNSg49DT2385e1KeQRh9Je4G+BRr1C3njDHG@lists.infradead.org
X-Gm-Message-State: AOJu0YyodCHtqSpNrxk3LySsAo6TdLyGrVkg+yX1oMFRLCNbhFf0XzKY
	DBVLzQ2gdMdYWx1u58uO1xlqcEIz4PJcbDI3/e+WhHPYGoGD1JHXUs86
X-Gm-Gg: AY/fxX67jH9y9Cz6cYKMR4+1pRjAPg/0QNclTu2FY2TUwzUlYj3tKm40YcdgnDyGk6P
	FyXeLOTlZdwdYCiN2GKCUglFGOxQzjsnZXMotfouUpbEhdtT1k9cDr9XwZvBoVri313tTH1tvw8
	unnk/E4N9Lt6T9SSLVPpCYv1EOOMdg4mKxVs4jiY1jP1NkU6FLRUSMCvADgJicTPIdCieFoGK38
	Maqry8m0dGgSxBmvfXaEVPEDReGgsQL+JZ1f++lhPc77LSUG49pZakAWQuCtHwfdO7wvC36uiQA
	FekSGVrWHDy3p4pAKqceRBnbvdHdCJUGJm4dN91pv9lAGjrb2tM6Kw/0QblUX7dyFh4g18Mba/7
	I/g/ajgcAYnmt74uBBJfmW8JxQ12dQ6680b928da2xCm/5WJjkydxj4XVG9jlAjEyYbLydsotEJ
	JH71SK5EFM1+8l1LX50QMHH+PlWur2+zhdEXlJv8sZwVciGzDMgvtbH15UtapxVH6JxnKyIEDJU
	tbvkPjkmzaGbPimpsxcYsbwC3awIabkIv6KFlr8BvawDbjUrphTGleuJFbK1XDukIlRcwnetsG1
	49+7QH+4rsmhBOn3+PZZv5TnRKNMZ6j7Wu41EkFgZDGS0YE4CG4=
X-Google-Smtp-Source: AGHT+IE26hfD24ZsQ6mXHiG/tj55lbvStfyPTDRxrA921e8bn7nv2J67tWRAQHGaVgY7xl65mVGtVg==
X-Received: by 2002:a17:903:110d:b0:2a0:9402:2175 with SMTP id d9443c01a7336-2a2f2427be6mr68478635ad.27.1766309787305;
        Sun, 21 Dec 2025 01:36:27 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4d363sm67629495ad.62.2025.12.21.01.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 01:36:26 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH v2 0/7] ASoC: basic support for configuring bus keepers
Date: Sun, 21 Dec 2025 19:35:56 +1000
Message-Id: <20251221-tdm-idle-slots-v2-0-ed4d96413aec@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHy/R2kC/12MywrCMBBFf6XM2kgStVhX/od0kce0HUgaSUJQS
 v7dWHDj8pzLPRskjIQJbt0GEQslCmsDeejALGqdkZFtDJLLi5BcsGx9Uw5ZciEnJrhWQ5t6q87
 QTs+IE7324GNsvFDKIb73fhFf+0sN/6kiGGenq1V66rXhAu+zV+SOJngYa60fkP3BKKwAAAA=
X-Change-ID: 20251201-tdm-idle-slots-10ba92516da4
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4113;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=eyUwGI0ieunvRa2JS4DDwPNE6CUzg0WKFA2me2XXi8Y=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnu+/tkzmRK8Wo3Rfg3fvMzOrKLlWlqg2sPv59u01mrb
 k6t2xc7JrIwiHExWIopsmxoEvKYbcR2s1+kci/MHFYmkCHSIg0MQMDCwJebmFdqpGOkZ6ptqGdo
 qGOsY8TAxSkAU71zA8M/rZsTLl+4MlUl0P1s7sXn/XGciRdPLTS6MTdS36NSfNFnVYb/3lySG2q
 faJuIzKzd+/CE5y6/VY4XYtUvBegf10n8cE+KFQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_013628_850149_07EDF86A 
X-CRM114-Status: GOOD (  19.71  )
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

Hi all,

This series introduces some infrastructure to allow platform drivers
to specify what a DAI should be doing when it is not active on the
bus. The primary use case for this is configuring bus keepers which
may be integrated into various codecs. The instigating use case for
this functionality is an interesting bus topology on Apple Silicon
laptops with multiple codecs.

Most Apple Silicon laptops have six codecs split into groups of
three, driving a pair of dual opposed woofers and a tweeter for
L/R stereo sound. These codecs report the voltage and current across
their connected voice coils back to the SoC via the SDOUT pin,
represented as PCM data sent via configurable TDM slots. This data is
used in conjunction with the connected speaker's Thiele/Small Parameters
to ensure that the speaker is not being driven to levels that would
permanently damage them. This is integrated into CoreAudio on macOS.
speakersafetyd[1] handles this for Linux.

All of the codec SDOUT pins are attached to a single receiver port
on the SoC's I2S peripheral, however are split across two physical
data lines (one each for the left and right codec groups). The receiver
has an OR gate in front of it, which is used to sum the two lines.

If at any point a codec is trying to transmit data, and the "opposite"
line ends up floating high, the transmitting codec's data will be
corrupted. We need to guarantee that the idle line stays idle.

In the downstream Asahi Linux kernel[2], we set up one codec in each
group to zero-fill or pull down its line while a codec on the opposite
line is actively transmitting. This is done entirely in the codec
driver, however this approach is over-fit for this one use case. This
sort of functionality may also be of use for other hardware, so following
previous mailing list discussions[3], I have tried to expose the
functionality in a more configurable and generic way.

I have integrated this approach into our downstream platform driver
and select Devicetrees as an example of how this mechanism is intended
to be used[4].

Regards,
James

[1] https://github.com/AsahiLinux/speakersafetyd
[2] https://github.com/AsahiLinux/linux/tree/bits/070-audio
[3] https://lore.kernel.org/asahi/20250227-apple-codec-changes-v3-17-cbb130030acf@gmail.com/
[4] https://github.com/chadmed/tree/tdm-revised2

---
Changes in v2:
- Reworked tdm-slot.yaml schema to silence dtschema warnings
- Properly referenced new tdm-slot.yaml schema in affected bindings,
  again silencing dtschema warnings
- Add PULLUP and DRIVE_HIGH as possible bus keeper modes
- Reworded commit messages and cover letter to more clearly explain
  what the goal is here
- Link to v1: https://lore.kernel.org/r/20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com

---
James Calligeros (7):
      ASoC: dt-bindings: convert tdm-slot to YAML
      ASoC: dt-bindings: update tdm-slot.txt references to tdm-slot.yaml
      ASoC: dt-bindings: add TDM slot idle mode properties
      ASoC: soc-dai: define possible idle TDM slot modes
      ASoC: soc-dai: add common operation to set TDM idle mode
      ASoC: tas2764: expose SDOUT bus keeper via set_tdm_idle operation
      ASoC: tas2770: expose SDOUT bus keeper via set_tdm_idle

 .../bindings/sound/imx-audio-card.yaml   | 14 ++--
 .../bindings/sound/simple-card.yaml      | 14 +---
 .../bindings/sound/tdm-slot.txt          | 29 --------
 .../bindings/sound/tdm-slot.yaml         | 82 +++++++++++++++++++++
 include/sound/soc-dai.h                  | 22 ++++++
 sound/soc/codecs/tas2764.c               | 95 +++++++++++++++++++++++++
 sound/soc/codecs/tas2764.h               | 11 +++
 sound/soc/codecs/tas2770.c               | 75 +++++++++++++++++++
 sound/soc/codecs/tas2770.h               | 12 ++++
 sound/soc/soc-dai.c                      | 40 +++++++++++
 10 files changed, 345 insertions(+), 49 deletions(-)
---
base-commit: c8d8605fc53e8072848aadc7a5aa00c2f5143cac
change-id: 20251201-tdm-idle-slots-10ba92516da4

Best regards,
-- 
James Calligeros <jcalligeros99@gmail.com>


