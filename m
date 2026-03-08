Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6D6EA8537
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 16:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3PyMN9ppxtG+J2rzulMPcaCg1huHspZ+ZEiksw/I16M=; b=L/bNaz2fBT/X9/rCaXOAatTKaT
	uI84ngMpe9UsiJEheUn3ASr6yId4CuirX4CKQNG2jmPrCC8Lole5tVf/caTo7OXAlomtTIj1J+7QK
	qH3x+Vxdm8s9fciStKnhdou/vfCIRYS4onkMV8gn9HfTu9ueZP2woDafRS7HvlcMW3AmyJ8SnQ9zQ
	mIvanBP4NQsngyYojsIJdhMDbVvQjvUBOrKU/G/Pc5gF9ZOPSb/fv+l8CYOPPAgC478vWu5v5Tes0
	4S57R6UIDG6RzO95KvU6qKQRpncnn++9tiCRmAdS8uv3liqF1PEBgxRbIMixa6/BBw6iHUNcrbK8M
	C7d1dhdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzHBP-00000006BAy-2LjN;
	Sun, 08 Mar 2026 16:40:47 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzHBM-00000006BAa-0Pj2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Mar 2026 16:40:45 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4853510b4f3so8068425e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Mar 2026 09:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1772988042; x=1773592842; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3PyMN9ppxtG+J2rzulMPcaCg1huHspZ+ZEiksw/I16M=;
        b=K85x3lhRe8bX8dIT1bZVbt/VkxWkRn5rjKLPgMh51CclJ5sUuiEBvW5qmHRzV7iJo5
         g6lLsU1E/zgOBBWqtdyXpgzjVrUB8tKMaZgFYXDJoH/0ZzxeeEtaxX00O9BcrH/MmLYn
         5SkHZ5NpReBC8ZqFRMOVu2UgDLUx+z8pEMCi0Iu6PK71bZiJp0iPWQRMC3TNenH+kgUs
         jHeQzlJ4mV8fbW4pMzucfgHTd4bPI8YSOaTOiswLvSFcnMsDX/wYjt+ZtfwiGeDYzjbC
         OcdMjb1qK+izp4jO9XBocfc3YgiBzfxgDBnBOJ1Opvl01yeRDUhNK2ztL28qrJBo9KZi
         xtyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772988042; x=1773592842;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3PyMN9ppxtG+J2rzulMPcaCg1huHspZ+ZEiksw/I16M=;
        b=Do+IYvTnQv3a2D+fPTMjn1nnwwJVuxdmpmYcQBsdy/WvQM66fCm/PM/+5uKZHbI4jM
         +L5wWzenTi8fTfPFTqjdliQW92R2YJhRXbUHSSIMVgIy/j9h7/dZT3/LQDc3m6MppggJ
         xR0dLnmRLIWVZdF0CMYVt12rS7rwQgHJ+qjGIxZMjY+uCl0bKemAPju5+PQGA7hj3uVP
         57b3TtSHe5o91EufZZBX+mmInzDBlxh2PyvFfghjFZOPsD435FIfTfIvCewFmItBFQWi
         UKtwxxK28NfDWVq+qVssK6yrilwogvU4ZxCCvFCwrxIU2B2v+BaRcUA5tFslbU3KUv0F
         el9g==
X-Forwarded-Encrypted: i=1; AJvYcCV3tyyop1ZgkVPSMU5/UvZbvBbGKgk9SLOKvCXaf1+lCAQdQxSUSuTFuFbcMibXd9XEyQqHyYdMZbPb19ugkdBe@lists.infradead.org
X-Gm-Message-State: AOJu0YwQVIw/9wdXZwdKGlRjzW0CemozT0tPnk9OOxLQzE6zGYGRIEE/
	gX71EAsMOO3yVeVKjk8Gpc7ErlBvHEbKRApz8AlwcPf3gk4szRelpixF+shJL2HLRgg=
X-Gm-Gg: ATEYQzyOP1gnTcmHHvx0xxbcq1RNAE/o1FZZeMJNEJ1YeV0MxmWdzsW6Cqt901iOC6G
	LH2OlPPL8yMj/SsPl6jKQuf3UifYckOCgrfo4LpkxXOOGgWekvqW9vzgxr4kknJWN5gBb0MX/6j
	Nxp90QtCdvWdqMkl7ujTqvpRpB8hY6JS7G1gPwq3RCwzue3evnxlAWyald8XPq7Tz2scfrHX0Fb
	MbjwdAa6HWZPGcQ11nd3iuHOdK3ySzDh39FisNpT3GN1+LS1HCTdA0w7tpIg9SlICIGxO3QIIsd
	mqXBI+coMSs8VHRbzp2080T4takp4hst455c1TuoTMEgm7aeVwF1BTLq73WrqGjH6xt2OHM+BeB
	dQnJ3uuazSCzTalhpIels3D7u/ybnxdkKGxxnYjTjjJ2a7I1eK3i/U9EgBhqQQWyujqGMcXb4nj
	gdJ/7eWonWLsYbm2GT83HBS55NcwFIyA==
X-Received: by 2002:a05:600c:34d2:b0:483:badb:6191 with SMTP id 5b1f17b1804b1-48526923595mr140938685e9.8.1772988041927;
        Sun, 08 Mar 2026 09:40:41 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485244b6e9esm112420115e9.5.2026.03.08.09.40.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 09:40:41 -0700 (PDT)
Message-ID: <9157e13f-909b-430f-b2cf-b520bcbd56a9@tuxon.dev>
Date: Sun, 8 Mar 2026 18:40:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/19] nvmem: microchip-otpc: Expose UID registers as
 2nd nvmem device
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>, Alexander Dahl <ada@thorsis.com>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120154502.1280938-1-ada@thorsis.com>
 <20260120154502.1280938-8-ada@thorsis.com>
 <05128a16-553d-49d5-b09d-2c3e03cb4421@tuxon.dev>
 <20260220-maximize-glance-a0abd1806c44@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260220-maximize-glance-a0abd1806c44@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_094044_186324_0B05372D 
X-CRM114-Status: GOOD (  15.61  )
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

Hi, Alexander,

On 2/20/26 12:38, Alexander Dahl wrote:
> Hello Claudiu,
> 
> thanks for your feedback on this, see my remarks inline below.
> 
> Am Sat, Jan 31, 2026 at 06:11:56PM +0200 schrieb Claudiu Beznea:
>>
>>
>> On 1/20/26 17:44, Alexander Dahl wrote:
>>> For SAM9X60 the Product UID x Register containing the Unique Product ID
>>> is part of the OTPC registers.
>>
>> SAMA7G5 as well.
>>
>>> We have everything at hand here to just
>>> create a trivial nvmem device for those.
>>
>> Please massage a bit the patch description to match https://www.kernel.org/doc/html/v6.13/process/submitting-patches.html#describe-your-changes
>>
>>>
>>> Signed-off-by: Alexander Dahl <ada@thorsis.com>
>>> ---
>>>
>>> Notes:
>>>       v3:
>>>       - no changes
>>>       v2:
>>>       - Use dev_err_probe() for error reporting (thanks Claudiu)
>>>       - Move required register definition over here from removed patch
>>>
>>>    drivers/nvmem/microchip-otpc.c | 38 +++++++++++++++++++++++++++++++++-
>>>    1 file changed, 37 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otpc.c
>>> index 34c0d7611f3e4..b35ed13b004bb 100644
>>> --- a/drivers/nvmem/microchip-otpc.c
>>> +++ b/drivers/nvmem/microchip-otpc.c
>>> @@ -25,10 +25,14 @@
>>>    #define MCHP_OTPC_HR			(0x20)
>>>    #define MCHP_OTPC_HR_SIZE		GENMASK(15, 8)
>>>    #define MCHP_OTPC_DR			(0x24)
>>> +#define MCHP_OTPC_UID0R			(0x60)
>>>    #define MCHP_OTPC_NAME			"mchp-otpc"
>>>    #define MCHP_OTPC_SIZE			(11 * 1024)
>>> +#define MCHP_OTPC_UID_NAME		"mchp-uid"
>>> +#define MCHP_OTPC_UID_SIZE		16
>>
>> I think you can drop these as they are used (individually) in a single place.
> 
> If you don't mind I would rather keep it here together with already
> present similar definitions, instead of sprinkling new literals over
> this c file.

OK for me.

Thank you,
Claudiu

