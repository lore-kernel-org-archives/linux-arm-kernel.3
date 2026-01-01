Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D27CFA3724
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 23:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dx+wOFgbkvO6ueVGDjPdhd7287EZJV9Wpz7UT3luVS4=; b=yV23JuH9Nvteyufson31Fg7DRg
	kjo/WleNHUDtL6d1dJ057jaVW41wsnGL7BTiNxv7U+HdFEJpKsWrGKk0W3GhKewCO3G0XTPhuO7i5
	GEGwzDfow4pyO/i++3mXLru3sxzscLciTykzXx+3OfgbfNOub7mLLe1wkdWnHfgMYmp1YWPgsxBre
	+PAGL0vm+F29KLOGbqXvOYxHasGaUyA+IK1FjzLy1wHgOHwElKR5Q6T20ttJHOCK44NPCWrpCHS7s
	FITw8SDWzVQwr2ym8aOnjBXjVp0KcIn2M19sf/lEc5lb/S5l0zK2qBGrzvrKWo28wAbLjNyYMWLPn
	wCg/ShzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbSXO-00000007eoA-0hsa;
	Thu, 01 Jan 2026 23:57:02 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbSXI-00000007enF-0Xyb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 23:56:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1767311811; bh=ZwD5xPWitTz0rK1e2zIB2rqbLWbo77DZcXZBSDliNWo=;
	h=From:To:Cc:Subject:Date:From;
	b=l2JyJMXcHYYSUDc71wfcYp70B5ycyDZ/aBaKImTeLtFOtJsIcBM5z+8AZ12/aClYB
	 6NW2qUX2lBja40MldDMfJJoEPmZ9eGM4mKib1ORxKRUK84MzPV3GDHfkDf2ApQSe0c
	 XTvkRCiYIDRUDG77UGK+70ENuGjtGsZ2k3E7L5n7Ahuv4wvbGhxzLKsdG/Nwx/11MS
	 xh2RBTlT+pw33XP8uFfPeOD/yQsSs5ZKeirYy0WaIvQs+L1CmAAwYYdcJVh6HoXm5t
	 vrHdRWa4ptNRL2AuTzvRMlzId8nqZsYIBNy9lGmczeaR0ovsC3pR06/goXC6TZXSEp
	 TBzxst2XNRs/g==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id AB4673E9B45;
	Thu,  1 Jan 2026 23:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1767311811; bh=ZwD5xPWitTz0rK1e2zIB2rqbLWbo77DZcXZBSDliNWo=;
	h=From:To:Cc:Subject:Date:From;
	b=l2JyJMXcHYYSUDc71wfcYp70B5ycyDZ/aBaKImTeLtFOtJsIcBM5z+8AZ12/aClYB
	 6NW2qUX2lBja40MldDMfJJoEPmZ9eGM4mKib1ORxKRUK84MzPV3GDHfkDf2ApQSe0c
	 XTvkRCiYIDRUDG77UGK+70ENuGjtGsZ2k3E7L5n7Ahuv4wvbGhxzLKsdG/Nwx/11MS
	 xh2RBTlT+pw33XP8uFfPeOD/yQsSs5ZKeirYy0WaIvQs+L1CmAAwYYdcJVh6HoXm5t
	 vrHdRWa4ptNRL2AuTzvRMlzId8nqZsYIBNy9lGmczeaR0ovsC3pR06/goXC6TZXSEp
	 TBzxst2XNRs/g==
Received: from mail.mleia.com (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 3891F3E956D;
	Thu,  1 Jan 2026 23:56:51 +0000 (UTC)
From: Vladimir Zapolskiy <vz@mleia.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] soc: nxp: Add a simple NXP LPC32xx socinfo driver
Date: Fri,  2 Jan 2026 01:56:45 +0200
Message-ID: <20260101235647.2411062-1-vz@mleia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20260101_235651_717118_B68702CF 
X-CRM114-Status: GOOD (  10.66  )
/bin/ln: failed to access 'reaver_cache/texts/20260101_235651_717118_B68702CF': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_235651_717118_B68702CF 
X-CRM114-Status: GOOD (  12.88  )
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

Add a simple socinfo driver for NXP LPC32xx powered boards, the driver
exports SoC family, machine name and the unique SoC ID to userspace.

The unique SoC ID is read from SCB out, it replaces the current platform
specific functionality, which can be removed after adding this driver.

The System Control Block device tree node is added in the change given
below, but the driver operates without a dependency on it, so it does
not cause any regressions on boards with not updated dtb firmware:
- https://lore.kernel.org/linux-arm-kernel/20251231215754.2222308-3-vz@mleia.com/

Vladimir Zapolskiy (2):
  soc: Sort the list of subfolders alphabetically
  soc: nxp: Add a simple NXP LPC32xx socinfo driver

 drivers/soc/Kconfig           |   1 +
 drivers/soc/Makefile          |   3 +-
 drivers/soc/nxp/Kconfig       |  16 +++++
 drivers/soc/nxp/Makefile      |   2 +
 drivers/soc/nxp/lpc32xx-soc.c | 114 ++++++++++++++++++++++++++++++++++
 5 files changed, 135 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soc/nxp/Kconfig
 create mode 100644 drivers/soc/nxp/Makefile
 create mode 100644 drivers/soc/nxp/lpc32xx-soc.c

-- 
2.43.0


