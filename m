Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FD1D1039D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 12:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c4iRe4aOrrtqdI0rXdKZ+xR4qIxt0v6dXb2WpyvPrtc=; b=JeGJeN85zsakzwhtLoJUPEB20q
	r3nO8RWWa2cZfOXA0OWFsTXoRK0dJe9C/voYuGbHnQLJWJoFQpG/USpZB2JW4Vdxhnx7Mc5eOAPbi
	oFgQEQJ1Z3OwdtdCufrP5WGsBFoXNVCaxA80Qqw13rcdTuzQScDAuQnWsTUtNQAW6l8HwdEYsdKid
	5ymu3bxMj5nHbBb039GGcXZpU8n+yqwUazE1MwqTcpvDjYrK7HjfEIvn38lHPp1ub24cLrEvFxoeP
	XAqgIJicTZn16RnII+iJVdztzXm78I7xRC9T3z8bppiyM8p7kFWoV1zgnC2x05IEHBS2D0gZsVEy6
	g89q3qHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOEMa-0000000ExWK-2VFL;
	Wed, 26 Nov 2025 12:11:12 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOEMW-0000000ExV2-40pb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 12:11:11 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4779a637712so40868905e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 04:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764159067; x=1764763867; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c4iRe4aOrrtqdI0rXdKZ+xR4qIxt0v6dXb2WpyvPrtc=;
        b=EORumXNlxnw0hJoCYxenu1RkeJsCQeXA9A4St/bsTCxepHJTtsQrqIjdzaTfw0+hbf
         dbzCQdJ3XVK3HvNBMLZVKrTv+6WG41Mw3vhiwnqWnAJIIZAQnlJaUI1VWAmdQstncYYT
         MdPWGPQq3WX+V5afe+m43g0ETbMgBcQzkhG/kLAuM7gpJmcIMAgGkjKtp1/iQwTZgZ8l
         mAuNip512K5R1VvSNueYhqjakgB5p63oUxuVoywEAXtZQPXj+h5V20NLIYJf8LvZMg3p
         jUbuT3s8O3BBZopvheWaSrXn6pHzxD1SF8VfUKFWl6rjc+tHl2MtJ9FI4Rh9f3CCoG+H
         eMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764159067; x=1764763867;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c4iRe4aOrrtqdI0rXdKZ+xR4qIxt0v6dXb2WpyvPrtc=;
        b=fuk61yI0UGOf6+jhlYyvWjZpGTBboPWkbhc/PIbFwd0WMPggFJ3OGTwPPze3s/CkoJ
         hhQE7SLDlZbNbmq7fB4/Is33zGSXmdN94xhf2jf1FscMFLhCXTTal9CTWrbHdOIRWcYc
         1FsO3LJ/q3p9HC92Z63loXnXujy8JQXiIVkKzkzn3xmsPTDzjvsS52acGSEXlulK+Jpd
         j12Sg+hZ++jQBm6CEBD4WYGcPDbrr89aLge0D+jlQpoP235wtfVVK6RLWFCS0Ggp8M//
         G4RjrkpcKRfLLGcpX4pI9Mk6Gw+S8AJYh0dVIj+p5wj7YS3K202LICLarFYYaLCJNbzx
         MdLA==
X-Forwarded-Encrypted: i=1; AJvYcCWS8V765Zz6K0voqVVonf2pP7C6Ute97soA32jHFJuAhM4llw4IMupqjhsK3hBt1moqZGGnB/I1lIOYvwzh+Ibx@lists.infradead.org
X-Gm-Message-State: AOJu0YzyV/jJr40zxyMfzoTOQTJSMgdYLkGHuY/v4Mh4qg1F7wDjamnB
	2rgoJ5m0zy7gtk46okD+ofFFeP1X00l36qQoTEyuJ/YYXovtOHJNoCPV6sWEnRS8SGHBd743ERL
	6isRpmng=
X-Gm-Gg: ASbGncsrs/EqzGQ3tC5xpv4jJYApJju/LVGuAxy2NFmklXR+8xk1rv29qMZ+cBSjLrc
	0PahoIA+z7iXY7pz2nu4GG80sCvuJL6IPTeE50mLBjWSRDovmE4MEZuuXsPhzD5X/X3s+3E0PEG
	LmYS3e0NTPx7DZXTA7F+2HPWxpKgKLVji7JX0tvH1f4beyKnRiYjbqHSPqN0rPoAhCVKRXS/WnW
	TBMtCCNjU4mIHtUGAZs1aJyeG3xu3rXWUm9wPLZwb2iDqXrukl6qjVCtwvSAK2Oye2AONip/gpp
	M1vaPhKEAOJ8MPd4+n3xz3IrcFzTaQuBaWT4Wl8t3SabeaJYhpxm9APSHa+3sqpDsNstL9wF8gr
	Sq6RsoUew2cZ9Xuk4N1/pSbWuiUn6r1k+Gfdyp7LSMhleaM6sZEMWV69E77GouL8cBxwsWssb76
	0/f9U2v8pIy774IQJ2
X-Google-Smtp-Source: AGHT+IE0risfP7oMpnR/mh4vl4pRCpmyI7fxXRX57NmC+ibT7kErw26ZlIa+wn3mo0aiLmRAJ7cw4Q==
X-Received: by 2002:a05:600c:470d:b0:477:63b5:6f76 with SMTP id 5b1f17b1804b1-477c01d3128mr163153595e9.25.1764159066624;
        Wed, 26 Nov 2025 04:11:06 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adddb4bsm40718535e9.7.2025.11.26.04.11.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 04:11:06 -0800 (PST)
Message-ID: <da2a3e18-80e0-4aca-bbc7-45c1353217d3@linaro.org>
Date: Wed, 26 Nov 2025 12:11:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: etm3x: Fix buffer overwrite in cntr_val_show()
To: Leo Yan <leo.yan@arm.com>, Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: suzuki.poulose@arm.com, mike.leach@linaro.org,
 alexander.shishkin@linux.intel.com, pratikp@codeaurora.org,
 mathieu.poirier@linaro.org, gregkh@linuxfoundation.org,
 jserv@ccns.ncku.edu.tw, marscheng@google.com, ericchancf@google.com,
 milesjiang@google.com, nickpan@google.com, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251121002350.1166758-1-visitorckw@gmail.com>
 <20251126120914.GH724103@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251126120914.GH724103@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_041109_776959_1E5724E1 
X-CRM114-Status: GOOD (  18.81  )
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



On 26/11/2025 12:09 pm, Leo Yan wrote:
> On Fri, Nov 21, 2025 at 12:23:50AM +0000, Kuan-Wei Chiu wrote:
> 
> [...]
> 
>> I noticed this issue while browsing the coresight code after attending
>> a technical talk on the subject. This code dates back to the initial
>> driver submission over 10 years ago, so I was surprised it hadn't been
>> caught earlier. Although I cannot perform runtime testing, the logic
>> error seems obvious to me, so I still decided to submit this patch.
> 
> I have a question for maintainers.
> 
> The ETMv4 architecture specification shows that ETMv4 was released as
> a non-confidential module in May 2013 (with the confidential release
> even a year earlier). So ETMv4 has been a public IP for more than 12+
> years, and ETMv3 has been gradually retired since then.
> 
> This fix can still be applied to older kernels, but seems to me that
> now might be an appropriate time to consider removing the ETMv3 driver
> from the mainline kernel?
> 
> Thanks,
> Leo

Yeah, if anyone is using it it would be on an old kernel surely?


