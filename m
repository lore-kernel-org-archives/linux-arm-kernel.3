Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98130C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 18:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z3rxXlGHbXQONq0nbuDOk1X0SJF+agPubKPIOuTmpB4=; b=GjElnkpeYeoP+LpxfOtml+/7Af
	8sB1GBj8/QPjDZwPIqTVLotKAalB7oZ6H/MktA+CCdXMLBs/9gVGarW9CRLQHT3h80tmNBeydFOkV
	X16HNH1hSXOB3vI/8gqWxrWefLBUGhM8eyHf/yN8AJ1rKRrQ+4jrReI/QK9rfT+88bWhacgLtn6Ac
	e+NY1K4bsuEZwVBVpGYwbecP4GE2GYac5WSkFn2WtLR8h2qHjkELWVISA+ioDUMpUd8qhl6qCnHWg
	ZJvXRiG5GhdGGo2m2N+sN9IlNxLgcZzBo/3z632J7+rm6+JRjK8oWHPsQVKkADQgcBJwwWm8vv99y
	aseo2/iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpraN-0000000DJjC-3CbV;
	Fri, 31 Jul 2026 18:03:55 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpraL-0000000DJiE-1WNM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 18:03:54 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-471eeac43bfso1382473f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 11:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785521031; x=1786125831; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z3rxXlGHbXQONq0nbuDOk1X0SJF+agPubKPIOuTmpB4=;
        b=QUqwvMZjoKRiLJTteW6nH080szBATaQSB7FP14q/ZRmkDNneQms2przQ0HCWFWJ7+o
         AlQ9MG0Xir78oLqlSm7tFWAEtBrB0kv6j7/ITcI1pFfEGN3jiUM/uqa1RMM/A3Wsa734
         xq2lNnsvhacHQLCH5AOKG/436kI5gSYWfcBEUjYka6bjnsdvBqNaethTxCqfH7tim3LD
         BkZLvl5U4dUlNGDABzvTKhcYQ50Hk+ZgueRMoVMKcctke3pM0lvP+quGVgp2EnkRUgnS
         hpk8+s19nnGb7mJAMIWD22kxzHE1inf7zIiOzniKKp5ZSuQUZ2nMewdIPOPuzLsgTn7P
         KPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785521031; x=1786125831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z3rxXlGHbXQONq0nbuDOk1X0SJF+agPubKPIOuTmpB4=;
        b=owTrCF7xosQ6IfNa3ODQApb8bLdd0OGjr0la7idJGroaAW0txzh8dAJuXkVFxXvGf3
         QPX4iyZPkv6XfuNANxUzjTIeX19zG2NgecmgOzKHI3vA4mek86pt5G3UyIQvmAxDhwZB
         V/4K/dqewVGVrA5wuCW6jeARouQH0DakYwKsmZqDazRe9wsT9vSBPPUUyu4TpdK2G+vQ
         +/fQ+hgI2PReGKlK4hYXkixE/jnRh0ZgwfQ0/8Um+FJyL3lCA0vJ4UiHbCdg2VxG8cTI
         2Eyh+vQnHvrb9tacTs9hFTRSZ9KIrNNJrEL3bE0cFsknaDyOm2u8TgN98i1kG5tOGJof
         QbhQ==
X-Forwarded-Encrypted: i=1; AHgh+RrHbFoIsOlKTZ6DOrpfvhuTu2DUv3Mq3Fls6FG1o+Qa42DuDVszx3c0rCrdXfDTFl1ATvCxxn0/lU2CuYS6Utes@lists.infradead.org
X-Gm-Message-State: AOJu0YzLL98uc16T/bj3zu6jD5Z+ily5mo7TNgG75DtwaQV1DKBMcw88
	8vRyKX3cKo3gKdDXbsoPWXgsjpSLde2sZtlo5M5AJq/h3NoZUFvzv8+yX/zLv0Ts
X-Gm-Gg: AR+sD12m3bOg/sG8Bi3/G4BeWVAYDljaNbtYoOedNZPQaY8duvcsnPWS6b4QObPbh/v
	XBsNg+tXLNLfVk01P4eczWO0J94kJO027SDLfbEuwvpsy8pvGmBg4dEChW2S5Uc+DXO+w0f8Zqv
	LDL1BKFdNycWvSh5DA4s9VcdW1sbt2LJbucmvjNrt2oxh2fRdQ1l7DbPYghKtOEvBuaA9H3zLdN
	SJX9YF1rO5IkoQKiyS0qKj8X4BXs8ks+AkhBKOUBrNl6yokvzhz+PEheArJtEd9R4aw4Nz+LikL
	1Sw16ZL+jKViaQK6FwaOTcT53VHobXfdvf1FHS+DC7sVDXiX6+TnuYLHN5no8nQ7cL5sYr7zUDg
	lg+WLQZZthYMLD+T9pzJPmSY6wTEczrqTMVICzcSSEIr1Zh8SBssVccJqXUqP3CpeomBgTjIZhs
	cSRIxjOL2sld8TbW2Vm9PsiFoQazQm82WtrkfbGpTKzw1aEVbOl5JxTfkZ3GcR582AiEp+pWjPR
	b0YTipQ/D4XsTbm7Fq3NsBsKcgkCMixG3frfXVDTlKwymBn8TDVdpjUxsBrY2uMKI8n8G9DGzBt
	Xh4zWKYaohgdvBPTrExVWh9jerxxzHn+EcszJAeyn/WxrV6q8+dSWQI/NaZMqzlgBsKJ
X-Received: by 2002:a05:6000:4693:b0:470:2fb1:3dbc with SMTP id ffacd0b85a97d-47fd72e0638mr836970f8f.35.1785521030885;
        Fri, 31 Jul 2026 11:03:50 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a8d0-bc01-6d31-3d12-3a11-d2d0.310.pool.telefonica.de. [2a02:3100:a8d0:bc01:6d31:3d12:3a11:d2d0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd42d91bfsm7878295f8f.15.2026.07.31.11.03.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 31 Jul 2026 11:03:49 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/5] serial: fix console lifetime bugs on failed bind and removal
Date: Fri, 31 Jul 2026 20:03:43 +0200
Message-Id: <20260731180343.10818-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_110353_413890_DDFCC2D4 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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

This series fixes four serial/tty error-path bugs and an i.MX console
port-table lifetime bug. The fixes were found with failslab fail-nth sweeps
and sysfs bind/unbind sequences under KASAN on QEMU's raspi1ap and
mcimx6ul-evk machines.

Patches 1-4 fix shared serial/tty core code. They move fallible allocations
before console registration, clear pointers after uart_driver registration
fails, and make a non-NULL tty cdev slot mean that the cdev is live.

Patch 5 clears i.MX's devm-allocated port-table entry after failed probe and
removal. It keeps the entry valid through console unregistration, rejects
duplicate lines and serializes table updates against other port probes.

Validation includes fail-nth sweeps on both boards. The i.MX tests also
cover the sibling-probe race, sequential unbind/rebind and
CONFIG_PROVE_LOCKING=y.

Changes in v3:
- Drop Cc: stable from patches 1-4.
- Patch 1: remove redundant uport->name clearing and credit Sashiko's report
  with Reported-by and Closes trailers.
- Split v2 patch 3 into two patches with corresponding Fixes tags.
- Shorten the changelogs.
- Patch 5: use scoped guards, reject occupied slots, remove the unnecessary
  line variable, document the console-callback locking constraint and add a
  backport note.

Changes in v2:
- Patch 4: serialize port registration and removal with imx_uart_ports[]
  updates to close the reported sibling-probe race.
- Patches 1-3 are unchanged.

v2: https://lore.kernel.org/r/20260719221014.44354-1-kmehltretter@gmail.com
v1: https://lore.kernel.org/r/20260719160812.35407-1-kmehltretter@gmail.com

Karl Mehltretter (5):
  serial: core: do fallible allocations before the console can be
    registered
  serial: core: clear freed pointers on uart_register_driver() failure
  tty: skip cdev_del() when no cdev is registered
  tty: clear cdev pointer after cdev_add() failure
  serial: imx: serialize imx_uart_ports[] lifetime

 drivers/tty/serial/imx.c         | 20 +++++++++++++++++---
 drivers/tty/serial/serial_core.c | 32 ++++++++++++++++++--------------
 drivers/tty/tty_io.c             |  6 ++++--
 3 files changed, 39 insertions(+), 19 deletions(-)

-- 
2.53.0

