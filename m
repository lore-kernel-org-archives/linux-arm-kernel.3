Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930E0EA8537
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 16:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2k+tUSmAU+cizjj171ExMhB4UUnW5oz5jUnwF8rErI=; b=CMayoV+XkbtrH0P6/YcikcKMM6
	YbRXQPnU1+T0lIPWf6bfmud8ho+kfmE5vHaNhTuZ1O7sj6BTWTUI9p/bMDhekdy8csySKemaoNSAq
	Slalwl2HY7Q3vWAWrAK8CBa74ntFx2KgxOSYUtUS80lN+njieZpsLUlhC5E2+OYlJbdtBzDCf3JCV
	GICBBJyC+uzWtzzr1MRsnm6+b9mPh8CF7gGnThBIj1c7kwthD4H0fY/wOgYd8BFU9rNNZaDcL1Iln
	ueoZASuGRSZDDMQkMRvSPIXTfreQM9tJbQxee1xVQ8RS2HurD5ueT2OC+2B5it1mDpvU8M5rQ1qxH
	kG4Jj5Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzHDU-00000006BNp-0GoN;
	Sun, 08 Mar 2026 16:42:56 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzHDR-00000006BN1-2wNW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Mar 2026 16:42:54 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-439c944bb62so3371698f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Mar 2026 09:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1772988172; x=1773592972; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A2k+tUSmAU+cizjj171ExMhB4UUnW5oz5jUnwF8rErI=;
        b=qw2urZnesUBmRYCeEFM52ButbeGV8On9Mo+LBtpR+kT0YrWvNfnioSBermCWez/erf
         hARu4ErARIR67A0Urog16PvX2KS5UaV/brSilyAjRDOjp+TCSGPC+0m/9rmmbIp7yo6O
         czi9z9Mmxh+sIuln81T2n825p0W27f1QHSbYrZZtGRouUXetg1Qw7GIPBO5mu+LeszJq
         ebYolcPGwvHk5NEWFICxZ6+s1ydcXzitOab3ZhJlHM72EfnUyEyxUhROx0m2CdFBl64G
         D84JS14n7pnXJc8f+S8tJMwZlzPzu2VaGoxv5/r+EEDgd4VsfcDSNmrbqH9iQynYXqQ3
         qxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772988172; x=1773592972;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A2k+tUSmAU+cizjj171ExMhB4UUnW5oz5jUnwF8rErI=;
        b=ihTotuAfP6uDev+s78yLCpaJvwk1DQSVGG4f9FAgqw4i1jIBhbCEGzwimnEuhl3BTF
         5RMWuVjwjE9vWi+zU123g/IwJ8kwW+LltiPFZdLCml7Aiyb44cBPU5PvC1c6ql/0ZHk4
         WcUS9NGa3TzcvASkR2sOOL1i3Bg3bYitxvHnq4njC7Mpz73gSnjhzQaUl87eYU2pQvaC
         05N/dQYlhcXP5wAxZOZXETbElU00kwE0Ysluj1M4R85+FqVhvuUwR69ZjWhFJ8Hi688S
         9rZqvPAiaSnBe8TYKOud19NyFPpUXDBbxyPW+H6vK2Q0qkx0Fy/hPay734sTkc1HYBK2
         Gr1w==
X-Forwarded-Encrypted: i=1; AJvYcCU163RxtQHvsBEFvTeVRCgRU7yKlYuXj6KfNfEMU+CCvWAVBZvHbA3y9WSPAIplGeeHlQPZFu9nHTcAUeFJfwXz@lists.infradead.org
X-Gm-Message-State: AOJu0YyVpwQbkzCoCHWllaoqW1jrIYhAQbijxLqTSehsDdFETo30wfHT
	Bzt2jb/x9Mdzhcz8jpq6klId0ayxBgfpkUR4jx1bQOpxqXSvHWvNFrJcwD6eEBE2A8o=
X-Gm-Gg: ATEYQzyMyu7FG60mKD1BhQlaS9aQ5RjRh9cYrcGVhhV2nNIwcJCypS0N/4zwLrlwb9e
	Rkj6hOsglOZfdJjuoMoAOITjkhlJxvycpBftxBhR/mq2a7lC46m2KB82Tp+CAkc1pymoCwJZqCB
	jUvdSa4xjO91ynm++g1aof7hZqYpWns/kzciqRel5hbe3uro+qRqMvdxusCR2uVx5zgILGuICXy
	QG5UzeSdzmVTDmQ/aFB9QNfixoVeJA04TIdGiQH9OaxDTR5zAtBnRSFYE84MfJ0SEVfKe0AtYTl
	m/9tKOoIso97zDucKtrjxbrB3CYuV7Cfv8qnehqBZ5GnkQpLmQzvLKnWDFBUE2YIlMd+pFcn6uD
	xW4ONrOBFNmF7u/gjIZqRoYxLjion4kodfek6Ltax6remBgB0//u658dSso3m8MyvXADPwRkQj9
	B9E78z/acrkFTrZPZc4ZCv8jiF66tiAw==
X-Received: by 2002:a5d:5f93:0:b0:439:b791:f920 with SMTP id ffacd0b85a97d-439da656af4mr15645490f8f.17.1772988171670;
        Sun, 08 Mar 2026 09:42:51 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dadb85b8sm19331707f8f.17.2026.03.08.09.42.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 09:42:51 -0700 (PDT)
Message-ID: <cebf4298-4dff-481d-9a77-09d4fb4f7fbd@tuxon.dev>
Date: Sun, 8 Mar 2026 18:42:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/19] dt-bindings: nvmem: microchip-otpc: Add required
 clocks
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120154502.1280938-1-ada@thorsis.com>
 <20260120154502.1280938-3-ada@thorsis.com>
 <f406abde-c7d1-4ed6-b7dd-5336956bc795@tuxon.dev>
 <20260220-bloomers-runny-e69ab1966b9c@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260220-bloomers-runny-e69ab1966b9c@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_094253_756234_11282DDD 
X-CRM114-Status: GOOD (  18.49  )
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

On 2/20/26 11:58, Alexander Dahl wrote:
> Hello Claudiu,
> 
> Am Sat, Jan 31, 2026 at 05:47:05PM +0200 schrieb Claudiu Beznea:
>>
>>
>> On 1/20/26 17:44, Alexander Dahl wrote:
>>> The OTPC requires both the peripheral clock through PMC and the main RC
>>> oscillator.  Seemed to work without explicitly enabling those clocks on
>>> sama7g5 before, but did not on sam9x60.
>>>
>>> Older datasheets were not clear and explicit about this, but recent are,
>>> e.g. SAMA7G5 series datasheet (DS60001765B),
>>> section 30.4.1 Power Management:
>>>
>>>> The OTPC is clocked through the Power Management Controller (PMC).
>>>> The user must power on the main RC oscillator and enable the
>>>> peripheral clock of the OTPC prior to reading or writing the OTP
>>>> memory.
>>
>> As this was not mentioned in the previous datasheet versions, the current
>> driver don't handle those clocks, and it probably worked as the clocks were
>> enabled by bootloaders, I think the clocks should be marked as required and
>> this patch to be propagated as a fix along with fixes on driver and device
>> trees.
> 
> What do you mean by "clocks should be marked as required"?  Where?

In the bindings as you found that the IP don't work if the clocks are not enabled?

> How?  Is something more necessary, than already done here?

Update the required section in the yaml file with clocks, at least for the 
sam9x60, as you found it is not working w/o it.

I presume it has to be done for SAMA7G5 as well (as this is what the newer 
datasheets states) but that would involve adding required clocks now which were 
not needed later. I'm not sure what is the procedure here. I'll let DT 
maintainers comment on this.

Thank you,
Claudiu


