Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074EAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 19:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nfQ9zgkT3aT8H14uNPHLZ8/j4bpyM4lzgfsqYe3S6Vc=; b=YWwaf8jrsr1ZcPUL5ebIr0lt9y
	M/4s75d0XbOaYufCWXMgnIbohmcmgVzHLIpfaxiTuogEJ7K+ddzTzq82l5HSaCZykQ2cfG+FdCNMY
	Z1xUz8+L48lGVbxEKZlT8SkTCb8gWaOtUMvTAJvsXb0i1rkovnMx9z+qnIdK6AYWNKEnyV26hDLUI
	s9qyy+C4DQDNc0haz3MleZI3fpWVCnuQzLndBPYiCKGo5SLFmUYuGm0SBqdWMZdt9VHFJPeTCvSjV
	1kgf7PO6GBcw2/B/iwf60/wnTAyvKU8E3TsFokKlBxC4k/GxAH6ZCTAviQR9rXps9qlVNYtSI8lZz
	fCBHskPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgobz-0000000DPIe-3ymw;
	Mon, 06 Jul 2026 19:04:11 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgobx-0000000DPI6-3XQY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 19:04:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nfQ9zgkT3aT8H14uNPHLZ8/j4bpyM4lzgfsqYe3S6Vc=; b=KpAuzBeBJtQ64gMrvuYN/20KRv
	zq/lmv0s3X0jJ7Jr0n9YSIX/WC9XRI5KFZRYy9Y02wnbDEywUXMugU8USNGZTsUlPp5wyZbxV2ly4
	3U9pihOJ26YKM4PCrNeBcrqyHgMVksn/wNIe3aeGh+/3/MjeH07bUNz7whObLZso3IUEgVdz5Vl77
	8B5IUmdc7CVlZW091q89uIQvg0wvPaxnk0DqARUO/BFhMMM26oma0LV85Cwpys/xUh2y2twkT7/aK
	a86HIfK1LkTrxQ7JCPlLnPN8h3Ho5UK5Uu9NrL5XnToj0xCQxcrICbBvA1PckDP1GKNtLW5Iihzb1
	fk0si0Bw==;
Received: from 189-68-33-146.dsl.telesp.net.br ([189.68.33.146] helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wgobf-009swn-HG; Mon, 06 Jul 2026 21:03:51 +0200
Message-ID: <39c3f5cb-5b56-423b-b679-eafc67bbf44f@igalia.com>
Date: Mon, 6 Jul 2026 16:03:46 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] arm64/entry: Unify user mode handling
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Carlos O'Donell <carlos@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Florian Weimer <fweimer@redhat.com>, Rich Felker <dalias@aerifal.cx>,
 Torvald Riegel <triegel@redhat.com>, Darren Hart <dvhart@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Arnd Bergmann <arnd@arndb.de>, Uros Bizjak <ubizjak@gmail.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 "Liam R. Howlett" <liam@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, LKML
 <linux-kernel@vger.kernel.org>, linux-arch@vger.kernel.org,
 kernel-dev@igalia.com
References: <20260705-tonyk-robust_arm-v4-0-e0fd0fa259d3@igalia.com>
 <20260705-tonyk-robust_arm-v4-1-e0fd0fa259d3@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20260705-tonyk-robust_arm-v4-1-e0fd0fa259d3@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_120409_881471_51CBDA20 
X-CRM114-Status: UNSURE (   9.65  )
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

Em 05/07/2026 14:56, André Almeida escreveu:
> Currently, arm64 has two functions to prepare and handle context switches
> from userspace: arm64_syscall_enter_from_user_mode() and
> arm64_enter_from_user_mode(). The only difference is that the later calls
> rseq_note_user_irq_entry() that sets rseq.event.user_irq as true.
> 
> To ensure that futex_fixup_robust_unlock() works correctly, unify the
> handling from user mode functions into one that always calls
> rseq_note_user_irq_entry().
> 
> Other architectures calls irqentry_enter_from_user_mode() for syscalls
> and interruptions, that sets rseq.event.user_irq as well.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>

It turns out that this patch is not needed at all and 
futex_fixup_robust_unlock() is already working correctly for arm64. The 
user thread can't call a syscall in the middle of the vdso function.

