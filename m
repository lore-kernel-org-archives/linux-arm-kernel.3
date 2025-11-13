Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8F5CD5BC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 11:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=itNJjGbKr9hOTSLlNwiZZOpbJXSs/2p7rVNvrCzyP+Y=; b=1fTXTvhZZ1Kx1u6pfAGZBDprH8
	izMBz9lNLmKoPBsUhfnrGFodXztPiHAygbNGvADL2obGRaLqHzv9as0nwhvQq4No6+TAidhUb5MVE
	DRDYdzz6gRoqkuQbEbOCx536RccuUiAwy0IPRUpV0h1dnDFwdCBSozxFOXQ3T16opbMNE1SyBHIdj
	XBz+UsFw7JMeI9/Kba1Wp713b8veOJ6/MpT1YzJCOoAWQ5viWWhUOywqmvqxsy7FaOtGrXu48vw9d
	9QVF79H35f5B2KqAyS9ldGO8r6iSeSAibL3gp0Q7b5MIsxJDAqV9nDYuqm+XCAedA56wA4tNpmH2u
	YdCm6HmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJVaZ-0000000AOm2-1Arz;
	Thu, 13 Nov 2025 11:34:07 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJVaW-0000000AOlS-2e90
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 11:34:05 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-429c48e05aeso404242f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 03:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763033642; x=1763638442; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=itNJjGbKr9hOTSLlNwiZZOpbJXSs/2p7rVNvrCzyP+Y=;
        b=URYB5/aFvtYnP431rIEp1Fz8P3XpeI49AmTMVUUR8rA2bgymyqMoQtjpZCKZzdoERq
         7hgJ5oNlnXHNVKi/Q3xA/3iLWMFa/Z+Gjk8YxD+u0CUCpC1nJB+fm5HoKJsCSWCZfdAD
         SfV3mOTarcs4U6KrFYr6gHoMzDz8smgKTtYx+hkENuezwg7GWejxOVWkkUqjiV+JiCSx
         tm2psjBQ+VLmNP9GU661Af3anJSU40HCt9hRS11xkfgUjwSZDbnx/uhqeGq76s71Po+B
         VQGTmG2JBs2dgWm5S6r2QVDKjp4sX4MRMMOD95H4l45oN7WZiFlkR5mvBvISEgMqBGMu
         mtlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763033642; x=1763638442;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=itNJjGbKr9hOTSLlNwiZZOpbJXSs/2p7rVNvrCzyP+Y=;
        b=LUjQT0Xz1CXEh6R8hxtEDB84jtCypWRMbbRxkDMTzO5n59mJFQ0dl8WasRhdcwnz1u
         syqGTrOO+N82NLrIF41dLE4LgRfUEIqrpOyqQt9wjXm8eT9QpKbK/rvhbN9gR+hJrXTZ
         Z1o0qoR1hPUfo6fqceH3ULGBoIfuV+tWPA5fX0AD4qM2CZco1LZXkyvKmHm0gWroCYt4
         9zfAp6I1o2JTE9zrAcz5Br+4nP9pH3yCH1cTVPbyWVG8I1FI/u3ZXl+MuNhF2mgiZVqE
         aCrFE6TiaoiwlxT3dsn1cPghCQXzf/6uwaKP8EM0PEFE125BXxRzm5Or2Aa+hv+4GUCM
         P4QA==
X-Forwarded-Encrypted: i=1; AJvYcCUVABbkCkzjmCvwM0nXphxLeTqLKVVtWXcetOLqUuKF4+h9n8zvoNc//fKJp1HTK0/Mhzb/wl3dJh89A3zSlpbl@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1ZmVIzUcTvmxp0jdxsI/DXgu0STRWBRgmm0205vRHe9+ehbTX
	2kaEfShBsvgMkSwQiX8A4z9aCNRkuzxSjuSDd8ukYpTNW8sYhdnAZSAN
X-Gm-Gg: ASbGncunZZzAj09z+tYh9siHTZCW3RbD/wMSFHdfRknL2W/yLen2fzU+JD096Tv9Ssn
	3eKzb8SNTNzzY8Guh29g0Wc+OuKmN+9o4hlGT0rl+CzAes1i/rMc32fERrXw2b+zWdxCC0LThhu
	H/e5FXihFcAgILTZC86J+51t0QCjDttvjAqw4KlCD1o879BAi0CWCIuEudKkc8Onz6predRoxnU
	7vNHNizs2RpPDb/DHiU1rhWEA/rhPoLhMBvRZVZVPaooS1aaksQtRsHsm3zCmCRl135l9AdwCXD
	DQI1+foDEutzr9HSM0+QuDBnA+wF0Asc9YWBPsYjmBGN6VnuwfHD7+1TjXC4GncKDus+rRxijaJ
	jOtBAVn5xh8K3cszogSEeuZ1Sk/tKhTFraQRqhy6t9xIwcjRWICbjz0WU4+iL0zP3SI1x/E4jlC
	ULpWlneICbn3xUMtnXqA0C6obAB3w=
X-Google-Smtp-Source: AGHT+IGdopSjDKcZsfNDj50WFrJg2rJWrnZhwNBuCTBSaYL3A3I/G6d2OYwxOSpsfHYEqI44/nAYpQ==
X-Received: by 2002:a05:6000:40dc:b0:429:d3c9:b8af with SMTP id ffacd0b85a97d-42b5282384cmr2499048f8f.25.1763033642106;
        Thu, 13 Nov 2025 03:34:02 -0800 (PST)
Received: from [10.24.67.124] ([15.248.2.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f17cbfsm3172575f8f.35.2025.11.13.03.34.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 03:34:01 -0800 (PST)
Message-ID: <25469f8f-27ea-4d9f-af70-86e320224ec4@gmail.com>
Date: Thu, 13 Nov 2025 11:34:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] KVM: selftests: Fix unaligned mmap allocations
To: Sean Christopherson <seanjc@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 catalin.marinas@arm.com, will@kernel.org, shuah@kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 isaku.yamahata@intel.com, roypat@amazon.co.uk, kalyazin@amazon.co.uk,
 jackabt@amazon.com
References: <20251013151502.6679-1-jackabt.amazon@gmail.com>
 <20251013151502.6679-3-jackabt.amazon@gmail.com>
 <aPpi1c-8EpWuo87B@google.com>
 <c52db7bf-494f-49a8-9829-3805db6dda7c@gmail.com>
 <aQkZtjLt6lIULffA@google.com>
 <0c3db907-7012-43c3-b7fc-36848789da52@gmail.com>
 <aQpfviS-oAmanqpq@google.com>
Content-Language: en-US
From: "Thomson, Jack" <jackabt.amazon@gmail.com>
In-Reply-To: <aQpfviS-oAmanqpq@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_033404_691983_81971866 
X-CRM114-Status: GOOD (  18.94  )
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



On 04/11/2025 8:19 pm, Sean Christopherson wrote:
> On Tue, Nov 04, 2025, Jack Thomson wrote:
>> On 03/11/2025 9:08 pm, Sean Christopherson wrote:
>>> On Tue, Oct 28, 2025, Jack Thomson wrote:
>>>>
>>>>
>>>> On 23/10/2025 6:16 pm, Sean Christopherson wrote:
>>>>> On Mon, Oct 13, 2025, Jack Thomson wrote:
>>>>>> From: Jack Thomson <jackabt@amazon.com>
>>>>>>
>>>>>> When creating a VM using mmap with huge pages, and the memory amount does
>>>>>> not align with the underlying page size. The stored mmap_size value does
>>>>>> not account for the fact that mmap will automatically align the length
>>>>>> to a multiple of the underlying page size. During the teardown of the
>>>>>> test, munmap is used. However, munmap requires the length to be a
>>>>>> multiple of the underlying page size.
>>>>>
>>>>> What happens when selftests use the wrong map_size?  E.g. is munmap() silently
>>>>> failing?  If so, then I should probably take this particular patch through
>>>>> kvm-x86/gmem, otherwise it means we'll start getting asserts due to:
>>>>>
>>>>>      3223560c93eb ("KVM: selftests: Define wrappers for common syscalls to assert success")
>>>>>
>>>>> If munmap() isn't failing, then that begs the question of what this patch is
>>>>> actually doing :-)
>>>>>
>>>>
>>>> Hi Sean, sorry I completely missed your reply.
>>>>
>>>> Yeah currently with a misaligned map_size it causes munmap() to fail, I
>>>> noticed when tested with different backings.
>>>
>>> Exactly which tests fail?  I ask because I'm not sure we want to fix this by
>>> having vm_mem_add() paper over test issues (I vaguely recall looking at this in
>>> the past, but I can't find or recall the details).
>>
>> The test failures happened with pre_faulting tests after adding the
>> option to change the backing page size [1]. If you'd prefer to
>> have the test handle with this I'll update there instead.
> 
> Ah, yeah, that's a test bug introduced by your patch.  I can't find the thread,
> but the issue of hugepage aligntment in vm_mem_add() has come up in the past,
> and IIRC the conclusion was that tests need to handle the size+alignment, because
> having the library force the alignment risking papering over test bugs/flaws.
> And I think there may have even been cases where it introduced failures, as some
> tests deliberately wanted to do weird things?
> 
> E.g. not updating the pre-faulting test to use the "correct" size+alignment means
> the test is missing easy coverage for hugepages, since KVM won't create huge
> mappings in stage-2 due to the memslot not being sized+aligned.

Got you, that makes sense I'll update this series to resolve this then.
Thanks for taking a look.

-- 
Thanks,
Jack

