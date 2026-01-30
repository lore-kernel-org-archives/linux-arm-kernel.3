Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED14D49C93
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 10:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PAnkuqO32ClpKHcX2BWeLyrxvj8SmyJn9Gq4UuehOXo=; b=A6Eh/bUmKfIhggKYJZCFSdBsuP
	jlVROSP0/9jfNP1Em3Lc8zqpIBcX9OaVkCk5NHvkIDAYGHaozl49okH9Hf+2jYJEFKulZ3qE9bqS+
	cGcXayPSktja7xacUNuw3LBApaUsfX2wRQBRvuT5RXdUo36d0k92c/LVlufz3oYP1ocmPvkp4qNPn
	6/zNgMu48pb8d5v3V/q2H8ZJzegzkJzoKHvabC/lxYg6jlDQUASPWbPz3KXbjpJgdsQJM3miDX3kL
	SkJLmVitQ4l/9ihPBq0gMi2T7fcPkv7eaCy7PKBkm72yJy3lRYvDWMK3I/HrjBiWfLej4jcvaote7
	a6AwBaTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vllWQ-00000001Iko-0oW4;
	Fri, 30 Jan 2026 10:14:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vllWN-00000001IkS-0hbs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 10:14:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A94143D08;
	Fri, 30 Jan 2026 10:14:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3067C4CEF7;
	Fri, 30 Jan 2026 10:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769768074;
	bh=PAnkuqO32ClpKHcX2BWeLyrxvj8SmyJn9Gq4UuehOXo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Bw/m2DGFK+2+xwTLITydu5hjYD+iwt16S1lj13AERx6IXvyJbBzsExgjG8fK+8RkM
	 xeazubeebOkl2Xx3ssgpjGLnaDgjas0z0MIB9cx+ruBaBe/sbynH2xCL/JtBSWvGRK
	 K55RobIGUmifzjD58kRb2I0q8JRYngN/UFPw8gkZiR+DmEIpTZA6TIlYelulnegtCc
	 D3itABt9wI3crPfQATPAq6lmn15DYtaKx4JoA+uiYPbAnC3wtMbbanl2v0RBQWufnO
	 Hij8KePxIrPB/KQM3M5Vjkv6MKPwbAX14ow/C24ESCJKX/hMfW7V87nPaDb1zIf4MK
	 cRruHHtd1w6Iw==
From: Thomas Gleixner <tglx@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, oleg@redhat.com, peterz@infradead.org, luto@kernel.org,
 shuah@kernel.org, kees@kernel.org, wad@chromium.org,
 kevin.brodsky@arm.com, deller@gmx.de, akpm@linux-foundation.org,
 charlie@rivosinc.com, ldv@strace.io, mark.rutland@arm.com,
 anshuman.khandual@arm.com, song@kernel.org, ryan.roberts@arm.com,
 thuth@redhat.com, ada.coupriediaz@arm.com, broonie@kernel.org,
 pengcan@kylinos.cn, liqiang01@kylinos.cn, kmal@cock.li,
 dvyukov@google.com, reddybalavignesh9979@gmail.com,
 richard.weiyang@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc: ruanjinjie@huawei.com
Subject: Re: [PATCH v11 13/14] entry: Inline syscall_exit_work() and
 syscall_trace_enter()
In-Reply-To: <20260128031934.3906955-14-ruanjinjie@huawei.com>
References: <20260128031934.3906955-1-ruanjinjie@huawei.com>
 <20260128031934.3906955-14-ruanjinjie@huawei.com>
Date: Fri, 30 Jan 2026 11:14:27 +0100
Message-ID: <87qzr7l858.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_021435_230367_25407853 
X-CRM114-Status: UNSURE (   6.64  )
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

On Wed, Jan 28 2026 at 11:19, Jinjie Ruan wrote:
> After switch arm64 to Generic Entry, a new hotspot syscall_exit_work()
> appeared because syscall_exit_work() is not inlined, so inline
> syscall_exit_work(). Also inline syscall_trace_enter() to align with
> syscall_exit_work().

Has the same collision problem. I can pick that up and massage it on top
of the pending time slice changes. Let me give it a test ride on x86...

