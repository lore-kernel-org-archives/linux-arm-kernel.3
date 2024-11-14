Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF66D6A25B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 23:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XGno1wzgEqV1HjDJxj9LHzlYSckAa8qAlmfgXnpAYiI=; b=HIq8njQJ7dwiFrWS0s7cUrf7us
	f1Rj/D7oZ0IfeAk3plEsiDCTA1PHMK+a8gFIjkqOjUYrYOoBApb0Rj7jIRyV093BjuuAxMd2znf9B
	unMZ1m9qZ8tFfFJgQYf46iKIDldnPvHrhJ5u50pNnM6D+4mRN43lBae5CgQJplnJ2MylolifZX590
	sVXHYBOnNmB+6/E2aqTwKKTBzQYXj7xsTU4PFVZkbim0WjZNSFtGYXs1kA5b8M3gHD3nsU1trbU6A
	fadZIIPk2P38HYXRciB3Y+P9i+aWPD0SrdhHCgDbug5pCdBzeIvcFRgrVBWNQAYUnAnKPNAuM8FNb
	Qro1R9PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBjUH-000000018Vf-1XTt;
	Thu, 14 Nov 2024 23:42:57 +0000
Received: from out-179.mta0.migadu.com ([2001:41d0:1004:224b::b3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBjTK-000000018Es-3X2f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 23:42:00 +0000
Date: Thu, 14 Nov 2024 15:41:37 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1731627709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XGno1wzgEqV1HjDJxj9LHzlYSckAa8qAlmfgXnpAYiI=;
	b=lxpxzRH7YHlU9JZigMCrAD4rc1j+I82rtFNeiX2onDLGHNiW5TctQ/EXB1fi7t0ow3U4mS
	x6PLEj7hijpjZwIfhJfs8umi4eRva+moQbTrnVflibJa41FzfCGgfkpPSwAoU0TWStkw/8
	rcMLueG4oVxGpPDL2ZJFbrIcy5hVXWs=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: syzbot <syzbot+4727d10d6a805738b0f2@syzkaller.appspotmail.com>
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	maz@kernel.org, suzuki.poulose@arm.com,
	syzkaller-bugs@googlegroups.com, will@kernel.org,
	yuzenghui@huawei.com
Subject: Re: [syzbot] [kvmarm?] WARNING in kvm_handle_mmio_return
Message-ID: <ZzaKsQ7-mqK78BdT@linux.dev>
References: <673634e0.050a0220.1324f8.009d.GAE@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <673634e0.050a0220.1324f8.009d.GAE@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_154159_093183_F2108EAA 
X-CRM114-Status: UNSURE (   8.20  )
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

On Thu, Nov 14, 2024 at 09:35:28AM -0800, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    2d5404caa8c7 Linux 6.12-rc7
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=1393335f980000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=a0d77fb8077b4744
> dashboard link: https://syzkaller.appspot.com/bug?extid=4727d10d6a805738b0f2
> compiler:       aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> userspace arch: arm64
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1793335f980000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=144ff4e8580000
> 
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/384ffdcca292/non_bootable_disk-2d5404ca.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/9fafeb95420d/vmlinux-2d5404ca.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/498f7a357ea2/Image-2d5404ca.gz.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+4727d10d6a805738b0f2@syzkaller.appspotmail.com

#syz fix: KVM: arm64: Don't retire aborted MMIO instruction

I sent out the pull request for 6.13 yesterday, which includes this fix [*]

[*]: https://lore.kernel.org/kvmarm/ZzWo7_GSUNXe7Ip_@linux.dev/

-- 
Thanks,
Oliver

