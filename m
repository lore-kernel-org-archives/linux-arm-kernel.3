Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B22C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 20:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qRm+M10jztiBItKv95Cc4Tv6ZB83NIZgeNvNPEhB7KE=; b=jvCUcnoZLhKDgfRLNsbR7YcFQj
	2uG6irg1TWsfesm/VfvuOqP/GxNEgzEWK0WD2A5MnHpBrCRdzX6g1e9m+Kl7L47ooNwUxUyH5raJ1
	MmzkLke0Ax89WYKOopZsIoM1XLkXcfHzVFna+5XQljOf10YZUgXl76oNUjbmjLITYiqjooSE2c4p5
	A8YZgiUDC09miUGQf3mRtEDoGleG5+IbmtPdsaMQst7xSLvHbM1aQhcHJppgi8+7m8QxNWvvhpwhd
	Oi5mr746gZGROIh8+epaxCW7J8G14I1QI1cSAzX/T8vfhTUtZnDgyjes24BYup79UwsSd3rTbjeuB
	amPqO7bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws4vx-00000006gWH-3kon;
	Thu, 06 Aug 2026 20:43:21 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws4vu-00000006gVA-3zUt;
	Thu, 06 Aug 2026 20:43:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786048999; x=1817584999;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=XYQ9ph7SkY99P2wiTffNIVODeXKg9zc/r2YlJXW/V38=;
  b=WDs/lzAqmI0EwRha6dVp1hIpsd5DgVDBByKUJbMqL4Jz+XR8XKrNPInJ
   usQcx2GjpVnfCbHFQo4zNASQiJDdL1hqKqfP84losjd/7I0kryEUqKhpr
   ydWqD8LlPD25bgKmnwvGbZi4WveYcE4BRWJGOWSNXmOsX/Kkteb+MqQve
   2VDxWwVCIkqCQ48B47+DATpETdMEbzdMX+T2FfInhaDr4Z+vc9Wh0RPAL
   WvDvQReU4oGmHK6SxGeAQnb5WmAchS+DMho61MiELtI4vQBbPxwiiYu64
   HkZUBeBUT1opW4M+SSAL6qT3DlC/+BFlEg+e3bN0YvQNw8WRxF5rqpVzG
   g==;
X-CSE-ConnectionGUID: bFub+QMzQtOI343nnwztmQ==
X-CSE-MsgGUID: rC0qpDF1R0yD1znv2KYXNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="74196168"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="74196168"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 13:43:17 -0700
X-CSE-ConnectionGUID: htgOAVvLRcKSncnclFgLkw==
X-CSE-MsgGUID: 5CYS6t07T7uX3QBlQJtdtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="286886747"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.50])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 13:43:13 -0700
Date: Thu, 6 Aug 2026 23:43:11 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev, linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/9] i2c: of-prober: Defer regulator_disable() on
 successful probe in simple helper
Message-ID: <anTx3y3kZNDEKRFW@ashevche-desk.local>
References: <20260721075226.2347933-1-wenst@chromium.org>
 <20260721075226.2347933-7-wenst@chromium.org>
 <al9IwVR7Whw2DiXU@ashevche-desk.local>
 <CAGXv+5EkcASZ__Cyp4PnwemPd2xAe+WL-ics9jqHLuxWjWyT7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5EkcASZ__Cyp4PnwemPd2xAe+WL-ics9jqHLuxWjWyT7w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_134318_998364_20B8C882 
X-CRM114-Status: GOOD (  21.28  )
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

On Wed, Jul 22, 2026 at 04:34:15PM +0800, Chen-Yu Tsai wrote:
> On Tue, Jul 21, 2026 at 6:24 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Jul 21, 2026 at 03:52:20PM +0800, Chen-Yu Tsai wrote:

...

> > > +     /*
> > > +      * Wait a bit of time for async drivers to probe and increase the
> > > +      * regulator enable count. This allows the drivers to check and
> > > +      * skip waiting for re-initialization.
> > > +      */
> > > +     if (defer_disable) {
> > > +             dev_dbg(dev, "Deferring regulator disable\n");
> > > +             msleep(100);
> >
> > How was this value chosen?
> 
> I just chose an arbitrary round value.
> 
> If both the prober and the driver for the probed device (trackpad in
> this example) are builtin, the time between enabling the node and the
> driver asynchronously probing is between 5 ms and 30 ms, but could
> also see outliers exceeding 100 ms.
> 
> If you're worried the value won't suit every user, I could make it a
> parameter of the simple helpers? And the user itself could be made to
> probe asynchronously to not block the main code path.

I think the comment above should be updated to summarize the above instead of
"a bit of time".

-- 
With Best Regards,
Andy Shevchenko



