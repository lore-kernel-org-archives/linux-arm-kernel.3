Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA2E10BA430
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 06:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	Content-Type:Content-Transfer-Encoding:Date:Message-ID:In-Reply-To:CC:To:From
	:Subject:Mime-Version:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1+O6aNFLjR2fJGkRkFMDHHc6Xd1lom5HjfhLE8xyfdk=; b=lVVOZADFKTD8R/Dyts16+Z6Fg0
	k07RyRPo4PcOB62F9xfBJfOHWYm0S8OwUsqH/zKB+Uhw+pYO9WeWbiiDbG53zjkQUhP/6fYfOT2aR
	E0DrYYgis3l8Q0HGrnsbBBXcDwOHxuAVR+CJ57YWJLSgHkWFXqU54e8QiiNZnhN8P158SkxdZ3Ile
	j9NSjVYTJeAp5biF0k8/RUNnf0grAJbVw9+YVWtEIxjsj/yO4ySsisUg92uLg33pGBLyNh/KG/lnx
	NEdPcCOdlWrfO7dTJA89piN0iqV1d1wM5t+El1ux5UM8JLhaoNQx9kbnbYjJp44gAmOgb4SjvAMxy
	I7EERKDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w60p6-00000006pcP-0cJv;
	Fri, 27 Mar 2026 06:37:36 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w60p1-00000006pax-3MQJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 06:37:34 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260327063722epoutp044b2e4c699018bd38b590fe3dc46c9745~gn1VUsFzC1757517575epoutp04F
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 06:37:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260327063722epoutp044b2e4c699018bd38b590fe3dc46c9745~gn1VUsFzC1757517575epoutp04F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1774593442;
	bh=1+O6aNFLjR2fJGkRkFMDHHc6Xd1lom5HjfhLE8xyfdk=;
	h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
	b=K5oZfykvxGQYKRUaqowjfHzqKh454SqP8PZTsCS8db/DUZ402z4wQCglIdPwTHBfI
	 FK+dN6YUkt2m7DQlbznP/TDIGQNvcxYAlHAI9hn8sEKBziC4Yl8WU+Y5CSGRca81wa
	 3CkQrZCrHbN9MiBEWBm98SOcbTvECGaRuidS6PeI=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20260327063721epcas2p2c4f0a625266a14058ef94d5c52416784~gn1UtWWrK0303903039epcas2p2g;
	Fri, 27 Mar 2026 06:37:21 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.38.210]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4fhrXw6mQNz6B9mD; Fri, 27 Mar
	2026 06:37:20 +0000 (GMT)
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
Message-ID: <20260327063720epcms2p43a46a694d9cda121cc804bfa2bab8d59@epcms2p4>
Date: Fri, 27 Mar 2026 15:37:20 +0900
X-CMS-MailID: 20260327063720epcms2p43a46a694d9cda121cc804bfa2bab8d59
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
	<CGME20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_233733_312826_A75FF695 
X-CRM114-Status: GOOD (  19.81  )
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

On Thu, Mar 26, 2026 at 08:43 -0600, Keith Busch wrote:
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

Sorry, The date is wrong, so I send it again.
On Thu, Mar 26, 2026 at 08:43 -0600, hch@lst.de wrote:
-> On Thu, Mar 26, 2026 at 14:43PM UTC, Keith Busch wrote:

I've confirmed what you discussed, and it seems like the approach you
proposed is a better one.
Can I send patch v7 as above?


Regards,
Minsik Jeon

