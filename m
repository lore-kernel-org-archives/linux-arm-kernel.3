Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA42BC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 15:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e/gkyM3oFDnDmiC4diCmIxvY145pRyMQi2rIkFSJT9c=; b=ZwNyQeXDWNK7oo5TkxOYcuZxax
	FnwUE2NBZDd1N866FjybjB6j2P+98mHDaX28xkQ/pbo67Wn1613uoXnlg25wRASGc/qr/tOdTRdev
	TWXTnEXf7QAb3QvRTbBl9DMVkPsOVfRqZtIoAOGNmkQVSHJLUN1Kur0gMrNuiSU78+mULCmS/349o
	/GEU2Jlkj6caClzLjRPsCpbWkFMtP3hea9PDuD4I3juVOn0Cb4Ja3pu9UeKBvmK0iDkPG52t5BmA5
	RpxXFjPJI+l0xQjRPgFy0tZrnDrO7PW0Mr+4kS5osDOOb8pkps7vNJUhRyiltFsiCTziEWOkiJoXI
	8SvbmGww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAWDC-0000000G7gi-1Nb3;
	Thu, 01 May 2025 15:52:34 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAWBI-0000000G7Sz-1n5W;
	Thu, 01 May 2025 15:50:37 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-6f0c30a1cf8so17661336d6.2;
        Thu, 01 May 2025 08:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746114635; x=1746719435; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/gkyM3oFDnDmiC4diCmIxvY145pRyMQi2rIkFSJT9c=;
        b=b3hKo8igwR+jRoPEBVP4umzG2qtBqt6apNZkQWAHtdT0x6FFiBUJnKqnShyUC7O8aJ
         5sMPGvF7BjFfp03n/rTp3f4tKhzHQiEA8ARH/p9eIcxzSMh155AMdIiTK8hs6Y8jlNbO
         OZQV6j79gGSzE5IGFsrri+YJ8VQBEt9ogGvXJshkTGs7/Gw/15dbuHgh9Qk0JnhIuLnk
         TMooDB/O9aDs7tBhygyOYY/G+puEp6KOzzOE7jnGVpiPOVfbpx6PD+0qDb5Bs0fZPGA1
         7PbWOfyUR4he3zRLWl50kOPqQaES6l+jUUxkPcI7P2bL5K/cnwurnNZhpjMnGf0LPjQg
         V8rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746114635; x=1746719435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/gkyM3oFDnDmiC4diCmIxvY145pRyMQi2rIkFSJT9c=;
        b=GfLec2fvO5tr8UhyDd1zn71My0n020rXnY22EqFsd8Mr0fzDzNj+OP2cwcCzzo5tMx
         B4WS7bKpvu1up0nRCeDvxLBTmlyLAbyOIkabPbviXMfQz/iF09AjABqIiXC2kHv59kDv
         VBljB+jaLe9gIAxKLjHTBk8Gpxa2ObfmY+nsmZU1EVpDFjXEB+dVK7OkSBYhOOmo/Qpm
         XpOoxus3iBKdcKsBcm5nZHSRgA8AlSnyhH/ymPx4lZAFOrfiMy+kA0u5wvdYDzryVc5X
         txzSqTYRrBjlpfIQ04LIO5szL/xyXvVrp5WvYqCJnahOfNnnbswAYjpJZbBKAE83mBfq
         6FyA==
X-Forwarded-Encrypted: i=1; AJvYcCWa3lUqdENmxy7vH9kgyTPUTRysQcXGbtIR79O2W+tBr0SY4tDZd0A7uwUHgehQQ9BN1Pw51bv5qAwfXH8dwAI=@lists.infradead.org, AJvYcCXqkxoN1ibpU3+fTKHtids97F67Ninrnv+8Nl8e0g6/mKbwJjqBEMfn8MWvnyl0PlEXtwfxRJMjE5PJf2sYefVn@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt99lDM0IS1zVSB9Rjf6PPH09K47doCnwwzpFaJ01MQzT8qdOH
	ZmKV0iZYD/s2X5onqDhxhDHZphDoqlh7yIhvjwJzzL2tErkPbf8xtoayF4/TMA8jLgjdaXvPSkt
	WIybEvFbpQGU58WUj2URN2eDILn8=
X-Gm-Gg: ASbGnctiyKx+we4cA2E1ioP+kAgBirpnvD9YXcU83cQQFscs0vZO7p4R0ax0wBB75Hp
	M02EIKO5bd3OIQEUO9p5Cak9RmIAxlhkT8IWqSKxsEOUWGTqEwiSpPjQp03iDEgQ+XoKO51xWxS
	UqnruFGAJW4EtNI4KV7JJ2c6o=
X-Google-Smtp-Source: AGHT+IHO/1JjpQlA3vZ2eRSDQvhzoweYMhYgCYf17uHdH7Vil20W5pGnhp9djE4FSIg3al8nnvRqCoV7aBjmQR5yuEs=
X-Received: by 2002:a05:6214:d85:b0:6ed:122c:7da7 with SMTP id
 6a1803df08f44-6f50a8fa520mr51081636d6.5.1746114635123; Thu, 01 May 2025
 08:50:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250430082651.3152444-1-qun-wei.lin@mediatek.com>
In-Reply-To: <20250430082651.3152444-1-qun-wei.lin@mediatek.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 1 May 2025 08:50:24 -0700
X-Gm-Features: ATxdqUGn8eYuPIj4I1IzzOIEq-VCYnYbbowQLijhdEqfyu9by8KrA7NerQXniyA
Message-ID: <CAKEwX=MNVwd_Z1PyBt7swd2VhUVivRN-5E+kHm-3XAPka0d84w@mail.gmail.com>
Subject: Re: [PATCH] mm: Add Kcompressd for accelerated memory compression
To: Qun-Wei Lin <qun-wei.lin@mediatek.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Casper Li <casper.li@mediatek.com>, 
	Chinwen Chang <chinwen.chang@mediatek.com>, Andrew Yang <andrew.yang@mediatek.com>, 
	James Hsu <james.hsu@mediatek.com>, Barry Song <21cnbao@gmail.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kairui Song <ryncsn@gmail.com>, Joshua Hahn <joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_085036_471000_AECDDFD4 
X-CRM114-Status: GOOD (  15.04  )
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

On Wed, Apr 30, 2025 at 1:27=E2=80=AFAM Qun-Wei Lin <qun-wei.lin@mediatek.c=
om> wrote:
>
> This patch series introduces a new mechanism called kcompressd to
> improve the efficiency of memory reclaiming in the operating system.
>
> Problem:
>   In the current system, the kswapd thread is responsible for both scanni=
ng
>   the LRU pages and handling memory compression tasks (such as those
>   involving ZSWAP/ZRAM, if enabled). This combined responsibility can lea=
d
>   to significant performance bottlenecks, especially under high memory
>   pressure. The kswapd thread becomes a single point of contention, causi=
ng
>   delays in memory reclaiming and overall system performance degradation.
>
> Solution:
>   Introduced kcompressd to handle asynchronous compression during memory
>   reclaim, improving efficiency by offloading compression tasks from
>   kswapd. This allows kswapd to focus on its primary task of page reclaim
>   without being burdened by the additional overhead of compression.
>
> In our handheld devices, we found that applying this mechanism under high
> memory pressure scenarios can increase the rate of pgsteal_anon per secon=
d
> by over 260% compared to the situation with only kswapd. Additionally, we
> observed a reduction of over 50% in page allocation stall occurrences,
> further demonstrating the effectiveness of kcompressd in alleviating memo=
ry
> pressure and improving system responsiveness.
>

Oh btw, testing this on a simple kernel building task triggers this:

[  133.349908] WARNING: CPU: 0 PID: 50 at mm/memcontrol.c:5330
obj_cgroup_charge_zswap+0x22e/0x250
[  133.350505] Modules linked in: virtio_net pata_acpi net_failover
failover virtio_rng rng_core ata_piix libata scsi_mod scsi_common
[  133.351366] CPU: 0 UID: 0 PID: 50 Comm: kcompressd0 Not tainted
6.14.0-ge65b549702a5 #218
[  133.351940] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 04/01/2014
[  133.352717] RIP: 0010:obj_cgroup_charge_zswap+0x22e/0x250
[  133.353118] Code: d2 ff 85 c0 0f 85 7a fe ff ff be ff ff ff ff 48
c7 c7 88 da f1 91 e8 a1 b4 a3 00 85 c0 0f 85 61 fe ff ff 0f 0b e9 5a
fe ff ff <0f> 0b e9 f5 fd ff ff e8 36 ae a3 00 e9 78 fe ff ff e8 2c ae
a3 00
[  133.354372] RSP: 0018:ffff9f99803bbc00 EFLAGS: 00010246
[  133.354782] RAX: ffff970f42a9a900 RBX: 000000000000013e RCX: 00000000000=
00002
[  133.355269] RDX: 0000000000000000 RSI: 000000000000013e RDI: ffff970f475=
eab40
[  133.355774] RBP: ffff970f475eab40 R08: 0000000000000000 R09: 00000000000=
00000
[  133.356269] R10: ffffffff90a21205 R11: ffffffff90a211ab R12: ffffffff90a=
21205
[  133.356782] R13: ffffc4984041ff40 R14: ffff970f42e66000 R15: 00000000000=
0013e
[  133.357279] FS:  0000000000000000(0000) GS:ffff970fbdc00000(0000)
knlGS:0000000000000000
[  133.357807] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  133.358186] CR2: 00007f33950c5030 CR3: 00000000038ea000 CR4: 00000000000=
006f0
[  133.358656] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 00000000000=
00000
[  133.359121] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 00000000000=
00400
[  133.359597] Call Trace:
[  133.359767]  <TASK>
[  133.359914]  ? __warn+0x94/0x190
[  133.360136]  ? obj_cgroup_charge_zswap+0x22e/0x250
[  133.360476]  ? report_bug+0x168/0x170
[  133.360742]  ? handle_bug+0x53/0x90
[  133.360982]  ? exc_invalid_op+0x18/0x70
[  133.361240]  ? asm_exc_invalid_op+0x1a/0x20
[  133.361536]  ? zswap_store+0x755/0xf80
[  133.361798]  ? zswap_store+0x6fb/0xf80
[  133.362071]  ? zswap_store+0x755/0xf80
[  133.362338]  ? obj_cgroup_charge_zswap+0x22e/0x250
[  133.362661]  ? zswap_store+0x755/0xf80
[  133.362943]  zswap_store+0x7e7/0xf80
[  133.363203]  ? __pfx_kcompressd+0x10/0x10
[  133.363472]  kcompressd+0xb1/0x180
[  133.363724]  ? __pfx_autoremove_wake_function+0x10/0x10
[  133.364082]  kthread+0xef/0x230
[  133.364298]  ? __pfx_kthread+0x10/0x10
[  133.364548]  ret_from_fork+0x34/0x50
[  133.364810]  ? __pfx_kthread+0x10/0x10
[  133.365063]  ret_from_fork_asm+0x1a/0x30
[  133.365321]  </TASK>
[  133.365471] irq event stamp: 18
[  133.365680] hardirqs last  enabled at (17): [<ffffffff914bd0ef>]
_raw_spin_unlock_irqrestore+0x4f/0x60
[  133.366289] hardirqs last disabled at (18): [<ffffffff914b2031>]
__schedule+0x6b1/0xe80
[  133.366824] softirqs last  enabled at (0): [<ffffffff906b1caf>]
copy_process+0x9af/0x2b50
[  133.367366] softirqs last disabled at (0): [<0000000000000000>] 0x0
[  133.367844] ---[ end trace 0000000000000000 ]---

Seems like we're trigger this warning in the zswap cgroup check (see
obj_cgroup_may_zswap() in mm/memcontrol.c for more details):

VM_WARN_ON_ONCE(!(current->flags & PF_MEMALLOC));

Might wanna fix this...

