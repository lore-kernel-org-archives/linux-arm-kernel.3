Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1AEECA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 12:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JS5dd5f9mWNpybqKgfuEd/QJ8IUXo+CpfbvRDEoiIGk=; b=G+a9z3dqM8qFlbBV2l1egdE+NI
	vi0WSX7UWaagCKMiAzg+K8snozyNpIWCOPh5PJmxtO9h+8SmrXjZtMHh12tmG2fxIZPY4OAgp9Hxt
	4cwHwdmZxAN95lz+FwIPpdTSEWIQfiriEqdiZoUH0e5vFcRRGrMPk8E8K3auglS53oGb/pWQbeni5
	wn+IqbXbuFKQECPLNhnMgS83HH4b5YJif+b6Tl515yYsp/p9VdWM4cQKEpmnsxkXQtnrvMFzpEEEU
	bxko+Wk76xUanO+B7Ns3B1tOYdQGx5buHgxMkm9brL9mnkTzfP2MHzJc1Yh+hk57vaYKrrIUHU1U4
	8/wpg5zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBA4o-00000000WKa-3aPQ;
	Mon, 28 Sep 2026 12:03:22 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBA4m-00000000WK6-0bFH;
	Mon, 28 Sep 2026 12:03:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=JS5dd5f9mWNpybqKgfuEd/QJ8IUXo+CpfbvRDEoiIGk=; b=ECHJ3cZwUWSupvEzyzR1mPXOLK
	VK19JixYTDfT7fybYoFw9vuFW0SbnORD4Y9j8GdDG9U0x9ll+cMggmyyksZSibgyPky0jIZd9+52W
	0htIfPxgQIkqF1zy95076+JaRF1wxQO8It9j4Ch+hEUzB/qGtobQbbooz+Of3zfmBVp9BCNTCcS5f
	oZ/fo1tAlJA8vAJQG+hv1+g2hi8sxj6JDQmpbtgP6RN9UCZa2dRfAR4rfB4nuQ/Itfbs3LLphZKk8
	UjHJNwa39/cTltFE+yjkzF6teFeYb8PsICQ/fTQpmq2Zx1djAdWIYGQsCxAErGU/HHsafXnccJO4L
	ocKRP2tA==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Damon Ding <damon.ding@rock-chips.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v3 00/14] Add HPD support for Rockchip Analogix DP
Date: Mon, 28 Sep 2026 14:02:34 +0200
Message-ID: <3772572.AiC22s8V5E@diego>
In-Reply-To: <20260928081418.3605775-1-damon.ding@rock-chips.com>
References: <20260928081418.3605775-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_050320_351369_A3CF2BB6 
X-CRM114-Status: GOOD (  10.41  )
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

Hi Damon,

Am Montag, 28. September 2026, 10:14:04 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Damon Ding:
> Rebase after the following two patch series:
> [0] https://lore.kernel.org/all/20260915-drm-bridge-drm_panel-cleanup-v4-=
0-30401d9406f3@bootlin.com/
> [1] https://lore.kernel.org/all/20260916-drm-bridge-every-panel-v3-0-83af=
b4f1a707@bootlin.com/
>=20
> This series improves the HPD (Hotplug Detect) interrupt handling in
> the Analogix DP driver to enable reliable native HPD pin detection on
> Rockchip platforms, and introduces platform-specific HPD detection
> schemes with fine-grained interrupt control.


on my eDP panel with gpio-hotplug via the dp-connector as before, I get
a successful display output even on boot.

=2D plugged in on boot - display works / reported as connected
    - plugged out - correctly reported as disconnected
    - plugged in again - display works / reported as connected

=2D unplugged on boot - correctly reported as disconnected
    - plugged in - display works / reported as connected

Multiple plugin/plugout operations afterwards also worked nicely.

So
Tested-by: Heiko Stuebner <heiko@sntech.de>

Will do reviewing of patches now ;-)


Thanks for working on that
Heiko



