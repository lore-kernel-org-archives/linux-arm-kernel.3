Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F75C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 21:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3xTrhdCX6b33wHdw94N3RvkplzsQLHlHPw8ye7Is4Xo=; b=de1Je8ZgalryMNdkaXHqHlk93k
	MweHbLADcr894e5Fvmq2gyk34eO+pcy1pbLuStmpAwjYRWxhvYSCzkN42k2ZXU3PNs0rKywlnntjw
	I9u3evwYkoU0kzwN/QM1BsCI7dplshTYm/4gP5ZuBgXDLyKTl6i7rpj378mqCBUOIuvDrEi3JnHw1
	hQQ8M9xeD3ZGHKRNGFMdXLY8M31497/PCEAgAQT7ivHFzub9YioWVMvTzO34zm4KiRL6dB/Xyi38m
	UsrCkljSGkCyjtFKtSH76EQcSI/DQSbxLFOMVx6J5qR3TwmR9Jxs+pkUOZLXrtYXyhnbjh17i8dB5
	RfaSeQOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOk8B-00000005HFs-3vXx;
	Mon, 09 Jun 2025 21:34:11 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOjyI-00000005G8r-31Zt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 21:24:00 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 50D7BC000338;
	Mon,  9 Jun 2025 14:23:58 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 50D7BC000338
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1749504238;
	bh=8B9T9fn+R7WMR3vhm8/H3/wrhSAPlt2l7bsP0FgP/s4=;
	h=From:To:Cc:Subject:Date:From;
	b=VpN39uzV142RfVfXMPWNk4TP03tBp1tKhQKAoEJ2YqsxEy/nlcd9Mt1wal1xU/5gj
	 Hm09oS5jyP7zVIzi3WyOuakYBmzdKw7I4/QKrIZvHlb7k369aqRIERDnepEVL1C400
	 FvuYv310y75JhZLgSidXxe1ta3Dp8DIrAid9HNp8=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 2C9861800051E;
	Mon,  9 Jun 2025 14:23:58 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE)
Subject: [PATCH v2 0/2] Simplify compatible matching for brcmstb_memc
Date: Mon,  9 Jun 2025 14:23:54 -0700
Message-ID: <20250609212356.2264244-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_142358_773903_8CAE2CB9 
X-CRM114-Status: UNSURE (   8.64  )
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

Since the conversation died off in
https://lore.kernel.org/all/20241217194439.929040-2-florian.fainelli@broadcom.com/
here is a second attempt at addressing what I understood from the
conversation back then.

Changes in v2:

- define "brcm,brcmstb-memc-ddr-rev-b.2.1" as the fallback property

Florian Fainelli (2):
  dt-bindings: memory-controller: Define fallback compatible
  memory: brcmstb_memc: Simplify compatible matching

 .../brcm,brcmstb-memc-ddr.yaml                | 54 +++++++++++-------
 drivers/memory/brcmstb_memc.c                 | 56 +------------------
 2 files changed, 36 insertions(+), 74 deletions(-)

-- 
2.43.0


