Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D55C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 08:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/Ohrs39hlVJ6gfC/U0noqNa3V3N+ZommgmvaEIkhTAQ=; b=B81HzHlOVadgVjX7C1MqucPl+3
	5B6pytF9pZsCOvjahjGpwGzyu8DEfVz8GTWYFEDTfq1pMu40nqkU2EEGJoIuTOCUUv2Emed35Tmm2
	pXm+9Aaxn7QJSRBu/UNtNwoctNWSGw+83m7zh39t1z5lSiAaK6pXJWQnRRs4ex8LfLG3iihGYBQrk
	aNG0t7JCppH3OGDP1RB8HiTJArjqdW5PVFwq1DiCIwhLCtDlQlj7HzKsfEnrIBndfRoR1jmAhkMff
	4oUgaeW4OgtbeIB5rFfmZyvZ6t6hc55AW4B5cKlwM7JFI4Fkf/NO8uWrG5+L6Qy4g+aa4gV71oMVA
	mrEL1qtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYKuK-0000000Hb2H-3HDK;
	Sun, 06 Jul 2025 08:39:32 +0000
Received: from mail-10631.protonmail.ch ([79.135.106.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYKs0-0000000Haug-1O1G
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 08:37:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1751791024; x=1752050224;
	bh=/Ohrs39hlVJ6gfC/U0noqNa3V3N+ZommgmvaEIkhTAQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=bQoU4Wm2XIOEOoU/Cxdo7xAG4YjGz3rj1xQE4Os+pTuSbwmrdSK1ROnoTkyJGdRlg
	 2/Ihs/8Wz2jRe4VrpQ7bw0MpmJ9n0DLwJsUoDgHvEPCfyEgCnUwZC1p/Ke8/XrpX9C
	 FBpsa9oeGlehPDymhHY7i0/Twrja5WhMLJE7T0Cyp2sQlzQ+NLvDDovgw1UoOmO4t8
	 UdNMvLcN7B7ELq1AgP0nOWYELYnP+OHXV9+LQ/vMwT71xKIQu6UjqoRAkEmPcadNCA
	 Die+hwEgVRWJa0cBYBEwaxoIpZkDSYVaQwle0IxtriscTD2KhcUSvDCCcrbWSmbzDo
	 J3tDcLe7viCbQ==
Date: Sun, 06 Jul 2025 08:36:58 +0000
To: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
From: Piotr Zalewski <pZ010001011111@proton.me>
Cc: Piotr Zalewski <pZ010001011111@proton.me>, Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v2] rockchip/drm: vop2: make vp registers nonvolatile
Message-ID: <20250706083629.140332-2-pZ010001011111@proton.me>
Feedback-ID: 53478694:user:proton
X-Pm-Message-ID: bdc28c03eaa8b0c275fd97f59617d9355f9144d7
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_013709_106639_AAF2C595 
X-CRM114-Status: GOOD (  15.20  )
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
In order to confirm that it is a timing issue I inserted 18ms udelay
before vop2_crtc_atomic_try_set_gamma in atomic enable and compiled DRM
as module - this has also fixed the issue.

[1] https://lore.kernel.org/linux-rockchip/562b38e5.a496.1975f09f983.Corema=
il.andyshrk@163.com/

Reported-by: Diederik de Haas <didi.debian@cknow.org>
Closes: https://lore.kernel.org/linux-rockchip/DAEVDSTMWI1E.J454VZN0R9MA@ck=
now.org/
Suggested-by: Andy Yan <andy.yan@rock-chips.com>
Signed-off-by: Piotr Zalewski <pZ010001011111@proton.me>
---

Notes:
    Changes in v2:
        - add spaces before and after '+'
   =20
    Link to v1: https://lore.kernel.org/linux-rockchip/20250628180914.11771=
77-2-pZ010001011111@proton.me/

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm=
/rockchip/rockchip_drm_vop2.c
index d0f5fea15e21..0931cb636493 100644
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
+=09regmap_reg_range(RK3568_VP0_CTRL_BASE, RK3588_VP3_CTRL_BASE + 255),
 =09regmap_reg_range(0x1000, 0x23ff),
 };
=20
--=20
2.50.0



