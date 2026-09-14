Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0964C88E6A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 01:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ghstWEaYrkLc9meAEd3pZEEcpwP/9Ch5TtSSwo4LDoE=; b=3xpOPoRnGzT/tMEco4+cHDPCBR
	5qZVZKjO2poDk9bIZpjqC2af7Na0HglEq0l7mSnUwv5NuBx5ZZfOXBItNPh2ZuuEwTctVy06Ppnf7
	G7SaLFqB/6ClXmXfdwNofQN5qh+Vc6KBkc+lmID6AB0pypxbuSemdvzyHUJhlGSphH5sDMPUhL/mC
	4XlkGU6QVP5sFrsxbf7WSKSf9EVPNTDQiGLtxNljieXNmKLEVB3kU0TRBq0DHhch56JYDQag4zIWX
	HYVTFFOysF3OWQ01D5s5SJzcmiGbAOJWkx2pWZrAF9cKWFAcVYJsCn84GuHE8+D1QPVwvn/LJFAPo
	Mj1Vz3Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5vaj-000000029On-0gsY;
	Mon, 14 Sep 2026 01:34:41 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5vaf-000000029Nf-0Z6x;
	Mon, 14 Sep 2026 01:34:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1789349627;
	bh=ghstWEaYrkLc9meAEd3pZEEcpwP/9Ch5TtSSwo4LDoE=;
	h=From:To:Subject:Date:Message-Id;
	b=ND65IVUkt0q2DnUcZAnrtzO1CdlvbFe5T6vaTALQ9cYTgYNDYiGkB/XpzaVIurNIC
	 aN6am1MsKhW2j1Gwjf3ugicOh2MkgIT8ne7EChA4eLYezXdPIaUcGkUz1qc/nu+JoL
	 qXXxJoJbLMzUbw1AHKJ0/pH5bfc8shMuCtZIIws8=
X-QQ-mid: esmtpsz11t1789349626t47bbf22a
X-QQ-Originating-IP: u1upnWTSMY6EsvZnsiIRSULieEWklQzdBeNIg2pbVbc=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 14 Sep 2026 09:33:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8813377110775097573
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
Subject: [PATCH v5 0/3] DSI Controller improvements for Rockchip platforms
Date: Mon, 14 Sep 2026 09:33:28 +0800
Message-Id: <20260914013331.108-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: N3p64rE3gZ/YZpxGskmGngMMrgpj8BVnJpWNq4vvp58y0wBAn68/dkgf
	V7p1efZgjAIf63A6SuOQFWLFFKMbU+0ghR04XiGorjxuZMMeqtGG8s2ttCgSHsa6gt3Ry2B
	LbSsL28G2ENjU0PTU8mTA7DLsTGgp+xNKSk4AyhB3EWDxP4Kss2Ia6UUnLXmoD1Wyr/xvvZ
	CfWintxHjG8J6XiLNK8+tZE2mma0DbQR8romTIe8OzhXmu+PAS5CycgrDxT/nWV/nPoZMXD
	+X0AuAj8+KmrKAGInXdE8Mp6OT5f4f9O8jVn/abVD1/QzAzxtN2jVNbn5bBq/kDC9xRUabD
	yVPMMsed0A0A4Ehyy3rLNloX16oiw491LAW+hVRdzXuKVA2d+iCBTo+QOOY6p9gLvML0XvD
	Yd32j6tOT1mBi92tyZkAVvhQGZmvl7SCCm26GY71EG7UNfGIlk4eSSaJPcwqiMze5jSFyvq
	DbORMJ85ti1FrMKr0LFJDFo8QAE8kJVPbJPpi1plJ6HXZn7GTrmJd21EhML60kEH9UnbyyB
	YFE5OurAp+8xp4B3ad4mqmWs/k31fAnMBwxdc9rQfmVRU6rcYIH57QzA/zsxZVoGlNcIjxi
	hi4tz2qmSUF38ZWP/rEYPG3GlDrMluKHLbLV/s0Og/HgYMaTfbxvbUg3XPf87WhbbFFSSPG
	OaOROcM9RpU/DNjHQFZb8aH6ndH+mAUB0yXREkzzx4O+bdQuMyKzXbox9l174RcKQkDysKH
	w9k3Zf36Vt7h9RWZRtlwl7Q3aZHyLHNq+hpjMakDxT2UFlE0PP7gGDlfII7QwyYqQIbwvb/
	uuOZZEYea79xwakns9ottMptl8cjQ/Z0v3KqBBXXzlVzJjH3r25jFWQvuYt+/HKVLaN9QUx
	qYADKNsOeiw+GxjNlClGlM72MYoJh3LCba7tQbihXWk2w3s5HizG2IhFRLq+2Mg1lpC8Vek
	oMtlode338lXex34rCZdqAXcw5VRL9bI8NmVz/F18YMzkhEOXFzh0xG7uhjzO3VlJQjqtu/
	P2SzyL9FwDuZBavBnq7CJMmmSLPuw=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_183437_703680_252439B5 
X-CRM114-Status: UNSURE (   7.19  )
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

Changes in v5:
- Link to v4: https://lore.kernel.org/all/20260812073002.328-1-kernel@airkyi.com/
- Change the upper bound check for target_mbps from < to <= (sashiko).

Changes in v4:
- Link to v3: https://lore.kernel.org/all/20260810034139.148-1-kernel@airkyi.com/
- Add missing RK3506 timing and the fallback path for get_timing
  (sashiko).
- Fix potential overflow and underflow issues in bandwidth
  calculation(sashiko).

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

 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 72 +++++++++++++++++--
 1 file changed, 65 insertions(+), 7 deletions(-)

-- 
2.53.0


