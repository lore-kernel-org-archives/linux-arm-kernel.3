Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C7BCC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 09:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4WTZwbHgMA/G7V8SEEozrrVbUbsFcp4zLLIj1B5X1kE=; b=2r7n5h72jEVmFMW7P+hzze8Mz0
	ke4dbEvXAdlZ5seVYFeleujPCV1L7g93Oud7ZywE3c7rLu4gol4315zsgLdTSt4M7G3SuqY3gDqGB
	TS87m7yLcx0AP4k3MU3aq4lspxaaydt4i8RmOfg5yv+1M4pAQjTxmBq/ZKqH4MvnMu7XhvwiOY6yV
	+OJOBde2puapOBCIvXfuc7RC3rFVQWyFHsVbRR0S7Epa8z7pzpDbLEcMg7P9WW7SEXLRz4MRA2F8l
	aPp2Rp/QCpSZnUj9V+aNEQ1XSeogR4dD2hysbFaJ60pXNB/hatSDzgi4UuncGDs/5fppdYvuh+Jrz
	ZoUFqgkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wunuV-00000002LLl-1NLW;
	Fri, 14 Aug 2026 09:09:07 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wunuS-00000002LLE-1w7R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 09:09:05 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso7723135e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 02:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786698542; x=1787303342; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4WTZwbHgMA/G7V8SEEozrrVbUbsFcp4zLLIj1B5X1kE=;
        b=zDGQtICR43pFCUWoSsX99B9FqA6lmZnuRufPQuCyvdrweZCEXTHfocTia5lJ5ar/+l
         z+X6DigYNUEoMGmYxN3H1MEvUv+23r7WwyaQlUWoQVOMuXy1e0PeBKGg268XU/blNkLj
         aQMtQkm5V0jcFRg/WIVvBb4SpsKoz8SGz+Iz5D7aUd2fjzCy80fE/fFPOFvJxrjxXdwf
         H8twqSi/Ezi0VuWSe0U2+dnhZAx76zSrqF0G6RuOAlw12qw5b1HUDyeh2/IwETmOmMfl
         j+NETLoq03GN2q5XnvwMGo4GTZpJsBxqmb0DBU6hFWdf9OZIWnbO2WLyk80Xi8TgmbHc
         b4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786698542; x=1787303342;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4WTZwbHgMA/G7V8SEEozrrVbUbsFcp4zLLIj1B5X1kE=;
        b=aYPLfe8pruYAODu8Dm+psqQGVg+scpRzlTEbety3sEpGlJYaT3j41NCAJMarfsDN2K
         gA8Qsevfaq3OVSfrJYF474AdGqgbBK/D7StFI1VD3wsfIpKZU27hBrO51igP/TtzxYLZ
         v6T7+dfjRyrZCMdxsWQnDcMnSwPSgsHGCOqCm6JbtQRqHxpflmOl8J2GergNNc4+OKyw
         b/Ls6rU/F0Z6qSMYY8d79WIRScIyhPI/ndWD3EAfeAXyDa0y+j5Y0gxsc8GBM6KUOnqU
         RtGG6QH3VbNVzgzozY1w0il2jjcib3xDlIIEhTcTYRZA43NfG/T5FoV5SfqUynvWJRpD
         0CNw==
X-Forwarded-Encrypted: i=1; AHgh+RpYOBKiqkRdOWDXZtFjH1LO/4Iee8QgapnbVPFJSwfaNlq2Nw5uC5R6DBm5YPqOVtNc2BUT61Z3tH4T93G75cfy@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1/EFVyeBkmA0hXSsgh1ydl3BACgAmjrW5BExjnERnQECZzJ3+
	+T459RnKNq+zh4vaWxn4NGxiZn9RfNzfTVZSZ8JsLt+PCr7DX65M3tWvqmuQRq1GEfo=
X-Gm-Gg: AR+sD10d2pUrzo2kpcvPdDna83kXnI4Oy599MXyp7wVSqmAmZT4MzrFa2lz5n9Wvw72
	l905fNBE33e4hqMhpsvAfTPn35jhXwrTVW/3a7qmNbAtFFamU9KBHJxDxE6HQ1Gjdn4FeWQ/kaz
	r95VwpF5cTebqr4Q3Su0RcR5VxFHinoSYz3W+E2ZZwfZ4HOTcRchkRrHH/Ca9JEDq+ZkRzm4qJT
	R6e1r6xH63veYiYhjGXYvFZfWOOlT8nI56SC4+09K+qmyeuvbQbA6Bt2jLHOfJSX65gqrsqe+jk
	lbeIeC7/HDNS78sb0jHijqH/xOezfSQS31nCB2N3TAROmAUdJJz/PH25MH6Y3QmfPJq9FQJs2JK
	hSIrYzgHj8hRafiihqXUveJSch0054vK14uNi2rQKJPCYxNKOtbm+uw/YKd3aRASTVkrmHfQ4uR
	QIWxr0bScsnhcEzdRtkQHyAqliTHVADifGyJx2pzuafClrcKwToWJE8x9ZrsUl3sqRKQ==
X-Received: by 2002:a05:600c:5715:b0:499:5e50:5be9 with SMTP id 5b1f17b1804b1-499879af71emr44054715e9.16.1786698542541;
        Fri, 14 Aug 2026 02:09:02 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49988b24746sm58966465e9.12.2026.08.14.02.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 02:09:02 -0700 (PDT)
Message-ID: <dcea48bc-6a64-413b-acf5-9783f979ab6d@linaro.org>
Date: Fri, 14 Aug 2026 10:09:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] coresight: tmc-etr: Prevent per-thread events from
 sharing a sink
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@arm.com>, Suyash Mahar <smahar@meta.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Qi Liu
 <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
References: <20260728-james-cs-multiple-per-threads-v3-0-6aee7579f1dc@linaro.org>
 <20260728-james-cs-multiple-per-threads-v3-4-6aee7579f1dc@linaro.org>
 <20260813160504.GC8904@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260813160504.GC8904@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_020904_533123_6DEF47A6 
X-CRM114-Status: GOOD (  30.13  )
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



On 13/08/2026 17:05, Leo Yan wrote:
> On Tue, Jul 28, 2026 at 04:00:16PM +0100, James Clark wrote:
> 
> [...]
> 
>> The identity and compatibility of a session are determined by the owning
>> process, the target process, and the inheritance settings together.
> 
> Could you elaborate a bit on the session model you are trying to support
> here?
> 
> My understanding of a legacy sink such as ETR/ETF is that it can be
> owned by only one perf session at a time. Multiple events belonging to
> that session may use the sink, but an attempt from another perf session
> should be rejected with -EBUSY.
> 
> For per-thread mode, I wonder if we could support _only_ non-inherited

non-inheritance is enforced for per-thread mode in the perf core. So we 
already don't support it.

> events. In that case, we would not need to determine compatibility based
> on the target process and inheritance settings.
> 
>  From the patch, it seems trying to support a more flexible model, where

I don't think so. It's actually less flexible than what exists 
currently. Currently we only check the PID of the owner, and all sharing 
is allowed. That means there are a lot of combinations of things that 
result in sharing that are invalid. For example PID re-use and 
incompatible per-thread events, like the original bug.

> an already active legacy sink can also be shared by another perf session

There isn't any sharing with "another perf session", unless there is a 
mistake somewhere? Checking that the owners are equivalent enforces 
this. Or do you mean another event owned by the same process?

> and also support inherit mode for child events?
> 
> Thanks,
> Leo

We need to fix the bugs but still support one process owning multiple 
PERF_ATTACH_TASK events, because that's what you get when you do this:

   perf record -e cs_etm// -- my_task

Perf doesn't do one per-thread event here, it's is still 
PERF_ATTACH_TASK, but with a separate event opened for each CPU. So we 
need a model that still supports this to not cause a regression, but 
doesn't have any sharing bugs.

I'm not sure the exact model you had in mind was that still supports 
this and fixes the bugs? The one in this change is pretty complete and 
only does 4 comparisons, which seems quite simple to me. It only has one 
shortcoming that I'm aware of, that it doesn't take into account the 
cgroup settings, but I don't see a use case where that needs to be 
solved. Even if different events with different cgroup settings should 
would follow different processes, the owning process would have to do 
something quite crazy to get there.




