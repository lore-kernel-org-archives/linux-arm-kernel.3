Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D99D2E9FF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 14:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d194LAtbHHA+WQxpTakn4/4xXjdgsxHN5zzVyFMbmZo=; b=cbmB0VRJbccUrAWBM+KKALYzCk
	Q266doWER7ix229Hl8Q3NN4VsU/NoZgz3UhcdbN0buhoLH6QMdNq2FlYdMexfic+bJrFlJm9junRE
	lX7U6ISwYbMCeseuzgdpVvN9aP4a2WfW/x6ruhekUZOhgks8Zxo26uZpgZjNzW5sJNYFVbVe4nT8+
	gVwwZcu+sR2lWKx6yA0MMueDQZrmqCPsSlD3odSx4bJiWAMIP2kO4hLX0Z49EIN5EwqN9NtxvO+I3
	e9I/BGer+kNm4xL8g0cyHA2dX9tDZ+MQflnapez4oy3F+LYPVQZCISAjI8aMlVuZxnf+NJrWNlC/W
	20kogWng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAVBi-00000000Hqf-1Hvt;
	Mon, 11 Nov 2024 14:14:42 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAV9W-00000000HCl-3LKq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 14:12:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731334347; x=1762870347;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=d194LAtbHHA+WQxpTakn4/4xXjdgsxHN5zzVyFMbmZo=;
  b=KFIzNwq63KAwivV8LEjnX1A3z/SdnEOwKmCfCLPdkcqeVVBujF32HqTX
   udDK9q80y6jg2Y/GrnGwIakudwlOb1IFxMKPxIQ/ZbRTOMDThqS2967VJ
   ehNcQrRhReKlT4Vk2XAh9wyW4dms+QEbebcLXm0HSES2uLLYPltES3BNr
   4YQO4IZrEjanr8moqVE3/qMSg4MdSn5wZKAIpIFxXUudaIvAWsY8qNehV
   hEGLnJ+5T9NjDmXhhsvGoXTPDo5jAegXkeY6V7lXr9U6HtKNSamBDn89F
   x9893nI3+OuJZW0QMjaLKR28NQbib93tWn2/6th9Vy4KAngUdzxAhLjJf
   w==;
X-CSE-ConnectionGUID: isGWFEAPQjeflCxy+lNC5w==
X-CSE-MsgGUID: So8CWxvpTyieH4jvzaygFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="56535213"
X-IronPort-AV: E=Sophos;i="6.12,145,1728975600"; 
   d="scan'208";a="56535213"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 06:12:24 -0800
X-CSE-ConnectionGUID: 0O9YeO9nR0mJkqccr+rJfg==
X-CSE-MsgGUID: Ws0h1OM1QryPUar4jSR7LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,145,1728975600"; 
   d="scan'208";a="117864269"
Received: from ubik.fi.intel.com (HELO localhost) ([10.237.72.184])
  by fmviesa001.fm.intel.com with ESMTP; 11 Nov 2024 06:12:21 -0800
From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 alexander.shishkin@linux.intel.com
Subject: Re: [PATCH] hwtracing: Switch back to struct platform_driver::remove()
In-Reply-To: <20241111110922.334610-2-u.kleine-koenig@baylibre.com>
References: <20241111110922.334610-2-u.kleine-koenig@baylibre.com>
Date: Mon, 11 Nov 2024 16:12:20 +0200
Message-ID: <87h68duaez.fsf@ubik.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_061226_868094_2E87A4A8 
X-CRM114-Status: GOOD (  20.87  )
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

Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com> writes:

> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
>
> Convert all platform drivers below drivers/hwtracing to use .remove(),
> with the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
>
> Also adapt some whitespace to make indention consistent.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>

Acked-by: Alexander Shishkin <alexander.shishkin@linux.intel.com>

> ---
> Hello,
>
> I did a single patch for all of drivers/hwtracing. While I usually
> prefer to do one logical change per patch, this seems to be
> overengineering here as the individual changes are really trivial and
> shouldn't be much in the way for stable backports. But I'll happily
> split the patch if you prefer it split. Maybe split for coresight vs.
> intel_th? Also if you object the indentation stuff, I can rework that.

I'm fine with it as is.

> This is based on today's next, if conflicts arise when you apply it at
> some later time and don't want to resolve them, feel free to just drop
> the changes to the conflicting files. I'll notice and followup at a
> later time then. Or ask me for a fixed resend. (Having said that, I
> recommend b4 am -3 + git am -3 which should resolve most conflicts just
> fine.)

Does anybody want to pick this up or should I? I'm fine either way, but
if there are any conflicts they won't be from my end of things, so it
might make sense to take it via the coresight path.

Thanks,
--
Alex

