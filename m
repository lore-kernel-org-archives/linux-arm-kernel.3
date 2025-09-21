Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FCDCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 16:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+lFFGxaAXuhxyC60wyFAdmrF9GVKC8NDmo1gVQ1tBU=; b=RFXUUq15Yn/fFJTyKKfrWUByT2
	E0BZ5Pl8yeAOHgPX6gO3StQtqdfiTjvOXhcnnb4ZYI3O+wvEh68RtAtmaaztm3v26RfBhzflpLArR
	IamFVCdwmmWIZpM9080UnRAWeR4hd9zN4BXyWiaU1BGLEQLlCbo8gnaODVe5kBjFSCHdVJdme/77c
	ec5NdEf2r+3HqRIU0m8JVVsyuCC5Sphkwrzg28cKUsf3EaYGH9Yz0PrAdrU5h/a/5TPyUBx0PQdPJ
	fnc1zuWHpUDtnDvIsQ4ky8msiju2lFw3Bl0qVgctSYm/rjsStaCnQSSGxa0+OJvdwvZpAd3amsw8E
	b6zm1Ljw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0MsJ-00000007lkc-2wYH;
	Sun, 21 Sep 2025 16:25:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0MsE-00000007liQ-45GS;
	Sun, 21 Sep 2025 16:25:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A2C1944CE4;
	Sun, 21 Sep 2025 16:25:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67647C4AF09;
	Sun, 21 Sep 2025 16:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758471914;
	bh=4+lFFGxaAXuhxyC60wyFAdmrF9GVKC8NDmo1gVQ1tBU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=fT1X8zT50hl2pXeiLohHKGfigxhL9EZEmCFLlf9K+Tjlj6CalyQYnEuy+LCR5vJmB
	 sYKmJ2puO2ZdxqRB8Di7vErQnPDTri9bU52sWICrAfYNeBq+hSEaNRzcf5DW8rd4um
	 KOrc3oy0jNKIZrCh0DmYrWROTMxvcWT5pASMjfdw0zcmG9alW/d32IVRluZOYGrhzq
	 K4SKVPaKHxpSyV+WhjNdDv/XJ/zUMXZniouXpLbpbSXYYvZxySPA50H5yB+c1+WDbS
	 ywGHrLC62LlDnsRdo7sjREHp0d+eayNMyoRCkGO9Qg38eeSW+dPsbzX0okZ2PmBRWL
	 MS49cRGiCb7UA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250731-v3d-power-management-v2-2-032d56b01964@igalia.com>
References: <20250731-v3d-power-management-v2-0-032d56b01964@igalia.com> <20250731-v3d-power-management-v2-2-032d56b01964@igalia.com>
Subject: Re: [PATCH v2 2/5] clk: bcm: rpi: Turn firmware clock on/off when preparing/unpreparing
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com, =?utf-8?q?Ma=C3=ADra?= Canal <mcanal@igalia.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Dom Cobley <popcornmix@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Iago Toral Quiroga <itoral@igalia.com>, Maxime Ripard <mripard@kernel.org>, =?utf-8?q?Ma=C3=ADra?= Canal <mcanal@igalia.com>, Melissa Wen <mwen@igalia.com>, Michael Turquette <mturquette@baylibre.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Stefan Wahren <wahrenst@gmx.net>
Date: Sun, 21 Sep 2025 09:25:13 -0700
Message-ID: <175847191319.4354.13436181095126788590@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_092515_040567_2B573D70 
X-CRM114-Status: GOOD (  10.82  )
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

Quoting Ma=C3=ADra Canal (2025-07-31 14:06:18)
> Currently, when we prepare or unprepare RPi's clocks, we don't actually
> enable/disable the firmware clock. This means that
> `clk_disable_unprepare()` doesn't actually change the clock state at
> all, nor does it lowers the clock rate.
>=20
> From the Mailbox Property Interface documentation [1], we can see that
> we should use `RPI_FIRMWARE_SET_CLOCK_STATE` to set the clock state
> off/on. Therefore, use `RPI_FIRMWARE_SET_CLOCK_STATE` to create a
> prepare and an unprepare hook for RPi's firmware clock.
>=20
> As now the clocks are actually turned off, some of them are now marked
> CLK_IS_CRITICAL, as those are required to be on during the whole system
> operation.
>=20
> Link: https://github.com/raspberrypi/firmware/wiki/Mailbox-property-inter=
face [1]
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
>=20
> ---

Applied to clk-next

