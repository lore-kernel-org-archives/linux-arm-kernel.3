Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7F2606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 14:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ruTvZZtP;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=BPAHlMuP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dd9e46BTrpHgF60mWtnGPE2/vPI3dSQPcJz11b4S1jk=; b=ruTvZZtPgOVmo52MZP0Ca+CNrv
	xPYTVfGCEmyTMadbDYlJu6Q+xoho2Vh6fQPtyAiQXuTp4qrMjGwAY0wctRCTfgG2fBL3gBJh0OHSe
	ITYxupow/s0Ks1S2VB0XvhPyPlGSok4HacByZiLO36Lu8e6u1zyu64WmfV4Nk6BlKBBpU3gZoqMW3
	AJSH/1osls8jggKNzqBB2AGZzUpig+OKgvjPn/PvM44U4ZS8MISMt6853z26Ul83via6kDRkhNlpa
	QOE/TFQbf2sGmpk0yD+lx6ViXJbkeDcDX2sZr4YbuBiVGqyIEghazAKHNn9xa3ihn5n8pkk84gkZB
	eB3y3ACQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAoY-00000009wQ0-2Hsx;
	Tue, 20 Oct 2026 14:27:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAoS-00000009wOQ-31se
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 14:27:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4272616F8;
	Tue, 20 Oct 2026 07:27:31 -0700 (PDT)
Received: from [10.0.137.15] (XHFQ2J9959-5.cambridge.arm.com [10.0.137.15])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D2363F7D8;
	Tue, 20 Oct 2026 07:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792506454; bh=II7XzKF/T9a42uG8lOm7+KYJJnneubeimBS3uGSkock=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BPAHlMuPMZTzU3zfBQVYdzZx6EFum1IZ9tNdfI41BIOD1ynRavvH/BLSpoHVkwC7j
	 GsxOWywnQWifJ95J1IVxn6CyoFnm6HTr1FG1Zk1MR5LW8CW5zDQlNmBupLWLyCWxE6
	 +Tufm7Qk3l7H79TsgTEtkuAfPiAAvp+fpJIutrRk=
Message-ID: <08521420-5adb-4e3a-8110-4713bcd5dfa0@arm.com>
Date: Tue, 20 Oct 2026 15:27:28 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 15/15] misc/arm-cla: Add vfio-mdev user interface
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Jean-Philippe Brucker <jpb@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
 Alex Williamson <alex@shazbot.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
References: <20261015142552.4128028-1-ryan.roberts@arm.com>
 <20261015142552.4128028-16-ryan.roberts@arm.com>
 <20261015164102.GC13920@nvidia.com>
 <CABCqBse_aZL-EH0us2uA5X10q6E4WP02MoHTYf+M9ezRZr26WQ@mail.gmail.com>
 <20261016144202.GG13920@nvidia.com>
 <375868af-d0bd-4278-83e6-f8429df130e9@arm.com>
 <20261020141540.GB3008132@nvidia.com>
From: Ryan Roberts <ryan.roberts@arm.com>
Content-Language: en-GB
In-Reply-To: <20261020141540.GB3008132@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_072739_441350_8E766588 
X-CRM114-Status: GOOD (  27.06  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 20/10/2026 15:15, Jason Gunthorpe wrote:
> On Tue, Oct 20, 2026 at 11:41:57AM +0100, Ryan Roberts wrote:
>> On 16/10/2026 15:42, Jason Gunthorpe wrote:
>>> On Fri, Oct 16, 2026 at 03:22:00PM +0100, Jean-Philippe Brucker wrote:
>>>> On Thu, 15 Oct 2026 at 17:41, Jason Gunthorpe <jgg@nvidia.com> wrote:
>>>>> I think I said this last time, please don't use vfio mdev for
>>>>> anything. There is nothing mediated about this.
>>>>
>>>> We don't multiplex a device between guests, but the host driver must
>>>> control part of the device registers while the remainder is assigned to
>>>> a guest. The host configures accelerator access, stage-2 translation,
>>>> handles CPUHP and context save/restore. So we can't bind the device to
>>>> vfio-platform.
>>>
>>> That's fine, you can make a proper vfio-cla driver.
>>
>> Hi Jason,
>>
>> Thanks for taking a look at this! I've been chewing on this comment and trying
>> to educate myself deeper on the subject. I have a proposal...
>>
>> Currently we create a struct device per CLA device instance. But multiple CLA
>> device instances cooperate within a domain and the domain is the "unit of
>> isolation"; 
> 
> Well that's weird and a bit confusing.

Yes; this conversation is helping me to see that... :)

I was originally trying to avoid creating any globally visible entity that
describes a "domain", since I thought there was a possibility that each process
might want to define it's own view of a domain. But in hindsight I don't think
that's helpful...

> 
>> we can't have some CLAs from a domain assigned to a VM, while others
>> from the same domain are used by the host. Therefore it didn't feel like the
>> correct model to unbind one of these devices from the native driver and rebind
>> it to a cla-vfio driver. mdev seemed to solve this problem nicely for us.
>>
>> But looking into it in more detail, I guess something like this might be a bit
>> more standard:
>>
>>  - Split the existing CLA driver into three components:
>>     - cla-core: Hardware discovery, domain configuration, struct device
>>       registration and CPU hotplug
>>     - cla-native driver: Provides the user space accelerator interfaces
>>     - cla-vfio driver: Enables domains to be assigned to virtual machines
>>  - Each domain has a struct device (created by the core)
>>     - An individual CLA is not represented by a struct device
>>  - Either cla-native or cla-vfio can then bind to a domain device
>>     - cla-native exposes a char device per domain, per accelerator class
>>     - cla-vfio
>>
>> For VFIO, I guess we could use one VFIO region per CLA, which would allow the
>> VMM to construct a device tree. But it would need to additionally determine
>> which CPU each CLA is bound to; perhaps that's a sysfs interface that cla-core
>> could expose?
> 
> I don't know alot about your CLA, but this sounds reasonable. There
> may be uses with containers to have the split exposed like this too.

...This all feels much clearer and simpler. I'll work on an approach like this.

Thanks,
Ryan

> 
> Jason


