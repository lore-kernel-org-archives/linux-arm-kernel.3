Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A5FD3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 09:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MRxNXZW5HGKhav3cQeIpm16SYzyMsJXYbVPLK0TzqeI=; b=jnDDrVP12u3hJ0
	l1m5Xnh3VCxsgZzG/7SbOOklVb5kJ7XeDk0/s0/mKc3md7KpsQDO7vlZQoJq8qDmFhKCo3m/0nH5n
	TV/wHDCCxUHvMS8fV5VF+SrQf2rtqHDfGK5yE4Efc/AOZRiZnQLyKlT+jnEb/AZMQICUubbhCO23a
	S3bV8Yv7xEJDGm9mZ9nnByDeMgJhYyUPNKj/iIetOqIvmq9ro0XifrpkTzRZZJlpdIKQdb7f0DRRq
	1wYsc3YyGt0e7cDNEDae6nVjPFyBqXNF+OZSYxLT70cZRNebllFwKBc9FoE1v4eDxyAlYc8n30DkQ
	qgcqjzR1KV2Ad6VlktOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSu4F-0000000E2qR-1FRl;
	Tue, 09 Dec 2025 09:31:35 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSu4C-0000000E2pf-2M39
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 09:31:33 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-bcfd82f55ebso2473450a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 01:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765272691; x=1765877491; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MRxNXZW5HGKhav3cQeIpm16SYzyMsJXYbVPLK0TzqeI=;
        b=UQ8RobhbRrgzPaECDTiNIdlLZsAymFYcs8LFCSe52WjIvr4J+BYHENDBxIYcGtLBuk
         8ycyc2Hv1lE1IG2Ac+cbFNw/y0/HhTs/MU+X52LFvDN6LM61UqzZheO0bRx8AdavCBXC
         2YiuT+Huo9oxdBElHqdhp9slj2KibcAm8U/+qw6yRShIhovqkpjthMYK5RwH7cFE1YzA
         L8TY7Xwhf4G2CFJNc6ykm5Na6cqSmN1XxanJEER+jND799Dv982xEDUeplqBq6K/5Trm
         uHWLj+P5HcQBmyUOvDs640XlxTGMQWC5lpYnTPvLVKa9Fcv+UWSQaf/NL0Jso8l/SFfP
         TULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765272691; x=1765877491;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRxNXZW5HGKhav3cQeIpm16SYzyMsJXYbVPLK0TzqeI=;
        b=jx8L/kTUo4X9oAtAsaU+hDSJYELWUfl64OXWkOdazZ6sc5Y/iWwGz9xa/vsjKLJXwI
         34+/hIASfE/YcWfkjs1UhzcWVPTDkxtzNpYthi1srI7RCPvjm/DKtNPtqftXkK5RvD6/
         y/vGdkieazz1ZOFrX7nlQ56cMsq0Hb9mfjBasA2nPeIZptPBLk1ZWQ2BR71RQ1fIHTc9
         L1gMxC5utktQhJvMk38xbaHkBmf+AqUWwTFj0OXws0uKcH1YTHWwjL5x4NHUXunXA/0a
         fLZwnh+SNh+VI0/NIh9v0x7bPaZ5lJxu71p8QxzR2Dpl8QuK1dxTs/y0JcRJ/nk+FGmW
         PhNw==
X-Forwarded-Encrypted: i=1; AJvYcCXBpto1y/sbyJkSwWeHUAxGTnS7uspAadrOyadetImHuYKhEuVtEuqmJ9V2/Q+6TDzEra9IPWNLIUGnO0xeF54s@lists.infradead.org
X-Gm-Message-State: AOJu0YwmgLsGO63HbeUiU23q+wFGumgd4fa/jzI6PT/fYoIluwSxUUA0
	Bt6SAv8TXURA6Q41IOmFfXDb2cUd7CyUFv+uo2mDwoHui9bqkNOizcHW
X-Gm-Gg: AY/fxX7wZKfrg2EhF1//ReOdT37D3AlfL0wjmznG9bfjBwT6VJxEHK9DYhT7tlktrhe
	ygZ1h/7d+muW3XhOlge3FPqDSU7+ImbxYTeJUyHCU+Bz2Ha1p7nF/TjUh0OJxo3SkrT07+S1BG3
	PUpTw902yNEGJQuaAeLN3TxCqlR4Axva8zm9Z9ABuFjiKeR09U7uJZ9RzUyAUY+NFCZDV6H8QwS
	SF3jyhGPhARkkCotHsIMUhZSpZiGEY+TjslppSGNtNIY43D6CwUA+Swm2lIL7BEqkKS7JSf906A
	gaAuW3J9yOvz8rXBhZCG2EG37Mmy8kxpseoDC0pKZrL36sgCrvbMPY2/1Fpg5U4RA/vXjU8OfkS
	mY8egnusoCuEpNF6k9nwDf+FREImGZK2PgWEvwpx04faDGfZGhOlwsoaG9Z8zhOT2KL6Fcx55XH
	kLIjKMcwi2utZZAk6Mw5PMgb1k+zKvgfM09S7Ps2TOpVgrfKWSBGROBKiA3HnH5dugub8JnYYnS
	gixUBnjK8+qpakShyjfIc3as1e7WSwjaA9eFH9NucSZ1JGiciCefaQTaMTrr3PHaWoHNHNbGxIx
	XUBGMHBMtyyQXCnylsJ/uKs5KHVSYAVLjHjw93JcyAdBEHrygzE=
X-Google-Smtp-Source: AGHT+IFL+1r/PaRqVVNGXNwojrxl0XaiTGaLLglD0VKcZyQgQAl1LXB5j5aWz2pOa2uC61OCwPtJew==
X-Received: by 2002:a17:90b:3fcc:b0:343:72d5:2c18 with SMTP id 98e67ed59e1d1-34a4f89b3d4mr722746a91.12.1765272691298;
        Tue, 09 Dec 2025 01:31:31 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a49658704sm1800408a91.6.2025.12.09.01.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 01:31:30 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH 0/7] ASoC: basic support for configuring bus keepers
Date: Tue, 09 Dec 2025 19:31:13 +1000
Message-Id: <20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGHsN2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIwND3ZKUXKBQTqpucU5+SbGuoUFSoiVQyiwl0UQJqKmgKDUtswJsYHR
 sbS0AIqk2u2AAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3561;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=L2NXhYYRLt8OIp+LSK83T3wVNVp3FYPqt22R7zQ43L0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnmb7Lqeleti/sfK8JcZtv+e7XCRM0YuTVffT1bNnhu3
 WXgcK2gYyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 hjrGOkYMXJwCMNUJpxkZTjp4J+y6LttmvjF4Za7M3z0nFh2bcb7x6n3jb5a5zd3vfBn+Z2utDpe
 3nlC34vKxrdN+SP6WfPOB9UO38/QY/t3v+3lfsAAA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_013132_614049_68155D09 
X-CRM114-Status: GOOD (  19.96  )
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
may be integrated into various codecs.

Consider a device with two codecs that report voice coil voltage and
current data back to the host via I2S. Codec A is configured to transmit
its V/ISENSE data on TDM slots 1 and 3, while Codec B is configured to
do so on slots 2 and 4. The receiving end sums the two together.
If Codec A transmits anything on slots 2 or 4 (and vice versa), the
result is a bus conflict.

Some codecs include configurable bus keepers to ameliorate this issue.
Notable examples are the TI TAS2764 and TAS2770. By default, these
codecs keep their SDOUT pin floating during unconfigured TDM slots,
however this can result in garbage data on the bus. TAS2764 can be
set up to fill specific TDM slots with zeroes, TAS2770 can hold its
SDOUT pin to ground.

This feature is necessary to properly drive the speaker systems found
on most Apple Silicon laptops. All but three models include six codecs
in two groups of three driving two woofers and a tweeter on both the left
and right channels. Each codec group has a single line for SDOUT, to
which all codecs are connected. The two groups are then summed on to
one I2S port. Each group must ensure that it is silent on the bus while
the other is supposed to be active.

In the downstream Asahi Linux kernel[1], we set up one codec in each
group to zero-fill or pull down its group's side of the bus for the
opposite group's transmit slots. This is done entirely in the codec
driver, however this approach is perhaps over-fit for our use case.
Following previous mailing list discussions[2], I have tried to
expose the functionality in a more configurable and generic way.

I have integrated this approach into our downstream platform driver
and select Devicetrees as an example of how this mechanism is intended
to be used[3].

Regards,
James

[1] https://github.com/AsahiLinux/linux/tree/bits/070-audio
[2] https://lore.kernel.org/asahi/20250227-apple-codec-changes-v3-17-cbb130030acf@gmail.com/
[3] https://github.com/chadmed/tree/tdm-revised2

---
James Calligeros (7):
      ASoC: dt-bindings: convert tdm-slot to YAML
      ASoC: dt-bindings: update tdm-slot.txt references to tdm-slot.yaml
      ASoC: dt-bindings: add TDM slot idle mode properties
      ASoC: soc-dai: define TDM idle behaviour modes
      ASoC: soc-dai: add common operation to set TDM idle mode
      ASoC: tas2764: expose SDOUT bus keeper via set_tdm_idle operation
      ASoC: tas2770: expose SDOUT bus keeper via set_tdm_idle

 .../bindings/sound/imx-audio-card.yaml   |  4 +-
 .../bindings/sound/simple-card.yaml      |  4 +-
 .../bindings/sound/tdm-slot.txt          | 29 --------
 .../bindings/sound/tdm-slot.yaml         | 66 +++++++++++++++++
 include/sound/soc-dai.h                  | 20 ++++++
 sound/soc/codecs/tas2764.c               | 95 +++++++++++++++++++++++++
 sound/soc/codecs/tas2764.h               | 11 +++
 sound/soc/codecs/tas2770.c               | 75 +++++++++++++++++++
 sound/soc/codecs/tas2770.h               | 12 ++++
 sound/soc/soc-dai.c                      | 40 +++++++++++
 10 files changed, 323 insertions(+), 33 deletions(-)
---
base-commit: e4deadb3e562aadf2825f28be3dcbbf01cf2ef17
change-id: 20251201-tdm-idle-slots-10ba92516da4

Best regards,
-- 
James Calligeros <jcalligeros99@gmail.com>


