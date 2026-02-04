Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C1FE9D3E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 14:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DDiK63eL+De6Dcm9rGD1Q5u6hojHcpjGQyCCC3Tf1xU=; b=cFqqUo5bNxYAN+eaxLp8Ap/A56
	Pm40l2In/oszgfeBNvOjkakdui2gM77LSttFPv7Rmmof75dRTxqToVhabbDB4QaReF4/NiMVOnS3N
	LUAlS1xRPcLkYuqqo77p+X0tw+IBuoKDnBr/HcvIwZDGxh4CltbQOfIJ9TCAvWK91IM9L60c4EMFH
	ChfVp7LIGrNuV6KxzqMPBNLFYiJf7rKt92yXCmPLrHCCZBm5vAk/qDzaTxriHoFOvs5VJk5p/oh5M
	Dz5ZzVyDbvP3zTShCeMlnH4zWYuPdD8RpUgAimg3OQMnmt6aTODQPtBk9kEi8K3pDAMRdkG/J3PMg
	kSDRENqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vndq1-00000008aa6-3kwo;
	Wed, 04 Feb 2026 14:26:37 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vndpy-00000008aZc-42m8;
	Wed, 04 Feb 2026 14:26:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770215195; x=1801751195;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=mfeFe+SWrohiHZ3h2cd0B32iz7YvkWD8TRTYujmvxn8=;
  b=TEKS2C+zlj/zwti4slUu3272K6L0VKXb52XaBMA1CRq49n5WBthqVpSw
   eBG4Vmgz8ao73barvu97RWcSyWKsS8QvYtv0iSCTq5oE7Spb8MHIJmGGn
   KniZbUA+KwbcVM9q004QDplSU9lc4HtSSwAl4jwjDWfkgO8cwQue1WYuF
   G6jyZ2HwI6ZtRkh3y8/b40NFO7hqtbO+Q02xaaDGl4tEw8Yct+xnOwF5x
   PvRRHCKiq4FZsU7JUqJyWpKMVhzLrGE007VjJ2RMgb/rPEYkyic56fs4L
   cWDVc8kIsymMvOX/6B65D8VY8JjT+sjOgrYONkCnrBdsOqz4XtPMDfM3b
   w==;
X-CSE-ConnectionGUID: S5IXxP5gS2eGyp7t3UVvJw==
X-CSE-MsgGUID: 4TB9Wx+KQB2cLq0M50N28A==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82514322"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="82514322"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 06:26:34 -0800
X-CSE-ConnectionGUID: yCVN0XdJTmOo6WYVcJQQeg==
X-CSE-MsgGUID: ucXzXiRKQQyMgwG4Srt8EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="214712880"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.188])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 06:26:31 -0800
Date: Wed, 4 Feb 2026 16:26:29 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC] pinctrl: pinconf-generic: move ..dt_node_to_map_pinmux()
 to amlogic-am4 driver
Message-ID: <aYNXFdxZiO2TMwSy@smile.fi.intel.com>
References: <20260203-craftsman-battered-3491ff68f462@spud>
 <CAD++jLn8WOobPaoSrMLitFgFZc_6CH9BQbRy_Gdqq3BLhDXWQg@mail.gmail.com>
 <aYL9zgEyCarrluvP@black.igk.intel.com>
 <20260204-crawlers-nacho-d7c9021cdb6f@spud>
 <aYNWMndBWxxoPABG@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aYNWMndBWxxoPABG@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_062635_050606_14C67B72 
X-CRM114-Status: GOOD (  15.46  )
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

On Wed, Feb 04, 2026 at 04:22:47PM +0200, Andy Shevchenko wrote:
> On Wed, Feb 04, 2026 at 02:15:10PM +0000, Conor Dooley wrote:
> > On Wed, Feb 04, 2026 at 09:05:34AM +0100, Andy Shevchenko wrote:
> > > On Wed, Feb 04, 2026 at 12:34:36AM +0100, Linus Walleij wrote:
> > > > On Tue, Feb 3, 2026 at 5:17 PM Conor Dooley <conor@kernel.org> wrote:

...

> > > Note, please, remove extra '.' (dot) in the Subject.o
> > 
> > fwiw, the .. was intentional cos I was truncating the pinconf_generic
> > from the function since the subject was really long, not referring to
> > a member of an ops struct.
> 
> Yes, and that's how we refer to the callbacks — with a single dot and parentheses:
> 
> 	.my_cool_cb()
> 
> Alternatively
> 
> 	->my_cool_cb()
> 
> but it one character longer and TBH it slightly less readable (I personally
> used the latter and then switched to the former in the recent years).

Hmm... My memory tricked me, it seems I switched to ->cb() notation, at least
there are patches with that from October last year. Whatever, choose one and
use it :-)

-- 
With Best Regards,
Andy Shevchenko



