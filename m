Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97981C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 22:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZOSmoR2B28yyOUfdoDxFKrF9d5+8BJe7EzDO03OaefY=; b=keKHBhtznL+ol777/5hevVVVil
	Tjx2OY/gtq/XTppgKZ4Jlr/wH1RH4edEZyZJ0AZ3wU/qj/86DiDg4CriZ8DtcHwVaQlxv64i7MxM4
	F8U6et6EK3Sz2wDjmxq6/Gb93Qlq8DntwD4oytzH5/AYt63j582ZA8w2rj0s99A8CcGSMpjKmnrP4
	maH526v/L181CAyoNInTXrIKg5zhuWCXWf5toKcREXl5s8ErQlgvu68Ul0W4ptooQx+LsQAa4SY6H
	zfAyKQVrX1q6fjlZMo7vZ9vXQA4HxZOkJVl4PzJoZ7MZQOyKHKTp1LfjLPGkLBcysJx2qa/zFQufM
	uqioFBHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAaX2-0000000FpHo-0Aud;
	Sat, 26 Sep 2026 22:06:08 +0000
Received: from mail-dy2-x0e.google.com ([2607:f8b0:4864:36::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAaWz-0000000FpHJ-1Fcj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 22:06:07 +0000
Received: by mail-dy2-x0e.google.com with SMTP id 5a478bee46e88-341d0522b4dso2722222eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Sep 2026 15:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1790460364; x=1791065164; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZOSmoR2B28yyOUfdoDxFKrF9d5+8BJe7EzDO03OaefY=;
        b=Tz2uQ1Om8WiTzuzPOsB80p4izunaTtKBF8qtEdDjcut8ghJQgYqttFGt7pi5R5bO98
         tbARsvWQEfaqTPFRHnovKXsUahTqLsADT8LvmJRvxb3dR218AeB0Ni3qmTscwk+8zAMZ
         LLxBGiz30bsjw75PEEbFRYebcwN+pMZ8K/L0s/kqK5pDwv/mG01W8U1qDAN+C/gIv/Hg
         P1mUgUSq7rzQZ2Jh4sKCqSpj4/tQNkXDovzhMZeZIsEW20xaeMCwYR41VMvEMZXlJPEa
         0jRlfy4dboPICknV+v2ZqX4wlTkPoQlfr8Rikud/QCMrfTQqFgNS0pTeIrTptP5qM8JN
         +iKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790460364; x=1791065164;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZOSmoR2B28yyOUfdoDxFKrF9d5+8BJe7EzDO03OaefY=;
        b=TtPLl53F9s9rxXIFUTTLhQf2zzJY+J3fDvLAzHpi/5/kVJofMbprnlu/5FQmSS+lYQ
         RXWpBr5LUY6IP51MGm4uxfIfEqTY9I5rk8sbWxS127IHdqlfFq88xATAHyFh2oumVDEk
         s8yOvkxfW62XNagqpbyEYYhaWeM3FyC28Ub1zmRGQwu1MorTVv1oW2KsR/Uf27TCxRjP
         dhxsHdxYHqV4oih6cSrY+MmTLrgjgdFnDAaksktrZS3kneS9nldHkuDecH6Rz0iV6MmD
         0V5UIt5WY5FK/q8TYlrlgDye5SfTuvEsPBXBd0LjPyrLfomFLp0W0Osio4tq8VCcK+Dv
         Gq8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxlONM6w+mUcBYFSdfqPaVK7JEdZMMJ73P8DrUF4eEgiSSN+uzjMfLv+au/eR1kIx1xV9cNB13DCmTIKUkwRIdC@lists.infradead.org
X-Gm-Message-State: AFuF++nRiwawfqnNEAMDnLjVGKeGasZaU6xzfmN6syYflwEWtO3SL6jd
	3pDESOFIGLP+iFXCaNlapP9nqjozq+cjicRvXtV5qTJzJlL4BLkQHSNoB7jm5BLozLc=
X-Gm-Gg: AYBFou1SzEdgTg0dMs5U4oF15b/tCtTlBEz4v/KDYIBp8TsMzG0+x0+yi79Z+9jdbcI
	JbV75S/A0yv9eifCJBlbteGHusKVRHZUrjm63Lk3XiRoMKwiCapJ5ellNcIyGOEYykQh+3fuz0b
	jLTcafWXXcTJVmfnemBBEbJXIXh3CoRQ0c2LOG4UVu1vgWKLLkrC7FdQU4PhDNFIT7zzTChHQsr
	BPKzbTFF32mABVowY+ZLWd2K9LVEh87HiSe3kZCrB2AVAjDP44Gu9rgpJTqquykpuYbqoK6GIk7
	qMudEreVlGzLHPJsGp5QJxoGKMZLcnYKpE+cVZhJrLV+UGEugLYzi+L/TKiIPIT3YphhxxoGgWB
	RXvwl0EdAW5EWtELI70DMCwShXhal7yu1OlQ/r68WblGinwFomjA+Dhj0k9sHOQMHLjz22Nmu5n
	dCYzW6vRL4zj/d2u7+Pu4DaGvjGYyhiBMxjMIYgokpZygkgj/AkULHT83NnR52i/SUTYO/BzCNh
	4SKGwLl8NMp+SpD392fo2BEZqvDFAHWM+m32w7UMoVu1msHjNWbDuFyJFU=
X-Received: by 2002:a05:7301:1f15:b0:33b:bfb7:31cc with SMTP id 5a478bee46e88-342710ae1f0mr5938887eec.16.1790460363804;
        Sat, 26 Sep 2026 15:06:03 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341447576b9sm19647203eec.15.2026.09.26.15.06.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 15:06:03 -0700 (PDT)
Message-ID: <0367c089-a2da-42ad-ae9f-fc61dd220d1a@kernel.dk>
Date: Sat, 26 Sep 2026 16:06:02 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/15] io_uring: thread identity handoff for blocking
 inline issue
To: Ming Lei <tom.leiming@gmail.com>
Cc: io-uring@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, tglx@kernel.org, mingo@redhat.com,
 peterz@infradead.org
References: <20260911154148.644489-1-axboe@kernel.dk>
 <arfs_kX_gkH1o_S-@fedora-laptop>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <arfs_kX_gkH1o_S-@fedora-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_150605_616421_FAEDECD7 
X-CRM114-Status: GOOD (  16.28  )
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

On 9/26/26 10:04 AM, Ming Lei wrote:
> On Fri, Sep 11, 2026 at 09:40:50AM -0600, Jens Axboe wrote:
>> Hi,
>>
> 
> ...
> 
>>
>> This is obviously an RFC, in terms of what I'd love people to take a
>> closer look at:
>>
>> - The scheduler hook and the identity move itself, kernel/thread_handoff.c.
>>   Is the set of refused states complete enough, and is moving
>>   thread group leadership this way (the leader must stay first on
>>   ->thread_head, like de_thread() keeps it) acceptable / kosher.
>> - The x86 and arm64 register state handling. x86 refuses AMX users,
>>   and arm64 refuses SME.
>> - Whether anyone relies on a task's user identity staying on one
>>   task_struct in ways not covered above in the series.
> 
> This way may break ublk server given 'task_struct *' can be changed
> because the server issues blocking OP(fallocate, ...), then the
> `current` check in ublk_dispatch_req() can be hit.

Yep, which is why is isn't enabled there.

> Also there is risk in 'task_struct *' keyed bpf task storage.
> 
> task_work queuing could become tricky too.

Like the above, the series does attempt to handle that.

-- 
Jens Axboe

