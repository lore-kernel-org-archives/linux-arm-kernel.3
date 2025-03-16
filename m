Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36BCC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 10:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DAFPVgIz17hFI8bUHedfUHl8J8FHc6juaD+ei7zx+wk=; b=DqdM8Ybhrz70QPFBKtLj5/UEEx
	ACMS8LL2q6fw6Sqx7N4KYl4UkrJjlaP07oGBVl6gmXMB1o513fzZs6V8m1FRRaTVVmt4WRFHhzwzp
	bWAbPtEnl85cnCf+cet/G05xdNRD8Rx0DBPWhDMKMy7PDtbu9EZzKZ/iveuZY3PtTNWaje2H61YEo
	lGqZAx/T7hLB6EUPAqCu6K82RH1qUzhkx7BC6gxN0u66ibN6oL2EUEGqc5E4mGDIb5gHWgjb6An2E
	I6fFg529RDLJo65+MiMMUxSMTEcVRCnGQzf9XlDHNKn3Iv1m/CH/xpnSmesj2ne9W/ditzV4RBLV8
	aHbIzP2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttlGk-000000002ud-0F1D;
	Sun, 16 Mar 2025 10:30:58 +0000
Received: from mail.ispras.ru ([83.149.199.84])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttlDN-000000002Xs-45Dk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 10:27:32 +0000
Received: from fedora.intra.ispras.ru (unknown [10.10.165.7])
	by mail.ispras.ru (Postfix) with ESMTPSA id 664C846361CB;
	Sun, 16 Mar 2025 10:27:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 664C846361CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1742120842;
	bh=DAFPVgIz17hFI8bUHedfUHl8J8FHc6juaD+ei7zx+wk=;
	h=From:To:Cc:Subject:Date:From;
	b=RpkTebEz3IFd8ugfP9npZqvS0rzPExAZ+VASvazmljBkLjnRFQ2qkdxp58EQxHOgz
	 iiRVCFpMKjS2I6TWW7ubCHyk+Oto8DMyFllmfBGVsvhc7rkkobyLvIGYydeVFiunNH
	 0V16ziOMUp0s30bZytxFkW5wskVlA9abouCARHlE=
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Peter Chen <peter.chen@kernel.org>,
	Frank Li <Frank.li@nxp.com>
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
Subject: [PATCH v2 0/3] usb: chipidea: ci_hdrc_imx: fix some issues in probe/remove
Date: Sun, 16 Mar 2025 13:26:53 +0300
Message-ID: <20250316102658.490340-1-pchelkin@ispras.ru>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_032730_585896_7046CDA9 
X-CRM114-Status: UNSURE (   7.37  )
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

The other ones perform error path fixes in the probe function.

Link to v1
https://lore.kernel.org/linux-usb/20250309175805.661684-1-pchelkin@ispras.ru/t/#u

Fedor Pchelkin (3):
  usb: chipidea: ci_hdrc_imx: fix usbmisc handling
  usb: chipidea: ci_hdrc_imx: fix call balance of regulator routines
  usb: chipidea: ci_hdrc_imx: implement usb_phy_init() error handling

 drivers/usb/chipidea/ci_hdrc_imx.c | 44 +++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 13 deletions(-)

-- 
2.48.1


