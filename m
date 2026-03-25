Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1933F109C04D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 17:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iNKgZ6VDBzuIOTEW6Fhgp0F72ZvW6yPbY4OrV2lxLRc=; b=3Wtk0z/EqjD4gCrpybUoGpxEAO
	udmIn+e6e9xAsoqb6tTLI8/3dKGe0Qu0yBd2EfPhTFz3ca4WR7FmW9HHqLJ8qH+cD2i2UX6PbIOx+
	aXa/MIRlmIxAPnBe0t9sDKucgTZ3maRe6SyG3+YHdpa/48KlWbxAJfZkFqF3/YMeMCFdlK8CPfBkB
	q9nA5VEDXosViR7GPpETSARp8EBRiedYJRhsSEeCId2tai/90jvVe2B7y6wWVotrpte88erGu5D9w
	DQrPlUIreTl4b9DoKRyGIAOiWsRfG9XfFpCE+xGiiqy/d/6Rbg/z9C7gDr/9L7kMwTt90vKtvpcr4
	xjJMGBbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5SBW-000000040Pk-3T1L;
	Wed, 25 Mar 2026 17:38:26 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5SBU-000000040PD-2Ygr;
	Wed, 25 Mar 2026 17:38:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774460304; x=1805996304;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tTM6qpl5dmfbHIRbO8CS8UflwO2BMvQhMGPDek8bavg=;
  b=fyn3+1o9guV4SGxWjkXBEcgVzRVS90iyLj6mvTnZmlRdJuGhR/BDPXOd
   PhHHhKCeGSPjIG/ul4zKR2a75KkCDmeW0dc9pqY1HyL/o1xejjLXcvzz+
   FFaILMWbtrTLNgYMnqVwqUOcs4uJQgTql3GJo8kSyzzj03Hq9VksvkYW2
   TQq4t3iKWZKsOoH2zQ3v8D8AuhdlS5tlP8/ZUds3EjZOfHj18cIb8gW0L
   k+0m7eTx548CJcpQkMG1ZxMshYd1f0BZpbTcqzqIlxMOuiaSvq+/YLZax
   N81HN5EHd2I53lOe6cNamh0Z0JH1aRMyBPBbmClIMqjdbKiL/tFKF+RN+
   w==;
X-CSE-ConnectionGUID: bEWsg0ZtSs2eBDc9z9YMaw==
X-CSE-MsgGUID: kRo2VbTsTG+/7fjmLINj6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75527087"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="75527087"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 10:38:21 -0700
X-CSE-ConnectionGUID: O2KGlQQqTJadrw+GoRloHw==
X-CSE-MsgGUID: 3jjEfzDVTpCR49VsLPA4fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="220347066"
Received: from vpanait-mobl.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.187])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 10:38:17 -0700
Date: Wed, 25 Mar 2026 18:38:10 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: michael.riesch@collabora.com
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, 
	=?utf-8?B?0JrRg9C30L3QtdGG0L7QsiDQnNC40YXQsNC40Ls=?= <mai.kuznetsov.misha@gmail.com>, Charalampos Mitrodimas <charmitro@posteo.net>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Collabora Kernel Team <kernel@collabora.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/9] media: rockchip: rkcif: add support for rk3588
 vicap mipi capture
Message-ID: <acQdGy39-3H_nyKL@mdjait-mobl>
References: <20250430-rk3588-vicap-v3-0-e38e428868cc@collabora.com>
 <20250430-rk3588-vicap-v3-3-e38e428868cc@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-rk3588-vicap-v3-3-e38e428868cc@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_103824_683613_90A08EA1 
X-CRM114-Status: GOOD (  13.61  )
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

Hi Michael,

Thank you for the patch!

On Wed, Mar 25, 2026 at 12:51:08PM +0100, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> The RK3588 Video Capture (VICAP) unit features a Digital Video Port
> (DVP) and six MIPI CSI-2 capture interfaces. Add initial support
> for this variant to the rkcif driver and enable the MIPI CSI-2
> capture interfaces.
> 

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  .../platform/rockchip/rkcif/rkcif-capture-mipi.c   | 141 +++++++++++++++++++++
>  .../platform/rockchip/rkcif/rkcif-capture-mipi.h   |   1 +
>  .../media/platform/rockchip/rkcif/rkcif-common.h   |   2 +-
>  drivers/media/platform/rockchip/rkcif/rkcif-dev.c  |  18 +++
>  4 files changed, 161 insertions(+), 1 deletion(-)

--
Kind Regards
Mehdi Djait

