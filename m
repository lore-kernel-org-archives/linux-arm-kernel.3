Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACCFD6A22D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 21:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JbVEEkL8lglYHKBJSgT9JiBSY0i5Tm3rez3G/cRCJ9g=; b=Xk3ex+AQAUURyPZFcPaTRPKbu+
	TDcdWZDREgsP6x/IkoeIOLUp8ti5qtRqZT5VBQ1HbxS/tBMbMo7GejpPxdqUWL2jNsfEOitbCuve2
	Zq6kbRmd2pG+bn90MZiaXm5jpMsPqCfhPX+gqfNePHlV5BH2otqejeDiZRVz1WE8qCX1T1aMz/9T7
	ArSXeUsgf5KQbCnq5vRqFb+kQ82ylyRZGkUzRqQr32CMV9yGRQzyh22OtB7m4HjBsbEu8+ysjDgpf
	Z/YuxcbQXNsuqHGAYiI9Xsyi2cJm2tSVm9hpqycGqB4rVBlV7UjY8xMVpZ02KEKftPqNYEHbtAD2/
	KrhiksqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBh0L-00000000pwL-2kji;
	Thu, 14 Nov 2024 21:03:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBgyH-00000000pSR-1NGa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 21:01:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 86B225C5838;
	Thu, 14 Nov 2024 21:01:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63923C4CECD;
	Thu, 14 Nov 2024 21:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731618104;
	bh=JbVEEkL8lglYHKBJSgT9JiBSY0i5Tm3rez3G/cRCJ9g=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=eKDixHelJokBuECvd+Kz/bmmlvVRmVnIODXaAat2ZVyHL2dgImTv8UTgnA5RZxkj4
	 Ib+0IKp2/GpvyxBG3e6yA1Ewstc68XxZzfqHxi4gnzMqCp38FIXy0JjAkCkYGhGrbO
	 UtoqLw6U56vvkWr7N/6tQW8au50JybT36Fr1nv2I2l3irg4QKYYPDgZqnxuMsoP6PN
	 XkkFR3mLUs38U0QzBA0bHAnxgt3VnBsmWW2eJ2jnTF6DjXMnfrioypHl126QDNaHFt
	 Df7i0DWqJHdkb/1doRF02XK/+HcjpKC5GEvE6glKcV8QZte1br8VY/eL9xhc+wOoD3
	 8q9Hs5DUvNUJg==
Message-ID: <f7298afe9999b1f6f1bca0891c999cd0.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241112-clk-en7581-syscon-v2-3-8ada5e394ae4@kernel.org>
References: <20241112-clk-en7581-syscon-v2-0-8ada5e394ae4@kernel.org> <20241112-clk-en7581-syscon-v2-3-8ada5e394ae4@kernel.org>
Subject: Re: [PATCH RESEND v2 3/7] clk: en7523: move clock_register in hw_init callback
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, upstream@airoha.com, angelogioacchino.delregno@collabora.com, linux-arm-kernel@lists.infradead.org, lorenzo.bianconi83@gmail.com, ansuelsmth@gmail.com, Lorenzo Bianconi <lorenzo@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>
Date: Thu, 14 Nov 2024 13:01:42 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_130145_411310_83B24535 
X-CRM114-Status: UNSURE (   7.24  )
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

Quoting Lorenzo Bianconi (2024-11-11 16:08:50)
> Move en7523_register_clocks routine in hw_init callback.
> Introduce en7523_clk_hw_init callback for EN7523 SoC.
> This is a preliminary patch to differentiate IO mapped region between
> EN7523 and EN7581 SoCs in order to access chip-scu IO region
> <0x1fa20000 0x384> on EN7581 SoC as syscon device since it contains
> miscellaneous registers needed by multiple devices (clock, pinctrl ..).
>=20
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---

Applied to clk-next

