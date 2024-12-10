Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C41BE77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 14:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vm/SMvu/8EpKkDOC/meueBC9lfWEJCHJn3wNu3oS+nU=; b=TvmuT/TiWwW4vZhtvxaLLR5MoT
	ATlO6mPkcAX4Xw1PSZMiiuYkTseDr3duCKr8hC2CntD1x4i2rrD0/TnW6PabE2MaONCJCnpvAQHg4
	SHWOCC5v8oYrQnKt0SDNvqtWEif+N948AoLJy9bLu4a6q1z/1hWtcIcaeuXFzqY/tm6xMzcW++iwY
	yaFuiiSVmLOCGmWHKSM8wJA+WVrmfygQZBNu/gRyd7EP+N0wi5jpISWhWbL8JflMOMNByiJqxATie
	ZpqWFHwKSZyzi5/Mfx62xvybp7Hkh0qqx1ggFLqceopU/+YaEgUSeKUt3AZ0BZTaFbd0QsCzI73Ls
	zq+JcPiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1S7-0000000Bp0i-0O8G;
	Tue, 10 Dec 2024 14:43:07 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1MB-0000000BnHU-3Ke8;
	Tue, 10 Dec 2024 14:37:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Vm/SMvu/8EpKkDOC/meueBC9lfWEJCHJn3wNu3oS+nU=; b=apGYPtk9B8cEHvRnlKnZRfyPlB
	UjU0n9BxnezEUSJl9xr/rIS3CAWGyApMVmPm35fTQfK9Lg1qjH1CqrI3pEIUsgAH3IAqgLHXpIi+5
	1Rn2C4tjKDlVc/d7X34Zq4zZ6HCNJYmUb07z1nntcDroUOFxB3djTFTLeug2S0rRYOYXLX1VKG3d7
	wnlxrVKNe5R4q/9/UANNYjy5aP2n7mEi9uoUgwPSQFTqN5FNCUlgEBz+0dey58QWAUnSOtLtS+W6w
	sowpUyWKnenxm2NVdRvHK4tS7iOstRm1QAWChyc+OKiUkXA6I87nkF1VdHmwPKgZxU/V0Fy5rB84E
	//ZQ2gsg==;
Received: from i53875bc4.versanet.de ([83.135.91.196] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tL1Lk-0006dG-TS; Tue, 10 Dec 2024 15:36:32 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Yan <andyshrk@163.com>
Cc: Daniel Semkowicz <dse@thaumatec.com>,
 Diederik de Haas <didi.debian@cknow.org>, andy.yan@rock-chips.com,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, quentin.schulz@cherry.de, rfoss@kernel.org,
 robh@kernel.org, tzimmermann@suse.de
Subject: Re: [PATCH v3 0/3] drm/rockchip: Add driver for the new DSI2 controller
Date: Tue, 10 Dec 2024 15:36:31 +0100
Message-ID: <3104907.xgJ6IN8ObU@diego>
In-Reply-To: <78e7b8e.b5ee.193b09ce46d.Coremail.andyshrk@163.com>
References: <20241203165450.1501219-1-heiko@sntech.de>
 <jl5obi7rd4h6ywozeqruxq2vx62sx5yf4wwpksrq3prdleps2k@d3zbr5ttquvn>
 <78e7b8e.b5ee.193b09ce46d.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_063659_823486_9AC2F111 
X-CRM114-Status: GOOD (  20.72  )
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

Hi Andy,

Am Dienstag, 10. Dezember 2024, 13:48:12 CET schrieb Andy Yan:
> =E5=9C=A8 2024-12-10 20:32:03=EF=BC=8C"Dmitry Baryshkov" <dmitry.baryshko=
v@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A
> >On Tue, Dec 10, 2024 at 09:54:09AM +0800, Andy Yan wrote:
> >> =E5=9C=A8 2024-12-10 09:45:11=EF=BC=8C"Dmitry Baryshkov" <dmitry.barys=
hkov@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A
> >> >On Tue, 10 Dec 2024 at 03:22, Andy Yan <andyshrk@163.com> wrote:
> >> >> =E5=9C=A8 2024-12-10 09:01:38=EF=BC=8C"Dmitry Baryshkov" <dmitry.ba=
ryshkov@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A
> >> >> >On Tue, Dec 10, 2024 at 08:50:51AM +0800, Andy Yan wrote:
> >> >> >> At 2024-12-10 07:12:26, "Heiko St=C3=BCbner" <heiko@sntech.de> w=
rote:
> >> >> >> >Am Montag, 9. Dezember 2024, 17:11:03 CET schrieb Diederik de H=
aas:
> >> >> >> >> On Mon Dec 9, 2024 at 4:06 PM CET, Daniel Semkowicz wrote:
> >> >> >> >> > On 03.12.24 21:54, Heiko Stuebner wrote:
> >> >> >> >This really sounds like something is wrong on the vop side.
> >> >> >> >The interrupt is part of the vop, the divisable by 4 things lik=
ely too.
> >> >> >>
> >> >> >> This is a hardware limitation on vop side:
> >> >> >> The horizontal resolution must be 4 pixel aligned.
> >> >> >
> >> >> >Then mode_valid() and atomic_check() must reject modes that don't =
fit.
> >> >>
> >> >> We round down to 4 pixel aligned in mode_fixup in our bsp kernel,
> >> >
> >> >What is meant by the "bsp kernel" here? I don't see it being present
> >>=20
> >> bsp kernel means downstream vendor kernel.
> >>=20
> >> >in the mainline kernel. So, if the mode is unsupported, it should be
> >>=20
> >> Will it be acceptable to add this round down in the mainline mode_fixu=
p?
> >
> >I think so.
>=20
> Then I can write a patch for it.

thanks a lot for looking into that :-)


Heiko



