Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0450D1039D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 10:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xqXD5UxhVl/qedWfuQJ1mScY0sYX8Bi2EGwWdCnH12o=; b=s3PQiv6BQC86200T2kmvmBei1S
	XppndezIf+j0WBbUnAbypW1g+XqHZEYHHzW7SXLx4N7UBV/yhb3Mj+cvtniD19Yj6KcIKbEICVyT2
	88WJodbcgd3qm6TQ5QcOjgNstnQvOgPMwQw2uz5cEfpi8ePpTgawfnq8bJ9w7Cavja6SJeABtfbGQ
	axHtrZvriWDJDNaJGicpr7nZzF57xlbn8Om1OoAVFnpej/EHWTQxBmgsZYraOj04tfU+X4zsuM+Gu
	NPAfNJNbrGBnoBMrijitpsiyBVvQPVL0phgq9R7ywuL0OH0qKO4cKfgwC/XrE4gmKZ7vnaQR1SBNP
	+xKT7CkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODDF-0000000EqjO-1UwO;
	Wed, 26 Nov 2025 10:57:29 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODDC-0000000Eqio-21Ff
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 10:57:27 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so57577015e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 02:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764154645; x=1764759445; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xqXD5UxhVl/qedWfuQJ1mScY0sYX8Bi2EGwWdCnH12o=;
        b=BhNvckdM13iJUYayiBlqMVoSreXgoe4iGzhhohEjIUwiLN2ZLfmPqZeKWuNFPUhQIr
         M+y4mZCp8VOJI9bNHjTYHUq9gjO1V0tf0VFZZTesk27sdcdRHa61mxvoN7BNfTleT0LA
         a4n55OVWERUf0WUVbzVb/Qzx31nV8SbatRGA7wBYtT7BNMySR+DozOYTYBbb5cdggt/l
         H/hFEOA1g9XmoxRej9JiBWZR/TDRA9/gkBFCbeObdsi1ReEtaPYQsrmyv1wGkUssXQta
         qNj+9uQ0tjl2KgJBeHIxCAsXLaWFbl9ktKumsABaEq+qpUQrnPXqEmmcIZjabuqAwoTs
         rL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764154645; x=1764759445;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xqXD5UxhVl/qedWfuQJ1mScY0sYX8Bi2EGwWdCnH12o=;
        b=MLMX8xldQvxbh81WLmGK06DtjMPFSjEzwiOjgVnfgTJbWaEXW8y3NVDW1XsWH3nfSM
         pk8TxqOakHfmI57rRntIqzqvIS79emD3dq5Arz/mNboh72qrbxkhu3YRJRE/SI1LZV7C
         1hXG09iC4Fu9HPlI6juACZ2P4fHhxQcnwHESDX5bbygbuKaxKTfRVfbzD2051DmHckiK
         hd5aWj61dAk2WU0xDRIe+pYYx5TK0ahLnuGtFj9M/t0tzM8+vwGFJQKbOV4fcV84EckE
         rewadtVD7QHBf20OFTJKe/YAyu0LZ6tvQyLVBBS5qGs8VOmo+TaxUlEhvcM1Oa/rWXD5
         Yzdg==
X-Forwarded-Encrypted: i=1; AJvYcCVmA1d2IxksUKcJHpZ3ss7OpkI2an7ic3LrZxe87A/HdK6U4QsLxHA3M8O7F/zr+LekOWLvhGTM07+TmaEwJveP@lists.infradead.org
X-Gm-Message-State: AOJu0YyMqmtnRbwuF741mMN/Vgcr9KxnYFFD9lHHa4CD4PMbJ1DWrzBp
	efuzsnX1jPb29i5WTGCXp28o7GddtHc8brM+dxKd/KCZbHjvZuaWT1qOH3BhxA0GSPM=
X-Gm-Gg: ASbGncvCfJ3aojlZPBnk1BoxMyZ6PcPSihf6ICOptEE8X4sWCV6Nh9KWFKh3qOvp+AE
	7WER1ANx2TAOTdmkne6zYkLtsKeo5RHLC26h1fvI21S6XcBZ8BrxxvIzSVyF+wla1HBw/stL5MC
	q+dOvK6I0IqfP5EVf28PJ83Fv9vJEcOcoQ3f7TF++a3HHpk/TDiw7MY1J+ONlCC39NfzFVahxsp
	A2J5kqbaDd1CrZ+Psw5Q2G6eHMHSYKx1v0jiKfcwznqJ2ERi6k48pP5ZLRfiFKC7XWbHyy/7THw
	j6JrwoBonC9yrlm6pPtuhQwFDIxivChAQySorAntNDj4HKSQxKyJxftyD5KfGpTMGDEviKpVe2z
	2sp2fxQ8/HRK0qGpwvKvNcLS7bXoKdKmiiHojh37ydGcoy9FzJNRdGnbDVOdCN6YM+UaypX2dHU
	x3KuQ/eWhfcEzJ/l2T
X-Google-Smtp-Source: AGHT+IGJVYWCYJ3S88DHqP10Kg/CMuGOigEQvkZH1FXVwz7BCvehg53dPZp4WCChCiUbgB2T2w+dGg==
X-Received: by 2002:a05:600c:19c6:b0:477:7975:30ea with SMTP id 5b1f17b1804b1-47904b25e46mr56780175e9.29.1764154644604;
        Wed, 26 Nov 2025 02:57:24 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adf5387sm35802845e9.12.2025.11.26.02.57.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 02:57:24 -0800 (PST)
Message-ID: <68efd5a2-3b65-4f37-9bf0-40c4e5ade480@linaro.org>
Date: Wed, 26 Nov 2025 10:57:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: etm3x: Fix buffer overwrite in cntr_val_show()
To: Mike Leach <mike.leach@linaro.org>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, suzuki.poulose@arm.com,
 alexander.shishkin@linux.intel.com, pratikp@codeaurora.org,
 mathieu.poirier@linaro.org, gregkh@linuxfoundation.org,
 jserv@ccns.ncku.edu.tw, marscheng@google.com, ericchancf@google.com,
 milesjiang@google.com, nickpan@google.com, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251121002350.1166758-1-visitorckw@gmail.com>
 <172ca2d9-4a6f-4498-bdfd-8aa7428581ce@linaro.org>
 <aSCbJR9aT1vOpz0a@google.com>
 <05babb6d-a588-49f8-a34a-c82d5f58adf5@linaro.org>
 <CAJ9a7VipxW5-2roAQA3y212sQWr1kq2HNbLK1jmLNP1jFseYiQ@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAJ9a7VipxW5-2roAQA3y212sQWr1kq2HNbLK1jmLNP1jFseYiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_025726_575627_053BEEBE 
X-CRM114-Status: GOOD (  41.69  )
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



On 26/11/2025 10:49 am, Mike Leach wrote:
> Hi,
> 
> On Mon, 24 Nov 2025 at 16:12, James Clark <james.clark@linaro.org> wrote:
>>
>>
>>
>> On 21/11/2025 5:02 pm, Kuan-Wei Chiu wrote:
>>> Hi James,
>>>
>>> On Fri, Nov 21, 2025 at 09:50:03AM +0000, James Clark wrote:
>>>>
>>>>
>>>> On 21/11/2025 12:23 am, Kuan-Wei Chiu wrote:
>>>>> The cntr_val_show() function is meant to display the values of all
>>>>> available counters. However, the sprintf() call inside the loop was
>>>>> always writing to the beginning of the buffer, causing the output of
>>>>> previous iterations to be overwritten. As a result, only the value of
>>>>> the last counter was actually returned to the user.
>>>>>
>>>>> Fix this by using the return value of sprintf() to calculate the
>>>>> correct offset into the buffer for the next write, ensuring that all
>>>>> counter values are appended sequentially.
>>>>>
>>>>> Fixes: a939fc5a71ad ("coresight-etm: add CoreSight ETM/PTM driver")
>>>>> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
>>>>> ---
>>>>> Build tested only. I do not have the hardware to run the etm3x driver,
>>>>> so I would be grateful if someone could verify this on actual hardware.
>>>>>
>>>>> I noticed this issue while browsing the coresight code after attending
>>>>> a technical talk on the subject. This code dates back to the initial
>>>>> driver submission over 10 years ago, so I was surprised it hadn't been
>>>>> caught earlier. Although I cannot perform runtime testing, the logic
>>>>> error seems obvious to me, so I still decided to submit this patch.
>>>>
>>>> Nice find. I think the point that it wasn't caught changes how we fix it.
>>>> Either nobody used it ever - so we can just delete it. Or someone was using
>>>> it and they expect it to always return a single entry with the value of the
>>>> last counter and this is a potentially breaking change. So maybe instead of
>>>> fixing this we should add a new cntr_vals_show() which works correctly. But
>>>> then again if nobody is using it we shouldn't do that either.
>>>
>>> Thanks for your feedback.
>>>
>>> I agree that if any tool relies on the current behavior, this patch
>>> would break the ABI and violate the hard rule that we must never break
>>> userspace.
>>>
>>> However, I am not sure how to determine if any userspace tools are
>>> actually using this sysfs interface. Is there a recommended way to
>>> verify this, or a standard procedure/convention to follow in this
>>> situation?
>>>
>>> Regards,
>>> Kuan-Wei
>>>
>>
>> There's no way of knowing apart from deducing that there are 0 users of
>> the 'correct' version of the API because it never existed. This isn't
>> even a regression, it was broken from the beginning.
>>
>> I suppose it does work when hardware only has one counter, but I don't
>> know how likely that is?
>>
>> Looking at cntr_val_store() I think I was wrong before when I said it
>> should be a separate file for each counter. Writing to it already writes
>> to the counter currently selected by cntr_idx and splitting it out to
>> separate files would have to break that too. So we can fix the display
>> bug by making show operate on the currently selected counter in the same
>> way as store. Then it makes a bit more sense and we can delete the
>> "counter %d: " prefix.
>>
>> ETM4 already does it this way too.
>>
> I agree with this.
> 
> The difficulty in having a file per counter is that different
> implementations have different numbers of counters. Rather than
> complicate the driver by dynamically generating the sysfs files, the

It wouldn't be that hard because there is a maximum number of counters. 
You'd generate them all and then use the is_visible() thing to hide ones 
that didn't exist on that device.

But it looks like we don't want to do it that way for other reasons anyway.

> single file + selector paradigm makes things easier. The index is
> validated against the actual number of counters for this instance, and
> read/write occurs for the selected one.
> 
> Regards
> 
> Mike
> 
>>>>
>>>> The interface isn't even that great, it should be a separate file per
>>>> counter. You don't want to be parsing strings and colons to try to read a
>>>> single value, especially in C. Separate files allows you to read it directly
>>>> without any hassle.
>>>>
>>>>>
>>>>>     drivers/hwtracing/coresight/coresight-etm3x-sysfs.c | 4 ++--
>>>>>     1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
>>>>> index 762109307b86..312033e74b7a 100644
>>>>> --- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
>>>>> +++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
>>>>> @@ -725,7 +725,7 @@ static ssize_t cntr_val_show(struct device *dev,
>>>>>      if (!coresight_get_mode(drvdata->csdev)) {
>>>>>              spin_lock(&drvdata->spinlock);
>>>>>              for (i = 0; i < drvdata->nr_cntr; i++)
>>>>> -                   ret += sprintf(buf, "counter %d: %x\n",
>>>>> +                   ret += sprintf(buf + ret, "counter %d: %x\n",
>>>>>                                     i, config->cntr_val[i]);
>>>>>              spin_unlock(&drvdata->spinlock);
>>>>>              return ret;
>>>>> @@ -733,7 +733,7 @@ static ssize_t cntr_val_show(struct device *dev,
>>>>>      for (i = 0; i < drvdata->nr_cntr; i++) {
>>>>>              val = etm_readl(drvdata, ETMCNTVRn(i));
>>>>> -           ret += sprintf(buf, "counter %d: %x\n", i, val);
>>>>> +           ret += sprintf(buf + ret, "counter %d: %x\n", i, val);
>>>>>      }
>>>>>      return ret;
>>>>
>>
> 
> 


