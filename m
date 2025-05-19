Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56A6C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 17:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kj/VMwkUNI8WVdA0evoXZ3TAkYKKG+MMJX7QyMMaXUw=; b=ELkLVbwu9sip5s9GeuV60wT5qi
	27yHucEseudC5vgP5eM4PAlXaNc4ywCqo23IKlKTOM9aCj4UHSRUe14pSG9mg61qwtRFriBGd+f+q
	+LRJTEus7ue91MjiF69CaX5h5DeB6Y7VMijtHg1lxtbti/Lm0GPgCtxThZx4DvHltmY5WygUfzEJ/
	4tcvUxQchnw7ImahlIgOZTvHxyLTp12lY9oCvfxwcvl1kmWSi94QO94oKqXDOJyqQAm5Hl2CFwFp/
	GRqF1jpy9siXi8/kpBYUpDHEyjmcExy9V25O6oeoj1cq5/trMtAVDgV3vkzVbhs2G46NOtLRQ5kHt
	QPgEX1YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH4cD-0000000A1BD-2m9C;
	Mon, 19 May 2025 17:49:29 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH3xx-00000009umd-2Q54;
	Mon, 19 May 2025 17:07:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Kj/VMwkUNI8WVdA0evoXZ3TAkYKKG+MMJX7QyMMaXUw=; b=LdDakWGElKmsMDaJk0QIhJJ3gP
	XF9eyygXbXn2sxg/ndnPMgIveMAO0fBzXxQPeD9HnK3VbOk3mEX3G0pkUf1zK8l0j5o9pktX8RpIm
	+N3F0fXW/YHFFaR4+sdHkKcBmsuKCx4BCfz60zEbzhuB3iRT1eeZpqi44zUXJC69h6d0BGkD5sIEp
	2+sF4ClgqezucwpElSorBu044SW01DtrzCz0sQdmnA0CEy3weD88rdu38aNuN/HHBQzLCFqpuc6mj
	vEiVwzobXE0cvuFqqwdZPX946aUhipHu5GWmHgRvV8XsOEVx/fMJShQx7eYO24SAcpjt/hHUWs5QY
	xf2lusRw==;
Received: from i53875bdb.versanet.de ([83.135.91.219] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uH3xm-0007E0-3W; Mon, 19 May 2025 19:07:42 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Jonas Karlman <jonas@kwiboo.se>, Ulf Hansson <ulf.hansson@linaro.org>,
 Yao Zi <ziyao@disroot.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chukun Pan <amadeus@jmu.edu.cn>,
 linux-rockchip@lists.infradead.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/9] pmdomain: rockchip: Add support for RK3528
Date: Mon, 19 May 2025 19:07:39 +0200
Message-ID: <3416319.KgjxqYA5nG@diego>
In-Reply-To: <aCthtDxm25RU_fd3@pie.lan>
References: <20250518220707.669515-1-jonas@kwiboo.se>
 <20250518220707.669515-3-jonas@kwiboo.se> <aCthtDxm25RU_fd3@pie.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_100753_630568_9B4AFB8C 
X-CRM114-Status: GOOD (  20.60  )
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

Hi,

Am Montag, 19. Mai 2025, 18:52:04 Mitteleurop=C3=A4ische Sommerzeit schrieb=
 Yao Zi:
> On Sun, May 18, 2025 at 10:06:49PM +0000, Jonas Karlman wrote:
> > Add configuration and power domains for RK3528 SoC.
> >=20
> > Only PD_GPU can fully be powered down. PD_RKVDEC, PD_RKVENC, PD_VO and
> > PD_VPU are used by miscellaneous devices in RK3528.
>=20
> Thanks for your work!
>=20
> > Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> > ---
> >  drivers/pmdomain/rockchip/pm-domains.c | 27 ++++++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> >=20
> > diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/=
rockchip/pm-domains.c
> > index 4cce407bb1eb..242570c505fb 100644
> > --- a/drivers/pmdomain/rockchip/pm-domains.c
> > +++ b/drivers/pmdomain/rockchip/pm-domains.c
> > @@ -35,6 +35,7 @@
> >  #include <dt-bindings/power/rk3366-power.h>
> >  #include <dt-bindings/power/rk3368-power.h>
> >  #include <dt-bindings/power/rk3399-power.h>
> > +#include <dt-bindings/power/rockchip,rk3528-power.h>
> >  #include <dt-bindings/power/rockchip,rk3562-power.h>
>=20
> But I had some trouble applying this patch on either Rockchip SoC tree
> or linux-pm. Looking through the context, seems the patch depends on
> some RK3562 PMU driver changes, which I couldn't find with some brief
> searching among the list.
>=20
> Which branch is the series based on?

are you sure you looked at the right linux-pm tree?

In [0] I do see rk3562 powerdomains applied.

Heiko


[0] https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git/commi=
t/?h=3Dnext&id=3Df89c082d44914f24dfb5b0219eb140369de5b612



