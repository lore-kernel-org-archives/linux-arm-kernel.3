Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA1BCCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 20:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UTcYzXZPrniWZCkwHLSm2V6Hq8R2XKza/pCFwi3PJs0=; b=kV1MWYfH83pfqU548dihHCLBn6
	NjRkvy1uWQx+nyDmHBSd3s6XlO4xJgXCTHemQEkZjGf/qx9S9mqaATpno+RW4u3M5QXxoNf7rs5qf
	aPyOtwPyHfY+aHwVeEbUXq7xIH31bnAOy30F2mjj9hTW/YKZqGB9LzOxEbDHQ5xfqJPXUKAPdTrCA
	akSk5jzd4LWllNNtNRqdD8hVVelqd2uKQAkPwpSn58F723wNmqyzXftMICrEcuUy6L9OfarEhYhC+
	NRRF44Zy0/ez7nBNU3dy6IVlg2/ebB03/gtEuoVdctb78oNXz+2nweyXc32hjXw09AH8JS49j52vX
	or5UMKKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vECmJ-00000002mtF-2dca;
	Wed, 29 Oct 2025 20:28:19 +0000
Received: from out-185.mta0.migadu.com ([91.218.175.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vECmG-00000002mmx-3qWn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 20:28:18 +0000
Date: Wed, 29 Oct 2025 13:27:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761769663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UTcYzXZPrniWZCkwHLSm2V6Hq8R2XKza/pCFwi3PJs0=;
	b=SvOSZpMZW3/p9h7JBDkzya4FoDoQEO9J+Px2YZf5sVJIhqCyP98bAFnuLqMr0hrcj4PUw1
	qkoyJaEFkwISobw8SIX80cnkrsphzxEfEb6YMSZKL0aTCp/jZZchjpNzYL46QSL/9dyIhn
	wOuyeVhVz2OK3K1f5wkDbsFQ9D0sxx8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: syzbot <syzbot+c41f3ddb8299a30a98b5@syzkaller.appspotmail.com>
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	maz@kernel.org, suzuki.poulose@arm.com,
	syzkaller-bugs@googlegroups.com, will@kernel.org,
	yuzenghui@huawei.com
Subject: Re: [syzbot] [kvmarm?] kernel BUG in kvm_s2_put_page
Message-ID: <aQJ4tQJPiGF6M9Wb@linux.dev>
References: <68cd66b0.050a0220.139b6.000f.GAE@google.com>
 <6902734b.050a0220.3344a1.0430.GAE@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6902734b.050a0220.3344a1.0430.GAE@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_132817_101550_227BF7CF 
X-CRM114-Status: UNSURE (   9.18  )
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

On Wed, Oct 29, 2025 at 01:04:27PM -0700, syzbot wrote:
> syzbot has found a reproducer for the following issue on:
> 
> HEAD commit:    10fd0285305d Merge branch kvm-arm64/selftests-6.18 into kv..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git next
> console output: https://syzkaller.appspot.com/x/log.txt?x=173e4fe2580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=a4522b3a704e0394
> dashboard link: https://syzkaller.appspot.com/bug?extid=c41f3ddb8299a30a98b5
> compiler:       Debian clang version 20.1.8 (++20250708123704+0de59a293f7a-1~exp1~20250708003721.134), Debian LLD 20.1.8
> userspace arch: arm64
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13559c92580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12963fe2580000
> 
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/fa3fbcfdac58/non_bootable_disk-10fd0285.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/65e2ebd050e3/vmlinux-10fd0285.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/9d47fc3df12e/Image-10fd0285.gz.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+c41f3ddb8299a30a98b5@syzkaller.appspotmail.com

#syz fix: Revert "KVM: arm64: Reschedule as needed when destroying the stage-2 page-tables"

Just fast-forwarded kvmarm/next to 6.18-rc3 which has the fix.

Thanks,
Oliver

