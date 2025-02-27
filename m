Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A22FEC1B087
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pSkiEkBXDYScEZ5ofMG9zWS4tKdrzFrmkGZ34AMFarA=; b=J6fBzc63455Uu3BVEh1WvAL/gq
	xUzEUCCAPpyVu+0IyntDDf2YvIDn/xjnd4eyQhZpnQni7lqSl4FMN96/zDs1zXrQD21vchQNM9RzY
	8PubW1/cGKlzZx3ARI4ubOVd5Hn5csbcOppQCLgrWmKR25dsh+8WES51lJ6wcsYHPBRrFIGFGZq1b
	Yah+ofIC7Ph8FtP/+m8A4ZEfcPLAZHhvGov+gUrJZBi9281rv/YgsG5sWE4FOV5xkM2DLmWUD4dYn
	hgkXySKzGYdxLwgTeSuRTrJEBkPmzO8wnvaDAWWNZCNTjUf/3CvtcP/Vc/Xrw9WYhmPmS+sYmSomD
	HPzWHoIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjl9-00000008bEO-3geB;
	Thu, 27 Feb 2025 19:41:28 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnhoe-00000008EFd-1Ecf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 17:36:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D57C144517;
	Thu, 27 Feb 2025 17:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740677812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pSkiEkBXDYScEZ5ofMG9zWS4tKdrzFrmkGZ34AMFarA=;
	b=DIvKo15afjSNGSOcvCupB0MV/J3WwoCrlldJWszOmh/qtQDfA/7dL5t8NYBJeTk7Dd7vQN
	vQs+JEPAWAg5ux9R8tmZ0xGdcsrPOmqMT9GoqFHIOnOaDaEMvlfLFufaKH0kQahQiCCS30
	mZWUhQkuAdu6cPTv2PCEL1A2NUe9Ux7+Ued0hAFNm+mMsvX786rZPfMFuNkIVTN3YAkCk6
	Z3eze4n9SwXeuv8pUIK2hXAtECFqjLpdW9wRv+Li0ecCaT2K/GkPAVW1CAgIZF4413DC3x
	hfvt3FGGI1ms4pxOirPcPIZZWMPD46L7Oqrm6oSW2OJa1A2Wr277sHHwJCC0Vg==
Date: Thu, 27 Feb 2025 18:36:51 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: William Breathitt Gray <wbg@kernel.org>
Subject: Re: [PATCH v4 0/2] microchip-tcb-capture: Add Capture, Compare,
 Overflow etc. events
Message-ID: <202502271736515748ffda@mail.local>
References: <Z7h0AXV1zlgp9Nw-@ishi>
 <8fb9f188-3065-4fdc-a9f1-152cc5959186@prolan.hu>
 <Z7vihBqOgP3fBUVq@ishi>
 <bfa70e78-3cc3-4295-820b-3925c26135cb@prolan.hu>
 <Z7_xTQeTzD-RH3nH@ishi>
 <20250227135330.GC182392@tpx1.home>
 <Z8B1LDT-n2XTTp8q@ishi>
 <202502271437280a6701d8@mail.local>
 <Z8CA9RTZWChh9cJW@ishi>
 <Z8CKQvRjqH9lwzgO@ishi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8CKQvRjqH9lwzgO@ishi>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekkedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegieduueethefhkeegjeevfefhiedujeeuhffgleejgfejgeekueejuefgheeggfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegukeejvgemudgsudgsmeeltdekgeemtggtfhgtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegukeejvgemudgsudgsmeeltdekgeemtggtfhgtpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopeifsghgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrghmvghlrdgsohhuhhgrrhgrsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheptghsohhkrghsr
 dgsvghntggvsehprhholhgrnhdrhhhupdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqihhiohesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeffhhgrrhhmrgdrueesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopehluhguohhvihgtrdguvghsrhhotghhvghssehmihgtrhhotghhihhprdgtohhm
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_093656_787740_7C27D9CF 
X-CRM114-Status: GOOD (  38.39  )
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
Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>, Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Dharma.B@microchip.com, Ludovic Desroches <ludovic.desroches@microchip.com>, =?iso-8859-1?B?Q3Pza+Fz?= Bence <csokas.bence@prolan.hu>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 28/02/2025 00:52:34+0900, William Breathitt Gray wrote:
> On Fri, Feb 28, 2025 at 12:13:00AM +0900, William Breathitt Gray wrote:
> > On Thu, Feb 27, 2025 at 03:37:28PM +0100, Alexandre Belloni wrote:
> > > On 27/02/2025 23:22:36+0900, William Breathitt Gray wrote:
> > > > Skimming through the driver, it looks like what we'll need is for
> > > > mchp_tc_counts[] to have all three TCCs defined, then have
> > > > mchp_tc_probe() match on a TCB node and configure each TCC. Once that's
> > > > setup, then whenever we need to identify which TCC a callback is
> > > > exposing, we can get it from count->id.
> > > > 
> > > > So for example, the TC_CV register offset is calculated as 0x00 +
> > > > channel * 0x40 + 0x10. In the count_read() callback we can leverage
> > > > count->id to identify the TCC and thus get the respective TC_CV register
> > > > at offset + count->id * 0x40 + 0x10.
> > > > 
> > > 
> > > We can't do that because the TCC of a single TCB can have a mix of
> > > different features. I struggled with the breakage to move away from the
> > > one TCB, one feature state we had.
> > > Be fore this, it was not possible to mix features on a single TCB, now,
> > > we can have e.g. the clocksource on TCC 0 and 1 of TCB0 and a PWM on
> > > TCC 2. mchp_tc_probe must not match on a TCB node...
> > 
> > Okay I see what you mean, if we match on a TCB mode then we wouldn't be
> > able to define the cases where one TCC is different from the next in the
> > same TCB.
> > 
> > The goal however isn't to support all functionality (i.e. PWM-related
> > settings, etc.) in the counter driver, but just expose the TCB
> > configuration options that affect the TCCs when configured for counter
> > mode. For example, the sysfs attributes can be created, but they don't
> > have to be available until the TCC is in the appropriate mode (e.g.
> > return -EBUSY until they are in a counter mode).
> > 
> > Is there a way to achieve that? Maybe there's a way we can populate the
> > sysfs tree on the first encountered TCC, and then somehow indicate when
> > additional TCCs match. Attributes can become available then dynamically
> > based on the TCCs that match.
> > 
> > William Breathitt Gray
> 
> Sorry, let me step back for a moment because maybe I'm trying to solve
> a problem that might not actually be a problem.
> 
> I see functionality settings available in the TC Block Mode Register
> (BMR) that can affect multiple TCCs at a time. Are these BMR settings
> exposed already to users in someway? If not, do we have a way to
> introduce these settings if someone wants them; e.g. would the
> AutoCorrection function enable bit be exposed as a sysfs attribute, or
> configured in the devicetree?

BMR is already available and used by the individual drivers. The current
microchip-tcb-capture already uses it to enable qdec mode.
timer-atmel-tcb uses it to chain timers.

Note that we already have a driver for the pwm function too in
drivers/pwm/pwm-atmel-tcb.c. In fact all the other TCB drivers predate
the microchip-tcb-capture driver.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

