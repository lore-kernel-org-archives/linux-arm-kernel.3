Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3C7CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 10:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wSzyEHIHm/35U1Oc8plpSUbfHu8HJeI3evCHZgZnpFE=; b=ACusappN92SzW30+HIEgYhHUiG
	g5S7fQccKQaNxJy2DJThfjRnrUC2Nor3+2uS9Bn/MjjcEd6nFhAdmqGBb6S6a0SnJYKwhfmNn7ptU
	kjoI9pZWuBwKZrFK9qIleyf7M7aBPX372XYPid5a1aMC+KdzxmMkxGxVNMj0csSIdA/RejcAQeGKE
	Vj42OFB4K1g49UuUFFo1gTdoJhafDqmwnPL2QhfprEqyJWtG1ZSs6/JMehiK2jyu2R+k4qsg5IMu6
	PS3+CNY7EfPgUzr/7XVZYXPbHanj41LgeRkR4Yq1zLGkfmjyFhlzaQxtSE6joStA0XS0QHYzE/EM4
	Rsbz1YjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQN7q-0000000AW29-0pp4;
	Fri, 22 May 2026 10:29:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQN7p-0000000AW1n-1SC3;
	Fri, 22 May 2026 10:29:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wSzyEHIHm/35U1Oc8plpSUbfHu8HJeI3evCHZgZnpFE=; b=nSWtCVq0+kJR05HSLiQIE9VP5t
	qrG6xage66Jp2C+rqzmRe8jzHHc6m/IO8C8+F7JlOkzcRc0aneaXC9PC4CrHQqLxDsJ3eh1znLe42
	5+LZB1sUmvTRCPMrVN/XR1t4rLDIIZwm/NjN0ooPHJS9zf5Tdfcb1/yTA15kyqZsg2xCAhhk58NBj
	DqOOP4G1W9zYrFM4vmozNh5WsLUJAifNV6c9YZwqbvnquLyS7IYbg1VzqYKfEJ9ey5anE9YccOpDm
	kAmklWUidv8yZcI5r54RUi3dOK2+xNe12v6BQgdA3u6jjmcrRdwcqnRctA+eaIWfkb3NLPZZetKZo
	i4U4PQRQ==;
Received: from mgamail.intel.com ([198.175.65.9])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQN7l-00000003ziL-2Zpr;
	Fri, 22 May 2026 10:29:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779445742; x=1810981742;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=o80USRSoOccAjZ0/+LbXX+qxTLzgZyZiobgDeEHQ1+U=;
  b=IhTlXiRjW0TA7J3gu+VUcqWocQgejQdBwPd9+C/uzVVMqQlm5+cOGWmu
   aL4HuDzuCKOl6F2poIRd8/14vygT5LGsm46DUAvHcRd6myTn5qa0k+qV6
   lpbgZO8LRnQGdrycGKISlj+YL7Wchksrezy9pESwzM2u7jZ39xf+RMIhM
   R2Sr7Z7y5kBaH3ADET3RRkREhZeeVJEq+3puMKhaBJCcky1gBIcMomELV
   2uRcLpQr1sMXDmR9N6qPnSUCgj8IiAsUfcWfkNbSFOsZaI/X3JDkuylQh
   duhIyPvBMmldeJyxz4HNDTjtMj8R8iOimnef9+p4MHdGXoj2nKYXGgea0
   A==;
X-CSE-ConnectionGUID: EDLVkt6LReKbQS7G2EqqyQ==
X-CSE-MsgGUID: On0gyEU8Tr6NeTyhRa5Jow==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="103052271"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="103052271"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 03:28:55 -0700
X-CSE-ConnectionGUID: L4nas1MgQJyvuR4w2vBveQ==
X-CSE-MsgGUID: CGSZjljdTVKDuo6whHqd1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="245860596"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.224])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 03:28:51 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 99493121C7F;
	Fri, 22 May 2026 13:28:47 +0300 (EEST)
Date: Fri, 22 May 2026 13:28:47 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Eugen Hristev <ehristev@kernel.org>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Naushir Patuck <naush@raspberrypi.com>, linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: bcm2835-unicam: Fix log status runtime access
Message-ID: <ahAv3430zwqeDXnQ@kekkonen.localdomain>
References: <20260521-bcmpipm-v1-1-3eba88d88045@kernel.org>
 <4d7deb19-d384-497e-8139-c977a9f3679d@yoseli.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d7deb19-d384-497e-8139-c977a9f3679d@yoseli.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_112902_360777_65922667 
X-CRM114-Status: GOOD (  25.73  )
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

Hi Eugen, Jean-Michel,

On Fri, May 22, 2026 at 10:31:51AM +0200, Jean-Michel Hautbois wrote:
> Hi Eugen,
> 
> Thanks for the fix, the issue is real, but I think the patch leaks a runtime
> PM reference.
> 
> Le 21/05/2026 à 20:09, Eugen Hristev a écrit :
> > When requesting log status, the block might be powered
> > off, but registers are being read.
> > Avoid reading the registers if the device is not
> > resumed, thus also avoid powering up the device just
> > for log status.

Please rewrap this, most editors can do that automatically.

> > 
> > Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
> > Signed-off-by: Eugen Hristev <ehristev@kernel.org>
> > ---
> >   drivers/media/platform/broadcom/bcm2835-unicam.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > index 8d28ba0b59a3..818694f007e2 100644
> > --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> > +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > @@ -2052,6 +2052,10 @@ static int unicam_log_status(struct file *file, void *fh)
> >   		 node->fmt.fmt.pix.width, node->fmt.fmt.pix.height);
> >   	dev_info(unicam->dev, "V4L2 format:         %08x\n",
> >   		 node->fmt.fmt.pix.pixelformat);
> > +
> > +	if (!pm_runtime_get_if_in_use(unicam->dev))
> > +		return 0;
> > +
> 
> pm_runtime_get_if_in_use() returns 1 and increments the usage counter is
> active and in use.

Also, should this be pm_runtime_get_if_active() instead?

> 
> I think we need to add:
> pm_runtime_put(unicam->dev);
> 
> Just before the return 0;
> 
> BTW, we may miss a dev_info explaining why the live data is skipped when the
> device is suspended ?

-- 
Regards,

Sakari Ailus

