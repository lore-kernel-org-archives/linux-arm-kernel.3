Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 881D7C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 07:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5JpxKnW07QZOzBNHAIMqBm7yFcbK3k0eeQC1zk0hFew=; b=tGTHNaBl9LL4Dz03KPIp7kqhsT
	u5qGbzuQPkmVuXGpfbWZIrHBtgbCtBt2DRE1Y3hDB8pT1cGI0hlPt5muJA+7bACaSgjefdJyyYfKB
	nK6b2X4RfgWg2Gqk57BYJLivgnjzNkj3RVBIaJpTZzOSuMnNe8pieKmh4EHs3yVd3UH+NPV77KsH8
	wsTuhS7Uv2tKlN40QCECGc8jsQoEiPO80isujC0/YCE+8ye0F7TGLWU2qJS4MZDMextClLM2W2yjh
	d7Oe6Vm8wuLnWsPqk1AlA4P2KMGQW6q6ehuU/lJN3EgtmuSvY9v/2gFEiEquZOT9uAgLgs3MGR9eC
	ZiSyPMTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8YZ2-00000001En8-3vjx;
	Mon, 21 Sep 2026 07:35:48 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8YZ0-00000001Ely-1hCM;
	Mon, 21 Sep 2026 07:35:48 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DA348C36;
	Mon, 21 Sep 2026 09:33:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789976035;
	bh=EgnOCBnnJ5SOs0ufuZFAwGK3a5ufdWOiG7rFGmgMKeU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NYJnH9jiYSuPY+BwBDdOisWoegG0YGvrWBJuC91+Dqj36D8Ei+WW6V0hr2WdRLzA4
	 ceTiFTS1Dko1IjjTrFjG3vY0NRiNYl6eVDHf1tdYPmY6GvW9EDDxObEKF12Kxkr7uO
	 cfiq2l+XPxObD84mFWWDFi3fAyfeni8e6gtQ0o3Q=
Date: Mon, 21 Sep 2026 10:35:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jimmy Su <jimmy.su@intel.com>,
	Matthias Fend <matthias.fend@emfend.at>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Martin Kepplinger <martin.kepplinger@puri.sm>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Richard Acayan <mailingradian@gmail.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	David Heidelberg <david@ixit.cz>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v6 0/6] dt-bindings: Orientation defines
Message-ID: <20260921073538.GA1466037@killaraus.ideasonboard.com>
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
 <CAMuHMdWWOB48AUCbXh=9ZGCK2qZyVH06kJ2paRY-wxkq5NC16A@mail.gmail.com>
 <CAMuHMdVhK0vm_Ksze_=jG8D_=8Q45v+ezNbxwL7JntTt_v_fkg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdVhK0vm_Ksze_=jG8D_=8Q45v+ezNbxwL7JntTt_v_fkg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_003546_878362_9F38798E 
X-CRM114-Status: GOOD (  17.20  )
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

On Mon, Sep 21, 2026 at 09:07:01AM +0200, Geert Uytterhoeven wrote:
> On Mon, 21 Sept 2026 at 09:05, Geert Uytterhoeven wrote:
> > On Fri, 18 Sept 2026 at 12:55, Kieran Bingham wrote:
> > > Add a new dt-bindings/media/video-interface-devices.h header that
> > > initially supports the Orientation types and convert existing users
> > > throughout the code base.
> >
> > Just noticed these are already in since commit 6ab5acfb8dd38729
> > ("dt-bindings: media: Add macros for video interface devices") in
> > media/master (next-20260903 and later)?
> >
> > > v3 collects tags, and fixes the typo, but drops all hunks that do not
> >
> > [...]
> >
> > > v2:
> >
> > Interesting changelog order ;-)
> >
> > [...]
> >
> > > v3:
> >
> > [...]
> >
> > > -v4:
> >
> > [...]
> >
> >
> > > -v5:
> > >  - Definitions now accepted in linux-media, rebased to get conversions in.
> >
> > Oh, you say so here ;-)
> >
> > >       arm64: dts: renesas: Convert to new media orientation definitions
> >
> > So it's been safe for me to pick this up since v5?
> 
> No it's not, there is a hard dependency.

The whole series needs to be postponed by one kernel cycle :-/ It's not
urgent so it's not a big deal. Kieran will have the priviledge of
rebasing and sending a v7 :-)

-- 
Regards,

Laurent Pinchart

