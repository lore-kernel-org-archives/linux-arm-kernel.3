Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77DCC61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 09:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rqs/JjM/rhFjmn0l/Jy51z8ISXKwBj5TSNnqoIe2ZtQ=; b=zbx8pMCg3rY8iHCb0sjrG8Oyh+
	3VPnK4EKbE67Xt0X/77X2JwLyaFVcYeaHI/Ds++PETyCTF10QHAAWoqYLaoxls7WA8dCTnijtbs+Y
	0pzyN287LLpeQ16l1xiS3Z5vqs8WXU6HdQvELM50+pW0GM7/B1BFTskkm32VD8yOoa7BEbLT6kuvj
	xTxMIhJObZlcWOug2J9bziSrE/b/WGhrlsQkglFXjEVK/BYREW0CWwAQGzh4BJ9vgjodehmokMW4k
	am0GE1HiNVA4XWBuRuITZH7Q6F8slWPTiDWoJ+nLvP01hQ0HV/y4OI71VcMoPc/hiSpAmZmN8ygmN
	UhdclvKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzAO4-00000002FKA-2UGt;
	Wed, 26 Aug 2026 09:57:40 +0000
Received: from mail-wm1-f47.google.com ([209.85.128.47])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzAO1-00000002FIx-2iBG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 09:57:38 +0000
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4956869750eso4464725e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 02:57:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787738256; x=1788343056;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rqs/JjM/rhFjmn0l/Jy51z8ISXKwBj5TSNnqoIe2ZtQ=;
        b=tDrOoZgwYuHPBk0LSLbPPSpFSf/6NSJFG0kCR2LrPjL17e8WdkEJDlZorZ9G7z2KEe
         +rCovrcJDSW1o8K2bFLyeWdu1NuHE2U1+I8X72DwTt/kZw0AnqlurUQuKdxrISpmnxnZ
         0mmPYttXLrTx1uunbT2EHrtzJnnOZpUAc7bNiuOsjpnUGz9qOvkX89Td14G7dYcVanU7
         oiVleySr9PrDCANtMIX0U7SnjRLs4zkoapHFKQz6Dhh3kGU70QiR60lMaS0A9/cCPCQj
         6WFpeHCKzQUkcMsk1e82haE9yDf55FZN5Yj40Sgc9+Q8zkJ4O4u/Zt7DYLiUOUPdpKcj
         Q/zQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr6XPb+5r8u2mpgDxQL800xlSqoCL6bxDSmIKRDbfVOAGUbT2sQ2ioT1nnixkLcCXNZcqoJ60CdqldkyNVx1Scr@lists.infradead.org
X-Gm-Message-State: AFuF++lprF6CyD8FwCyNWW4jot1gTxEW3tRC+kg1t6X8rlOw2RLK+lTS
	kTEky/IpebCHzVXHHPUZ2/qDUsNbo1RiJJST+5fFaEBdlv4jHp/ZIJRz
X-Gm-Gg: AR+sD12D7M9yKiUd2mL+z4ndJIwcPBGBfV1pUrVUs7Hyy8G8oXpMrY2S22R1Mxdq/fY
	2CGicixk1kd+FUYDMPLwnBk2NdwmJbMYXmjiyUuewjJMJA8+cM3sKyXX2L6pDnXRO4ZX2QjsGG+
	wGPFoJWyKakwIHni5wW+RXLmVEueyxUa60xEdoj3Oyl/f/h5tWemkFZJoMAsxjw/OPBpv89CW0T
	VH9dGgJspSkxHRPZAUYAt+zTEjxGYYODG6SS7js+M3BotqVxIIcYHIYlmFgFKF51k24FS3qnti9
	otChIa4otCWnQ0AxJMF83i9sVYMjohOebAQ5KMdb8iI3pW/lwlVOO0EUfZfvzl2RRA3FroxPTdS
	MQy9RtJhFlEd9PsSZvp+KL3UJEXYf42JrYpSNwKCP7LzAQccN/B6DstohKWcLNZjs6ciW8N80Gw
	Hu+q97I4T5+/KkxFgyIVTDQzvNwh61hpooTLQDC0tK9uwV4OgWsVNKGwMT1hGHG55PC9+4/+d2P
	0pyl7wp0uRBhZBS4wpVPQ==
X-Received: by 2002:a05:600c:620b:b0:499:516b:83d5 with SMTP id 5b1f17b1804b1-499dc7240a3mr44654155e9.11.1787738255490;
        Wed, 26 Aug 2026 02:57:35 -0700 (PDT)
Received: from [192.168.1.135] ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dcae3216sm20357655e9.15.2026.08.26.02.57.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 02:57:34 -0700 (PDT)
Message-ID: <2800152c-25e0-401f-950c-15942c4f9a04@linux.com>
Date: Wed, 26 Aug 2026 10:57:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] clk: meson: t7: Intermittent boot instability and memory
 corruption on VIM4
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jian Hu <jian.hu@amlogic.com>
Cc: Brian Masney <bmasney@redhat.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <3930906f-783b-4d72-9260-ba25cc8081cb@linux.com>
 <048697c8-8331-42aa-accf-d114774ac5fd@linaro.org>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <048697c8-8331-42aa-accf-d114774ac5fd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_025737_705924_AAC66225 
X-CRM114-Status: GOOD (  19.60  )
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

On 26/08/2026 10:02, Neil Armstrong wrote:
> On 8/23/26 17:40, Lucas Tanure wrote:
>> Hi,
>>
>> While testing mainline Linux on the Khadas VIM4 (Amlogic A311D2 / T7), 
>> I am hitting intermittent system instability, storage loss, and memory 
>> corruption during boot, unless I append clk_ignore_unused to the 
>> kernel command line.
>>
>> Because the failure is intermittent, I am running 100-reboot test 
>> campaigns to bisect the remaining clocks and isolate which clocks are 
>> critical and cannot be safely disabled.
>>
>> As testing takes significant time over serial console, I wanted to 
>> check if Amlogic or the maintainers could shed light on this:
>>
>> Are there specific T7 clocks or hardware domains that must remain 
>> critical/protected even without an explicit in-kernel consumer?
>>
>> Current clocks being disabled that don't kill the board on a test run:
>>
>> [    0.380313] clk: Disabling unused clocks
>> [    0.380413] clk: Disabled unused clock: rtc_dualdiv
>> [    0.380718] clk: Disabled unused clock: rtc_duandiv_in
> 
> Those could be used by low power stuff aswell, not only RTC
> 
>> [    0.381377] clk: Unprepared unused clock: a73_div16
>> [    0.381972] clk: Unprepared unused clock: cpu_div16
> 
> Those should probably be left enabled if they're used by the DVFS code
> 
>> [    0.382605] clk: Unprepared unused clock: f50m
>> [    0.383174] clk: Unprepared unused clock: fixed_pll_dco
>> [    0.383786] clk: Unprepared unused clock: hdmi_pll_osc
>> [    0.384416] clk: Unprepared unused clock: sys1_pll_osc
>> [    0.385056] clk: Unprepared unused clock: earc_osc
>> [    0.385652] clk: Unprepared unused clock: pcie_refclk_osc
>> [    0.386323] clk: Unprepared unused clock: eth_pll_osc
>> [    0.386961] clk: Unprepared unused clock: pcie_osc
>> [    0.387548] clk: Unprepared unused clock: mclk_pll_osc
>> [    0.388187] clk: Unprepared unused clock: usb_pll1_osc
>> [    0.388826] clk: Unprepared unused clock: usb_pll0_osc
>> [    0.389465] clk: Unprepared unused clock: tcon_pll_osc
>> [    0.390105] clk: Unprepared unused clock: top_pll_osc
>> [    0.390738] clk: Unprepared unused clock: aud_pll_osc
>> [    0.391361] clk: Unprepared unused clock: ddr_pll_osc
>>
>> I am not forcing any clock to be disabled; I am forcing all clocks to 
>> stay on and letting them be disabled if unused one by one.
>>
>> Any guidance or hints on required platform clocks would be greatly 
>> appreciated.
> 
> It's hard to say, this is dependent on each family, Amlogic should be 
> able to help here.
Yes, Amlogic, please help.>
> You list some clocks, but I don't understand you say that it's stable 
> only if you have clk_ignore_unused, so how did you get this clock list ?
I got this list when I add logs to the clock framework and run without 
clk_ignore_unused.
> 
> Neil
> 
>>
>> Thanks,
>> Lucas Tanure
> 


