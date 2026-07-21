Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE312C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 09:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1c85gg17qOp2jVI8fhxIGgJrpPOSpSPj68RXsM9YqFQ=; b=XTPCUZh6eijvhG
	2wtdQzsPvgt/ZzP4QEfi3hyYoVNFG9f+w0Hqv2aYFTfITpbCxrmaboeibnay7MMfpERWsOImrzMBa
	6YV+wvtsehUdAT0P+6KzxIybk1uCN8qGdEy9F8tDscr27W7EPgeOyUfOyKxMUbQM5YWa6iWVs+w3B
	N7gUqrfYlsFg+Y459G32CNMcnpS2aS66hXq4D1xtDIqaix8gw2XK0s3Scl9X7/bfOmlaPQH7vXpTM
	ZGpPBOej4soDa/2V+9y+MZTjR813MdLD2kb3YS3WO3hlhCe/pPgO584NwGN6XDcVXXfTvBNNZ0kq2
	Mh8kwm7IC1xhMSZmg5LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6l4-00000008yq6-31Yv;
	Tue, 21 Jul 2026 09:27:26 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6l1-00000008ynX-3S0j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 09:27:25 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=1c85gg17qOp2jVI8fhxIGgJrpPOSpSPj68RXsM9YqFQ=;
	b=jIxiaBiEZUASBc8flQ1I2Kxi2AQjwRTVk+7jv2wnMBVzpgVwbrHH1P9sWOOXoQKOmfpGn8nRR
	X2lgXtHd1WrGwtiMFog4QqUZi/Gc3IoY1fNRbmS+gCErqIfBa0tXGkgqtll21JVbEXAywqIb9Kn
	rsA7SAzkcvjTsgPhf9LV8vA=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4h4BcQ1ZvRzKmWF;
	Tue, 21 Jul 2026 17:17:42 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id BE91A40586;
	Tue, 21 Jul 2026 17:27:06 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 21 Jul 2026 17:27:05 +0800
Message-ID: <4b6d760a-8270-443b-878f-37d46d9bed47@huawei.com>
Date: Tue, 21 Jul 2026 17:27:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 15/15] arm64: vdso: Expose sigreturn address on vdso
 to the kernel
To: Linus Walleij <linusw@kernel.org>
References: <20260721081858.1169276-1-ruanjinjie@huawei.com>
 <20260721081858.1169276-16-ruanjinjie@huawei.com>
 <CAD++jL=Ou_HF5VchexnjUf9qwzrz0xgY+NhA5gZhOwiwdxUi-g@mail.gmail.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <CAD++jL=Ou_HF5VchexnjUf9qwzrz0xgY+NhA5gZhOwiwdxUi-g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_022724_191724_58D4069D 
X-CRM114-Status: GOOD (  10.08  )
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
Cc: mark.rutland@arm.com, kees@kernel.org, catalin.marinas@arm.com, oleg@redhat.com, will@kernel.org, peterz@infradead.org, thuth@redhat.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, kevin.brodsky@arm.com, pengcan@kylinos.cn, broonie@kernel.org, linux-arm-kernel@lists.infradead.org, wad@chromium.org, linux-mm@kvack.org, yeoreum.yun@arm.com, linux-kernel@vger.kernel.org, luto@amacapital.net, james.morse@arm.com, tglx@kernel.org, liqiang01@kylinos.cn
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 7/21/2026 4:55 PM, Linus Walleij wrote:
> On Tue, Jul 21, 2026 at 10:19 AM Jinjie Ruan <ruanjinjie@huawei.com> wrote:
> 
>> Syscall User Dispatch (SUD) must not intercept the signal trampoline
>> code, otherwise returning from a signal with a locked selector may
>> cause infinite recursion into the signal handler.
>>
>> Provide an arm64 implementation of arch_syscall_is_vdso_sigreturn()
>> to exclude these sigreturn syscalls from dispatch.
>>
>> For native 64-bit tasks, check whether the current PC matches the 'svc #0'
>> instruction inside the vDSO sigreturn trampoline (defined in
>> arch/arm64/kernel/vdso/sigreturn.S as below).
>>
>>         SYM_CODE_START(__kernel_rt_sigreturn)
>>                 mov     x8, #__NR_rt_sigreturn
>>                 svc     #0
>>         SYM_CODE_END(__kernel_rt_sigreturn)
>>
>> For COMPAT tasks, verify that the instruction falls within the dedicated
>> 'sigpage' range, since compat signal handlers use this architecture-
>> specific page (not the vDSO) for their return trampoline. This prevents
>> SUD from incorrectly dispatching syscalls issued during signal return.
>>
>> Suggested-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
>> Suggested-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> Suggested-by: kemal <kmal@cock.li>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> 
> I'm a bit scared about SUD.
> 
> Certainly we can merge patches 1-14 first and iron out
> any trouble related to that and split this off so a separate
> series to be applied lated?

Yes, Mark's idea is the same. We can place the SUD patch here separately
and wait for thorough testing and review.

Link:
https://lore.kernel.org/all/akZgV0Y4YAmB43_g@J2N7QTR9R3.cambridge.arm.com/

> 
> Yours,
> Linus Walleij


