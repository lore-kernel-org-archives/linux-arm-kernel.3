Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE910C35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 18:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nt8jkVfaRzuUqauG7agUplFqSQ7P9hL/iQtfhXt7daM=; b=ccdzcOYRBUWRJ2iMpAiHPjBDe4
	8Hr2KH1Ckokyr04yWHxoXhYhy+faXRW/NQ2rJNplIQS2EjrbRMX2jxa/OOvuWYdyeXFvGPFvNnxEB
	Aaudo1oly7Y0C35E9dFZRpXXnnSzNcdfLArrg6JiPenjSrTilxpkdTAsCACPFZf9rbeQpug/z+PQ/
	Y1g/fo6aW1IaZeycanx+agJub8ynzXRQgFoYEiAR5dAR/HwJoGYX1AN1+74saL6p7FGzCk22Ut78l
	vrjFCX+99sWj/WK8QMoV9nUHAkbO8vOCl2M5RYMjeGpWG3knicM1Lngzz7FmP4NDp/4egc1TwtcEz
	g8OhdCqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsngB-0000000CF2L-2OSa;
	Thu, 13 Mar 2025 18:53:15 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsnaA-0000000CE60-25Lg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 18:47:03 +0000
Received: from [10.137.184.60] (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id EE024203342A;
	Thu, 13 Mar 2025 11:46:58 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com EE024203342A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1741891619;
	bh=nt8jkVfaRzuUqauG7agUplFqSQ7P9hL/iQtfhXt7daM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c029q20hO7p9pMytBoFbb4lvO9ZDTqP8ojMLWrK9hbwLYNc57V4N0Aa6gWzzJFcHr
	 esb6o3L0vE8YHyp+7RG+sJdxsuqky6Zy4qUPq4udmjKBOq899yOQu3eWe+Mhi7Jmax
	 CS5/4KC7mWI6F/acsg68bV6b8QdxWShafCvHoxSA=
Message-ID: <81612b52-a47b-4d9c-9d50-c74ad66286d9@linux.microsoft.com>
Date: Thu, 13 Mar 2025 11:46:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH hyperv-next v5 08/11] Drivers: hv: vmbus: Get the IRQ
 number from DeviceTree
To: Rob Herring <robh@kernel.org>
Cc: arnd@arndb.de, bhelgaas@google.com, bp@alien8.de,
 catalin.marinas@arm.com, conor+dt@kernel.org, dave.hansen@linux.intel.com,
 decui@microsoft.com, haiyangz@microsoft.com, hpa@zytor.com,
 joey.gouly@arm.com, krzk+dt@kernel.org, kw@linux.com, kys@microsoft.com,
 lenb@kernel.org, lpieralisi@kernel.org, manivannan.sadhasivam@linaro.org,
 mark.rutland@arm.com, maz@kernel.org, mingo@redhat.com,
 oliver.upton@linux.dev, rafael@kernel.org, ssengar@linux.microsoft.com,
 sudeep.holla@arm.com, suzuki.poulose@arm.com, tglx@linutronix.de,
 wei.liu@kernel.org, will@kernel.org, yuzenghui@huawei.com,
 devicetree@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, x86@kernel.org,
 apais@microsoft.com, benhill@microsoft.com, bperkins@microsoft.com,
 sunilmut@microsoft.com
References: <20250307220304.247725-1-romank@linux.microsoft.com>
 <20250307220304.247725-9-romank@linux.microsoft.com>
 <CAL_JsqLmS4EEoPkOmaH6F_0XtQu5wkM-WEfxFvjLA=bJroEUVw@mail.gmail.com>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <CAL_JsqLmS4EEoPkOmaH6F_0XtQu5wkM-WEfxFvjLA=bJroEUVw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_114702_561395_39CF25B1 
X-CRM114-Status: GOOD (  11.92  )
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



On 3/13/2025 11:44 AM, Rob Herring wrote:
> On Fri, Mar 7, 2025 at 4:03 PM Roman Kisel <romank@linux.microsoft.com> wrote:

[...]

>> +       irq = platform_get_irq(pdev, 0);
>> +       if (irq == 0) {
>> +               pr_err("VMBus interrupt mapping failure\n");
>> +               return -EINVAL;
>> +       }
>> +       if (irq < 0) {
>> +               pr_err("VMBus interrupt data can't be read from DeviceTree, error %d\n", irq);
>> +               return irq;
>> +       }
> 
> I don't think why you couldn't get the interrupt is important. Just
> check for (irq <= 0) and be done with it. I'm not even sure if
> returning 0 is possible now. There's a long history to that and
> NO_IRQ.
> 

That will certainly make the code look much better!
Thank you very much for the idea!

> Rob

-- 
Thank you,
Roman


