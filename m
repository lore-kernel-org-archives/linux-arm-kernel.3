Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1489DCD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 May 2026 16:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hDm0vrtbyfLR0/iE66wpgh8fRKk+QAsLWLuEb5PPkN4=; b=h96ZfK0imNq6Iw
	2QdD8ItSEbXwLSGQwh2mM06G7FSJc7Mcl8x1r9EaM1fQ8j+hnGP7lI6ofp05YXo2ml6rP7eb5TOA3
	ymWz9XloSMCIks6YIYQXzb75iC2a/8PHxVs8LxRnd2JxYu4xi86WRW5Ki+qM0FoOz+1GccNoD6hfO
	AyOvH9oeuw8dW1FVIv5uKjA8sQs0P7nACyfddxKVO3BDmrWosNJtf9HzQrYFp12r2VrPyf/sd1+Cl
	0L1PBkX50MmwDUyf4qk9ajiXAqmDQqcorXQBUF6S5M+loMl1+5p5dqc04eHCMK0AFtB5nFMNddbmU
	uGnAjEcJi1WJCF3400qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRBg3-0000000FGfn-443I;
	Sun, 24 May 2026 16:27:47 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRBg1-0000000FGeb-2UwU;
	Sun, 24 May 2026 16:27:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779640062;
	bh=QFCgggknjOATRW/TDy4B91bZJukHxDqEhm2761Ixqtw=;
	h=From:Subject:Date:To:Cc:From;
	b=o7izL9+O6MhzByckC2blHRZQN5pNHxAK4XT2KWmx/sneSlmeVKJ8siB0P5jftYFdY
	 qY5NERwfXXEsxJsu0IQcCnH1Yw+hvC5Rdywi/5lFowb5xLn9KPk84XB+7trtCKBXHo
	 bW0NFYsk7DENKZqE/HJUYxNdX7sjBW3f7+55DPNtX+FteQNVZodct5r4Mfzpuph6L1
	 A+lNa34GXp5KUJDcKOqEjWwbZXtYIGajhCAktXqfh1sPKawnX8YYj12dptA3GJBbnm
	 B6/TIzo5i/aQEgaiQZo60eXlF0EB9f1CqaMNJYM9UAtWNfCuK6vMmYGrOeQHfjvBZI
	 xdCaNbd2h6Uzg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1B97217E093F;
	Sun, 24 May 2026 18:27:42 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH 0/2] YUV support for VOP2 background color
Date: Sun, 24 May 2026 19:27:27 +0300
Message-Id: <20260524-vop2-bg-yuv-v1-0-dcb6a52923f5@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrE1SjZ/UVcRCa9RYIC0NEXdXL
 L/Fexd4ckwe6uQCR4E9L3NEliZgxm62hNxHgxSyFIXMMSyrRG3x3ANmWlDZCWWKSkEsVkcDH9+
 taX/7XU9ktncB9/0A2WOk528AAAA=
X-Change-ID: 20260524-vop2-bg-yuv-1b0e6a09c579
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_092745_784251_A99B4C4B 
X-CRM114-Status: UNSURE (   6.19  )
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

Since commit bec7cbfa7d4f ("drm/rockchip: vop2: Support setting custom
background color") the VOP2 display controller allows configuring the
background color of each video output port.

However, this is currently limited to RGB formats.  When operating in
YUV overlay mode, the color must be programmed using YUV format.

Add the necessary RGB-to-YCbCr conversion logic, covering all color
spaces supported by the display controller: BT601L, BT601F, BT709L and
BT2020L.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Cristian Ciocaltea (2):
      drm/rockchip: vop2: Rename CSC_BT2020 to CSC_BT2020L
      drm/rockchip: vop2: Add YUV support to background color

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 154 ++++++++++++++++++++++++---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |   2 +-
 2 files changed, 139 insertions(+), 17 deletions(-)
---
base-commit: 213c92ac9717e4951f052a499f91c89302889813
change-id: 20260524-vop2-bg-yuv-1b0e6a09c579


