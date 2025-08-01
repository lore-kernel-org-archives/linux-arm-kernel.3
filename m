Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE25DC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 08:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zOC4uGHuBV8wACSUSYr4zqb/AWSw2lkHtrho7jKDnI4=; b=PcGfR94AHaKGApZcP6TdjPZCiv
	ckt1BIrt3QJmHY2DgVCT/OL6fq/XCFKXXMhuXeWHyGkxNkU++AmxKs97Zq1y1bigHM4Bm7dk1MR7A
	obmtN0GADw3MW5Qc4pKt6zFUOJjSVs3u2F67rQDsxp9EVogJvCclnYg0SWGGT9nvgXYv1B5K3p0ZJ
	vJEiZvPWl/CvOFa3t+OiA7P3M4aLB1fwha9vE1pe7ucX37O/11GOVYRes5U/S0FV1MQ/yK/c1dbpT
	On2FLOjF1LbvCjE/9DTgMdxe4daVm7ULM5YdsnL6kw7Xb+6hfEzYV6LlJzbkW6HAWM4h2TU7tMAck
	roVgkMRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhlEo-00000005GVT-3lEd;
	Fri, 01 Aug 2025 08:35:38 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhl2m-00000005Eq2-16Vg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 08:23:13 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45618ddd62fso7207765e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Aug 2025 01:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754036590; x=1754641390; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zOC4uGHuBV8wACSUSYr4zqb/AWSw2lkHtrho7jKDnI4=;
        b=YNy0md1clVx5WKGwxMkszzBPr7gbZebM3qnn7Ra7p3GysJSnqIe61igIIsIlDgCzX9
         SrpTcBArzt+r1sVdZerbejIfVmA8luv0E9JjcI6OVYp77un06cJY8WQzVzRvLB3f52jq
         JpJmiby4QG+AlX9k56qAtAEOWCrV5sBk9mKRq9umQACfR55PakL4QV+jKO8MswaPoJQz
         BPC4hgBZvnEWmO+elzRqLBjtAAc/Man/auQiVS1VqsXAEI8aFVrf9SCBDKW/OeqlEmHm
         wdIcSQtx7QCsn17jQs3D5Iu7p3YgM0qBtOIHM+aa8zByCvjnMyVZFS/EnefbAZbQXMxY
         NWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754036590; x=1754641390;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zOC4uGHuBV8wACSUSYr4zqb/AWSw2lkHtrho7jKDnI4=;
        b=GzbYre4mnmoiAZSgHdyIMyNKl/vakMYaX+FUBBVb67cNSP+5o2/NDt7hLUF5PRLV3u
         ljTk3/TvBcz8ZeV2hmMdOLCvBOeqHLgiKnJ2EHFwSpDoYEJQhpLKCawYnDzcpA8NaUs0
         V5E2h9/DFxEZhSoZ5FBhfsirzzrV0K0Pu85ZIlB6ulphz/ext0EoFpvgu0r12yyPXxOg
         wPCFM9HqnXsCgqEgt6NCCLQL11Xwoqj2BL/yjLlq3OXGIxA5eralSJc2Jl8fR8wlN043
         w/Lh7h/ROs9G8Pa8S0lE9yqteQUv+FiflqJ58nEJdZEQlfe+G3BE5GboOf3KRhcQh6cb
         /JAw==
X-Forwarded-Encrypted: i=1; AJvYcCWZP8EOZP6makMlsF/US6RqN2/sXJF/JizhBvYGIwNe0SoaxDTKryt6DoylORSX6ImBqBEfgKKcD2OBR2TkGB7+@lists.infradead.org
X-Gm-Message-State: AOJu0YymZdqjbf/nDelFSf23CWU6pGlDrJm4eeckYRCnI237hiPQeZYk
	j3R0PPqqMT7R6NT+YO4IrbgnvC5QQGiB5FJZL7qEyDOefkwPSTaPmnWWfBcR9aq2b4U=
X-Gm-Gg: ASbGncuO0x+909zKEat9/zvMa1xzgHw6sYoYbx8P9LlRE/DJ7RUogROol6EndGuiH+N
	XUYUPZMjaMTj5QhbSbXaD4Mem8cYi5AYvW2yyqzc7xEowkV3lgngOQl3geXvps4XYhgOIX2TzBm
	S7pI+14p/+E2z3hJnfCHW8mUVGCUEUNYaZt3tKEa8elCS5CBoPjWxWw5/2yf38BtFqizJyN8chs
	GDG67+DUTgSojWuJWpXhsbsvzaFukpdhZTL4jpzw7N0V1a7xqFv1Q3aDCkkVUl72PcfnZOUkDme
	QFlHJQyjFoefnEm43LrnVSXE0UELuLPpDIN9pXzV/Sggo0EZwCAC3IBysgEWRRbValp7HvzIgWs
	V+Ocw+ShA7ztkH+Rslc84pGllU5WQUYlT6zf2iDd+6xrIRZBHIbXb06stOoQgcg==
X-Google-Smtp-Source: AGHT+IHFaN3+egakRXZOjinaJFG+r4LMkGjP5kelar/Ki6ZV3odXQ8ubCXOx4u3mK+PBxlSADMEjhQ==
X-Received: by 2002:a05:600c:630f:b0:456:18ca:68fd with SMTP id 5b1f17b1804b1-45898a828a3mr106806585e9.10.1754036590465;
        Fri, 01 Aug 2025 01:23:10 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4589edf5683sm56534915e9.7.2025.08.01.01.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 01:23:09 -0700 (PDT)
Message-ID: <4b2bd0ab-cc4b-4afd-a46e-60ccc8d6f239@linaro.org>
Date: Fri, 1 Aug 2025 10:23:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] arm64: dts: s32g274-rd2: Enable the STM timers
To: Frank Li <Frank.li@nxp.com>
Cc: mbrugger@suse.com, chester62515@gmail.com,
 ghennadi.procopciuc@oss.nxp.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, s32@nxp.com, kernel@pengutronix.de,
 festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Thomas Fossati <thomas.fossati@linaro.org>
References: <20250730195022.449894-1-daniel.lezcano@linaro.org>
 <20250730195022.449894-3-daniel.lezcano@linaro.org>
 <aIp+4mWS1k73Vf/A@lizhi-Precision-Tower-5810>
 <87d40626-8789-4e71-8ac3-fa8fff0a7435@linaro.org>
 <aIv5hYGq+fNStRBw@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <aIv5hYGq+fNStRBw@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_012312_308572_43643A47 
X-CRM114-Status: GOOD (  14.81  )
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

On 01/08/2025 01:17, Frank Li wrote:
> On Wed, Jul 30, 2025 at 11:15:54PM +0200, Daniel Lezcano wrote:
>> On 30/07/2025 22:21, Frank Li wrote:
>>> On Wed, Jul 30, 2025 at 09:50:15PM +0200, Daniel Lezcano wrote:
>>>> Enable the timers STM0 -> STM3 on the s32g274-rd2
>>>>
>>>> The platform has 4 CPUs and the Linux STM timer driver is per
>>>> CPU. Enable 4 timers which will be used, other timers are useless for
>>>> the Linux kernel and there is no benefit to enable them.
>>>
>>> S32 have not ARM local timer? It is quite strange!
>>
>> I'm not saying there is no architected timers but there are the STM. May be
>> I can reword the sentence to prevent this ambiguity.
> 
> if there are local timer, why need STM for each core here?

Yes, I had initially the same question when upstreaming the STM timer. 
Ghennadi explained the automotive designs can partition the system by 
running a firmware and several instances of Linux. By using the STM, it 
is then possible to have the firmware to read the STM counters or to 
stop the timers when the board switches to debug mode.

Ghennadi can elaborate more on this if you need more context.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

