Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C320CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 11:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4DQ+Z2QTK6zf/R0PR67dSNm2gN4T+XP+6ofTVJ0EgWM=; b=NBzJOdLW5KA0xg5xbKBytS65l+
	LGVtWLyrlK7YPUQ3rgN7OZbv/Z3znXsVtOopZ96S1Gck7QphWm6eS1ZDINgIwN3Xhkt3kMOasbMqV
	cKiFNDaHGh3nhD48xQLz5TtHjiYdP5VXpzCsLNG6lo0U7Ep1p+m7CYb001HtPtgrvrELDbazpileI
	CiRnxE4elUt3kgZ+SOIgaW6DxoFqMVOlorulUCiqM6gQ43Roy7Bw8r5ifEHNZBEeN+eukk7d//t5M
	jkXsMfresYVKUkOvCVJCQ/ofGf5dlyv3xP+ZhjP+bCheRMifjMh5ef4JdmpkTlJLlXvCXdn/9WB8S
	2L8eg8tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPelM-00000004PFx-0Zku;
	Wed, 20 May 2026 11:06:56 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPelJ-00000004PFM-3ksL;
	Wed, 20 May 2026 11:06:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=4DQ+Z2QTK6zf/R0PR67dSNm2gN4T+XP+6ofTVJ0EgWM=; b=h34rCyzWSizvdmYrJY3LtxwPYf
	6pcft3/GMrE2vVjZLMAslEGwIUN3u9xI8wipRucHSb8LfUZBTGbVxC+YnMgxGQb8avEKbPxDPH0WU
	4DI2wOdWO+b3zzpMwLI9maETh439DnARe1LRJv19uMYYyL2k6scDPI8YaLz4sx22kHRmlgVorC80t
	dTyKbHJi/jngreltubMgNqJRiVmbHrLT+ML6vdMantBMP1cHBQedw0fegH+4LCRk15gk5UtF4ttCk
	E/B6meFzp2AgJDqNyRQteeKEB7Ye6ZoP2Iz/wuZ4lrk9Ct1LoIEv+EdMflwG0h69/gZy4uk6CqAUU
	/epKFH4A==;
From: Heiko Stuebner <heiko@sntech.de>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Chen <hzpeterchen@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>, Dragan Simic <dsimic@manjaro.org>,
 Johan Jonker <jbx6244@gmail.com>, Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, Hugh Cole-Baker <sigmaris@gmail.com>,
 Chaoyi Chen <kernel@airkyi.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: Re: [PATCH v15 9/9] arm64: dts: rockchip: rk3399-evb-ind: Add support for
 DisplayPort
Date: Wed, 20 May 2026 13:06:16 +0200
Message-ID: <4056242.GUh0CODmnK@phil>
In-Reply-To: <20260304094152.92-10-kernel@airkyi.com>
References: <20260304094152.92-1-kernel@airkyi.com>
 <20260304094152.92-10-kernel@airkyi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_040653_932488_0A468672 
X-CRM114-Status: UNSURE (   9.82  )
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

Am Mittwoch, 4. M=C3=A4rz 2026, 10:41:52 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Chaoyi Chen:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>=20
> The RK3399 EVB IND board has a Type-C interface DisplayPort.
> It use fusb302 chip as Type-C controller.
>=20
> fusb302 chip ---> USB/DP PHY0 <----> CDN-DP controller
>=20
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Apart from what I replied to the cover-letter, it might be
nice to split this into
=2D patch adding the fusb and general type-c parts
=2D patch adding the dp altmode

To make each part a bit shorter.


Heiko




