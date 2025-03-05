Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C023C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 09:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Grr+Ryd7sxW458ZEYnV+lJNtq+fkIQR73sXzq9266bY=; b=bMT9p4XyCw5DYBi4OMFQh2anUt
	W6HcOQaQ1b7NSisoPfiUVENQ0xveVwJBCsMBT6WCpmVNfdPoatMHRprtbJNt+di+W1jI4Xtyn8G2y
	RxU5djhqsDyK1W2cdwUuw0rG3RT2EOq2TVzl4ZSOweTAywDcDJz7qxmwt0Pg6xOMcfs/jZrlm/Cxf
	mdyo3z1sz8A9flT/EtYt4QFTh1zCsX95XbKigvugP8M6if4bQj+zQiZVBWCzmYv0klzug3CiGhKlc
	bmiAkzLy/OIOQVf+E4OPaVWS3z21MkQxHwFea67oAi7UjqJu/P/nIboW612sNQ3e7a0YUlCw92a7i
	xsArZ8dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tplDn-00000007XQX-3nSJ;
	Wed, 05 Mar 2025 09:39:23 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tplCC-00000007X94-0vw4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 09:37:45 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43bd87f7c2eso204565e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 01:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741167462; x=1741772262; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Grr+Ryd7sxW458ZEYnV+lJNtq+fkIQR73sXzq9266bY=;
        b=WioaNKGCLt81icyvB/4k1lczWywUdJuM185d6kMorQqspQUatml0+4vJEEDYuDIGem
         Is798jkQdQODkLZXdqmzmdW3t+LzPedvQE+Und/Fa+IiQLZXBwdl48GyvaRUVoEgfRbH
         4cNP+RO0Kbmpq9CGGm/Lvuac5vGR/PmxSUnRkqEE2mSv8WW6Tnm+AqeSBE03EuxDEBDS
         u+SUNgtv8pywVSMoxej/Nyy3EGB2Tn+5KuH+XsZxcprKO5tSuvLNDyiEukztxzE8uL47
         2Vaw3+NeZwwHoHS5n2zbYC98c84uT9gKSAIwpS9XGUcbGD8K6uQdbncFIOgPPSCoEozw
         u36w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741167462; x=1741772262;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Grr+Ryd7sxW458ZEYnV+lJNtq+fkIQR73sXzq9266bY=;
        b=kZjaVsG9xf5YzzcjN5nuwu4AtNyWzJkan91LoC8PwNu/PVPx7XjUv+7j1XLrUO9rbN
         knjAHTgfn/no05PkgwMHSrqpdNpYx6sPqz92VaXrh9qPaqMQSeNBCTRIcti7Nw7GmP5u
         msOUNlUrxdrsJEXVkJraFXVKiu4jUG9mVwL9t9KEgp7OMmZtJFvOLpaufwK3bjvKtYTv
         goFfB31lbZRwXkRtvKg+y2CiwfAUAKDusoQD9U7gzKVfSpkNjO7yqQthbBm0HVDHNNPc
         adEii7SDEAaQrvEf2OXuCP3QAlFHAN8qNYVfUbMqPBGVhTP/1XA34ckGENhNLwjvOMEa
         e75w==
X-Forwarded-Encrypted: i=1; AJvYcCU5vTT609idJSaH8vPId3qEeLMvH1XyX+qhAoNZxgpxT4ANFRq6HIUhA/TY01IZuGhe6Fb9ZC6HT12bwZr5OZ8r@lists.infradead.org
X-Gm-Message-State: AOJu0Yy03CVF3ELAkQ3mtXuBQ5bFeLU2RnZeSPuZuC0YAHe5EM0rrWCt
	se+K/2Mi+CGpz6r+izLUDu2z95U8NroBzdE/KwNv9I0zp5sPMKMwDf9zV/HlkOk=
X-Gm-Gg: ASbGncu/aAsi1/XK+L0Tlm0pBJULRwLwY7s+FCPFlS7TnjbHdKFP/9959ifdCRgJcbo
	Mz+XWAFnBXikZ1wzPG0dtfdTVDRWVqhTGilZo7HAQdICA52K6Rv2YBUJD2bmn0OM84/xdmBOfJ+
	j0SNWD30hJ4rwhcUX+n+dnhcW85sNIuQO9BAVX0BGUQXboW1V65GAPUzIuXc79KI3k2N69n5RSp
	OvhV8/zuDYscKuw19g8Z0i9pUMzTVhLCh5IEVOxIYmR3fKhVB0ubW28UYGFKn4FNImlwXs+OC9w
	JLcDKaqigu3pfqNa5KgayoIQD6OiSuPobxJU/pTOcaoWy9HlueaMo7A=
X-Google-Smtp-Source: AGHT+IHLvj7BNI5tvdYEjWzU14lOUssmMCCnp9Uix4nr7D2htDflU5rgXZLhEFrgq2kEhSCjpXYOag==
X-Received: by 2002:a5d:5850:0:b0:391:4f9:a039 with SMTP id ffacd0b85a97d-3911f7400aamr2232774f8f.16.1741167462428;
        Wed, 05 Mar 2025 01:37:42 -0800 (PST)
Received: from [192.168.1.247] ([209.198.129.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4844a38sm20595393f8f.75.2025.03.05.01.37.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 01:37:42 -0800 (PST)
Message-ID: <36123515-a268-40cb-b010-2600c2f5c1c6@linaro.org>
Date: Wed, 5 Mar 2025 09:37:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Remove some PMU events for FUJITSU-MONAKA
To: "Yoshihiro Furudera (Fujitsu)" <fj5100bi@fujitsu.com>
Cc: 'John Garry' <john.g.garry@oracle.com>, 'Will Deacon' <will@kernel.org>,
 'Mike Leach' <mike.leach@linaro.org>, 'Leo Yan' <leo.yan@linux.dev>,
 'Peter Zijlstra' <peterz@infradead.org>, 'Ingo Molnar' <mingo@redhat.com>,
 'Arnaldo Carvalho de Melo' <acme@kernel.org>,
 'Namhyung Kim' <namhyung@kernel.org>, 'Mark Rutland' <mark.rutland@arm.com>,
 'Alexander Shishkin' <alexander.shishkin@linux.intel.com>,
 'Jiri Olsa' <jolsa@kernel.org>, 'Ian Rogers' <irogers@google.com>,
 'Adrian Hunter' <adrian.hunter@intel.com>,
 "'Liang, Kan'" <kan.liang@linux.intel.com>,
 "'linux-arm-kernel@lists.infradead.org'"
 <linux-arm-kernel@lists.infradead.org>,
 "'linux-perf-users@vger.kernel.org'" <linux-perf-users@vger.kernel.org>,
 "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>,
 "Akio Kakuno (Fujitsu)" <fj3333bs@fujitsu.com>
References: <20250227054045.1340090-1-fj5100bi@fujitsu.com>
 <96b323eb-15b2-4b60-8522-83bf2f57694b@linaro.org>
 <OSZPR01MB6908AA7CEB24ED38F9289D6DD4CC2@OSZPR01MB6908.jpnprd01.prod.outlook.com>
 <OS3PR01MB6903726FDA70250F72A73410D4CB2@OS3PR01MB6903.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <OS3PR01MB6903726FDA70250F72A73410D4CB2@OS3PR01MB6903.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_013744_267992_1C97C6D6 
X-CRM114-Status: GOOD (  19.44  )
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



On 05/03/2025 6:40 am, Yoshihiro Furudera (Fujitsu) wrote:
> Hi, James
> 
>>
>> Hi, James
>> Thank you for your comment.
>>
>>> On 27/02/2025 5:40 am, Yoshihiro Furudera wrote:
>>>> The following events are not counted properly:
>>>>
>>>> 0x0037 LL_CACHE_MISS_RD
>>>> 0x400B L3D_CACHE_LMISS_RD
>>>
>>> These two are discoverable so will still appear in
>>> /sys/bus/event_source/devices/armv8_pmuv3_0/events/ if the hardware
>>> says they exist. It might be better to change the json strings of
>>> these two to warn that they don't work if that's the case, otherwise
>>> Perf will still list them and you'll be worse off.
>>
>> I will leave these 2 events and
>> add a warning message to the description in the JSON file.
>> I will handle other events in the same way as these 2 events.
> 
> I'm thinking of adding one of the following warnings
> to the description of events where inaccurate counts
> occur on FUJITSU-MONAKA.
> Is this okay?
> 
> 1.Simple version
> "Note: This event does not count accurately."
> 
> 2.Detailed version
> "Note: This event does not count accurately because it counts as a miss regardless of whether the L3 prefetch is a hit or miss."
> 
> I think "2.Detailed version" is better.
> 
> example:
> {
>      "EventCode": "0x0396",
>      "EventName": "L2D_CACHE_REFILL_L3D_MISS",
>      "BriefDescription": "This event counts operations that cause a miss of the L3 cache. Note: This event does not count accurately because it counts as a miss regardless of whether the L3 prefetch is a hit or miss."
> }
> 
> Best Regards,
> Yoshihiro Furudera

You could have both by using BriefDescription and PublicDescription. The 
longer one being available with 'perf list -v'. I think that's what that 
feature is for.

Either way you should probably also update the description before the 
note, so add 'hit or miss' to the first sentence:

"EventCode": "0x0396",
"EventName": "L2D_CACHE_REFILL_L3D_MISS",
"BriefDescription": "This event counts operations that cause a hit or 
miss of the L3 cache. Note that this incorrectly counts both hits _and_ 
misses."



