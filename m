Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 515D7CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 11:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9kYhiobrKfCyzTROPKRGso4XWAXp9MTcWU5gitf1YsI=; b=BYwF2utyDK091/1CkpCSHtenvW
	RQ6tI3dG55CMNxFtGqTh95jMk7I5pD7fGw67zpk+RQqO/MjsqnHe58oqihg8AYNxT4/1XQh6V0jWZ
	OJGZ+q90vWNZARvvuN4/fN2NW2ftTr9FRCq4oBMQadw3uZ0xFECxDZX4388GSVbnuRhZvo5jlXFkf
	gr5tPfKeHs3P7sNAsnB6D68ELU7mKsFv/760RihGMEwJDBQT9SRk+3bprYFfySs3CR5j1C6h2btcJ
	JXozvVoUurME9Sn70Lmo7DKGFsWGsHtaU9Ik5qG6TTjlfxLUWxh09J5bf8RvYyi/7iWpcKsPNCzgt
	HihWGDfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8zo1-00000001Qma-3Dt7;
	Wed, 15 Oct 2025 11:36:34 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8znz-00000001QlZ-0mso;
	Wed, 15 Oct 2025 11:36:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760528191; x=1792064191;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ErQnLFtT2VWWYam/1SWthYQckbFaJsg61CQEzmoDe6I=;
  b=ni65yLSjIPZkPvnbfPolBk5Rj7khUIXGXd/HF0i7IICZT8JJu7YVjiB5
   aWHTBj6msE2iyk7HP1+xHPv8TBOIF7U7ecyik5xEDJ8Lw77RNP9PhQ/9F
   tfiSu14Z5TGMuoDSB/GOkv9uv9FS+C1YvJ9QUODQC0v2Hmfl2dKITgMOF
   qG8OnBq640QNYG7U3u26gSZL8VVvyVBzKTXwWvRmXMcn2l4LMoVu9x0zz
   LteuYEJC+n15s0lvAfQkKQ2PxX52uQR5h4bEp22aFpuMnMNmnRqsnUEuq
   5J8f8BiuvQTZzR67lKhnUHP5saPRGmlwSuH5T5SgdBjvnEvUn2/9ipNcq
   A==;
X-CSE-ConnectionGUID: Drrk/ct1T7m4/NFrY4Btkg==
X-CSE-MsgGUID: 7izMkSqgS92CWwl1Qha1ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62795856"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="62795856"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 04:36:29 -0700
X-CSE-ConnectionGUID: /d3Ph3l1RMOBRNZIpR99nQ==
X-CSE-MsgGUID: YraqQavTRsCnt2mqqJxSVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="219293820"
Received: from rvuia-mobl.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.114])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 04:36:22 -0700
Date: Wed, 15 Oct 2025 13:36:15 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: michael.riesch@collabora.com
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Gerald Loacker <gerald.loacker@wolfvision.net>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Markus Elfring <Markus.Elfring@web.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Collabora Kernel Team <kernel@collabora.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v12 07/18] media: rockchip: add driver for the rockchip
 camera interface
Message-ID: <nrf4epgtmhujwdtkhbsjgpunqvwqxs6a4utipxgphakxi7hwsh@muazbpt325wu>
References: <20240220-rk3568-vicap-v12-0-c6dbece6bb98@collabora.com>
 <20240220-rk3568-vicap-v12-7-c6dbece6bb98@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220-rk3568-vicap-v12-7-c6dbece6bb98@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_043631_235217_80650B27 
X-CRM114-Status: UNSURE (   9.70  )
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

Hi Michael,

Thank you for the patches!

On Tue, Oct 14, 2025 at 03:01:53PM +0200, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> Add the skeleton for a media controller centric V4L2 driver for the
> Rockchip Camera Interface (CIF).
> The skeleton features support for the PX30 Video Input Processor (VIP)
> and the RK3568 Video Capture (VICAP) unit.
> 

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Tested-by: Gerald Loacker <gerald.loacker@wolfvision.net>
> Reviewed-by: Gerald Loacker <gerald.loacker@wolfvision.net>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>

--
Kind Regards
Mehdi Djait

