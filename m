Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238BDCAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 10:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8Bq2UEqpTUxftlSBdX7OuC2XFs3G/N0v0vwH32gU+A=; b=T2YFheVNKarVyevkLqYKBL/Aoy
	2eTPYW4J0WVLFkoCyQOlYZDopmo6DZCEY81PckIrbCOnT64wRhOURzp57mKZUvpwl0K6/Spl89SBi
	DLTPFMNmn8xF0n35xO7lkMOEFuujS5bAT3LC+09VTGZF/hIlT0YqCSxFsF8bXxYNtCID+qSJlpMy8
	/xpMm5RJd7mhPiw+g2jbE5gupSpsJNaathv/1OR7W2Cd5ufqB2//y5EN77rlbvsFmsvId7bSG87t3
	zAwBo/zd2eyONqkug6Rp0MGhj8MCcNlly4fttJzfvIIc4TIunspLMKhf0nvq/j6js9suq798Yk8j7
	6iPR+GKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4GHg-0000000ADfq-0PlM;
	Thu, 02 Oct 2025 10:11:36 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4GHe-0000000ADfP-0KOa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 10:11:35 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-46e384dfde0so8910675e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 03:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759399892; x=1760004692; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M8Bq2UEqpTUxftlSBdX7OuC2XFs3G/N0v0vwH32gU+A=;
        b=qrhUswDnyHr6ZHa7izmj7CQ7PGZudCDdEUjM79sPSvmdOsWgF/TZeMisOxd4Vo4l8/
         ajVLPwX94DKqmMivHqcrjCJF3QeBB2WB8x115inD34JfU0XrRNuidRKyqWI6s5zUAWwn
         k5QwyQzPEYKYX+7ge+Z6kAMzkPDRdINrbcG2n+lFormBIgTQZK4AomCAJZ6WMQ0jmKXY
         jfOGD+B+pdm1Poi4xv+GBl3aw68PqauYUyasSZur5TEZWr0DVgwa2l8QxipYRdR2vrQ+
         dxGSgSdrfZL0DasVArQSN1celMyqyAu4TuyF7K5AcztBPZaeBVnobdHkW4bpxHwjSCgA
         OcqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759399892; x=1760004692;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M8Bq2UEqpTUxftlSBdX7OuC2XFs3G/N0v0vwH32gU+A=;
        b=RewVKxqcfeaqfW/nJovBf8hmpxTT8kCiVSBggk4F5n77m+knvI9H3GefV0nAr07dMg
         IXcn7URvpyXTttX54i3YkAnpgl5NRgpkAesLCkwVCC0SbhcXsQrGoP0PEyX8589oUzEX
         vFIDTDSi1efrSbNw7MLBcAMw62f2u+1UY1y7lwESn8EAYHZZK+WJ+7/G81++aCJcbkvP
         7xG854YJVwIb8MeqpKq33Veg/oKCl6ZVkWffVJIKQ0I3zPqT/kkYmT+1wWWELsJiRpTV
         JYLDeOp1V2qYvjgCtXVN0VHqo3oqztBP/0xrtRcI8GMEneJUBFmOQqeMrWGtzWEu/yB5
         1IhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUd/9spHCmz3T0PMn/GflhIWIlybjPGG+zNtsTBTt0OBmScUR8VnsvW+NDH1n39xyKs0RXBWax6y80jbf55Ey+l@lists.infradead.org
X-Gm-Message-State: AOJu0YwkxZi5O/xzX/MnlqM+5XhAijXIcdWyGBvI+PErdzORnqFDXp4w
	fJInm+vYsDTkk+CspB8EhelE5byyUXZ+a4fnZu9SVhJDjipMnBuxce1wTO3SwqIgaGE=
X-Gm-Gg: ASbGnctK3SPtgnryrGJF2WDVaDyovx9Ds7Qngi6zneNIjV5FPZwi24UuzA8Zl1NqIFT
	wLgUc+CeBo7nIwKCehnho8v+1TGIv2sSnIC1RbZRN4fh8Lg8PSh1K61zWYbIBQchcOrdsPlxvEZ
	RVVkn4Sb9R90UrX2nyhrZ/hanDr2GCVrJxjB9yxkT3zWhEsCcOZno7w/c0qAX7N7pGlAHtkFgVp
	ThkoLUhOThdbIYkXxwLMcECMzm99s3dZOxBzkVYmoKoes7LxCnB9UfSw6K/e5E9qZI079oUlwDM
	Oqf0xocK245Sb6yEByKdi7k3xTZ/yc4ySklZSyb6QtjyzT7l10foi3uvvGhFbdrnHjrF8tO3qU0
	XDPZVwK4w6JEY2qf1xs5szFuxOJS9WC+MdlL8KsU/m/DHWQZkWagcfdPF
X-Google-Smtp-Source: AGHT+IFWh975vJvc4Ml/pCcEIsLQ9eEzaaf4VQkBY01lMYMfPFIlL3XanMh6oloBoFROEXbxSrta5g==
X-Received: by 2002:a05:600c:4586:b0:45d:d8d6:7fcc with SMTP id 5b1f17b1804b1-46e6f7ff73cmr2978875e9.27.1759399892241;
        Thu, 02 Oct 2025 03:11:32 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d869d50sm3094531f8f.0.2025.10.02.03.11.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 03:11:31 -0700 (PDT)
Message-ID: <4d742477-f16a-4bc0-bb86-717bc0b560b0@linaro.org>
Date: Thu, 2 Oct 2025 11:11:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] coresight: Fix holes in struct etmv4_config
To: Mike Leach <mike.leach@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20250811-james-cs-syncfreq-v1-0-b001cd6e3404@linaro.org>
 <20250811-james-cs-syncfreq-v1-2-b001cd6e3404@linaro.org>
 <CAJ9a7Vh44rYWN3mjHPBq8pkBcPuhS2pTBZNaMpWgJECmPZtupg@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAJ9a7Vh44rYWN3mjHPBq8pkBcPuhS2pTBZNaMpWgJECmPZtupg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_031134_148511_95BC9B98 
X-CRM114-Status: GOOD (  19.33  )
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



On 14/08/2025 1:37 pm, Mike Leach wrote:
> Hi James
> 
> On Mon, 11 Aug 2025 at 10:32, James Clark <james.clark@linaro.org> wrote:
>>
>> Lots of u8s are mixed with u64s and u32s so repack it to save a bit
>> of space because there's one of these for each ETM.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/hwtracing/coresight/coresight-etm4x.h | 19 ++++++++++++-------
>>   1 file changed, 12 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
>> index 746627476bd3..a355a1e9606d 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
>> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
>> @@ -832,28 +832,33 @@ struct etmv4_config {
>>          u32                             vipcssctlr;
>>          u8                              seq_idx;
>>          u8                              syncfreq;
>> +       u8                              cntr_idx;
>> +       u8                              res_idx;
>> +       u8                              ss_idx;
>> +       u8                              addr_idx;
>> +       u8                              addr_type[ETM_MAX_SINGLE_ADDR_CMP];
>> +       u8                              ctxid_idx;
>> +       u8                              vmid_idx;
>>          u32                             seq_ctrl[ETM_MAX_SEQ_STATES];
>>          u32                             seq_rst;
>>          u32                             seq_state;
>> -       u8                              cntr_idx;
>> +
>>          u32                             cntrldvr[ETMv4_MAX_CNTR];
>>          u32                             cntr_ctrl[ETMv4_MAX_CNTR];
>>          u32                             cntr_val[ETMv4_MAX_CNTR];
>> -       u8                              res_idx;
>> +
>>          u32                             res_ctrl[ETM_MAX_RES_SEL];
>> -       u8                              ss_idx;
>> +
>>          u32                             ss_ctrl[ETM_MAX_SS_CMP];
>>          u32                             ss_status[ETM_MAX_SS_CMP];
>>          u32                             ss_pe_cmp[ETM_MAX_SS_CMP];
>> -       u8                              addr_idx;
>> +
>>          u64                             addr_val[ETM_MAX_SINGLE_ADDR_CMP];
>>          u64                             addr_acc[ETM_MAX_SINGLE_ADDR_CMP];
>> -       u8                              addr_type[ETM_MAX_SINGLE_ADDR_CMP];
> 
> this is 16 x u8 - could this not just stay here?
> 
>> -       u8                              ctxid_idx;
>> +
>>          u64                             ctxid_pid[ETMv4_MAX_CTXID_CMP];
>>          u32                             ctxid_mask0;
>>          u32                             ctxid_mask1;
>> -       u8                              vmid_idx;
>>          u64                             vmid_val[ETM_MAX_VMID_CMP];
>>          u32                             vmid_mask0;
>>          u32                             vmid_mask1;
>>
>> --
>> 2.34.1
>>
> 
> These attributes have been functionally grouped for ease of
> understanding. If we move the _idx values away from what they are
> indexing, we probably need comments cross  referencing from where they
> where and where they have gone to.
> 
> Mike

I missed that because although there are newline separators there were 
no comments for headers. Dropped this commit in v3.

> 
> 


