Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0145BC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 13:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XjvY8QE+WfjDEBedvFnnwEvqcwGNoef7rD13NkLbjhw=; b=29Wz9Hq7Ib18uES7wVnjY5tBS1
	rI9PrlwDtzlaXI2VIK39k/qsuoz6Ttc2dzlquuWsLw5m3LfRAHVKaqIW6SOt0/NeJKs3VPOZr9x7O
	MMPPj7BPw/qwLUh9GokRQnSw2JbISH3LdbvHErSe0reQQ0LpKfPnZo0vttkc9GiwRrEAC0fipgaBj
	Yjjlw2OaGhdJtTBq29A8JXhUe2zzq4jYV7Ab9C0cmK/GnN/ZBnV6Qb2zOVpE3MsO9/UUZkpRsJuFH
	q5y8JneHWqeU25Ev6G3uUg/+KvKwNeS6f3HRa/tPh6uADvgvyTPaodaTiex76qY3svf9at41hLAKc
	1hML7tRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqBMX-0000000B4Le-1cee;
	Thu, 06 Mar 2025 13:34:09 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqBEA-0000000B3Qz-1Bvx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 13:25:31 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43bbbb00891so2667175e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 05:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741267528; x=1741872328; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XjvY8QE+WfjDEBedvFnnwEvqcwGNoef7rD13NkLbjhw=;
        b=xkedvXlNx3vsAd3utFRJBcyXkb5oQL+cMFtE99MGZNUhK/tfbrKJiLOnqVQ/gy9uzM
         6Cf0uK/ytA9/voY7GMKgTXTSQ7cWQmZ2Bt2Ltfww0YNQhAREPeMIuqlLtMgAJn5cefXa
         +CREUX26nVg0/ZJLAnc6T3+8vK3H/6ffiyi2qsenzq49HUzkgGpkmYdU1JWsQUwXgl/W
         qI2TENCNTTtu+m8rANzy/tddhA0HLllYmP2f0eSYJBv/6lmF7SvMYgel3/UPi5GxrQbO
         S3+AvjlzZNUUSDAzBdpTMjpW5uOzAp0Q44YHLZneTqbA2SOa3geiX8sHhdDx7RJxNZ4Z
         0Kkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741267528; x=1741872328;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XjvY8QE+WfjDEBedvFnnwEvqcwGNoef7rD13NkLbjhw=;
        b=Hb8c8mS3lTsogxVhDz/CLn3axp98n50Q+bv+wX4lEroI99mJeP/bb0C40Py1o4d2sr
         3CeNeWrB8bzsBxz9fHeTe5AEH8RTbe6/jYI4WVUO58wHlFOyQoRgSL6ymf5FutbAZ17P
         aKxdNYI0CCM006QO7lmvxua5GlH45r6jMYsPHGf/qEVFo9K0cxQb+JBzBZ1e4t8E2FN5
         T667fauvvsP4vvvoYvxCAp8ecyMTqlkqIRHG2BUVkLt4IJfI4Ya/xBPtpF0Du4ISImGE
         bgc+uBpdEj0BZKXA4YNFY0b3QwSehvgHZyUEFsui2ftj7YWqhcP2ZxawzL1NjBtuibLI
         Bz4A==
X-Forwarded-Encrypted: i=1; AJvYcCVulxjmgXdPkgYMUS1/BORY0XMkAnapZ8BfTYhCqMLqQo6MDGxQ12W5RPiqamyTJmQeJHl55ieZfNZ8/peB9lJt@lists.infradead.org
X-Gm-Message-State: AOJu0YxoF8pAr5JP5HqUJcykSJwhn25RAY6ST5Jcv0CBWdRmg5zwTu8j
	Uzv5rA5wcQZeSTEuf0ovCQIx1il9MjjQRIK1JVawmIXyQOhNzRaUZ60W7gCjM5VvOeYjG3jaqOX
	jbe26JnDVakHDNA==
X-Google-Smtp-Source: AGHT+IGu6TNRJ9xsT+tbNha9i/40T4DWFVb5ajxHxFzrjaRSighLgqQn9S9T5+RQz5NbxV86JeMfKntspt/d6/4=
X-Received: from wmrn30.prod.google.com ([2002:a05:600c:501e:b0:43b:d157:3b9e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4447:b0:43b:c0fa:f9e4 with SMTP id 5b1f17b1804b1-43bd29589fcmr52982055e9.13.1741267527969;
 Thu, 06 Mar 2025 05:25:27 -0800 (PST)
Date: Thu, 6 Mar 2025 13:25:25 +0000
In-Reply-To: <Z8maCX5QJRqODl6u@pluto>
Mime-Version: 1.0
References: <Z8g8vhS9rqQ_ez48@google.com> <Z8iFeEWq16pNQdMa@pluto>
 <Z8mCbc2Z2QGd3f8M@google.com> <Z8maCX5QJRqODl6u@pluto>
Message-ID: <Z8miRewURwdvU36h@google.com>
Subject: Re: [Bug report] Memory leak in scmi_device_create
From: Alice Ryhl <aliceryhl@google.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_052530_340825_A1FE72D0 
X-CRM114-Status: GOOD (  36.31  )
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

On Thu, Mar 06, 2025 at 12:50:17PM +0000, Cristian Marussi wrote:
> On Thu, Mar 06, 2025 at 11:09:33AM +0000, Alice Ryhl wrote:
> > On Wed, Mar 05, 2025 at 05:10:16PM +0000, Cristian Marussi wrote:
> > > On Wed, Mar 05, 2025 at 11:59:58AM +0000, Alice Ryhl wrote:
> > > > Dear SYSTEM CONTROL & POWER/MANAGEMENT INTERFACE (SCPI/SCMI) Message
> > > > Protocol drivers maintainers,
> > > > 
> > > > I flashed a v6.13-rc3 kernel onto a Rock5B board and noticed the
> > > > following output in my terminal:
> > > > 
> > > > [  687.694465] kmemleak: 4 new suspected memory leaks (see /sys/kernel/debug/kmemleak)
> > > > 
> > > > It seems that there is a memory leak for devices created with
> > > > scmi_device_create.
> > > > 
> > > `
> > > Hi Alice,
> > > 
> > > thanks for this report.
> > > 
> > > > This was with a kernel running v6.13-rc3, but as far as I can tell, no
> > > > relevant changes have landed since v6.13-rc3. My tree *does* include
> > > > commit 295416091e44 ("firmware: arm_scmi: Fix slab-use-after-free in
> > > > scmi_bus_notifier()"). I've only seen this kmemleak report once, so it's
> > > > not happening consistently.
> > > > 
> > > > See below for the full kmemleak report.
> > > > 
> > > > Alice
> > > > 
> > > > $ sudo cat /sys/kernel/debug/kmemleak
> > > > unreferenced object 0xffffff8106c86000 (size 2048):
> > > >   comm "swapper/0", pid 1, jiffies 4294893094
> > > >   hex dump (first 32 bytes):
> > > >     02 00 00 00 10 00 00 00 c0 01 bc 03 81 ff ff ff  ................
> > > >     60 67 ba 03 81 ff ff ff 18 60 c8 06 81 ff ff ff  `g.......`......
> > > >   backtrace (crc feae9680):
> > > >     [<00000000197aa008>] kmemleak_alloc+0x34/0xa0
> > > >     [<0000000056fe02c9>] __kmalloc_cache_noprof+0x1e0/0x450
> > > >     [<00000000a8b3dfe1>] __scmi_device_create+0xb4/0x2b4
> > > >     [<000000008714917b>] scmi_device_create+0x40/0x194
> > > >     [<000000001818f3cf>] scmi_chan_setup+0x144/0x3b8
> > > >     [<00000000970bad38>] scmi_probe+0x584/0xa78
> > > >     [<000000002600d2fd>] platform_probe+0xbc/0xf0
> > > >     [<00000000f6f556b4>] really_probe+0x1b8/0x520
> > > >     [<00000000eed93d59>] __driver_probe_device+0xe0/0x1d8
> > > >     [<00000000d613b754>] driver_probe_device+0x6c/0x208
> > > >     [<00000000187a9170>] __driver_attach+0x168/0x328
> > > >     [<00000000e3ff1834>] bus_for_each_dev+0x14c/0x178
> > > >     [<00000000984a3176>] driver_attach+0x34/0x44
> > > >     [<00000000fc35bf2a>] bus_add_driver+0x1bc/0x358
> > > >     [<00000000747fce19>] driver_register+0xc0/0x1a0
> > > >     [<0000000081cb8754>] __platform_driver_register+0x40/0x50
> > > > unreferenced object 0xffffff8103bc01c0 (size 32):
> > > 
> > > I could not reproduce on my setup, even though I run a system with
> > > all the existent SCMI protocols (and related drivers) enabled (and
> > > so a lot of device creations) and a downstream test driver that causes
> > > even more SCMI devices to be created/destroyed at load/unload.
> > > 
> > > Coming down the path from scmi_chan_setup(), it seems something around
> > > transport devices creation, but it is not obvious to me where the leak
> > > could hide....
> > > 
> > > ...any particular setup on your side ? ...using LKMs, loading/unloading,
> > > any usage pattern that could help me reproduce ?
> > 
> > I looked into this a bit more, and actually it does happen consistently.
> > It's just that kmemleak doesn't report it until 10 minutes after
> > booting, so I did not notice it.
> > 
> > As for my setup, well, I boot the kernel over pxe and the rootfs is
> > mounted over NFSv4. The memory leak happens even if I don't do anything
> > at all - I just boot and wait. The device is a Radxa Rock5B.
> > 
> > Not sure what other information there is to give.
> > 
> 
> My question as stated above was mainly to understand if the SCMI stack
> was built-in or compiled as loadable modules (lsmod|grep -i scmi)...
> ...I am just to try to pin down a possible 'more-vulnerable' configuration..
> ..I could not see any report even triggering a kmemleak scan on v6.14-rc5
> BUT I only tested with a fully built-in SCMI stack indeed as of now...so
> the question.
> 
> > I tried again with v6.14-rc5, and I still got the leak:
> 
> Ok...thanks I will investigate with different configs.

Here is the config I used:
https://gist.github.com/Darksonn/ecd31a0512f43f7e74a30ab83ff2196f

Alice

