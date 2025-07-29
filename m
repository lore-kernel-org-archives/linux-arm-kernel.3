Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E24AC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 22:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MWallFmHDs9ZWDkZSi+x55d0KJtII8ohAMcXEHud3xg=; b=iBc5KdKbHbDyYOiCdkS8hk5ERW
	sr9tj4uG6d6ASX/xEMXWObDAgDJ8DAMpXgqV3jNCLaAGiRCcCU0mh3n4KIRfyGWcEeA7NXArpH7KI
	VDKwbz0HtBbHmK6rLsNyPCYOpYH5uE2O+gyTnn2KlzMoyrRVdkAAuq3rlZs1yJOpkwf/7gzKwGTkN
	AYovYkrs2CRghxHy+oD/cQIOsltGYygfs6aYFeBQdCuj/lwOavVOaCIce9d0BqFo9IzT5Cp+EpyA/
	OXGEOlgVWdzcOliPffDlJICls1lfagmi+Y7twv+t3jvwf/lxvCSkMXFggsq/s1cXxG4tc39Gsa4lg
	7JLR8rOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugsQn-00000000A06-40gp;
	Tue, 29 Jul 2025 22:04:21 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugsOL-000000009qV-06vi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 22:01:50 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-4ab7082b3f7so73105881cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 15:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753826507; x=1754431307; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MWallFmHDs9ZWDkZSi+x55d0KJtII8ohAMcXEHud3xg=;
        b=k8Ltyzi227MjYTx0+qVqT3XlfJpWPoK2cw+u8kVDJpgayAZtMldazRTrBsj4Qfzyan
         735YMbJoevTGOGMLAMGgFoVUyaSJ4G0GEj7JjjsQUyKmGV37XnHk4CjdSpQk1bMs0lWq
         w/fYb8bh5qjfa7k4nmVQowMF8tMou8qu1K62z6HUifkr8r0S5Jw70jLwYptv9uGrbbVS
         G5VbnFfR07cIkkj32/GFzDiY/dRmyBNMIVEl095KfCdyy0a39alRywpicxCWp8d4PFW1
         lzm2FT6IhLZ9FSeOyzv8qz3MBnd+5quGLelhP+eNC9h6RUGbiIaAXfeSKSj9VQpuIcT+
         cXTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753826507; x=1754431307;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MWallFmHDs9ZWDkZSi+x55d0KJtII8ohAMcXEHud3xg=;
        b=fHxRf1MhdNqfKArY6jD1Ct3WI9EtXEGa3z1rpBA8fCi97RgpC4QGJne0M5xNf4puOo
         w2WGbMZI+Kfbt6YUkD/kMAAsMlpNxN8Ae+9CyCVKOYNNDd3i0IFJJudgNB/dcQr5vmEc
         51TaGeVT2tEbZHFovir/lyVsi4V7EZJPT6k0907qgFuqWkbMC5CTGL94+i8hP+MfBXMU
         5nbX7buQPey5V4NxZcivcMs9RRhUXnTzWDKIgUau8RMAbHvWV+Xv5VgTqCjE/kJr08gX
         GPO/WENrpJktWzUdrJLGxZCUG2vxZGlJWbnpMRVM5DxJ87wcmgLj+OkUIXMwbweVRz5H
         1GrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjC2I29UIupEH1eObloCaAbybmb2436EOAjEGcMPd6TTY8QikQ6yOT6LjOmhLEo4zQckiSxgCfCNBZa92bbwu1@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2nL4Xmhdlu8vLAFG0MMi1k1BuzUlVFkURJo5S7WVzsSeMaysL
	s7hlDsCsAA7ofH3DNkKopZ6uCW3elqhcLMDDcFXoFeHPyjlf9ZzcWWlJ
X-Gm-Gg: ASbGnctjg1n/Gxzs2jq9M3L3ERaF+5X7h2I14lApaCnpvz25kyY83Gm0GexCGhNQYyT
	F4KfyE0I4qVYl6r6NKTdPhUYir2Vpic6vXBjMOzAjBj7momXCNx6b1kQ86rLn6NI3a9nx9D3x+m
	zciFu5v1UGG6LLXsiY3GnkygjFNzpFpziW2kT8OFY4YzyrgSjbhd6i2VZZFFZV5Z5xxyCTkqppI
	Et63gU8Ffai8qJPlRmN68Vllcr6OoZWu8jqJxmBjM4f+DhXFiCqQckdnenPXnrVydoDXruAOUy+
	LsDN6L1+nykG0WyksTeXaMRmCdl0tsq0GjEGsUCx+mk5lihScFkgplWTTgNxhgwpA+bMqTutLXW
	OXRz7EhI8bYLKN6sZm4j3ffzD194mFlWeQjGzRKS3C1Pg9/v9y2zFqY0/qU+vY7f0gmgzaTk=
X-Google-Smtp-Source: AGHT+IEvdcCG0w/+CuXlf8z4cdBDzm/VOuFAHwLTBB4uMWUEHDzTj5mE8m3z3Zn7Qfciq2gbGNvUqA==
X-Received: by 2002:a05:622a:15d1:b0:4ab:5888:38fb with SMTP id d75a77b69052e-4aedbc3afb2mr21371981cf.32.1753826506905;
        Tue, 29 Jul 2025 15:01:46 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ae9966e30csm55570921cf.55.2025.07.29.15.01.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 15:01:45 -0700 (PDT)
Message-ID: <5f68f153-c633-45da-96cc-113482e0b6d1@gmail.com>
Date: Tue, 29 Jul 2025 15:01:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linux-stm32] [PATCH RFC net-next 6/7] net: stmmac: add helpers
 to indicate WoL enable status
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
Cc: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
References: <eaef1b1b-5366-430c-97dd-cf3b40399ac7@lunn.ch>
 <aIe5SqLITb2cfFQw@shell.armlinux.org.uk>
 <77229e46-6466-4cd4-9b3b-d76aadbe167c@foss.st.com>
 <aIiOWh7tBjlsdZgs@shell.armlinux.org.uk>
 <aIjCg_sjTOge9vd4@shell.armlinux.org.uk>
 <d300d546-09fa-4b37-b8e0-349daa0cc108@foss.st.com>
 <aIjePMWG6pEBvna6@shell.armlinux.org.uk>
 <186a2265-8ca8-4b75-b4a2-a81d21ca42eb@foss.st.com>
 <aIj4Q6WzEQkcGYVQ@shell.armlinux.org.uk>
 <b88160a5-a0b8-4a1a-a489-867b8495a88e@lunn.ch>
 <aIkQxlqmg9_EFqsI@shell.armlinux.org.uk>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 WlfRzlpjIPmdjgoicA==
In-Reply-To: <aIkQxlqmg9_EFqsI@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_150149_074878_CE11E3F0 
X-CRM114-Status: GOOD (  14.19  )
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

On 7/29/25 11:19, Russell King (Oracle) wrote:
> On Tue, Jul 29, 2025 at 07:27:11PM +0200, Andrew Lunn wrote:
>> And i did notice that the Broadcom code is the only one doing anything
>> with enable_irq_wake()/disable_irq_wake(). We need to scatter these
>> into the drivers.
> 
> It's better to use devm_pm_set_wake_irq() in the probe function, and
> then let the core code (drivers/base/power/wakeup.c and
> drivers/base/power/wakeirq.c) handle it. This is what I'm doing for
> the rtl8211f.
> 
> IRQ wake gets enabled/disabled at suspend/resume time, rather than
> when the device wakeup state changes, which I believe is what is
> preferred.
> 

Sounds reasonable, I will go test that instead of doing the 
enable_irq_wake()/disable_irq_wake() dance. Thanks!
-- 
Florian

