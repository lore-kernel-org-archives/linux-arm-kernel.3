Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB77C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 21:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E4HKlxVjhIt2MzhfvIo5qMqiVK9k8HOzhVxjjAVbOk0=; b=3eHs6KwhMfmz+OfJc2ocxd0JEv
	Bhqp537Gwdn9oG6tHHZZLEtoPlUvOlm+HJ0eSbqoTOyiA8fUTT9HGhx4CozEG9hgOQKefepO9ixKA
	KRXziDsyo/YgD8eMrnthWCMG6B27DnYjeo4M+nucqWIeyc9rTwbhGcyVVhcErWbeNm3MhnjjVr5vf
	8RhtpEhkfSL558r1yt6tDlE3AMuGd6mvNc4wR1kfBF1gTu4M4oTvOopKGirpdwdUUWOVBgP8xteJu
	V3aZkPMSd/A5wtnKhQ634hQXML0iPysuolA7UvvsBTHVeBiv11JhsUIKxU+6EZOlQc5H0Ss12hYiv
	B57k4ULA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trkb5-000000040rZ-06RA;
	Mon, 10 Mar 2025 21:23:39 +0000
Received: from flow-b3-smtp.messagingengine.com ([202.12.124.138])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trkYg-000000040bD-3nOw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 21:21:12 +0000
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailflow.stl.internal (Postfix) with ESMTP id 939871D41B86;
	Mon, 10 Mar 2025 17:21:06 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Mon, 10 Mar 2025 17:21:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1741641666;
	 x=1741648866; bh=E4HKlxVjhIt2MzhfvIo5qMqiVK9k8HOzhVxjjAVbOk0=; b=
	C1hTxUvPA3Fb5iBKVyaB9S0GfSvuHye+iANMUYbqz2WEwKh+PjF2Ig9bEJQVXL8W
	kdPPlIgBhaXBR9cfmZ0PE2Am21WLFpDOSC8cX4CRdGVkwDQwLrkIeM5p0hpYbe13
	dTxmdFfOvUlpJHQMFzsNCj740xYgX3HO88YG9+874W9W3ONJKWU3JnOvcNKUU/4u
	knNl6Vi+hohsFjz5X2QG4iDQUTaDl2o6gl+/SgTvwh+IxFXmzMQL8wdboNLh14A/
	aarOTRDHRANpQ7jaacfHOdK2NKw4xhhoPCgcdkDHdrFJ9fRJG33i70Yr/2EzUjdG
	KxdDzQVgaqrYOM7VHlF73A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1741641666; x=
	1741648866; bh=E4HKlxVjhIt2MzhfvIo5qMqiVK9k8HOzhVxjjAVbOk0=; b=i
	yQRqWqSGI6Kt3YUKxrmI/FlE9b26ffQwpxP94u4VFt4R8vOueVcX3AoCZMSsXlsf
	XL00t5hz0HKoZQiWWgBfXmCi3KczhguDU8kRNtshw4wzTjqLWf4R4c8bJijn8DFl
	5yAnjsGkIz+NVAjzqe0v8OCUxD15L05INUOiZ6x/J4ac0ZBqVNbvzgRHbmj5t9Ba
	3j6HgC/97L/dQ3YDHejXKY/xvQz/hLUQihBs2DCB1G8au5Q5PvHhOBLiHxE0gHPx
	sXxfmR9U/Us8LYPKZcy0PiBDAB8ri/wnT4GnQ5IYNOMthafCCbqTTLAJKEw4GxLS
	2eWJA70Uin2M61IfU8uCQ==
X-ME-Sender: <xms:wVfPZ2JStQfl-VXaWTJ_QuMzQ3ObrIeeleBzBmQxfF4Du39ikrBCLg>
    <xme:wVfPZ-I7hmahTLPWORKx4-GCw39p0HhoYbrARohYV_QOvY1Fl0dBQ8OowZ2_vQTBT
    5KFklbFDw_9R3vrcUA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvddtgeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    geefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsphesrghlihgvnhekrdguvg
    dprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghp
    thhtohepjhhovgihrdhgohhulhihsegrrhhmrdgtohhmpdhrtghpthhtohepmhgrrhhkrd
    hruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtghpthhtohepshhuuggvvghprdhhohhllhgr
    segrrhhmrdgtohhmpdhrtghpthhtohepshhuiihukhhirdhpohhulhhoshgvsegrrhhmrd
    gtohhmpdhrtghpthhtohepsghhvghlghgrrghssehgohhoghhlvgdrtghomhdprhgtphht
    thhopeihuhiivghnghhhuhhisehhuhgrfigvihdrtghomhdprhgtphhtthhopegtohhnoh
    hrodgutheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:wVfPZ2vjrGidv7HfBCACY-yGDYl3EfwXvQhqp8jKyTCtNAEsgJj2fQ>
    <xmx:wVfPZ7ZidpufvcbZMZOogXc8KetgC1YVnS_aBECkUMRpwdLI0iDxwg>
    <xmx:wVfPZ9ZPI552vps1YoMhGOloTLMV3PrxFhTqMlOyR0s_NrkTI0YDFg>
    <xmx:wVfPZ3De8byh2Bv17Og3Rg_scmCx5lM1v133qfZGoZiEq96RKyOTzg>
    <xmx:wlfPZ-pxMLQep5aMAHOoE69Tz3LFoYiwRsd_W-SJ689j4Q6-j_dfe3KI>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2BEF92220072; Mon, 10 Mar 2025 17:21:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Mon, 10 Mar 2025 22:20:41 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Michael Kelley" <mhklinux@outlook.com>,
 "Roman Kisel" <romank@linux.microsoft.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Dexuan Cui" <decui@microsoft.com>,
 "Haiyang Zhang" <haiyangz@microsoft.com>,
 "H. Peter Anvin" <hpa@zytor.com>, "Joey Gouly" <joey.gouly@arm.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, "Len Brown" <lenb@kernel.org>,
 "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org>,
 "Mark Rutland" <mark.rutland@arm.com>, "Marc Zyngier" <maz@kernel.org>,
 "Ingo Molnar" <mingo@redhat.com>,
 "Oliver Upton" <oliver.upton@linux.dev>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 "Rob Herring" <robh@kernel.org>,
 "ssengar@linux.microsoft.com" <ssengar@linux.microsoft.com>,
 "Sudeep Holla" <sudeep.holla@arm.com>,
 "Suzuki K Poulose" <suzuki.poulose@arm.com>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Wei Liu" <wei.liu@kernel.org>,
 "Will Deacon" <will@kernel.org>, "Zenghui Yu" <yuzenghui@huawei.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 Linux-Arch <linux-arch@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>
Cc: "apais@microsoft.com" <apais@microsoft.com>,
 "benhill@microsoft.com" <benhill@microsoft.com>,
 "bperkins@microsoft.com" <bperkins@microsoft.com>,
 "sunilmut@microsoft.com" <sunilmut@microsoft.com>
Message-Id: <119cfb59-d68b-4718-b7cb-90cba67827e8@app.fastmail.com>
In-Reply-To: <BN7PR02MB41488C06B7E42830C700318DD4D62@BN7PR02MB4148.namprd02.prod.outlook.com>
References: <20250307220304.247725-1-romank@linux.microsoft.com>
 <20250307220304.247725-4-romank@linux.microsoft.com>
 <e0f81049-688e-4f53-a002-5d246281bf8d@app.fastmail.com>
 <BN7PR02MB41488C06B7E42830C700318DD4D62@BN7PR02MB4148.namprd02.prod.outlook.com>
Subject: Re: [PATCH hyperv-next v5 03/11] Drivers: hv: Enable VTL mode for arm64
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_142111_567892_5A2CA182 
X-CRM114-Status: GOOD (  17.47  )
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

On Mon, Mar 10, 2025, at 22:01, Michael Kelley wrote:
> From: Arnd Bergmann <arnd@arndb.de> Sent: Saturday, March 8, 2025 1:05 PM
>> >  config HYPERV_VTL_MODE
>> >  	bool "Enable Linux to boot in VTL context"
>> > -	depends on X86_64 && HYPERV
>> > +	depends on (X86_64 || ARM64)
>> >  	depends on SMP
>> > +	select OF_EARLY_FLATTREE
>> > +	select OF
>> >  	default n
>> >  	help
>> 
>> Having the dependency below the top-level Kconfig entry feels a little
>> counterintuitive. You could flip that back as it was before by doing
>> 
>>       select HYPERV_VTL_MODE if !ACPI
>>       depends on ACPI || SMP
>> 
>> in the HYPERV option, leaving the dependency on HYPERV in
>> HYPERV_VTL_MODE.
>
> I would argue that we don't ever want to implicitly select
> HYPERV_VTL_MODE because of some other config setting or
> lack thereof.  VTL mode is enough of a special case that it should
> only be explicitly selected. If someone omits ACPI, then HYPERV
> should not be selectable unless HYPERV_VTL_MODE is explicitly
> selected.
>
> The last line of the comment for HYPERV_VTL_MODE says
> "A kernel built with this option must run at VTL2, and will not run
> as a normal guest."  In other words, don't choose this unless you
> 100% know that VTL2 is what you want.

It sounds like the latter is the real problem: enabling a feature
should never prevent something else from working. Can you describe
what VTL context is and why it requires an exception to a rather
fundamental rule here? If you build a kernel that runs on every
single piece of arm64 hardware and every hypervisor, why can't
you add HYPERV_VTL_MODE to that as an option?

      Arnd

