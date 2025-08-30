Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B5FCA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 11:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uueiXNXZTNf1xQdqp2NNONyv03FSw+XsD3EN6MNABTs=; b=zP5eRq0j/mC9NFkJCYRejtoxxg
	9tY14AGZ968iKJaNldjtby50wefSc0VGNL0X1BwVzVFtheO8npfzwdUF9cJKQuumGO+0Xs1R1F//u
	M9Kh0zng7/GH0C7hDdkMnsXW9KVtPEVIi3trQyryWjqeWtMjBqqSCe3NcY+5XRThInMGa6lEOKvJU
	7s/H51QAQHwNZyCxkSJ5erkVkS+Ne5wIINT2T6Y/Dah9yCfr0PMiJrU85Ci47HzrqaDaLHoQExMau
	8OoEsOoGvv/SvKi2CjKAJiWDLtb9SFxJNfuAoPirDiS5uwqpuE/wMl3xrImk3mWPeFWUyh/idqn9D
	3p29AeXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usJvY-00000007p2i-3Be5;
	Sat, 30 Aug 2025 11:39:24 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usJlo-00000007oUK-1WbR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 11:29:21 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45b79ec2fbeso19439165e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 04:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1756553359; x=1757158159; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uueiXNXZTNf1xQdqp2NNONyv03FSw+XsD3EN6MNABTs=;
        b=it4rrW9xw6Xqz3ccIP8lSyhp6Lk9SkBmnSQ7L1teDqAlNLhwq98YzLppggxlPGiZUw
         koEj//Bw5vIN7X/1BYi+ttzOzw8s12SN1Q5FvjNceJycgpQpSt8OBUHbgh9GUakN7v46
         9zBpM0JCSuo7vke1sKLJ+M6hJdTpmw/UBYamqGb09LRC9GfZHVyc+7T5kUoCdx3As6Ia
         qC9GMZ3urwivUxaeI9jollOHOea0j4ypzFmVvZNUOW7W0LiYUgnBvYUeYfCn/Xxun5nx
         l3YTYtkBGMxO+nXshcqv3ixQ6CJF4z6Qs5ySP9cLDnYNoIAvvf3F01pa88C8TLwPObIc
         2eGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756553359; x=1757158159;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uueiXNXZTNf1xQdqp2NNONyv03FSw+XsD3EN6MNABTs=;
        b=IyCZCGtyHIZMfBJvskSCIVqk4Vr9mR2iRs+DSCYS4p/hK0PXE0ao4kQsPMpIMTn3Bv
         K5Cei6EIxmhpdbNhLec6/6s/I0FO3oOi0cJz1CqN8VN1POYA/6WfTyw8kZYs57ODowoB
         pymCxLNhrIU4drcXHzG2Tv8xo7zjlKqTDyVn8a/k6+ewItUNiY29Twh2wrxnzh3GAUxu
         7GqRE/wpQdP5BmiiGVqKaFFl9+qW9Ye3S6LkZ/cLkKSAye2N5nByNduxZ5q4OunjtUl8
         SCpafPj5INDEsT1owBixjsdIV/uTEN1j7cIa9c5dLC9ZLlzcgQBMgYRONE7orXPo+a+y
         jj7A==
X-Forwarded-Encrypted: i=1; AJvYcCUG/m5uFMvn4N7c7XpGUZN3BWJ31NAUZCstFaHcV9Q6mLcoWiMm07v0TgLTpU4+MovtvGx0K0HeKNKCNtdZGeI6@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6OAoTzPmWinhH4l+Bc+we5+snDAny2PBBHGqaDzUn1jmR28rJ
	rlW/1c3+oDLoyHxvfvko4yhiVswrdurjsiALmyBA0hsodnG4p4YZpRmPJbjl1ko1LhI=
X-Gm-Gg: ASbGncu8ciZE+RDEd9ix61A8kf8XQfyDNWFmdbQS4qWmlkMkk5gdGd3xACKEHJMaJ9o
	Vov2PELFSilt5MUfOooap8td7AfP66RSGQNTJrGNM0SmTPo+Zblud9FsxYH4WEEuAAy3PkRswNU
	15n16cQiBHIpMTPcpRpLLtJa6dRm+KVs+Vof67SuvEivkx6q+XVZtUENiSJTNHRNoqbA0LIavY9
	D/RCIj868FcDNBhBbAywFvNINDLVAbjE6e1PEYYNEGgcatyugN225gDAPSe4jGcqF/JqvAWbyI2
	1JegcDZybH6A8dlaqTMCSrrBTeZejZhQSdDeVHdarcVp5Lcjk5itGGWgAms3jvuUCJQuFPzPyyu
	cN/osFyg2yCXZZerrHvnhnGEqjsFqkMk=
X-Google-Smtp-Source: AGHT+IH7PPaiMEqmOZP6nRGeQaHOVjXxgYPNKD9nk3y6xLqZS0hlG/uTqTLFCXog9cpjfTh7D6DADA==
X-Received: by 2002:a05:600c:a59c:b0:459:d645:bff7 with SMTP id 5b1f17b1804b1-45b8556a7b7mr7706855e9.12.1756553358753;
        Sat, 30 Aug 2025 04:29:18 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e7d1319sm81613565e9.5.2025.08.30.04.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Aug 2025 04:29:18 -0700 (PDT)
Message-ID: <785d826f-232c-482f-a54c-e6baad39f502@tuxon.dev>
Date: Sat, 30 Aug 2025 14:29:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] clk: renesas: rzg2l: Disable unused clocks after
 resume
To: Brian Masney <bmasney@redhat.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, geert+renesas@glider.be,
 linux@armlinux.org.uk, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250821080333.27049-1-claudiu.beznea.uj@bp.renesas.com>
 <aKyX4YJswZLuqA6Y@x1> <0d71269f-1c78-4732-8235-5640bf340d00@tuxon.dev>
 <aK2gE0CysSWisFwB@x1>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <aK2gE0CysSWisFwB@x1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_042920_412559_219E43BB 
X-CRM114-Status: GOOD (  23.16  )
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

Hi, Stephen,

On 26.08.2025 14:52, Brian Masney wrote:
> Hi Claudiu,
> 
> On Tue, Aug 26, 2025 at 02:01:56PM +0300, claudiu beznea wrote:
>> On 8/25/25 20:05, Brian Masney wrote:
>>> On Thu, Aug 21, 2025 at 11:03:30AM +0300, Claudiu wrote:
>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>> This series disables clocks that remain unused after resume.
>>>> This is necessary when the resume process is done with the help of the
>>>> bootloader, as the bootloader enables various clocks when returning from
>>>> resume.
>>>>
>>>> On the RZ/G3S SoC (where this series was tested), the bootloader enables
>>>> the SDHI clocks (for all SDHI modules, of which 2 are used by Linux and
>>>> 1 is unused) and the clocks for a serial IP (unused by Linux).
>>>>
>>>> Testing was done on the RZ/G3S SMARC Carrier II board.
>>>
>>> Do you think that other boards would also benefit from this change? If
>>> so, what do you think about putting the call to register_pm_notifier()
>>> inside an __init block in clk.c so that this same change doesn't have to
>>> be implemented across various clk drivers?
>>
>> Yes, that was my other approach I was thinking about. I wanted to see how
>> other people consider this version.
>>
>>>
>>> Alternatively, if this is board specific, could this be fixed in the
>>> boot loader so that the clock that's not used by Linus is properly shut
>>> down on resume?
>>
>> As a result of your request I did some more investigations on my side, I can
>> say that, yes, in theory that could be also handled by bootloader.
>>
>> I can drop this and try to do it in bootloader, if any. Please let me know
>> if you still consider this (or the variant that implements it in a generic
>> way) necessary.
> 
> Personally I would go the route of fixing this in the bootloader for
> this particular platform.
> 
> If this issue affects other platforms, particularly across multiple
> SoC vendors, then I think it would be worthwhile to have a discussion
> about adding this functionality to the clk core.
> 

Could you please let us know if you prefer a mechanism like
clk_disable_unused() in Linux for resume path?

Thank you,
Claudiu

