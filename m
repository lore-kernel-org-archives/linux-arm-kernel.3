Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C25EB7EA1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 08:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1F70gqq+I/R3vfvEbag3BV7G6giBsrWU60bsrhlpfOk=; b=VCaK7F4OybzU2kog+k/U2SFy0o
	GvjZwPHHXvg9JVceVDV74CKQtdtu8F978T1scyd8YbzYWfSDeTULi6MFWMz5+xnL3B3O5eaW94gqH
	GIlu5PMMS2wlLfOmiYsas1lGXVra6OXfSW1vPiAh0Y7OQKCoUAfmDpKVrtmjXYZI9F29Yu/VWdue4
	Z8unmG8JVxmS0qk82Hwv0V1oHCJgCCKllgk0edODKFiJzetb926/ZydLcFtBxZsfU7TTNmHC8T8MZ
	0RVThOWDr5iWmRbzba6XOQ2sgganaGtOx9FLMZUXqMAYEN9U+rcDcwGMMIU2UkVm+DqZnRBzF6NvU
	UfxvurTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhi3-0000000Gl0C-2eEF;
	Wed, 04 Mar 2026 08:35:59 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhi0-0000000GkzQ-3oLU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 08:35:58 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-c737d3a51bdso122701a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 00:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772613356; x=1773218156; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1F70gqq+I/R3vfvEbag3BV7G6giBsrWU60bsrhlpfOk=;
        b=GWDGY8P71HnWU4mUAulOiz6MKnaGCaQ1sZUDN14qHWeSQ3JeX7Udqi3j1VdLklypFM
         IzGMW8drpp/M2zUah7jMi65V8P1HWlz6jWAIDRDwLaaFguN+8MfQOpm27p9l+Us+gvdQ
         FDuPEdkIzHKXWVUeFMVT+pOoYcTczsD13vWZYWA1u/5BngojQsiwOdhDRislaRTgPAA1
         2i7lkSShBAo7hFCsypm+xRkF2G4/hBxFvvEnTIYEfNGAtArc+SVDjbLVgFM0nomERM9c
         mOOgpYGps0PSd/Z4lOAgtzdwWLK91XCZAoGLyeTkBLB4dAdMv5Xjx92bAJVGawX1PqJY
         07jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772613356; x=1773218156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1F70gqq+I/R3vfvEbag3BV7G6giBsrWU60bsrhlpfOk=;
        b=h+HW3JPE/JedsXRa2VxDwU30ZPz50J7SLcjaFKCRQgelF8dZwCgrBZHVXc46BgUHYl
         AxscR4qYdDUPSiP9KJPwwtIKfzaPsu/Br/59dn+l7/3eEXz3mjLGEru21oT/CE/DzjkY
         94oACyl+b/iyAI6VVvQsCTcWNoqb0BshxdBQMla1ktCiQIXbBQJGuXeNpS3I9aLlcKu3
         Ucyw2hMDbLclxEHQGVIxtsfpT2nkoZNrx6dZRV7ycjbpR0oFP27GIPKkI1xpH0/NNkIO
         UguVReYlhc/bvnzyHXhOtAJZeWirF+TGLYSPZICldT/AAUUPlhZJZ4SrVhH99+4QXm+8
         Xwwg==
X-Forwarded-Encrypted: i=1; AJvYcCV54OEgsVS3016YKKo4RiVt4aukFAeDh5SUQO78HPXGQs8bcLqpgKAcncmiIe/jfG0wcOkIuuzhD5RaTpBR3voq@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1lCHiwjv9+qiBsWMnIw6kYiGY/ffIXVexGUOUaXfYy/YIAbK0
	3XR1xfqypb/bxjKLcihrSCmGXPMrilXZONm14OxN+ST7gSKrfhFGgxM6
X-Gm-Gg: ATEYQzxWLY2nBVx+52Pkhwo1I5blhgu153CPKTHnYKY43qdS+6udV+kV1AvNua3mNTL
	hpGHRANRX6P24w5Lq2uxAUKDuZU2N/yjDZjBmoLb24Ad5hWPKkkBv0IVGb5pH99O1nujxfRA/yh
	4x3uXWbQbNilF5YZjPe2AB9wXLZr+FIwsZ+XaqAwzO6jDzXvqS1Bqt5rPH7S+yUk73xRbJuwBiB
	MdXwBq9cS79ygnBT7X4ASA/IdW9ZD9Z4bgO7cwvG6ewTJoYmkFzWrLu/rp686n3NCguvgZ7VOhg
	rEqYAoD4bI+EGTYUwlkiKx5pfEyOHTyHAzg0DOyrRLSfhXrIvv2o5GX7ubRKwrJVbd8VVzTLr90
	mGTUXj3E5/kiIjV/vPgyjI2AE8ph2tU3VwhYzb790pZ/5nfMyvkKnV+e9NQvJmSbIdUxkGi9VMV
	7mR25U++84yiKGq5VA35+voWs=
X-Received: by 2002:a17:903:3bc7:b0:2ad:b22f:c697 with SMTP id d9443c01a7336-2ae6aa06ec0mr14432465ad.19.1772613355649;
        Wed, 04 Mar 2026 00:35:55 -0800 (PST)
Received: from bsp.. ([2401:4900:1b90:2d8b:ea7c:4506:5697:f9c8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae3e4e34fesm120624245ad.28.2026.03.04.00.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 00:35:55 -0800 (PST)
From: Rahul Navale <rahulnavale04@gmail.com>
To: Folker Schwesinger <dev@folker-schwesinger.de>
Cc: Rahul Navale <rahul.navale@ifm.com>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	michal.simek@amd.com,
	suraj.gupta2@amd.com,
	thomas.gessler@brueckmann-gmbh.de,
	radhey.shyam.pandey@amd.com,
	tomi.valkeinen@ideasonboard.com,
	rahulnavale04@gmail.com,
	marex@nabladev.com,
	marex@denx.de
Subject: Re: [RFC PATCH] dmaengine: xilinx_dma: Fix per-channel direction reporting via device_caps
Date: Wed,  4 Mar 2026 14:05:41 +0530
Message-ID: <20260304083544.4678-1-rahulnavale04@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
References: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_003556_979490_AE2D558B 
X-CRM114-Status: UNSURE (   9.01  )
X-CRM114-Notice: Please train this message.
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

From: Rahul Navale <rahul.navale@ifm.com>

Hi Folker,

Thanks — I followed your suggested debugging steps.

>For the next debugging step I suggest that we focus on (2) but also on
>getting some insight into the callers. Could you please reapply
>7e01511443c3, keep the RFC patch in place and additionally apply the
>below patch? 

>This will exercise your bad case, print the differences for caps, and
>also print the call stacks for all calls to dma_get_slave_caps().

I have applied 7e01511443c3, kept RFC patch(xilinx_dma_device_caps + printk)
and dmaengine.c debug patch applied (dma_slave_caps_printk() + dump_stack())

Observation: Issue still persists. cyclic playback fails after the first buffer period.
logs:
root@pdm3:~# dmesg | grep xilinx_dma_device_caps
[    0.302398] xilinx_dma_device_caps: caps->directions = 0x00000001
[    0.302401] xilinx_dma_device_caps: caps->directions = 0x00000001
[    0.303124] xilinx_dma_device_caps: caps->directions = 0x00000002
[    0.303128] xilinx_dma_device_caps: caps->directions = 0x00000002
[    7.762354] xilinx_dma_device_caps: caps->directions = 0x00000001
[    7.762358] xilinx_dma_device_caps: caps->directions = 0x00000001
root@pdm3:~# aplay closetoyou.wav 
Playing WAVE 'closetoyou.wav' : Signed 16 bit Little Endian, Rate 48000 Hz, Stereo
^CAborted by signal Interrupt...
aplay: pcm_write:2178: write error: Interrupted system call
root@pdm3:~# ^C
root@pdm3:~# ^C
root@pdm3:~# dmesg | grep xilinx_dma_device_caps
[    0.302398] xilinx_dma_device_caps: caps->directions = 0x00000001
[    0.302401] xilinx_dma_device_caps: caps->directions = 0x00000001
[    0.303124] xilinx_dma_device_caps: caps->directions = 0x00000002
[    0.303128] xilinx_dma_device_caps: caps->directions = 0x00000002
[    7.762354] xilinx_dma_device_caps: caps->directions = 0x00000001
[    7.762358] xilinx_dma_device_caps: caps->directions = 0x00000001
[   44.792624] xilinx_dma_device_caps: caps->directions = 0x00000001
[   44.792628] xilinx_dma_device_caps: caps->directions = 0x00000001

<4>[    0.302360] dma_slave_caps:
<4>[    0.302364]   src_addr_widths    = 0x00000000
<4>[    0.302368]   dst_addr_widths    = 0x00000000
<4>[    0.302371]   directions         = 0x00000000
<4>[    0.302374]   min_burst          = 0x00000000
<4>[    0.302377]   max_burst          = 0x00000000
<4>[    0.302380]   max_sg_burst       = 0x00000000
<4>[    0.302383]   cmd_pause          = 0x00
<4>[    0.302386]   cmd_resume         = 0x00
<4>[    0.302388]   cmd_terminate      = 0x00
<4>[    0.302391]   residue_granularity= 0x00000000
<4>[    0.302394]   descriptor_reuse   = 0x00
<4>[    0.302398] xilinx_dma_device_caps: caps->directions = 0x00000001
<4>[    0.302401] xilinx_dma_device_caps: caps->directions = 0x00000001
<4>[    0.302404] dma_slave_caps:
<4>[    0.302406]   src_addr_widths    = 0x00000000
<4>[    0.302409]   dst_addr_widths    = 0x00000000
<4>[    0.302412]   directions         = 0x00000001
<4>[    0.302415]   min_burst          = 0x00000000
<4>[    0.302418]   max_burst          = 0x00000000
<4>[    0.302421]   max_sg_burst       = 0x00000000
<4>[    0.302423]   cmd_pause          = 0x00
<4>[    0.302426]   cmd_resume         = 0x00
<4>[    0.302429]   cmd_terminate      = 0x01
<4>[    0.302431]   residue_granularity= 0x00000001
<4>[    0.302434]   descriptor_reuse   = 0x00
<4>[    0.302437] <stack>
<4>[    0.302442] CPU: 3 UID: 0 PID: 40 Comm: kworker/u20:0 Not tainted 6.12.74-stable-standard-00032-g4c3d957ee56f #1
<4>[    0.302453] Hardware name: pdm3_10_001-2 (DT)
<4>[    0.302459] Workqueue: events_unbound deferred_probe_work_func
<4>[    0.302479] Call trace:
<4>[    0.302482]  dump_backtrace+0xd0/0x108
<4>[    0.302498]  show_stack+0x14/0x1c
<4>[    0.302510]  dump_stack_lvl+0x5c/0x78
<4>[    0.302521]  dump_stack+0x14/0x1c
<4>[    0.302530]  dma_get_slave_caps+0xf8/0x114
<4>[    0.302544]  dmaengine_pcm_new+0x190/0x29c
<4>[    0.302557]  snd_soc_pcm_component_new+0x50/0x88
<4>[    0.302566]  soc_new_pcm+0x520/0x618
<4>[    0.302575]  snd_soc_bind_card+0x6cc/0xa48
<4>[    0.302585]  snd_soc_register_card+0xec/0x100
<4>[    0.302593]  devm_snd_soc_register_card+0x48/0x88
<4>[    0.302603]  simple_probe+0x370/0x380
<4>[    0.302611]  platform_probe+0x64/0xb0
<4>[    0.302623]  really_probe+0x18c/0x32c
<4>[    0.302633]  __driver_probe_device+0x120/0x138
<4>[    0.302643]  driver_probe_device+0x38/0xf0
<4>[    0.302653]  __device_attach_driver+0x100/0x114
<4>[    0.302664]  bus_for_each_drv+0xac/0xd4
<4>[    0.302673]  __device_attach+0xe4/0x164
<4>[    0.302683]  device_initial_probe+0x10/0x18
<4>[    0.302693]  bus_probe_device+0x38/0x9c
<4>[    0.302702]  deferred_probe_work_func+0xc8/0xdc
<4>[    0.302712]  process_scheduled_works+0x18c/0x23c
<4>[    0.302725]  worker_thread+0x140/0x1c0
<4>[    0.302736]  kthread+0xd8/0xe8
<4>[    0.302747]  ret_from_fork+0x10/0x20
<4>[    0.302756] </stack>
<4>[    0.303089] dma_slave_caps:
<4>[    0.303092]   src_addr_widths    = 0x00000000
<4>[    0.303096]   dst_addr_widths    = 0x00000000
<4>[    0.303099]   directions         = 0x00000000
<4>[    0.303102]   min_burst          = 0x00000000
<4>[    0.303105]   max_burst          = 0x00000000
<4>[    0.303107]   max_sg_burst       = 0x00000000
<4>[    0.303110]   cmd_pause          = 0x00
<4>[    0.303113]   cmd_resume         = 0x00
<4>[    0.303116]   cmd_terminate      = 0x00
<4>[    0.303119]   residue_granularity= 0x00000000
<4>[    0.303121]   descriptor_reuse   = 0x00
<4>[    0.303124] xilinx_dma_device_caps: caps->directions = 0x00000002
<4>[    0.303128] xilinx_dma_device_caps: caps->directions = 0x00000002
<4>[    0.303131] dma_slave_caps:
<4>[    0.303133]   src_addr_widths    = 0x00000000
<4>[    0.303135]   dst_addr_widths    = 0x00000000
<4>[    0.303138]   directions         = 0x00000002
<4>[    0.303141]   min_burst          = 0x00000000
<4>[    0.303144]   max_burst          = 0x00000000
<4>[    0.303147]   max_sg_burst       = 0x00000000
<4>[    0.303149]   cmd_pause          = 0x00
<4>[    0.303152]   cmd_resume         = 0x00
<4>[    0.303155]   cmd_terminate      = 0x01
<4>[    0.303158]   residue_granularity= 0x00000001
<4>[    0.303161]   descriptor_reuse   = 0x00
<4>[    0.303163] <stack>
<4>[    0.303176] Hardware name: pdm3_10_001-2 (DT)
.....
.....
.....
<6>[    7.102399] macb ff0c0000.ethernet eth1: Link is Up - 100Mbps/Full - flow control tx
<3>[    7.458535] lima fd4b0000.gpu: resume clk fail -13
<6>[    7.683306] input: PDM3 virtual keyboard as /devices/virtual/input/input3
<4>[    7.762300] dma_slave_caps:
<4>[    7.762316]   src_addr_widths    = 0x00000000
<4>[    7.762322]   dst_addr_widths    = 0x00000000
<4>[    7.762325]   directions         = 0x00000000
<4>[    7.762328]   min_burst          = 0x00000000
<4>[    7.762331]   max_burst          = 0x00000000
<4>[    7.762334]   max_sg_burst       = 0x00000000
<4>[    7.762337]   cmd_pause          = 0x00
<4>[    7.762341]   cmd_resume         = 0x00
<4>[    7.762344]   cmd_terminate      = 0x00
<4>[    7.762347]   residue_granularity= 0x00000000
<4>[    7.762350]   descriptor_reuse   = 0x00
<4>[    7.762354] xilinx_dma_device_caps: caps->directions = 0x00000001
<4>[    7.762358] xilinx_dma_device_caps: caps->directions = 0x00000001
<4>[    7.762361] dma_slave_caps:
<4>[    7.762364]   src_addr_widths    = 0x00000000
<4>[    7.762366]   dst_addr_widths    = 0x00000000
<4>[    7.762370]   directions         = 0x00000001
<4>[    7.762373]   min_burst          = 0x00000000
<4>[    7.762376]   max_burst          = 0x00000000
<4>[    7.762379]   max_sg_burst       = 0x00000000
<4>[    7.762382]   cmd_pause          = 0x00
<4>[    7.762385]   cmd_resume         = 0x00
<4>[    7.762387]   cmd_terminate      = 0x01
<4>[    7.762390]   residue_granularity= 0x00000001
<4>[    7.762394]   descriptor_reuse   = 0x00
<4>[    7.762397] <stack>
<4>[    7.762416] Hardware name: pdm3_10_001-2 (DT)
<4>[    7.762422] Call trace:
<4>[    7.762425]  dump_backtrace+0xd0/0x108
<4>[    7.762447]  show_stack+0x14/0x1c
<4>[    7.762459]  dump_stack_lvl+0x5c/0x78
<4>[    7.762471]  dump_stack+0x14/0x1c
<4>[    7.762480]  dma_get_slave_caps+0xf8/0x114
<4>[    7.762495]  snd_dmaengine_pcm_refine_runtime_hwparams+0x60/0x15c
<4>[    7.762510]  dmaengine_pcm_open+0x180/0x1a8
<4>[    7.762524]  snd_soc_component_open+0x50/0x5c
<4>[    7.762532]  __soc_pcm_open+0x84/0x3a4
<4>[    7.762542]  soc_pcm_open+0x28/0x44
<4>[    7.762550]  snd_pcm_open_substream+0x4ec/0x750
<4>[    7.762560]  snd_pcm_open+0xb8/0x1ec
<4>[    7.762568]  snd_pcm_playback_open+0x48/0x70
<4>[    7.762576]  snd_open+0x150/0x15c
<4>[    7.762587]  chrdev_open+0x170/0x198
<4>[    7.762601]  do_dentry_open+0x2f8/0x3a4
<4>[    7.762613]  vfs_open+0x24/0x44
<4>[    7.762621]  path_openat+0x8cc/0xa04
<4>[    7.762629]  do_filp_open+0x60/0xd0
<4>[    7.762636]  do_sys_openat2+0xa0/0xec
<4>[    7.762644]  do_sys_open+0x44/0x6c
<4>[    7.762652]  __arm64_sys_openat+0x1c/0x24
<4>[    7.762659]  invoke_syscall+0x68/0xf0
<4>[    7.762671]  el0_svc_common.constprop.0+0xb0/0xcc
<4>[    7.762682]  do_el0_svc+0x18/0x20
<4>[    7.762693]  el0_svc+0x18/0x44
<4>[    7.762705]  el0t_64_sync_handler+0x80/0x124
<4>[    7.762717]  el0t_64_sync+0x14c/0x150
<4>[    7.762726] </stack>
.....
.....
.....
<5>[   40.293549] audit: type=1327 audit(1772610878.644:23): proctitle=737368643A20726F6F74205B707269765D
<4>[   44.792575] dma_slave_caps:
<4>[   44.792589]   src_addr_widths    = 0x00000000
<4>[   44.792593]   dst_addr_widths    = 0x00000000
<4>[   44.792596]   directions         = 0x00000000
<4>[   44.792599]   min_burst          = 0x00000000
<4>[   44.792602]   max_burst          = 0x00000000
<4>[   44.792606]   max_sg_burst       = 0x00000000
<4>[   44.792609]   cmd_pause          = 0x00
<4>[   44.792612]   cmd_resume         = 0x00
<4>[   44.792614]   cmd_terminate      = 0x00
<4>[   44.792618]   residue_granularity= 0x00000000
<4>[   44.792621]   descriptor_reuse   = 0x00
<4>[   44.792624] xilinx_dma_device_caps: caps->directions = 0x00000001
<4>[   44.792628] xilinx_dma_device_caps: caps->directions = 0x00000001
<4>[   44.792631] dma_slave_caps:
<4>[   44.792633]   src_addr_widths    = 0x00000000
<4>[   44.792636]   dst_addr_widths    = 0x00000000
<4>[   44.792639]   directions         = 0x00000001
<4>[   44.792642]   min_burst          = 0x00000000
<4>[   44.792645]   max_burst          = 0x00000000
<4>[   44.792648]   max_sg_burst       = 0x00000000
<4>[   44.792651]   cmd_pause          = 0x00
<4>[   44.792654]   cmd_resume         = 0x00
<4>[   44.792656]   cmd_terminate      = 0x01
<4>[   44.792659]   residue_granularity= 0x00000001
<4>[   44.792662]   descriptor_reuse   = 0x00
<4>[   44.792665] <stack>
<4>[   44.792671] CPU: 3 UID: 0 PID: 1225 Comm: aplay Not tainted 6.12.74-stable..
<4>[   44.792684] Hardware name: pdm3_10_001-2 (DT)
<4>[   44.792689] Call trace:
<4>[   44.792692]  dump_backtrace+0xd0/0x108
<4>[   44.792713]  show_stack+0x14/0x1c
<4>[   44.792725]  dump_stack_lvl+0x5c/0x78
<4>[   44.792737]  dump_stack+0x14/0x1c
<4>[   44.792746]  dma_get_slave_caps+0xf8/0x114
<4>[   44.792761]  snd_dmaengine_pcm_refine_runtime_hwparams+0x60/0x15c
<4>[   44.792775]  dmaengine_pcm_open+0x180/0x1a8
<4>[   44.792788]  snd_soc_component_open+0x50/0x5c
<4>[   44.792796]  __soc_pcm_open+0x84/0x3a4
<4>[   44.792805]  soc_pcm_open+0x28/0x44
<4>[   44.792813]  snd_pcm_open_substream+0x4ec/0x750
<4>[   44.792822]  snd_pcm_open+0xb8/0x1ec
<4>[   44.792830]  snd_pcm_playback_open+0x48/0x70
<4>[   44.792838]  snd_open+0x150/0x15c
<4>[   44.792849]  chrdev_open+0x170/0x198
<4>[   44.792863]  do_dentry_open+0x2f8/0x3a4
<4>[   44.792875]  vfs_open+0x24/0x44
<4>[   44.792882]  path_openat+0x8cc/0xa04
<4>[   44.792890]  do_filp_open+0x60/0xd0
<4>[   44.792897]  do_sys_openat2+0xa0/0xec
<4>[   44.792905]  do_sys_open+0x44/0x6c
<4>[   44.792912]  __arm64_sys_openat+0x1c/0x24
<4>[   44.792920]  invoke_syscall+0x68/0xf0
<4>[   44.792931]  el0_svc_common.constprop.0+0xb0/0xcc
<4>[   44.792942]  do_el0_svc+0x18/0x20
<4>[   44.792953]  el0_svc+0x18/0x44
<4>[   44.792964]  el0t_64_sync_handler+0x80/0x124
<4>[   44.792977]  el0t_64_sync+0x14c/0x150
<4>[   44.792985] </stack>


>To quickly test theory (2), you could then comment out the caps->
>assignments in dma_get_slave_caps() and check if this fixes your issue
>or not.

I have applied 7e01511443c3, kept RFC patch(xilinx_dma_device_caps + printk)
and dmaengine.c debug patch applied (dma_slave_caps_printk() + dump_stack())
and comment out the caps->assignments in dma_get_slave_caps() 

Observation:Audio works normally.
logs:
root@pdm3:~# dmesg | grep xilinx_dma_device_caps
[    0.301728] xilinx_dma_device_caps: caps->directions = 0x00000000
[    0.301731] xilinx_dma_device_caps: caps->directions = 0x00000001
[    0.302421] xilinx_dma_device_caps: caps->directions = 0x00000000
[    0.302424] xilinx_dma_device_caps: caps->directions = 0x00000002
[    5.882992] xilinx_dma_device_caps: caps->directions = 0x00000000
[    5.882996] xilinx_dma_device_caps: caps->directions = 0x00000001
root@pdm3:~# 
root@pdm3:~# aplay closetoyou.wav 
Playing WAVE 'closetoyou.wav' : Signed 16 bit Little Endian, Rate 48000 Hz, Stereo
root@pdm3:~# aplay closetoyou.wav 
Playing WAVE 'closetoyou.wav' : Signed 16 bit Little Endian, Rate 48000 Hz, Stereo
root@pdm3:~# aplay closetoyou.wav 
Playing WAVE 'closetoyou.wav' : Signed 16 bit Little Endian, Rate 48000 Hz, Stereo
^X^X^CAborted by signal Interrupt...
root@pdm3:~# dmesg | grep xilinx_dma_device_caps
[    0.301728] xilinx_dma_device_caps: caps->directions = 0x00000000
[    0.301731] xilinx_dma_device_caps: caps->directions = 0x00000001
[    0.302421] xilinx_dma_device_caps: caps->directions = 0x00000000
[    0.302424] xilinx_dma_device_caps: caps->directions = 0x00000002
[    5.882992] xilinx_dma_device_caps: caps->directions = 0x00000000
[    5.882996] xilinx_dma_device_caps: caps->directions = 0x00000001
[  324.413686] xilinx_dma_device_caps: caps->directions = 0x00000000
[  324.413689] xilinx_dma_device_caps: caps->directions = 0x00000001
[  348.022906] xilinx_dma_device_caps: caps->directions = 0x00000000
[  348.022910] xilinx_dma_device_caps: caps->directions = 0x00000001
[  402.654943] xilinx_dma_device_caps: caps->directions = 0x00000000
[  402.654946] xilinx_dma_device_caps: caps->directions = 0x00000001
[  423.598936] xilinx_dma_device_caps: caps->directions = 0x00000000
[  423.598940] xilinx_dma_device_caps: caps->directions = 0x00000001



