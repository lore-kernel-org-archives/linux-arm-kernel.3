Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C23D0D17C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 23:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vvbUvshcKay+5SyzipSpDu2A7P68B5vbaeosqp5G+WQ=; b=00ohYq2e6PtSsNLCMAJDKyiciu
	NY8RHP+gB0zElxlwSIMmZzOSj56zAHPcJ42IjPu5tRMqFb7q5fxrQ9WMJsH+wrgXtPsk+GdwMAM2M
	vr8DT2ehQXYfBf11cXBypk+OR7ZQjbxRDnoSOBUWTmYPQAvBXkOeKfHGYtKVrvBP0CcQQAtgmjoX4
	kTBAet2QKJlpdpMkiCMWNPqIcY2RzFGAvEMcrQ59aVHX+sbTIAQExUoX3srpsJILECE7EN+LWg6Db
	3ai378p/6wvxOW65EzkAF4LA95RBadUenyqnB25g9Lyl64cRFItKOOzmSMs1sO37RWj03skFxb0so
	1MUyyL9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vddCd-0000000FkrO-1iO2;
	Wed, 07 Jan 2026 23:44:35 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vddCb-0000000Fkqy-0L38
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 23:44:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1767829460;
	bh=vvbUvshcKay+5SyzipSpDu2A7P68B5vbaeosqp5G+WQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=M4uB9ZZPVsPXY6riJWKTZi9afSO24SmdJ5MMFaOwN3rouRWR5waBAj2H4hjNLawRM
	 ZJzz7xC13YYt7/R065LFCDhNv7Vp07k8CK0xHfTgbenYVw3gDPCCHlKw/QzXzX4MgT
	 tolqAxGati8jljrqUv5Y8lBIUc6yr/q7JeoeTB6282y47EHXOdU5QpmdI3RMbUFfpg
	 /1GiryloDRy6NI38fkGfFuQGc1PQvVg9MrRZOdZQ2iQCjN048LDo+eDLS/kfAIfi1D
	 ngkxKedmntRuoWPybC08mbY7EAn+gdJbyVzihucVkEZ1cZ4L9jlZKsTmatsnhFaeD9
	 QKzVOIbpc0Wdw==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 65D5479F8C;
	Thu,  8 Jan 2026 07:44:18 +0800 (AWST)
Message-ID: <245bb0d1cfc1dee91baaab7c1fd73bc264586a0d.camel@codeconstruct.com.au>
Subject: Re: [PATCH 0/3] pinctrl: single: bit-per-mux DT flexibility, probe
 robustness, and consistent pinconf offsets
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, Tony Lindgren
 <tony@atomide.com>,  Haojian Zhuang <haojian.zhuang@linaro.org>, Linus
 Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 BMC-SW@aspeedtech.com
Date: Thu, 08 Jan 2026 10:14:17 +1030
In-Reply-To: <20251222-upstream_pinctrl_single-v1-0-e4aaa4eeb936@aspeedtech.com>
References: <20251222-upstream_pinctrl_single-v1-0-e4aaa4eeb936@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_154433_347132_B31979E8 
X-CRM114-Status: GOOD (  13.71  )
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

Hi Billy,

On Mon, 2025-12-22 at 20:04 +0800, Billy Tsai wrote:
> This series updates pinctrl-single to behave more predictably on
> bit-per-mux platforms by making its DT interface more flexible, its probe
> path more tolerant of pre-reserved resources, and its pin configuration
> register addressing consistent with pinmux.

Can you provide some more context here? For instance, this is motivated
by the AST2700 - can you talk a bit more about why its design needs
these changes?

> It extends the driver to accept a per-pin <pin_index func_sel> style
> description for bit-per-mux users while keeping the existing
> pinctrl-single,bits binding as the preferred input when available. It als=
o
> relaxes probe failure when the I/O memory region cannot be reserved
> exclusively, allowing initialization to proceed with a warning on systems
> where that region is already reserved.
>=20

Can you unpack what's going on here in the context of the target soc?

Andrew

>  Finally, it aligns pinconf register
> offset computation with the pinmux logic so that both muxing and pin
> configuration access the same register offsets, avoiding incorrect pincon=
f
> operations on bit-per-mux configurations.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
> Billy Tsai (3):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl: single: add per-pin binding suppo=
rt for bit-per-mux
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl: single: Allow probe to continue i=
f mem region busy
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl: single: unify pinconf offset mapp=
ing with pinmux
>=20
> =C2=A0drivers/pinctrl/pinctrl-single.c | 150 ++++++++++++++++++++++++++++=
-----------
> =C2=A01 file changed, 110 insertions(+), 40 deletions(-)
> ---
> base-commit: dd9b004b7ff3289fb7bae35130c0a5c0537266af
> change-id: 20251222-upstream_pinctrl_single-99e8df1fe2b9
>=20
> Best regards,

