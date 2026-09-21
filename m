Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC4D0C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 17:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aQXqx3kypLayD7YI2GHlSyGrESOzJpPnn3LvqeJEGpM=; b=bytt7ld/3ccudavgRBYfBW8bSz
	Of6QWsnDwSqhm03WxUtVrz3KU8MhB2dzhKG1s9excEjjUW8TMRGxTqh6tSr2N+8Qfq1G1uFixArQM
	DW8cO9nmAoU3SBvXBCftiJktNqMl/sVnWv5ditkn19dHEdAPI7tPzcE2h728s/siokIrC01S7jOR1
	QKwPMHK+hxneSPkXrXQi98ImBZfM12Sp/SYdmFbhJ6stPCMX7rl1yYNjX5xoGei3g6dxlBswmkNaY
	5obBohr2+bCPBfglrPVrmDW+nPcdoDxFft43lI0a3qyiuqKZ2i5vk+CrdbLk2UceLiaAZ6JMZ0OrH
	npkbbz/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8hw9-000000030Av-1XWN;
	Mon, 21 Sep 2026 17:36:17 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8hw1-0000000309X-302r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 17:36:13 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-4b1ba286f6bso71323b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 10:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1790012167; x=1790616967; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aQXqx3kypLayD7YI2GHlSyGrESOzJpPnn3LvqeJEGpM=;
        b=L4Bd0kCdq4sdgbvCQD99i/ppZ9F0n8mFp85kUiXrPBobW3B/EsXgKP1mJpEfoBcpVY
         hdTAImYutDzGH2h+95QSoecUTm8f0e55V42p27ZEzsxDaui/dF0gD9yvdg7DoBDQTLnX
         xdT9DwmnAIczdMiPOhKrdi/J2uqxp9PVbVKItMV4ze3w7XnbzNBdAXuMI82in/trTAyZ
         CAKQJQj0mYExvFepxkHBL0euWMhgUqjwQE3/wmt/5CsYPcBytStMpL9fGKiQQojCGdn/
         B7mdEDqS0jEFoo1OcMj8B/QmKGZkBWeZL0qyBFmTUeA7EMwOy8IxxlCjLwgActhLapgQ
         b6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790012167; x=1790616967;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aQXqx3kypLayD7YI2GHlSyGrESOzJpPnn3LvqeJEGpM=;
        b=TwKNbmpD3An8IThsAdoHzrKP7jkxT/iSRbnTTukdtrRMQ6/0mNITd37Svgivv0162B
         fmy6iKPI1UZiiuliV+VBKzPmRpEoCdU0tFuWmCL1PCny31I3YRfh2GwlKk9a+4LVozy3
         /Fbrim32EF0vq58BF4yKwIfjqdsrwCpeZZlf5TQC0Gz0lqLqzow/Yp5Dh60uNTFUNdQD
         WHJmA614yj8vsrzH4a2vxqzsdm2b4hddwxp342MsN7uN8zn63Uc/wfD9QHMHtfACnxVE
         68nKwsSPnJ8ldotl2ReC/AMFBIUPNLxjC7YaAiknICdIkMiyCIus3tnhhZL5y4H4oEQG
         ySGw==
X-Forwarded-Encrypted: i=1; AKwUvBxreG/KnsxwtaaM44FkfnngxZpAcGo3vYgjjARlZyeemZ2/5G+Zru9qHFw4PBphd/llCR/MPz0twVgopHOFhJ/h@lists.infradead.org
X-Gm-Message-State: AFuF++m7EaY3u4BKgOSJX6vP4T087TXq42T9O/d02Xw3rmdSwSESKlQV
	zunW0hLZqJ6Xuv+JV9llK1COTIGjeG0+6pTnibJH7jdsraHgl5TR1eWUVc8zDVz4LSE=
X-Gm-Gg: AYBFou11+t2pSCDRq1HHY9yiAfdZkLp4NI9EqHKLf7TkZRETXT5N1deVppeHbvqRcna
	revRQYi2FSRGEIJ5IpL7074IwnY/kfPhtzBtzH2zNS6c3uwlSfA8RSDGLa6DFYJ24sz24w30kd1
	Fzx0Suu8YZGiB92OSGpNT57EHPc7JTJox+BCFj/bbf8vSAfV9vYtpYRpfVxqbmUASn8G/YTBbVk
	ib3qD5F2h6FnSHH5U56nxoCsCnKSVo3ngiZSyONah3/YIcMjdRXkeb4QvoPw/+FD/tQzE6FZn5c
	ozYPy682GJqWgLtf8pfIkp5Yzwp+ctJRsDTxicqmH6255SKeoT/aFuPEyWJfQ8M15u3kDJRTyWF
	DdwxnwNOBbxKXkqh6sZXCdTH82NIJzCriUXUgcXUkG8LEsdy31YHsapC8K494OqaxmSOfRDlCdV
	0ykk8jcWc9HngTe3qcKA3A79gCr+J3XcUZ3jqqn9OW9PJYClsi5CijgXN1dKfPGhVJte63X/syq
	n6YVajT6ML/n7MQFFE3lT5KeQ==
X-Received: by 2002:a05:6808:150b:b0:4af:aaca:7be3 with SMTP id 5614622812f47-4d43708da96mr333033b6e.12.1790012166717;
        Mon, 21 Sep 2026 10:36:06 -0700 (PDT)
Received: from [172.19.0.10] ([99.196.129.128])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d422effcf3sm704029b6e.6.2026.09.21.10.35.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 10:36:05 -0700 (PDT)
Message-ID: <9ca64fc2-c1b3-4978-8610-0c844ee6238a@kernel.dk>
Date: Mon, 21 Sep 2026 11:35:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/15] io_uring: thread identity handoff for blocking
 inline issue
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: io-uring@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, tglx@kernel.org, mingo@redhat.com,
 peterz@infradead.org, Oleg Nesterov <oleg@redhat.com>
References: <20260911154148.644489-1-axboe@kernel.dk>
 <87a4pdami2.fsf@email.froward.int.ebiederm.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <87a4pdami2.fsf@email.froward.int.ebiederm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_103609_976638_895CC923 
X-CRM114-Status: GOOD (  31.20  )
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

On 9/18/26 10:33 PM, Eric W. Biederman wrote:
> Jens Axboe <axboe@kernel.dk> writes:
> 
>> Hi,
>>
>> io_uring issues requests inline with IO_URING_F_NONBLOCK and punts to
>> io-wq when that isn't possible. For a range of opcodes it isn't possible
>> at all, as there's no nonblocking path in the kernel for them: fsync,
>> statx, openat, the *at family, xattr, fadvise, splice, etc. Those are
>> punted unconditionally, and the punt costs a thread wakeup, a context
>> switch and a task_work completion round trip per request. io_uring HAS
>> to be cautious to prevent accidental blocking in the kernel, even if the
>> operations predominantly never block. Sad story. Examples of that are
>> things like an fdatasync that doesn't block, statx that hits dcache,
>> openat for O_TMPFILE, etc. All of those would've completed inline just
>> fine, but io_uring just cannot rely on that.
>>
>> This series issues those requests inline in blocking mode instead, and
>> only pays for the offload if the request actually blocks. But by the
>> time it blocks, the submitter is deep in the kernel with the request on
>> its stack, so the work can't be moved to another thread. What we can
>> move is the identity. If the submitting task blocks, an idle io-wq
>> worker takes over its user visible identity (tid, signal state,
>> credentials, scheduling attributes, cgroup, user register state),
>> finishes the io_uring_enter() call and returns to userspace as the
>> submitter. The original task finishes the request as an
>> io-wq worker and joins the pool. Userspace is none the wiser, hopefully,
>> the same tid came back from the syscall, it's just on a different
>> task_struct. Folks that have been around a while may remember earlier
>> attempts at this about 20 years ago.
> 
> I don't see anything immediately wrong, but I suspect I am just
> not looking hard enough.
> 
> In my time working with the kernel I have never seen anyone actually get
> this kind of thing correct.
> 
> The handoff that we do during exec has a bug with posix timers that
> I think is 23 years old that we just caught, and still hasn't been
> merged to Linus.
> 
> There was the old daemonize call that got it wrong so often I added
> kthreadd.

I agree entirely with you, which is why this is (deeply) and RFC and I
mostly pulled it to (some notion of) completion so I could run some
testing and see how it performs.

> Maybe you want something like the old solaris doors, or vfork.
> Perform a synchronous task switch to this other thread, and call this
> function in the other thread.  Then block waiting on the other thread
> until the other thread blocks, or the function you called finishes.
> 
> Is there a reason you didn't try and do it that way?
> Just a synchronous switch to and from a thread in your thread pool?
> 
> You aren't changing the mm so I really doubt changing the stack pointer
> and a registers will be that expensive.

And replies like this are also why I wanted to get it out, because I
think it's a problem worth solving, and it's the best way to solicit
ideas. I think there's some potential in your suggestion, let me try and
dig at it a little bit and experiment...

I'll be back with more details.

-- 
Jens Axboe

