Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C930CD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 11:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W3r95IPdKLEoIca50s981PYU1XFf+JhCBe7GdZYnQ8c=; b=O62X5R6CAZgil+kHOSmp3htg1e
	cI0ZhxBLPbZGdOkFR+1fPsxwe1wd+HlHo3by4g3I4E+AZJ7S9Cen+nrlC3mbRY3zBmFqyRLZvMvxc
	IL6UfMTpvVvG6rxh9qlZtz+LRCN0HO6DTh8wDJhzgZ9+fsHgySDj1zS5jfG1vWh1kuKo1xMFbfjgP
	3mJ5lh4Y9G+nZPU7IfdBduPzR84crlTlzrN/jQj8vfw27kLrkCDi0aADlJ/skwD8KqzRCXJDaPIKi
	yP9zkZH54u6gmgqHnrk+JEFXwVLgQHwlX1c5W2uDoHAUrUfWtkIq0Fl8Eo/KZUN/iNP74KyWKY8Ea
	j3Vl1b5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVSsB-00000000YZB-0XjN;
	Fri, 05 Jun 2026 11:37:59 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVSs8-00000000YYK-2hd7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 11:37:57 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-45fd464d51fso1037201f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 04:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780659475; x=1781264275; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W3r95IPdKLEoIca50s981PYU1XFf+JhCBe7GdZYnQ8c=;
        b=dovOitHkirSqfdYHGNqaYL3FBSj7WN/TQ1dzjqu9Lf7ZWjiLhoSeAsi2BHm2Gqxtoy
         JKi7JvRHw1mdQVwiQ8ARRpzcw4A/cN97redi5a4XbfeEjz1br5q0Qkqw4806Knz0soi1
         vZ0qO2ITJwMzhNuh1fWV0bjvun/xAdcJr+Qf5Z8rGkxIVSNwQYVOqKkqHcM6TbmSUuiC
         Nq5/GidJqoA0XlMYRDN8VE1j8WZd7X3K/kjvCO0fwn6AcuX07jLG6yx21uAYsGns8AQ/
         d7bzopMdkc4bRZSp5SE/DVNmFT+KWW9YKIAgYOiMvqeIxqmJwykDgCgxPN51d/wCQkgf
         7EyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780659475; x=1781264275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W3r95IPdKLEoIca50s981PYU1XFf+JhCBe7GdZYnQ8c=;
        b=SyONeqa6CvVYwCHtQ2gMJMHBKGDTgDVO1TDmQ3utskP1JVVJ4Jb1dNLT9uIMmclI5k
         ft2GKU2qbBbd0qqkWVvsZjeDvyUIQwo/LR1omBvG8sp8R5omAhrdzzcST4OW8ckJuQNK
         g/DXgneh4sBcDBB2SNi2q8yOiRhzNJzU2F5Lena7eNs2qhO0MspSkE9qAwpzOz7PYjHd
         O2aEKiZDHiSTFXuQbeZDjEljRrj+3Sb2iz8Apz/1YLxnLcaziZNtLbZlzt607ezOt68H
         8m6G6f5GBrOHXYHNuv2DQGSSuU2IOqq9ryndQJiM6DsNBeoboD0tpMcZk7gquAHRC1kU
         MyqQ==
X-Forwarded-Encrypted: i=1; AFNElJ8uYR8Jln6EBPQuL7sEaGwoI9HSbiwhkdMcFKK7jX6hGOTPe86/B14CustjYxShObl6SJiOc1/yPWUA82mCvgQm@lists.infradead.org
X-Gm-Message-State: AOJu0YxoOiCHoOtdWIszzfNoct5ekrNYFTjLGxJM1K05QyJEg0DCf5PV
	w7kkklNjBIwM0wL8BSeRcjdaafD9bd5FkPi2ZJytvECsKckiqTS45kixUPJhX++w
X-Gm-Gg: Acq92OH88yTP8/QuwA1BYRQH5cJhES4/X6qyn8zJjxhZdV9s5tjzu4SYxU9OBVO4fw8
	5VSjkDPR8OJgLm4VuIxHg03Snk0lscplgD6Cp2fbUbJavT3lX8YCR/CDNsZ/UPzqORWtjthPZsy
	fp/a+aawOOxBXmHDerZgErqvKTcZPoLloZUdVFKYIL/RySvBoacAvgojDBEgbrl0hpoecAewWsm
	oNofhsxxBrFPdbpwv+bAB7q8Yl5hJPzLHco3Uf2BI8Ib08Iu60C7MwigSiGsP7iN8RJz9X9fB9/
	JNd0IOdyBgUb5yHsNvPBrN3IQ2Au37OokpJprylQOKajikpSBcN/Zdmc/T2DIELX8Z+/jPDOXnJ
	K1AEk3qRnW2T4dFd0yEmR0DOHSFKo7+40qGiUzeuO71vMc6j0nUrgpsHQ/SQOMjRIVQ6m9RDd6C
	wc3ejMaFJ3gwhNXeIHNlONnaqyOvR3eAO/pUsObiQx+KIIkT78rJRU5sIOLpnt
X-Received: by 2002:a05:6000:bce:b0:45f:f142:d56e with SMTP id ffacd0b85a97d-460302e4674mr4256841f8f.13.1780659474765;
        Fri, 05 Jun 2026 04:37:54 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46028a6dcbdsm15262439f8f.7.2026.06.05.04.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:37:54 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] Add RPROC support for the MX95-15x15-FRDM board
Date: Fri,  5 Jun 2026 04:36:17 -0700
Message-ID: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_043756_704379_7094A2E0 
X-CRM114-Status: GOOD (  19.02  )
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

Hi folks,

As you can see from the title, this series attempts to introduce/enable
RPROC support for the MX95-15x15-FRDM board.

For a while now, the imx_rproc driver has been using the reserved memory
DT nodes as the carveout names, which would force DT writers to go against
the DT specification's recommendation and use non-generic names (e.g.
"vdev0vring0", "vdev0vring1", etc...). This series also tries to fix this
issue by introducing the "memory-region-names" property and using it in
the imx_rproc driver to figure out the carveout names. The driver will
still allow the old way of doing things (i.e. no "memory-region-names"
property) but a warning will now be printed since this should be
discouraged.

---

Changes in v2:

* change commit message of binding patch to describe why it's needed
* drop restrictions on the string names passed via "memory-region-names"
* drop patch moving the CM7 node to the SoC DTSI. CM7 node is now added
in the RPMSG DT overlay
* rewrite commit message of patch removing some of the RMEM regions from
the bord DTS - previous version was a stale version from first iterations
of this series
* change "micfil" node status from "disabled" to "reserved"
* add check against rmem phandle count and string count mismatch
* include "of_reserved_mem.h" in "imx_rproc.h" to avoid having to rely on
the consumers including it

---

Laurentiu Mihalcea (4):
  dt-bindings: remoteproc: imx_rproc: document optional
    "memory-region-names"
  remoteproc: imx_rpoc: fix carveout name parsing
  arm64: dts: freescale: imx95-15x15-frdm: remove some rmem regions
  arm64: dts: freescale: add DT overlay for MX95-15x15-FRDM RPMSG usage

 .../bindings/remoteproc/fsl,imx-rproc.yaml    |  4 ++
 arch/arm64/boot/dts/freescale/Makefile        |  3 +
 .../dts/freescale/imx95-15x15-frdm-rpmsg.dtso | 67 +++++++++++++++++++
 .../boot/dts/freescale/imx95-15x15-frdm.dts   | 21 ------
 drivers/remoteproc/imx_rproc.c                | 13 +++-
 drivers/remoteproc/imx_rproc.h                | 21 ++++++
 6 files changed, 106 insertions(+), 23 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso

-- 
2.43.0


