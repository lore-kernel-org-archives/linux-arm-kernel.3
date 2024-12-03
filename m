Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B733E74AD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 20:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4UjsiC0KsWowBXHcrV7nZu5jRThZpr9xrSV3uf9AHMY=; b=3GNhkIgXbdVO/Q9WrDUQCDgDIh
	rKPyKcesTfoCyPyRhvwKpMllC4nyMnoG86FLL/23K+RxkJyHUghdtVcbBuiiSz7iJqPl+FK6TEzvt
	5lsQlQfa3uIZiKiyEGYY4b4k3W6/4sWaZTH3wLEjJ87hcuw9WYpkY/J1DQTsYaUbz5EvoACS1AwW1
	Q8F6Fx7ZAyd2XYvEDJ5FzCXIi3Bq6J6zE6/4SBk699UPGOXqxR8vW/yj0A2eHh5FJgMWlNg/d2pr7
	TYBEA8ELkMGqmfclWRqLwbkRnzUM8oMIf3pR/qVdi68UpNafMIm/3uoUqCPNVmj8tIWNbtodmLmFk
	yYu6vlaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIZiH-0000000Afeg-1MdX;
	Tue, 03 Dec 2024 20:41:41 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIZhD-0000000AfOM-2tpg;
	Tue, 03 Dec 2024 20:40:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 87DD1A40BB6;
	Tue,  3 Dec 2024 20:38:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58FBFC4CECF;
	Tue,  3 Dec 2024 20:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733258434;
	bh=4UjsiC0KsWowBXHcrV7nZu5jRThZpr9xrSV3uf9AHMY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=jZbD5cB+8cM095ogWta+4NF5rrGHNyBhea4lomQM43bAe6yABlDfcBYrnNi1biFp/
	 YU01SFTTaCuEf7yRX102QK1LMjnUlK4W7XdvR3m1DFL2b+mltLTCveVTd4h+9EWX74
	 uADzl9CJNHLdocs3bt/4VEogA6aLuG/H1+zJiUsnhHp3jM3iOfpRdpYSx/clEjUKt4
	 0WLEhyZl72QMs5JJFv1QEIq6FzQz463EpnLWsjXp2t8d3vq80LTnImUVlJQ6ET8boQ
	 e83xR84FZ547Wz2dmicOwaSjwrfa50SdptnQHe/GWx28Z5Wm70sderqhxnwSowWALh
	 C+YGurMCYJ2TA==
Message-ID: <0c17fbef1e4dd692e2459255af0b4ace.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAPY8ntD7tf6+PXKdWe8_KjCiPoemR0RQDiaHHndtjutOLGbR1w@mail.gmail.com>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com> <CAPY8ntBM=34pTiQ=t-CjtYEE5Ax6D=EtiY-sLT1keUkUMXuLeA@mail.gmail.com> <20241122-orthodox-mantis-of-reading-2dcdcf@houat> <13cfb66b-f904-4720-8829-a6d9db85aaa5@broadcom.com> <CAPY8ntD7tf6+PXKdWe8_KjCiPoemR0RQDiaHHndtjutOLGbR1w@mail.gmail.com>
Subject: Re: [PATCH 00/37] drm/vc4: Add support for BCM2712 / Pi5 display hardware
From: Stephen Boyd <sboyd@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, =?utf-8?q?Ma=C3=ADra?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Michael Turquette <mturquette@baylibre.com>, Javier Martinez Canillas <javierm@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Stefan Wahren <wahrenst@gmx.net>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Dom Cobley <popcornmix@gmail.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Florian Fainelli <florian.fainelli@broadcom.com>
Date: Tue, 03 Dec 2024 12:40:32 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_124035_801877_1001B4E2 
X-CRM114-Status: UNSURE (   9.64  )
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

Quoting Dave Stevenson (2024-11-27 06:43:38)
>=20
> V2 includes fixing Maxime's comment on "[PATCH 31/37] clk: bcm: rpi:
> Allow cpufreq driver to also adjust gpu clocks" that Stephen also
> commented on.
>=20
> Stephen: Sorry, maintaining newbie, particularly for clocks. I see in
> linux-clk patchwork they are marked as "Awaiting Upstream". What, if
> anything, do I need to do on those?

I wasn't expecting to take the patches. If you want me to do so please
resend the clk patches and I'll apply them for the next merge window..

