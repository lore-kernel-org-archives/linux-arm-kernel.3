Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB1F5C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 19:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8GtVY8hktFDGmmjoo2Hp703EpRIIRLbbH7Ybd5edZ98=; b=KIofMeTuKaCZ0sJUtJfRRckiiR
	+hG0PaghbCQRU7BwvLaEnjK9HJjcbIq03CtfCfoE1a2+opNBAXWOgwvVaiFPCuXteL3jXtZDyAgm/
	nlVBrklGrZ1Han3zIsWcyhHABFSa7H3nds/tW2d+jlND/k1ISxO2pMpqinz01hROPAswX8fYv5pod
	lguEvQ8joygv7YfrxBVBpdo+X81gq2+O6zFZszUkjg5aCv6+WEEQl1Y2YBlQYI1HuZeUHtkQlFixw
	13h+MNL/Z090rb0WY3exMFqi3G0rYdjxnyRPqn04Tl5HTeh+yWA5dhTUEy+hTmA9XrkI3W11Ha3Wg
	48zuUxtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug6w0-0000000D92Q-0Ie8;
	Sun, 27 Jul 2025 19:21:24 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug6sE-0000000D8gV-005M
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Jul 2025 19:17:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753643850; x=1785179850;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DA8SKo3gjxFsO4naG53gpmTJP6cZpBTggbw3PhnVU4w=;
  b=n+lBzCM5v72Ubzpc4JlmePcNw4/lKR5hwOumEGJ2uYDsQledgJ4SeIXd
   Mpeozcg1IBPJNwPIHR8JWKjHENeQEy5ch7OpWuGdlga0NnzpkuxWZPMJN
   vuqnsSi+IsPmxMjrWGrhscMIWwqVitTL4W3UJHO9VtebMELLfrorOMNc9
   FDkEZsI51a5x1Xc5HB79OzCwQBurBBtLXye2Tos4rvu7MD15mAFOiP0M5
   D0ZcnHIPSxBkXzc9gkP8PGUD0OpsyIA2+WB9gF5kcSMYR/puebKR0l+SD
   ISAj9RnkZ6dCz0AsrR065LHpDEgRzCUfXbDyQUTPUAHf2w9kAmsEvDWP4
   A==;
X-CSE-ConnectionGUID: OSPHd1pSRhqEpjAPAMIu4g==
X-CSE-MsgGUID: rHyhDgoYQc2SGWyZecSl7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="66601297"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="66601297"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 12:17:23 -0700
X-CSE-ConnectionGUID: XAqqRAWFSFaddf8FjFc9yQ==
X-CSE-MsgGUID: fpTgazu9Qj+8pamhVTDu2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="162109573"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.124])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 12:17:20 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 83F1911FAF5;
	Sun, 27 Jul 2025 22:17:17 +0300 (EEST)
Date: Sun, 27 Jul 2025 19:17:17 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v7 01/24] media: mc: Add INTERNAL pad flag
Message-ID: <aIZ7PVTXVDGZN-60@kekkonen.localdomain>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
 <20250718152500.2656391-2-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718152500.2656391-2-demonsingur@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_121730_044012_C2679161 
X-CRM114-Status: GOOD (  11.26  )
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

Hi Cosmin,

On Fri, Jul 18, 2025 at 06:24:37PM +0300, Cosmin Tanislav wrote:
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Internal source pads will be used as routing endpoints in V4L2
> [GS]_ROUTING IOCTLs, to indicate that the stream begins in the entity.
> Internal source pads are pads that have both SINK and INTERNAL flags set.
> 
> Also prevent creating links to pads that have been flagged as internal and
> initialising SOURCE pads with INTERNAL flag set.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Could you use this version
<URL:https://git.linuxtv.org/sailus/media_tree.git/commit/?h=metadata&id=265fd80075b5f3d25525cf026f33f8fa8572b3d3>
of the patch instead?

I can't yet say whether my metadata series should land before this set
though. I'll try to send an update on that in a few weeks' time.

-- 
Kind regards,

Sakari Ailus

