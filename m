Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5E3D44C7D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 16:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=30sljGf9KKkVGcqIvu3SjUVHF1bmoGMchI1TRySHtPY=; b=hJPRrrEf9sNFDh
	wDf5r46sBAFHP+TUfKRqdkUqHO4fU6CR82/0dZPpSFXgTwekRM25S9Rfx1N3+l1k9YU8YqnpkHA1c
	cmvSc0NnqJiVhFpPirrslMNXIlsyYGrpZcSJ3eHsAUPrpdgsy4syNUqysYezrN4h5pPi1hijBRtAt
	8XLfiufA7xVEWyBSXik0R5RJRT+GdBr7+vdTZd3qU7xcaIpbuuwq1Akkvdk7bPA5SrFP8KMtbyjm9
	mPGznXjPkb3lsJCUFTOuN41x+WVF93l1twiZxcZMMrS0PWAmbrw9Fp3HstwT21c0nqMiNh/w7nIM4
	zR/l/ygr9gaX6K4c4Rlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgQ9o-0000000CgUN-0Lfl;
	Thu, 15 Jan 2026 16:25:12 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgQ9j-0000000CgS6-15hj;
	Thu, 15 Jan 2026 16:25:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768494303;
	bh=bHsNW7HAQnNrUBtDDGcPlMhwlJ9HZhIEIGRZ5AuWkrk=;
	h=From:Subject:Date:To:Cc:From;
	b=E7zLKdVdJTAB6HdQdqSN8pRKtGdAFX/mRxTQg3sKw98q2/vhGHPeZ8gJXZJF4oD3G
	 WKJOOZCT+b0MdsFZT4JR6ftaIePKRHSXKUHRDkAzjRnaOd8kblQ2pt3xhx6Lq2RA9i
	 O8hKsD/A5jjei0fxDet6U1Rl+fBd5GaGsjirPtTUYG3Fr9D3BC+7nka549WpDNfbwf
	 lS5DSohKyULQzubpth17mHrZF7Gy9GdzvVtLw5SVWkor205FJuOEo2XAUNXSB60Lp0
	 Bl4aQOe1HL0lOSzHPKU0HlpouvJ73e9QsbOmcYEkhUiHPrnIxZitCKiv1xVvgwcAwu
	 vjpbNQ6vkQP0w==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 514B617E0456;
	Thu, 15 Jan 2026 17:25:03 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH 0/2] Hotplug detection fixup on Rockchip DW HDMI QP
Date: Thu, 15 Jan 2026 18:24:42 +0200
Message-Id: <20260115-dw-hdmi-qp-hpd-v1-0-e59c166eaa65@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMoUaWkC/x2MMQqAMAwAvyKZDZiiUvyKOBQTbQZrbUEF8e8Wl
 4Mb7h7IklQyDNUDSU7NuociVFcwexdWQeXiYBrTN0Qd8oWeN8Ujoo+M1BpryVkugBLFJIve/3C
 c3vcDzo5WxWAAAAA=
X-Change-ID: 20260115-dw-hdmi-qp-hpd-142881a8d81a
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_082507_488693_202B1FBE 
X-CRM114-Status: UNSURE (   7.56  )
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

The threaded interrupt handler on RK3576 responsible for providing the
HDMI HPD capability is currently unreliable, since it's affected by a
bug leading to a broken hotplug detection in some cases.

RK3588 is affected by a similar implementation deficiency, however it
doesn't seem to cause any functional breakage.

The series aims to fix the RK3576 HPD issue and optimize HPD handling on
RK3588.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Cristian Ciocaltea (2):
      drm/rockchip: dw_hdmi_qp: Fix RK3576 HPD interrupt handling
      drm/rockchip: dw_hdmi_qp: Optimize RK3588 HPD interrupt handling

 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)
---
base-commit: 9b7977f9e39b7768c70c2aa497f04e7569fd3e00
change-id: 20260115-dw-hdmi-qp-hpd-142881a8d81a


