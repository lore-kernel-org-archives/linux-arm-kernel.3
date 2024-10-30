Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66CED6B6BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 18:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UpRP2MsIVMkQvKjqAp60xM5OFj18JwlP60eDqeYPxhc=; b=sLERZ6KxvPaLvTaxwlaDAph47L
	Ow+WMeUA6wQctvctqyzztNtYv+N8QAQtbnmOe46KQvibmgGf4uugerSCfMk0SwZu+ylPt/BQKsVDK
	XiuNxEMNCH8XKGLpn6t8bRLGOiAgvlaMo5ZTzDMZTfNy1iwd4jTOsXGw37fsE+VgMTzN01qwOMJ85
	hmZ4VG9I20vIiwR8liWf39Xc+OX35h3WE87xIzKQiOmffTEwQ7vE1dTpVfTIEDb0mEW9zevh0Pzd/
	2lDVe64rSNpssUT8hhvpUieDrPUT8WJB6OzhqhaNO4R0TEDupSxXWyQ6cuE85LCCcvUXd12MwKXZE
	ei/3DnsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6DWp-00000001RWz-3epO;
	Wed, 30 Oct 2024 18:34:47 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6DVA-00000001RHH-2H5i;
	Wed, 30 Oct 2024 18:33:05 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-37d3ecad390so816431f8f.1;
        Wed, 30 Oct 2024 11:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730313182; x=1730917982; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UpRP2MsIVMkQvKjqAp60xM5OFj18JwlP60eDqeYPxhc=;
        b=bHrQR3571Mj32cviLZCYfBd7LIbN4RiAGt2K4M4pusf+eD5Fs92H+rUYvHM659d3aN
         ON0kj5s+BFV26msEw83CNvKljUDrPoKACrl/2tyvSZ8bQoZtos5U4j5uxr9UsEebDPkt
         86+g88c2A6p03lAB6Gn2pd4oQkbAL9l5+M3uMNVwj4If4XXC5Tw50j44s+PI2+zHL2Fh
         dxq7KUPfRHKcI4UU3mLU0g6nK3BWpgHxMfj6WY6OYlQ0Pn0y5Axk0tvtH+e/XGknfWJ5
         E67lkCSlWdREchUHdCvcUxXS7qT+xEXQy3mxbPIO5Di/3niWFkWLxmfc/lKA5jGl3qKE
         Ho5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730313182; x=1730917982;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UpRP2MsIVMkQvKjqAp60xM5OFj18JwlP60eDqeYPxhc=;
        b=G73evvH5UiYuAP1UBaKtHj+LcKWaPz5MpYJsODm1f8OnyA+eWay41uVee5TfmQz4kV
         vBB2ZNeuIAvIUXN2jCkBStiZwdnD27ytpj3N88fagiemtVAIY9hUzBdC1HEttvBjuzLJ
         4a4a8GkYUHCPXIdkMttsIW2ajljaFn1e20N+2yVhOvKYG8uP9j3W79lQoExvHgRIEtjK
         UDn+CgxmpuHf+/KNuEyYdY9ZYwyWuB2Mk1cZ9jVNVfrGMVo8f9X0DoRtakv/O0pGJxy2
         OWvfODjokbOWK0CgZ9rxs7du/k6NpVWDDIPnWIuzfJJOhidZTulahQlXWAbLkSN1qIPe
         FyWw==
X-Forwarded-Encrypted: i=1; AJvYcCV9HQQ+5WRrqhx9Ig2f2SXUUAzmBortanUFYTf3y/i9G4LADKvzqovsvauMvLp1LFMfk5h8HdSN97jS6Dcm1KtS@lists.infradead.org, AJvYcCXOkAVvlya/IDc39OfHyrBwoEe5T1hdQK0L/J6zSdSnW77WEgXnLONAsvu9Hn+TcLu2+jEURbY0F2etcWmezwQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzPAl/EfP6bWmXFi1NtzZJ+4CTTveXzOejLf1xWtJmLoR7yIf5v
	kv0TXp/8Wqo2bQHGfL6h3+vSe7fSX8ANbjOmqg+CC4AJ+TAWl50Y
X-Google-Smtp-Source: AGHT+IGUMEiJ5yqJQbqO4xA7/aA59KAvngIQZIC7OTI5GXqXyrK5y8mDR/1ooulIWDi8IfTeYR0uyA==
X-Received: by 2002:a5d:688b:0:b0:374:c613:7c58 with SMTP id ffacd0b85a97d-381b97c08fbmr2847327f8f.29.1730313181936;
        Wed, 30 Oct 2024 11:33:01 -0700 (PDT)
Received: from [192.168.0.2] ([69.6.8.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b71221sm15888748f8f.68.2024.10.30.11.32.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 11:33:01 -0700 (PDT)
Message-ID: <e37b9baa-51e5-48f9-a15d-521f29ce5f9c@gmail.com>
Date: Wed, 30 Oct 2024 20:33:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v2] net: wwan: t7xx: reset device if suspend fails
To: Jinjian Song <jinjian.song@fibocom.com>,
 chandrashekar.devegowda@intel.com, chiranjeevi.rapolu@linux.intel.com,
 haijun.liu@mediatek.com, m.chetan.kumar@linux.intel.com,
 ricardo.martinez@linux.intel.com, loic.poulain@linaro.org,
 johannes@sipsolutions.net, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com
Cc: angelogioacchino.delregno@collabora.com, corbet@lwn.net,
 danielwinkler@google.com, helgaas@kernel.org, korneld@google.com,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, netdev@vger.kernel.org,
 Linas Vepstas <linasvepstas@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>
References: <20241022084348.4571-1-jinjian.song@fibocom.com>
 <20241029034657.6937-1-jinjian.song@fibocom.com>
Content-Language: en-US
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
In-Reply-To: <20241029034657.6937-1-jinjian.song@fibocom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_113304_628263_E84F72E1 
X-CRM114-Status: GOOD (  26.99  )
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

Hi Jinjian,

On 29.10.2024 05:46, Jinjian Song wrote:
> From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
>> On 22.10.2024 11:43, Jinjian Song wrote:
>>> If driver fails to set the device to suspend, it means that the
>>> device is abnormal. In this case, reset the device to recover
>>> when PCIe device is offline.
>>
>> Is it a reproducible or a speculative issue? Does the fix recover 
>> modem from a problematic state?
>>
>> Anyway we need someone more familiar with this hardware (Intel or 
>> MediaTek engineer) to Ack the change to make sure we are not going to 
>> put a system in a more complicated state.
> 
> Hi Sergey,
> 
> This is a very difficult issue to replicate onece occured and fixed.
> 
> The issue occured when driver and device lost the connection. I have
> encountered this problem twice so far:
> 1. During suspend/resume stress test, there was a probabilistic D3L2
> time sequence issue with the BIOS, result in PCIe link down, driver
> read and write the register of device invalid, so suspend failed.
> This issue was eventually fixed in the BIOS and I was able to restore
> it through the reset module after reproducing the problem.
> 
> 2. During idle test, the modem probabilistic hang up, result in PCIe
> link down, driver read and write the register of device invalid, so
> suspend failed. This issue was eventually fiex in device modem firmware
> by adjust a certain power supply voltage, and reset modem as a workround
> to restore when the MBIM port command timeout in userspace applycations.
> 
> Hardware reset modem to recover was discussed with MTK, and they said
> that if we don't want to keep the on-site problem location in case of
> suspend failure, we can use the recover solution.
> Both the ocurred issues result in the PCIe link issue, driver can't read 
> and writer the register of WWAN device, so I want to add this path
> to restore, hardware reset modem can recover modem, but using the 
> pci_channle_offline() as the judgment is my inference.

Thank you for the clarification. Let me summarize what I've understood 
from the explanation:
a) there were hardware (firmware) issues,
b) issues already were solved,
c) issues were not directly related to the device suspension procedure,
d) you want to implement a backup plan to make the modem support robust.

If got it right, then I would like to recommend to implement a generic 
error handling solution for the PCIe interface. You can check this 
document: Documentation/PCI/pci-error-recovery.rst

Suddenly, I am not an expert in the PCIe link recovery procedure, so 
I've CCed this message to PCI subsystem maintainers. I hope they can 
suggest a conceptually correct way to handle these cases.

>>> Signed-off-by: Jinjian Song <jinjian.song@fibocom.com>
>>> ---
>>> V2:
>>>   * Add judgment, reset when device is offline
>>> ---
>>>   drivers/net/wwan/t7xx/t7xx_pci.c | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/net/wwan/t7xx/t7xx_pci.c b/drivers/net/wwan/ 
>>> t7xx/t7xx_pci.c
>>> index e556e5bd49ab..4f89a353588b 100644
>>> --- a/drivers/net/wwan/t7xx/t7xx_pci.c
>>> +++ b/drivers/net/wwan/t7xx/t7xx_pci.c
>>> @@ -427,6 +427,10 @@ static int __t7xx_pci_pm_suspend(struct pci_dev 
>>> *pdev)
>>>       iowrite32(T7XX_L1_BIT(0), IREG_BASE(t7xx_dev) + 
>>> ENABLE_ASPM_LOWPWR);
>>>       atomic_set(&t7xx_dev->md_pm_state, MTK_PM_RESUMED);
>>>       t7xx_pcie_mac_set_int(t7xx_dev, SAP_RGU_INT);
>>> +    if (pci_channel_offline(pdev)) {
>>> +        dev_err(&pdev->dev, "Device offline, reset to recover\n");
>>> +        t7xx_reset_device(t7xx_dev, PLDR);
>>> +    }
>>>       return ret;
>>>   }

--
Sergey

