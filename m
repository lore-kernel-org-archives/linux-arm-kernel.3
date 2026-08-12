Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BBBDC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 07:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0RC7xRrCg2fRyRdaPN4OfoMhKYrQhs7hQgPg17BL6Ko=; b=os9g7bm+tq6UT9Kgbwx+kpUwSb
	YYd2LubhC5vlpuDAxE6LWxsSsK3PzrjdtB8G2IFo+aa/8z/58TeVJNDhSUdmQD/O2Z1P4D7kEZuad
	p16fHaVQj1ciNnc+Aw6HyTJ9GODvnUD6wwUkp04ELcOhuRvLeWk3Pjjv8Tk+uHdRUMxzJQDhtKwt0
	gCGmZI0P6Y9Q26gtC0ewqEGsxhu++uOAgZuDy3MV3wPM+An+6Yy++z9ko/oP9p2K05EU6rdcZtbiz
	5Th8GbPoevho3lzfGl67RpfyabZlkJx3mK13r4X2KLNaL71aeFJ/Gn1I8HeP2kZBhSKxrweeELbJj
	GxgC3peg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu3R4-0000000FaGl-224f;
	Wed, 12 Aug 2026 07:31:38 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu3Qr-0000000Fa7F-0EJR;
	Wed, 12 Aug 2026 07:31:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1786519810;
	bh=0RC7xRrCg2fRyRdaPN4OfoMhKYrQhs7hQgPg17BL6Ko=;
	h=From:To:Subject:Date:Message-Id;
	b=UK8ut0f6rnMmCkqNB5k4Gd3LpZWIybSS67HKfzyiNtngDgbrVETTi/ChTY0IWHl5b
	 89X3oJCtcQ1MDvVo9kUhlA7tllHZR86gJmRI0Wo/D1VusvxL3EX7FXbLeV9HmKXcNh
	 UQfrpgu5klK8issKrcrxZF14rtjplGiKSHZ4QbRY=
X-QQ-mid: esmtpsz11t1786519808t4eb45b90
X-QQ-Originating-IP: DgtAwOy9jdG0k6Bs+ZsEkTWYn6YpyP6FVOvGZ4eBsiw=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 12 Aug 2026 15:30:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8909177870970302575
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
Subject: [PATCH v4 0/3] DSI Controller improvements for Rockchip platforms
Date: Wed, 12 Aug 2026 15:29:59 +0800
Message-Id: <20260812073002.328-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MiFyYB/G/ykN0w9TFmXJ50x3rL0ebWlYGJMQN7opWh2C/ckBzuHZtynn
	k6uiuFSZNrdszksQOHGzCC813XnhsEeEo84/AHMDq9KdMD57YCo30SbA77KLy23KC82K85w
	hBNpTzvlYiDCIAIc2i/8tAKp5QkCM0K36w6J0rbuUplbV6kQoeI/lpH5Q5i50Mj3QfgM8mv
	bLbL45Qx05DlEzA28NMChpHUbTZz50+kbsolOl7Rsp+da3QiPvMy973HtCtoo4UDaQ/Yt9J
	GPm9OTeIYpufGvYZoLfXF9SqeBOpkw3RoF3+E5tJMpGWaJX/PwL6At2iDxk++0lyiW5NoWs
	sqk6FqpEfXXCQP852Nu8nB6ZgNiZsrYNBUd5VTlzk1Kpmb2CLapuqxYuY10xvwEEtF1bQt4
	fYnheko1kCdkaJMazTe9Jzlmcjm5YlyIivOdYPb0l7zNQexfhyhZDomkL76FTPGHa/kZazW
	o2OBbRZyNvR3OlZRpYrkOnjmQ8jvcIhMoNsemLDWN42OHMiY1nuL8Ss7RQjh4CZfOiyfduA
	UOMvgopejKMmpEDWWKpI3F2vD0h1jxNIXZ6B1YaVhIAFrSzd5WK44JqzK09fcnVjx4j4s1D
	UHu1dVEQ7jtpHDU4rZmIBz1nSxglbg4ERcz8tVlBrlO9A6HmmPQ0GS3ALSr2G47jLD2t+P0
	UCamCjALISFf62p6vhjIKNt6OKB4G/M1Y+Fu7NHlfLJW2ljPmKHemDOL+9WhMe5kYDpmESg
	TDUEkqRldqn79HCvzFORoIMcxObEvXs4g0VzqDMpqiL7GwkS3ancsDlxDXyVPKx6SdPyY8m
	iTv2S3nOe+OwW51dAMrG7k61Lrgiv/csbXNuUMqQTLgbrIHEcIHbD5RuVK4qTBSPGOB6TO5
	knUtkgAj1wl9SIe4A/aHSxYCHF/R8Z2oVqAoEM8dROGcxShCEYS9V4b+v4yeuT1QnCUzCvd
	+qTfGyobKYFoihzIDfM1qDIBKQOjjzhWm1hriiEvM/ReQ78lx3l9/zvMEO0TOy/13YG8o2l
	YFfhQVpVtG5+YcVNUiLz/WljRHO0O16ETHxl7hXh1jtI6ciDav
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_003126_146542_4A85F497 
X-CRM114-Status: UNSURE (   7.61  )
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

 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 70 +++++++++++++++++--
 1 file changed, 64 insertions(+), 6 deletions(-)

-- 
2.53.0


