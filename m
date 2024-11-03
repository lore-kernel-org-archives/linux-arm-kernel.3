Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE37DD11194
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 22:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vJJUevNe9GvVm+0On8RuMBavqwvRAie7DrYUh8hFkvM=; b=LWfIkItDSMTC8tx8mN0LYgrQWm
	BqAvisbEzXl4vhP73OsDoog+UX3GBMaV1TX3/nyBzmmOiKyWwLDjWzulCQSBgGJlqTp3/MP2c2jwZ
	wPFEuHMpO5OEx3o47HguPg165OxKnKBazXCgPnovU27yERYoOxB22//WPdZ+/mKWXv26SNBJyWD2Z
	VWXdNDK6xX9U9kNq3MdEbF2UJmYrnt7GITCgdTDDWV2RGGyhm+9c/PPRfdoxQW/MJOl2KzqB/2CiV
	ivZk4I1zK6GCja+vBJ2+HvSL4pVspXKTbpGZsSZeojzUNYKD0cjHt4AiIY+AyTSmZ+Es1sWoBXIi+
	voKVZKAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7ihd-0000000C6pU-1dEv;
	Sun, 03 Nov 2024 22:04:09 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7ifu-0000000C6dY-0LF6;
	Sun, 03 Nov 2024 22:02:23 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4314fa33a35so27950685e9.1;
        Sun, 03 Nov 2024 14:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730671340; x=1731276140; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vJJUevNe9GvVm+0On8RuMBavqwvRAie7DrYUh8hFkvM=;
        b=foF72GNAjkq8UM0oatE0ygIuvXDJdR+HVD5OMT1hW/JWpH2A1kxUkFT3nTZ47o/xGu
         VmZVLCdpS9QG+td1obZ94obZM/uvkN85NMZC42bKalF7vFh/fvrzHYGVlE5ytknL+uax
         GxWNBnEFaJPF07DIP7U7QvQciHJAQ+qoct05MTSq5myBJAaTEwDr5e6ekJLldxBGRQCk
         4xdte3lLlq8U9rPOoKDIH6hXWcoi/PFCT9aacz6oWoIj/liL2wi8dv1liBecG4DtbxUG
         33re7Qc1HV1K1jZj6fgzp1dXfFD8xkaBBaK0dBG3Y0fa9jzOboq/CIEpc+K6A7cgwKxi
         jwbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730671340; x=1731276140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vJJUevNe9GvVm+0On8RuMBavqwvRAie7DrYUh8hFkvM=;
        b=MHn2olAFpTOPu25z5Vt1Ve3qTz7QHwkL5qoNv/IC4BCAvlXEPyLkrWaeKqUO93SLVy
         DEp9e/Zs9vk0krTQOiR74Dh1MUp1dU+HkZndiun1kdWmO1QrGD5E9Py6qtWJAPMEZEBR
         0qeZSwbzcZZjIS1xmyBMo4VdPr1MApmapnLUpUfVS5bE27bfvYJKWwX757sBoimxp5Mm
         61y06kkoQy7V/2i4bFWWn9Ws2q/vPBrodznzHcRYKpDqVDtY48wI63vvuMTbUkV1q0cu
         3Difi1leZ3nyfkSXeb3jNQXYOSYQY9dxvzkrM9tEtzJlX16ZCfQygK5g6lY/bz3SCNNS
         K45g==
X-Forwarded-Encrypted: i=1; AJvYcCULSP+HFT6B14T56+lI64HiORb/Uh/L1f4oMl86s0Eg3t0z/MitCdnnoKzdWmIRCK9LxB/q58vanBh9ArXdR/iI@lists.infradead.org, AJvYcCWc9hlInuxjhEhA7e/lo3Wj4N85fohmlyaXnKAOJDpzPUaKEldF2UYsEDmwCuk9bQernmMz1vZIB44qCyNG0A0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0yhk2PIBkjrZ+mKVIlM4qNg3CzDcUs5T8ATkmPRsUiO3ZXTa8
	z+0AhWfLRAzH40Qs6RXJBJI1tz1fVsIJMWBG3+OSwy9otUwLpsl9
X-Google-Smtp-Source: AGHT+IEuwfDX9hrStVj6im/q6cc6AdiNOutRjb+QmjbCLyXWPWbUdJn2VcL5jeZB6ik+bwlrR6183w==
X-Received: by 2002:a05:600c:3c97:b0:431:2b66:44f7 with SMTP id 5b1f17b1804b1-431bb9decf2mr178244385e9.31.1730671339509;
        Sun, 03 Nov 2024 14:02:19 -0800 (PST)
Received: from [192.168.0.2] ([69.6.8.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd9aa83asm164499165e9.31.2024.11.03.14.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Nov 2024 14:02:18 -0800 (PST)
Message-ID: <1657857c-7761-4fea-aad2-f26c69473895@gmail.com>
Date: Mon, 4 Nov 2024 00:02:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v2] net: wwan: t7xx: reset device if suspend fails
To: linasvepstas@gmail.com, Bjorn Helgaas <helgaas@kernel.org>
Cc: Jinjian Song <jinjian.song@fibocom.com>,
 chandrashekar.devegowda@intel.com, chiranjeevi.rapolu@linux.intel.com,
 haijun.liu@mediatek.com, m.chetan.kumar@linux.intel.com,
 ricardo.martinez@linux.intel.com, loic.poulain@linaro.org,
 johannes@sipsolutions.net, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, angelogioacchino.delregno@collabora.com,
 bhelgaas@google.com, corbet@lwn.net, danielwinkler@google.com,
 korneld@google.com, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 netdev@vger.kernel.org
References: <20241031130930.5583-1-jinjian.song@fibocom.com>
 <20241031170428.GA1249507@bhelgaas>
 <CAHrUA36X2cMZ4WNtRO7NoLaupBNfecLLxDfSVZ4mZzbzHiDjRA@mail.gmail.com>
Content-Language: en-US
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
In-Reply-To: <CAHrUA36X2cMZ4WNtRO7NoLaupBNfecLLxDfSVZ4mZzbzHiDjRA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_140222_167649_850140C1 
X-CRM114-Status: GOOD (  39.75  )
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

Hello Bjorn, Linas,

many thanks for clarifying this tricky topic! Hope this information can 
serve a good starting point for Jinjian to develop a proper solution for 
that case.

On 03.11.2024 03:24, Linas Vepstas wrote:
> Top-post reply.
> 
> What Bjorn says is exactly right. Just one clarifying remark: When PCI
> error recovery was designed, it was envisioned for high-end,
> high-availability servers so that they could reset a failing device
> without forcing a reboot of the OS.  Concepts like suspend/resume did
> not perturb even the unconscious sleep of the engineers. Thus,
> stepping through error recovery during suspend would be novel,
> untested, and perhaps prone to confusion. The error recovery procedure
> is trying to reset the device into a fully-powered-on,
> fully-functional and connected state. This might be problematic if the
> suspend has already walked half-way through power-down. The fact that
> error recovery might run a very long fraction of a second after the
> error is detected further complicates things. The fact that error
> recovery  usually has the driver fully reinitializing the device,
> including reloading the firmware, could be a problem if the firmware
> is not in RAM or is sitting on a suspended block device. So it all
> could be an adventure.
> 
> As to testing: I asked one of the guys in the lab how he did it, and
> he said he would brush a metal wire against the PCI pins. I winced.
> But I guess it's cleaner than pouring coffee on it. Later we developed
> a software tool to artificially inject errors.
> 
> On Fri, Nov 1, 2024 at 8:52 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>> On Thu, Oct 31, 2024 at 09:09:30PM +0800, Jinjian Song wrote:
>>> From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
>>>> On 29.10.2024 05:46, Jinjian Song wrote:
>>>>> From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
>>>>>> On 22.10.2024 11:43, Jinjian Song wrote:
>>>>>>> If driver fails to set the device to suspend, it means that the
>>>>>>> device is abnormal. In this case, reset the device to recover
>>>>>>> when PCIe device is offline.
>>>>>>
>>>>>> Is it a reproducible or a speculative issue? Does the fix
>>>>>> recover modem from a problematic state?
>>>>>>
>>>>>> Anyway we need someone more familiar with this hardware (Intel
>>>>>> or MediaTek engineer) to Ack the change to make sure we are not
>>>>>> going to put a system in a more complicated state.
>>>>>
>>>>> This is a very difficult issue to replicate onece occured and fixed.
>>>>>
>>>>> The issue occured when driver and device lost the connection. I have
>>>>> encountered this problem twice so far:
>>>>> 1. During suspend/resume stress test, there was a probabilistic D3L2
>>>>> time sequence issue with the BIOS, result in PCIe link down, driver
>>>>> read and write the register of device invalid, so suspend failed.
>>>>> This issue was eventually fixed in the BIOS and I was able to restore
>>>>> it through the reset module after reproducing the problem.
>>>>>
>>>>> 2. During idle test, the modem probabilistic hang up, result in PCIe
>>>>> link down, driver read and write the register of device invalid, so
>>>>> suspend failed. This issue was eventually fiex in device modem firmware
>>>>> by adjust a certain power supply voltage, and reset modem as a workround
>>>>> to restore when the MBIM port command timeout in userspace applycations.
>>>>>
>>>>> Hardware reset modem to recover was discussed with MTK, and they said
>>>>> that if we don't want to keep the on-site problem location in case of
>>>>> suspend failure, we can use the recover solution.
>>>>> Both the ocurred issues result in the PCIe link issue, driver can't
>>>>> read and writer the register of WWAN device, so I want to add this
>>>>> path
>>>>> to restore, hardware reset modem can recover modem, but using the
>>>>> pci_channle_offline() as the judgment is my inference.
>>>>
>>>> Thank you for the clarification. Let me summarize what I've understood
>>>> from the explanation:
>>>> a) there were hardware (firmware) issues,
>>>> b) issues already were solved,
>>>> c) issues were not directly related to the device suspension procedure,
>>>> d) you want to implement a backup plan to make the modem support robust.
>>>>
>>>> If got it right, then I would like to recommend to implement a generic
>>>> error handling solution for the PCIe interface. You can check this
>>>> document: Documentation/PCI/pci-error-recovery.rst
>>>
>>> Yes, got it right.
>>> I want to identify the scenario and then recover by reset device,
>>> otherwise suspend failure will aways prevent the system from suspending
>>> if it occurs.
>>
>> If a PCIe link goes down here's my understanding of what happens:
>>
>>    - Writes to the device are silently dropped.
>>
>>    - Reads from the device return ~0 (PCI_POSSIBLE_ERROR()).
>>
>>    - If the device is in a slot and pciehp is enabled, a Data Link
>>      Layer State Changed interrupt will cause pciehp_unconfigure_device()
>>      to detach the driver and remove the pci_dev.
>>
>>    - If AER is enabled, a failed access to the device will cause an AER
>>      interrupt.  If the driver has registered pci_error_handlers, the
>>      driver callbacks will be called, and based on what the driver
>>      returns, the PCI core may reset the device.
>>
>> The pciehp and AER interrupts are *asynchronous* to link down events
>> and to any driver access to the device, so they may be delayed an
>> arbitrary amount of time.
>>
>> Both interrupt paths may lead to the device being marked as "offline".
>> Obviously this is asynchronous with respect to the driver.
>>
>>>>>>> +++ b/drivers/net/wwan/t7xx/t7xx_pci.c
>>>>>>> @@ -427,6 +427,10 @@ static int __t7xx_pci_pm_suspend(struct
>>>>>>> pci_dev *pdev)
>>>>>>>        iowrite32(T7XX_L1_BIT(0), IREG_BASE(t7xx_dev) +
>>>>>>> ENABLE_ASPM_LOWPWR);
>>>>>>>        atomic_set(&t7xx_dev->md_pm_state, MTK_PM_RESUMED);
>>>>>>>        t7xx_pcie_mac_set_int(t7xx_dev, SAP_RGU_INT);
>>>>>>> +    if (pci_channel_offline(pdev)) {
>>>>>>> +        dev_err(&pdev->dev, "Device offline, reset to recover\n");
>>>>>>> +        t7xx_reset_device(t7xx_dev, PLDR);
>>>>>>> +    }
>>
>> This looks like an unreliable way to detect issues.  It only works if
>> AER is enabled, and the device is only marked "offline" some arbitrary
>> length of time *after* a driver access to the device has failed.
>>
>> You can't reliably detect errors on writes to the device.
>>
>> You can only reliably detect errors on reads from the device by
>> looking for PCI_POSSIBLE_ERROR().  Obviously ~0 might be a valid value
>> to read from some registers, so you need device-specific knowledge to
>> know whether ~0 is valid or indicates an error.
>>
>> If AER or DPC are enabled, the driver can be *notified* about read
>> errors and some write errors via pci_error_handlers, but the
>> notification is long after the error.

--
Sergey

