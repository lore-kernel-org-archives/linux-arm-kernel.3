Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DDFD1036C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 23:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YSgFECtP1z+NfavQTbIkfavnGHKDphcmbRff6uSNyR4=; b=JARBEFxfTy/o5XMD75fxgT7ocX
	itQEKLRfS9y5QbUiHT588QvIgtMrtV1JiLatSPIMPImK8piN/i/NAyrue0lLwY+WRm+e/xWUex9gC
	oLMZKFN7MseVTH29tLaECgmf/HiEq8X1stOdoXm7cFF96p/6dEQxmGCMqT/KO8Im2ydFzHapq4XQk
	ZGvy258E3Vhp91JzA+jODGGm4CWNkyraUYhftMi7H+o8nNrCMXyKkMaQvm9cXAI/zOv/HHPHVbgqK
	9Rh+10XanGX+cvUIc1cgsndoUR6XCgUCubTMUYzZApDG7MvFJ+CypuSEB2LlgFcDKcYYeIFKz24zY
	Hi2ueucQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO2Y5-0000000E45g-11fw;
	Tue, 25 Nov 2025 23:34:17 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO2Y3-0000000E45B-0cTX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 23:34:16 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so58212225e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 15:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764113653; x=1764718453; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YSgFECtP1z+NfavQTbIkfavnGHKDphcmbRff6uSNyR4=;
        b=BTke/OEoJ+8v60MP449Pn9o2hEKx0xVr/s+wVFVY/SNM5jy1rRfX4/6Bc3vYICN4xk
         xAPAX7Xh1wHia0JWNiPwz4P1589ISlOv/6blBhv38UvXRN5FpPQbsnUOQpDAeTcOhTLa
         NncMD0L/kyw20wRYOrfyVLw3MkJeNciJ/wSvoX4LzYu9L+j3XRTFanDT6/O/AiY812jl
         6E57qSf4eofesWWoCsH0opp+kepfcJzNlRjG0XfyoqhZwOe3mA2DckkXwgFhCjN00RZy
         SJiTDCrANaJzmUblbxrUA/VnUk07bKZYo6LdcoK0DQGz8H6oNIGM038CSjp8JsF0StmS
         fU4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764113653; x=1764718453;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YSgFECtP1z+NfavQTbIkfavnGHKDphcmbRff6uSNyR4=;
        b=GSneYTYZXtVpiV1I06088GMd6qMHt9YEN63jnaBpsbwaqLCt18S0uKDO+d1IQPrYrb
         NhR1Byp2MCPXVQLliDvun9cUNVXzYBuWiboBkPl6zinLw56AK7mUX9XogXCnpISTKzzx
         +Tk8TzuewoLCRCGFVfntoYYHnRQB587xk0oEmwZgF1338URw8kjGjvtMVKyZcr51Ct/Q
         ksKZN345akEhUq7ijphxFvQyQbxHLr8Q1vV/tHHGm2kJ/k6jcD0Z1VqRUJ64E9Sr4JZR
         H9MCQwAIpFfLnSnnlNxKUkChQdkD6PWubwGUjGXYP1SLI3EatvIuWIKMJMUiRGzWgkKX
         uvtA==
X-Forwarded-Encrypted: i=1; AJvYcCW+TuG6GtURv+/wIPKnSZiPNg0g/Z9msRYwzY/mlPoh6/TKR0J/TqWV0l2xMaPB5oHEuEYH3mPfJOAXp7nIpMZS@lists.infradead.org
X-Gm-Message-State: AOJu0YyOKVH8NKAglx54kMMksALcxGv3x2ZY0HPh0EtzfBQj4Xla+r5z
	qAHiiteNX2NVmcr321QhcUN0qwNihldG60fUZdP5qyxn5tNoQ9E8dwf6
X-Gm-Gg: ASbGncsz1H90Slk+TLa/L+d6nPKgsDhhaa7D2TDsByTv3G8xcmAf0D9+FRxEEpQmWvJ
	DCbaNkKkvG0iOX4jv8mqNptJyXWgVIfrgishaMogOaMAALL4n1dQAU8cihrfvyMMf3VEH/48rVW
	k7lOyUeSFBSdOpDuEGyF5smIZUiDOipAQd2BmAbRotRb2iDOo+BXP6ZNZO0R35hjJq8/H7oZqYd
	5CpRBY+1YdWSdobDW6UspxV4/uWVl5/amupkt/wqhx6KyUmizDdAkS4UrgkAHOsMUyrMmOicuhE
	SHkk97Rg5GTS4JlQnTSL9banxtCfwkZ0B9mjGkYJ/RCa4N27JFB5SrcLYtFee6gd7z7L1Ok3qUL
	Nl5VN+dj7Kr3AkKPQ+Q20xilvdpFBwgx4ENowrnE9DemDgVxFp2uZ6xRA5JJIj7/AgnzwMgk74M
	cZq+g69FKz3Frf46PhOxOr8zLAXHM8E124f5W8m2VZlw==
X-Google-Smtp-Source: AGHT+IFalyeW7faMHDifKV64koi9lzILMgomHzb1dC1jupNeqdx4t6uHO6adv/AIDeDahL7H73btnA==
X-Received: by 2002:a05:600c:4443:b0:477:af74:ed64 with SMTP id 5b1f17b1804b1-477c114f00amr174145245e9.27.1764113652924;
        Tue, 25 Nov 2025 15:34:12 -0800 (PST)
Received: from [192.168.1.129] ([82.79.237.20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790addeeaasm12850205e9.7.2025.11.25.15.34.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 15:34:12 -0800 (PST)
Message-ID: <9ce8bcf1-7a62-44ce-81e3-f1c51f8be9b0@gmail.com>
Date: Wed, 26 Nov 2025 01:34:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] reset: imx8mp-audiomix: Replace mask with bit
 index
To: Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20251114133738.1762-1-laurentiumihalcea111@gmail.com>
 <20251114133738.1762-3-laurentiumihalcea111@gmail.com>
 <aSCHjNqj3CV3ahX0@lizhi-Precision-Tower-5810>
 <6be8a682-6c72-45c8-be0e-880ab66045ff@gmail.com>
 <aSR8q5cE/XXbZuF0@lizhi-Precision-Tower-5810>
 <4a022153-009c-44fd-8c4b-39819ae69390@gmail.com>
 <9f07e541fc000d9065c1ff1716f1edc4c2278c8d.camel@pengutronix.de>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <9f07e541fc000d9065c1ff1716f1edc4c2278c8d.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_153415_218239_120F072C 
X-CRM114-Status: GOOD (  25.91  )
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


On 11/25/2025 12:40 PM, Philipp Zabel wrote:
> On Di, 2025-11-25 at 01:59 -0800, Laurentiu Mihalcea wrote:
>> On 11/24/2025 7:41 AM, Frank Li wrote:
>>> On Mon, Nov 24, 2025 at 01:28:32AM -0800, Laurentiu Mihalcea wrote:
>>>> On 11/21/2025 7:38 AM, Frank Li wrote:
>>>>> On Fri, Nov 14, 2025 at 05:37:34AM -0800, Laurentiu Mihalcea wrote:
>>>>>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>>>>
>>>>>> Replace the reset map mask with the bit index to make it clear that all
>>>>>> reset lines are managed by exactly 1 bit.
>>>>> I don't think there are benefit because I met some periphal need a magic
>>>>> number to reset.
> Toggling multiple bits in unison is different from having to write a
> magic number to a register field. The driver currently supports
> neither. That is why I suggested to change from mask to bit.
>
>>>> Please provide more information. What SoC? Which peripherals? What block control?
>>>>
>>> I can't reminder exact one. I grep some code
>>>
>>> [IMX8MP_MEDIABLK_PD_LCDIF_1] = {
>>>                 .name = "mediablk-lcdif-1",
>>>                 .clk_names = (const char *[]){ "disp1", "apb", "axi", },
>>>                 .num_clks = 3,
>>>                 .gpc_name = "lcdif1",
>>>                 .rst_mask = BIT(4) | BIT(5) | BIT(23),
>>>                 .clk_mask = BIT(4) | BIT(5) | BIT(23),
> According to the reference manual, these are three separate software
> resets for three separate clocks: lcdif_pixel_clk, lcdif_apb_clk, and
> lcdif_axi_clk.
>
>>>                 .path_names = (const char *[]){"lcdif-rd", "lcdif-wr"},
>>>                 .num_paths = 2,
>>>         },
>>>
>>> mask is more extenable and easily support more hardware in future.
> If such hardware appears in the future, it will be easy to adapt the
> driver. Usually we don't prematurely add complexity for possible future
> hardware.
>
>>> Change to bit number have not big benefit.
> It improves readability as it makes immediately clear from the code
> that all resets correspond to a single bit.
>
>> sure, I'm fine with the mask-based approach. The big idea here is to make this driver
>> usable in as many scenarios as possible.
>>
>> Philipp, please let me know if you're okay with the proposal. Will also have to tweak
>> one of the subsequent patches since, so far, we've been operating under the assumption
>> that reset lines are 1 bit.
> Given that the current code is already using mask, and if you think it
> is likely that there will be need for reset controls that require
> toggling multiple bits with a single write, I'm fine with keeping the
> mask.


ACK. Unfortunately, I don't have an use-case for this driver in which we'd want to

manage multiple underlying reset lines as a single one like in Frank's example. I'm

also assuming Frank doesn't have one either based on his previous comment.


Despite this, however, the previous version of the driver was already able to handle

this use-case. The single-bit reset restriction was introduced by this series. Therefore, I

suggest we reduce the number of changes and revert to the old behavior.


This way, we'll avoid reverting the patches if someone does ever come up with

such an use-case. I'd say the driver is simple enough that the code readability will

not be severely impacted.


Either way, I think we'd be fine with any of the two approaches in the end.


>
> regards
> Philipp

