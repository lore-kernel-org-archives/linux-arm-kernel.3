Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C30C55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 21:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=i5gQ2rzJspE7/RJU8+W1PyPQZBbheaHsGbRmii6HKrA=; b=rXlk6iJvlZZsnR
	sg42r/bBOjqEpBylP8fLNn0rimJsDkzy5o/EzXnmrUCH/UjZoAvvlwe7BFar72FLHZFogtQlucYYv
	xRirSFEsn0Mt3WMT3kCbzN4GkAdbbX9Ek5kHbTv0GgzKHC1qQmCu+EqE4a6uj0Be3sP+itW5UgxTx
	s4l3lm9rlZbDNq7ZN3qPdXK/M5os43DjUlBDeC6Hl7L8PQ+3tv8cp829IjIsC09hxyfhwxkRdCdnM
	1W4Y/b8qLSxj1hDknzv9rXp6uAEdEvYurLNJOkiykR18hJ7uGXQtSAJBDMz6ESvzGp28hGxUvwNYW
	X05mjUj8Sfa9aN8Z7nJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrMLH-00000002nfa-1nqM;
	Tue, 04 Aug 2026 21:06:31 +0000
Received: from mail-oi1-x247.google.com ([2607:f8b0:4864:20::247])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrMLE-00000002nfF-2mnf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 21:06:30 +0000
Received: by mail-oi1-x247.google.com with SMTP id 5614622812f47-4ad778bacbeso361158b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 14:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785877587; x=1786482387; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i5gQ2rzJspE7/RJU8+W1PyPQZBbheaHsGbRmii6HKrA=;
        b=VRSHWQq5DnHoY1bvMEO79MvD69uSCaZgwuHarcbuT+Bik2axyNPL9VLPUSFfBtafDl
         Bc8JUcBvsSK9OFpGBN5OQW4T/H7K/JzBA60qeTJUIwFlVNxLB5Y8j3foRYlul6K0RGTm
         GAR9l9oMJMU126wFCeK8Z0ST9SmkpRw9OVudT7+SZ5Olqxg+InJk0bPW3yi6KApuUkSP
         sKaQ0RuSfr9jmyZzXgM8dCxq90FX4oT8GQqPJG3etJ4UAWKiQazW6iQtKqWMk2uY6ocC
         v2rKWpB0ZDxGGISyfhbshBeEWCQ4jwIlnsbEtoThLNAyAHWetRDl+Teypb+M84sNOCOC
         HbSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785877587; x=1786482387;
        h=content-type:cc:to:from:subject:message-id:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i5gQ2rzJspE7/RJU8+W1PyPQZBbheaHsGbRmii6HKrA=;
        b=KTYUK3hFg3hdqixe4+qd8oYVIjSBvvgoeYdbsTeL9YyC1qsmirWJWQSpsrnjlybDlq
         BttovT3FGW4DuVW9i3tcQ8bfrvQpbhCGSeJpMCioNZv+pSCrMYOtuGdQzIkZjrcp0r+r
         vVezTjRn1+qOVlnEe16tX60DkBA/5VL7OxrSdv4uxmV3M5HfL/72yAL7T7vp8NSI/qQ1
         w9Bl9nQZ2+P4a/n/D7bEP9VDFpOfqc4w+/qydMU76zu/cpGd2EeyNdJmoWGJly0jSt1s
         JEaU6E1pm7uXjaFxnNm0UMqg7f0141l2cX7O/u2tEf/W7+pO0gk5IBRobA2FshqWTU6L
         Qbrg==
X-Forwarded-Encrypted: i=1; AHgh+RrZrzMFhUbRU5zDQTa5rCMWN3C6AATK0l10Ov1pJxQzfGiu4gJadD4/3RqhBVNWpk6lyvjuYZHIZTd5O92R1Pdu@lists.infradead.org
X-Gm-Message-State: AOJu0YxAN68LJkKnEJDzoexb8iIcS+BFtDExSw8lH2IsB7WRB3RBbABZ
	yYwSP+40OwREFVRZbPv1m7TmDhB/O4wXdub/VvWbK4LdmDBioaykodYK7i/vb58zEmy8O2bmTB0
	ThMmrUcAL1mPsPNB7FGQONOr7YA==
X-Received: from ilhw4.prod.google.com ([2002:a92:ad04:0:b0:507:c444:90fb])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1587:b0:487:61da:70fb with SMTP id 5614622812f47-4afae0c7caamr886481b6e.10.1785877586456;
 Tue, 04 Aug 2026 14:06:26 -0700 (PDT)
Date: Tue, 04 Aug 2026 21:06:25 +0000
In-Reply-To: <2941da1a-b0b4-47a6-b57c-b28703dc0454@linaro.org> (message from
 James Clark on Mon, 27 Jul 2026 12:04:17 +0100)
Mime-Version: 1.0
Message-ID: <gsntse4tvbn2.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v8 00/21] ARM64 PMU Partitioning
From: Colton Lewis <coltonlewis@google.com>
To: James Clark <james.clark@linaro.org>
Cc: kvm@vger.kernel.org, alexandru.elisei@arm.com, pbonzini@redhat.com, 
	corbet@lwn.net, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, shuah@kernel.org, gankulkarni@os.amperecomputing.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_140628_712897_8D9C6187 
X-CRM114-Status: GOOD (  23.11  )
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

James Clark <james.clark@linaro.org> writes:

> On 23/07/2026 9:57 pm, Colton Lewis wrote:
>> James Clark <james.clark@linaro.org> writes:
>>>>> When running the guest on a single CPU I get different counts for the
>>>>> same event for a single process, although this never happens on a  
>>>>> host.
>>>>> I think there might even be some Perf tests which expect them to be  
>>>>> the
>>>>> same, and this doesn't depend on whether any events are running on the
>>>>> host or not. Not sure if you ran all the Perf selftests in a guest or
>>>>> not?

>>>> I'll investigate but I'm not sure perf is intended to guarantee
>>>> that. perf stat just runs the event counters but may not write or read
>>>> them at exactly the same time.


>>> Is that true? The perf core calls perf_pmu_disable() when a process is
>>> scheduled out before reading the count of each event of that process in
>>> an inner loop. The perf_pmu_disable() clears PMCR_EL0.E which freezes
>>> all of the counters so they can be read out in a consistent state.

>>> It's important that they're all stopped at the same time because
>>> counters might be used in metrics as ratios of each other. So I think
>>> it's deliberately designed that way and appears to not be working in a
>>> guest now.

>> By default I think perf assumes events can be measured independently, If
>> you want to guarantee events are scheduled together to avoid measurement
>> skew you need to make sure the events are grouped.

>> The common way to do that is with {} around the event list:

>> perf stat -e {branches,branches}

>> Please see if that resolves the issue.


> Groups only change how the events are scheduled, not how the driver
> starts or stops multiple events running on the same PMU (grouped or
> ungrouped). In my repro I had less events than counters in HW, so they
> will always be scheduled at the same time regardless of grouping.

> I did notice something extra though, you have to first open some amount
> of counters, and then open more than that. Then the second time the ones
> with different counts will be however many were opened first time, as if
> some state has stuck.

> For example if I open two counters then 6, the first two always have
> different counts the second time:

>     $ perf stat -e branches,branches true

>     Performance counter stats for 'true':

>               106129      branches

>               106129      branches



>     $ perf stat -e
> '{branches,branches,branches,branches,branches,branches}' true

>     Performance counter stats for 'true':

>               117013      branches

>               117013      branches

>               110364      branches

>               110364      branches

>               110364      branches

>               110364      branches


> After opening 6 again a third time they'll all have the same counts.

Interesting. Thanks. To clarify, is this happening in the host or VM?

