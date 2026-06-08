Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B091CD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 20:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9F45RQtgrxadjt5ZYNUGBRSHL4GrTavmF6k6G6dNnjY=; b=NSleB/ZzA5+Dm4hLp8dShQewQ8
	IT1YijQAKzre9IBPTUC2ByPM2SL/W5P+304qDNSNRaP4nKwcZUXsPIhCzc5wbxQGLLXf4fN/+WEPg
	XAo7uXi5bmcb4m+pGjPiv1FdZxbhtDR1e5qgp/86KPb2P+l7GOFPiNYJnSuEzrmYoejqklT1wtE0T
	uhAaJAqiIXDYeO5wTr5Df8Sk4wLRDjoL/sap4qq85sGN0wx5CnaK8yM5Od3tnW9M2tg+RZE+PtNfx
	Y8zFIAMsRFx6ApG6IR+7ekHocp0snaL/VxKwP+RyMnEMjHesoA811TiWrLB4BU8FI1U/WSuAKBNk+
	winDVCkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgyi-00000004Oc8-0Bjk;
	Mon, 08 Jun 2026 20:53:48 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgyf-00000004ObZ-2J19
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 20:53:46 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-84226d0f1d2so3208060b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 13:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780952025; x=1781556825; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=9F45RQtgrxadjt5ZYNUGBRSHL4GrTavmF6k6G6dNnjY=;
        b=f0O192G0Tf6i/SUgcUkCPink9JP/GFbHp/gRqTVA6/xtmJ6xxDZaQiLhRZsY2Ilvow
         wkItad9A2oR5VLdszY5g66BM95jo4cDFlq2J0OfqPh/K0PSnKl7aXTNhaUXPQz4VeJyQ
         mrEPRGaScvJYq5/7FXYiK2OpP0iQ4WmxpR+lj/lAnuFbxd8QHdQeTdHbzjBE65os9HC6
         XsHMTqhk1el4LDHXHfHY2g+IB8uMz/xjXtQDkIY2wxw79SlLCwx8FmHUmV28KcAE5mCF
         wFoTRTYUaqXxY4v7kxVdKGd12PX/jltXg7EpfROOQig+xF8HmB7GUeYuneMbBNiHZy0L
         TQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780952025; x=1781556825;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9F45RQtgrxadjt5ZYNUGBRSHL4GrTavmF6k6G6dNnjY=;
        b=pNSSIYXilVGXeI/vstFDuBrWPJ6la8g9vCOAEhRMdr30SOQiXyExwDGMWz8Ba5j82e
         JGJzqvo4NGVKSVcH++Y/2Eu5Mb7MaYi/qXM7VkyqiRm2O3EGMG0cU+zwVoS33qfT9WcF
         hV6RlUVjCYqId12gE9On63XivwFlJtrsUwfSPUE7Pu3WWOrMgRfzvTh7QXITnHr3R76a
         7QQtEBJZLuYFXn4RroxMh1l+TYi6tDULGKhcEys43sohylP+sK9oE867XjPPmMhmjYP5
         OMOQI6WXfu9vBqyNEmi5X47KJftL5N0i9hwI0WIlBTRUi0e5LRIyvVHj4mEpwtRJqe5J
         JTag==
X-Forwarded-Encrypted: i=1; AFNElJ9/0qSgxcG1CA4yEMzYI0fe0N2NUag0BMxcrkB8ecuDL//EYmiHzF0xJDFiIerC9eo2i6n5dh0WVvDWA8Q+RQKy@lists.infradead.org
X-Gm-Message-State: AOJu0YxrrBcfTKdpnEV07WDMqyYMIuXtLSxHNrFkXCXLMpERaeQMOAof
	5tcm9oCn7tzjEa1cvn2C0XE16yAovERZ2uf6SqXa60Dhyz+UWx8i+WE6
X-Gm-Gg: Acq92OGJG1yAZPTc3tEJsQ3piUThOnc8nVs2f6GDmJdqeqOgCVS1TEDcWj0ECA/OyZx
	yP8j4+luVTGwXOgdgncLvYNoI+Lhm86rxo3TFCOQnTOxAHAOJ3563KvmgtVu+Cr6LljzMYl67oY
	slzggEqMzb8lxFMWcsB6lkUadlEP9DUQl4qH/ch1G73IlcBmlaFqJBnhOvYY6ZjDHtfkrmSw82E
	X1rX8FE77hEHSa12qKY9scko6jw8CGEfKAQ4tnJlqN7CdBXw0ZdCkTSrXG3Cnh/CmUi3YoxVkWx
	m2r2faiRZ8XTH+gozQe/EdaBFzen2IZDzHZcZvBgFp70HH/N7xB+o7mYKApxtlcXoOH6u7/vDK/
	WC0Ly93Nr07lngaEW7Zsw7xT+m/eECPLeefJPdyRfZRwxSMNuix+8Rhc7LbDB2NEuGCy0H74BKF
	uh8tge2JLuKRdTu9blFNH41XSuoBzrOtjerpj65beM3jzfbvjWLGFTB4uPJtzBZxTn5y8ONtF4+
	qSaIizBm2U=
X-Received: by 2002:a05:6a00:1c8f:b0:842:4af7:ab11 with SMTP id d2e1a72fcca58-842b0d5ee61mr18147987b3a.13.1780952024522;
        Mon, 08 Jun 2026 13:53:44 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828cf783sm19543499b3a.40.2026.06.08.13.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 13:53:43 -0700 (PDT)
Message-ID: <fc997f81-b7fc-4b8d-923e-0b2fe0e609e9@roeck-us.net>
Date: Mon, 8 Jun 2026 13:53:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] watchdog: sama5d4_wdt: Fix WDDIS handling for
 SAM9X60 and SAMA7G5
To: Balakrishnan.S@microchip.com, linux-watchdog@vger.kernel.org
Cc: wim@linux-watchdog.org, alexandre.belloni@bootlin.com,
 andrei.simion@microchip.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260302113310.133989-1-balakrishnan.s@microchip.com>
 <322c623a-0da8-4821-b0d9-ba2c96bf62ca@microchip.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <322c623a-0da8-4821-b0d9-ba2c96bf62ca@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_135345_593314_D9CB415A 
X-CRM114-Status: GOOD (  14.00  )
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

Hi,

On 5/27/26 06:04, Balakrishnan.S@microchip.com wrote:
> Hi Wim,
> 
> Gentle ping — both patches have been reviewed. Could this be queued for
> the next cycle?
> 

Please check linux-next to determine if patches are queued for the next
commit window.

Thanks,
Guenter

> Thanks,
> Balakrishnan
> 
> On 02/03/26 5:03 pm, Balakrishnan Sambath wrote:
>> The sama5d4_wdt driver hardcodes AT91_WDT_WDDIS (bit 15) for WDDIS
>> detection, which is incorrect for SAM9X60 and SAMA7G5 that use bit 12
>> (AT91_SAM9X60_WDDIS). This series fixes the detection by introducing
>> a per-device wddis_mask and documents the bit position difference in
>> the header.
>>
>> Changes in v2:
>> - Reorder patches: fix first, documentation second
>> - Drop patch 3/3, not needed with wddis_mask approach
>> - Keep AT91_SAM9X60_* register names, drop _LEGACY/_MODERN naming
>> - Limit header changes to WDDIS comments and datasheet references
>>
>> Balakrishnan Sambath (2):
>>     watchdog: sama5d4_wdt: Fix WDDIS detection on SAM9X60 and SAMA7G5
>>     watchdog: at91sam9_wdt.h: Document WDDIS bit position per SoC family
>>
>>    drivers/watchdog/at91sam9_wdt.h |  6 +++--
>>    drivers/watchdog/sama5d4_wdt.c  | 48 +++++++++++++++------------------
>>    2 files changed, 25 insertions(+), 29 deletions(-)
>>
> 


