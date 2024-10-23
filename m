Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971F0CFA452
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 16:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1Vf40W6Eua7BzKpxAO9YSg+KzSm2KmjF6yDdNRZz/fU=; b=X3QCugn7ATB3nuKfFpBopCOnBL
	dUXjRYU7qOGPzuCqS64S4D8C75xSbyLROy2W441UOod7ooXCGFmt23ThceWuudlzYRHDntTRrfODS
	zFK04zQEOnFFc2z2PteLDEcx64SGDkDF82jivZZv2TBMuQ1zWZfJsujcWhGb2oBjC1J33ywooe+u1
	VT+9IuLLu3DdCL3VIBnVFlcVu56WoM3oA86BVD6NgoK6W1smY4usl27p6bZhnZGU+nT07Xl/+ERzd
	D5pSwcCdILP0g8sZRiVOBe7AoY8EH2F6BNy3ZjfxFQOFwYZxMCrlvS7MkU/y/l7uERaBPO7yNd7PQ
	s1D0OCtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ehT-0000000FGJ8-1s4D;
	Wed, 23 Oct 2024 16:59:11 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3e7J-0000000F7Zw-3iuN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:21:55 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5c9693dc739so9247872a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 09:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729700507; x=1730305307; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Vf40W6Eua7BzKpxAO9YSg+KzSm2KmjF6yDdNRZz/fU=;
        b=G/LQxhnp1sLnAtS25YiLW0+fLi1mbWgUSbXY1fgxYbtNhPaFVyrJP/HBKgGBULbq1O
         psP3Vygx5/3Y6z7cPkERnij+1snaihzWUmNmz8K/b/WmQeG0JH+7cjEPsTai4RXfRyEB
         gkrWDJq1ws7mn0EPDqwx/tid5o5qVsf3ReUsncvxi2xuJ3nNy77gKUni/W4b83s9KMlV
         SvYgqlI94plgaFYjQgm1Q5ExVb6D+FG69h2zrt5aI2cTCtwq2L8AznssfT51x1lwfhLD
         G0y+M3FFkJ/zJNSEog/C2OxW3BoJitNnk7WvRCEzXTApnqM4CKWpgTnHXZKyWba9rRZi
         4Paw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729700507; x=1730305307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Vf40W6Eua7BzKpxAO9YSg+KzSm2KmjF6yDdNRZz/fU=;
        b=q+CzG3xPC8XPEQm8ySl7UgPdKr1dNPSrgZEpwYvYrVOlxEDpKaRlnjTR86QLvbBPxm
         MU1wOY8fFFxjnSTTS9ep/SM1DbURHp25sLDmLJ2jAtDPAToDGFv2Pwhq++kRobX2TTcU
         SwLyl7YqDxG+MA5hP2D7nwfkl6+Z45S028+FxrPhMFLiLGA24tnetdIPRvo4H2f7Sz/+
         UK+id+gY0uzm+z33/FBU7fekdfHndxKqDaAOjQGAEvO9TQ7yjcJKlyhytPDjBcUJd4dU
         l7V63U/Uof3w9eOP0K719GHUu+kQz5QEAoe+cGhvmyDkOT7Ecx2MJWMtyZW00DZDPnXU
         hY/w==
X-Forwarded-Encrypted: i=1; AJvYcCXIjSlV9cPfnsE94NPPeH+Q9EiR9qSlxtxNWGti/pLXuuDUyVrJFHe1x823/17yYAcyYOZXpjEs97C1HGHgnbQT@lists.infradead.org
X-Gm-Message-State: AOJu0Yxg5pceIqUYD7HrGdHdtXsZOBgCIPK+dmownG/Nz0Wg+Q772/gW
	S8Jusx+fjEA0REjCqCj7rgVfKRla2TlJ5e+vHQOmkwKwqwRhZ7KL
X-Google-Smtp-Source: AGHT+IForx6JPsSbHDkt5X0lZS/onUnpIaCr/eo5xEqs96eIQlISvbsCKmy4d2uWYSjBJfz4rft5SQ==
X-Received: by 2002:a05:6402:2706:b0:5cb:666e:a3be with SMTP id 4fb4d7f45d1cf-5cb8b09884bmr2230032a12.9.1729700507289;
        Wed, 23 Oct 2024 09:21:47 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66c72609sm4588382a12.88.2024.10.23.09.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:21:46 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	sound-open-firmware@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] add sof support on imx95
Date: Wed, 23 Oct 2024 12:21:10 -0400
Message-Id: <20241023162114.3354-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_092150_407535_6E7BBF50 
X-CRM114-Status: GOOD (  11.95  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add sof support on imx95. This series also includes some changes to
the audio-graph-card2 binding required for the support.

Laurentiu Mihalcea (4):
  dt-bindings: remoteproc: fsl,imx-rproc: add new compatible
  ASoC: dt-bindings: audio-graph-card2: add widgets and hp-det-gpios
    support
  ASoC: SOF: imx: add driver for imx95
  arm64: dts: imx: add imx95 dts for sof

 .../bindings/remoteproc/fsl,imx-rproc.yaml    |  58 ++-
 .../bindings/sound/audio-graph-card2.yaml     |   9 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx95-19x19-evk-sof.dts     |  86 ++++
 sound/soc/sof/imx/Kconfig                     |   8 +
 sound/soc/sof/imx/Makefile                    |   2 +
 sound/soc/sof/imx/imx95.c                     | 383 ++++++++++++++++++
 7 files changed, 542 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
 create mode 100644 sound/soc/sof/imx/imx95.c

-- 
2.34.1


