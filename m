Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B98E7718D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 11:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G/iIw2p3aZzn1CMDJhVng62df9fJkurPaim3XJa9Xh8=; b=aBdZDU/Wk5bNDy+GuWslupITAr
	XS+rRbBXtz9WbBFZjwW24xu5tOzeaWP745lZEWLCqI8LG2Yf6hgRg7lX8jFFIY8UkjnlPWMNpFFeh
	kltXlHhHo05nrUk0fU1GHuNmVj9zNX0QRNPf8GKQFsFSYbduLjeUxU+cPEhF+YpJVEEmeeCYKcKlY
	2HKwIFEZWuJpmiltbusAvmnmORrDB0WI22vDXomTrAyduNh7t2a2/w2EmwCL8M9GcM8M4KLuNZ4QU
	Emph3+l/wRwokZcJS07sBSmwUt3LFTqA4jLEZPDMTPJ5qpZzaoCHztUOnuRl3pXMm8a8dFQyrYBxB
	iwI+rWKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPgcp-00000009u7n-1ryJ;
	Mon, 23 Dec 2024 11:29:27 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPgWq-00000009tFe-0jhQ;
	Mon, 23 Dec 2024 11:23:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734952993;
	bh=FWyc+XJ9NUI3TYFcLiuqVL5NKCAg5/flrdaewDMcAG4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gY5cKBVepzD/FwvE6HRD2As55uV1YLRIre154h6XGxBMXVhgo1xamc4HEqM1FAocf
	 6SZ39KAWUsZC2s445bVuRZtyUYc1z2fcMLjsOanN3kNs4gTNG0sNzTSsZuir2fq+8X
	 iqmdrxlVI1TycHntZRID7KU3tqkjBvREIoerXZYj5mDVKgHvzGhhsoBPB8feL4nVL9
	 SxDHD9eXxk67+O/EbMjnFKaKwwyqysHrL/B8KZTIiHE7noxx/FVNtUWKmtASNqJ3w3
	 veJxP6mHjXlh4PyjK8U8x1bRAIbCaDfXlfVpZS0bofBxp8QERbKDHW6lvLyCzTKzAA
	 4CxotzV2muBbw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3F92817E366D;
	Mon, 23 Dec 2024 12:23:13 +0100 (CET)
Message-ID: <1ba6e5d1-6069-4f26-837d-ef37590ae1c3@collabora.com>
Date: Mon, 23 Dec 2024 12:23:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] drm/mediatek: Set private->all_drm_private[i]->drm to
 NULL if mtk_drm_bind returns err
To: Guoqing Jiang <guoqing.jiang@canonical.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 matthias.bgg@gmail.com, nancy.lin@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20241223023227.1258112-1-guoqing.jiang@canonical.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241223023227.1258112-1-guoqing.jiang@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_032316_396335_C2441FA2 
X-CRM114-Status: UNSURE (   9.45  )
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

Il 23/12/24 03:32, Guoqing Jiang ha scritto:
> The pointer need to be set to NULL, otherwise KASAN complains about
> use-after-free. Because in mtk_drm_bind, all private's drm are set
> as follows.
> 
> private->all_drm_private[i]->drm = drm;
> 
> And drm will be released by drm_dev_put in case mtk_drm_kms_init returns
> failure. However, the shutdown path still accesses the previous allocated
> memory in drm_atomic_helper_shutdown.
> 
> [   84.874820] watchdog: watchdog0: watchdog did not stop!
> [   86.512054] ==================================================================
> [   86.513162] BUG: KASAN: use-after-free in drm_atomic_helper_shutdown+0x33c/0x378
> [   86.514258] Read of size 8 at addr ffff0000d46fc068 by task shutdown/1
> [   86.515213]
> [   86.515455] CPU: 1 UID: 0 PID: 1 Comm: shutdown Not tainted 6.13.0-rc1-mtk+gfa1a78e5d24b-dirty #55
> [   86.516752] Hardware name: Unknown Unknown Product/Unknown Product, BIOS 2022.10 10/01/2022
> [   86.517960] Call trace:
> [   86.518333]  show_stack+0x20/0x38 (C)
> [   86.518891]  dump_stack_lvl+0x90/0xd0
> [   86.519443]  print_report+0xf8/0x5b0
> [   86.519985]  kasan_report+0xb4/0x100
> [   86.520526]  __asan_report_load8_noabort+0x20/0x30
> [   86.521240]  drm_atomic_helper_shutdown+0x33c/0x378
> [   86.521966]  mtk_drm_shutdown+0x54/0x80
> [   86.522546]  platform_shutdown+0x64/0x90
> [   86.523137]  device_shutdown+0x260/0x5b8
> [   86.523728]  kernel_restart+0x78/0xf0
> [   86.524282]  __do_sys_reboot+0x258/0x2f0
> [   86.524871]  __arm64_sys_reboot+0x90/0xd8
> [   86.525473]  invoke_syscall+0x74/0x268
> [   86.526041]  el0_svc_common.constprop.0+0xb0/0x240
> [   86.526751]  do_el0_svc+0x4c/0x70
> [   86.527251]  el0_svc+0x4c/0xc0
> [   86.527719]  el0t_64_sync_handler+0x144/0x168
> [   86.528367]  el0t_64_sync+0x198/0x1a0
> [   86.528920]
> [   86.529157] The buggy address belongs to the physical page:
> [   86.529972] page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff0000d46fd4d0 pfn:0x1146fc
> [   86.531319] flags: 0xbfffc0000000000(node=0|zone=2|lastcpupid=0xffff)
> [   86.532267] raw: 0bfffc0000000000 0000000000000000 dead000000000122 0000000000000000
> [   86.533390] raw: ffff0000d46fd4d0 0000000000000000 00000000ffffffff 0000000000000000
> [   86.534511] page dumped because: kasan: bad access detected
> [   86.535323]
> [   86.535559] Memory state around the buggy address:
> [   86.536265]  ffff0000d46fbf00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   86.537314]  ffff0000d46fbf80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   86.538363] >ffff0000d46fc000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   86.544733]                                                           ^
> [   86.551057]  ffff0000d46fc080: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   86.557510]  ffff0000d46fc100: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   86.563928] ==================================================================
> [   86.571093] Disabling lock debugging due to kernel taint
> [   86.577642] Unable to handle kernel paging request at virtual address e0e9c0920000000b
> [   86.581834] KASAN: maybe wild-memory-access in range [0x0752049000000058-0x075204900000005f]
> ...
> 
> Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 multi mmsys support")
> Signed-off-by: Guoqing Jiang <guoqing.jiang@canonical.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



