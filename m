Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD0DFD0056
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 08:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=enGdRrsaB6ZR8xDsA9BNubZAoRwYGJLgTDSI2U7J/do=; b=MrQgKlYK3JbvU3
	UVXWj/4vkeYH7dRz6d+IiCN4GRKm8Bo9puGSf5AY7qcnauiJRSRFBGoy5zQC3qG2Wjf0Ukv2uvDPu
	COyFHBAhwJqFclblx/EKt5CzRm8FIzD6ZVjXhqArAv93KICpdxu0vq2tnXEuH7e3xIQBnEMQEkbqk
	2gzs9v/ryQ+R9Ma2uzmYacb/ARYAKClygbwNNJTBBScBRSxlg+CWril0cCWgHkGX7FjpiZkONi/pu
	RIL3uOS+qt+VclQmd0TdDdl4vyYKyKdcgl60DKX3+ITJ9fReLE1dlOeiLENmvyrGjH4Nqm1qq9mpy
	MdFI7KX3zJhO6aPiXfNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwboZ-0000000AwEa-3El0;
	Sun, 01 Mar 2026 08:06:11 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwboX-0000000AwE9-20Fp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 08:06:10 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c6dd5b01e14so1186975a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 00:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772352368; x=1772957168; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=enGdRrsaB6ZR8xDsA9BNubZAoRwYGJLgTDSI2U7J/do=;
        b=YaJL5x638tXUV6a6gbnO+Rx3aUfW3xwVJugzru74+H3lUkggPb0eruhj3A2iHBkhdd
         VWC8khaDUDKaN5ygglJUXhz6+5W51vQOOauOXPyXEqOk4rSZqcHDFhGzWJ5Qa8sCVJwF
         3dfUuYJN1iEW4YVreQA99MLABHLzQMEdU5RQATvrn1FYkRBQpuQqyUGCxCXzwmjYgPSf
         2htQfjCAVHdk/onUTumJ2r6GpwSnxNgx6wTHsi6Jq5blxwS2PdyzP7xlK61WS/l+rkhk
         WjVOBjvGi9haoyCoz59FQOX1glPQE/g/AxY7RbZw2ixsPR1VWZleE1eQKM93QpDZwmaK
         JAeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772352368; x=1772957168;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=enGdRrsaB6ZR8xDsA9BNubZAoRwYGJLgTDSI2U7J/do=;
        b=Qc79WD0bfkIP2VVrC7Kvn3zG3iIN6Ck9gt2AXclcHXEpmRcqBCLz8X+rAy1jPfSnX7
         zYZ1scDkPTvACQfAtNgirkgVhjRVQf3fP15fpyfiv2R4SCAMp4L3DFFW7NyPdOLoMAi9
         ONpInpsvFL1V61DimnWaoFiRJ29mkgUT5vxajcCN+einkzBaHilObLzXU4jzmMFoKeHK
         lZVydi8FfBXLoZhvfR6b/bS0KP5n9B9wY5VX/lWKXgT5zAzbCZ15/Fn9QZ1U24OR3naD
         BtmM3SDFPqvWWXDctPn4rKBoRFJMsZsH59wpKw701VXVbhBmHE9Bq8tk9+o++Os+1fm2
         wPqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVP19INzsTVQvBiaupjOJ/P70c/hgOgMZNi+hFwjkK76fUh19roujyZawtYuoh0jttLnq34dOWfpOnpiAO6Iqpy@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9yIZPM4Lf5Nl4Hr0zF1+/457ec4dE8AlcSMeFHJm3mWGmQCDb
	V++aGXN4nSqs4THdhMz+hG+/XD/RHFMyuT1eGLQaVGwFu5vk1GGSTjfS
X-Gm-Gg: ATEYQzyviVF1rPp44kjQNpjGvhPvpAfpcRS0I7R9AviZj11OhLM5JBQ6snkDk7WtqwW
	ju2nif/NQY+he3OYCzZTM6Z7kxS/ovB86ymFF5U8cqs+RnO3YbAmL968w4RarnBolw7lrtCOyqD
	xlMsrSNLVsTfP+yKcgDRTnGdInEs0g3hVPVnchCyHC/f19gJIY/ruYDUTYjvszqexWQ9Z4r+TdJ
	6KnuGZ+AQWbozf652W3Glst3QZrgE7jUpFnNfvBrasttzCBj30zjux1SUEP+htU+U3IWJ/rE3Da
	fT1uAWmMjHlso+kh/6EICxPPLUjk5IpoF5zvJDe4wwLMFpdUOsrz/xMcpDWEdVEogdoGoFZLVvS
	tIR/rvqdRqT6S+Z8bTZRWX4s0JFQF4kWNifK17O2TUr01JhEJyRjelTdUCdxW19D6CxRsMNsv3f
	AvJB4pY2v1evfI5/FFNGB6SBgoic+E9EoIl475QZ0oFs7RTtrqdUWcSJHa8KIrhcN4hM3l/weyZ
	lfQRpd71D97847qLbHGd0cuqApa7TfH+NmBvZZuCld24IgiUniD4CzomtR7tgKXRmS5ufno/1s4
X-Received: by 2002:a17:90b:3dc8:b0:359:8727:6448 with SMTP id 98e67ed59e1d1-3598727677amr1667062a91.17.1772352367924;
        Sun, 01 Mar 2026 00:06:07 -0800 (PST)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359135ef1d7sm8885384a91.5.2026.03.01.00.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 00:06:07 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH v3 0/7] ASoC: basic support for configuring bus keepers
Date: Sun, 01 Mar 2026 18:05:19 +1000
Message-Id: <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD/zo2kC/2WOQQqDMBBFryJZNyUTrdSueo/SRUxGHVAjiYQW8
 e4dhYK0y/eH95hFRAyEUdyyRQRMFMmPDPkpE7YzY4uSHLPQSl9AK5CzG3jqUcbez1GCqk3Fp9K
 ZQrA0BWzotQcfT+aO4uzDe+8n2NZvqvpNJZBK5ldn6qasrQK8t4Oh/mz9ILZU0gdd/32SNOvoC
 leVBeQG7VFf1/UDGPBWnOsAAAA=
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
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4466;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=URUffd83HAMRz7HWjO4F6ZoezvrN+kfv+dGBuqFAmzY=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJmLPyd/fhnxamfW29rG17umLWie13V2beT0qq2a6eqtE
 QcdY+zUOiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFNtdoSRYV9L4Ay5BVaLZm0u6XvVO/Hwo2MZma/kv+7bmvqBd+vrkNOMDO9jLdO
 Plvya5iNc9fXvLK+ggHPZ6htE1QM9TIIXXm6R4gcA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_000609_553185_1BD14A03 
X-CRM114-Status: GOOD (  21.27  )
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
Changes in v3:
- Rebased patch set
- Elided unnecessary $defs in tdm-slot.yaml
- Referenced entire tdm-slot.yaml instead of per-property definitions in imx-audio-card.yaml
- Changed repetitive TDM slot property definitions to patternProperties in tdm-slot.yaml
- Link to v2: https://lore.kernel.org/r/20251221-tdm-idle-slots-v2-0-ed4d96413aec@gmail.com

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

 .../bindings/sound/imx-audio-card.yaml   |  9 +--
 .../bindings/sound/simple-card.yaml      | 14 +---
 .../bindings/sound/tdm-slot.txt          | 29 --------
 .../bindings/sound/tdm-slot.yaml         | 52 ++++++++++++++
 include/sound/soc-dai.h                  | 22 ++++++
 sound/soc/codecs/tas2764.c               | 95 +++++++++++++++++++++++++
 sound/soc/codecs/tas2764.h               | 11 +++
 sound/soc/codecs/tas2770.c               | 75 +++++++++++++++++++
 sound/soc/codecs/tas2770.h               | 12 ++++
 sound/soc/soc-dai.c                      | 40 +++++++++++
 10 files changed, 312 insertions(+), 47 deletions(-)
---
base-commit: d898041bfb8667f4bad10abba5dedd7edd88c751
change-id: 20251201-tdm-idle-slots-10ba92516da4

Best regards,
-- 
James Calligeros <jcalligeros99@gmail.com>


