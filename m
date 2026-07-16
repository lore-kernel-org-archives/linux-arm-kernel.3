Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02BC4C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 14:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lmyvN7oD4VSNnVQC37bSmHt2WFHAlF0auwNvICnrR8Q=; b=EMABWuFns9/PTD6UJ4rR6ylLrH
	d2pd73bVAqE9Noa/IdPX9sO7XAPb6dct1zSgE3PL+CsVJdi5HycwtAfaTvW8N4ztvaVJ408o2Rnua
	+G55GxUmW6rjY8hHzKi/TkGWYw3fC40zR57p8P6MTYEw8e9VHQ71R5AMK3hcApFGWUh3lmv+FBK0j
	0TyqgIJj40B6VpU28gSjCxzbkADN3pG4Qv/Auii9YDn0qz1SHMV58l062jpwHp8dMQHiU8i58jnqU
	k4bCg/bAif4kx1NmPTVkQg5WbbEq8kewMPWaPClB5BQIjzXWY8bpmfuu/gZq37C02BqCx2o7o+EqX
	WJFYfLPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMeO-0000000HQTU-2WR7;
	Thu, 16 Jul 2026 14:01:20 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMeM-0000000HQSZ-1Rqy;
	Thu, 16 Jul 2026 14:01:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784210478; x=1815746478;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fZhUW9XbwDK//Y1wiW7eA4BY6zVO9reTPYfY6CVKMT0=;
  b=fqAnJyAbzT2EYiE58Pf8efECM9nG6zYzEm0jm3Zq0HpA3I5SVB63xLIm
   Z17TWYPhgtjgIywQIJkC+5C0MuCYCyI13gAgwW3joYpJIElSFoSvTS4nk
   P6rMjWJ528qX6CsOx1pYGkK8E00fLr4JGlrUNaS0UFgpbMij4tujliqqk
   LG892tKiJLiKFQHC7DaQzjh9a0F30P+BCwRVC6TPFzKUVwEeQOapEVhAp
   obQldzX26MyEKJiI2Xrl0QPif5Co3u/RulsC9vD8fW9gf+RyG4BRr7+Od
   8RoWkUq7+/8KKiYMgX+w6/z7AM7vKu8d5r+Qaif9XfshgK9uQf/fmSn+x
   Q==;
X-CSE-ConnectionGUID: TxKmVKs4S4uHDlct9DvIew==
X-CSE-MsgGUID: 7PMZUHHnTBWrXLAbd69XOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="85068765"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="85068765"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 07:01:16 -0700
X-CSE-ConnectionGUID: yz2UQmBLQa2MP5rEv1qZhA==
X-CSE-MsgGUID: kq1w6wdbReqCE7VLsKPc1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="255369631"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.85])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 07:01:13 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5630811F7EE;
	Thu, 16 Jul 2026 17:01:12 +0300 (EEST)
Date: Thu, 16 Jul 2026 17:01:12 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Eugen Hristev <ehristev@kernel.org>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@redhat.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: bcm2835-unicam: Fix pipeline wrong validation for
 unpacked formats
Message-ID: <aljkKMRvv18mw_lP@kekkonen.localdomain>
References: <20260520-bcmpi-v1-1-41d80125a7b9@kernel.org>
 <178046930079.1525445.16102733967737177325@freya>
 <bb075afb-56bf-4cea-9732-f2613feb88d1@kernel.org>
 <20260716081240.GA1837346@killaraus.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716081240.GA1837346@killaraus.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_070118_473417_19240F48 
X-CRM114-Status: GOOD (  34.01  )
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

On Thu, Jul 16, 2026 at 11:12:40AM +0300, Laurent Pinchart wrote:
> On Thu, Jul 16, 2026 at 10:22:03AM +0300, Eugen Hristev wrote:
> > On 6/3/26 09:48, Jai Luthra wrote:
> > > Quoting Eugen Hristev (2026-05-20 21:07:00)
> > >> The commit
> > >> 08f9794d9b79 ("media: bcm2835-unicam: Fix RGB format / mbus code association")
> > >> introduced a check to see whether the format requested is the same as the
> > >> fourcc in the format list.
> > >>
> > >> However, this breaks the case when userspace requested an unpacked fourcc,
> > >> e.g. RG10.
> > >>
> > >> Unicam can work with or without unpacking pixels, e.g. pRAA or RG10, depending
> > >> on what userspace requests.
> > >> In the unpacking case, a dedicated register is being set.
> > >>
> > >> If the userspace requests pRAA, this works, because the check validates the
> > >> pipeline:
> > >>
> > >> v4l2-ctl -d /dev/video0 --set-fmt-video=width=3280,height=2464,pixelformat=pRAA \
> > >>  --stream-mmap --stream-count=1 --stream-to=frame.raw
> > >>
> > >> but, with
> > >> v4l2-ctl -d /dev/video0 --set-fmt-video=width=3280,height=2464,pixelformat=RG10 \
> > >> --stream-mmap --stream-count=1 --stream-to=frame.raw
> > >>
> > >> unicam complains at validation level:
> > >>
> > >> image: format mismatch: 0x300f <=> RG10 little-endian (0x30314752)
> > >>
> > >> This should work, because MEDIA_BUS_FMT_SRGGB10_1X10 can be packed into either
> > >> RG10 or pRAA depending on the packing register.
> > >>
> > >> To fix this, modified the condition check to also allow in the case when
> > >> requested format (fmt->pixelformat) is equal to fmtinfo->unpacked_fourcc.
> > >>
> > >> Fixes: 08f9794d9b79 ("media: bcm2835-unicam: Fix RGB format / mbus code association")
> > >> Signed-off-by: Eugen Hristev <ehristev@kernel.org>
> > >> ---
> > >>  drivers/media/platform/broadcom/bcm2835-unicam.c | 3 ++-
> > >>  1 file changed, 2 insertions(+), 1 deletion(-)
> > >>
> > >> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > >> index 8d28ba0b59a3..cc7627e9a51a 100644
> > >> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> > >> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > >> @@ -2158,7 +2158,8 @@ static int unicam_video_link_validate(struct media_link *link)
> > >>                  * In order to allow the applications using the old behaviour to
> > >>                  * run, let's accept the old combination, but warn about it.
> > >>                  */
> > >> -               if (fmtinfo->fourcc != fmt->pixelformat) {
> > >> +               if (fmt->pixelformat != fmtinfo->fourcc &&
> > >> +                   fmt->pixelformat != fmtinfo->unpacked_fourcc) {
> > >>                         if ((fmt->pixelformat == V4L2_PIX_FMT_BGR24 &&
> > >>                              format->code == MEDIA_BUS_FMT_BGR888_1X24) ||
> > >>                             (fmt->pixelformat == V4L2_PIX_FMT_RGB24 &&
> > >>
> > > 
> > > Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > > 
> > 
> > Hi Sakari,
> > 
> > I saw you taking some of the patches on unicam, this one is the most
> > important as all unpacked formats are basically broken for a very long
> > time (months) and the patch is pending for quite some time.
> > 
> > This should also go in stable as some older versions also affected.
> 
> The commit message should include
> 
> Cc: stable@vger.kernel.org
> 
> after the Fixes: tag. Sakari can likely add that when applying.

Yes. I expect to pick the patch later this week.

-- 
Sakari Ailus

