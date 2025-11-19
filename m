Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67175CF3966
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 17:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yoCeIVGZrihZGBDqvC+f7PXwUd8OXTG8E9X1EYx2gXI=; b=ovqabftDD0Xb5rpetnThbJgDBD
	IYLUONTlCjsiIeGpuodrA2tnoWTD9AMtCOj9YuKpR3LFzm+cggBiN1Z2qWAzUgg/Q0uPYY4cTaFS8
	RmxjIv23NUo+eQ2fwonnBXKcaDJ/nmAmk6hyJfJA5gCRZSw6RvX5aIBjAz97V9H4qDGiZ2AcATRGS
	8gI5sCs4QC6mDvgnb1IQAZlbPo/LwMcfnyxG3P/ucS9dD6jEcuJw3UIoo25MUjpk78PB8biLA24mt
	ND3fases7KIg8Auwu4uB8ofege7OMQcZOcePwI9R3B+yI6LBwibPeW8LH+FvWCwffJDlCPpwR8/5M
	aTGZV7NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLlqQ-00000004194-3RcK;
	Wed, 19 Nov 2025 17:19:50 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLlqN-0000000415m-3V8b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 17:19:49 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6418b55f86dso11358340a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 09:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763572786; x=1764177586; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yoCeIVGZrihZGBDqvC+f7PXwUd8OXTG8E9X1EYx2gXI=;
        b=R0pi1UZ4ga/THOks3QGjJgXQTUn8ATMmzJRe4h78xqaRnJaJN9Tzstu8UL78ZW2fgb
         qugg5ZueL1BAcfdhBisiFlL1+R0e5yJJfgWedP40k8BV+T1cUtsmDA1OGy4IBSkuqxuT
         FiE3LqWLEZmADZ3ONuxBauMjzsBJhpfDy6soJ0BaUasIHyhCZa/VAwAwuxt6eu5ZqEMG
         gbjhSYZGKm4AQEeVrKHVt6mzL99tSA3dCIoK8BZ4ijzWFhBW0R/a6FbnStp5Sa+m6ZB/
         mQn0VRorReIhznL1f6fNwNxdXQH01bmZibytyUfbiqapvnjdTZtUXbmgTMHy+8+LZ69f
         FXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763572786; x=1764177586;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yoCeIVGZrihZGBDqvC+f7PXwUd8OXTG8E9X1EYx2gXI=;
        b=OqgSmHUQrFbBVCDkgqUlpvxlsAdo0eisZI1YN2FNXByxohbQLTIbKOOe/uZhC5kE+H
         Ccm3MrFdJPCGShMUYK+CuNqNpUlO53Z549/4lRXp60hBZTG42gtScUeTuQ3/04F3CAGC
         AtWkC8OFIOZKM4sJ1vTPJ+h3rfYrQQf+MbhoCppb0cAoR4XK/X6CjtAXHKoCVmWoHkr5
         vc+Ud3n+AnNR33wsSwK9NBVjUcl0QYN5g9bDAGIJu4Jh/EAhpoyhaIqp8csVUXO3p0EB
         6/uBfHBd+1ZqyROodEQlcBQeYre5ARgksiD82SXCnkHhQD37308H5AzLywNu0+WKSjtr
         qOeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXY2YOYvIXI84X0jQ7hKCQcYFCXfcHnh1uea7piiD1tPIfqY7YBqdefbuj26uG0m5t7cN+WlThLgLhLAuYeGhA7@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp78yhpXB4aQ8ZKgO4HJjKjRI1PmTUVOn7AOgFmq0sWsa6kdJR
	mqj0SfNpuBx3jojq087DfCmiF8lYqCUdbtoFes2/fEyaD1daULqEFUXEF1jB4gEUUYA=
X-Gm-Gg: ASbGncu+C5Q74xBslo3NQ94l+vrbH8qxtHlbutkn/d9BqVeEUG7Ej/mGhlnKKYOINYd
	DumZRcm7fL//jh6yxn69xwZOu6mBpLLUnoPbspFr4TBlvXyFUEjY153T13DlQo1HFTckRK4Dofh
	vx2a6Mv/nTsFFZ3RHYWAvqGS30fTdX21KLKv0ykr9niPqkBVhqUPylg/ekZc+UT0VltlLJAbvxA
	v6kIjiThGvkLkSRxBRfmnXOuLnsHLDZ4VKQ8GrpbMWyA7dOI1EHp6dA6ICNYnYxZX8wBxtj0zAy
	ezievuqPNkMvGUWyNtPcY5d8E6XnKFrO4fwXxhwIoEc6YZ3MwmXR5L9SeAP+uq4GsDQelZxQX4K
	4KX/K88F1PpoVKYe6rlFnvLJG/86Zd8lx3tCNNuKllOThF5Kgro+fOrPzU0l9plZRcjtUgmC3RJ
	rwJFLil5L4Xwd1wf7YuH5zuQsd2w0ZoXGKOSBUH2q+ww==
X-Google-Smtp-Source: AGHT+IHFXlBYjBXYt8PjoVc6j/wKQUSsTRCIrYOrIhFX/QpfdOU8ruX00omnczPPKhikD5LHpvnGDw==
X-Received: by 2002:a17:907:2d12:b0:b73:572d:3b07 with SMTP id a640c23a62f3a-b736782d087mr2292251166b.28.1763572785909;
        Wed, 19 Nov 2025 09:19:45 -0800 (PST)
Received: from [10.101.2.140] ([93.122.165.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fdaa15asm1625320866b.57.2025.11.19.09.19.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 09:19:45 -0800 (PST)
Message-ID: <d24c4f4c-e58e-483d-adeb-9ec1799c80dc@linaro.org>
Date: Wed, 19 Nov 2025 19:19:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/26] Introduce meminspect
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, tglx@linutronix.de, andersson@kernel.org,
 pmladek@suse.com, rdunlap@infradead.org, corbet@lwn.net, david@redhat.com,
 mhocko@suse.com, tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, rostedt@goodmis.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-arch@vger.kernel.org, tony.luck@intel.com, kees@kernel.org
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
 <6c9b0aa2-820c-4153-ad64-cd2a45f7cf32@lucifer.local>
 <19171859-94ac-4f41-b100-70a1497e62e6@linaro.org>
 <dc9a8462-8384-4e9a-94e1-778fc763fa9a@lucifer.local>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <dc9a8462-8384-4e9a-94e1-778fc763fa9a@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_091947_915832_FB408D60 
X-CRM114-Status: GOOD (  14.78  )
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



On 11/19/25 19:14, Lorenzo Stoakes wrote:
> On Wed, Nov 19, 2025 at 07:11:23PM +0200, Eugen Hristev wrote:
>>
>>
>> On 11/19/25 18:30, Lorenzo Stoakes wrote:
>>> Hi Eugen,
>>>
>>> You've not run scripts/get_maintainer.pl so this is missing a ton of maintainers
>>> that you're required to send this to. This is not a great start for a huge 26
>>> patch series that seems to want to make very significant changes.
>>>
>>> Please try to follow proper kernel procedure.
>>
>> Hi Lorenzo,
>>
>> I included the relevant mailing lists, but indeed I have not cc-ed every
>> individual maintainer. Do you think it would be appropriate to resend it
>> as-is to everyone cc-ed (PATCH RESEND) or just do that for the next
>> revision ?
> 
> Yeah probably fine to do on respin :)
> 
> But obviously let's not land this without at least 1 respin/resend.

Definitely. This isn't something that would land without a lot of reviews.
I am sorry again and hope to hear your opinion on it as well.

Thanks,
Eugen

> 
> Thanks, Lorenzo


