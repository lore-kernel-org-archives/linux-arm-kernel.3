Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4CBEF5866
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 12:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=757qNRO29WvHYHXqSmGZLjhoy3t1e3DBO+JDTph2mhs=; b=FO7/FM4/FyaMLDSHrOrGnKplzZ
	syjAISm4Bhefjw4d9oPto8vv2mdRArQhfZT33I5qe5SbNDpWfSt2ijalv6ZzfwVTSoRsNrfL56VMM
	dSiOX5iBaRakbLjefiH/H+2yfsA6Tq1d8pTp3j4oNrehvsvQiEz/wFtoswkz0zM7HTJ4RxrGKX7sQ
	fn7187aOFnEXjBCqfXmc53PVToSQ8t2UTcPmCrFz7ZqPZ41JnAKRMKKdRKjYz/G3QZTnOWimEs+Mm
	fBbMWGsraC/39HiCfbwmLEv5mzhU5Vr4FUX0MtLtKrsH3BjXQo2bhKlxzgLtzeg7Q4BIP0bk5HsYp
	8sjrojAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzDQn-000000061Tk-1rp1;
	Sun, 08 Mar 2026 12:40:25 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzDQi-000000061TJ-3uPX;
	Sun, 08 Mar 2026 12:40:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772973621; x=1804509621;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zbhtCbttgtMn5lFau9Gez8kwNEMkXCFdMTQtkiSITIg=;
  b=hb4yueSPyYlWGYBtwTx0LsIxTLwv87JI9M75pGPc9KGDBRkHZ7izb3Ew
   HncTQF+AXjyQuWbpJW2LD1SBDw3pSYx+qHHqc5zsmkAXPqQXhynNATlgM
   CS4gtCnfbEni1xiXzvB0KfV5u4prYI4G4nBQemm9PPX6I6CZKz35c6uyE
   KrBimN6eBmtKrrZAMaI4LueJ2bPziZ3h1E4ruWGbrGHB2JA8/ZMqYfyut
   W++09hjQTCPyYcjNhqPycG9Foj8GrFr+ASsd2vAa5o9L0aczs+gqO9WMt
   TV8CiDwx1gwTwN2EPeKKy1Uymhp3JmWahXkJbCyCfjeX+83YQtGW7FCS8
   g==;
X-CSE-ConnectionGUID: S5yPOlcnT7akzWWTFwlqDQ==
X-CSE-MsgGUID: 2Vr1ak37Qr2fJ7LYbKWXIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="61587715"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="61587715"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 05:40:18 -0700
X-CSE-ConnectionGUID: HkapVZWaSWyLtiDRtBE1MA==
X-CSE-MsgGUID: ao7zcG5vSIawFOjqk+EinA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="218685603"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.88])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 05:40:15 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A7C6F121D15;
	Sun, 08 Mar 2026 14:40:45 +0200 (EET)
Date: Sun, 8 Mar 2026 14:40:45 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Dang Huynh <dang.huynh@mainlining.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rockchip: rkcif: Add missing MUST_CONNECT flag to
 pads
Message-ID: <aa1uTfimVo5H05Q7@kekkonen.localdomain>
References: <20260129-rkcif-null-v1-1-90788ec347f5@mainlining.org>
 <9bb4eced-5710-49ac-99cf-fa0b1d1459b1@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9bb4eced-5710-49ac-99cf-fa0b1d1459b1@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_054021_378549_2FAB0CFA 
X-CRM114-Status: GOOD (  15.77  )
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

Hi Michael,

On Fri, Feb 13, 2026 at 09:06:47AM +0100, Michael Riesch wrote:
> Hi Dang,
> 
> Thanks for the patch -- and sorry for the late reply.
> 
> On 1/29/26 08:24, Dang Huynh wrote:
> > The pads missed checks for connected devices which may a null dereference
> > when the stream is enabled.
> > 
> > Unable to handle kernel NULL pointer dereference at virtual address
> > 0000000000000020
> > pc : rkcif_interface_enable_streams+0x48/0xf0
> > lr : rkcif_interface_enable_streams+0x44/0xf0
> > Call trace:
> >  rkcif_interface_enable_streams+0x48/0xf0
> >  v4l2_subdev_enable_streams+0x26c/0x3f0
> >  rkcif_stream_start_streaming+0x140/0x278
> >  vb2_start_streaming+0x74/0x188
> >  vb2_core_streamon+0xe0/0x1d8
> >  vb2_ioctl_streamon+0x60/0xa8
> >  v4l_streamon+0x2c/0x40
> >  __video_do_ioctl+0x34c/0x400
> >  video_usercopy+0x2d0/0x800
> >  video_ioctl2+0x20/0x60
> >  v4l2_ioctl+0x48/0x78
> > 
> > Fixes: 501802e2ad51 ("media: rockchip: rkcif: add abstraction for dma blocks")
> > Fixes: 85411d17bee9 ("media: rockchip: rkcif: add abstraction for interface and crop blocks")
> > Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
> 
> Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Thanks, I added Cc: stable to this one.

-- 
Regards,

Sakari Ailus

