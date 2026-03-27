Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8E810BA433
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 06:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	Content-Type:Content-Transfer-Encoding:Date:Message-ID:In-Reply-To:CC:To:From
	:Subject:Mime-Version:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XnJA/5zwAPxZ6vMIZJbzIFubHwh+nIkMH+ZqspPFCx0=; b=iBi9q2BVOlEeX4Ulopo3qghxG1
	XIRTlTF7iu7RpsiwGL7mWq7CPm03pZw891YragN3tCFUhswqypyF4VDmMJC0w4YK2+KhFnSCgp6VI
	O79BeGtAdT3gJZO5EWsjmU5FcUTQnM6gcOwuQM6m+Y5KVlyFQwbMHB9f4dO1NfiiyxHSDI4GWk/S6
	/66WCrZgf+sWnsmOf2qafLsVy/Jc9AvPzSlomK3NMn0IEo/lcsk3u4CALBfBO4c1eHe4Z5oY2IA3l
	wibwOEdPyKzWOE5Vk0tcH9OAoW2Qqol/YK4bBUqQt7pJMrSFhMkk4y+tDIZXmQnH2Yn18Ho4rWDRx
	U24JBFrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w60Y7-00000006lqi-3A91;
	Fri, 27 Mar 2026 06:20:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w60Y5-00000006lo3-0ova
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Mar 2026 06:20:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:
	Content-Transfer-Encoding:Date:Message-ID:In-Reply-To:CC:To:From:Sender:
	Reply-To:Subject:Mime-Version:Content-ID:Content-Description;
	bh=XnJA/5zwAPxZ6vMIZJbzIFubHwh+nIkMH+ZqspPFCx0=; b=f7zDVLCoc8m45URLWrOLfUOVLu
	4MM8A6aKydcOgve6yHZBYbngLLDWeMf+4gINlAdqwawA6Irx9t68sAEdwB04b//RBgjJmCKDM7hec
	iQcHJFdZ+OlVSqvNXotlEFA0//w029fFQNNBgF3mBrrC58GIRNiWSWfoXBDGtSPtiwUpiXl2GO4vH
	Lrx9tUttEpU6HGUkOnqGv09JQRk+FGmj+baRTYgrhyXH5wHc/LFSEDPApnT6l68SrGjsVmOKo/ItU
	oGxmw+ly2HK6PDqRcjNgaQtxGBU2DkVB2wcBvo/j4gCjdX9h0vSO0iGHZeWx3ScyYa5MQ9XgaEcRq
	07mUGmJw==;
Received: from mailout3.samsung.com ([203.254.224.33])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w60Xy-00000009kq1-3757
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 06:19:58 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260327061942epoutp0391fef27a3615aba8d5f555c7f7538550~gnl6ZrsIf1758817588epoutp03b
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 06:19:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260327061942epoutp0391fef27a3615aba8d5f555c7f7538550~gnl6ZrsIf1758817588epoutp03b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1774592382;
	bh=XnJA/5zwAPxZ6vMIZJbzIFubHwh+nIkMH+ZqspPFCx0=;
	h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
	b=rUoMx9hoGfks4r+dxmr5olSm/bblUxZcyt4PWgT7YJaBNdPalrNlN0cMvjQol1iJz
	 spAJj3ov5ZFNwm/P1ZcffyGowvWtNOfXs/ZS3bb1XA58vrY5YlcN7fyKFO2w2AyW8V
	 dhigBaDblg2q8IbpIaE8/WEF2q1syAyqZsN+lIxc=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20260327061941epcas2p17e4702f290bbe98e79942dda2d496d8c~gnl557Uoj3148231482epcas2p1K;
	Fri, 27 Mar 2026 06:19:41 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.38.208]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4fhr8Y3HDzz6B9m4; Fri, 27 Mar
	2026 06:19:41 +0000 (GMT)
Mime-Version: 1.0
Subject: Re: [PATCH v5] nvme: Skip trace complete_rq on host path error
From: =?UTF-8?B?7KCE66+87Iud?= <hmi.jeon@samsung.com>
To: Keith Busch <kbusch@kernel.org>, "hch@lst.de" <hch@lst.de>
CC: Justin Tee <justintee8345@gmail.com>, "axboe@kernel.dk"
	<axboe@kernel.dk>, "sven@kernel.org" <sven@kernel.org>, "j@jannau.net"
	<j@jannau.net>, "neal@gompa.dev" <neal@gompa.dev>, "sagi@grimberg.me"
	<sagi@grimberg.me>, "justin.tee@broadcom.com" <justin.tee@broadcom.com>,
	"nareshgottumukkala83@gmail.com" <nareshgottumukkala83@gmail.com>,
	"paul.ely@broadcom.com" <paul.ely@broadcom.com>, James Smart
	<james.smart@broadcom.com>, "kch@nvidia.com" <kch@nvidia.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-nvme@lists.infradead.org"
	<linux-nvme@lists.infradead.org>, "asahi@lists.linux.dev"
	<asahi@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?UTF-8?B?7J207J2A7IiY?=
	<euns212.lee@samsung.com>, =?UTF-8?B?7Lm47LCs?= <joshi.k@samsung.com>,
	=?UTF-8?B?7KCE66+87Iud?= <hmi.jeon@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <acVGECskf5pg3_MY@kbusch-mbp>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20260327061940epcms2p576446826c1c5336a57ec19f433122386@epcms2p5>
Date: Fri, 27 Mar 2026 15:19:40 +0900
X-CMS-MailID: 20260327061940epcms2p576446826c1c5336a57ec19f433122386
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-223,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6
References: <acVGECskf5pg3_MY@kbusch-mbp> <acQxjZMOqj74yIJf@kbusch-mbp>
	<20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p4>
	<945a3e98-ee75-453c-ae80-f3c9e3e57e58@gmail.com>
	<20260325063333epcms2p60954532c1b65a1665bad6dcdcfd7d62c@epcms2p6>
	<CABPRKS8-x6Tfr90inpz1fR0=8a5HD=mkujtfLJ1h9ikEUjTvxg@mail.gmail.com>
	<20260326014429epcms2p135ffd3c2b2fface6423d045e9614c262@epcms2p1>
	<20260326065152epcms2p51a18d3bbecb6eb6dc2ddba09651e5152@epcms2p5>
	<acVCnozG1WKPkq1L@kbusch-mbp> <20260326143124.GA17507@lst.de>
	<CGME20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p5>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_061956_149627_F0B146BE 
X-CRM114-Status: GOOD (  19.08  )
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
Reply-To: hmi.jeon@samsung.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Mar 26, 2026 at 03:43PM +0100, hch@lst.de wrote:
> Yeah, the spec is not very clear on their use. It just defines the codes
> and a one sentence description, and then never mentioned again. I think
> it allows the possibility for the controller to internally complete a
> command with such status from some undefined OOB mechanism. I'm not sure
> why the host needs to have their own self-generated status codes anyway
> since it can already attach whatever arbitrary flags it wants to its
> private data, like how we use NVME_REQ_CANCELLED.
> 
> Anyway if a controller did return it for whatever reason, even if it is
> a bug, we'd want to see it in the trace.


I've confirmed what you discussed, and it seems like the approach you
proposed is a better one.
Can I send patch v7 as above?

Regrad,
Minsik Jeon

