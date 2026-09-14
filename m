Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD20C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 14:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8rQ4wEtNnWG7AMNoujj40yCkBU87VJHpgDk71+5KS4=; b=Yf4/k5VZEv/9Ju4/CfY1o7qGJo
	ATIXsS+BvAfXZeH7johYZq7W2NJrBbWPfiyvEsbufOI9aAms81fDCr0nvI30iVjRkMm6JqF7MTA9B
	2vL7A4oXD11+1UMpCCWkrAXAz33ugdMbmgoVnLZcy8v7Qay3GW1QLCibIOZroBUv9/nxbXukoDbSC
	ts45G1S6PWbzH3PH/3tCKnFv9o4AVVVeoIr6Dm30xzxmaF/+gbEpeEyOB0L6GYJsA07C6pXyErJ3S
	f5OPNjY9yCQx29Xg2+H0Mpac1Rd4mXF3mEDLacuFWP7ZeKbggSyadj5+KFyOHJEXy5ixAXf0NmGsW
	DEJyCD/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67En-00000003u59-1vVC;
	Mon, 14 Sep 2026 14:00:49 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67Ek-00000003u4S-1nnw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 14:00:48 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48586861639so1348761f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 07:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789394444; x=1789999244; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C8rQ4wEtNnWG7AMNoujj40yCkBU87VJHpgDk71+5KS4=;
        b=eMEXESFB9UI2P1K1gIoQ5irDY/UcKR/6iOxGzvDKEFo5DywVPeX9Vn696zTanDPLU0
         nXUoYGoNj4cXrUR1KTnc80kgTCEVSq3amua+kJNKM1QQPeNw4v1cFril7W04V9yQ205E
         TJGg/6qf7nNmR/GEs9TAkeEpw8qjgCcXo0Ow1m6FBJ3rGSJwUDJiRj1tg+M7eLiGO1uK
         su4+VSqHvdTH8V82pPOklYJwc8GRVL/xh/+Q1b71Iqjse0Aors2lctLJjlQehBVk7r3b
         YvRfAYijv758hcQQrYJmlozOYxJc+CLWwGHE36rT36zEAYpRxV7hgp99DkacLqPT3SrF
         r9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394444; x=1789999244;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C8rQ4wEtNnWG7AMNoujj40yCkBU87VJHpgDk71+5KS4=;
        b=Uczsv7Yt6InOXrtSThoP6k79YQE9IwE8kw/xsVQybg1/zeeMkA3VcYONMsP7tZey/F
         nFumha4WizZuSk1C4RrnJqF5W/EnzaMwvoot5l5YWy0saT0MVEc/w3ZRH5BkqqL34rDS
         0GngxrvgWB8HLrujofJ3xCoZeqQRIMnGnP3emAN1tygKl29vqu2wUmY3TIVH1xlnSTEe
         B5DedDbqk42qo00C6fAYMj/515YFfxKwiLpe+rWr8QBJi7t1eGR6lFEYKnXcc8JgtYrO
         /umPdSacen28mP9sF+NRXzdcftln9fRTG9Ay9yZo9Bw+B0eiGETsTd8Y2KrgqGCYl3aV
         b3Mg==
X-Forwarded-Encrypted: i=1; AKwUvBxgJzDeEtt7tfE5htiB29pLVjUCgvW5PS/3ssud2x1gsOMZCrNtSuh4BqMvNo3oKhck5ac00A0GDevNDq2JS39u@lists.infradead.org
X-Gm-Message-State: AFuF++mQyyIWq9XnUuHUvuwirq3ATVrjcr8FikDoy894T4hiQXQq8nzl
	Na+npzYLk3WizA8PSY/l+meT049MObAHjRcpDKFfx8myff9fx+7GkZcfEiYb/aq2ZKA=
X-Gm-Gg: AYBFou3oOkVTe+/TlrSxGZQfQ3gPVea+aEyu35EmZCXoa3EJs87K6GeFzE32eRGEepc
	5+JF5yBW+OaXusjAfmcmzgz2vJPGpVWJEYNz+4MqmWozvKqD6/duNCW7bC3M0aqSXIA6acirj4g
	Ulex534dbnAsyF7yAuxKMn4e/i0D6WyjpwQUf7oytgbe7PdH7oE4ODrXwjx282gmRSsPiZqxpYW
	ubXEYtRrfyj9SNpICJXAM0zGpY02dm3Ja0Z/RPq3lK8U/F3z+0OtIwRqkSRPM/KctOUJSng0WzL
	3gP815ki2n/uljucMoAXqq+Z3w9Y56HLBbYVK0MHcvRixGwCpsCwMF+8wYEhHO9PCqVjkIB4CzK
	5VF6So178j4OV8ns3pkMqiFFaJxt6K0tQk5R7oqJDNcUFu01UTsVn0675/laBcA6pVehrAHSu+/
	KB1jkfnbgKiEzwBuggg5eB9t+7O6PgbWLVjVSKujH1GD6QTWumAs/F1rs4OIBAFeYfadU+VOBO8
	y9vqA7La0GOAfIq3b8Te5QkFgpHYeBUmHzXlPJy9wEgcDQFBy2aifv3sWwvMkBrGfrPEJsKC7Fx
	zGFGkpt/F3UNCgw/jsgMcVh4ag==
X-Received: by 2002:a05:6000:480d:b0:484:361a:1c7b with SMTP id ffacd0b85a97d-486fc960e59mr8495354f8f.7.1789394443934;
        Mon, 14 Sep 2026 07:00:43 -0700 (PDT)
Received: from [10.160.16.196] (150.red-80-32-100.staticip.rima-tde.net. [80.32.100.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e81asm28641670f8f.7.2026.09.14.07.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 07:00:42 -0700 (PDT)
Message-ID: <73837a51-e163-4b4e-8be2-4cdc044393b8@kernel.dk>
Date: Mon, 14 Sep 2026 08:00:41 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/15] x86: implement thread identity handoff
To: Peter Zijlstra <peterz@infradead.org>
Cc: io-uring@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, tglx@kernel.org, mingo@redhat.com
References: <20260911154148.644489-1-axboe@kernel.dk>
 <20260911154148.644489-5-axboe@kernel.dk>
 <20260914114656.GC3500130@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260914114656.GC3500130@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_070046_606421_84E9B7B6 
X-CRM114-Status: GOOD (  13.23  )
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

On 9/14/26 5:46 AM, Peter Zijlstra wrote:
> On Fri, Sep 11, 2026 at 09:40:54AM -0600, Jens Axboe wrote:
> 
>> +/* state bound to the task that neither side may have */
>> +static bool thread_handoff_task_ok(struct task_struct *tsk)
>> +{
>> +	/* I/O permissions, the bitmap hangs off the task */
>> +	if (test_tsk_thread_flag(tsk, TIF_IO_BITMAP) || tsk->thread.iopl_emul)
>> +		return false;
>> +#ifdef CONFIG_X86_USER_SHADOW_STACK
>> +	/* the shadow stack is per-thread and would have to move along */
>> +	if (tsk->thread.features & ARCH_SHSTK_SHSTK)
>> +		return false;
>> +#endif
> 
> Distributions are having this enabled, this means nobody will pass this
> check.

Ah good point, should be feasible just by swapping s->shstk,
s->features, and s->features_locked. Traveling right now, but I'll test
that for the next version.

-- 
Jens Axboe

