Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D0B8C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 14:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zt+xbs0NBI74sByirlvw31dLfX2Wyvy4LB/gMcFqPI0=; b=oIa1J10JwwbXZYn/5r76MuPygY
	vGvQh6rN455sOo6uh84IUyN1fGixO5H6q4MAnx88PRkG/QRpWfWTfdVlhS44uY1gydAgT/EVssFBk
	yZq7mMTMdneb2NNEKkxl6ZUe9vnp8GJUTmIZIGe8a3NLma2IX0/vhNDP6y+0BOt9zq1a4vs0jq3mY
	QW395Mhyfh7pBShTFgj2SjZ2tcxXSXpv++VPyCbYD2YNLIfFdQFWNlPAfHtQ1D4LqB/4jGPI+i6wT
	XHHqnMSVJEJFJx1jF7oyTPywA1f2XEFSZqVByJK4XBuCI4xhgiNp+JbcmMXpLJ2at33SQ5xaoRtNe
	GejTd6xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OKw-00000008atD-16v7;
	Wed, 23 Sep 2026 14:52:42 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OKt-00000008asH-41BQ;
	Wed, 23 Sep 2026 14:52:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790175160; x=1821711160;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5NEEg5ZrbVeB7iJ6/1LfdHcHnn0mLJlY5QPsY+cmr/M=;
  b=Wgt/ai8tIhL7AFwFbFBw9r5GPJFGJR8iJZ4XRZg6m/GjHoHNR2+c557/
   Qen9q5ErN+Q8uk92/oeh9fTE9Oz6aPWfd/3u/e0EeOwhPsJwFzp4JzRt8
   QFTFLTA3WoPyYUWRzJTk8BfwP+5XKoRQuoH6WUA8kcOAj7SkKdn1Acquh
   Zo1iAJFeGRYufp5B0Qrk+dSMXtEI6LazUkXkzP/ihrYm0MLyVYsKDQgqy
   lEMc2PoRWAO+2C9bBF0IzHY664JaAKt+B4pjnhWuzMFhM8SSyorYGqzLM
   Km6Cjgf7E5pcxOtYvrpvmxLgBwAj7G4oucz7Z0Vo1JD6iLTNyqfQ/uqxm
   w==;
X-CSE-ConnectionGUID: e9MVV7hMSV6gyzHv9CcvPg==
X-CSE-MsgGUID: dGYO5354R8q4X+nPHvvvug==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="101541249"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="101541249"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 07:52:40 -0700
X-CSE-ConnectionGUID: Wvq2+qLRQziT909EuE+q2A==
X-CSE-MsgGUID: QUIyiKtpR42DBfyWGqsVHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="272250904"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.54])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 07:52:37 -0700
Date: Wed, 23 Sep 2026 16:52:29 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Amin Gattout <amin.gattout@gmail.com>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] media: rockchip: rkcif: add a register index for
 the MIPI capture size
Message-ID: <arPnhGHzFiWOtzfi@mdjait-mobl>
References: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
 <20260921-vicap-rk3576-v2-2-0a4582e20c72@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-vicap-rk3576-v2-2-0a4582e20c72@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_075240_021816_7173D812 
X-CRM114-Status: GOOD (  13.43  )
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

On Mon, Sep 21, 2026 at 05:29:58PM +0200, Amin Gattout wrote:
> The RK3568 and RK3588 variants configure the MIPI capture size in the
> ID_CTRL1 register. The RK3576 has a dedicated ID_SET_SIZE register
> instead.
> 
> Add a register index for the capture size and write it through that
> index, in preparation for the RK3576 support. The RK3568 and RK3588
> mark the index as unsupported, so the write is a no operation for them
> and their behavior is unchanged.
> 

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Signed-off-by: Amin Gattout <amin.gattout@gmail.com>

--
Kind Regards
Mehdi Djait

