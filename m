Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F73C8302D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 19:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=04OT101Su0f2wDfnUkqDw4Nc/1AfHtzg8VDkoAOOI6s=; b=m9gmWGDUsAgwFWcejlhUjjt00G
	ZNTddgHMBio7sLDzX+6qtoSeoMqmHVB6BTjpsJD8hvk/cTORSYuvalgAGLPTrDdOb5GkO0Mcveegt
	e2a0RYFN9Wy3MSyRO0re7JP8G6VgHkqDA9OXDzL+VaH7BfoP+WDWDKSuDTo52XWDbpmw6tl/fwbJo
	4+SihVvMP7A7taqmosrZSF1rMl9M5gQ+JJi3n4/q655qZ3noIVlLS03c1CSjL9DTmqqgVS9dOp5+0
	qYV+Oz+2byr6yLGehu7T9RwGcpqV/vGrInboAUHOjn8TY0wq+43jMAxXovKGTI589lLpnFqRBv8HG
	Z4BTV/Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJoF-00000003FdG-3047;
	Mon, 30 Jun 2025 19:04:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJlv-00000003FJP-1Roa
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 30 Jun 2025 19:02:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=04OT101Su0f2wDfnUkqDw4Nc/1AfHtzg8VDkoAOOI6s=; b=Oy6iWyA0P3d+JjO2yvlrcB2kjY
	QY4JPoMXryKlDF6irEQ7Q6RJMpP46GPoD5Woe1OYQY1TqVid92h+GgGpETyNzLiqhOg4JPAp1U8jr
	JKZlSAhjJcwJDCWjJP+dmSCsCA8QvTgpWdj2a+ZMzO0LE1Pcp1ixZFvbZRLiSpGNyWXtqr+wjZ+LI
	1u7kaoKhdnC0k0fA4eBDYCodzwwAVntTyFZ6PqP9qeBZob2lm401xdKrrSghmOKFN1ZtLgCxlPeF7
	gKqmPCN3jkaYZjhQbrHN5hriZHJci+8LUZHVOEyjXp3m9uuLox1aQ13c5alpNDY7TunSnYuTQypI8
	w2iLxszQ==;
Received: from relay.smtp-ext.broadcom.com ([192.19.144.207])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJlq-00000006s7P-2xm4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 19:02:29 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 9AEA1C00210F;
	Mon, 30 Jun 2025 12:02:22 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 9AEA1C00210F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1751310142;
	bh=ib+xSp9Za30RRjuf0ovBP4tnd/mODhlGjBXuhmv7Z5M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BQsU8zrj+iDvpwdVGARWpUNzWcH3Fo4jmTXPsERaH4ulxafiluN4eJdrsrzk8TWOF
	 Rgh/lBU2RWacp/+Q60URaQxDxEjawgVul4FOYPJwsAfVOHrbiVNP4xGO2vu+MmXMnc
	 1/0cEasRFLSb7brHS1ogs6rgddfnuI067AqsxziU=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 41226180008FB;
	Mon, 30 Jun 2025 12:02:22 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	"Bjorn Helgaas # quirks . c" <bhelgaas@google.com>,
	pci_ids.h@broadcom.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Randy Dunlap # build-tested <rdunlap@infradead.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org, arnd@arndb.de,
	khilman@kernel.org, bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 4/5] Broadcom drivers changes for 6.17
Date: Mon, 30 Jun 2025 12:02:15 -0700
Message-ID: <20250630190216.1518354-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250630190216.1518354-1-florian.fainelli@broadcom.com>
References: <20250630190216.1518354-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_200227_536847_51A42E52 
X-CRM114-Status: GOOD (  11.86  )
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

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.17/drivers

for you to fetch changes up to e3ce7b897388339b407d57969acaa26063e38209:

  pinctrl: rp1: Implement RaspberryPi RP1 pinmux/pinconf support (2025-06-25 12:08:56 -0700)

----------------------------------------------------------------
This pull request contains Broadcom SoCs drivers updates for 6.17,
please pull the following:

- Andrea adds the RP1 clock, pinctrl/pinconf/gpio and misc driver to
  bind them all

----------------------------------------------------------------
Andrea della Porta (5):
      dt-bindings: clock: Add RaspberryPi RP1 clock bindings
      clk: rp1: Add support for clocks provided by RP1
      pinctrl: rp1: Implement RaspberryPi RP1 gpio support
      misc: rp1: RaspberryPi RP1 misc driver
      pinctrl: rp1: Implement RaspberryPi RP1 pinmux/pinconf support

 .../bindings/clock/raspberrypi,rp1-clocks.yaml     |   58 +
 drivers/clk/Kconfig                                |    9 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/clk-rp1.c                              | 1494 ++++++++++++++++
 drivers/misc/Kconfig                               |    1 +
 drivers/misc/Makefile                              |    1 +
 drivers/misc/rp1/Kconfig                           |   20 +
 drivers/misc/rp1/Makefile                          |    3 +
 drivers/misc/rp1/rp1-pci.dtso                      |   25 +
 drivers/misc/rp1/rp1_pci.c                         |  333 ++++
 drivers/pci/quirks.c                               |    1 +
 drivers/pinctrl/Kconfig                            |   11 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/pinctrl-rp1.c                      | 1829 ++++++++++++++++++++
 include/dt-bindings/clock/raspberrypi,rp1-clocks.h |   61 +
 include/linux/pci_ids.h                            |    3 +
 16 files changed, 3851 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
 create mode 100644 drivers/clk/clk-rp1.c
 create mode 100644 drivers/misc/rp1/Kconfig
 create mode 100644 drivers/misc/rp1/Makefile
 create mode 100644 drivers/misc/rp1/rp1-pci.dtso
 create mode 100644 drivers/misc/rp1/rp1_pci.c
 create mode 100644 drivers/pinctrl/pinctrl-rp1.c
 create mode 100644 include/dt-bindings/clock/raspberrypi,rp1-clocks.h

