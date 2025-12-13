Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9827D59F77
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Dec 2025 07:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qS/a8O0BbZSZZsXyGtd7peZrK8putFww9+X+USFCeDw=; b=0XGUwfrN9Sm45wLBvvITQNRE4P
	5D19yPe8/Ux/7WD7sRbwQKSQZBclwaOGLPPT4xkSuAKvlMruQbt8XwLTLukj9WG0sX9H0Mpgbo1kW
	ogO2E3yi/vyiUM+AKPve1ZJNoX2+x0WYoH8C7UO6Jz/Lc//k0WIR/PDklpbN5MJrOR/vTvS2/nJNE
	CRqqrgMLqgQ+u9co3JVp+FOTkiV4APl8q8vl7P0tXqr18Y7kRu+7W1dXCOS78hrZC3uRCEOD/bJds
	y03Iwo0wqpzrCXCweAXJc/YcOHeQIpdsNlU6BCb8hKNIgx9pZgRE8vwSGtmWdW7Fbg8BTSzz+oUv9
	dt76wzrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUJyB-00000001Ug4-0PdC;
	Sat, 13 Dec 2025 07:23:11 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUJy8-00000001Uff-1Dbz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Dec 2025 07:23:09 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2a0833b5aeeso11101245ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 23:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765610587; x=1766215387; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qS/a8O0BbZSZZsXyGtd7peZrK8putFww9+X+USFCeDw=;
        b=go0N5Cp+tUAdNwwfF4HVpxmWlG4JmmvulDySDXfReoUiJvbbnh9LCQYsRb6mxummCh
         oUBxgYZpsJHk51j9jy7ojE1otLUXdTSD3vf96YTgGra/xonDA8Dl9z+HiQSgmQF9BKUq
         XHRzI19gZ4+YdsjLeIUyq7vm9No9Ler0KPIxIvTDpOwrYifwYPsXkDC/Cewf/PbroWec
         0Ae1hugmDs6exkYuF4UCpx44dt5VrSQ8vko2/mTPC69imIZWhXIaUNKvKTUX7kEeX0JE
         EBAt+Y7Y9En2+OQdsklEsx4lYJyp/THvpAPOfzaVtCvtQk9yuqprRAewirH3kIynGTqV
         pYhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765610587; x=1766215387;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qS/a8O0BbZSZZsXyGtd7peZrK8putFww9+X+USFCeDw=;
        b=LQEjHYg+ebXGjHbCi6GcasGyAnAgnqCUqQyddXDwFdAOLeSLptKcBrBxIhKbNOvzrg
         6KJlwQ+rvfdBf8/VAqWteJYrgkodBOTYgoKiMA8kvoWSoXdURGQBUPAI1q4i7gTzC7Ta
         pqe0AGWiDW4QnSEwOcfOaCkbb/Nu1dL1TUiswYCyv6hcKd9Gar27zJV1AcsXLmmFtFlA
         0GdGD9UpLJnFb6W+Atu3amLH2/PnN3ZWr2tGy9qmpNni9OWi3+DGHUV9vtW8nFkFo6Ns
         afqDm72UCAqY5u0TLnZjguqSZA7LnIVxnG2rhM6GEkbxy8euvb+ykSmOp6BbjYCKSKGv
         u8kA==
X-Forwarded-Encrypted: i=1; AJvYcCUlT/q/UBhULU8QJ2mhY4zmvMX+ROriequU+qod7nGIZl2Aaf4uYFLv8bXebJ5hU/2Xhnj27+kLcz77YVsdRsmE@lists.infradead.org
X-Gm-Message-State: AOJu0Yys8rsWioXxtDWNLeDz1d7Zmnn5tMxVKhdwloT+66yTv3mjC4ST
	wRSF8tfz3lFNzBKE05kWCE2WbPTO2VGKkkBqZFF+7biZ9HbvDMHj/CLV1pJXPoo5tdU=
X-Gm-Gg: AY/fxX44k7tddJhGxxkTmm9ZSMbebweZby193367yBeNkauYwpKBJ3E4jBJ69r7mQZU
	QTBdS4keTozsRX0eylvq/X6reECCqCYSkOaYOQyB84fmsWmudv9bd3O4QRi2Uf+LQnytmCBLQCl
	7XvAXNE04NVgyCawzmJLGmXEVv+u9TFOQ2X9g8X8fRHyR9YJFvqqShb48bhnUTqsRmXLDj7BGs2
	wukh/20QBXiyeE1R/KAzmrwjQXE4H4Z/x8Xcc0W84dcndt+1Cf2+GXmHvGDqFrYBfnHQAW2hG6R
	WgOqKxH2Wjh317FSULz4BqRxaiIKjGqFXuehzwror8DXHfKO6dUBsF+bVA83knPFWL3U4PibVCH
	MXY2y9iBgO64cIBM+ZN9aMl5OAfV2pdTL1nqvMsgueWTubaKKv9/t1+N0oUBqCn2AA9xKX4i6E3
	uaGpQ87bDXOjLRo6YK/vVWdeWc04vsi9ZuffwuMUypRxkZadMRtSk=
X-Google-Smtp-Source: AGHT+IF5ZAK05FTZM7z1I/Tfu2uwtqip2Rr6c/twbgvqZujsfkv8PIP29+IUmV2/Et+MT9YWs2FBBQ==
X-Received: by 2002:a17:903:2c07:b0:29d:df04:fcdf with SMTP id d9443c01a7336-29f2436dfb5mr47558295ad.42.1765610586985;
        Fri, 12 Dec 2025 23:23:06 -0800 (PST)
Received: from [10.200.3.203] (p99250-ipoefx.ipoe.ocn.ne.jp. [153.246.134.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29f2563b116sm39121255ad.102.2025.12.12.23.22.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Dec 2025 23:23:06 -0800 (PST)
Message-ID: <c3db6ccd-dfc7-4a6a-82b7-3d615f8cab4f@linaro.org>
Date: Sat, 13 Dec 2025 09:22:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/26] Introduce meminspect
To: Randy Dunlap <rdunlap@infradead.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, tglx@linutronix.de,
 andersson@kernel.org, pmladek@suse.com, corbet@lwn.net, david@redhat.com,
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
 <bf00eec5-e9fe-41df-b758-7601815b24a0@linaro.org>
 <5903a8e1-71c6-4546-ac50-35effa078dda@infradead.org>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <5903a8e1-71c6-4546-ac50-35effa078dda@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_232308_357710_85A99A57 
X-CRM114-Status: GOOD (  33.76  )
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



On 12/13/25 08:57, Randy Dunlap wrote:
> Hi,
> 
> On 12/12/25 10:48 PM, Eugen Hristev wrote:
>>
>>
>> On 11/19/25 17:44, Eugen Hristev wrote:
>>> meminspect is a mechanism which allows the kernel to mark specific memory
>>> areas for memory dumping or specific inspection, statistics, usage.
>>> Once regions are marked, meminspect keeps an internal list with the regions
>>> in a dedicated table.
>>
>> [...]
>>
>>
>>> I will present this version at Plumbers conference in Tokyo on December 13th:
>>> https://lpc.events/event/19/contributions/2080/
>>> I am eager to discuss it there face to face.
>>
>> Summary of the discussions at LPC talk on Dec 13th:
>>
>> One main idea on the static variables annotation was to do some linker
>> magic, to create a list of variables in the tree, that would be parsed
>> by some script, the addresses and sizes would be then stored into the
>> dedicated section at the script level, without having any C code change.
>> Pros: no C code change, Cons: it would be hidden/masked from the code,
>> easy to miss out, which might lead to people's variables being annotated
>> without them knowing
>>
>> Another idea was to have variables directly stored in a dedicated
>> section which would be added to the table.
>> e.g. static int __attribute(section (...)) nr_irqs;
>> Pros: no more meminspect section Cons: have to keep all interesting
>> variables in a separate section, which might not be okay for everyone.
>>
>> On dynamic memory, the memblock flag marking did not receive any obvious
>> NAKs.
>>
>> On dynamic memory that is bigger in size than one page, as the table
>> entries are registered by virtual address, this would be non-contiguous
>> in physical memory. How is this solved?
>> -> At the moment it's left for the consumer drivers to handle this
>> situation. If the region is a VA and the size > PAGE_SIZE, then the
>> driver needs to handle the way it handles it. Maybe the driver that
>> parses the entry needs to convert it into multiple contiguous entries,
>> or just have virtual address is enough. The inspection table does not
>> enforce or limit the entries to contiguous entries only.
>>
>> On the traverse/notifier system, the implementation did not receive any
>> obvious NAKs
>>
>> General comments:
>>
>> Trilok Soni from Qualcomm mentioned they will be using this into their
>> software deliveries in production.
>>
>> Someone suggested to have some mechanism to block specific data from
>> being added to the inspection table as being sensitive non-inspectable
>> data.
>> [Eugen]: Still have to figure out how that could be done. Stuff is not
>> being added to the table by default.
>>
>> Another comment was about what use case there is in mind, is this for
>> servers, or for confidential computing, because each different use case
>> might have different requirements, like ignoring some regions is an
>> option in one case, but bloating the table in another case might not be
>> fine.
>> [Eugen]: The meminspect scenario should cover all cases and not be too
>> specific. If it is generic enough and customizable enough to care for
>> everyone's needs then I consider it being a success. It should not
>> specialize in neither of these two different cases, but rather be
>> tailored by each use case to provide the mandatory requirements for that
>> case.
>>
>> Another comment mentioned that this usecase does not apply to many
>> people due to firmware or specific hardware needed.
>> [Eugen]: one interesting proposed usecase is to have a pstore
>> driver/implementation that would traverse the inspection table at panic
>> handler time, then gather data from there to store in the pstore
>> (ramoops, mtdoops or whatever backend) and have it available to the
>> userspace after reboot. This would be a nice use case that does not
>> require firmware nor specific hardware, just pstore backend support.
>>
>> Ending note was whether this implementation is going in a good direction
>> and what would be the way to having it moving upstream.
>>
>> Thanks everyone who attended and came up with ideas and comments.
>> There are a few comments which I may have missed, so please feel free to
>> reply to this email to start a discussion thread on the topic you are
>> interested in.
>>
>> Eugen
>>
> 
> Maybe you or someone else has already mentioned this. If so, sorry I missed it.
> 
> How does this compare or contrast to VMCOREINFO?
> 
> thanks.

This inspection table could be created in an VMCOREINFO way, the patch
series here[1] is something that would fit it best .

The drawbacks are :
some static variables have to be registered to VMCOREINFO in their file
of residence. This means including vmcoreinfo header and adding
functions/code there, and everywhere that would be needed , or , the
variables have to be un-static'ed , which is a no-go.
This received more negative opinions on that particular patch series.
The annotation idea seemed cleaner and simpler, and more generic.

We could add more and more entries to the vmcoreinfo table, but that
would mean expanding it a lot, which it would maybe defy its purpose,
and be getting too big, especially for the cases where custom drivers
would like to register data.

How I see it, is that maybe the vmcoreinfo init function, could also
parse the inspection table and create more entries if that is needed.
So somehow memory inspection is a superset or generalization , while
VMCOREINFO is a more particular use case that would fit here.

Do you think of some better way to integrate the meminspect table into
VMCOREINFO ?

[1]
https://lore.kernel.org/all/20250912150855.2901211-1-eugen.hristev@linaro.org/

