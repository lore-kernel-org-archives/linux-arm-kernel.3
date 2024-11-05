Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADAA3D40CE0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 23:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=meCr4j+EzatS1vCyUkDdGxdMMQLjghCYqVBTaPkg8AM=; b=1WgzfE3vWszKdCPZd0Uw9wMc5C
	OVVIFLJZX/dEAICY3jHTUwBVSxYsre3UBIc/ANFGkgU1x6BWjUeVI8yafXcwlCg5iP5h5WptlqTen
	NgTqSubHwnLXrh5tL9RuE3LFGkJH8smPYtyR1vCtjBQJgVx27rTzovBfWPUeFaLGy+jxtRRQQqqwx
	8NbtG3SeAUcWIJLh3MfZfFb38uWo5AQkmP0GRklsu8fKCKdZS8vtVDp8zOaS7O0Lk9WH+5O6xS9yi
	CJsqzQMjng7HWF+KZTS2DcufxuW04ZX7ezBySUJesOchkUvc2ZwSSCOKRBv3abd/uSVi2eGlfOWoG
	1hesHNWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Sy2-000000016Nh-3GG5;
	Tue, 05 Nov 2024 23:28:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8SwK-000000016EA-3Kbs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 23:26:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 78B03A43A1C;
	Tue,  5 Nov 2024 23:24:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AA7AC4CECF;
	Tue,  5 Nov 2024 23:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730849183;
	bh=meCr4j+EzatS1vCyUkDdGxdMMQLjghCYqVBTaPkg8AM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Ssu9d7EZToG1O1srfhcyBcwecClH1aKzUwDOVuWr6Ye03ALTFrmNdoHz7xbosSNMy
	 19XjZ8Al9IlLd+ywnJEnnESGLfegPqZyQMqVOK/E0UgWoBbQ3uPAppULCaw71VMP6C
	 tlHfJeNqKYNAcHuUYqM5ibZKDFGRnR2jkWTwVVKQVsJMAgdL7NCYZkAeLPVXAOr+Fn
	 NNnUbxwKJq8IhxMQLjloNnqkKpBdj9QEZkPwLdXbuKRZ7F7xU96gMISyKAyWljWNPO
	 fmK6Naut0NXtGpRqoXYf/KCPrKGA4FGYEDtZfitESLvC/qYwbuDAHFJdFLsjMxFR8d
	 FrJV/I2WBUFHA==
Message-ID: <8aa04e346f65bc4fcb0efc47a4f0550a.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241101095720.2247815-3-claudiu.beznea.uj@bp.renesas.com>
References: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com> <20241101095720.2247815-3-claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v6 2/9] clk: linux/clk-provider.h: Add devm_clk_hw_register_gate_parent_hw()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, claudiu.beznea@tuxon.dev, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
To: Claudiu <claudiu.beznea@tuxon.dev>, alexandre.belloni@bootlin.com, conor+dt@kernel.org, geert+renesas@glider.be, krzk+dt@kernel.org, magnus.damm@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, robh@kernel.org
Date: Tue, 05 Nov 2024 15:26:20 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_152624_942524_1BEDC09A 
X-CRM114-Status: UNSURE (   6.95  )
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

Quoting Claudiu (2024-11-01 02:57:13)
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Add devm_clk_hw_register_gate_parent_hw() macro to allow registering
> devres managed gate clocks providing struct clk_hw object as parent.
>=20
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---

Please fix the subject line to not have linux/clk-provider.h because
it's redundant.

