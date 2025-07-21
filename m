Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E930C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 07:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mHZGvdft08XzZtFwCnwpB66ElRmz0+FxsxWp1lLfTYo=; b=oyj9EMMBNe28kHtx1LA1my/tzu
	7/NQw1mbIqhZc+6taOkhAmb0Z1inH0RfCX/XvpHTkuEMPGjt4RM7jtv6WeX3XuMPh1+MANNhUWF3I
	C/OOuDcWsS2UrKNjTlaL1O6HNNDbhUF1MCUWoBM6SFOxPWjySjQfmtDCtK/8uYnB8gpOquBZiNXb7
	ZrUFcdJBspZSiQKStcTVN2fqWF0CHyMXbRSY9sIlW5V9AbFlPthZM0m7G2wStYYKfQtNDyKAK2uli
	q7itAE4yGlkMl9t6hFFelnUPMOPhSAKuIYkJzKAwhcw7r/sF5jiCKfVsrLrclcq9ZEhs85rXhJaDK
	0J7IImaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udlMC-0000000GZEG-0SHI;
	Mon, 21 Jul 2025 07:54:44 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udlJl-0000000GYjp-2FHZ;
	Mon, 21 Jul 2025 07:52:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753084333; x=1784620333;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S81qr9hFOduDkWryR/8Zook9qEaCBaFDKK8h/sGo2HY=;
  b=VMss2JQTMY5hbXmJlSbFyXVdGLQnBmvOjFzQgzlmnn5D72TrB92WQfc3
   crZzT8b8HvqbpZs+X2P5pAKJ/2w0p21cXaala9BRdC/7/Qqu6K6ZS5vAo
   REDevpLgS4KWtFe6kCMbgvFoM/p2dio3TNEK4PYlVRFuYlpWlGQa8fC6h
   japYvjh9hT81M3zBX5/PQm4tKWz6maiS+Y0RHZGLYTbqQbGIU+9DN6jwq
   9kQA3y5nVE13qPYHfpCgMtv8V701uUAfCfQ1aYq+PffuVEYoo90gvq1qD
   cZv2oz2l+sK8Wgzp0h1t3eTZTWrDS9xwVG44l+6s1Gp37JxVr2Rchxhf5
   w==;
X-CSE-ConnectionGUID: Y+ZHF6lKTRSY0/YNyX7shg==
X-CSE-MsgGUID: ALFz8ioCTHG8bkFuwXMEhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="55249408"
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="55249408"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 00:52:12 -0700
X-CSE-ConnectionGUID: o0q7XRb0RPitcVimaam3ZA==
X-CSE-MsgGUID: khK44DSEQ5igeY5q8Fawhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="182474746"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 00:52:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1udlJb-0000000HHid-2Qi4;
	Mon, 21 Jul 2025 10:52:03 +0300
Date: Mon, 21 Jul 2025 10:52:03 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: ">" <sanjaysuthar661996@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, ribalda@kernel.org,
	jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
	andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	neil.armstrong@linaro.org, khilman@baylibre.com,
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Subject: Re:
Message-ID: <aH3xo8PeReb0s-QD@smile.fi.intel.com>
References: <CADU64hCr7mshqfBRE2Wp8zf4BHBdJoLLH=VJt2MrHeR+zHOV4w@mail.gmail.com>
 <20250720182627.39384-1-sanjaysuthar661996@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250720182627.39384-1-sanjaysuthar661996@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_005213_617040_3475907B 
X-CRM114-Status: UNSURE (   8.66  )
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

On Sun, Jul 20, 2025 at 11:56:27PM +0530, > wrote:
> Changes in v2:
> - Fixed commit message grammar
> - Fixed subject line style as per DT convention
> - Added missing reviewers/maintainers in CC
> 
> From 5c00524cbb47e30ee04223fe9502af2eb003ddf1 Mon Sep 17 00:00:00 2001
> From: sanjay suthar <sanjaysuthar661996@gmail.com>
> Date: Sun, 20 Jul 2025 01:11:00 +0530
> Subject: [PATCH v2] dt-bindings: cleanup: fix duplicated 'is is' in YAML docs
> 
> Fix minor grammatical issues by removing duplicated "is" in two devicetree
> binding documents:
> 
> - net/amlogic,meson-dwmac.yaml
> - iio/dac/ti,dac7612.yaml

This mail is b0rken.

-- 
With Best Regards,
Andy Shevchenko



