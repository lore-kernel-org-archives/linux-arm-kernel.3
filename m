Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7313DC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 16:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4mzruiREkC/t4x6akBwSquvODk0SXsLUHU+gBZGRXLs=; b=abvgSERcUzpSZe3QOQBtfb0BRB
	5V6KAHW8qYkDED2b1LCgyFH+or6QasDlisjqNnkadnhAl/XWd/FV7M+FNv0bjlrEGvFovVHSCBO99
	nwqcq9cnWKvjRVEAI7FVoh9AFnHRB/eQIAk+R9P51VuVZZeI8QX5vS5yxCgKKJMSRGPMkRJoEKZXy
	z/IbGoEhGvXhuFiMAHFTKmhYL5Bi1E6JKIXfbPj3FCUSGSDtMrSOzl1zSC7J9qX2X/vs8UPgxcmMZ
	APvjPglzeRwx1fmiRLv954890A0VgeXhiWuTlz7ib5p0Ae3BrKwEao6dcKpMawDq6UO8JgDM2MvKc
	3luWwSUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA96B-0000000E01y-0htA;
	Fri, 25 Sep 2026 16:48:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA968-0000000E007-23kp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 16:48:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02AD4169C;
	Fri, 25 Sep 2026 09:48:26 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 22A6D3F86F;
	Fri, 25 Sep 2026 09:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790354909; bh=TzUGic9pMOny7EGR5g7usgpgx797/IJRE1u9ts1Wm0g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ofYM+MpN4pf0AQiHkEr6+VnR19TayQDECqyBJXDP5SqIguchrv1aGdXz4dXVLNmhb
	 dfFleGp0EeFmpr1ed3q40j4OQLi8cop06TNfATdKAfliLLJDCFKwbpMmZn39nVKi1m
	 Qn97RoWBgt5cO39iAOiYsEnFxJY7QXFKUVOFe83M=
Message-ID: <1b55f680-2413-4db1-b928-ed5741696d07@arm.com>
Date: Fri, 25 Sep 2026 17:48:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 06/12] remoteproc: virtio: add bounce buffering for
 data buffers
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Mark Brown
 <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, virtualization@lists.linux.dev,
 imx@lists.linux.dev, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <20260916-remoteproc_virtio_map-v1-6-dac8c5eb4aa9@valla.it>
 <arKlvZGqu2nt6Ci0@p14s> <arLXthhYbKkwZ9zY@bywater>
 <CANLsYkwNOukGX68=NVvwNP7iudP3EcKN6C2L2o9nVCTRxFVxFg@mail.gmail.com>
 <arP38OEaabFFu8lJ@bywater> <araOI_duKIAbphq6@p14s>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <araOI_duKIAbphq6@p14s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_094832_625034_87D3D894 
X-CRM114-Status: GOOD (  30.97  )
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

On 25/09/2026 4:07 pm, Mathieu Poirier wrote:
> On Wed, Sep 23, 2026 at 06:05:35PM +0200, Francesco Valla wrote:
>> On Wed, Sep 23, 2026 at 08:44:41AM -0600, Mathieu Poirier wrote:
>>> On Tue, 22 Sept 2026 at 13:39, Francesco Valla <francesco@valla.it> wrote:
>>>>
>>>> On Tue, Sep 22, 2026 at 09:58:53AM -0600, Mathieu Poirier wrote:
>>>>> On Wed, Sep 16, 2026 at 11:10:51PM +0200, Francesco Valla wrote:
>>>>>> Depending on the driver originating them, data buffers used for virtio
>>>>>> communication can either:
>>>>>>
>>>>>>    - already be allocated from the coherent memory area that is
>>>>>>      accessible by the remote processor; this is the case of rpmsg
>>>>>>      and the rproc flavor of virtio-console;
>>>>>>    - be allocated from generic kmem, and thus not accessible directly by
>>>>>>      the remote processor.
>>>>>>
>>>>>> Exploiting the map operations, which are used by the virtio framework
>>>>>> when VIRTIO_F_ACCESS_PLATFORM is part of a vdev's feature flags, add
>>>>>> bounce buffering for the second case: when the map() callback is called
>>>>>> for a buffer, one or more pages of coherent memory are allocated and
>>>>>> data is copied to them, then they are exposed to the remote processor;
>>>>>> the data is  then bounced back on unmap().
>>>>>>
>>>>>> The first case is not impacted, since buffers already suitable for
>>>>>> remote transmission are passed through.
>>>>>>
>>>>>> With the bounce buffering in place, any kind of virtio device can be
>>>>>> supported through the remoteproc-virtio transport, at least from a
>>>>>> data exchange standpoint.
>>>>>
>>>>> Is this _necessary_ for the imx93 platform you are implementing feature for?
>>>>>
>>>>
>>>> If I don't want to fundamentally change how the remoteproc integration
>>>> works (i.e.: using buffers only from a pre-shared area), yes. While in
>>>> my test environment the Cortex-M33 serving as remoteproc is able to
>>>> access the whole RAM space, that is not always the case.
>>>
>>> The first sentence tells me it is mandatory while the second says it
>>> is not.  I understand the use case but don't want to bloat the
>>> subsystem with code that is trying to address a problem you currently
>>> don't have.
>>>
>>
>> Let me rephrase: while on i.MX93 the Cortex-M33 can theoretically access
>> the whole RAM space, that is not a good idea from a security point of
>> view and can be the source of a number of bugs. The target is to
>> statically define a static shared memory area (as I am doing on i.MX95)
>> and only use that.
> 
> As Robin pointed out, have you looked at using a restricted-dma-pool for that?
> Note that I am not familiar with the concept but open to go that way if it can
> work for us.
> 
> Robin, can you point us to a simple example we could look at?
The only in-tree example is mt8192-asurada.dtsi, but even there the 
fundamental principle seems exactly the same - the system interconnect 
is locked down such that there's only a particular region of "shared" 
memory that PCIe DMA can access, so the restricted pool is placed there, 
and in that case can occupy the entire region since the wifi adapter 
only really does streaming DMA - restricted pools have some limited 
ability to act as a fallback for coherent allocations, which won't work 
for everything, but does happen to be enough for that wifi driver.

Here it would be a case of reserving some of the shared region for a 
restricted pool alongside the "vdevbuffer" coherent pool, adding it to 
the memory-region list of the relevant device(s), and usually that would 
then just work, since the setup is all done automatically by the core DT 
code. However I know remoteproc does some funky stuff with child 
devices, so it's quite possible there might need to be something more 
done there. But still far, far less than reimplementing a whole other 
bounce-buffering system.

Thanks,
Robin.

