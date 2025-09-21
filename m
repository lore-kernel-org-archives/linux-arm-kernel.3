Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3661CCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 16:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T9JqLTewmUpzp1OJfKf6FYT+qzF9twZfYc+1+MFwbns=; b=kbm0nlu2Z0MYkFQk0qSNJfdi8L
	dtWMz/kp3Du+McFiEFSjnczu7hyibJdJz6wuGzCq1XGkkn3FYik/KWyjYEnf5bP5giPy03a+I4O+R
	qfk+9FzAzz+ZXL3d03HvQKJy712fOTfYRdg2oOqIOZ0sVGMOwm/Tqu2bx6ANJByXt+7hAG5eMf90j
	HUAiL5qujy6BwYnBxa6s0lXTviSupil+hYnZWx9+w5cN9KwhaDSCUsPDUTQmGvBscNKslCStaeMVw
	QF9TGM/OxQt8/9Pdf54o6Y6lpaJaDETcDOrLUcIhboNvncMsIoHXEk+c52nljPsdvv/KAZHZFX/5t
	eojJaKZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0MsE-00000007liP-31Kx;
	Sun, 21 Sep 2025 16:25:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0MsC-00000007lhq-05Yf;
	Sun, 21 Sep 2025 16:25:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A4BF343EA5;
	Sun, 21 Sep 2025 16:25:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5766BC4CEE7;
	Sun, 21 Sep 2025 16:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758471909;
	bh=T9JqLTewmUpzp1OJfKf6FYT+qzF9twZfYc+1+MFwbns=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=oJ8IiKhJtTlROb1iPY4bymSBTzOt4iHwMlN82VPt3hV5sb3iYv40IvlHwq+Z7E0p5
	 3uT6ACJVpb2nhbJHQZY9GGQIST+pXrxzEbwIOHMJ/T/d0rlCcRyn3FUorKVHTthbx1
	 TIJNaIZ4xbPSUtCl+h9CKJpg65ChDBizkk9RPLPz8Rg4THV34TSgscVESAOJ1nbJ1q
	 Iw2P9LOvb7yH4u7RrwEeiAdmhrylETRStAoqM8+RfF1s0pJTnN1i69I1qTZjvaNzPA
	 JNmdnioSuwINEixg1bdWE70tEkNyozV1d4GK50yIH6sbt6gAbGOSCmfmw6b336ORbI
	 RPZVDp8XENiFw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250731-v3d-power-management-v2-1-032d56b01964@igalia.com>
References: <20250731-v3d-power-management-v2-0-032d56b01964@igalia.com> <20250731-v3d-power-management-v2-1-032d56b01964@igalia.com>
Subject: Re: [PATCH v2 1/5] clk: bcm: rpi: Add missing logs if firmware fails
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com, =?utf-8?q?Ma=C3=ADra?= Canal <mcanal@igalia.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Dom Cobley <popcornmix@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Iago Toral Quiroga <itoral@igalia.com>, Maxime Ripard <mripard@kernel.org>, =?utf-8?q?Ma=C3=ADra?= Canal <mcanal@igalia.com>, Melissa Wen <mwen@igalia.com>, Michael Turquette <mturquette@baylibre.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Stefan Wahren <wahrenst@gmx.net>
Date: Sun, 21 Sep 2025 09:25:07 -0700
Message-ID: <175847190778.4354.11122681024032617561@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_092512_081866_B59498B9 
X-CRM114-Status: UNSURE (   6.04  )
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

Quoting Ma=C3=ADra Canal (2025-07-31 14:06:17)
> From: Stefan Wahren <wahrenst@gmx.net>
>=20
> In contrary to raspberrypi_fw_set_rate(), the ops for is_prepared() and
> recalc_rate() silently ignore firmware errors by just returning 0.
> Since these operations should never fail, add at least error logs
> to inform the user.
>=20
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---

Applied to clk-next

