Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B010EC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 15:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/xS6ETeJO5OOeAvcPqqiLsohwdJ2YixHGZA6tkjlU0Q=; b=D6+vZZO3hcALkL9mbq8LeL4sO/
	gkbdcKIFNoAS979z68g+AVUrYHYY7aYmGWV2Pc2M7hKY/RKCju3x/tfcduVdEbpslb7AzM1MBWlhY
	HIxrVuvIsiWbLuqHXu75hUHpOxKSMYjV5qmOtNOj1mPBq2vmG8dMgEh/dbMvh39xtW2mTrbNh5wJ6
	k85bPQiR3iwfkCdkmHIt7G+QxFlUL8UfSv1YFzeKZPAzgM1TJBh7b6SLhkSxJYgIpjFClj/DsiION
	1rvFMDwurx3tt3KJbfIjeozKWBm9TLhz0EgBSXvhhUyi7x8+fDq8FHzgXtsaj55AQR/4vUy8nEFVB
	rG784j9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgH1-0000000Fsjc-1dfs;
	Wed, 07 May 2025 15:01:27 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCep4-0000000FZiJ-0jmy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 13:28:31 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so59196405e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 06:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746624508; x=1747229308; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/xS6ETeJO5OOeAvcPqqiLsohwdJ2YixHGZA6tkjlU0Q=;
        b=ZO/sU7LQs7ezBfgFSmjS4JBBSjYEy/zroILTb9Xlz3dFVqfUCDJKhP2JBUVcH9dEQr
         6BBvTyAY3yiPu4XozAscP41CzeVMLp1UhVmotUVSTCOn/4ssiLq+8BDQlLS4ZBB5KBN6
         5O7cQeRk9p65p2J9YmsD4f0nrArrTRzyWB++aZItH58xO+mpjsAMcA/9ln6qW6w0B3CO
         XciJ8WRGN3eZhfDL5JB5nR9mIXghwWgbohLYFhe4hAP6lRpAa+wcG12/khMruDEcUkrk
         Fa9kSMAAZ+GG8d+RLodDUj7mskJL7vuLX5nzD6x+zkQiWKNsXBjh0abFxaLorKwN6/jq
         y9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746624508; x=1747229308;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/xS6ETeJO5OOeAvcPqqiLsohwdJ2YixHGZA6tkjlU0Q=;
        b=QX/zDH+9AmksNWajR8toi3ozaHDkkH505+xLWWwxtGb6sgcaZ3GSOErcwFcHoHg5tD
         G433YmhvD8Z/zE556nONKWyOsQe4OPQEMIAi5iZ4Q8plzITeQJTGwLlqvWgL9+Ui1RD7
         Ggeu6qSVHBvTLi1PRLA4wK8YMdRLUdXhh0mprxjAXAGBBUdZyQOYuLAlH3zF3zc+LifG
         gFz20XPCnOfXY+o+/fjvc++A5Gnw97fI1CENEKUnhXZgH+RE3aPDq7zY8apDnzSNb7KI
         F/pcKI3IK9RyKT+0FHrymYbQSKdn+JYnPHENydlKs/3bAp+oFs+MPUi4kUtw00/zIs3R
         ZyVw==
X-Forwarded-Encrypted: i=1; AJvYcCXm2e5i+/OIGJvGv9nxDVlNELuaGAsUhS/AYhl4/4zPJIqFTbKTKd3PPA32VOP5Y2/q4PLWK2FRr95QyDwmvjiQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzyxnh2h/zIfadnFnlbqrBqIjzaXlou52uKrHUJmMCyfx/BVAYt
	5zMtLbpmK/vgLPZDAtiyYevGQCH2EBvwXIKpnSXVhuo6G4UrEgMIlOATCWdPEOQ=
X-Gm-Gg: ASbGncuBFOuwVyOX9Wqzp7Xi/JmKD3P/qmRTkkwiHGYeUAUwhTDdSqL2Dg8kUw5KiqI
	llVu+Bfjp+w3JMOT4ZE/bKqxMSZvlPvtAVhBsiIHobdm0BjcUgC50cnUEzCuvyInV6ChXm+f8W0
	pK/nwCY1E0OVRACTynXkugU/JPpBKxIiK5YV1giRmQ+LLQJ210wIdl0UqD7fjjPKjQ0zDHCWi7l
	pQF3mFlaKgLN156W1vXU36z2716qTDQocP9SIYc8t9PNehU+mjNTNHDmSscrGbshDZp+0IJ2AjO
	5Lx3lFt/1uFDzqShBJzZAtGasYNKT54nCy4lmCi+B70h+5jPlIAkr9tGzsuhyf30miHVcQwbGb2
	T67DtZidZyYxo0k8JghK526s=
X-Google-Smtp-Source: AGHT+IF9bN7HF5C+wDfG9X0dS/E0vyZNUnflXtn/dJ+qoLVi6CW6CxKO2dfUEyTuyw8A+h4DJSAqyA==
X-Received: by 2002:a05:600c:1ca3:b0:43d:2230:300f with SMTP id 5b1f17b1804b1-441d44734e6mr28815835e9.0.1746624507957;
        Wed, 07 May 2025 06:28:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e50:3860:705c:8900:5dbf:b4ab? ([2a01:e0a:e50:3860:705c:8900:5dbf:b4ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd33103dsm1051115e9.10.2025.05.07.06.28.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 06:28:27 -0700 (PDT)
Message-ID: <b1949ec7-a0b3-4c4c-a439-93afced7bb0c@baylibre.com>
Date: Wed, 7 May 2025 15:28:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Guillaume La Roque <glaroque@baylibre.com>
Subject: Re: [PATCH] arm64: Kconfig.platforms: remove useless select for
 ARCH_K3
To: Nishanth Menon <nm@ti.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Andrew Davis <afd@ti.com>, vishalm@ti.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250504-kconfig-v1-1-ab0216f4fa98@baylibre.com>
 <20250505123615.yqzdv7dlel7kyojf@degrease>
 <fa33b7d6-8e28-40bc-9219-41dab643e88f@baylibre.com>
Content-Language: en-US, fr
In-Reply-To: <fa33b7d6-8e28-40bc-9219-41dab643e88f@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_062830_212676_EEA1D34E 
X-CRM114-Status: GOOD (  12.06  )
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

Hi Nishanth,

if i remove MAILBOX it's  enabled by some  non TI drivers and/or 
ARCH_XXX which have it in deps so all TI drivers are still enabled 
properly but not sure it's safe.
and PM_GENERIC_DOMAINS look OK to remove it.

if i try a defconfig based on android defconfig (more simple than 
default defconfig) with only ARCH_K3 enabled i need to set 
CONFIG_MAILBOX flag to still have same TI drivers enabled.
let me know what you want to do.

Guillaume
Le 05/05/2025 à 15:15, Guillaume La Roque a écrit :
> Hi,
>
> Le 05/05/2025 à 14:36, Nishanth Menon a écrit :
>> On 13:24-20250504, Guillaume La Roque wrote:
>>> After patch done on TI_MESSAGE_MANAGER[1] and TI_SCI_PROTOCOL[2] driver
>>> select on ARCH_K3 are not needed anymore.
>>>
>>> Remove it and give possibility to enable this driver in modules.
>>>
>>> [1] https://lore.kernel.org/all/20180828005311.8529-1-nm@ti.com/
>>> [2] 
>>> https://lore.kernel.org/all/20250220-ti-firmware-v2-1-ff26883c6ce9@baylibre.com/
>>>
>>> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
>>> ---
>>>   arch/arm64/Kconfig.platforms | 2 --
>>>   1 file changed, 2 deletions(-)
>>>
>>> diff --git a/arch/arm64/Kconfig.platforms 
>>> b/arch/arm64/Kconfig.platforms
>>> index 8b76821f190f..5b63a42c4dff 100644
>>> --- a/arch/arm64/Kconfig.platforms
>>> +++ b/arch/arm64/Kconfig.platforms
>>> @@ -138,8 +138,6 @@ config ARCH_K3
>>>       select PM_GENERIC_DOMAINS if PM
>>>       select MAILBOX
>>>       select SOC_TI
>>> -    select TI_MESSAGE_MANAGER
>>> -    select TI_SCI_PROTOCOL
>>>       select TI_K3_SOCINFO
>>>       help
>>>         This enables support for Texas Instruments' K3 multicore SoC
>>>
>> While at this, is it possible to remove MAILBOX and PM_GENERIC_DOMAINS
>> from select and make them as modules?
>>
> good point i will confirm  and come back to you.

