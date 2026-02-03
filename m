Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8ABE6E7FC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 10:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R6pk37gWj4Ao60hHiNwtAWN3UnalWQ7UEtWm6JRc280=; b=p9lJPgLWhxsIEpEGpYnEUFXBtr
	JCECKHY1P492reSO3Zb+2Z40AQ//HnW0gqtjVmkiXryyGWiPCPpUrdEUBBotpDT8o/1Gu2vs1ieQi
	xwqUvxPpJ2QcFeUJbjkPDj0aoHD542NiiPmr0uu1FXj2XY556dbmLQa3bN5puMwq+RBRsmoGSZtLF
	xcIpSTLPb7D8pywZat9L7QH1xTJi2O5NB0e8pBLpYUg+GOxC6bHeH9QwcVUFz6gmE6Pp6zv8hgNOt
	i2Wo4I/XBMjGlWIIDCw+WsU0FXPoVXvi+etHBYwM6MsdrUpol61LzXe55XK+bW7PU+jIbUm1m4buY
	hIXrl7qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnDvg-00000006UyX-0Sla;
	Tue, 03 Feb 2026 10:46:44 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnDvd-00000006UyB-2jfX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 10:46:42 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4806f9e61f9so28104365e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 02:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770115599; x=1770720399; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R6pk37gWj4Ao60hHiNwtAWN3UnalWQ7UEtWm6JRc280=;
        b=KG0uOXGRedhB2rqXMzKPT3mi+VbcSoJip+DikpLEmZrTfAeHeXfXRL0mt7s0LJFehd
         oF95he2WmY43FudvH+n7PgAXkGTftLffuP3lKQDOaBuJLDjfeAtIkqlz/rVQiFIBOPXi
         zwv3K/fnaIKo+ZEjp+0QcVz6uoCYpBgXPGRlzLPCtwerS4nUY4W9K/tRP8cX8FJsR6vk
         BkDh7Xzs93oltDrSS5juE/wMkw3zfWF8ADYAVyEaye1vlaLZIsbw1ueWw4uNfcVMoCNm
         esCi9g93vUHQQ9+ziV5EqwxY2yLTfbnna/LbRE7q08hL3Us0RTRa68Ya2qUbaDRpKRTo
         i7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770115599; x=1770720399;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R6pk37gWj4Ao60hHiNwtAWN3UnalWQ7UEtWm6JRc280=;
        b=dujixNZfVMAz3zE90BUTp+n055C+SmU5SZWLm8WpQAOmNHimax/9jhTRGxCG1Ksq77
         dHZ32gX0XfAoCIfRxiiPZbcXQczOjQZZC2JuI+HNQoL+YgXqk2Ps52XZlDKN2DqOLWxv
         Coyzt7G0VIhNRgttbWujCIo0M6hyi0Of5ABawIUiPrnmfhDZMRfP1YjWsK3Yuz1J6A0e
         PVhD2ZMwjj6yxzgQNySQQlxxFYx9P+0BmM9Ua7U9hn+T4pYjdAgYkNEJBE3dIsKjoj50
         aiSixFwAA1j0z1R9HUuYMkqXFKkdTQ8xGBf+Hd3cgFXOKMnJBZ1VBcUM17eoW2EEtJGl
         Kkhw==
X-Forwarded-Encrypted: i=1; AJvYcCV4L9w+n+LSLMSvR/JhA7HHhzqGbOr9RBMjCIEQR/twkFcK7ejqml/SAYmKXd7ynWS3UFdBCx5Juo+fwwspqmwO@lists.infradead.org
X-Gm-Message-State: AOJu0YzNxrBd1qVDuuAd5rK33e6S48KXNrfjH+Zdtgn0PD2A/KGBzpLh
	OP0dRjgcAvS7UDc4NvXa6hWADdrHxts6yJks38AjOp2yQ1sXISyO7uYooFhKAiXgiF5t8QswqnJ
	OsgOQ
X-Gm-Gg: AZuq6aJhSliHn6QcGC+UCVg+AHChaFMBKmAVINoYvwyu3hujtGIJws9x/L0wf/95N3b
	KDlAK7k0O/tZ/GYtxFxC5m/qJXn1fuUXFNHhYUZNXcUTKv5/dJOCJBRlQyZUkMC3PCp6Z/BDDUS
	8MDGs75JiCZJu4L8SNBGfbuVRMnQg8KT42o0yuKsiGMJV8tSy4deyvGE/BHa3D+9jDDXPHkAp+w
	yrGvc9QMBJcfh1vGfdBGz/7tQUM+j7Yez2E4WOGOZJjIST2uBYcvX7PEZlStUHzy2tPt9Df5zjg
	AqhpCaAX4fvxyQq/pfbhMHvMPqzETXTrTqKX5tpR+SwZmphnMYhk1qD2a1H2sazbZ19WVLFKAUK
	Q5PRbD14RLrsBh+alUN1GcYAVPzacbgZ4ohRLkJuix34vnAiEvagiYfBaK7FPycO8FwqjqoIz+l
	Iz1xIhJSUOXE6NTWb5ba0S6AESyQo=
X-Received: by 2002:a05:600c:6610:b0:47e:e076:c7a5 with SMTP id 5b1f17b1804b1-482db45211fmr187500675e9.11.1770115599291;
        Tue, 03 Feb 2026 02:46:39 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483051286e0sm57339175e9.5.2026.02.03.02.46.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 02:46:38 -0800 (PST)
Message-ID: <aebe99ad-1189-4372-83e3-385f33829bd2@linaro.org>
Date: Tue, 3 Feb 2026 10:46:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf: arm_spe: Add barrier before enabling profiling
 buffer
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Alexandru Elisei <Alexandru.Elisei@arm.com>,
 Anshuman Khandual <Anshuman.Khandual@arm.com>,
 Rob Herring <Rob.Herring@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>,
 Robin Murphy <Robin.Murphy@arm.com>, Leo Yan <leo.yan@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260123-james-spe-relaxation-v1-1-4ccb88fa7bc5@linaro.org>
 <aYD08d42SewAAQCB@willie-the-truck>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aYD08d42SewAAQCB@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_024641_721258_0DC53D3D 
X-CRM114-Status: GOOD (  22.17  )
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



On 02/02/2026 7:03 pm, Will Deacon wrote:
> On Fri, Jan 23, 2026 at 04:03:53PM +0000, James Clark wrote:
>> The Arm ARM known issues document [1] states that the architecture will
>> be relaxed so that the profiling buffer must be correctly configured
>> when ProfilingBufferEnabled() && !SPEProfilingStopped() &&
>> PMBLIMITR_EL1.FM != DISCARD:
>>
>>    R24557
>>
>>    While the Profiling Buffer is enabled, profiling is not stopped, and
>>    Discard mode is not enabled, all of the following must be true:
>>
>>    * The current write pointer must be at least one sample record below
>>      the write limit pointer.
>>
>> The same relaxation also says that writes may be completely ignored:
>>
>>    When the Profiling Buffer is enabled, profiling is not stopped, and
>>    Discard mode is not enabled, the PE might ignore a direct write to any
>>    of the following Profiling Buffer registers, other than a direct write
>>    to PMBLIMITR_EL1 that clears PMBLIMITR_EL1.E from 1 to 0:
>>
>>    * The current write pointer, PMBPTR_EL1.
>>    * The Limit pointer, PMBLIMITR_EL1.
>>    * PMBSR_EL1.
> 
> Thinking about this some more, does that mean that the direct write to
> PMBPTR_EL1 performs an indirect read of PMBLIMITR_EL1 so that it can
> determine the write-ignore semantics? If so, doesn't that mean that
> we'll get order against a subsequent direct write of PMBLIMITR_EL1
> without an ISB thanks to table "D24-1 Synchronization requirements"
> which says that an indirect read followed by a direct write doesn't
> require synchronisation?
> 
> There's also a sentence above the table stating:
> 
> "Direct writes to System registers are not allowed to affect any
>   instructions appearing in program order before the direct write."
> 
> so after all that, I'm not really sure why the ISB is required.
> 
> Will

We were under the impression that this was required for the SPU as it is 
treated as a separate entity than the PE.

In "D17.9 Synchronization and Statistical Profiling" there is:

   INDWCG

   A Context Synchronization event guarantees that a direct write to a
   System register made by the PE in program order before the Context
   synchronization event are observable by indirect reads and indirect
   writes of the same System register made by a profiling operation
   relating to a sampled operation in program order after the Context
   synchronization event.

That specifically mentions an indirect read following a direct write, 
which seems to contradict D24-1. Although I thought this is a special 
case for SPE.



