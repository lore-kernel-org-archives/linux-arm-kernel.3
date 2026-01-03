Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F420FC617D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Jan 2026 10:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5m7p8m10yK7qHox0wi3lALDmcBikD2hsMgWE5RZDzho=; b=x+adjMy1Lf9GUwKkUx6Z8l2JgU
	VN4/u7Esjf6OMg1vRf7n44TKVNi1dV9HD1ffe/+QEXge4M1tGR7VppBVPXWowIhwudkWgJge6nlU4
	DNPE8ttvVzYjizU+i1o4qMxqyqfa5/UGwcdNnQwb95zvwLjmcc2Fu+HVJbLHA5nIDFUpv19rL7EOx
	z4p5czskNhLxEohdZwdvdi8eC/aZRfjqJWvwsjBKGcjLSa8QlTZJ9rzu6W+0aJGg3CHy/3q50cnzM
	T8KI2Zmz/l+QcgdfJ+yGdw9Q7AMbB9JNnKZfgzLrsNXvTwbIWLAIWTDjFrnLXYYqVO5lYt6vVxxaR
	NpqXGM9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbz30-00000009DPZ-3zRS;
	Sat, 03 Jan 2026 10:39:50 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbz2y-00000009DP3-2bgt;
	Sat, 03 Jan 2026 10:39:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=5m7p8m10yK7qHox0wi3lALDmcBikD2hsMgWE5RZDzho=; b=tc79plr9scNNEtncd9A2ixqMX/
	jXl6eBLypvOGWsjRmEwxsbJ5fXUy5bad+uAOY4BjIsXDrva7RY1Ow90wRkyoKtBdvtRBQ6scqAIwA
	LfwyZkOgSvofW3uHnEj//5nLGxDKvfUx5WzzaIzWeLoz00dM12Nv5FCc7Go2BVz140SLJQJs4vSYH
	fOWJAVDDziIlQXat8DP6GJeRC8SLAN/4uYB8IqNwb7hSKSVPodlPC+9aTYbj3rsTQxu2FmUyeubxu
	vfp5iVox3Zx+V25LUzHgAIrEeHUgXQrWg4ECO4gjeoWnT+wP+jOKqUWMLt/VY4vN6XCi3JiWOfkPd
	IdWdlt+g==;
Received: from i53875bab.versanet.de ([83.135.91.171] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vbz2q-000vtH-Rg; Sat, 03 Jan 2026 11:39:41 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andi Shyti <andi.shyti@kernel.org>,
 "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Anand Moon <linux.amoon@gmail.com>
Cc: Anand Moon <linux.amoon@gmail.com>, David Wu <david.wu@rock-chips.com>
Subject: Re: [PATCH v1] i2c: rk3x: Add support for SCL output enable debounce
Date: Sat, 03 Jan 2026 11:39:40 +0100
Message-ID: <1802774.yIU609i1g2@diego>
In-Reply-To: <20260103052506.6743-1-linux.amoon@gmail.com>
References: <20260103052506.6743-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_023948_767992_254B1722 
X-CRM114-Status: GOOD (  11.15  )
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

Am Samstag, 3. Januar 2026, 06:25:04 Mitteleurop=C3=A4ische Normalzeit schr=
ieb Anand Moon:
> From: David Wu <david.wu@rock-chips.com>
>=20
> As per the RK3399 and RK3588 datasheets Rockchip I2C controllers feature
> a SCL_OE_DB register (0x24). This register is used to configure the
> debounce time for the SCL output enable signal, which helps prevent
> glitches and ensures timing compliance during bus handover or slave clock
> stretching.
>=20
> Introduce a 'has_scl_oe_debounce' flag to rk3x_i2c_soc_data to
> distinguish between hardware versions. For supported SoCs, calculate
> the debounce counter dynamically based on the current clock rate
> and program it during divider adaptation.
>=20
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> Signed-off-by: David Wu <david.wu@rock-chips.com>

Signed-off-by lines are in the wrong order.

Original author first, then yours as you're the one handling
the patch last.


Also, does this fix a problem for you, or is this more a case of
"this looks useful"?

Thanks
Heiko




