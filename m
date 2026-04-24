Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC087FED3FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 18:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vwajK7fE/xSxkYUMIjDnVxjmAHQBthF3xbKoitB/mqA=; b=xhfuTaFIuGGV/q1I5lw3IghtY/
	Zk6W7bfTbyjtjrB1T1Dcw0EPqEgDFth9RsoIZpyPJCOrcjhRVcpxR2mV1OWXFV6qclrKK/AwixXCP
	FJiMo5BTc6Y6cytEo7NnzaXFdjb2icHwch3QiuhuJTgKl43O3UKwb02a1S/aX5rS/TnbF291jFsB6
	K/+2nIH8J3FmDYL3rmdBV7kbZrMONOL5zawIc09XoESvY1CnqkelSovQ1R3L7J/TekFKhu6jEaDEQ
	ZJlEwxoTXHuOnvGr2c51LWYExeU1134deeg/0SeVTRnAHXZoOVvFnpCNDWUCeCpl36MOvUisEdEQg
	ip/ibgcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGLfR-0000000DfSE-2P4G;
	Fri, 24 Apr 2026 18:54:21 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGLfN-0000000DfRs-08Wy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 18:54:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vwajK7fE/xSxkYUMIjDnVxjmAHQBthF3xbKoitB/mqA=; b=jxiKcELyUOnwZdMhYogsS3eKzz
	8ULx/9UH9pQeTcaFWe+TMv98to+FLm13JmjIQB2RCOf6nsYEkuhLclz11KvEilXxsH9+1syjDdv12
	kLrur/lUVwx7sZO5j+jPP0k2sMKu4rodgSyyGKl29akb4VCc2O0yz2pEAfgWpkAaF1brQmons02Fp
	LWuSF79Qp0dyFJ01vc0pqUONDdjBKKFZPRmuLyomrCNV/aNr9DvMuEBQ0MA/OazT2gkUUnsbyOi0l
	Bm3YEMMXExEnnY9+S5rbdSiEdS0SuCTRUO2J23llRmM+AHazn0FxGufOMZp0S7sIAOyHkE5ayxCQf
	X2sVCdAQ==;
Received: from [187.57.76.96] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wGLef-001iyP-V0; Fri, 24 Apr 2026 20:53:33 +0200
Message-ID: <7c240ce3-dc27-42a1-a21d-d677d9822638@igalia.com>
Date: Fri, 24 Apr 2026 15:53:21 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] arm64: vdso: Prepare for robust futex unlock
 support
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Carlos O'Donell <carlos@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Florian Weimer <fweimer@redhat.com>, Rich Felker <dalias@aerifal.cx>,
 Torvald Riegel <triegel@redhat.com>, Darren Hart <dvhart@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Arnd Bergmann <arnd@arndb.de>, "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Uros Bizjak <ubizjak@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 kernel-dev@igalia.com
References: <20260417-tonyk-robust_arm-v1-0-03aa64e2ff1a@igalia.com>
 <20260417-tonyk-robust_arm-v1-1-03aa64e2ff1a@igalia.com>
 <e0ee43e3-725c-4b99-80b3-956d24beb1c7@t-8ch.de>
 <1a06fee7-65ff-4828-85f1-e3ee1e82610f@t-8ch.de>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <1a06fee7-65ff-4828-85f1-e3ee1e82610f@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_115417_410165_165D1767 
X-CRM114-Status: GOOD (  13.11  )
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

Em 22/04/2026 10:17, Thomas Weißschuh escreveu:
> On 2026-04-22 15:02:45+0200, Thomas Weißschuh wrote:
>> On 2026-04-17 11:56:10-0300, André Almeida wrote:
>>> There will be a VDSO function to unlock non-contended robust futexes in
>>> user space. The unlock sequence is racy vs. clearing the list_pending_op
>>> pointer in the task's robust list head. To plug this race the kernel needs
>>> to know the critical section window so it can clear the pointer when the
>>> task is interrupted within that race window. The window is determined by
>>> labels in the inline assembly.
>>>
>>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>>> ---
>>> RFC: Those symbols can't be found by the linker after patch 2/2, it fails with:
>>>
>>> ld: arch/arm64/kernel/vdso.o: in function `vdso_futex_robust_unlock_update_ips':
>>> arch/arm64/kernel/vdso.c:72:(.text+0x200): undefined reference to `__futex_list64_try_unlock_cs_success'
>>> ld: arch/arm64/kernel/vdso.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `__futex_list64_try_unlock_cs_success' which may bind externally can not be used when making a shared object; recompile with -fPIC
>>> arch/arm64/kernel/vdso.c:72:(.text+0x200): dangerous relocation: unsupported relocation
>>
>> arch/arm64/kernel/vdso.o is a kernel object.
>> __futex_list64_try_unlock_cs_success is a vDSO symbol.
>> They live in wholly different objects, which are never linked together.
>> Look at VDSO_SYMBOL() to get the offset of the vDSO symbol in kernel code.
>>
>> (...)
> 
> The diff below shows the idea. Compat code is not fixed, and I didn't
> even try to run it. Also please use CONFIG_COMPAT_VDSO over plain
> CONFIG_COMPAT.
> 


VDSO_SYMBOL() did the tricky, I fixed this for the v2, thanks Thomas!

	André

