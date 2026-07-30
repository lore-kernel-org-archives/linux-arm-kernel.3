Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A61C55160
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 16:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+U3DZ1HplugeFRpi+HpxktJDAxC1H6qsK7+9CLEzYsM=; b=cmE97xvXo8OiVOoT9zE9Cnf6Ze
	ZoRIQ9ogGeDMx8MiGNHVI4lOidx2ZP+7eQWowHfFDScaeT/uLAWn/XNvwMjpIRsOpwev/l3Aqy+N+
	gYKr44XUhgJJxlwa8e0tVNrtyfNx+0/IYLuk2U5JnIoUK/YRRKAat+0BxHT3z2hB7NOjLgcS8Pl5G
	E+P4ItoDuZk615ynJzgxxAn9GNfmimmdjGp0Hf3VaK5owQOC5F4lQbslSpmNm3Le+wPaq3u4hV3IG
	s0zwzoeoCq9r1btHxvQJxB5v4TXLGg/9oCH94mQhoCA79Fmx8LZOm7z9AaM9RMCjEgXcQQIDDzf2R
	K4PpOI6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTj8-0000000B0XV-3p6x;
	Thu, 30 Jul 2026 16:35:22 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTj6-0000000B0Vw-1sIG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 16:35:21 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-47de008b020so661882f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 09:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785429318; x=1786034118; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+U3DZ1HplugeFRpi+HpxktJDAxC1H6qsK7+9CLEzYsM=;
        b=c+SAv1KSX7bTsvEcLJrGwS+Yhb8zlhnJEFxFq7tgNWa4frSdKvlk5dFeOOFfAotG/C
         KqYLXT48vSePKEk/SM8i4CP0XJy7xSnmgX0hXb40bax/f8uh27I7DGVUgCsuAumHJatY
         uw8NOP1p+9qL0FLqAmgZ1h8/pmeqarQpTC9X7wT9bvZcNsVtlQ3naBtjnLTWdlQdiQaZ
         LhBvjPu8CVol5mNw5YGClT6U9m68HqAhxIvunS3kSEQjmGDTndaC2gaWX5YsI7Q2cO0n
         DHF0EaPlXlaoR5yLU/G97cTv7SKXTDe4CbQ4kMSZQG+Yi5yl5z7DLVPD+9PBuVb7Ve16
         312Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429318; x=1786034118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+U3DZ1HplugeFRpi+HpxktJDAxC1H6qsK7+9CLEzYsM=;
        b=DPQ5ARKFAY9R7EKRuh2Eibijiwtf5Uu3HAbpAfkbZVsAtP16M1AdYXmF3uAbOIX1bA
         fuUJfD1CLefhV7mrSQfJyGC50m8hSohmTrFnf8RCnCWTEOyRlMoltzhhfntpHeiqeGYn
         D2guOBG4639zIE3ka5643P03eBaWtWacnqte6DlkIgWVJTZ3Qw7qLYsEUB3jJV6OV65z
         rCDMmls0R7VP/rG/Ndt4/CvrV+R5tqMSmCd35VRRJ14Yvc6090LcMZhp52Bb7vAdo7WT
         QxG6zer9triGhqpp1fNbQbs46H4CpG/RUMIyRZuDE8TmmzdYdXnAC4bqmYsnMGT8EUHI
         N7dg==
X-Forwarded-Encrypted: i=1; AHgh+RrVdEUhJwltrV6YVtNxpJ22J4e5cMvmIQqgSSxenoR84z6UnVIM8pttx9jdsFbYlKpE4xDrd/qNFS/7RW3Y8YAU@lists.infradead.org
X-Gm-Message-State: AOJu0Yxpq+z0X5/FVKC0F8g/CDuTCK9EG4dR7ffeDsMgR7oLBmIgRTug
	Q9Ig3PsuimFraBGTNGSCFukfQ5f483is+NKh+9dIIcczvAsYhUCEG3Kx
X-Gm-Gg: AR+sD12yGWJQiHilgFP6gsB7Ljz8Uj+gxwN9JYFZB073teIs+A7B/AMdWoHvyObAbey
	+LWRg8PhViKzxdksg9WBWQ5sRGBeV8P04MMNBuHmcP0KKaGeQvnLuMnfziloVJtlHq3y8S8LMGb
	RwNRYrtU6Wwtd+Ujc0t0kEikPkqKqRHzfmet5RVxSZ6hGp4SjPNvufsQIgaAHSc0J81eKcqOu1R
	1DMviPWaaqkLr95ZoboIE3UGIzziBOc2qBJ4Y/BUdKNQ7eEwypDmBBl/JbJsrCeir8MwUQdzCGv
	sCb0Y25Sowy/fVhkOC8BiICZK9r1pHrCl29Sbyj/RCqMsITQKtQ1maRRlngl/LBaP1R/4XkQOqf
	0ROy3mOkovddnHEIh8ESMJdZFyuGL887P+CkL8U4sc752YgCZEzPDBit8OqgJJvyrXGHzQrFYy5
	J082aKqcGpcsArLP5XzsN9rz00sNplqeBiG1+b7eBGYACw0g8ba/51AOGEq77kJqBw1MaykbPld
	S2epX3e/5UdQQ==
X-Received: by 2002:a5d:5f48:0:b0:47f:9208:9e4 with SMTP id ffacd0b85a97d-47fcbdcbf32mr1850867f8f.31.1785429317752;
        Thu, 30 Jul 2026 09:35:17 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc892cdeasm7758445f8f.22.2026.07.30.09.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:35:17 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] Add RPROC support for the MX95-15x15-FRDM board
Date: Thu, 30 Jul 2026 09:34:08 -0700
Message-ID: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_093520_693795_D9B840A4 
X-CRM114-Status: GOOD (  19.99  )
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

Changes in v3:

* kept the DT binding patch because it fixes the ABI problem pointed out
by Frank. Modified the commit message to reflect this.
* link to v2: https://lore.kernel.org/lkml/20260605113621.1479-1-laurentiumihalcea111@gmail.com/

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
2.53.0


