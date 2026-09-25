Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26480C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 11:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xqRZtFwRtPLbjGu2lV5fj2K5SGuJtc7Z7Ze1kKacHR0=; b=JMyYjcJg1aJKmIjCYalP3facor
	xfHo6zrf89/bjUyrodv4O4z1okvJnP2NPk2mtFnhIcgBcqjfyYZAXXg32YAV9N5bPWAM8ggHSH1ce
	CWWwoPruJGEP58jI3SKA++AQq2hdVbN1+YKspFQeqc6k9Qok/NPBOM/jqojuXxfOApbpcEUfea7mi
	gvxzLi2Gd0T3r3uR6eHHKBylAayqw49cxeMcAHhqp/DabbGmlEbWqnBpochzhj0ym/9FOCpSP9BKW
	XU5Z7M6WxErlRTTCaGsU6eTWWR/r5FBdo0Q8odGXCgPgelgYUn6D+hM5ggNicm1dykf8Ei9IWIdWT
	ZJea5z4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4OB-0000000DFWZ-3GKI;
	Fri, 25 Sep 2026 11:46:51 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4O7-0000000DFVb-1EMa;
	Fri, 25 Sep 2026 11:46:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790336807; x=1821872807;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MzxytXur9WLf3A2pht3GHrIFSKif0MmfcShH+hRjUuo=;
  b=XqzLrXCAAd880vftDKmAaAb2a6r7BzqPqVy1tGe5kh9rAt3n5q8E/9n5
   hsPfhbgTaZYDd44gkHfgLcbg7tWuiy88KXi0DUlXIxK2bSsHjAeCsD5u1
   ipYxAIBX9EJWregbjpGPylaAG/5Hs8dgIck6NOzbORi36OpsvCUJeJKWZ
   AwdMXHwyu6BLiVukcrYuIlVXJp0M5hCGbUAfz2YMS8oJnj85vb5KD81OB
   uA+4JG6qoxmXrFKCL3vOdddxlxHfv2ytQQC9IGD/13Sf7jWLq/9F+q1Fn
   q2CfYFaW8X0mFt9gMQk8T15mDPi9+jBceqaVDrDU9lGkdw+dJr273+Vpy
   g==;
X-CSE-ConnectionGUID: bZXOOsnzSVCPstqabEEACw==
X-CSE-MsgGUID: Ts1uTvvUQOy3kGpr5w3ngw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="101294069"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="101294069"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 04:46:46 -0700
X-CSE-ConnectionGUID: zsABext2RMS632XbvRUi2Q==
X-CSE-MsgGUID: biDbQJztS8CW1MOilcY0yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="274485235"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.84])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 04:46:36 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 28C66121182;
	Fri, 25 Sep 2026 14:46:37 +0300 (EEST)
Date: Fri, 25 Sep 2026 14:46:37 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacopo Mondi <jacopo@jmondi.org>, Jimmy Su <jimmy.su@intel.com>,
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
	Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	David Heidelberg <david@ixit.cz>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v6 0/6] dt-bindings: Orientation defines
Message-ID: <arZfHdZS8U6MltVz@kekkonen.localdomain>
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
 <CAMuHMdWWOB48AUCbXh=9ZGCK2qZyVH06kJ2paRY-wxkq5NC16A@mail.gmail.com>
 <CAMuHMdVhK0vm_Ksze_=jG8D_=8Q45v+ezNbxwL7JntTt_v_fkg@mail.gmail.com>
 <20260921073538.GA1466037@killaraus.ideasonboard.com>
 <arEVs0FDleyHeeLj@orome>
 <178999124332.1723501.13535584681937232110@ping.linuxembedded.co.uk>
 <arEeG06MiZ_97uzH@orome>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arEeG06MiZ_97uzH@orome>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_044647_374919_0BF340B0 
X-CRM114-Status: GOOD (  21.05  )
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

Hi folks,

On Mon, Sep 21, 2026 at 02:10:17PM +0200, Thierry Reding wrote:
> > > If all platform maintainers Ack this series, they could go through the
> > > media tree where the shared include was already merged. Alternatively
> > > the media maintainers could provide a shared branch for everyone to pull
> > > into their platform trees.
> > > 
> > > But given that this is simply replacing a literal with a preprocessor
> > > macro, maybe not worth the extra hassle.
> > 
> > Indeed, I'm not personally worried here. I thought that because Sakari
> > had accepted the main patches these could go in now, so I refreshed the
> > series.
> > 
> > I don't really care which route they go, or when. I'd rather not have to
> > re-re-rebase again in two months ... but I can cope whatever :D There's
> > certainly no urgency here.
> 
> You already have my Acked-by and I'm fine with anyone picking up the
> Tegra DT changes. I don't think there's going to be any conflict with
> any other work in the Tegra tree. If they don't get applied, I'll pick
> it up for the next release.

The patches seem to apply nicely to the media tree so I'll just merge them.

-- 
Regards,

Sakari Ailus

