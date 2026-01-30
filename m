Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D52D49C96
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 10:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=senPl96VoP9NMbSYHN6CrZfoExUF5LHDmLR/j/T+dnQ=; b=w1KF/tAY3eAduGXi+GBeyw9C0P
	rLyi89UtPcFz/BNTwImt/9caxKyGCrQftnbvArwG7GAk5nyXp5cSnkiilw8Rht8kiAt/i7ZYrmp4M
	jjZqPjTP/MA19W+9Gc+PEQIW13HcgFv5UrgFfNJO4v3Bwa1DcEKYrkdqLS3yyL++XppIuvfTUjXLm
	hKU8tLISBz+dU3mEO5OCkvXBuYari8WL+rtKP6x46TWwzmEh7BqS0XMCZYRwJLad2jILNC+G6+Vne
	+d8k9k3zFTM0UIcG8QjVN1e+RxiEf4UPj2qkdBWj1B1FOJGYWa6iovbkyEpuVmb2jKbSxvid0pjQe
	nKJiX00A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vllXw-00000001IyZ-0ceT;
	Fri, 30 Jan 2026 10:16:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vllXt-00000001IxA-11qK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 10:16:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4F46260130;
	Fri, 30 Jan 2026 10:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C70AC4CEF7;
	Fri, 30 Jan 2026 10:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769768168;
	bh=senPl96VoP9NMbSYHN6CrZfoExUF5LHDmLR/j/T+dnQ=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=LNo1C4Vrnx+Zr3b0dCaO3rUUayS6Rd7uMIEPp2GVFj5Y9QDIzX/ThDpngyYaM+hgf
	 Ty4FWKpTZZ2IBBncUjV/pS6MPTEYvHy88AwzB4d61p/sLl1uRlColsFuy02AbGn6kT
	 tGGbC5SCsJGeXTx6XtmOXTFntb77EJK6r+gpcAWiIvxq4jOBUu9to236YpzorD5/Y9
	 MMUMph+ZByQpmPvOj6rEx97cK4ntIKJpp6Fjqc6fnwEoIvdzSozTq82M5VSXBF3if4
	 VYjcfhQNWPdPnb7b0Y5vM/dfFGqiXAGKkRKkaSqMR+A0xvgnfClOg04m+pjJXPyOMu
	 M4dF7l2BRqQ4A==
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
In-Reply-To: <3bfa15fc-187e-4c39-9cb3-a936fdd443b2@arm.com>
References: <20260128031934.3906955-1-ruanjinjie@huawei.com>
 <20260128031934.3906955-10-ruanjinjie@huawei.com>
 <56978cb8-f9de-4bf2-b1fc-b5564fec7387@arm.com>
 <ef52449d-7ae0-11d0-c8a9-2ca572454425@huawei.com>
 <3bfa15fc-187e-4c39-9cb3-a936fdd443b2@arm.com>
Date: Fri, 30 Jan 2026 11:16:04 +0100
Message-ID: <87o6mbl82j.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, Jan 29 2026 at 17:00, Kevin Brodsky wrote:
> On 29/01/2026 14:11, Jinjie Ruan wrote:
>>>> - * Calling convention is the same as for syscall_exit_to_user_mode() =
and it
>>>> - * returns with all work handled and interrupts disabled. The caller =
must
>>>> - * invoke exit_to_user_mode() before actually switching to user mode =
to
>>>> - * make the final state transitions. Interrupts must stay disabled be=
tween
>>>> - * return from this function and the invocation of exit_to_user_mode(=
).
>>>> + * Calling convention is the same as for syscall_exit_to_user_mode().=
 The
>>>> + * caller must invoke local_irq_disable(), __exit_to_user_mode_prepar=
e() and
>>> Shouldn't it be syscall_exit_to_user_mode_prepare() rather than
>>> __exit_to_user_mode_prepare()? The former has extra calls (e.g. rseq).
>> Perhaps we can just delete these comments =E2=80=94 at present only gene=
ric
>> entry and arm64 use it, and nowhere else needs it; after the refactoring
>> the comments now seem rather unclear.
>
> Agreed, the comments are essentially describing what each function
> calls; considering how short they are, directly reading the code is
> probably easier.

No. Please keep them. There is more information in them than just the
pure 'what's' called.


