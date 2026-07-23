Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F94C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 04:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oJfvVlDTl6mQe+a+u/AjmbPBZoyDUEtEmuL8gQIZO9Y=; b=c3q24zOzPX9QgDpQzVOs4gbQ6q
	WX8U4ffPxiktMjNP4FCf5EO2SI/3H17rEq5h2DcSbTDopcDzz5Ae8cbjTyDBScad9ul9f4RAXiwcv
	7EkZyH0wJh5wBFW5MPyCT/2eAa6KrVhkyfSZMehnAVrItFJbkU+jUyy2Ts87S4B+IoN6ud6dY6dXB
	FuqlhK6PR1BgbqZluPmSRMEELeOyKt1yhpG/7nc7Qn714PPQFInz8JHXoEcYMDJM6CDtfQuwfPTVl
	ELq4Is7GZgi4BRSWRq7IAX3dJNPa3SFS+kfritOSXvJMVN0CCHICdhpjor9jIkgWLdIZN9o9jJRwj
	pbIftz/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmlSn-0000000DR9w-2Qcz;
	Thu, 23 Jul 2026 04:55:17 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmlSk-0000000DR9M-2zSO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 04:55:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784782515; x=1816318515;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/W/KfgTwFK6olB39mtu6fyurtJOfyqyEV5RbFeZlIr8=;
  b=AJZkZcHH4GrjYo/OSpjHjD6blvDuG9l6mCMTWUgOv8DoAExiU5M3xWyL
   nXVWEVjM35PDZB6XWjR3MaG4jTOqGzswuF945qmfjoWhBKU93d9DTq0hL
   VR6bLso7IjTh8XoDmIKqLsth/IDMZvGGJBsxUYYxM2FjaGBXk4M4ORBYK
   DpxJ5fRciuGot7BL3Qbob87csU+N6xbkgSzYvfyOETGflgaxPvAstWv2J
   ZYaQVYZFpM2l9ySuXrrL7Z/jXI+Ctdq4yc3zLK4CB6J/Oam+1W47cjkqb
   /X4W00Xd7JW57tVxAXoB4TXWoeoA2/HjXZ9/EE5erHFqXgA8iQPqCuCPm
   g==;
X-CSE-ConnectionGUID: 0STFgT1IS3qpACA+M40doQ==
X-CSE-MsgGUID: 0JkLpQPOSaCK7WFpEc0+9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="89251199"
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; 
   d="scan'208";a="89251199"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 21:55:13 -0700
X-CSE-ConnectionGUID: 8mzZU7iPTvmxkvQVKVLogw==
X-CSE-MsgGUID: yKcaCWVjRt+mXUrU715LiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; 
   d="scan'208";a="261858269"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by orviesa003.jf.intel.com with ESMTP; 22 Jul 2026 21:55:11 -0700
Date: Thu, 23 Jul 2026 12:55:10 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Michal Simek <michal.simek@amd.com>, panchuang@vivo.com
Cc: Pan Chuang <panchuang@vivo.com>, Moritz Fischer <mdf@kernel.org>,
	Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>,
	"open list:FPGA MANAGER FRAMEWORK" <linux-fpga@vger.kernel.org>,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] fpga: zynq-fpga: Remove redundant dev_err()
Message-ID: <amGerjZAOCySe2c2@yilunxu-OptiPlex-7050>
References: <20260713132237.370272-1-panchuang@vivo.com>
 <701a4078-721c-49a9-90ac-d59697fef82c@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <701a4078-721c-49a9-90ac-d59697fef82c@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_215514_814639_0FA05AF9 
X-CRM114-Status: GOOD (  15.65  )
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

On Mon, Jul 13, 2026 at 03:48:57PM +0200, Michal Simek wrote:
> 
> 
> On 7/13/26 15:22, Pan Chuang wrote:
> > Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> > devm_request_*_irq()"), devm_request_irq() automatically logs
> > detailed error messages on failure. Remove the now-redundant
> > driver-specific dev_err() calls.
> > 
> > Signed-off-by: Pan Chuang <panchuang@vivo.com>
> > ---
> >   drivers/fpga/zynq-fpga.c | 1 -
> >   1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/fpga/zynq-fpga.c b/drivers/fpga/zynq-fpga.c
> > index 9d1d599ef718..2f8ba32e4002 100644
> > --- a/drivers/fpga/zynq-fpga.c
> > +++ b/drivers/fpga/zynq-fpga.c
> > @@ -598,7 +598,6 @@ static int zynq_fpga_probe(struct platform_device *pdev)
> >   	err = devm_request_irq(dev, priv->irq, zynq_fpga_isr, 0, dev_name(dev),
> >   			       priv);
> >   	if (err) {
> > -		dev_err(dev, "unable to request IRQ\n");
> >   		clk_disable_unprepare(priv->clk);
> >   		return err;
> >   	}
> 
> Reviewed-by: Michal Simek <michal.simek@amd.com>

Reviewed-by: Xu Yilun <yilun.xu@intel.com>

Applied to for-next. Thanks for the patch and the review!

