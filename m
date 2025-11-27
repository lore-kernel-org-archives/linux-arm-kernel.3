Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE1DD11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 09:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8EkV1jbNBWAmQNw1yK2vaZj5hvWpPkVJ0DgBMEbfwUQ=; b=vdQ80JHuZzoK6GmSlPlO+JWTDs
	jsFptceZG2gQX1MqeGDjrGk7kJ1+QDwwEkAp8R+rcfV68OKHXd0LlPvYEEJI8PwxfT8g96KvzGgoI
	EcSoNQJIikQ/RIOAjrZykRbzKvUN9AFYHKxn+0B/bYhVnDTI2IZux+lkk57LnmCz4wYZGtTDR2OWw
	3IwZT15Ih72xdYg6Kwa/gMUyBMLxKhW2kd+noRtHPwmRb7OURKz950PZSP01idzqj2IPzJXoAjKPA
	/cKMHlPwY+AZQOPQRmByQETYiS51StDaQVS0vl+3KQ/WH+HQmVgahq9imBPsDK7K4AZFoGo2d9iyM
	vdm1yOMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYJw-0000000GIzT-3fHh;
	Thu, 27 Nov 2025 09:29:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYJt-0000000GIz5-3rEh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 09:29:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A0FA1477;
	Thu, 27 Nov 2025 01:29:37 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 14F563F66E;
	Thu, 27 Nov 2025 01:29:43 -0800 (PST)
Date: Thu, 27 Nov 2025 09:29:42 +0000
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: James Clark <james.clark@linaro.org>,
	Kuan-Wei Chiu <visitorckw@gmail.com>, suzuki.poulose@arm.com,
	alexander.shishkin@linux.intel.com, pratikp@codeaurora.org,
	mathieu.poirier@linaro.org, gregkh@linuxfoundation.org,
	jserv@ccns.ncku.edu.tw, marscheng@google.com, ericchancf@google.com,
	milesjiang@google.com, nickpan@google.com,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: etm3x: Fix buffer overwrite in cntr_val_show()
Message-ID: <20251127092942.GO724103@e132581.arm.com>
References: <20251121002350.1166758-1-visitorckw@gmail.com>
 <20251126120914.GH724103@e132581.arm.com>
 <da2a3e18-80e0-4aca-bbc7-45c1353217d3@linaro.org>
 <20251126123147.GI724103@e132581.arm.com>
 <CAJ9a7VhD2p3qMGXNg6deYjE8myB5euHR4FcAFwgg0KWF2HO9JQ@mail.gmail.com>
 <15d536f2-0829-4f3f-b111-b15b14236bd2@linaro.org>
 <CAJ9a7Vjia4ENewP48nyDWBcBFbDmwb3vM2JNbNCw4-3yF3ABVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7Vjia4ENewP48nyDWBcBFbDmwb3vM2JNbNCw4-3yF3ABVQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_012946_035424_91BDC256 
X-CRM114-Status: GOOD (  20.62  )
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

On Wed, Nov 26, 2025 at 04:14:19PM +0000, Mike Leach wrote:

[...]

> > > The key to this is not the questions we are asked, but which platforms
> > > are still supported by the linux kernel.
> > >
> > > The ETMv3 driver supports both ETMv3 and PTM trace (the programming
> > > model is the same, even if the trace decode is vastly different).
> > >
> > > So as long as there are  platforms supported that use either of those,
> > > we need to keep the driver in.
> > >
> >
> > We're not running tests though, so if we find out it's fundamentally
> > broken somehow it could be another justification to remove it, even if
> > the kernel supports the devices. Do you have a board that you can test
> > on Mike?
> 
> Don't have one myself, but I believe the TC2 was used in development,
> (that's the A15/A7 32 bit part - not total compute!) which somewhat
> conveniently had both etmv3 and ptm trace.

If ETMv4 can be used by Armv7 (arm32) CPUs, and nowdays if Armv7 + ETMv4
is a popular design, it makes sense for me to remove ETMv3 driver.

If Armv7 CPUs are always bound to ETMv3 / PTM, then we should keep the
driver.

Thanks,
Leo

