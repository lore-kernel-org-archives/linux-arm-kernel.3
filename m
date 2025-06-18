Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CF2C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 22:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rJs6TsFM1aXGlAgdipcm0UQBa8DTSKlhPilE+LUrsic=; b=GvNZv42G9e/Awgpq+WOQIt5wby
	Sg0oYQPKn6duRgzoN2SlJOfQmzbSJRPCMFrKlOZF6BkK2AMdssXC5XRBVNHevpj39kVNpQuemUIfK
	h8v31WBlDIKiKyAiY/RBQ35ytokqh0qpI447noZ0Ww3FTDWfeVOFs5lX6mfJGGWN+DMuRd5Nt2kqu
	Ig4/UCDYe/vxyi8u5mnbVRMGJGwOS4RDJyyw/OPFRZQqyYFALVjrT+agLrj3zHNii18Z64OLVyBO1
	71+X1C00NO2lrh4tYLR+NXpOfV1KhfneiI6wOrZp8BYfACCtKmrWYxyUGXsYvlVbpI+56W4mwEyse
	UyQTuQsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS1Zf-0000000BXAB-1Ahd;
	Wed, 18 Jun 2025 22:48:07 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS1X2-0000000BWsr-0kia
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 22:45:25 +0000
Received: from [100.64.233.194] (unknown [52.148.171.5])
	by linux.microsoft.com (Postfix) with ESMTPSA id 8006E211936F;
	Wed, 18 Jun 2025 15:45:22 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8006E211936F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1750286723;
	bh=rJs6TsFM1aXGlAgdipcm0UQBa8DTSKlhPilE+LUrsic=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=L68sOx3uTtlWroiS/eOpJnEcntdicNrsTjKS/S0supUx+TTZJxftHulUkZihpSpzY
	 MkuWVko7E7VWaC0YpxYB8KuRpsNlORdz5C+RO3DinJj9vIuhoNVLmN8kelX4omLH79
	 Kk19I9RHzd0dBxBEHyRI2tweyqVI5z1Cw4Kf2fio=
Message-ID: <f6c8da5d-9dc0-488e-88e5-39f53127b6a3@linux.microsoft.com>
Date: Wed, 18 Jun 2025 15:45:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] PCI: hv: Use the correct hypercall for unmasking
 interrupts on nested
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, mhklinux@outlook.com,
 decui@microsoft.com, catalin.marinas@arm.com, will@kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, lpieralisi@kernel.org,
 kw@linux.com, manivannan.sadhasivam@linaro.org, robh@kernel.org,
 bhelgaas@google.com, jinankjain@linux.microsoft.com,
 skinsburskii@linux.microsoft.com, mrathor@linux.microsoft.com, x86@kernel.org
References: <20250613193616.GA971782@bhelgaas>
Content-Language: en-US
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
In-Reply-To: <20250613193616.GA971782@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_154524_248936_AF0E8928 
X-CRM114-Status: GOOD (  10.24  )
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

On 6/13/2025 12:36 PM, Bjorn Helgaas wrote:
> On Tue, Jun 10, 2025 at 04:52:06PM -0700, Nuno Das Neves wrote:
>> From: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
>>
>> Running as nested root on MSHV imposes a different requirement
>> for the pci-hyperv controller.
>>
>> In this setup, the interrupt will first come to the L1 (nested) hypervisor,
>> which will deliver it to the appropriate root CPU. Instead of issuing the
>> RETARGET hypercall, we should issue the MAP_DEVICE_INTERRUPT
>> hypercall to L1 to complete the setup.
> 
> Maybe strengthen this to say that this issues MAP_DEVICE_INTERRUPT
> instead of RETARGET in this case?  (Not just that we "should".) 
> 

Good suggestion, thanks.

>> Rename hv_arch_irq_unmask() to hv_irq_retarget_interrupt().


