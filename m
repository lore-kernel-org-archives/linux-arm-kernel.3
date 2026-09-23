Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BCAC98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 14:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=etqn13Lq51xme7cCNLOrYqYx7XaaOl5cfdKxSKXsKQI=; b=F3WXfhrEzTOf+AAUFWNUAP/EbM
	CLYvPEWW7eouYtyAaxjEfFveni7mpKWCj4AbGDLp719atWLppnPzX7x06wIhCY9GBSNmZEr6hUWwo
	2lPIJiDnExd2zj6MKxgJsE5U0qYvH+iElfsr9DQWeaykWw/aZ++A9mqXGT4+M+PkFnWzdZwKJ5VMr
	/3jsScYOJ+yNOZpDMVcK3gnZOoWOEw7Wwj6WpTbqf9siILCHgOQvry6yPOq9c/Lg5nmXu2QlqvLSo
	6KsFKPQU4IcMiFSOor/i3cAKk9iVpxQ0bqzEIJUy44UxF6FE7X02VOnm2z9Xr+uao0iqNlJE4SDaQ
	7VR50+NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ONQ-00000008bIb-1t7n;
	Wed, 23 Sep 2026 14:55:16 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ONM-00000008bHs-3ioi;
	Wed, 23 Sep 2026 14:55:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790175313; x=1821711313;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+H8TWXnyw19DNw9IGGdQ+9X9HmNp+bY8Z2cPHva83uU=;
  b=TVnSisrlFNsBGBZSbbZxA0mT9sUaZamCZpOW0SzkGn+2jN0oOribKdgI
   7USwtrYK4nDosJ2N+rjwg2Xm3jYikssULq0ZIGjWAJsXUwfMIK5tUCbBp
   2NlU/hvZVAm1HoZWXctG+NU4A3SOKGW81ac1QeSc+KlX7tygBYAAuMGCZ
   nxA6QMnJyQvIGiCchP5LPkDGUn+rOUxUJrD/6d1DDqOXWyedeuBhu7TTa
   TjtQTwugP6cVdoSL2VI22Nr8/lMYXLWJ5ebfV/Ylnq8bWwczPwQKFfDWV
   9a8D4a1Jh+VhepSE8pa2MA8qJD5FyLSyKhyfCPhWRPSC+B5bWJJdLhkW1
   w==;
X-CSE-ConnectionGUID: PLgzVdocQmuZD1/oIQN/tA==
X-CSE-MsgGUID: 0jMhiX64QaqPkzSW3YYoYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="78431944"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="78431944"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 07:55:12 -0700
X-CSE-ConnectionGUID: FRJoq8B0SL6amop0jJwSpw==
X-CSE-MsgGUID: IQJs1V0bR2uGhl+4WxBPLw==
X-ExtLoop1: 1
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.54])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 07:55:10 -0700
Date: Wed, 23 Sep 2026 16:55:01 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Amin Gattout <amin.gattout@gmail.com>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] media: rockchip: rkcif: add support for rk3576
 vicap mipi capture
Message-ID: <arPoG_CUhiS5F7md@mdjait-mobl>
References: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
 <20260921-vicap-rk3576-v2-4-0a4582e20c72@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-vicap-rk3576-v2-4-0a4582e20c72@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_075513_239926_3BFF7BAF 
X-CRM114-Status: GOOD (  12.11  )
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

Hello Amin,

Thank you for the patch!

On Mon, Sep 21, 2026 at 05:30:00PM +0200, Amin Gattout wrote:
> The RK3576 Video Capture (VICAP) unit features a Digital Video Port
> (DVP) and five MIPI CSI-2 capture interfaces. Compared to the RK3588
> variant, the MIPI register blocks are laid out differently (there is
> no block at offset 0x200), the ID_CTRL0 bit layout has changed, and
> the VC/DT filter has moved from ID_CTRL0 to ID_CTRL1. The capture
> size, which the other variants configure in ID_CTRL1, lives in the
> ID_SET_SIZE register.
> 
> On the RK3576 the pixel clock of each MIPI port enters the VICAP
> through a dedicated CRU gate (CLK_VICAP_I0CLK to CLK_VICAP_I4CLK),
> so the variant claims these five clocks in addition to aclk, hclk
> and dclk.
> 

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Signed-off-by: Amin Gattout <amin.gattout@gmail.com>

--
Kind Regards
Mehdi Djait

