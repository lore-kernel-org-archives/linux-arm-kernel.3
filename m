Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEAFEC02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 14:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MqbC9h0hn607K4Ewdqlu+9qs+7+DikbnXyIiUIob8m8=; b=IQdi1tg1R0LMGbM5MbxAn1YpqU
	PCVolLflM1BtrwDWFaJcNKqKzmlImHyOzc8RgoongK3mgSN1YU/NAvHIMJZr+hQnSWCLQmN9RvR0r
	Qj0cPShAW9HAjjLHD0e7vwt5iqnbxTUTwwI1wFpVsrC1dAGHZVZutMapG0XvhWe5Brt4GuxTJ6Tpn
	Xz8EgpLFWUeT41tVtFC3cnNdMVYg0nZxwJeL5OflqWmfwkKo8cHWldG80qT1gTdPfn6kvKFZgA6WP
	rmobtDx5nzIq756fzWyPkJu0Pjn7lltraaD7Hm/qGsW9fdPPhIB+sF6qme4fIvyWKpVxsrHoT/Tpw
	i88tDrxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLYP-00000005Qpq-0EHT;
	Mon, 13 Jan 2025 14:36:33 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLVm-00000005QQ6-0Apx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 14:33:51 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4362f61757fso41861755e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 06:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736778829; x=1737383629; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MqbC9h0hn607K4Ewdqlu+9qs+7+DikbnXyIiUIob8m8=;
        b=tG4eM+1BhqrTYRWeAF+OxPoMfBwslr6/MQ2hkyVUtEocxQVC1YH8CQMzABM9283wIt
         U1mXGqwHBr88bP81DkoK6JDY3M+Fr8nxbZaDF8qe0E/WmpkJsJwg7ZzesCk6uH6usyP9
         4ai5pIAXpLORJwQ4Bfusa8iWRhCzHOpi6uAsoLAIZaGoLyEw5ss8KK9csUr0s7ft5iHx
         M5JXOm/JreEnH9F97WeFjisX09J3lOz0BtivdFPlUnGEHyk7YlkGBJglRiaH01oXvgGj
         6XXlHzgPFt7WTet2FujbH56ulrWanU2UeSyHh1EGgNSGTc92czVHGJiVIVvXWEKUG0D6
         0Vvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736778829; x=1737383629;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MqbC9h0hn607K4Ewdqlu+9qs+7+DikbnXyIiUIob8m8=;
        b=saRKJoLWqBhC5rmIY6ste7uugZYDZ+ZychCOuad8+4Wg3RJqiDu1Qn/pVQlGkAMuvD
         s+FX8RFV1SX9IRojW2nUXHlby2USpRM88K68XqSj6nSngeELpSTRqGATSxbx7IwO4NSz
         9n7ZQY4Xc+2Thq75+r+X2lvmyFUbb4XNDAGM00sse2AHVUD6pSSdNkaiRSQecRVVlL1s
         bRYazVg8Q5O9iNVbjvF8TsWgh65fVUrlom6TQiDxLK+9MfOBr4jnQaNtR4FDvukL3GdQ
         tUSAq6kN83dw9R+Q+RBi28jPtHq0EXfiWmFtK5yv/GjIJb1bBSOWl0+kWErQNrgzXNf+
         S9/g==
X-Forwarded-Encrypted: i=1; AJvYcCWr9QWLhzYeVsYlVRdMTUtwoaljUx44uJRIbjSWe0Di9pP+MAW6YvKpn93aXL4lfyfJO4rE8yqU+MUH9neCh7jO@lists.infradead.org
X-Gm-Message-State: AOJu0YwQEUHDEmXAxh3TeRH7JKAaOSlClQKlNgKSY8fu7b0QjvhjFINZ
	EYr6RDz0/+hx3N/A1hvzbrzmmGTP+05hMNS6aM6dhSQ3iaRlW6ObP86gTbbmnEQ=
X-Gm-Gg: ASbGnculpLpKvQYZy6BJYAwYnre9WBDHnnyCXHO0O4LVSqJ61cbU8C8YVqttXpGAwl3
	Fgw9cJgTVlLecHJZ9KIL4uAvYBtWKe3lAjYvlh4mVw9NUmKxZmKdeFaNWmTBHHoL4xjC84DhCt5
	7R7mF9IZXwoN+skVM3QL7kmMGUH8XoLnPAWNHQqRgUGaRJKUtTLt23HkvKhBH6Z25re6V8D47au
	qRZtXnonNctGw8bLEfHhYVrNZXL2PUXKbQE2NJuaugxaItucDyoiBqCUHoMoBepCtDN
X-Google-Smtp-Source: AGHT+IH09rhSt7io4S7fN4A/EBvnW9x8LDmprwxYrp67xLY37+QhpKW/LvjLTHUaqq4ASbZ5AEkR2A==
X-Received: by 2002:a05:600c:4511:b0:436:5165:f1ec with SMTP id 5b1f17b1804b1-436e271d428mr208866655e9.30.1736778828577;
        Mon, 13 Jan 2025 06:33:48 -0800 (PST)
Received: from [192.168.68.163] ([212.105.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e6263fsm149061365e9.39.2025.01.13.06.33.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 06:33:48 -0800 (PST)
Message-ID: <5ea201e5-6ab7-4935-a8ce-20f67f3193c1@linaro.org>
Date: Mon, 13 Jan 2025 14:33:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] perf: arm_spe: Add format option for discard mode
To: Will Deacon <will@kernel.org>, namhyung@kernel.org, acme@kernel.org
Cc: catalin.marinas@arm.com, kernel-team@android.com, robh@kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 "Liang, Kan" <kan.liang@linux.intel.com>,
 John Garry <john.g.garry@oracle.com>, Mike Leach <mike.leach@linaro.org>,
 Leo Yan <leo.yan@linux.dev>, Graham Woodward <graham.woodward@arm.com>,
 Michael Petlan <mpetlan@redhat.com>, Veronika Molnarova
 <vmolnaro@redhat.com>, Thomas Richter <tmricht@linux.ibm.com>,
 Athira Rajeev <atrajeev@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, irogers@google.com, yeoreum.yun@arm.com,
 mark.rutland@arm.com
References: <20250108142904.401139-1-james.clark@linaro.org>
 <173652065683.3245172.11665292685923367751.b4-ty@kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <173652065683.3245172.11665292685923367751.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_063350_093435_EB485B95 
X-CRM114-Status: GOOD (  15.58  )
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



On 10/01/2025 4:22 pm, Will Deacon wrote:
> On Wed, 08 Jan 2025 14:28:55 +0000, James Clark wrote:
>> Discard mode (Armv8.6) is a way to enable SPE related PMU events without
>> the overhead of recording any data. Add a format option, tests and docs
>> for it.
>>
>> In theory we could make the driver drop calls to allocate the aux buffer
>> when discard mode is enabled. This would give a small memory saving,
>> but I think there is potential to interfere with any tools that don't
>> expect this so I left the aux allocation untouched. Even old tools that
>> don't know about discard mode will be able to use it because we publish
>> the format option. Not allocating the aux buffer will have to be added
>> to tools which I've done in Perf.
>>
>> [...]
> 
> Applied driver and docs patches to will (for-next/perf), thanks!
> 
> [1/5] perf: arm_spe: Add format option for discard mode
>        https://git.kernel.org/will/c/d28d95bc63cb
> [2/5] perf docs: arm_spe: Document new discard mode
>        https://git.kernel.org/will/c/ba113ecad81a
> 
> Cheers,

Thanks Will. Arnaldo and Namhyung, are you ok to take the Perf changes now?

Thanks
James


