Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38AD5C5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 03:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z8AUauJqA+r3pT/B0qrPy70O7l5e8ImJzUTG647LH5c=; b=2i5M7u/DNZFn0i5lcp4jdBTxAN
	bQRlGZUTqPElF6GU0V2USwgjuVk0bCTJ0gicxZJghwua+YTDF/Ss87LpoqdmXWqNpGTrzO0LL6Zez
	p7x5GAYiNVIM2NvkOiELqsp7GW9WMdUKIS5AeXYrdlXCMzE6sE/IL/U1CrbclN9oY5t5LU+6vFHsH
	8GABCcwtfRcNFqwSHqvTI5bh9Qlj9NrXPaVtuETcwqYujSaLzrqFEaUu1ZpfhfJKVlmZ1Xk3XKWyH
	ZYrGv/T0Tk6ronKUaBBh7h0sCBbFbe8XSAczMS8CC6D5NangeInUtK+K4Gf8r2qksS5x4ABl+D+6A
	QU+nNiug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtGuW-0000000AxuV-3UI4;
	Mon, 10 Aug 2026 03:42:48 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtGuQ-0000000Axso-3lH9;
	Mon, 10 Aug 2026 03:42:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1786333308;
	bh=Z8AUauJqA+r3pT/B0qrPy70O7l5e8ImJzUTG647LH5c=;
	h=From:To:Subject:Date:Message-Id;
	b=eezR/5CXrl/olfuipUMB1TrDY2J/ryA2zSnXrl92wvmknnonmk224Jep6aCnYEwuz
	 LH1tjyv2YYKOWYCAXsqNMlfNCx/9eQTLMFP2pwWQdEB4pDwikaYmbe/LYADo2YrQGF
	 eDkgsbwUdwdPMuhvWMWUn1lorIBODXeixyG2r74g=
X-QQ-mid: esmtpgz11t1786333305t01702f6b
X-QQ-Originating-IP: PgJMsdmQ2ZvNvkE+yrtkeVW07WCleVAPDiFefrOZEaU=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 10 Aug 2026 11:41:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3484612477660433064
From: Chaoyi Chen <kernel@airkyi.com>
To: Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH v3 0/3] DSI Controller improvements for Rockchip platforms
Date: Mon, 10 Aug 2026 11:41:36 +0800
Message-Id: <20260810034139.148-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: ND42uzdxTIzrFGecMR8iHevg5r7qdZi0GrkFF5q/942MN1ALdOxRn22K
	wbd34LlALqR3saLn7pAB8iH48/EB75w2gKZ5piLBRqz3EfYbO8kDPqts3WyDaujBTFm7EF+
	J1jPP7uL8V0icOHjMWQa2OIncBTQjGetjtK4GbslxXAo+yZNKShBt1bUjy9pqbs4cd5IKIG
	g0zyesWYW9H41JnjPkmiFgByYyxnjMRSp1jSUmfhK9qtmiwG2ER+sAAaucDUkw6k/hUpf28
	d0dBhA4oJzMncaUVn4DwcJAsv4qyxBTAsTrcAZlkh6RY+bMh6u1I3/kP4N04BoI4zKTsrEo
	S5dQnBOD1HKR57sAX0OQONL6NHbLqBZmf1ChroELG6Do/n0VxDqRmID6bb57fZJmBKU/U30
	C+wUIisKZ8Uqkos29eviAn62+lzXKirJVAJBlk2TRNW7xXIdRMecn/sjM2h19b2FxmtZz6K
	Su5p6AmGRg9bjICioB9lZMsroDkoTBejKFndsVlZYh28TPlR10fjfZCGKasB79UwFijjLZr
	dhSfy4Cd8S9Yg8l05uNu38NIw1iiAjK/nvZZbiiX3FaqNkMTL3n6NbNPikTLVQTIEUJ3oWF
	ri0jS+FCuJuw8DDWCWX0cuGTpnTXcP98/FdFfilMDOvKRx04YMPOYN4On/9xcmZ397f4Ras
	jgW/g6hvxC+QfptMbxI1x4Ftu9j6noFFjzpyPNfbl3ArypBpZ5znbOUxSm682UBybViR9Sl
	lfi6uHZJ+RTvnlAk6eHboQaIyfpDJLhA7FTPmYfmseHEByvTE8wlJ4491CdqkopPHdyKMga
	mwd61pUYclLuMGNyIEJ+PJSsT65I8dG8a3LMIBUCv63okvP1XsMIlqbjEecNN/JvUEdioHi
	dfrfdpydlzqT+3jINGyPV6bOSgW3HeCZMi+yN2bpqjt1QAtjUVt9fEx3xcp3EFh+dQI+6W+
	k2bkcLid/3iVC/9vhzKSYQpwChJON9ev5MCSFoWvf/7Do+wQ+17HEWcdW2H5S6v1NtrhqAp
	g3mny8RKub4/vuvayn
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_204243_413458_039D5B44 
X-CRM114-Status: UNSURE (   7.00  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

This series is dedicated to enhancing the DSI controller and PHY timing
interaction, refining the lane rate calculation, and addressing the
associated hardware limitations.

Changes in v3:
- Link to v2: https://lore.kernel.org/all/20260603033532.164-1-kernel@airkyi.com/
- Rebase to Linux v7.2

Changes in v2:
- Link to v1: https://lore.kernel.org/all/20260324085838.90-1-kernel@airkyi.com/
- Fix the unit conversion for max_mbps.
- Split the lane rate calculation into a separate patch.
- Add more comment about timing config.

Chaoyi Chen (3):
  drm/rockchip: dsi: Add maximum per lane bit rate calculation
  drm/rockchip: dsi: Add dphy_get_timing support for multiple PHY types
  drm/rockchip: dsi: Relax the lane rate margin requirements

 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 66 +++++++++++++++++--
 1 file changed, 60 insertions(+), 6 deletions(-)

--
2.53.0


