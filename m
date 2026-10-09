Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07ED2CA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 09:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hjjt+5c5DdZVts//sptIbu9PvjR5EqO62EChRfFRIRI=; b=q4eAb2JZ+grGQZ4ZcbKxtvmX0y
	1XtjbNR6zkEPuvbhwBpFk3aBRM0yDogxI8XBsxGBY1QrieUvTtmc18dKCE0dZmEaB/AyCEfrOtGmr
	5Y9XK/PGZoLzJcdtDUWvEbx9RnTIYoEyDlV6JM1K2xoZ18Iebsi5KUIQ9yzMtkNq+C+tQKM7cnx9f
	C/sWG0YPbdpCsVRxiAnjyKKOEc94nxl3xFGpi2RIbiNnKD6RH8fGkUuA+kX/Kb0+5QUGIK84qxXkR
	efJtsBUgNQy3lo/q9j4z3n5Y/6yqLWgBblC4VvZcmSajz9gFTBCepNbmwrZcS9om5eZ2lKzwJqq3r
	ph5AMnpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6c2-00000005swv-07pq;
	Fri, 09 Oct 2026 09:09:58 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6bz-00000005swK-4BT0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 09:09:57 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48c02782159so2563952f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 02:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791536994; x=1792141794; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hjjt+5c5DdZVts//sptIbu9PvjR5EqO62EChRfFRIRI=;
        b=YaOttrQepR37U+/RFBgTBJ7wFMUPEjydvV5Ugdp2ffSAayqcVCDu1s1KdMogfPMDCU
         F68zmAICBiDbv9Ig6n11oGRzYqDhgi949BGaHCcA0HgU5LmntZlhf3eJ6GM71KYS9vX0
         FB84R6MTG5oPbxwXiwHg/nM35vwktB2U6AkXozfGxYIfwTEGPAo84TyJ5qTowCOt3EAb
         RzM/xWQJq6+xxnRRSkH1srq/LQ6CEFrbEPrDyPkGU5g+eLgTU0+uT6Lq8URd3fR6O0Pn
         axzGM2u8Pk/4/CC3YmLN9QAEw0TM0nLMiSfMFe6E/u8zEnsRnsZqI43M5E1buDW9+fNB
         oQ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791536994; x=1792141794;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hjjt+5c5DdZVts//sptIbu9PvjR5EqO62EChRfFRIRI=;
        b=Xi392yUhp0RXKc6uEftXjKFkm95s6hCGVpffzhJ+qzJb34BltDr8KUuuxO+lPezd46
         JDumC0f/zwjFt54ESioUEFZTj23B0sY1zrwogNfs2RsszWgprtubMqUKgpY9B4+KWwq5
         M8OYbK9bLFjgS+uGdxqP4yBNWwb/0eeZtTG/re6/9tam4Yg8w3F4FwfI4tw3nBSdYzCM
         HUf78Tl1Vrnh6pTUI8eWhztVKXcLY83OdepruGJYl//33/j2UcQ4Ql/skbjK/XkOKro4
         t+Icgp0FTdwdcaPEAjrooXvikpEN2YVeZX5RjPHiJcbVxgu8QQBQTozzCs5301XAGrVM
         /Glg==
X-Forwarded-Encrypted: i=1; AKwUvBxnTo4aFkes/4G1H/UEqjvN3BtNwWqsvROmpgPb7CH09xXJlUodLnPaRxGZ7FqyCO9zPCloIrcTSnyCDFAkj7XQ@lists.infradead.org
X-Gm-Message-State: AFq9FYK4het7W8iF9UQXEIEe5fIBBU6QtJU+QVCAXGH0b5hErtcM6GMH
	BHdh5uGMxg6lWSC9ISQIUta9t30uU1abh0oQMQ6yy8Xc5HwazanS9sH3UuCl7A/2Zt8=
X-Gm-Gg: AYBFou2zQR5Xm2k1QNIRmr8L2rdo0K3PXXhO5NHYpWL4qmUUcGK7r9+A/mqlxIBSJnA
	x+ONajS8BaguXZ35JtV2n4iU8tpAls84wsibP5VkrYzqidwBA5qB2IQKkFHe+oTI7IpPgYUfrlE
	34n+shZaABQP1SjWIU7Mh6lwrQ0L4b3V+oZyu1uDu0WAL6Lhi43qFKYw+Vy1bTaa6cKD4bpHQdx
	53D2Q/9NMPWLNs20p1y7F1Q6z5EIDPbD1YQmBoWgPC8bxYZk1b/JI1QL5EVEX4oY8hcRy34MalJ
	ScFo5Eoyw3GFinAmrZEFePJGzSbjkLAe7f3vdIcZMmv7Iyp1zGChg9Elri7Pml5aZUmSQkbjU/V
	HRMi88IU5YytHwjwWrIhruIw2F1ai8jsSAA3+Gc8q+IwfuDTxH+/V+RFLXq6ukzg/5TiGRn2M9j
	3q5/wGW64Q1SZeo1AoQwsu/seqOUm5LQrq1VeiDp0dHi/6bjuaDgZcH7DxIjnj11lZR+DeMAjM9
	Sc=
X-Received: by 2002:a5d:5cc2:0:b0:488:8212:5d73 with SMTP id ffacd0b85a97d-48dbacda836mr2080643f8f.31.1791536993946;
        Fri, 09 Oct 2026 02:09:53 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e2d8fsm2938651f8f.19.2026.10.09.02.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 02:09:53 -0700 (PDT)
Message-ID: <b174823d-2e5e-422d-a958-ee11c5bfc1a9@linaro.org>
Date: Fri, 9 Oct 2026 10:09:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: James Clark <james.clark@linaro.org>
Subject: Re: [PATCH v2 07/14] perf arm-spe: Use generic snapshot search
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@arm.com>, John Garry <john.g.garry@oracle.com>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
 Leo Yan <leo.yan@linux.dev>, linux-arm-kernel@lists.infradead.org,
 coresight@lists.linaro.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-doc@vger.kernel.org
References: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
 <20260821-james-cs-unformatted-per-thread-fix-v2-7-00c4fd0701b4@linaro.org>
 <20260827161619.GN8904@e132581.arm.com>
Content-Language: en-US
In-Reply-To: <20260827161619.GN8904@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_020956_083943_2A618568 
X-CRM114-Status: GOOD (  32.85  )
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



On 27/08/2026 17:16, Leo Yan wrote:
> On Fri, Aug 21, 2026 at 10:49:05AM +0100, James Clark wrote:
> 
> [...]
> 
>> SPE also had a special fixup case for head pointers greater than the
>> buffer length, which is not needed because the SPE driver always wraps
>> them, and __auxtrace_mmap__read() handles that anyway. It also didn't
>> have the special case for old > head for when the wrap heuristic fails
>> but the pointers showed a wrap had happened.
> 
> Here mentioned the "special fixup case" is:
> 
>    if (head >= buffer_size)
>        return true
> 
> If the hardware pointer is exactly the end of buffer, it is a strong
> indication for wrapping. So it might be worth adding an explicit
> "head == buffer_size" check in the common code.
> 
> That said, if always checking the final 512 bytes, this case is very
> likely to be detected anyway, so I am not concerned about dropping the
> check.
> 

I can't visualise why head == buffer_size indicates wrapping any more 
than head equaling any other index in the buffer. The heuristic seems to 
be impossible to make perfect, so I'm inclined to leave it as is.

Couldn't you also say "head > buffer - 512" indicates a wrap? But that 
could also just be the first time around with no wrap if there is no 
data after that point. Same way that head == buffer_size could also not 
be a wrap on the first iteration. But then you end up saving the whole 
buffer anyway when *old is still 0 or any of it isn't padding, so it 
doesn't make a difference.

Really we should move to the duplicate detection algorithm like IntelPT, 
or update the driver to use a monotonic head if we think it won't break 
anything. It's so much more usable.

>> The other feature lost is that this search only looked from head to the
>> end of the buffer, rather than always at the last 512 bytes. This was
>> flawed because once head is close to the end, it's likely it could
>> contain zero padding from actual SPE data and a wrap would be missed.
> 
>> It's better to err on the side of caution and mark as a wrap, rather
>> than trying to optimize by limiting the search from head onwards.
> 
> Wouldn't this be a trade-off between missing a wrap and reporting a
> false positive wrap?

Yep, and false positives are basically harmless with this algorithm. It 
doesn't do anything do remove duplicate data, so you might as well mark 
it as wrapped as early as possible and save it all anyway.

> 
> Ignoring head makes the search overlap valid trace data when head is
> close to the end of the buffer but has not wrapped yet
> (e.g. mm->len - head < 512). That data can then be mistaken as evidence
> of a wrap.
> 
> For a false positive wrap, [head..mm->len] contains zero data. This
> should be fine, as zero data are treated as PAD packets and discarded
> during decoding.
> 
> I'd suggest adding this info into the commit log, in case later we need
> to understand these weird cases. With that:

The summaries are pretty good, will add to the commit message.

> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>


