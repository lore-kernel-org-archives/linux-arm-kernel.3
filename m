Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB501D2E00E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 07:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QmdYGEfgv2myx16lov9/7CVEhKPUPcTa475udVNsp90=; b=nSU9CpJbg/Z+jFsdHDKO5ajny/
	VdVq/od0n49Laezc4SOAkzRnMx5WSne5KmbVsiH6zS+0CAqVMfTTZEjfopb9MahSf3k6JKcVttSBH
	Kq0d5zyGU6ogUtMI8l+4msY1tHbjcTE91RDxoV620fNzJcD9Z/WQfNiBN984OVEzIHnRKnbOdDvLb
	uiMOuZbNbuQIhx1VNnKY0Wb2/AWPtHUDjxp4yc6Z4yY/talblB/nWkDFP+d5n5rexn+E46/SWUV45
	LsHtvz1/yn0gF5t3aiuaQX7fapm4LCsIfh8NRtvq0RypWcafIYeVguFEGH1FDxuLflmxd3S2GR7yf
	+KayJU2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRPwx-000000098E2-43qf;
	Fri, 05 Dec 2025 07:09:56 +0000
Received: from fhigh-a1-smtp.messagingengine.com ([103.168.172.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRPwv-000000098Df-0l5q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 07:09:54 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1948614000C5;
	Fri,  5 Dec 2025 02:09:49 -0500 (EST)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-04.internal (MEProxy); Fri, 05 Dec 2025 02:09:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1764918589;
	 x=1765004989; bh=QmdYGEfgv2myx16lov9/7CVEhKPUPcTa475udVNsp90=; b=
	pR+SopcOddt96sZj22fCQRcQZGiXPMJc1zI+6OnmaEa/FNXOtRTQYVgghdkMnoT9
	lGDOyhtVXbBHsg1c7sN061mgDTNsJDETDBCmTq5Z6Hi2E5UQS+hkf6SQ5oVYHAVX
	mq2ntKif5N15TvU1il6RcD/0chXcNHV2IpvNoVhGDu8vmYQBUHZKynkiR6U8d+IU
	ibP1S/u+Eol8BzTU12LLjO5o7eyXTiakzvSelRUhZN6ipAPDTuZQLUodJSMaG1hM
	AZr2CiO6rjmzBmQI6gJv/h00UVoPc3T/6xcgvUwli+FEUIdMyR3YqzLOreOjCgeS
	ySHOgyJKBFGIXbBF/jbTCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1764918589; x=
	1765004989; bh=QmdYGEfgv2myx16lov9/7CVEhKPUPcTa475udVNsp90=; b=Q
	FIYUk4GKW6+hZsyUGKFBABL+SGjlfDwcCi2KK8CJcTd7pvD8izGkR1glwxBHTCT1
	XiwesSTZKCtbcVF9r5GI6SvnoISz6U19eBVKHkFI/qe9WyjsLN6thQ9lfzUjadM9
	AcnhQGpq8QukHm9miNWv+Vcc5UvRfnkNxdh6vTfeLmJw+lDHxKZMPMeqXHLsdOgv
	rhjNnrRwNKxP71P/9CASdSt6fgWwKWOhRyknlzoImYk5jUoojqF/ODhrSZjiuMXw
	iMK7T1RNc6uREuaNLNWGydIsxVEi0V2KknlFsY5ARq/WeVu2Usju25un3aD9msKz
	8oCmktTXtW9YTsEOrnnuw==
X-ME-Sender: <xms:O4UyaSzhdeTYAey0H6Uq4o1DYjrNzb4bkRpYygbI8vFjWq3BZV9xUA>
    <xme:O4UyaZE7ncY2zhBDt3TgVkfDfvSzjHEOKtLEAUyYzVrgHm5PK2E21KjiLM41q9Moc
    f5RLpQHfLLidnPE_NBbnl5SJmvHQDN00zJdeN2qogJOW-5iSkrTUjM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdejjeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    ephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdeinecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhguse
    grrhhnuggsrdguvgdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpth
    htohepjhhovgihrdhgohhulhihsegrrhhmrdgtohhmpdhrtghpthhtohepshhuiihukhhi
    rdhpohhulhhoshgvsegrrhhmrdgtohhmpdhrtghpthhtohephigrnhhghigttggttggtse
    hgmhgrihhlrdgtohhmpdhrtghpthhtohepphhrihhmvgdriigvnhhgsehhihhsihhlihgt
    ohhnrdgtohhmpdhrtghpthhtohepfigrnhhgiihhohhuudeshhhishhilhhitghonhdrtg
    homhdprhgtphhtthhopeiguhifvghiheeshhhurgifvghirdgtohhmpdhrtghpthhtohep
    hihuiigvnhhghhhuiheshhhurgifvghirdgtohhmpdhrtghpthhtohepmhgriieskhgvrh
    hnvghlrdhorhhg
X-ME-Proxy: <xmx:O4UyafngJPLFs7fyEnjKKoQ5kwNQARDl2dUNCDymmjbbGVUZHTeZTQ>
    <xmx:O4UyafjLCZ1lSQ9io6JMAgpThae_MzCOypWnRMo9pMWjH8H4KBjj4Q>
    <xmx:O4UyaZiL-jzcbGxYsahzlDsEZcfszIjx37SbMhK2uCWV48E61Aarsw>
    <xmx:O4UyaRvz_S024JAi1xJ1LN_4x9Qe8NtIVuKfk3qEhttj5JRCBZfCLg>
    <xmx:PYUyaelGkuw6dr-5gJWBTcBd3cWpIT97vnNbKVAqbOu5yDoZtgM3Zonl>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3DDDFC40054; Fri,  5 Dec 2025 02:09:47 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ALjut8WcExBk
Date: Fri, 05 Dec 2025 08:09:18 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Zhou Wang" <wangzhou1@hisilicon.com>, "Marc Zyngier" <maz@kernel.org>
Cc: "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Oliver Upton" <oliver.upton@linux.dev>,
 "Joey Gouly" <joey.gouly@arm.com>,
 "Suzuki K Poulose" <suzuki.poulose@arm.com>,
 "Zenghui Yu" <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, "Yicong Yang" <yangyccccc@gmail.com>,
 prime.zeng@hisilicon.com, xuwei5@huawei.com
Message-Id: <007cc7c9-b466-4437-b113-cddd85599766@app.fastmail.com>
In-Reply-To: <734163cd-3692-3be2-9f2a-5364d9f5980c@hisilicon.com>
References: <20251107072127.448953-1-wangzhou1@hisilicon.com>
 <20251107072127.448953-6-wangzhou1@hisilicon.com>
 <861pm4vn02.wl-maz@kernel.org>
 <b1407660-9b69-7e21-328a-0f969fffa554@hisilicon.com>
 <c72411f9-a77e-4a72-a401-5110b919a2df@app.fastmail.com>
 <1ed610f5-3f0b-614d-5e7f-2c643238bec3@hisilicon.com>
 <113db0fb-d879-49d7-a5f2-7755558f29dd@app.fastmail.com>
 <6d6fad8d-e4e4-b973-6431-34a37003d363@hisilicon.com>
 <f641d3f2-dac9-4a9e-92a4-0805e6561418@app.fastmail.com>
 <e6cffbce-7cd4-3fe3-a9bd-935efedaebd0@hisilicon.com>
 <7d2ea8c6-e54f-4a57-843c-e0c6c33c02c5@app.fastmail.com>
 <734163cd-3692-3be2-9f2a-5364d9f5980c@hisilicon.com>
Subject: Re: [PATCH v7 5/7] arm64: Add support for FEAT_{LS64, LS64_V}
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_230953_788820_8F14201A 
X-CRM114-Status: GOOD (  18.64  )
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

On Fri, Dec 5, 2025, at 07:47, Zhou Wang wrote:
> On 2025/11/27 23:37, Arnd Bergmann wrote:
>> On Thu, Nov 27, 2025, at 04:51, Zhou Wang wrote:
>> 
>> As I understand it, using ST64B is usually more efficient than
>> ST64BV if you can use either, since it is a normal posted bus
>> transaction rather than a synchronous atomic. If that works for
>> you, I think what we should plan for is to let you use ST64B
>> on this particular hardware and never support ST64BV from
>> userspace, the same way we do it on Intel hardware with ENQCMD.
>
> I missed the email as it has been filtered into other fold, my bad :(
> I think it works fine in our system. I planned to remove whole ST64BV
> support in next version, so what you suggested is not to export
> ST64BV to userspace?

Exactly: In line with how this works on x86, we'd always use
ST64B for userspace access to dedicated workqueues, or ST64BV0
for shared hardware workqueues, while ST64BV remains reserved
for in-kernel users.

>> As there are already CPUs out there that do include ST64BV0,
>> I think we also want to support those soon. Not having to
>> support both ST64BV and ST64BV0 from userspace makes it a lot
>> easier, but I think we'd still want to only enable ST64BV0
>> on a per-task base when mapping a shared workqueued into the
>> user address space on a task that has an active mm->iommu_mm.
>> 
>> If that makes sense to you, I can try to come up with a
>> prototype based on your current patches to add the context
>> switching and enable logic.
>
> I am OK with this, even though currently we do not have a real
> hardware to test ST64BV0 related codes.

Thanks for confirming!

        Arnd

