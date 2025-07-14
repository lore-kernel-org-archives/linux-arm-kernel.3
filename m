Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E13BC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 17:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5BYeSn92YzzQF+VMS4Brh9M0r6cRiJUgo31LKCP5UVE=; b=x+UHi29H1eRtu1S3ZaQX315x2v
	YGbeRjMVhLyo2GvvRCHGlSvXF8RXG5MGdEKMJ7QliWw/UzPUoEnmVckJinyl7SuU9nLWjZi+g1vKJ
	bOqmMvM7roeVVqQkex8efkMeE0pEM/RKYHnmJ+6YhyZFgMvQllrtBieNXXYp0ekdq7y8MuwUDefAA
	fgmJ0Rdf2OVnJPtuAwfYJObzJ9jpkZNPRJyrvo5lnnp/OdEjvmQtit259EOO9pqhL3Q9EfHEsw7zJ
	Rt+UP7l8fj4jIbF2JZ8XRCj8mC2kuV62ZWDOBudsSUw/+NA++24zNsBzqnZGwh+Kd+l7RpmZ4JJQO
	fy4LEMPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubN9Y-00000002zAm-1dPo;
	Mon, 14 Jul 2025 17:39:48 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubLah-00000002mFX-3I74
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 15:59:44 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7490acf57b9so3177302b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 08:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752508783; x=1753113583; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5BYeSn92YzzQF+VMS4Brh9M0r6cRiJUgo31LKCP5UVE=;
        b=eXEB//107xJ1O+xRAo4g9KQwYI/6LxdWXuaamyb7yV2OLxhn0K4LhoZvdYp8P+eM7d
         uM4mp6PcvYPwEQ2kml7rDFhppl/Z6NvyGwsfIIVVwHOrm54NPYVPI/9PWbta9zS9f94c
         6oeBFWClCYkTrWM0VjeLirTRgVu7ZsUPaEpjAoBYO8H9ZA6Bg08wQ0iUVWGXkZuujEJs
         fOgfIyT3kSjKOol4VosbscquDTL5h4qYtAfI38O3jYXgIebWEDDIc+Hzlr2CAJupy0LN
         ZFJLK0cOM7M2ibEKKJFVWJIldWy0jYbx+W/5i8SQnMrOR3Nh0MiiugjF70WXBsox/YW0
         i3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752508783; x=1753113583;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5BYeSn92YzzQF+VMS4Brh9M0r6cRiJUgo31LKCP5UVE=;
        b=uCvImxb4BZ+esUDkwDxAtY7KSI25MURkazObP2RR3p/kqaM1KZCUF9KbWFhH35m2dE
         LG6Iex1bspELoHKgItSrSFXD+0+Rm2YPK+pLvyKjqN8QBOsv+QhgIwLP4Mqa1YzCZKE0
         USGts1v5fi+0XebFkJJ1C5fUjRcHgiKKbtDiQ9LOHNhRqmoB/d3nZhqtrqYxBtJj8WHY
         YaLlymSc60EVTh1U175myiwMhUHW7+D3tXP+K/xB1aXBVTZv7n+A3Y8q9rF3xCkt6gxx
         ZpuOoHdKHP3jIr04iu3Z5razmDG6tUSEwFNA+WPNbdY+38gj/6UTDc2MFMUshF8Nil3n
         smQw==
X-Forwarded-Encrypted: i=1; AJvYcCWxxrxCL2Jbt6sr402pNq7uzS9Ap0UWmnUUVSwWFgvH/87X2hzqZ3QDfgF1F9bV+Ge6JcXtjEUZrmyYIr7XuHGy@lists.infradead.org
X-Gm-Message-State: AOJu0YwgcIGizadrKpQZqRE1cvtjnTKhl2uCpDD3Mi8RbolFnsTvgQaF
	GBBNNvZkZtUGji2Doo822zXQtUKJMeHOc42A6g/2ciwZFEDr4knpivCA
X-Gm-Gg: ASbGncv0JxXRS9w5Ajnx9ETwiJt305pkEr0C4VMdhsDdPEbF/zBTHSV5aHrRtlDNQQN
	Z5sbZN+xOKcRLRK0GDmaHA4hRHm3mcGzpa3aaXqah120fm4+5Sa0aUUtOPosgFXm9WQVd4g97Xy
	tHRt3CtJ/MU5r1nyAoe7QoRdbTLxM8Pfnx6UeejCZKHwmNzepa0Qt1W7Y5gK5PHXO9E2I6UJ2Dg
	NhUV6ZLzR2Ie+7pbEnI2+bI2qDrNKGJK6nhrV0BlvojLvMqrHDRNhZiMNFMwcsxyAojV6aBg/V5
	WJDVQGvApcjntuhRZA3IdegNM2XX9qW+GJjlFBr/vc8SkTruW/EtlxWPZLGD94DaRv/DDwJ6VYD
	0qfgtlb3ov9+o42zXOCjY5mFF2n2Pzjcjn7t2QNKpbVny0v1gYGluJVXGajEcUpc=
X-Google-Smtp-Source: AGHT+IFQh7ea6LSr/0o4y+3tyMlqQDNYfa/MKNj7Iq4WOAh0qAjPKYZF07a8RNp0seFp+oT3EdK8AQ==
X-Received: by 2002:a05:6a20:3d8c:b0:21f:86f1:e2dd with SMTP id adf61e73a8af0-2311e939eecmr20538952637.11.1752508782754;
        Mon, 14 Jul 2025 08:59:42 -0700 (PDT)
Received: from [192.168.0.124] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f49f80sm10152790b3a.117.2025.07.14.08.59.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 08:59:42 -0700 (PDT)
Message-ID: <be327242-ad55-476a-bed4-44c33c263962@gmail.com>
Date: Mon, 14 Jul 2025 23:59:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v7 00/21] drivers/perf: apple_m1: Add Apple A7-A11,
 T2 SoC support
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>,
 Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
 <aHUeUMmn_19EayL1@willie-the-truck>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <aHUeUMmn_19EayL1@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_085943_843681_1B591B5B 
X-CRM114-Status: GOOD (  22.06  )
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


Will Deacon 於 2025/7/14 夜晚11:12 寫道:
> On Mon, Jun 16, 2025 at 09:31:49AM +0800, Nick Chan wrote:
>> This series adds support for the CPU PMU in the older Apple A7-A11, T2
>> SoCs. These PMUs may have a different event layout, less counters, or
>> deliver their interrupts via IRQ instead of a FIQ. Since some of those
>> older SoCs support 32-bit EL0, counting for 32-bit EL0 also need to
>> be enabled by the driver where applicable.
>>
>> Patch 1 adds the DT bindings.
>> Patch 2-7 prepares the driver to allow adding support for those
>> older SoCs.
> Modulo my nits, the patches look alright to this point...
>
>> Patch 8-12 adds support for the older SoCs.
> ... but I'm not sure if anybody actually cares about these older SoCs
> and, even if they do, what the state of the rest of Linux is on those
> parts. I recall horror stories about the OS being quietly migrated
> between CPUs with incompatible features, at which point I think we have
> to question whether we actually care about supporting this hardware.
The "horror" story you mentioned is about Apple A10/A10X/T2, which
has a big little switcher integrated into the cpufreq block, so when the
cpufreq driver switch between states in the same way as on other
SoCs, on these SoCs that would silently cause a CPU migration. There
is only one incompatible feature that I am aware of which is 32-bit EL0
support. However, since the CPUs in these SoCs does not support
4K pages anyways in practice this is not an issue for as long as
CONFIG_EXPERT is disabled.
>
> On the other hand, if it all works swimmingly and it's just the PMU
> driver that needs updating, then I could get on board with it.

As mentioned above, it does all work fine when CONFIG_EXPERT is not
enabled, and if it is enabled, then 32-bit process may crash with illegal
instruction but everything else will still works fine.

>
> Will
>
Nick Chan

