Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B2CEC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 18:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dq6sTVoUvyIYla+M1WiLd0H4wGmmDdgUa/v1ni4cxzA=; b=xS3fdBJ45VmOpxth2qzZ60mgSp
	v1t7ARs2cdYET45vKaccoXNp0Q27pFmNw5udUPJQFpkGSaXNDmBSoS2fJCfR07thajHwMtvYMYz3v
	972BGf0i+zhGQa6Fc41IGmM8ImLnMQUL61HvA5oUkmMqd5ia7GQJHREcC9mFw7xJtfnGhaPtVzp8b
	2swlrRgASPC9wn6i6OeB5XPZj+RT4KXlwJNrxns3SGBH/TvA1YNi6ge9OFTVLt2/udXBJyXvhOqnF
	KLgYnRo8YxcFMH31nZO/igybtNmqCKvOFH66tjphCoywM7M/Z/5pB65CqLMKHdV2VAgBQ78bm6gV5
	Y9z27I4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVa3X-0000000HBlO-0HFn;
	Sat, 28 Jun 2025 18:13:39 +0000
Received: from mail-10631.protonmail.ch ([79.135.106.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVa1C-0000000HBds-2DFI;
	Sat, 28 Jun 2025 18:11:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=6cpe4ktcdvd67ngbngfuz5xzca.protonmail; t=1751134268; x=1751393468;
	bh=dq6sTVoUvyIYla+M1WiLd0H4wGmmDdgUa/v1ni4cxzA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Ec8s2KMC4SC/8PnZ0fXrVzIwaMSosjk22f1lvjVVhR6WKSB8mHkF1ZnWUJDwRlN3d
	 O5Pa+f7QkVv/a+qR74ytqZMHjCJ8VrrKr4vZc1oqz1VOt8gs5SCFOUVcGAiJpBn9+z
	 xhGcxOc39tHaQRZtNuW564JTsgewLdlUEX3zcssxyu08TMP25TbGBt8TfY0w7OZ7Hs
	 8eWNu9Dl9ubtxdO/FpPp/d7jJ6bwnVx5btKdOhIRT/z93YE+jAZ9uJ9/XBo7MlToII
	 dBO9kLHPW1CNBKY/laqf+9Z0GdApiEclzFJ0qFIlrrHA//6I1gJHb4ubSJj37QThrv
	 vz/2gWSbPKmag==
Date: Sat, 28 Jun 2025 18:11:00 +0000
To: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
From: Piotr Zalewski <pZ010001011111@proton.me>
Cc: Piotr Zalewski <pZ010001011111@proton.me>, Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH] rockchip/drm: vop2: make vp registers nonvolatile
Message-ID: <20250628180914.1177177-2-pZ010001011111@proton.me>
Feedback-ID: 53478694:user:proton
X-Pm-Message-ID: 545f9ed5d7d61bdded3750b1707295524307882c
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_111115_184396_D598E394 
X-CRM114-Status: GOOD (  13.46  )
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

Make video port registers nonvolatile. As DSP_CTRL register is written
to twice due to gamma LUT enable bit which is set outside of the main
DSP_CTRL initialization within atomic_enable (for rk356x case it is also
necesarry to always disable gamma LUT before writing a new LUT) there is
a chance that DSP_CTRL value read-out in gamma LUT init/update code is
not the one which was written by the preceding DSP_CTRL initialization
code within atomic_enable. This might result in misconfigured DSP_CTRL
which leads to no visual output[1]. Since DSP_CTRL write takes effect
after VSYNC[1] the issue is not always present. When tested on Pinetab2
with kernel 6.14 it happenes only when DRM is compiled as a module[1].
In order to confirm that it is because of timing I inserted 18ms udelay
before vop2_crtc_atomic_try_set_gamma in atomic enable and compiled DRM
as module - this has also fixed the issue on Pinetab2.

[1] https://lore.kernel.org/linux-rockchip/562b38e5.a496.1975f09f983.Corema=
il.andyshrk@163.com/

Reported-by: Diederik de Haas <didi.debian@cknow.org>
Closes: https://lore.kernel.org/linux-rockchip/DAEVDSTMWI1E.J454VZN0R9MA@ck=
now.org/
Suggested-by: Andy Yan <andy.yan@rock-chips.com>
Signed-off-by: Piotr Zalewski <pZ010001011111@proton.me>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm=
/rockchip/rockchip_drm_vop2.c
index d0f5fea15e21..241060cc24cb 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -2589,12 +2589,13 @@ static int vop2_win_init(struct vop2 *vop2)
 }
=20
 /*
- * The window registers are only updated when config done is written.
- * Until that they read back the old value. As we read-modify-write
- * these registers mark them as non-volatile. This makes sure we read
- * the new values from the regmap register cache.
+ * The window and video port registers are only updated when config
+ * done is written. Until that they read back the old value. As we
+ * read-modify-write these registers mark them as non-volatile. This
+ * makes sure we read the new values from the regmap register cache.
  */
 static const struct regmap_range vop2_nonvolatile_range[] =3D {
+=09regmap_reg_range(RK3568_VP0_CTRL_BASE, RK3588_VP3_CTRL_BASE+255),
 =09regmap_reg_range(0x1000, 0x23ff),
 };
=20
--=20
2.50.0



