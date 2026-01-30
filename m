Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2382D46C1D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 22:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KGdqS9ek3b00E3zGRkQ2P5hPV0gdMGJpvlJhJT8pBAM=; b=ftA0UfgDv/J+Uk0uKy2n2cIBo9
	090I6/BNXgwDtZZf0AQEUmsSATxIo9rZqpmPO0aeCzv6to2jykgLLaHXDf66ZG/IXuuOiJ6YTf5oN
	sL8Jzt/wefWWBqiPMfcKbxGOoZ1A+GUgvSCzsVh9IDddDm35VSrm/GT/g6GaVg5EROcs8piSu/43G
	J0zJVFKrS1g+H0EMnXLFRrTMneRsrlg6/5WpfUfqmKInevx0ISf/rma0CL0B8bUQIbmqw+wDxyIQR
	NOb8j4S9hRaEfIaWZ3cvLhhMnqZT8czNMtBFGNhA5H3uiK6Lj/oZveLr+0OK6LUdIwPbJILJHN64K
	qbs0l9QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlxKm-000000024dV-3vU4;
	Fri, 30 Jan 2026 22:51:24 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlxKl-000000024d8-0uyD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 22:51:24 +0000
Received: from [192.168.0.88] (192-184-212-33.fiber.dynamic.sonic.net [192.184.212.33])
	by linux.microsoft.com (Postfix) with ESMTPSA id 7D09D20B7167;
	Fri, 30 Jan 2026 14:51:20 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7D09D20B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1769813481;
	bh=KGdqS9ek3b00E3zGRkQ2P5hPV0gdMGJpvlJhJT8pBAM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nnW/cjHFX2Y5nDawSxVZ3sUA+dmD8vFt4ip3PxYRcw9o/woCVpgXmW+cCwzodAyQL
	 L6uefhD0hSdSKg5QDkYh1KNQQ7z20w5Wwa8oDaL9qgH0MmByofmSnUnskROUxZWUR5
	 BQHY7cYRXGx3B85k5PRq6Plys4U5RBW5yAx5hZOU=
Message-ID: <8298de1d-648c-bbc6-b3c9-1cbc9b5d7e72@linux.microsoft.com>
Date: Fri, 30 Jan 2026 14:51:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v0 12/15] x86/hyperv: Implement hyperv virtual iommu
Content-Language: en-US
To: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
Cc: linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-pci@vger.kernel.org, linux-arch@vger.kernel.org, kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
 longli@microsoft.com, catalin.marinas@arm.com, will@kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, joro@8bytes.org,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 robh@kernel.org, bhelgaas@google.com, arnd@arndb.de,
 nunodasneves@linux.microsoft.com, mhklinux@outlook.com,
 romank@linux.microsoft.com
References: <20260120064230.3602565-1-mrathor@linux.microsoft.com>
 <20260120064230.3602565-13-mrathor@linux.microsoft.com>
 <aXAZ-r1PeUBAHwaK@skinsburskii.localdomain>
 <54fd73b9-ade6-f1bb-08fc-17571aeadb20@linux.microsoft.com>
 <aXeO7wh7bpacJ1Sk@skinsburskii.localdomain>
 <c40e6dc8-8e42-b0f3-f8e5-3c637adb7f13@linux.microsoft.com>
 <aXkIGfos4l0kv_lF@skinsburskii.localdomain>
From: Mukesh R <mrathor@linux.microsoft.com>
In-Reply-To: <aXkIGfos4l0kv_lF@skinsburskii.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_145123_294883_2B72A401 
X-CRM114-Status: GOOD (  24.75  )
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

On 1/27/26 10:46, Stanislav Kinsburskii wrote:
> On Mon, Jan 26, 2026 at 07:02:29PM -0800, Mukesh R wrote:
>> On 1/26/26 07:57, Stanislav Kinsburskii wrote:
>>> On Fri, Jan 23, 2026 at 05:26:19PM -0800, Mukesh R wrote:
>>>> On 1/20/26 16:12, Stanislav Kinsburskii wrote:
>>>>> On Mon, Jan 19, 2026 at 10:42:27PM -0800, Mukesh R wrote:
>>>>>> From: Mukesh Rathor <mrathor@linux.microsoft.com>
>>>>>>
>>>>>> Add a new file to implement management of device domains, mapping and
>>>>>> unmapping of iommu memory, and other iommu_ops to fit within the VFIO
>>>>>> framework for PCI passthru on Hyper-V running Linux as root or L1VH
>>>>>> parent. This also implements direct attach mechanism for PCI passthru,
>>>>>> and it is also made to work within the VFIO framework.
>>>>>>
>>>>>> At a high level, during boot the hypervisor creates a default identity
>>>>>> domain and attaches all devices to it. This nicely maps to Linux iommu
>>>>>> subsystem IOMMU_DOMAIN_IDENTITY domain. As a result, Linux does not
>>>>>> need to explicitly ask Hyper-V to attach devices and do maps/unmaps
>>>>>> during boot. As mentioned previously, Hyper-V supports two ways to do
>>>>>> PCI passthru:
>>>>>>
>>>>>>      1. Device Domain: root must create a device domain in the hypervisor,
>>>>>>         and do map/unmap hypercalls for mapping and unmapping guest RAM.
>>>>>>         All hypervisor communications use device id of type PCI for
>>>>>>         identifying and referencing the device.
>>>>>>
>>>>>>      2. Direct Attach: the hypervisor will simply use the guest's HW
>>>>>>         page table for mappings, thus the host need not do map/unmap
>>>>>>         device memory hypercalls. As such, direct attach passthru setup
>>>>>>         during guest boot is extremely fast. A direct attached device
>>>>>>         must be referenced via logical device id and not via the PCI
>>>>>>         device id.
>>>>>>
>>>>>> At present, L1VH root/parent only supports direct attaches. Also direct
>>>>>> attach is default in non-L1VH cases because there are some significant
>>>>>> performance issues with device domain implementation currently for guests
>>>>>> with higher RAM (say more than 8GB), and that unfortunately cannot be
>>>>>> addressed in the short term.
>>>>>>
>>>>>
>>>>> <snip>
>>>>>
>>>
>>> <snip>
>>>
>>>>>> +static void hv_iommu_detach_dev(struct iommu_domain *immdom, struct device *dev)
>>>>>> +{
>>>>>> +	struct pci_dev *pdev;
>>>>>> +	struct hv_domain *hvdom = to_hv_domain(immdom);
>>>>>> +
>>>>>> +	/* See the attach function, only PCI devices for now */
>>>>>> +	if (!dev_is_pci(dev))
>>>>>> +		return;
>>>>>> +
>>>>>> +	if (hvdom->num_attchd == 0)
>>>>>> +		pr_warn("Hyper-V: num_attchd is zero (%s)\n", dev_name(dev));
>>>>>> +
>>>>>> +	pdev = to_pci_dev(dev);
>>>>>> +
>>>>>> +	if (hvdom->attached_dom) {
>>>>>> +		hv_iommu_det_dev_from_guest(hvdom, pdev);
>>>>>> +
>>>>>> +		/* Do not reset attached_dom, hv_iommu_unmap_pages happens
>>>>>> +		 * next.
>>>>>> +		 */
>>>>>> +	} else {
>>>>>> +		hv_iommu_det_dev_from_dom(hvdom, pdev);
>>>>>> +	}
>>>>>> +
>>>>>> +	hvdom->num_attchd--;
>>>>>
>>>>> Shouldn't this be modified iff the detach succeeded?
>>>>
>>>> We want to still free the domain and not let it get stuck. The purpose
>>>> is more to make sure detach was called before domain free.
>>>>
>>>
>>> How can one debug subseqent errors if num_attchd is decremented
>>> unconditionally? In reality the device is left attached, but the related
>>> kernel metadata is gone.
>>
>> Error is printed in case of failed detach. If there is panic, at least
>> you can get some info about the device. Metadata in hypervisor is
>> around if failed.
>>
> 
> With this approach the only thing left is a kernel message.
> But if the state is kept intact, one could collect a kernel core and
> analyze it.

Again, most of linux stuff is cleaned up, the only state is in
hypervisor, and hypervisor can totally protect itself and devices.
So there is not much in kernel core as it got cleaned up already.
Think of this as additional check, we can remove in future after
it stands the test of time, until then, every debugging bit helps.

> And note, that there won't be a hypervisor core by default: our main
> context with the usptreamed version of the driver is L1VH and a kernel
> core is the only thing a third party customer can provide for our
> analysis.

Wei can correct me, but we are not only l1vh focused here. There is
work going on on all fronts.

Thanks,
-Mukesh

> Thanks,
> Stanislav

