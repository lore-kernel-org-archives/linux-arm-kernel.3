Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D935CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 03:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MuJLtYdtHWKaqd46ljA3SGhtc0u+suGv8rl/EcC4vg8=; b=EHH3IQRNX+IvBYUrAqUwRXmB8G
	qcTbpWRf5eJ/fd3hSeBcLySRVnyGSV43idIbFBctiRezCZKkJL7ljj114LNRy6MzoTbDXs0YGYtWk
	PcLJcIMdyrEm85xCF6tlkrzwP3NvYKq6PbRvWj4zl/qzV3t1q03qu6Pr163bAomNY27Fw7juwoYbU
	7Gdod+oNk7IfMieU1tk/S5bK/C59fJtuDT2Z1IYDq7XmlXC15Xq8OoJb1BOt2mJDFOeLlDa0HycZz
	fcFbfYnA0PTs3xWQ1+iQ0JRKvW0nbgo+AoLO84iWEwUtRWCGp7jLo8pg3lHmvhWCNdMbPFBuB8VJC
	USAevAfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUcPK-0000000EBts-0u7G;
	Wed, 03 Jun 2026 03:36:42 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUcPG-0000000EBqy-3erN;
	Wed, 03 Jun 2026 03:36:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1780457742;
	bh=MuJLtYdtHWKaqd46ljA3SGhtc0u+suGv8rl/EcC4vg8=;
	h=From:To:Subject:Date:Message-Id;
	b=K3cQ0muORXeRzDUjJAklwiu/B/9TvmYbwjOxlOEK06KuSFgFob2m8aOTCvdZbdDPo
	 pxBbb6BpaOS9nxGVUHltY3BRBVkwQeduOpc4VXOaChDMxto5/J7JofDMZySEirmoMp
	 Srxw8/8n1HJnOwNjSXQ5h50eYcMVgMYGd6+Efg68=
X-QQ-mid: zesmtpsz3t1780457740t290e62f8
X-QQ-Originating-IP: CzBw4Y9AFqPGcBi+9pnSIOAZiI3fSc2fRqSUVrQ4w0Q=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 03 Jun 2026 11:35:37 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16903120165726575849
From: Chaoyi Chen <kernel@airkyi.com>
To: Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Guochun Huang <hero.huang@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH v2 0/3] DSI Controller improvements for Rockchip platforms
Date: Wed,  3 Jun 2026 11:35:29 +0800
Message-Id: <20260603033532.164-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: Nw9C1WBu09hPXUn7REqwKFYd3so+pwkePaCYgrPWDg6vuu+MG6DV2r6R
	TEi0Vi8ilW7vrbmLAEIF5Z0MHaK841xPQHN8KBpV2XkhoizoAXezOY/eRF5oyZJD5Tq184j
	5L3sIdYgNR9Ie1Ov/t0ih0sVwanhvT4lrOFqilPL58RzlkPBjF/7lCJQldKp/OEoH5T/DDi
	bJPel0cq0fPwwXZFMhPqyukSUky5IoUTlOS0Dh4/0SNDVVKuIkHD0qAr9ZNELCe/VAr+898
	wnD18snZeoyCQiTVDcH7XFxd57MydlcpZ7Uqnsy6sMWq9qUDlBTJ6LDltnVsCmStD09gq54
	bg/fSJTLVhNv5NAvshPMAWL1o5MaISI6Q8LFi6D+P1QAgug0wVZEDZ7UCehEFB+hPqGl/Jw
	eDLe+S8370hkwNx+t+pJIwio3sL630yOIObenaRPAcJnBfyqiAJGts6FEHcntg68h4j5R4K
	Q6x+QrLKjBoTRxV9UFOtCShELZHNAzo8qAUvf8VTrpE37k7/Jb5kVsaJPZVD7PqHk+AleVP
	Hq1IexyvLARMq39/XoSy3F9Cr1Inu+bJ6kkpLsJFbh2rg8VBx4kJJlrf2DHML1mEF/0kEiS
	KIx7SG9E6DqHUe7zSoB2dyFBHPny5nM1whBwi4aJmnbtAUQsZQdahRabr7Wte842KxVN4Or
	P+oOb3WkD2r7RtXaLZebqJucsYXPwGR3LOsgV1WXdice/V0JsvNC6WQAd02yQ9T+hzUusw9
	TdNBfY9ZVKXrEMXx83tS0tMh60aJ149G4juXrT2pyid7q9/lR84EHMUV+dqx8LoNphLvIb9
	4Gr4BNEdHQrwUP1m9MLaPriizE0CFd+nLN13murEO5IHXYieeLM+OBUNoUy/+Tj9JVECz39
	yIYLk95jPp/vUON1tYxcYPn2qTwZyZRkj+WAbocGj96O3KZZObTK8ue5SLamJS0IjNpE0Xi
	ZT9SVparm1BqgiGD/rx0/HnjP5cQTYKax3lRoFfUX9uXMBTi0O3bvoTDM0IcKenAEuxlwIz
	s1w1mnEh2AHnxOdxqWHbp2DGFrPlQ=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_203639_377408_92108247 
X-CRM114-Status: UNSURE (   6.99  )
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


