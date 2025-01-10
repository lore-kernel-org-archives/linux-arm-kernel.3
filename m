Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9245AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 08:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+s9p/Z1M0Kznr7lUtwqDa2vlvfKB26c9CnzYoClwx8o=; b=M0vXrFUVMagdqcrwj+kxWyR7vl
	0TxiFXvpgf3p5Wsg9RW5kagRv166kj4kXHskyTOTRuep7qEWfjr6qJC7xsLl7IViaQ8/b8L7YyupW
	fD0usEN2c38fSM1cGPrO1H4NwYMIpoirYmDW4D0tRhqFGF1Ak5lSg6rxo0tlJqfftHlzTfmkwjb3V
	qxdB8B2zKkZSDhf1REQncSJ6p1IM4PNZ1oj3XOudjr6Zk1IjpHqyamP8aooN24eBfAGHRX0IQM7Ch
	VZFyTppWD7wqxttTzTrOj0PxMwUMrQJXLZom1+DGc7m8mOtqX/LUEXMccTrSDD97yFNxmBwcGC3P2
	AG/mWb7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWA7R-0000000ETUo-33Fa;
	Fri, 10 Jan 2025 08:11:49 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWA6E-0000000ETJt-0CDb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 08:10:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736496634; x=1768032634;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u0SlY39EHudaIchSfeH9EDK+XhR46+IbBeM2GLNudWc=;
  b=DfWDMX4848ca10+i66lWVNuRe31S0yt2FUyhrCQFrfN9XM04W4HG0pl6
   P8miHlWVFUxBbcL/+2hQxNtqeCkl5UjPLLQKE96iVFAg7Tr2rooQAx5/G
   WRevoUBObR4pyqjOZ5sS+Ei1BVuI4rpFaCFFKzoIVue+4jzUZVSDA+gm6
   Xl3EKwWmE2CzmHy8HhRY2k7rDKXlmOZ8Cg8v8TV82KDAnwpbzafHvjIAW
   MU3cuv0C7jKcBaBPrNTR+4q4keDI/EJfM8vcECiKc6F5YmSn1nb8P/B/Q
   B8WjiQh/LWeijb2hiMJW9xYY4KcX3XYP9hWgNaK82a3Nh1WTU+WKkb9DI
   g==;
X-CSE-ConnectionGUID: y78/xLiYQS+tmNFfDXGwTg==
X-CSE-MsgGUID: RczqudYKSqeI2wqBKuV5gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36471692"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="36471692"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 00:10:33 -0800
X-CSE-ConnectionGUID: i7ifN1BaQc2OMi34W+qoTA==
X-CSE-MsgGUID: WYJk5AcTQVGQibvApw/qYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134566256"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 00:10:30 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 91FA511F89A;
	Fri, 10 Jan 2025 10:10:27 +0200 (EET)
Date: Fri, 10 Jan 2025 08:10:27 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/8] media: stm32: csi / dcmipp corrections
Message-ID: <Z4DV8zVqQf9Bl0X5@kekkonen.localdomain>
References: <20250108-csi_dcmipp_mp25_enhancements-v2-0-05808ce50e41@foss.st.com>
 <Z4DVj9ubGkAmkZKN@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4DVj9ubGkAmkZKN@kekkonen.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_001034_138675_F25B0D64 
X-CRM114-Status: GOOD (  17.89  )
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

On Fri, Jan 10, 2025 at 08:08:47AM +0000, Sakari Ailus wrote:
> Hi Alain,
> 
> On Wed, Jan 08, 2025 at 02:16:03PM +0100, Alain Volmat wrote:
> > Various fixes within the stm32 csi bindings/drivers and
> > stm32 dcmipp driver.
> > 
> > Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> 
> Thanks for the update. I tried to apply this but it doesn't, and the
> culprit appears to be this line in dcmipp_graph_notify_bound():
> 
> 	unsigned int ret;
> 
> That appears to be a bug as such. The interesting thing is that the patch
> changing things around it presumes
> 
> 	int ret;
> 
> so it won't apply. Do you already have a patch that fixes it? It should be
> cc'd to stable, too, with a Fixes: tag.

Ok, the tag isn't necessary as there lack of the sign doesn't seem to
matter in this case.

-- 
Sakari Ailus

