Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93E2C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 11:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/dFYrb2sW0Ny4BYm+P6FPy8/gogBw8ybwCYFPW/5Wfc=; b=LJ8E5v1fPzdn0qeTLPqb28ZGiC
	VR3x1erLQHLPaqM4htCdbBCPQRsLJeBbUHo47mTXuTMYXnVeJobh9iwkuBJwL9am+CEQWGR6fiHu0
	yhvUA4CgJZgrz0d0VYzZKR2f7+G6bI2pTzhe1XX3E2RNicE9TQzGqVYv+IimvDaSZvvjrs0kKt68n
	p271QgmkIjTNGEB76v8jiVL0yCt8EyBkmbjZ1PG8fvfxPQ6JNWkqVzVdjb91BV8ONtqjjR7vf2gBI
	JoNKyJHpf3HehFefW7nbvWWhyVSq6v380yU24rtRKmyVpcnIiT0AynpegDFx+A4YCENfrL8DIIqq1
	lkVS0tIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9KE-0000000Alsu-0kEY;
	Thu, 06 Mar 2025 11:23:38 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq96f-0000000AjnU-3HHB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 11:09:38 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-390eb06d920so483508f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 03:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741259376; x=1741864176; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/dFYrb2sW0Ny4BYm+P6FPy8/gogBw8ybwCYFPW/5Wfc=;
        b=0n7C90wQRIhzuKkozswXF9RLnYbprZFhBfPCO9niutTfut9is+DsGhUjsl8U5VkMkL
         9M4EHQ5Lia2Afod3dM8LxcmA7l3aLyDeR40XM8eB6uVozCzVr/FOkHfZoeMJ/nFJaWhP
         TJJTOE1fK3rzPkmhg3YdvE6MxNwQ29YazC2b6BTfLVahjqAJViAQYW3OF7tjSHFeEXPs
         hOR+3VMxPmibIVK4UZki9/Uv7RnzQvTSdyfqUypAFLU44GeYO+24x4kNb64/JL6h4Hss
         LIEfl/PFdgojOu+l7KsR3p0yoLSIv1yCCR5gomKcE1cq/E3ha4cAEoNZoZWUFv77PH3c
         66GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741259376; x=1741864176;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/dFYrb2sW0Ny4BYm+P6FPy8/gogBw8ybwCYFPW/5Wfc=;
        b=HISi9Edn4NGBCHnIXpZzbqT4C15frkJE2yxb/xtvPrMRyADQnMM3/mHSIw0VWssKpn
         2+JZCpOCKrYiuqkf4SVhsN0w1fRmF8VaJOPy197GvLfI4BpFxugwKxZPS3jnSV1tj8+B
         qnSOI+wsZwvWLpL4y/b5C8SkmGGn4dQOCJVlKbyw0fTcZeek5ZsK81rHtzpxijWe79Wg
         rwnACOJI2skEC9yhzyIO6xJNgptWHHiz1eyCw+XHqtKGK/G2WcN1RAbO1bmIwg1tc8mb
         3h+SrBgZE+WuHNn78FJakBSFqv1xURlzKvxHbtylPYg+Ewq9T9R9CZpbWxOjfsiy0DXZ
         j2fA==
X-Forwarded-Encrypted: i=1; AJvYcCUEHEW8nawi0Wr/N/Xap8vugIaHGgyd9ElKQAd5zxn7noe9lbYUK6IbOfFkJeu2/+x6cvpjocWPdUcLwMxXp3h2@lists.infradead.org
X-Gm-Message-State: AOJu0Yxb+vmLnaeGo/Vzhikv/ocX1ETSDMVSRcBjVEZAEGttzjZp1U6Z
	uhr2CZIDzadr5lAypjCqMH5s/3hovG/8DKBqhlhL9OMMM/j11IZVCz3cycA0vuMf9hlBMF57s+5
	9uhwEYGG12v6FGQ==
X-Google-Smtp-Source: AGHT+IGQlRF5ezfZt1wPiVd1C9EMKt6NF+Jo3FrWA4EBhp3pS1use0qAKsHwAt88E/Nw+wGskfdJ4hSuXHpuJoA=
X-Received: from wrbef7.prod.google.com ([2002:a05:6000:2187:b0:38f:451d:8e9b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:47a4:0:b0:391:1473:2a08 with SMTP id ffacd0b85a97d-3911f724cd6mr5943042f8f.7.1741259375699;
 Thu, 06 Mar 2025 03:09:35 -0800 (PST)
Date: Thu, 6 Mar 2025 11:09:33 +0000
In-Reply-To: <Z8iFeEWq16pNQdMa@pluto>
Mime-Version: 1.0
References: <Z8g8vhS9rqQ_ez48@google.com> <Z8iFeEWq16pNQdMa@pluto>
Message-ID: <Z8mCbc2Z2QGd3f8M@google.com>
Subject: Re: [Bug report] Memory leak in scmi_device_create
From: Alice Ryhl <aliceryhl@google.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_030937_826017_47926EE5 
X-CRM114-Status: GOOD (  28.52  )
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

On Wed, Mar 05, 2025 at 05:10:16PM +0000, Cristian Marussi wrote:
> On Wed, Mar 05, 2025 at 11:59:58AM +0000, Alice Ryhl wrote:
> > Dear SYSTEM CONTROL & POWER/MANAGEMENT INTERFACE (SCPI/SCMI) Message
> > Protocol drivers maintainers,
> > 
> > I flashed a v6.13-rc3 kernel onto a Rock5B board and noticed the
> > following output in my terminal:
> > 
> > [  687.694465] kmemleak: 4 new suspected memory leaks (see /sys/kernel/debug/kmemleak)
> > 
> > It seems that there is a memory leak for devices created with
> > scmi_device_create.
> > 
> `
> Hi Alice,
> 
> thanks for this report.
> 
> > This was with a kernel running v6.13-rc3, but as far as I can tell, no
> > relevant changes have landed since v6.13-rc3. My tree *does* include
> > commit 295416091e44 ("firmware: arm_scmi: Fix slab-use-after-free in
> > scmi_bus_notifier()"). I've only seen this kmemleak report once, so it's
> > not happening consistently.
> > 
> > See below for the full kmemleak report.
> > 
> > Alice
> > 
> > $ sudo cat /sys/kernel/debug/kmemleak
> > unreferenced object 0xffffff8106c86000 (size 2048):
> >   comm "swapper/0", pid 1, jiffies 4294893094
> >   hex dump (first 32 bytes):
> >     02 00 00 00 10 00 00 00 c0 01 bc 03 81 ff ff ff  ................
> >     60 67 ba 03 81 ff ff ff 18 60 c8 06 81 ff ff ff  `g.......`......
> >   backtrace (crc feae9680):
> >     [<00000000197aa008>] kmemleak_alloc+0x34/0xa0
> >     [<0000000056fe02c9>] __kmalloc_cache_noprof+0x1e0/0x450
> >     [<00000000a8b3dfe1>] __scmi_device_create+0xb4/0x2b4
> >     [<000000008714917b>] scmi_device_create+0x40/0x194
> >     [<000000001818f3cf>] scmi_chan_setup+0x144/0x3b8
> >     [<00000000970bad38>] scmi_probe+0x584/0xa78
> >     [<000000002600d2fd>] platform_probe+0xbc/0xf0
> >     [<00000000f6f556b4>] really_probe+0x1b8/0x520
> >     [<00000000eed93d59>] __driver_probe_device+0xe0/0x1d8
> >     [<00000000d613b754>] driver_probe_device+0x6c/0x208
> >     [<00000000187a9170>] __driver_attach+0x168/0x328
> >     [<00000000e3ff1834>] bus_for_each_dev+0x14c/0x178
> >     [<00000000984a3176>] driver_attach+0x34/0x44
> >     [<00000000fc35bf2a>] bus_add_driver+0x1bc/0x358
> >     [<00000000747fce19>] driver_register+0xc0/0x1a0
> >     [<0000000081cb8754>] __platform_driver_register+0x40/0x50
> > unreferenced object 0xffffff8103bc01c0 (size 32):
> 
> I could not reproduce on my setup, even though I run a system with
> all the existent SCMI protocols (and related drivers) enabled (and
> so a lot of device creations) and a downstream test driver that causes
> even more SCMI devices to be created/destroyed at load/unload.
> 
> Coming down the path from scmi_chan_setup(), it seems something around
> transport devices creation, but it is not obvious to me where the leak
> could hide....
> 
> ...any particular setup on your side ? ...using LKMs, loading/unloading,
> any usage pattern that could help me reproduce ?

I looked into this a bit more, and actually it does happen consistently.
It's just that kmemleak doesn't report it until 10 minutes after
booting, so I did not notice it.

As for my setup, well, I boot the kernel over pxe and the rootfs is
mounted over NFSv4. The memory leak happens even if I don't do anything
at all - I just boot and wait. The device is a Radxa Rock5B.

Not sure what other information there is to give.

I tried again with v6.14-rc5, and I still got the leak:

user@rk3588-ci:~$ sudo cat /sys/kernel/debug/kmemleak
unreferenced object 0xffffff81068c0000 (size 2048):
  comm "swapper/0", pid 1, jiffies 4294893128
  hex dump (first 32 bytes):
    02 00 00 00 10 00 00 00 40 a3 7a 03 81 ff ff ff  ........@.z.....
    60 c8 79 03 81 ff ff ff 18 00 8c 06 81 ff ff ff  `.y.............
  backtrace (crc 60df30fb):
    kmemleak_alloc+0x34/0xa0
    __kmalloc_cache_noprof+0x1e0/0x450
    __scmi_device_create+0xb4/0x2b4
    scmi_device_create+0x40/0x194
    scmi_chan_setup+0x144/0x3b8
    scmi_probe+0x51c/0x9fc
    platform_probe+0xbc/0xf0
    really_probe+0x1b8/0x520
    __driver_probe_device+0xe0/0x1d8
    driver_probe_device+0x6c/0x208
    __driver_attach+0x168/0x328
    bus_for_each_dev+0x14c/0x178
    driver_attach+0x34/0x44
    bus_add_driver+0x1bc/0x358
    driver_register+0xc0/0x1a0
    __platform_driver_register+0x40/0x50
unreferenced object 0xffffff81037aa340 (size 32):
  comm "swapper/0", pid 1, jiffies 4294893128
  hex dump (first 32 bytes):
    5f 5f 73 63 6d 69 5f 74 72 61 6e 73 70 6f 72 74  __scmi_transport
    5f 64 65 76 69 63 65 5f 72 78 5f 31 30 00 ff ff  _device_rx_10...
  backtrace (crc 8dab7ca7):
    kmemleak_alloc+0x34/0xa0
    __kmalloc_node_track_caller_noprof+0x234/0x528
    kstrdup+0x48/0x80
    kstrdup_const+0x30/0x3c
    __scmi_device_create+0xd4/0x2b4
    scmi_device_create+0x40/0x194
    scmi_chan_setup+0x144/0x3b8
    scmi_probe+0x51c/0x9fc
    platform_probe+0xbc/0xf0
    really_probe+0x1b8/0x520
    __driver_probe_device+0xe0/0x1d8
    driver_probe_device+0x6c/0x208
    __driver_attach+0x168/0x328
    bus_for_each_dev+0x14c/0x178
    driver_attach+0x34/0x44
    bus_add_driver+0x1bc/0x358
unreferenced object 0xffffff810379c860 (size 16):
  comm "swapper/0", pid 1, jiffies 4294893128
  hex dump (first 16 bytes):
    73 63 6d 69 5f 64 65 76 2e 32 00 03 81 ff ff ff  scmi_dev.2......
  backtrace (crc ccc21b9a):
    kmemleak_alloc+0x34/0xa0
    __kmalloc_node_track_caller_noprof+0x234/0x528
    kvasprintf+0x90/0x11c
    kvasprintf_const+0x98/0x138
    kobject_set_name_vargs+0x68/0x104
    dev_set_name+0x6c/0x98
    __scmi_device_create+0x17c/0x2b4
    scmi_device_create+0x40/0x194
    scmi_chan_setup+0x144/0x3b8
    scmi_probe+0x51c/0x9fc
    platform_probe+0xbc/0xf0
    really_probe+0x1b8/0x520
    __driver_probe_device+0xe0/0x1d8
    driver_probe_device+0x6c/0x208
    __driver_attach+0x168/0x328
    bus_for_each_dev+0x14c/0x178
unreferenced object 0xffffff8105be7400 (size 512):
  comm "swapper/0", pid 1, jiffies 4294893128
  hex dump (first 32 bytes):
    00 00 00 00 ad 4e ad de ff ff ff ff 00 00 00 00  .....N..........
    ff ff ff ff ff ff ff ff c0 b4 f0 83 c0 ff ff ff  ................
  backtrace (crc 7b92a969):
    kmemleak_alloc+0x34/0xa0
    __kmalloc_cache_noprof+0x1e0/0x450
    device_add+0x54/0x570
    device_register+0x20/0x30
    __scmi_device_create+0x184/0x2b4
    scmi_device_create+0x40/0x194
    scmi_chan_setup+0x144/0x3b8
    scmi_probe+0x51c/0x9fc
    platform_probe+0xbc/0xf0
    really_probe+0x1b8/0x520
    __driver_probe_device+0xe0/0x1d8
    driver_probe_device+0x6c/0x208
    __driver_attach+0x168/0x328
    bus_for_each_dev+0x14c/0x178
    driver_attach+0x34/0x44
    bus_add_driver+0x1bc/0x358

