Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BDBC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 18:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WMRJuv06yskeeA3N2FREcGl3rAVnw087RmlIsDnyn1U=; b=mx2h4dCmMaTb0SSrFsYm9ONTDR
	SfPOdTHzBQ5FTLQQCV8MWjeC5chXNwDmutfUmYOgbr52VvVNVY09K6NpQ2mQSLINnENuqQWg4Cl8A
	JpXmMp2uJTZz0i4QW85R4wSbfkfR5S+Ffs9D5WliH3GX06Y6Iv6TQ2EHTcDpWiXfVxtuXU/on2t2J
	74ozlvQgZEFjech69SzEwicyJ00M3ocInYnEKi3Z/FBX7HfbJWrsc8m15yrgiZnUgPJ+SvDHmDDcN
	DRKq5+JU78s3EOFoPBQXFE9ERXgbX/rNRuMpwEAbJ9Q+NhF7/0SbVNfQY8/YOpqitlfBGmf2cCt7N
	Xgm+X4zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trL3p-00000000vb8-0T1z;
	Sun, 09 Mar 2025 18:07:37 +0000
Received: from mail.ispras.ru ([83.149.199.84])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trKuw-00000000uBx-3xNJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 17:58:28 +0000
Received: from fedora.intra.ispras.ru (unknown [10.10.165.2])
	by mail.ispras.ru (Postfix) with ESMTPSA id DD20140CE1A3;
	Sun,  9 Mar 2025 17:58:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru DD20140CE1A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1741543099;
	bh=WMRJuv06yskeeA3N2FREcGl3rAVnw087RmlIsDnyn1U=;
	h=From:To:Cc:Subject:Date:From;
	b=LdezAKXnM6uqo8zZeSBU08IipMfn7Z4N3p9s9pD6rx93OF3s18DYt/mh/hQuheFLV
	 4ACmDtWsWC55CGc9v8H6dexjP280RrCC3tHUa2IhwxMNe/UDVpawjya/g/x9cezdtg
	 0SXsdM7R2dZ6W0o5xEFisfN5NUOqahYb0Ajdq7KU=
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Peter Chen <peter.chen@kernel.org>
Cc: Fedor Pchelkin <pchelkin@ispras.ru>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Sebastian Reichel <sre@kernel.org>,
	Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH 0/3] usb: chipidea: ci_hdrc_imx: fix some issues in probe/remove
Date: Sun,  9 Mar 2025 20:57:56 +0300
Message-ID: <20250309175805.661684-1-pchelkin@ispras.ru>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_105827_563888_EA1C090E 
X-CRM114-Status: UNSURE (   8.05  )
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

The first patch fixes a rather recently introduced bug leading to the
driver oopsing on removal in case of non-usbmisc devices.

The other ones perform error path improvements in the probe function.

Fedor Pchelkin (3):
  usb: chipidea: ci_hdrc_imx: fix usbmisc handling
  usb: chipidea: ci_hdrc_imx: disable regulator on error path in probe
  usb: chipidea: ci_hdrc_imx: implement usb_phy_init() error handling

 drivers/usb/chipidea/ci_hdrc_imx.c | 34 +++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 12 deletions(-)

-- 
2.48.1


