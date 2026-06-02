Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C1AACD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 15:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D2Q8yZjcE6URSIFp/8l4k3tj4V+4OnaUv/+qrKDMmyY=; b=twOOHea17Bi7lfnA9VxW6XBSlv
	AqgcKGWGErD42xyck+r8L6Mv9VGDSE41SeG4GMr/MqhWc82Jp99wSG4jx5tj55zFCYJNoxsiIWnox
	LDMXxNrA8raXm9slUZhvsslyCRFDjkepRfVgjApPsgWq8PZvsv5ua6mAESz+50odRFw/DMr1nB6V1
	9wemF2wiZRdSAENuEZCbZ+z9C6js8ZQMrRoZi1Z0cWiHfuvmBQaMtEZc+YphvbmlOHUhlndexTF5O
	rLq+HCfCIYMrwRZv23Wfr/kR0rLN7mAqpLpB81jpa2CgXZIkYEV16LO8jdCONDhFkBPItnvtnSLOz
	KcIsW6Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUQeQ-0000000DEzd-27RW;
	Tue, 02 Jun 2026 15:03:30 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUQeN-0000000DExF-3NqE;
	Tue, 02 Jun 2026 15:03:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=D2Q8yZjcE6URSIFp/8l4k3tj4V+4OnaUv/+qrKDMmyY=; b=TfBwYGZPAMIOMq+iAAVb6Rhd+O
	hkcWFD8AzJEueRISKQ3eNbTSB8xVbPjGwHc5JLWiR36h7aJyEePF3igsdDLyzZu/Kgm8KB6rK/Cd+
	Gf1HUusEzp6Nygk3HCW/Ax4P6zzQFwo6piryYJOWvBneULPMroZ1OyPeDQN4sdhxyYb5H6uIukOBP
	txtjzezLD+vsIVw6vjIMbEwPuR1c5187ZUGHb8mgPnrq/jGNvHUma/qRv7V54LLCFk3XWFwG6R9M9
	UJHowoq0Tf/g8yQkemD+uDVa1IzHiptKPTPsEqbnHkAF7zci+vM5JyLIotxezN4S9zVs9jM/1IU2w
	8/aX5IPA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 64/76] drm/rockchip: lvds: Switch to atomic_create_state
Date: Tue, 02 Jun 2026 17:03:13 +0200
Message-ID: <8196895.2l3rmUXbR5@phil>
In-Reply-To: <20260530-drm-no-more-bridge-reset-v1-64-875d828d31bc@kernel.org>
References: <20260530-drm-no-more-bridge-reset-v1-0-875d828d31bc@kernel.org>
 <20260530-drm-no-more-bridge-reset-v1-64-875d828d31bc@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_080327_891278_67CD77DD 
X-CRM114-Status: UNSURE (   7.59  )
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

Am Samstag, 30. Mai 2026, 16:00:09 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Maxime Ripard:
> The drm_bridge_funcs.atomic_reset callback and its
> drm_atomic_helper_bridge_reset() helper are deprecated.
>=20
> Switch to the atomic_create_state callback and its
> drm_atomic_helper_bridge_create_state() counterpart.
>=20
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

having looked at the first parts of the series adding
the new functionality, this change looks good:

Reviewed-by: Heiko Stuebner <heiko@sntech.de>




