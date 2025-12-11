Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8259D3E797
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 06:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t9h1OWF96CLddow2coOp3QyLXBxCw3plI/1ZkVxSj6E=; b=s+QImye3AvZrrP66PJg/a6tWPs
	Rv4db8vwjixiaVV9Xqq7wuM2oKjQApl7H9R51mZA+47nx+4JU7jU1AzhCXfolmzzWkZ9lR8ofs4C6
	RDR/BdpYw5iTgbfK0RqYkZO+xkp9rV/Ue0EfP+ePyJ1coZ5PDTW6fBzvo+sKyfizcnuc2qC8Df9yP
	1Z6T7byCefxqV3VDv180huvLLW1tV2ellI/aU1EDJDCe8L4u+qjfzDXp9J3vk2hxel9yuhd9s2eNB
	Un1oHNxuaI28khbdVDHt2bF5K74geEAEdQe9PBv/gzlxUH9CtWsVIUQrprMNvC2loKN8v/dg+TWmR
	L/GuVwSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTaaF-0000000GJOm-1JJW;
	Thu, 11 Dec 2025 06:55:29 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTaaA-0000000GJOM-41JS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 06:55:26 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1765436118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t9h1OWF96CLddow2coOp3QyLXBxCw3plI/1ZkVxSj6E=;
	b=EZvPVcBGLN+2H2qD7HiWivEen45LTqFjFqGAgTWy009qCWAR5nf7GSpxgRB8ZheeE34aq1
	DOk9BF5i3LrVdKKl/UwCXiYYU6seMhqR6rC/Juo/jw15ZPEb90dMor5oeSYNuVVwTbR+A0
	fudl7h0XWTH2H0Uvu9XfbrZ2rBusoyeMdo6t/a0Wbsa8v1mlUF9FTfXqjFcf1WIm2hNM6K
	H+3Nsdks7b+RTu1R/1Enm005+od8SBb/eeu1mUXe9N4hqby/eDOLsw8D2mUfXZ0VlSCFEv
	fU9f85XefDM7YVMmxM3gsNKQrtJnIze0flVKSA6HughLKxCT7RxZOsDV5cYzKA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1765436118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t9h1OWF96CLddow2coOp3QyLXBxCw3plI/1ZkVxSj6E=;
	b=zX3A905+owe9rwEyNBGgJtGLbXhfLVD5ZzymJxWEp6aqMvQMFz0wzXZlyGNK6ycc28YDgZ
	0/GVr7NDNMqi/iCw==
To: Kevin Brodsky <kevin.brodsky@arm.com>, Jinjie Ruan
 <ruanjinjie@huawei.com>, catalin.marinas@arm.com, will@kernel.org,
 oleg@redhat.com, peterz@infradead.org, luto@kernel.org, shuah@kernel.org,
 kees@kernel.org, wad@chromium.org, deller@gmx.de, macro@orcam.me.uk,
 charlie@rivosinc.com, ldv@strace.io, mark.rutland@arm.com,
 song@kernel.org, ryan.roberts@arm.com, ada.coupriediaz@arm.com,
 anshuman.khandual@arm.com, broonie@kernel.org, pengcan@kylinos.cn,
 dvyukov@google.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v9 15/16] entry: Inline syscall_exit_work()
In-Reply-To: <b382cc8a-3ce9-4fb1-bc0a-a3d9796251d1@arm.com>
References: <20251204082123.2792067-1-ruanjinjie@huawei.com>
 <20251204082123.2792067-16-ruanjinjie@huawei.com>
 <b382cc8a-3ce9-4fb1-bc0a-a3d9796251d1@arm.com>
Date: Thu, 11 Dec 2025 15:55:02 +0900
Message-ID: <87345hfqyh.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_225523_160761_395630C5 
X-CRM114-Status: GOOD (  16.94  )
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

On Tue, Dec 09 2025 at 14:48, Kevin Brodsky wrote:
> On 04/12/2025 09:21, Jinjie Ruan wrote:
>> After switch arm64 to Generic Entry, a new hotspot syscall_exit_work()
>> appeared because syscall_exit_work() is no longer inlined. so inline
>
> Before this series the call to syscall_trace_exit() in el0_svc_common()
> could not be inlined, so "no longer inlined" doesn't seem to be accurate.
>
>> syscall_exit_work(), and it has 2.6% performance uplift on perf bench
>> basic syscall on kunpeng920 as below.
>
> That seems strange. syscall_exit_work() is only called if some flag in
> SYSCALL_WORK_EXIT is set, which means that we're doing something special
> like tracing. That shouldn't be the case when running a simple perf
> bench syscall.
>
> Also worth nothing that its counterpart (syscall_trace_enter())) is not
> currently inlined, the asymmetry would have to be justified.
>
>>     | Metric     | W/O this patch | With this patch | Change    |
>>     | ---------- | -------------- | --------------- | --------- |
>>     | Total time | 2.171 [sec]    | 2.114 [sec]     |  =E2=86=932.6%    |
>>     | usecs/op   | 0.217192       | 0.211453        |  =E2=86=932.6%    |
>>     | ops/sec    | 4,604,225      | 4,729,178       |  =E2=86=912.7%    |
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  include/linux/entry-common.h  | 63 ++++++++++++++++++++++++++++++++++-
>>  kernel/entry/syscall-common.c | 59 ++------------------------------
>
> These changes are purely generic, surely all architectures using
> GENERIC_ENTRY should get similar benefits (assuming LTO isn't used)?

Correct, but as you said this does not make sense as the syscall exit
work should be rare.

Jinjie, can you please figure out which TIF bit is causing this to be
invoked?

I have a suspicion that it is TIF_NOTIFY_RESUME. If that's the case
you're seing the RSEQ overhead, which should be completely gone with the
rewrite that got just merged into Linus tree.

Thanks,

        tglx



