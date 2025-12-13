Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87870D59F6D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Dec 2025 06:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OSPLFg4W3QR5ByFn0Z+25izVWJy4kGkKLbWih19PHZA=; b=irVkBMNKMFO6EZt+UIpPqT2xPH
	J2+VqxV79+wPwqN8U3LoY28zrCStNA5TpDw/VZ4jDmNZ1LZoibUvwUi8rBhXtzmhSJM4wMQ0RUp3f
	ztCHKJj/KO6v/wGsgXeuz/PfsgRsxoaAUqI9ENAWWYxasusLdTM28ifNdgN0a0TM/GsdVghuOM4/a
	NXNEkSeZaKGxdv+AWBVQxYmwccFo07PsbxEW0FelLo0L0kFP26DE9iwnu0ZN2KzwPTIgPbC8TQ5mM
	4j1hn6TGs9uHilmmuwhN917knyBeAoZWIUgaUT7rTzcAhKzgF2vOZ8mLvgHsPhV2WCI5AnK45xhy3
	MnMUJQ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUJQt-00000001TPe-3I2M;
	Sat, 13 Dec 2025 06:48:47 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUJQq-00000001TOo-0UEl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Dec 2025 06:48:45 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7b22ffa2a88so1834579b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 22:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765608523; x=1766213323; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OSPLFg4W3QR5ByFn0Z+25izVWJy4kGkKLbWih19PHZA=;
        b=IL6ah5sc9IFgSwz4GJehzFqEc82N2G6megZwztA5valPzbnJmnvRKxXk+hx029fQp7
         BO8y5O0dgVK/SBfSM7bNL1D0aKl28Kr5yLSWRJuwkzg1R5yyaD+/8JrK55PNFcd0KbTc
         evxFn0N5F01yGOswcVbPLYo5G4rL2AViiQQw0OcFEwV+UmtRh//i88d3jf13CmxBbA/1
         cEKV33wgOrbd7AwOorrXZNVCBoz0z1vXboG5hdIfM2RWcE3G0KUOM/I3HV4r/ZDLUG2z
         BuW7QG3aJeyOtVxapoPW293YpI3fu0k6Rrjw9M9EUfxjSnCGk10f/LFngacobO4Sv7es
         DTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765608523; x=1766213323;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OSPLFg4W3QR5ByFn0Z+25izVWJy4kGkKLbWih19PHZA=;
        b=Vm0gkDmcn6gpTAlswXmwogS8sH7gq0QL8OfoFufTxxE29t7Js2hVB9JRgr1jnSINYD
         O1YYNIKHGHLxqhZ2O5N1T334LP7uwQnYHXR8e3FBCNq46rAUeOBw+1CKv/UqI6n8Tqua
         8LAsgt/UVEE9eCa5EJtsgdBRIc7lpSSvqxL5RAf+ZPa7kyOub+bukvs3FJFeVK9uG4d3
         D8vlh1PjQ56IARiDoreJdEb7eJPevjgRzIWnAdUAifEzMkYNm/70CYLV636+SWIg4Bly
         DBzha0bFuBzvBJSbKNH7rxve7PYFTOIra+tMPRlqMta2kJZxxcAk+qTHu2hvBgMg+mUD
         RVQg==
X-Forwarded-Encrypted: i=1; AJvYcCUttOp8zKbeJ7LKJxMvfEyRSykkrVU8aVQ253yhsiFS94V2lw/YCwG/ul59UUHQkiZIZGae25Sf1PlWWRQXGced@lists.infradead.org
X-Gm-Message-State: AOJu0YxrT5ltusyEJ+L4uyE4ma3Pzc17tnYQXVKjf6ZQTpS6HfXWSQ+U
	hlKh/Bdbnl6AY/ZHNOxfnPyQftnrR8VZkAYOmulIHje4bjrYbuHc6C0VKYPpEQfLabs=
X-Gm-Gg: AY/fxX4Gx8/VdGbFzHoXBOqzuG4neuc8klkIBC9JzxjyRw88/ONbRrNwGSSXpuczOMz
	gnPl1Whr0eotxUl5j2EQziP0Mm6pWtaHWi+b5VsAdzb1+RjiDtdgwB/4Tlxz4Smkwer1Jr0nVMg
	ATSWEdXY3alYYP215qtiI6nzzDigapnH/SX4Une59JQNf+lfTo65aHuD7KErFOxFznMaELC/u7m
	kndbJdNRMjq/DEz0g/zeY2PICjT2aSidNsO9t+264MeTWun23o8hQNaqJZwcM0Qkh9UpEZc30CU
	xMYWDQf0kTh/SSmICrQfVHL5TWdT7DxdWiU3dXQsZmWUY6PmdWteZ64/ElwThXfLJz8IKqq1sBz
	JRVrnvf8SGhvHeTOesfBqKdjB0uh4eJ+0TL00eoiV56YTFYPPjWfS0z+syD4nzb5HiTHNAJFBpD
	N3lTYT2UMT7y7vD7SXQmv6z1xiQqNBs7BHBi1+9VxHZkZ2ra2xjknnJyLa87SA0w==
X-Google-Smtp-Source: AGHT+IHwMXPg7Qn0Ef9xWbq83SFpsB1sFhZLa5C8vjkRdWjkXJZFN6bz1qhctibBoHiLjB/xaNqEfg==
X-Received: by 2002:a05:6a00:1c99:b0:7e8:4471:ae56 with SMTP id d2e1a72fcca58-7f6694a964bmr3530338b3a.34.1765608522549;
        Fri, 12 Dec 2025 22:48:42 -0800 (PST)
Received: from [10.200.3.203] (p99250-ipoefx.ipoe.ocn.ne.jp. [153.246.134.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c4ab52aasm6927000b3a.38.2025.12.12.22.48.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Dec 2025 22:48:41 -0800 (PST)
Message-ID: <bf00eec5-e9fe-41df-b758-7601815b24a0@linaro.org>
Date: Sat, 13 Dec 2025 08:48:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/26] Introduce meminspect
To: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, tglx@linutronix.de, andersson@kernel.org,
 pmladek@suse.com, rdunlap@infradead.org, corbet@lwn.net, david@redhat.com,
 mhocko@suse.com
Cc: tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, rostedt@goodmis.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-arch@vger.kernel.org, tony.luck@intel.com, kees@kernel.org,
 Trilok Soni <tsoni@quicinc.com>, Kaushal Kumar <kaushalk@qti.qualcomm.com>,
 Shiraz Hashim <shashim@qti.qualcomm.com>,
 Peter Griffin <peter.griffin@linaro.org>, stephen.s.brennan@oracle.com,
 Will McVicker <willmcvicker@google.com>,
 "stefan.schmidt@linaro.org" <stefan.schmidt@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_224844_181265_F3CA6DAD 
X-CRM114-Status: GOOD (  24.21  )
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



On 11/19/25 17:44, Eugen Hristev wrote:
> meminspect is a mechanism which allows the kernel to mark specific memory
> areas for memory dumping or specific inspection, statistics, usage.
> Once regions are marked, meminspect keeps an internal list with the regions
> in a dedicated table.

[...]


> I will present this version at Plumbers conference in Tokyo on December 13th:
> https://lpc.events/event/19/contributions/2080/
> I am eager to discuss it there face to face.

Summary of the discussions at LPC talk on Dec 13th:

One main idea on the static variables annotation was to do some linker
magic, to create a list of variables in the tree, that would be parsed
by some script, the addresses and sizes would be then stored into the
dedicated section at the script level, without having any C code change.
Pros: no C code change, Cons: it would be hidden/masked from the code,
easy to miss out, which might lead to people's variables being annotated
without them knowing

Another idea was to have variables directly stored in a dedicated
section which would be added to the table.
e.g. static int __attribute(section (...)) nr_irqs;
Pros: no more meminspect section Cons: have to keep all interesting
variables in a separate section, which might not be okay for everyone.

On dynamic memory, the memblock flag marking did not receive any obvious
NAKs.

On dynamic memory that is bigger in size than one page, as the table
entries are registered by virtual address, this would be non-contiguous
in physical memory. How is this solved?
-> At the moment it's left for the consumer drivers to handle this
situation. If the region is a VA and the size > PAGE_SIZE, then the
driver needs to handle the way it handles it. Maybe the driver that
parses the entry needs to convert it into multiple contiguous entries,
or just have virtual address is enough. The inspection table does not
enforce or limit the entries to contiguous entries only.

On the traverse/notifier system, the implementation did not receive any
obvious NAKs

General comments:

Trilok Soni from Qualcomm mentioned they will be using this into their
software deliveries in production.

Someone suggested to have some mechanism to block specific data from
being added to the inspection table as being sensitive non-inspectable
data.
[Eugen]: Still have to figure out how that could be done. Stuff is not
being added to the table by default.

Another comment was about what use case there is in mind, is this for
servers, or for confidential computing, because each different use case
might have different requirements, like ignoring some regions is an
option in one case, but bloating the table in another case might not be
fine.
[Eugen]: The meminspect scenario should cover all cases and not be too
specific. If it is generic enough and customizable enough to care for
everyone's needs then I consider it being a success. It should not
specialize in neither of these two different cases, but rather be
tailored by each use case to provide the mandatory requirements for that
case.

Another comment mentioned that this usecase does not apply to many
people due to firmware or specific hardware needed.
[Eugen]: one interesting proposed usecase is to have a pstore
driver/implementation that would traverse the inspection table at panic
handler time, then gather data from there to store in the pstore
(ramoops, mtdoops or whatever backend) and have it available to the
userspace after reboot. This would be a nice use case that does not
require firmware nor specific hardware, just pstore backend support.

Ending note was whether this implementation is going in a good direction
and what would be the way to having it moving upstream.

Thanks everyone who attended and came up with ideas and comments.
There are a few comments which I may have missed, so please feel free to
reply to this email to start a discussion thread on the topic you are
interested in.

Eugen

