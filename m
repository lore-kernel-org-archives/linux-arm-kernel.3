Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6791091916
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 20:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+W/hjAnRXRs5qI8IIAuiqjwLi24gZqh1lYU7nBmrRgA=; b=eAPwazwrQqArWFrafSmQVSexdh
	1g+l6fGEl+Zzk04d26LK5c01cSwck11CrgaSt3ProjwVNbvNGSVg+v0kQLWwaI6DN4FXb70drudLT
	qt0pEAy8GG0MYnUt4gJp+XP54uh28Ev8tMIuFxFdERblJIWSTmw+MpBsWK+PdXWh1ivbH0mzM5iN1
	jPSZLCuZ3cYnVoK8d6Kt/yf4JsP4VnnA8f33o6cI9ljATIakPIjl40v5qcmPrhPmQ2MYO4LRfj2ZO
	jAZv7/X7bV0cIkdfDrdsGnP1UzJxo8Od2Q+Z7h888YFp0umhy4JB9wMnEXtiA2xFF6Isi3t+GUqpV
	y9BSoweg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Jv5-0000000BWoP-2SPF;
	Thu, 19 Mar 2026 20:24:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Jv4-0000000BWoF-0PIW;
	Thu, 19 Mar 2026 20:24:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2E00560053;
	Thu, 19 Mar 2026 20:24:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7474C19424;
	Thu, 19 Mar 2026 20:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773951876;
	bh=++eEWU9U/XElXTXlMK0AqVMtloqKwDyjsQ+lSYM22fE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CiuBOTf8oM3JpowrwY/RK71V0lFiytt3Vy70A5+Se8FSMNpBgrP1LzOd7oZgj2zFO
	 aq37mpoCmue+Ohtsd4hTOp+Ou8urlIAHTqGzwCwS7euP3vimX0ON0XXWIMf99oiYxn
	 uL0HQV6NWlMegU10XI0pVrcNbqc1gr/CUl0IgbuMdWUpEMoXWAsGWiXRl8TO0oVeZk
	 UbfZOBhTjphUVeWMVb0epNP0DwpsmaWenaCJaXmD6ZItKEPk2wV0eWBNJoDRo9hJNa
	 LpDwaOnBgmK9ho9ehOY8NGZiHYSfIV1suik/JeOa1AMGFvccrX/0T6VCSfPDqGOihh
	 FHPWeqtfp2pyA==
Date: Thu, 19 Mar 2026 13:24:30 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Brian Cain <bcain@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-hexagon@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] media: rockchip: Disable VIDEO_ROCKCHIP_VDEC when
 compile testing for Hexagon
Message-ID: <20260319202430.GA335306@ax162>
References: <20260213-media-disable-rockchip-vdec-hexagon-v1-1-3f903398cc83@kernel.org>
 <90e62bf797b0532e5556adaf9e15cc7b73e18411.camel@ndufresne.ca>
 <1a618af9b6c311e8fe5db64ff6fb7c1872c7b2b6.camel@ndufresne.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1a618af9b6c311e8fe5db64ff6fb7c1872c7b2b6.camel@ndufresne.ca>
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

On Thu, Mar 19, 2026 at 04:08:29PM -0400, Nicolas Dufresne wrote:
> Le lundi 16 février 2026 à 11:17 -0500, Nicolas Dufresne a écrit :
> > Le vendredi 13 février 2026 à 15:10 -0500, Nathan Chancellor a écrit :
> > > Building rkvdec-vdpu383-h264.c can take a few hours to finish building
> > > with Clang 20.1.0 or newer when compile testing for Hexagon. While this
> > > is further investigated and understood on the LLVM side [1], disable
> > > CONFIG_VIDEO_ROCKCHIP_VDEC when compile testing for Hexagon.
> > > 
> > > Link: https://github.com/llvm/llvm-project/issues/178535 [1]
> > > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > > ---
> > >  drivers/media/platform/rockchip/rkvdec/Kconfig | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/media/platform/rockchip/rkvdec/Kconfig
> > > b/drivers/media/platform/rockchip/rkvdec/Kconfig
> > > index 5f3bdd848a2c..d03689464206 100644
> > > --- a/drivers/media/platform/rockchip/rkvdec/Kconfig
> > > +++ b/drivers/media/platform/rockchip/rkvdec/Kconfig
> > > @@ -1,7 +1,8 @@
> > >  # SPDX-License-Identifier: GPL-2.0
> > >  config VIDEO_ROCKCHIP_VDEC
> > >  	tristate "Rockchip Video Decoder driver"
> > > -	depends on ARCH_ROCKCHIP || COMPILE_TEST
> > > +	# !HEXAGON: https://github.com/llvm/llvm-project/issues/178535
> > > +	depends on ARCH_ROCKCHIP || (COMPILE_TEST && !HEXAGON)
> > 
> > This is clearly not a pleasing change to make. As this specific data structure
> > and usage of bitfield has been discussed (along with the numerous issues in
> > clang/llvm around these). We also agreed to move away from bitfield for this
> > data structure and use a bitwriter. I would favour delaying this change to
> > give
> > devs the time to port instead. Ping again if nothing moves within few weeks.
> > 
> > best regards,
> > Nicolas
> 
> I haven't heard back about the port to plain bitwriter. I guess I have to pick
> this patch, but I really don't want to have to maintain too many of these hacks.
> Anyone else with an opinion on the topic ? Or a better idea how this can be
> workaround differently ?

For what it's worth, I don't anticipate more of these hacks. Hexagon is
rather special in that it has a lot of target specific optimization
passes, which do not always see code as complex as Linux has in places
during development. Ideally, it is resolved at some point during the
LLVM 23 development cycle then we can version check this workaround and
eventually clean it up altogether.

Cheers,
Nathan

