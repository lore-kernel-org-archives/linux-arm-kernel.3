Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED57D46C1D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 23:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IRmEXGeSVhohvjbR+4WY4XWWpp1lFs+fAtG3KVCLqqo=; b=KWTV5hCMVsdAlo88EGt/Xnt1zc
	XHBt1hp8uZr6UF80rxw0nxTBn9ZU12jDI5ebGKqG96ijZcHIo/01DrD/YQKx/W2m0UH78dY4IFbzd
	9w5y12/TW7ZtQrdPS/xN8eUmlUGjBGOYiGuGmSmmSlZhjFGk99qnUogJMELgCUHtXz7I4YUZ1R+qG
	2biyDZM/+zSABzuW9MDPKeVn5sfFq+kDhijdeTXK/hz4xQ/lglzUUtcI4eaNKI6bM+rR3ZC3jJgcD
	AtStLGuaqhOfeFMrCOs8QlL9c0L6ShnHtdUOZ8rkjZk8TXX4I+NSv8u7WXyQNScLNE2YPlPaNGV77
	AGLsaQsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlxzi-000000026el-3y46;
	Fri, 30 Jan 2026 23:33:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlxzh-000000026ee-2iHm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 23:33:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B580060008;
	Fri, 30 Jan 2026 23:33:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B4E1C4CEF7;
	Fri, 30 Jan 2026 23:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769816020;
	bh=AVhmdRJ94F3dw5wGstmAj1dksZFvIUSfMKKBNIBZv1k=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=ogd5PYPcP2pM/ST1oHnzPbwoa38OtSgui+3HxH/SKB4AXnKCR2Y8ScM37DyO6SHNL
	 kSbFUDBEWIV8OxKDT2SC88OP3XAaE3YxUlbeJ4xLJhGdLwMMolVLNrxeOPTWrp+p4z
	 2dGRPAnkEjPiApIgRmHEQdEbF4140xoSBqln4tjx0NDD030yJ3aWGmGythtpQKP/bG
	 ng2jyCL27R84ix4Kf3y6c/nB9V0ydDYNpUdKx50Wax/vrFiS9GvnbvDkjOuX+TD2rt
	 5kLEckGf2h0RcnZ1tw/FTNWOYbI5Bq8TfrJ2QC45SI57ziYy41dr3DIH/cSjecOmMG
	 C0mff67XW3zvA==
From: Thomas Gleixner <tglx@kernel.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>, Jinjie Ruan
 <ruanjinjie@huawei.com>, catalin.marinas@arm.com, will@kernel.org,
 oleg@redhat.com, peterz@infradead.org, luto@kernel.org, shuah@kernel.org,
 kees@kernel.org, wad@chromium.org, deller@gmx.de,
 akpm@linux-foundation.org, charlie@rivosinc.com, mark.rutland@arm.com,
 anshuman.khandual@arm.com, song@kernel.org, ryan.roberts@arm.com,
 thuth@redhat.com, ada.coupriediaz@arm.com, broonie@kernel.org,
 pengcan@kylinos.cn, liqiang01@kylinos.cn, kmal@cock.li,
 dvyukov@google.com, reddybalavignesh9979@gmail.com,
 richard.weiyang@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v11 09/14] entry: Rework
 syscall_exit_to_user_mode_work() for arch reuse
In-Reply-To: <87cy2rkuu9.ffs@tglx>
References: <20260128031934.3906955-1-ruanjinjie@huawei.com>
 <20260128031934.3906955-10-ruanjinjie@huawei.com>
 <56978cb8-f9de-4bf2-b1fc-b5564fec7387@arm.com>
 <ef52449d-7ae0-11d0-c8a9-2ca572454425@huawei.com>
 <3bfa15fc-187e-4c39-9cb3-a936fdd443b2@arm.com> <87o6mbl82j.ffs@tglx>
 <13d22231-d84a-4993-9a69-e3922e45b500@arm.com> <87cy2rkuu9.ffs@tglx>
Date: Sat, 31 Jan 2026 00:33:36 +0100
Message-ID: <87ecn6he0f.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, Jan 30 2026 at 16:01, Thomas Gleixner wrote:
> I'll go and apply them on top of 6.19-rc1 into core/entry and merge that
> into the scheduler branch to resolve the resulting conflict.
>
> ARM64 can either pull that branch or wait until the next rc1 comes out.

  git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git entry-for-arm64-26-01-31

Consider that tag immutable and consumable for ARM64 if you need it. I
did some massaging, but the ARM64 pile should still apply on top of it.

Thanks,

        tglx


