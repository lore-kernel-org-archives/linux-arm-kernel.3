Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDB3C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 15:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ljcamiHceLHvMZ6EjNE08m1v0jlWkjmD/bZHz1N2SMQ=; b=dqQeIVCkhKpaMajjfTOCMJiDT5
	SaL1d0AB1yavU9rCmK2I31FnHzQnzbNAFvAuna118y3M6ulk+iA4CDnF6z+eGSQsC/61VLSt4Krwx
	ubd5HkFG9Ln57+oZM7uzooa0dqaTTjOdylYDk+6GhQfKEWgQ8t+RkHRWcV95CKgI8SKShgIZv5z3I
	gkvyZN/rL2uBlH10q5WsusnO4LNSEDfk6qdRsl6Le4dF0PfDv43u+JGmcLAv5QJDA9BnbAXgsC5+M
	Bi08NpdlZ/4u5rlfomss8KZg0C3pn47XGliNPc2EWsJAKw82MGJsspp220Etc6mzdnLz7U6lj59P6
	ZSXTDUpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl8S6-00000001YxH-3FQj;
	Thu, 20 Feb 2025 15:27:02 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl8Qc-00000001Yc7-2as6;
	Thu, 20 Feb 2025 15:25:31 +0000
X-CSE-ConnectionGUID: 0gAseKUiTN2NdTxxR0whMg==
X-CSE-MsgGUID: V/2ZfnclTq+bPy3sZkLG7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40705308"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="40705308"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 07:25:30 -0800
X-CSE-ConnectionGUID: qmtVSK5cSNy+QcnRA6L5zQ==
X-CSE-MsgGUID: +upU1mqiQfig88j8PogIog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="145924174"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 07:25:25 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1tl8QT-0000000DNH5-3Gm6;
	Thu, 20 Feb 2025 17:25:21 +0200
Date: Thu, 20 Feb 2025 17:25:21 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] media: cx231xx: Convert enum into a define
Message-ID: <Z7dJYemMR-mgZXG6@smile.fi.intel.com>
References: <20241202-fix-llvm9-v1-0-2a50f5acfd0b@chromium.org>
 <20241202-fix-llvm9-v1-1-2a50f5acfd0b@chromium.org>
 <20241203093114.0ca49c01@foz.lan>
 <c896221c-5ff2-4a2b-b431-7c7f805b4f68@xs4all.nl>
 <Z7c252IKhXdysjAi@smile.fi.intel.com>
 <55389b80-9f0e-4423-8e92-c486de058720@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55389b80-9f0e-4423-8e92-c486de058720@xs4all.nl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_072530_690403_FFD3AF23 
X-CRM114-Status: GOOD (  14.39  )
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

On Thu, Feb 20, 2025 at 04:12:38PM +0100, Hans Verkuil wrote:
> On 2/20/25 15:06, Andy Shevchenko wrote:
> > On Thu, Feb 20, 2025 at 02:55:42PM +0100, Hans Verkuil wrote:
> >> On 12/3/24 09:31, Mauro Carvalho Chehab wrote:

...

> >> ORing enums is really not a good idea: you would normally never do that, and
> > 
> > I think you missed a keyword "different", so "ORing different enums ..."
> > which I totally agree on, but the same enum values are fine.
> 
> While the compiler might be happy with that, I think ORing enums regardless
> is weird. It's not what enums are for.

I disagree. It's totally normal to have "mixed" enums where we have ranges of
sequential values mixed with bit flags. Cross-enum bit operations (and what
this patch is about) should be prohibited, indeed.

> >> the compiler warning is IMHO appropriate.

-- 
With Best Regards,
Andy Shevchenko



