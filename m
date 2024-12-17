Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D185FE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 10:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C/VKyM8ryPjHMJUY0N3SOuUv5n1VPnB0Cz+2hkmq5/I=; b=tq/gB5XirtiWwbLb18wfD5RxDy
	s1NFPonUokOY3AHAhYofodMdWbBBtu+GjrmsB9tmZUOj6DnX8AFXXoudqTlTGcvf3B8UsVCKOk8Ad
	eTHHIpA43djW+WY12WsZPDBvCC70QGE5m+sNV2/Toj1fCtzHUuF0fDcocpMMXFqUcmr32IgJDLQ0r
	mUyCvEPZfdXakew19iLYx3kQAt2BLz4VU5VnKI0HtxLkCqA5t1c1XCJ4nh8G9TNp9bhNqGPBJE0T2
	5hN/K0Vtnd9rvni2Jq/bgbf3DqEaBfiLklCJO+XLtyMGnUFRQoZQK+jxzzpKmfhBJYL09+VSckOe6
	e22/sBcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNUX4-0000000D4Ur-3dn2;
	Tue, 17 Dec 2024 10:10:26 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNULF-0000000D1ZS-04uK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 09:58:14 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-385f06d0c8eso2458839f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 01:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734429491; x=1735034291; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C/VKyM8ryPjHMJUY0N3SOuUv5n1VPnB0Cz+2hkmq5/I=;
        b=J4h5PPgAWQot5XArVUzM0z2YFYZoSgUZDbLBs+KdkYGva0gwkQCxYYm1r0KJs4XkyW
         n2o7O9WSVKv+BNznk46vPj0yBV3Fj7ZmADyglILuFunC2HMGQjg7Y75Yc7tmblrBWdjK
         PMlRXBhsmViMGB/L4/VYwA3aF7JclrRs7XkWvdbatvqEijXiYJlUICgLPdG5AM95JtD2
         DZIXwDVPpp94cfVNnQa+yFi4MSGE/ZMtcyxjJ3Usl93e/imwpnVRDn1CSs2Nl1UdsnUu
         +wkHXrhLjmYaUjrNiLyoqlS5DlP1K5+c/zLDxz37lbkpHctJYf9szLF7MSzXjJMRJ481
         rV2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734429491; x=1735034291;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C/VKyM8ryPjHMJUY0N3SOuUv5n1VPnB0Cz+2hkmq5/I=;
        b=TME+oKZVCoejI2EQR+J5/156I4ANu0hldJSZ2OyPgcBpUs0DsGzAuWGok6SqGePk/W
         LnTlsTJzAyKHDK+S9mZyKbbCPMVnnFpT9yu9GV2Tbzq84kBsM9cQTGiC1QYSOELCk/fO
         sloGSf+uLbkFjRYIOZyANB2b+qzcFkKTG5l6AyksCC66fzC8EZ7+JElGOO3i6ukHeq0J
         fkK/TCL/mCvk2U8nh9CwjrJr1qAqvFgpM4ObuT+FZmvRESzBw6vH7uo67KKGgLVzy089
         zV/og84CMc6CMUZb08YwrZIJnB9ba2GECAtM4W3UJRfguoo2FOTQ/w+t0vCJc69VJVrR
         IGAg==
X-Forwarded-Encrypted: i=1; AJvYcCXZMWbIGMKA+DREgecW95e7TAtqK5Jm2rxYMAR5RxOKCufmsfhqwAq9bJa8Z/8UurLUOYfkvqFhTHsexYCs1sCc@lists.infradead.org
X-Gm-Message-State: AOJu0YznnQAAtZiPsAoGCXyCNmJdEshAAxdQTdBuwJbJ2vXoZX+uA+So
	mNbbGrQxmMqWKEf+/2wcK+MQcc3+l3lSe0Lt/C5zYlGMxx+3oZDwyqYzQrXpMxQ=
X-Gm-Gg: ASbGncvWWqpjxr/mLYl1FYll9aGNOXdVujxWipAAyhkc4HVgVdNCIuREtGDyrdovu+m
	nThP33yt/9fZTmGO80PppS+J6CEeXogcfVurWq65TuGIZ1/vo4q0z9SA65xPui4qyFfcH8yyKs5
	5WfPUH1kqy+EIT+t4t6iH8O3LnCq8tLsflCi4RaIKqOTNnoYAs5v0ZFvfGft4aCwvTCeDHfkRnZ
	LTvTTMbaiA73frcwWcWbKmLgrpsgcMkCl99Ehk6qCEudblOd7lAetqkqN+UiWCRNKA=
X-Google-Smtp-Source: AGHT+IHZ5G++DI6ac3nyEo1wQgi/CHocyZJfFsN7w9MxFXI87OESVz+Q9Oxf6gwUCboWcpHim+BSPA==
X-Received: by 2002:a5d:5f42:0:b0:382:51ae:7569 with SMTP id ffacd0b85a97d-38880ac7758mr11514269f8f.18.1734429490745;
        Tue, 17 Dec 2024 01:58:10 -0800 (PST)
Received: from [192.168.68.163] ([145.224.66.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362557c54bsm166398105e9.13.2024.12.17.01.58.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 01:58:10 -0800 (PST)
Message-ID: <cb11fe5e-e6ab-4653-b925-4c3cb5273b43@linaro.org>
Date: Tue, 17 Dec 2024 09:58:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] perf vendor events arm64: Add FUJITSU-MONAKA pmu event
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
 'Ilkka Koskinen' <ilkka@os.amperecomputing.com>,
 'Xu Yang' <xu.yang_2@nxp.com>, 'Jing Zhang' <renyu.zj@linux.alibaba.com>,
 'Lucas Stach' <l.stach@pengutronix.de>,
 "'linux-arm-kernel@lists.infradead.org'"
 <linux-arm-kernel@lists.infradead.org>,
 "'linux-perf-users@vger.kernel.org'" <linux-perf-users@vger.kernel.org>,
 "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>,
 "Akio Kakuno (Fujitsu)" <fj3333bs@fujitsu.com>,
 "'nick.forrington@arm.com'" <nick.forrington@arm.com>
References: <20241111064843.3003093-1-fj5100bi@fujitsu.com>
 <ee89c235-a126-4874-994d-b2489eb1c00f@linaro.org>
 <OS3PR01MB690303F6D0FAF71ADDE7AA4BD43D2@OS3PR01MB6903.jpnprd01.prod.outlook.com>
 <OS3PR01MB6903A0317D8BB90A9B4DD7E8D4042@OS3PR01MB6903.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <OS3PR01MB6903A0317D8BB90A9B4DD7E8D4042@OS3PR01MB6903.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_015813_074565_5D94A725 
X-CRM114-Status: GOOD (  22.16  )
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



On 17/12/2024 6:35 am, Yoshihiro Furudera (Fujitsu) wrote:
> Hi, James
> 
>>> Also in the common files, we're using the description strings from the
>>> Arm ARM. I noticed that the ones from your spec are slightly different.
>>> This is ok for now, but if we add any new Arm cores that use the same
>>> events this description may get overwritten. For example
>>> ASE_SVE_INST_SPEC in the Arm ARM is currently "Operation speculatively
>> executed, Advanced SIMD or SVE".
>>>
>>> If you have any actual relevant details that are different from the
>>> common string, you should put them in .../arch/arm64/fujitsu/monaka.
>>> But if you are ok with the potential overwrite (which looks like it
>>> should be ok) then you can leave them as is.
>>
>> I think it's okay to overwrite it, but I'll check the specs.
> 
> Regarding this matter, the descriptions of the events added to the common files
> (common-and-microarch.json, recommended.json) will be modified to match Arm ARM.
> Then, we will write current descriptions as "BriefDescription" in .../arch/arm64/fujitsu/monaka.
> We will post this as a v3 patch later.
> 
>>
>>>
>>> [...]
>>>
>>>> diff --git
>>>> a/tools/perf/pmu-events/arch/arm64/fujitsu/monaka/general.json
>>>> b/tools/perf/pmu-events/arch/arm64/fujitsu/monaka/general.json
>>>> new file mode 100644
>>>> index 000000000000..80bf17fb8f4c
>>>> --- /dev/null
>>>> +++ b/tools/perf/pmu-events/arch/arm64/fujitsu/monaka/general.json
>>>> @@ -0,0 +1,8 @@
>>>> +[
>>>> +    {
>>>> +        "ArchStdEvent": "CPU_CYCLES"
>>>> +    },
>>>
>>> Other cores put CPU_CYCLES in bus.json. For user friendlyness I would
>>> put the common ones into the same existing groups. The same issue
>>> applies for some other common events.
>>>
>>
>> I will update as suggested.
> 
> MONAKA's event grouping is based on the grouping of "neoverse n1/n2".
> We found that the groups in "neoverse n1/n2" may differ from those in other cores.
> For example, "CPU_CYCLES" is classified in general.json in "neoverse n1/n2",
> but in bus.json in many other cores.
> 
> As a result, it is not possible to completely match the event groups of other cores.
> We will be checking the current grouping of events and modifying them as much as possible
> to match the other core, and will post this later as a v3 patch.
> 
> Best Regards,
> Yoshihiro Furudera

Hmmm ok, I didn't realize it was already inconsistent. Still it's better 
to try to not introduce a third variant though.


