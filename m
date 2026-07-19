Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC71C44512
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 22:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uvinVPUoJhsV28WHeBTxSrSEvMvTNBW/BR+fiFjpbyw=; b=g0pSWykHPxJmpmdgeJUX864gEf
	4bwhV89rdDTptTMMNB84SMCrlpgeAGj77AVxtDGqFR3ObjxTa/42Y6ERUA27DHDPNxUGhKVorfsOY
	o/g5xH2liV8oEoo7dh+RMf/ps4Wbnze5d9cN0lpoMPNOe0llEPyDLFtk5ANlCiAaPUXha9RtZPDkk
	yDd2R+jz90FSMhrF5zPpBjSq0ow8dgaAk4il21jGOdgD3ui91GnT9bbOmJda9be5wMVqomlwm64yw
	ha9+/Pe12S/jIlfZh1oKes/D+DReQXi+Ai9IuDV+f5aO9LXSsiyDV80lzwoqGsZmBMZpqdGJzMTaL
	bDC8ebOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlZiU-00000005Pqc-1URX;
	Sun, 19 Jul 2026 22:10:34 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlZiS-00000005PqF-2mVY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 22:10:33 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-47f71156e1aso352506f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 15:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784499030; x=1785103830; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uvinVPUoJhsV28WHeBTxSrSEvMvTNBW/BR+fiFjpbyw=;
        b=e2prPPCKS0dMpAS2lbnSD02cwlTzSZubeffKJwGNUfQbjIhE28x3AopzxuQiNMFtlw
         1jccdvucM1kADiPoYfPMol9idCv3PZcpYmp7iZA+NGIgicYVIQwQdYrqBIIrEr5WbwWc
         MS4/cj3PxAm9a35BuiJBaivf5+FyLvN7O+vr+gkek6/iBUPmp2aUj+ggo9iUX5n6Ed5G
         5vkd1zk36ejvR8hoUNxZXK60S93MpLNpuW+mh02aUNk6ZXsfWB9BvAaUVRpYaMS7rJXL
         D+nf884e6Fu95lvyDkRzI551je9u1Z2xmY+8HerwmmYNK0IfRMOAYh/0jpLCPHZ+NiCO
         N1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784499030; x=1785103830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uvinVPUoJhsV28WHeBTxSrSEvMvTNBW/BR+fiFjpbyw=;
        b=diy0P6ux68lgL4wCgImqcjcucFeMwMpbcBZorp9lFmZtud7sfN8RgYEhBq/QGK961Q
         2bsGLOzI7FOSxtznxAj9pDiu6fbaUlX2adcVrymfm2hOJ+KqpQ8p5/avUU3nIiVvPYKt
         /11ugnInvRxKm5HSVsiDumISfQUIwC5uqHY4+GEx25Ivx7pRqD6stt6QgZ386QIqZjDd
         3+5yViERbVbJnoWJ5S0nE2HGhgltojcJyZwqBlHBKXvx9v+m3pQXUbOW8NmpvJaWYG2G
         w/lGtLgrxkdXxmAnSBAuIi6sxVZHX149ddl16+YKkMs2Ky0/YBG2yVcigdu+sxqKjBdH
         RsmA==
X-Forwarded-Encrypted: i=1; AHgh+RrUpSqiJ7JX6bNPL4OC0edui0UwFHRI8RJ+m90KZTwiRluqPPiclNwHyKaoGh47yqB7A5575lvl1F9lBQAN5vLQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3R4zPbrzMJLuADSbe9zs7k7PomVq83OZ9aHvPze4BOWDD/mj4
	3sQmVxu8CFctBroFolmcMu1guIvff98GPzH517RVpxE4pi/MiAnAfwV0
X-Gm-Gg: AfdE7cmJXYsaL3sIH1AVkx/MH6k5nT62wTnZSU/pPJZ9HPZnAvIuEroFTWctlDzFOl+
	P4lor2x7aoA46DFHAf1EPHFXcOtP+v/s9CWLe4u7gyEPkZxZug701B9e/j67LfqH9VHCOSqM3nE
	oEb0osm3oklVh576BbKRHzuDPWK90w6SSGyKcPqgS8ofY7R5zz4hJHB02WVySd2QMqSB1KKMdZ2
	PI0df8V9XcpUUOnfKmLk4HDKd9+RHxzTc7cXiddm+j5KvV6LqY8lBPNA/IzyufFWITSONgBordV
	wpNRzD7trz6vujpxkrzINSr4Fc5LTPV0frwZOmX7DRyHOjC/Lpxpd/IUn79Cu1j4qisB44Uot/J
	kMXTBULMX8U/zRezuUnRjG5AbYuzAAOA3k7LMfHWtS/cMkgwhrxmodRLJFH+g1FNroU8bNQbg/4
	4Ptiz6rVy0NGrGSNGUXgkiZym19whARt9ED1vAEVveJosckzugitjnv4xL32yWXwEmwhF6prR5T
	qohv8IuBhiWv68dt0GId074SiBmUupFgM8vmoJXwEamc8PFXY4j6HXesinnOXwQTE/vqgorrgxc
	RgmI5QLftaXpTf5+pe8XVqgs
X-Received: by 2002:a05:600c:c117:b0:495:4b1d:915f with SMTP id 5b1f17b1804b1-4954b1d91ffmr117504925e9.23.1784499030391;
        Sun, 19 Jul 2026 15:10:30 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-aeaf-bd01-78a0-2a2d-507f-c97c.310.pool.telefonica.de. [2a02:3100:aeaf:bd01:78a0:2a2d:507f:c97c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4955370d78csm114492445e9.12.2026.07.19.15.10.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Jul 2026 15:10:29 -0700 (PDT)
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
Subject: [PATCH v2 0/4] serial: fix console lifetime bugs on failed bind and removal
Date: Mon, 20 Jul 2026 00:10:10 +0200
Message-Id: <20260719221014.44354-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_151032_719772_48E39634 
X-CRM114-Status: GOOD (  11.12  )
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

This series fixes three serial/tty bind-error bugs and an i.MX console
port-table lifetime bug. The fixes were found with failslab fail-nth sweeps
and sysfs bind/unbind sequences under KASAN on QEMU's raspi1ap and
mcimx6ul-evk machines.

Patches 1-3 fix shared serial/tty core code. Patch 1 moves fallible serial
core allocations before console registration; patch 2 clears serial-core
pointers after uart_driver registration fails; and patch 3 makes a non-NULL
tty cdev slot mean that the cdev is live.

Patch 4 clears i.MX's devm-allocated port-table entry on probe failure and
removal. It keeps the entry valid through console unregistration and
serializes the table updates against sibling probes.

Backporting note: the probe-failure half of patch 4 relies on patch 1, which
ensures that uart_add_one_port() cannot fail after registering the console.
For complete coverage, patches 1 and 4 should be backported together.

Validation for patch 4 includes reproducing the sibling-probe race under
KASAN with and without the fix, a sequential unbind/rebind regression, and
the same test with CONFIG_PROVE_LOCKING=y. The fixed kernel keeps the
console unregistered and survives an explicit printk in each applicable run.

Changes in v2:
- Patch 4: serialize port registration and removal with imx_uart_ports[]
  updates to close the reported sibling-probe race.
- Patches 1-3 are unchanged.

v1: https://lore.kernel.org/r/20260719160812.35407-1-kmehltretter@gmail.com

Karl Mehltretter (4):
  serial: core: do fallible allocations before the console can be
    registered
  serial: core: clear freed pointers on uart_register_driver() failure
  tty: don't oops in tty_unregister_device() when no cdev is registered
  serial: imx: serialize imx_uart_ports[] lifetime

 drivers/tty/serial/imx.c         | 21 ++++++++++++++++++--
 drivers/tty/serial/serial_core.c | 33 ++++++++++++++++++--------------
 drivers/tty/tty_io.c             |  6 ++++--
 3 files changed, 42 insertions(+), 18 deletions(-)

-- 
2.53.0

