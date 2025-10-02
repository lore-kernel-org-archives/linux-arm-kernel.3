Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42232CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 08:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=azdAvEOMcgyDz78fJ2Qii1EMq2+b6Q4oExBGZ+pJ8tQ=; b=36XfCGkAsYO6wwO/jvyLj7gq6j
	Ke87qPpyF2sX2CMFOD0aviI/SelhhZEIb30DalhZvGyNbvnGNB8Un9hJQqmxtajhna4tTIt1pcv1Q
	PnyGbID8p4US92LQ9O8UmulE/2EUSFSxrmdOxkqKsTstYwxfNfnJcXTNSPBODf0+xB+f0hopTsWZC
	783Rgl/zC/709SHXFtN9VFKLN4JVaJShFCdFrbQ0PH44QBG7W0pZ+dy4sD3bFgmOgG6Ypyexhl68k
	QhaUOHNyHv/ZU5NjCqt7z7Ixk2+kk29+mmQ16wOTbJ7Ax3Kcv8vLD4EoPCOAspgTs5io6+f4NYyB0
	3VxFJ4rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4EUz-00000009uGL-3QaY;
	Thu, 02 Oct 2025 08:17:13 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4EUx-00000009uEk-27q4;
	Thu, 02 Oct 2025 08:17:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759393031; x=1790929031;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qhPCv+hvtTaEhLSvWRtO8cEw6fW/dZWLWErQIn5N/xI=;
  b=HFqu5hpRXwkAPS/BtvoBpMDHAQcwrZwgg/MhcysyXa6+Ksc25hBaNKOw
   VBjrRpfmxaDlNC7EjcCHGRvATC6B/gIRRgK+UHqbd7wHn0DqwaNSbmLTR
   OXHIbMkUvOogQjSEn7Fd8N230MbyuglOLH+gCk1D7m9Y+wTTBCAYfsLcj
   qZC34R1+Jzr95BaZFVqyEaB0+VxAdhNIaCNaVidcHXlNC+U1f6KN6Quug
   wDHAVdNSrEOHx2C+q+8Wg5YHlbBQoo4GnLOzVwOKqbP36d5Ul4Dk8Uq82
   czPwFZUHSucjdBjfts2FbNy7EzpacY2qIn7D00/5lsbI050DkXYDcEa0n
   A==;
X-CSE-ConnectionGUID: J6LqYt4JQbKhk2PDDWxJzA==
X-CSE-MsgGUID: NYxBYIckRlaM3dEnjdwxaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="49230499"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; 
   d="scan'208";a="49230499"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 01:17:09 -0700
X-CSE-ConnectionGUID: 6YX8BcraQ+aqUY/Jr4ihHw==
X-CSE-MsgGUID: BdxfyJimRBuNrjmbXHg0HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; 
   d="scan'208";a="178797283"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.175])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 01:17:07 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7333A121EC3;
	Thu, 02 Oct 2025 11:17:03 +0300 (EEST)
Date: Thu, 2 Oct 2025 11:17:03 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Keke Li <keke.li@amlogic.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Antoine Bouyer <antoine.bouyer@nxp.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 0/8] media: Introduce V4L2 generic ISP support
Message-ID: <aN40_78P5TaUuglA@kekkonen.localdomain>
References: <20250915-extensible-parameters-validation-v5-0-e6db94468af3@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915-extensible-parameters-validation-v5-0-e6db94468af3@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_011711_561836_F069C7D6 
X-CRM114-Status: GOOD (  20.80  )
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

Hi Jacopo,

On Mon, Sep 15, 2025 at 07:18:09PM +0200, Jacopo Mondi wrote:
> Extensible parameters meta formats have been introduced in the Linux
> kernel v6.12 initially to support different revision of the RkISP1 ISP
> implemented in different SoC. In order to avoid breaking userspace
> everytime an ISP configuration block is added or modified in the uAPI
> these new formats, which are versionated and extensible by their
> definition have been introduced.
> 
> See for reference:
> e9d05e9d5db1 ("media: uapi: rkisp1-config: Add extensible params format")
> 6c53a7b68c5d ("media: rkisp1: Implement extensible params support")
> 
> The Amlogic C3 ISP driver followed shortly, introducing an extensible
> format for the ISP configuration:
> 
> 6d406187ebc0 ("media: uapi: Add stats info and parameters buffer for C3 ISP")
> 
> with a very similar, if not identical, implementation of the routines to
> validate and handle the ISP configuration in the ISP driver in the
> c3-isp-params.c file.
> 
> fb2e135208f3 ("media: platform: Add C3 ISP driver")
> 
> With the recent upstreaming attempt of the Mali C55 ISP driver from Dan,
> a third user of extensible parameters is going to be itroduced in the
> kernel, duplicating again in the driver the procedure for validating and
> handling the ISP configuration blocks
> 
> https://patchwork.linuxtv.org/project/linux-media/patch/20250624-c55-v10-15-54f3d4196990@ideasonboard.com/
> 
> To avoid duplicating again the validation routines and common types
> definition, this series introduces v4l2-isp.c/.h for the kAPI
> and v4l2-isp.h for the uAPI and re-organize the RkISP1
> and Amlogic C3 drivers to use the common types and the helper validation
> routines.
> 
> The v4l2-isp abstraction will be augmented to support statistcs as well.
> 
> If the here proposed approach is accepted, I propose to rebase the Mali
> C55 driver on top of this series, to use the new common types and
> helpers.
> 
> I have been able to test this on RkISP1 but not on C3.

Thank you for working on this.

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Kind regards,

Sakari Ailus

