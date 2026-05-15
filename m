Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CACCD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 15:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iCaqo1MKwSw4Wk2AfYX46XSUhbdW1Kp79bGu2CD4qM8=; b=tOpM6iYO8qf4mb
	Ue+KIl4Wz5Rjkr4hP3W4Bap1EWTxmeXTcO0HytuKkkt6AgtowRPFtIHqgmdNYOqG25F645wUGDnr0
	YwvmHCDW1MwLMpyiv4cD4gwmKFKD1Zfo54OCK4479HF7qmOQVHsDCaWCMneZW14/V344BzHtXad1a
	nInpl2+deEyXdCt6EfBoxpoo+84gBPe2zlrTyUrBwEUrt7u7+vIFZO4NpDyI8uE3YCGtGoeeRxadQ
	N5MQNP34rHTPZSIOyXGdBhnws//Fc6fihhMnAHODmT9dPi+QqbmWLlnt5G/If4FXNv1aI02kkz1WU
	w9oMLQ5uIDOOC2XM/Tpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuC8-00000008f84-0ni7;
	Fri, 15 May 2026 15:11:20 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuC4-00000008f6R-2zKA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 15:11:18 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-43fe608cb92so5870023f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 08:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778857874; x=1779462674; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iCaqo1MKwSw4Wk2AfYX46XSUhbdW1Kp79bGu2CD4qM8=;
        b=hkQAn1V/i8LJfRvPf2KYLwZefVqYZRc222nQPr/gmOMqYdmOTmYOK/2qxYwLoJ5KJQ
         FWIeP6dKAeXcp9wqR5daw+sRexqdHB9vf8xa8+aTRx74vNg4JGI1TXta8v3c9Ew7RteA
         6I9vFRo6Miv55xA9oi3BXzGEvtIS2+eEVWTLIxrlzqh4R110Dp7BbWAOZIoieyOfbuAn
         9HskH4FYxa6xNRT2G62RdMDjKTNbypV/iw6Ot+ihJP8XTE9En/jjIfXSL5CYabaWxFeX
         RcVQS1lJE1BeAZ20pwdYld/zTZPLNEUV2vfHLcNjz4JifW7azuwkbBAhJ1gXAUopxwoE
         U6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778857874; x=1779462674;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iCaqo1MKwSw4Wk2AfYX46XSUhbdW1Kp79bGu2CD4qM8=;
        b=VgiucxYXvnbNwiT+eZEGMHHrOl+MwlLXSgLT9SIAkSYFvJkEALlFwEE3yYig2TIVOp
         D2TlGL3qFPcwF+OP0pt7WFSYTXPnwax4vWc1jtLpTmaF6JlPM/FCFd7jcAVALMth3qom
         fSsO5lhTNCPTfYCOSOZVfYT3+dh40yKXkzJmuQ0qlo5pOBmkgqGK1yScQvm3wdjHzvX8
         nSKd4zDJaZLeGGuzpgzY3gwqjZONl4URrjcXF6QQsTfoXT4+VlKC5Eg9YRAoHEh74S0v
         ihfjX79GisJvdv/rG0odJ500ADuCtTiHKqDmxHZQQFvaZfIeeAjhnGh3VgeB6inDV1N0
         KMUw==
X-Forwarded-Encrypted: i=1; AFNElJ+EampwNr+FxXAXBDJIyENXiK+HY4o3azlML169FRk2AKWCFuP2/LVZ3pLobPxkYffF+LOf2DbPz7ROT31xXdAe@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3enFFJ4pKE6oF/9rqXTwhpXScirOLThqyibvkDvQ8O8g7fpL3
	BieGs5lJBl9wSqc8Lfl4ZkI0hT5yJgwE1zJui6ZwsxFxxoI60lWSSAQWQyhAacwcBec=
X-Gm-Gg: Acq92OGXY2+bF4jAu3Q4qXZ/HHLAXNBAeOLUZQPhcFL8uK4Oz86ut2OvuBQpvmsR9Y2
	3cu1cvDyrQqYvnh3CXvQsdUOPk1xHmFwG/IvDbcepqa3/jQIM9c1YB+cyCtCY43mz7R8A/J5pNC
	U5Io6sAXJxknQJyYn7XKZlnBY2ZEBbdgxPR8QEx6FTpZwQYduhX/copm0Zk3h+jpl4PvRd/bqPs
	FIVrqBAaUmA7jXf3Ic3LoW5HAJHHD6FzJURZahF+WvmTESg5nWlyvCxjqQLrE55XF2YoKI2+nG6
	drwVHj+UYYgv4ExLaAYOwYWsDngBWeyw4wloWIQYEOIxm4ztWuo36IuzRDTOo7GleCWhDhwMmjc
	jKTvx4Q0XKPvhQblNIjhkn7GMXd+Q2o8mJ697EiFYCcse0qItvqDt4wYPgLTHZ+kOYhJ2Pb0psS
	Ir7pGB7CliKHiQDMVHxQZ7
X-Received: by 2002:a05:6000:2011:b0:45a:d2b0:7be8 with SMTP id ffacd0b85a97d-45e5c589e5amr5705520f8f.14.1778857874048;
        Fri, 15 May 2026 08:11:14 -0700 (PDT)
Received: from [127.0.1.1] ([151.41.223.93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a19c2dsm15262062f8f.21.2026.05.15.08.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 08:11:13 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH 0/4] ASoC: meson: aiu: align I2S design to the AXG one
Date: Fri, 15 May 2026 17:10:36 +0200
Message-Id: <20260515-reshape-aiu-as-axg-v1-0-53b457784ff3@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGw3B2oC/x3MMQqAMAxA0atIZgOtRUWvIg6hjZpFJUERpHe3O
 L7h/xeMVdhgrF5QvsXk2At8XUHcaF8ZJRVD45rOtb5FZdvoZCS5kAzpWdEnioMLfaQUoISn8iL
 PP53mnD/RI4BOZAAAAA==
X-Change-ID: 20260515-reshape-aiu-as-axg-1dac9037cad3
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2819; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=5ZZPJ3XMPQ41fzz63UvCOXZMzSqThcABEgMu/nPg1ZQ=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDFns5v1LBWvmv26e6jLPpy80UFxITrX0sV6CC/Mb7Sxt5
 iuZRas7SlkYxDgYZMUUWVim3/tdUKr20DjhZAHMHFYmkCEMXJwCMJHocwx/OC9MNJZefL9qC6f5
 5FbRTzfm6OzqXXlCozL3w6N0qbSms4wM3QopiZEr9tTVHzrBLqPxK/X3UvsDny8aB/itWa0puPs
 zIwA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_081116_900729_5B9AF5AA 
X-CRM114-Status: GOOD (  13.94  )
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

This is the first follow-up patch series based on RFC [1]. The goal here
is simply to reshape Amlogic GX's AIU implementation for I2S to follow
the same design as in AXG's TDM. Keeping the same design allows for
unifying the two platform implementations in the future.

The first commit introduces gx-formatter as the basic block which takes
care of properly formatting audio data. Formatters are DAPM widgets
(c.f. axg-tdm-formatter in AXG) which are dynamically attached/detached
to the streams when the latters starts/stop, respectively.
aiu-formatter-i2s is introduced as formatter implementation for the i2s
output.

By the end aiu-encoder-i2s will only need to handle interface clocks and
enforce interface wide rate symmetry (c.f axg-tdm-interface on the AXG
platform). Right now rate symmetry is not relevant because only i2s output
is supported, but it will become useful when following patch series will
introduce the i2s input part.

This series was tested on an OdroidC2 board (Amlogic S905 SOC) with an
NXP SGTL5000 codec connected to its I2S input port.

Changes from RFC:
- Use devm_ variant of snd_soc_register_component in gx_formatte_probe.
- Return on failures in aiu_encoder_i2s_set_sysclk.
- MCLK and i2s_divider clocks enablement moved from hw_params() to
  prepare(). Stream's "clk_enabled" is used as simple refcounting to
  prevent multiple enable/disable.
- Improved the mechanism to ensure rate symmetry on the interface.
  Previous implementation had issues with alsaloop when both capture and
  playback streams are opened before any hw_params is set on any of them.

Thanks to Mark Brown and Jerome Brunet for the review of the RFC.

[1]: https://lore.kernel.org/linux-sound/20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com/

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
Valerio Setti (4):
      ASoC: meson: gx: add gx-formatter and gx-interface
      ASoC: meson: aiu-encoder-i2s: use gx_iface and gx_stream structures
      ASoC: meson: aiu: introduce I2S output formatter
      ASoC: meson: aiu: use aiu-formatter-i2s to format I2S output data

 sound/soc/meson/Makefile            |   2 +
 sound/soc/meson/aiu-encoder-i2s.c   | 250 +++++++++++++++++++++-----------
 sound/soc/meson/aiu-formatter-i2s.c | 106 ++++++++++++++
 sound/soc/meson/aiu.c               |  30 +++-
 sound/soc/meson/aiu.h               |   4 +
 sound/soc/meson/gx-formatter.c      | 277 ++++++++++++++++++++++++++++++++++++
 sound/soc/meson/gx-formatter.h      |  47 ++++++
 sound/soc/meson/gx-interface.h      |  45 ++++++
 8 files changed, 675 insertions(+), 86 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260515-reshape-aiu-as-axg-1dac9037cad3

Best regards,
-- 
Valerio Setti <vsetti@baylibre.com>


