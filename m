Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8FECCD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 09:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rz20gXhQdVOrTdEhmhCpXq0m1jn6BoI/ZelHshCeHzA=; b=DK69cPgjbHHuaIuOm5oqXOAkjm
	EFryE31MqZtpC39AezEmxtxRukEzktGYS8jNYGkDaVL0T0KMbJUmYvbGDefzW3fmbBT7H8jyg6JQX
	7FmtvnAtLPMtA0MtIhwvQm+kcKMctN4Cw7eTXBGTf5wzhpLcdLtgsPBHpVE9TQc1TEyWOE33ffYJQ
	zoAZWJqB4P6kibbcfd/AtQ1ey926CnfOxkFQYwyGHuHll+CKRRqe4ecPXEHJthQBk9IDS1OR/TQ8R
	UZ3Ura2hzVkB4N4PE8atImrYyi23SIzyBf0jNdfzn0NRqP0cAJlw/A2fht0rV97ZitN7G9veQIwGE
	5kXJvDVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV4KA-0000000GUps-3SRI;
	Thu, 04 Jun 2026 09:25:14 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV4K8-0000000GUpM-0EIL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 09:25:13 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-36b9ec98144so275731a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 02:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780565111; x=1781169911; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rz20gXhQdVOrTdEhmhCpXq0m1jn6BoI/ZelHshCeHzA=;
        b=d468bN/FJLvIapdQK2tZIDzi4ix0ceNn8yk6uEKVoWzi4lNe7J5gvngaZGC4OOYtRH
         d/O/wO34EeAXwyJmBEzjpdyQwTNPotqHkYYcqkf/xNb5Cu+2Y4lHQ+yXfWAC9xsCCEEC
         suvfWL6F8qpaK8FcVdKpojkIuvXU6RuNWRWvTrXsLbpFOc0M+iOpA8aakC8l83o9u5QW
         wpDRY1jP3Bvg3e8i6kYOs6+KBzv2kQMJubh6KF3eGl5E8DEO7cq7NJixnXu19K2AheL5
         1bop1nEsIwpVBm722P0F/47Tubi2v+tnESGG035YuWF6NQ3cCDJbcr3Zogt50fDBpZdF
         OXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780565111; x=1781169911;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rz20gXhQdVOrTdEhmhCpXq0m1jn6BoI/ZelHshCeHzA=;
        b=Cdh9XtnolFJlVglduXVzKUXzeKD+lCpXZOofehZy8W1PEAnsRIAG7Ra117C/TMHXd1
         DLUaPf9XZqYF7p8H/u87Y3hfxYeerVvnzgIh0n+bFUWqIwmPdICbMGYmNq2QmvbynTai
         yJjU7SINZHae1A8PYyugyE8/Y+tL0Q2/vzpV1iNxV4Cae89cHGm3sffxU0EjsZtnwveY
         3lS7sFlUDcNm5btxxJXKfWJ4/uXxTkRBMUZsQwXkWqKfAAKfckuQblV6ffN+HHISLDaY
         UDIIb+Bi17+f7hRDDQ6KolZMZCjdnILOxpHJytBJ3rIwci9/x+/K+EV2ZbABi6T+YbL1
         zHyg==
X-Forwarded-Encrypted: i=1; AFNElJ8QVaG0QvBk7fQxHOgwLGVuNznXh6wXau+eOFNA/BAf+TLNcyOZ4IzeOh9Pe6sMNjTlK3Jn6NYhaVPdNVldmtZH@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj1SaZq6D+OwMB/0/q7zud4dacZe7XQhPxDoQ3KsSFxbFNy+sj
	mIPVSUYkhnmIjwxR4fLzotFpIgkgo0AbzS6s9iABnOsEUecKvtuVp5E4czJI9Q==
X-Gm-Gg: Acq92OFzs4fViackS1ktlqSTcO9RnZr9l0SYwxDS/yPcWondzs3wF/SM3FKgbjfHQjP
	4LSaMW6Jkbz/LPTd9pIEyJxYG452CZ0eGbXSXr9oXZPg0breIl1IlLG9nEqQ5LVVBokphWpvw8m
	ASvxa8yClbdhnEECEmB2O9n3LALSJGwUzg80pqt9XnDNn324+nyZAp1EsztukEf1dKW7zAkPWFT
	n4QflNGni7KoA0Ey73YVz3YwPrO2ZZH8N/BxOsI55Z2H2WvKhCJXbY5MohOyDjLqJmbG3G9rnXX
	BNJrb06UWloOmbR2dEqIgnlBRmWCqY9JiMbghQ9guMye++jaeEJDV7ig8oVm/dFwa0MhaEgzA0E
	iKGdfWa9BsO4HUQA1F9EvwBYVNHE+RVZ3VZV64QIUULrVsHmzYev0eltzJLsPdG6427oq7Okzwn
	Tt39jeQIECbhQCNGi/KlITRnilmRl5v8CWq1IvvLBdvWa5mWUs/LTfoIYwlJ/JGdj2H3Qce7ZYa
	sHfLSyaTRFlwQ==
X-Received: by 2002:a17:90b:53ce:b0:36d:c159:8f11 with SMTP id 98e67ed59e1d1-36e34775d33mr6490845a91.26.1780565111106;
        Thu, 04 Jun 2026 02:25:11 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36e7014f288sm3459212a91.2.2026.06.04.02.25.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 02:25:10 -0700 (PDT)
Message-ID: <b90b4b9e-9e11-40c4-9407-ac9bdc83b0b1@gmail.com>
Date: Thu, 4 Jun 2026 17:25:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: spi: Add for Nuvoton MA35D1 SoC QSPI
 Controller
To: Conor Dooley <conor@kernel.org>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20260603043551.1062112-1-cwweng.linux@gmail.com>
 <20260603043551.1062112-2-cwweng.linux@gmail.com>
 <20260603-daybed-absentee-1b64f5caabe0@spud>
 <41914879-5fd0-41dd-b097-2be80096e464@gmail.com>
 <20260604-anthem-jokingly-8d8312ff0c3f@spud>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <20260604-anthem-jokingly-8d8312ff0c3f@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_022512_101326_634B800A 
X-CRM114-Status: GOOD (  12.71  )
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

Hi Conor,

Thanks for the clarification.

I will keep using my personal mail account for sending the patches to
avoid the corporate confidentiality footer, but I will set the commit
author and Signed-off-by to my Nuvoton address in v2.

Best regards,
Chi-Wen

Conor Dooley 於 2026/6/4 下午 04:55 寫道:
> On Thu, Jun 04, 2026 at 03:07:31PM +0800, Chi-Wen Weng wrote:
>> Hi Conor,
>>
>> Thanks for the review.
>>
>>> Missing commit message for one, but why can't your Nuvoton mail be used
>>> here?
>> I apologize for the missing commit message; I will add a proper description
>> in v2.
>>
>> Regarding the email address, my Nuvoton mail adds a corporate
>> confidentiality disclaimer to outgoing
>> external mail, so I use my personal address for sending kernel patches.
> This prevents you sending with your work email account, but you can still
> set your commit author to your Nuvoton address FWIW.
>
>> Conor Dooley 於 2026/6/3 下午 11:24 寫道:
>>> On Wed, Jun 03, 2026 at 12:35:50PM +0800, Chi-Wen Weng wrote:
>>>> Signed-off-by: Chi-Wen Weng <cwweng.linux@gmail.com>

