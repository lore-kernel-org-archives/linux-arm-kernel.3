Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D289D4695A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 01:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dtyf5IiFSGkqIwoJrE3mZBp+EKCDcJVJBF4rxwUqa90=; b=lN0q2RVYclUzC0bXpKkLeiYsTu
	JXjv8ExFXZkRbBHb5T5lzF3AEIGOqJ8GXFO+rap5OR63ks9HwIFv+HRSaAgjTDrsuWEdjM06165Zo
	RVbAZ2+Tdk4Pdgqcz+00pfoFtCmaGUeB/sBGdc1RZmLyxrr+lmsBQwxLXm66XiE1MSGqFBpdNIeqW
	QOgkLEWAkIwJF0H5G9kfW5SoqkjYhvYkhfAjupE1CTx6gCvhmxLsk0dTm3MW3Zz+icxJ3VwsghzaI
	xvgDX75V//JXU5sQWFHBuZDkJqJgcjG3GxWOlz2GaHhhqNLl47AdUWsoQNT5TiefcSdxjF8RmZsjm
	k1G2Gc4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vij9h-00000006EbM-1WV7;
	Thu, 22 Jan 2026 01:06:37 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.207])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vij9X-00000006EYI-236j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 01:06:29 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id C236EC034852;
	Wed, 21 Jan 2026 17:06:25 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com C236EC034852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1769043985;
	bh=huZ5GfwbtwyQkbiepHw4sBVF2iWyBdgFLgM3qEMW8jU=;
	h=From:To:Cc:Subject:Date:From;
	b=OjhtGwE0ivqN1AcyW8D4xnoe7PqMH2yEK2/EJ1cdLsi+gcOO9CBUghUeEtN3JoMpn
	 dtyJRYbJrNEmMbeHaOWj1sXlrI4am/uqGLFxh+hu7IkzdXCFAxhFmAGrJPbIrHw2VF
	 fdd6TzmpZbFJLnIUxJdMkoFxKTvCLuFiQmfjfiM4=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 5F89219CD7;
	Wed, 21 Jan 2026 17:06:25 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Doug Berger <opendmb@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE)
Subject: [PATCH 0/3] gpio: brcmstb: Bug fixes and wake-up interrupt improvements
Date: Wed, 21 Jan 2026 17:05:13 -0800
Message-ID: <20260122010516.1200630-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_170627_619453_300F0123 
X-CRM114-Status: UNSURE (   7.67  )
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

This patch series corrects the HW interrupt to the bank mapping logic to
be more robust and do not assume any particular order.

The last two patches improve the handling of early wake-up conditions
and makes it more robust so we can use those during "s2idle".

Thank you!

Doug Berger (3):
  gpio: brcmstb: correct hwirq to bank map
  gpio: brcmstb: implement irq_mask_ack
  gpio: brcmstb: allow parent_irq to wake

 drivers/gpio/gpio-brcmstb.c | 121 ++++++++++++++++++++++++------------
 1 file changed, 82 insertions(+), 39 deletions(-)

-- 
2.43.0


