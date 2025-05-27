Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D07C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 06:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FGYv5dBgM+8SHCufDBN8eseu6kUhnDZ4+FX7g2bRaVg=; b=AgwIsjCJxQueZqFCmVFP2bE57P
	SXKlO1ooFnRF+na5vHDjN6OlZ1Stz2yC0bWuLPmBo+rYYXULBp/ZB5Yiv7Bd7Ew8uzTOSufpFxbom
	FrbGlu9HX5ff9RCV5RF/MwZLGBfHPQB2RoC9JWUAud72payUs0VHfhwNZz8UMu2Tox7GiMmCZ7JGt
	2N/rQ+sJNS6sZHzy6tb4oi24UBA3ghMqWbPhwHOElDroTDuKsYDCN3CxEk/2omSYgYBHmMwr1Q04k
	O3KemTfM4FI/JHkNYsRKUHMa0FoRDR25KVato2C2tBDMXLSWR8u5OpHq9LqUutavX7N6GhSc6Q9/5
	cxaOz/2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJo1W-0000000A3ec-1Tim;
	Tue, 27 May 2025 06:42:54 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJnwB-0000000A3AA-4BRt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 06:37:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748327844; x=1779863844;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zbO03nqPX+0Zq5BIX2ZmgYrviPnHxi0V6Sa09FjzZWM=;
  b=O9CU7B2nD78O7q3Nl1L4FKg/RV/5AUzKNeF/TqHXnZz4BUTcXp16yWHE
   HlLgmM4mTNSwD5jiZgXfJvLi0DmvaZ1XfM7ZzRZtK44l+MGYxuhZsz/SN
   Sf3Euztf/4e6KLIthrKV97vbIvhJy4n0fu8wiz8WQHH7hOUH9AkmWWFX7
   cdc3rW9AWqPlj8vchyTZwEcF4egD9Dxg0vqdgY/i47DUiOk+1gUBD/XOJ
   b+5tkoHZDNVwnYTlBLmGCAAtjCb82dSEqs/KQ1riw712r4cgJQ7TlkI5X
   V/Qdc1Ew8fC2QqzGLIhDCrJfsoXHhJgMYKoyp2/xUfggyGrpKkO2yHy46
   g==;
X-CSE-ConnectionGUID: 79Lq9T7IQMKBQ3ZbX32hkA==
X-CSE-MsgGUID: AM3HZaSKSIWVyRFKhKzQwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="61657512"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="61657512"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 23:37:23 -0700
X-CSE-ConnectionGUID: EsycDVlcSO+rjF2tzeG6qg==
X-CSE-MsgGUID: +bvoh1g2TiC1Ol8d1apD6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="143628457"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.73])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 23:37:18 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7DFB411F738;
	Tue, 27 May 2025 09:37:16 +0300 (EEST)
Date: Tue, 27 May 2025 06:37:16 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mathis Foerst <mathis.foerst@mt.com>, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	manuel.traut@mt.com, mathis.foerst@zuehlke.com
Subject: Re: [PATCH v6 0/7] MT9M114 driver bugfix and improvements
Message-ID: <aDVdnInPCWiSJ_NE@kekkonen.localdomain>
References: <20250522143512.112043-1-mathis.foerst@mt.com>
 <20250526121520.GH17743@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526121520.GH17743@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_233724_048297_EDE662BC 
X-CRM114-Status: GOOD (  15.62  )
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

Hi Laurent,

On Mon, May 26, 2025 at 02:15:20PM +0200, Laurent Pinchart wrote:
> Hi Mathis, Sakari,
> 
> On Thu, May 22, 2025 at 04:35:04PM +0200, Mathis Foerst wrote:
> > Hi,
> > 
> > this patch series contains the following bugfix and improvements
> > for the MT9M114 camera driver:
> 
> Review comments need to be addressed for patches 4/7 and 5/7, but the
> rest of the series seems ready. Sakari, could you merge the other
> patches, to reduce the size of the next version ?

I've picked patches 1--3 and 6.

-- 
Sakari Ailus

