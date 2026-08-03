Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE49FC55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 15:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ocbZUo7zpFmSLPbwfUgNYrUI1VbSx+D5BmbZxXmpAkw=; b=mk4IWhhgaRPnGpXEnH2A5DvYs3
	hXUlFj9CIILNmh106mZAa8ocq1j0cgFBRiNN3xDqbZK+8ABAZ+1ZyRmO571uzXVlD6R161LU8/N/J
	YfngeUVzYo/WAPZxTRdtHkr9MRXf6/rHCrvvUnYZDddrXCzXUOI9KfLhGXYcvRgUg6K2+ZBYIgxo4
	7XC72bE9lVAFNI47t6dvinavtrmlVakUXTFEabDQQkeoUID0fYg2dcZPrKSeHWBbQLHVmgZzVAI4I
	+/lG/zIU2eoSDAnuVO5mKNyA8PHhT/VPYB3+oi1cZmWdSmE29WwZcVUbBee9IQAoVeybO6zHygP12
	4YxXZQ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquwt-0000000Ha7A-19DV;
	Mon, 03 Aug 2026 15:51:31 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquwq-0000000Ha6g-48mm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 15:51:30 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2cf452def93so203035ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 08:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785772288; x=1786377088; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:subject:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ocbZUo7zpFmSLPbwfUgNYrUI1VbSx+D5BmbZxXmpAkw=;
        b=mszNShA9d+0NapU3tzaRCadAYWg7K5FGy6S100HCWnyN3Pb83QWwQ/xu+xLrgaYfcm
         QEO+qXC5J+ycKkD3miZmTpLAnv/9MkBNbMys25+yJos33iKcqa1Y+oFoIqSAw6/SO1dw
         tiplkMlVRU/O6hYux2lpaZxsOWCiSNOAly2XI/cZO9KEvnkbyB3ZXXbl3A/s2hpTVh8b
         tnage6qEfFsbjvxd/OgSb2iMb/QfMqcv9WXm+X7k0r5imH79S43qlGkEaGsrPe6xl7En
         aMI1uMxtn+ONTe6vBknorJL2ojzS5r62ibdfQ7BP6wmWxccCnflYvt6oDk7SfofphYz/
         dDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785772288; x=1786377088;
        h=content-type:mime-version:message-id:date:subject:cc:to:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ocbZUo7zpFmSLPbwfUgNYrUI1VbSx+D5BmbZxXmpAkw=;
        b=A5BqWapw3gT4zr3aC6E+fHPv4Yv/4YTxQLp/iGa1BnY9nKJLkcFJrcpdL3ysg3KBuf
         jDWnAbePYDtLIpxTUJeYXOwAn7PTWeza+Qw+wRggf/7I6yUatC6OotgEeMTXu2p0rWow
         GVZlOkqa8a0PWC8LJE1MZywdCeOpAuPDVl3LY0djedjcCJ5VQDxgcEV3+gPPaXmqMcBB
         4miqnO5sibSyD0O5+awR6GkIOqx3HdH9zhTo6T0dx3Upmik8lp39wv+2c11gixDUadj3
         ut01DIbEz8+pIyTcuDH3X4VGkV9WEqigiyU2pPXNziYpoO8rTghzoFsbBAKyeKmjkfe3
         1aYQ==
X-Forwarded-Encrypted: i=1; AHgh+RrgRDoFVIgUkTxoGYOyugLGzBgULb1kpo9AgSv0lwOhCxA2vzTS6H+FvxWfBEXKTmjc4k75PwMX7U/bsRTrXV1K@lists.infradead.org
X-Gm-Message-State: AOJu0Yxxp1mGoJHe3zNjBY0DPsknQXqm//CP1frV/VYM+j+tFFdysjc8
	zUoBDq/1XKIl8OdTql9hVv2GrqMGppRk+5o+34f3lgBRd9egGLmnYa/w0jmT2lHcpi0=
X-Gm-Gg: AR+sD11Gh+PSBE4AzW1Botqul7KRcCM+5BHOvc5C6fi67slMIPBdyyrP3mcMCo86kX0
	YAsYJOYF3YQJoxfqCPLPcNMlHf4acCHhUIny2nZCQI1SSkSgyaOi+T1c1OAgGBQ7gpBi6xBI8EB
	N3xHNUTw6+jZ+ZDhgjiuucR5sJXMxOyTZa+bp/XnR7E5ZfQqaYDioLzrwyjwGUnSo/1FJ8a8AFy
	Qv3eZt5Q/q4RExBIyW+0PBh48bUrbAMx//Sr/JFFOrjCL3/CaJQqUYBUZ0482qEHTeNkpbJ8yqB
	hUG6bSi/V8F0q6sJ4CFZtma4WGKMtI2K53mxzf+4uVu952cNu2Bd8Gp4vtmK8i/QT5IzuMWDbzx
	/K1vLeVWytQBbekVgzfmHgJcHPHmWv/pG3mgbcVG6MqeUqKL3FSvFx8HAHSssngWN1087XjLRqa
	j0ZAcm26zfRZ/YKvXk370mTVFekwYmEczv79y2M6/CbOQp9rIViBLJrcEsZw==
X-Received: by 2002:a17:902:c40d:b0:2cf:8aa7:7810 with SMTP id d9443c01a7336-2d08aa1b175mr521585ad.2.1785772287919;
        Mon, 03 Aug 2026 08:51:27 -0700 (PDT)
Received: from localhost ([71.212.202.210])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2d04b15d27asm39967845ad.78.2026.08.03.08.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 08:51:27 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: dts: OMAP updates for v7.3
Date: Mon, 03 Aug 2026 08:51:27 -0700
Message-ID: <7hbjbjjj7k.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_085129_048147_E470D7CD 
X-CRM114-Status: GOOD (  10.99  )
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

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v7.3/dt-signed

for you to fetch changes up to 36d3d0f740d75dc0274b72720c044f476ff0e242:

  ARM: dts: ti/omap: embt2ws: use mulit-led for RGB LED (2026-07-06 11:40:17 -0700)

----------------------------------------------------------------
ARM: dts: OMAP updates for v7.3
- DT support for PRU-ICSS on AM3/4/5
- minor fixes & cleanups

----------------------------------------------------------------
Andreas Kemnade (1):
      ARM: dts: ti/omap: embt2ws: use mulit-led for RGB LED

Krzysztof Kozlowski (2):
      ARM: dts: ti: Add specific compatibles for SCM conf nodes
      ARM: dts: ti: omap: Correct indentation

Roger Quadros (3):
      arm: dts: ti: Add device tree support for PRU-ICSS on AM57xx
      arm: dts: ti: Add device tree support for PRU-ICSS on AM437x
      arm: dts: ti: Add device tree support for PRU-ICSS on AM335x

Thomas Richard (1):
      ARM: dts: ti: var-som-om44: Add USB Ethernet controller node

Vidhu Sarwal (1):
      ARM: dts: ti: Fix typos in comments

 arch/arm/boot/dts/ti/davinci/da850-lcdk.dts                |   2 +-
 arch/arm/boot/dts/ti/omap/Makefile                         |   4 +++
 arch/arm/boot/dts/ti/omap/am335x-icev2-prueth-overlay.dtso | 156 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi                   |  15 ++++++++--
 arch/arm/boot/dts/ti/omap/am3517-evm.dts                   |   2 +-
 arch/arm/boot/dts/ti/omap/am4372.dtsi                      |  11 +++++++
 arch/arm/boot/dts/ti/omap/am437x-idk-evm.dts               | 103 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 arch/arm/boot/dts/ti/omap/am437x-l4.dtsi                   |   2 +-
 arch/arm/boot/dts/ti/omap/am57-pruss.dtsi                  |  11 +++++++
 arch/arm/boot/dts/ti/omap/am571x-idk.dts                   |   8 ++++-
 arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts          |   2 +-
 arch/arm/boot/dts/ti/omap/am572x-idk.dts                   |  10 ++++---
 arch/arm/boot/dts/ti/omap/am574x-idk.dts                   |  10 ++++---
 arch/arm/boot/dts/ti/omap/am57xx-idk-common.dtsi           |  61 ++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/ti/omap/dm8148-evm.dts                   |   4 +--
 arch/arm/boot/dts/ti/omap/dm814x.dtsi                      |   2 +-
 arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi               |   2 +-
 arch/arm/boot/dts/ti/omap/dm816x.dtsi                      |   2 +-
 arch/arm/boot/dts/ti/omap/dra7-l4.dtsi                     |   4 +--
 arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi    |  10 +++----
 arch/arm/boot/dts/ti/omap/omap2430.dtsi                    |   2 +-
 arch/arm/boot/dts/ti/omap/omap3-cm-t3x30.dtsi              |   2 +-
 arch/arm/boot/dts/ti/omap/omap3-n950-n9.dtsi               |   2 +-
 arch/arm/boot/dts/ti/omap/omap3-overo-common-lcd35.dtsi    |   2 +-
 arch/arm/boot/dts/ti/omap/omap3-overo-common-lcd43.dtsi    |   2 +-
 arch/arm/boot/dts/ti/omap/omap3.dtsi                       |   2 +-
 arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts          |  13 +++++++--
 arch/arm/boot/dts/ti/omap/omap4-l4.dtsi                    |   2 +-
 arch/arm/boot/dts/ti/omap/omap4-panda-es.dts               |   2 +-
 arch/arm/boot/dts/ti/omap/omap4-var-som-om44.dtsi          |  14 +++++++++
 arch/arm/boot/dts/ti/omap/omap5-l4.dtsi                    |   6 ++--
 31 files changed, 428 insertions(+), 42 deletions(-)
 create mode 100644 arch/arm/boot/dts/ti/omap/am335x-icev2-prueth-overlay.dtso

