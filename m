Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6FFCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 21:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0rHdPAdFxw3o9hAriTwHESFzMG7o+IADOYw7svRA60Y=; b=rBaaQBgOjvSgnaAEolh02gtJo5
	gU5MM63+ZnpT65pR1RkxdY9eP74lWmm6bwFtg9r6fnroWI5yHBJndoy8qlYfXWp48OH3bdBM3eEii
	i2ihfqLdAOCyCVBPa94sadny8QdBfySfAtEq5ziMTcoY3E2RTUB6NN/sNWr8Hm1X3TqFhDotK662c
	j6mdwOi9ZmL7Eo5nUThwYPZjW/9t4R+EA0rTaSKoIyD1Q8yYaF7t1lQLKRIV3z8lv/rth6dp551ou
	EgKdxRGGVt1RF+ZAgylWJI+aL90LkGUk2ylJUtS6f+gU5/sRTFOdw6TeG3C34EuWC5wuJbaLif2fA
	iVmOAXBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP5UL-0000000GzrE-3SZb;
	Mon, 18 May 2026 21:27:01 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP5UJ-0000000Gzeg-1tNL;
	Mon, 18 May 2026 21:27:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779139620; x=1810675620;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c2kzgtlmuCmGBxKQy6f/nzlz7pz4BpR6cOyGsGOmzIs=;
  b=Zh1Fd206sJ0Q3kkY7f4rGqlpln5h0v7xxzmk3fbwVZUYbi3IgqyFa7l2
   /vo5zC+cOE7+gW+ZXRvISgGVTvue8+6K9dkQJIN5mrmZdzcgU+q/61aNH
   hCBbtmp1a1Qy24P3BkP/kVWH52bxbZ7p50vIEp9NQQNiSyz4ELDTPNXi9
   0VTYeY91L9NOUeUeNcyZ63mfywAk6DYFrUqS5H2mZJMFMlxIVzviO27lV
   /P2R0nsoY++dMjbmlAel94TkTI4w/rt579UA26Ljif8vYnbtn42K2b8cz
   rbuvdx/qasiIyl441EVVVuNpTzB2Z+7R3n25h5l7i0tSE5Wbuh4CI1lBH
   w==;
X-CSE-ConnectionGUID: /TfpM8K5Rt2Kf4tDMDDatw==
X-CSE-MsgGUID: ffIB+CsYTdCunu9oJbgjjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79971698"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="79971698"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 14:24:57 -0700
X-CSE-ConnectionGUID: vHo2P8J4SIeUpFshKCynYg==
X-CSE-MsgGUID: 2qCXkziwRuezElfXAOBE0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="244553350"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.244.139])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 14:24:53 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A0FE1120E58;
	Tue, 19 May 2026 00:24:55 +0300 (EEST)
Date: Tue, 19 May 2026 00:24:55 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Michael Riesch <michael.riesch@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/7] media: synopsys: enhancements and i.MX95 support
Message-ID: <aguDpxP4SIcJWdcc@kekkonen.localdomain>
References: <20260506-csi2_imx95-v3-0-953b6e1a80dd@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506-csi2_imx95-v3-0-953b6e1a80dd@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_142659_539959_7D7B95AB 
X-CRM114-Status: GOOD (  11.57  )
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

Hi Guoniu,

Thanks for the set.

On Wed, May 06, 2026 at 04:53:59PM +0800, Guoniu Zhou wrote:
> This series enhances the Synopsys DesignWare MIPI CSI-2 receiver driver
> with multiple stream support and adds i.MX95 platform support.
> 
> The i.MX95 variant is similar to i.MX93 but uses IDI instead of IPI. Since
> IDI is software transparent, only a different register map is needed.
> 
> Tested on i.MX93 and i.MX95 platforms.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

This doesn't seem to apply to the media committers' tree anymore. Could you
rebase it, please? (Or are there dependencies still out there?)

-- 
Kind regards,

Sakari Ailus

