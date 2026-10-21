Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B5E60A382D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 17:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tZQPvYIy;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=UpYuiab6;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=dkimrelay header.b=f/p7JIEB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MIpBpQhGsJfqDkD2YXhEXuJPTwolIV4HSDydhYKKDxg=; b=tZQPvYIyLDTcGpyNBV3HVaRjdS
	QMO3h7Eu7QnQdd7Ty1aXvGYd+Meb3MhQdo2+4os75u1z30vJvpqnIXk3fpk6c8RZw45tH5pySv3OS
	sEgAg7vUAC5QR/5Nlt0pxU4djcvK8XcoX2BFUGZ/HmyV9a7yoTXBx/Yf7ac7QjMSogb6ZHPp0sJfe
	YrhzlxNck2lxx4H5bWcNliL6a3wWI/+bKNT7O3yFjc+qvPvLW12U23SnqMdR29KfP60wgFx6C75eV
	4izIL69FdZFyPTuX/knVVb90cbBWfb30wGGrjVLuwCCSX7oUcLGBAp8SunMCyDIQ9Xoe9WPP4/0SM
	++3AN67Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJa73-0000000CY7q-2FTR;
	Wed, 21 Oct 2026 17:28:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJa72-0000000CY7K-1d2E;
	Wed, 21 Oct 2026 17:28:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=MIpBpQhGsJfqDkD2YXhEXuJPTwolIV4HSDydhYKKDxg=; b=UpYuiab6NWFDUpqkx/g4rSWSN6
	GH0dlKd2INEFPB6USFvnfvH5AmV8SWwx/FpuY6TAKIITP5xwv7R25aTL4tDmknuH5yDvzU8lnMtvE
	CU0g3scZDY0PU8yuk8WAbdgXssD49zq9fbB9SOd3tN/ysRiHKWegbv9JiF3Gvsy+0ttLzcJQCfwD4
	2x0jNSi2/paaToQTV8GCm+3AnF1wgnCQXul4NtZe3s4pGxeObhFJ2gKIiBNMBQKe3PVRVqG+BEd3K
	8Pld6bhZodck65gHBXQKfDe9WhkhwQMdqkvEV/FfHPIfHXxDmAgP6Qxs2eRU3g+tzhSFSJpO5kHP3
	fpson0rQ==;
Received: from lpdvsmtp09.broadcom.com ([192.19.166.228] helo=relay.smtp-ext.broadcom.com)
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJa6z-000000064s8-0aog;
	Wed, 21 Oct 2026 17:28:27 +0000
Received: from mail-acc-it-01.broadcom.com (mail-acc-it-01.acc.broadcom.net [10.35.36.83])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 98A71C0000D8;
	Wed, 21 Oct 2026 10:28:22 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 98A71C0000D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1792603702;
	bh=7YXMz6ICeOkY0HuKXHTL8W02G5699zBtL4gEQsBoYnI=;
	h=From:To:Cc:Subject:Date:From;
	b=f/p7JIEBqH++4zlYLGD6SWFdY0oXIIRoTNs1R11XWJGmkirvfaQMZgMncRG8mXRq+
	 McWOCcjKdsDHBLsUHe7eN7BcwNhzngDRixdRRTnsRExYaojm2w0zJ5Ks6HZAhO4OlO
	 XCQTmuF2uZCc1QP6XTlMmFJYQxX/OAc1gcLHLuaQ=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-acc-it-01.broadcom.com (Postfix) with ESMTPSA id F131CAEA2;
	Wed, 21 Oct 2026 13:28:20 -0400 (EDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM)
Subject: [PATCH 0/9] Fix USB2 and USB3 on NSP SoCs
Date: Wed, 21 Oct 2026 10:28:09 -0700
Message-ID: <20261021172819.668120-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_182825_402083_E682006A 
X-CRM114-Status: GOOD (  12.30  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Similar to the SATA patch series, USB2 and USB3 on Northstar Plus SoCs
was broken in a few different areas:

- the NSP variant was not described properly at the USB PHY level which
  prevented SoC-specific initialization from occurring
- the lack of DMP registers meant that the USB PHY could not complete
  the initilization and instead relies on the boot loader
- the EHCI controller requires some FIFO tuning which is similar to the
  XGS iProc SoC, otherwise DMA transfers eventually fail
- finally, the USB controllers are non coherent

Florian Fainelli (9):
  phy: broadcom: ns-usb3: Propagate Bx initialization write errors
  dt-bindings: phy: bcm-ns-usb3-phy: Describe the NSP variant
  phy: broadcom: ns-usb3: Coordinate NSP USB2 and USB3 initialization
  ARM: dts: broadcom: Add the NSP USB2 DMP registers
  ARM: dts: broadcom: Share USB PHY initialization on BCM958625HR
  dt-bindings: usb: generic-ehci: Add the NSP compatible
  usb: host: ehci-platform: Set the FIFO threshold on NSP
  ARM: dts: broadcom: Identify the NSP EHCI controller
  ARM: dts: broadcom: Use noncoherent USB DMA on BCM958625HR

 .../bindings/phy/bcm-ns-usb3-phy.yaml         |  23 +++
 .../devicetree/bindings/usb/generic-ehci.yaml |   1 +
 arch/arm/boot/dts/broadcom/bcm-nsp.dtsi       |   6 +-
 arch/arm/boot/dts/broadcom/bcm958625hr.dts    |   9 ++
 drivers/phy/broadcom/phy-bcm-ns-usb3.c        | 134 +++++++++++++-----
 drivers/usb/host/ehci-platform.c              |   3 +-
 6 files changed, 139 insertions(+), 37 deletions(-)

-- 
2.53.0


