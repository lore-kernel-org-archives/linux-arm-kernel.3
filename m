Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C165C606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 07:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eEm/KDAb;
	dkim=pass (1024-bit key, unprotected) header.d=airkyi.com header.i=@airkyi.com header.a=rsa-sha256 header.s=altu2504 header.b=JnZOZtD5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QjUw+2kIgxNmIRZcsifp7nN5L+j7gN/V3v4KCZkaLmw=; b=eEm/KDAbtd4alTHgmwrmDgbpR7
	NDF04tfURTd+t9ygniR7M7r3SzzQyPezlAfskHXZ1G2LXjkq7k7BT8Me9mbjfoV054qXNyhhOIBzm
	YO8mbtTWs0Ha9O0zyZEdf520FXWNVEmV5lLqM07rTM335z3aQV6ZscjidC097Dd2rEto2ivxGo3M6
	bjUqX13L3YNVtGFcMqG0SjA/2tcDC+YDfkqInTZezwtDTBk0QEQLIl2cmwX4OkE/bScj17tnJPy0i
	qW9G2hxQpW/0/SytvuaKrGkUmyap1Wtwd0lk3p1pZZraAWVgBTQoplaWRs26uRLOOTYMH83mrPtzm
	1Dq+6B5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJn58-0000000DYD3-0m55;
	Thu, 22 Oct 2026 07:19:22 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJn53-0000000DYBw-3djg;
	Thu, 22 Oct 2026 07:19:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1792653493;
	bh=QjUw+2kIgxNmIRZcsifp7nN5L+j7gN/V3v4KCZkaLmw=;
	h=From:To:Subject:Date:Message-Id;
	b=JnZOZtD5w4AbDz+LqkMLwwojz+oZA/pFrmcwwo5zPlSgGALlGckwfbshZrqmMpTiu
	 kZothQ4evEFVvIbyKvEgzbOtmmVkjUz0vBF7a7qI9YqY2oF72dxEQc1g1A/7Rjt3+8
	 CMQJEVZ4DJt4+mSGVxN3s2dWO+pMGw9VCbO/UGnM=
X-QQ-mid: esmtpgz10t1792653486t4a2ab009
X-QQ-Originating-IP: h2yaRNFQb6Ei6q1nI4we5w8kZoco3AP8xkEaOsyViFc=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 22 Oct 2026 15:18:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6284087679707757170
From: Chaoyi Chen <kernel@airkyi.com>
To: Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andyshrk@163.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH 0/3] drm/rockchip: vop2: Add 8K support for RK3588 vop2
Date: Thu, 22 Oct 2026 15:17:34 +0800
Message-Id: <20261022071737.508-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: Odky5wNUcHo/YCa80XQB9bTx/4SXD48tfuBQ2Wes57AEWIvRYAO1apvO
	m7Emup3ovRwNCE9Bq5AXaf8LWlFzgqMkK0VVvzayrdWOOqWpN7jj0O+nmOFWass6OJ78cm5
	1dDpcq9yYO9uWweVdbtXF1aMtPqdX4XdgYSx7uHSlnlLrdf2dNXoYCEhghJux8Pv2oJWjSa
	o802dR76lPhhRQSCZdQGlM0W1sBR+NNEfLDQcWVVpRNehlUNoBdR02Fauo7MOroGVjo5t+/
	hIAkruBfHyPigZVmCSANRkBgwgWUg6hz5I4OctiTa/QLZsG6JnRIB3DnJTNQi23hOSO2cC0
	/0lchAlI63m2aaDC8KosJsdXxEJEN6PjaTAkurm8CsJ//1OFMcPvD2yBMU1/Y7oW4RAE1qV
	l1+osV+HpNtyxPbLFwDv2Pr+x30ipPOI0bCwrDHxLHR6YIpjUY+1rUFPVOfbCeo0kPP88q6
	Mo7mKsXju8FQAomQ6boFMJoNfkv57Q6Jwgz8nFJgcwA0kRpRsLNFa/TVfZDLT118wyzTZgE
	8bwjRs1ssQK6FjiF1AnsSQX++4J4rtIgtRuZa87a/icg8EnYia8CkaLgKlDwNQRf/rb9kgk
	8pw5+8gO3eNslkdg+H5HvGwTCwUbPHPNTdR4Yvcu+SZQE8HItAxQEv4+tc1GNKkUmF8ckvK
	pk9gLyek6uI/D7tPeARxKtjT65pzYa4Quj4LdJ7tfy6aJ4Y/eifz9m4BhRqw1y2uq83lYlT
	dJQT314U4EWShGlUOU7jcId6CzUkQWtMx+efBJFhM9QNSDyZqYv2gnUSg7IZztYlEEdBR26
	hhKoR9IAfQLn6LT+MW8wr+lOANs4bAdW6zMoMe1UF1YFTjSJ0LpzejZW2aESMfJFHkY5v2r
	kPO+gGj6ZyrfhEKtI/Dcp6Yhjy4scjmWLpkVLPjXNC5H0potFZcXHM4sfqxl+OBvzjjs/fD
	PdBxoZ0VSAFsVW6f7v4Hz5865C5sjPDhodsKvIKWi4eaKDEpcQUgpJJu6b5C4Fai2flw=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_001918_270835_CB07DB30 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Hi,

This series adds support for 8K output on the RK3588 VOP2. HDMI is not
ready yet, but I believe @Sebastian and @Cristian might be interested in
this?

8K output on the RK3588 is done by splicing two VPs together, with VP0
outputting the left half of the screen and VP1 the right half. In
addition, 8K planes have to be split in half as well to stay within the
width limit of a single plane. Similarly, there are a few post-processing
details that need to be handled.

Note that splice mode is not only usable for 8K output. This means the
mode can be tested at 4K and even lower resolutions, by simply changing 
this one line:

-#define VOP2_MAX_VP_OUTPUT_WIDTH    4096
+#define VOP2_MAX_VP_OUTPUT_WIDTH    (3840 / 2) /* for 4K test */

And yes, this has been tested at 4K over HDMI on the RK3588 EVB1 :)

Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>

Chaoyi Chen (3):
  drm/rockchip: vop2: Use drm_format_info_min_pitch() for plane offsets
  drm/rockchip: vop2: Skip UV plane setup for packed YUV formats
  drm/rockchip: vop2: Support 8K output by splicing two video ports

 drivers/gpu/drm/rockchip/rockchip_drm_drv.h  |   5 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 410 +++++++++++++++++--
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  63 +++
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 193 +++++++--
 4 files changed, 595 insertions(+), 76 deletions(-)

-- 
2.53.0


