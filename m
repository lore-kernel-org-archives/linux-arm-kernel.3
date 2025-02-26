Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C1F8C021BF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 14:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tZXytPiubmxqPIS8uOUahYJafTAcorBGJm/Sc4uY4DM=; b=uGIzhkOnbVZGjf0wog1lH6HlUD
	BMIpE2KTymDxQ9HRxwOth92JVV3WljfxOGtSNCnT+WQfvOUVqprsxcnLYobaXHF18EHGabf80Wcdx
	a40O32Fzxxqk5h6vyUCVvrhQjUrzOrV8ljnKVBxTmWWlfghSojziX0GrCl6L2bb+zS7f9ksqz+Q5A
	4un2pAS7R8SLQJ+QFzvKDDdBP8yZWZsxOPjWTid1QEJma9qC+G2cTz2mytdzstYbbpAG/522qFju6
	vCaOfxUNGm9RBvD2kR4Mml+2AE54RJiU90MIdg92FTP10gWNTdSyJ3MPRlFHUS098C8GiwyNjRyQ2
	OwzBDcdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHxH-00000003zmk-3Z0H;
	Wed, 26 Feb 2025 14:00:07 +0000
Received: from fout-b5-smtp.messagingengine.com ([202.12.124.148])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHv1-00000003zJX-3NS1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 13:57:49 +0000
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id 7B639114014E;
	Wed, 26 Feb 2025 08:57:45 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-11.internal (MEProxy); Wed, 26 Feb 2025 08:57:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1740578265;
	 x=1740664665; bh=tZXytPiubmxqPIS8uOUahYJafTAcorBGJm/Sc4uY4DM=; b=
	bPuQKdaamYG6X7c/5heRAnYVR/n2WZ7jUfo+l69evzOhlDVujNWHITYgXwsS56jd
	9c8wjcoZUFFXkRbqFKjzCqNn1zL17DGGMfg/RClEJh/UIm6zW921ozhV3LSrvWNS
	Fk8EYeB2URFSgX268hc24t7BHJhh6K/JylEbZvuDw4pF4uijwomW2pVmVaUSq3ve
	V/KPZgKTg0ntp0L0NIwKqlaJDDY3rCbfQXSM6ZtELPhF5zdAI5vTq97TA+F0lzI+
	eIkxHEVeMP80AQdMfvnj/6U9x46wFxawG4fEs2h2t9bCNetTIB/ZBcfcgA3JvlGZ
	QbgbW4TF89dMP2t6T0hQKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740578265; x=
	1740664665; bh=tZXytPiubmxqPIS8uOUahYJafTAcorBGJm/Sc4uY4DM=; b=2
	p6aK+clTQqinvRokGkoHOeAee7Ch/BcjiIgvYptz7ndme10+I7qdFx71/QpqYB+l
	dkOjvzxZYJCrhg3PJ7+4OiqfD2YQjARnjHim9UBKXfNnHCLVwHDU4+01vy//Bqp8
	LweavQ6jEHFaJCfKQ3Lg/fNuo/b/sdF4xwADT77nY7R5UefknIRwPHytDnqXEiDU
	EYABC2C/u/uGN5NKiGWWm+gvQdSjugqYEhyMcoL0ix2c3S8bVZcc2y8hU5/8O4i1
	2U5vpXZu7jOdSfCm5nh6F7Xj3McUMNpfsHAvKu+x4D7eqkbYDzWEZQ4fe2J+2FoU
	iZ/GaS+SGDehHCOSTSnNg==
X-ME-Sender: <xms:2B2_Z1NcLAU-ocoX2xOcC9doPyQMM3SzO-PZ0i4O0har6bE_x4wHmw>
    <xme:2B2_Z3_9T20zc6f9v3gcS7Kty6-a1TxmrFM2q37e5uXIA_Hx9r09_Mm7BRyDhvqi_
    _nJ-mxRoMsDEyt1_AE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekgeejiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
    gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeef
    tddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsghpsegrlhhivghnkedruggvpd
    hrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphht
    thhopegshhgvlhhgrggrshesghhoohhglhgvrdgtohhmpdhrtghpthhtoheptghonhhorh
    doughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehlphhivghrrghlihhsiheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghirdhl
    ihhusehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:2B2_Z0RhQzPCtPcX6rnHEdjOg46NTqG6e_kTNaFU-IVZMBqB6pFrcA>
    <xmx:2B2_ZxvupkTidtC7S2F9HnrLl5IlU8tGgVOtQPtM1TAcmjBJMC2VfQ>
    <xmx:2B2_Z9dnJ1xpQw-EStIG715rto0DeXe3SvYUODF7_HQNMR3EWyhxwQ>
    <xmx:2B2_Z938LFEianfpCf7BbxOUaqE57XrdfvncdzqRzXROWA9LXO4Ixg>
    <xmx:2R2_ZzHMsUfh9E43ZZvmvsw-qTD_hFBFCxx1blsqPSVrLbygxzPLoM2e>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A74052220072; Wed, 26 Feb 2025 08:57:44 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 26 Feb 2025 14:57:24 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Roman Kisel" <romank@linux.microsoft.com>
Cc: benhill@microsoft.com, bperkins@microsoft.com, sunilmut@microsoft.com,
 bhelgaas@google.com, "Borislav Petkov" <bp@alien8.de>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Dexuan Cui" <decui@microsoft.com>,
 "Haiyang Zhang" <haiyangz@microsoft.com>,
 "H. Peter Anvin" <hpa@zytor.com>, krzk+dt@kernel.org,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org>,
 "Ingo Molnar" <mingo@redhat.com>, "Rob Herring" <robh@kernel.org>,
 ssengar@linux.microsoft.com, "Thomas Gleixner" <tglx@linutronix.de>,
 "Wei Liu" <wei.liu@kernel.org>, "Will Deacon" <will@kernel.org>,
 devicetree@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, x86@kernel.org
Message-Id: <fe0221bb-b309-4e4b-a098-f6a246ac1f60@app.fastmail.com>
In-Reply-To: <a96f9469-a22e-43e7-825d-f67ef550898f@linux.microsoft.com>
References: <20250212014321.1108840-1-romank@linux.microsoft.com>
 <20250212014321.1108840-2-romank@linux.microsoft.com>
 <1b14e3de-4d3e-420c-819c-31ffb2d448bd@app.fastmail.com>
 <593c22ca-6544-423d-84ee-7a06c6b8b5b9@linux.microsoft.com>
 <97887849-faa8-429b-862b-daf6faf89481@app.fastmail.com>
 <6e4685fe-68e9-43bd-96c5-b871edb1b971@linux.microsoft.com>
 <14a199d8-1cf3-49bc-8e0d-92d9c8407b4f@linux.microsoft.com>
 <55b65ba6-4abe-478c-a173-4622c30ddd7b@app.fastmail.com>
 <a96f9469-a22e-43e7-825d-f67ef550898f@linux.microsoft.com>
Subject: Re: [PATCH hyperv-next v4 1/6] arm64: hyperv: Use SMCCC to detect hypervisor
 presence
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_055747_903126_ADD0D202 
X-CRM114-Status: GOOD (  12.61  )
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

On Tue, Feb 25, 2025, at 23:25, Roman Kisel wrote:
> On 2/24/2025 11:24 PM, Arnd Bergmann wrote:
>> On Tue, Feb 25, 2025, at 00:22, Roman Kisel wrote:
>>> Hi Arnd,
>>
>> If you want to declare a uuid here, I think you should remove the
>> ARM_SMCCC_VENDOR_HYP_UID_HYPERV_REG_{0,1,2,3} macros and just
>> have UUID in normal UUID_INIT() notation as we do for
>> other UUIDs.
>
> I'd gladly stick to that provided I have your support of touching
> KVM's code! As the SMCCC document states, there shall be an UUID,
> and in the kernel, there would be
>
> #define ARM_SMCCC_VENDOR_KVM_UID UUID_INIT(.......)
> #define ARM_SMCCC_VENDOR_HYP_UID UUID_INIT(.......)
>
> Hence, the ARM_SMCCC_VENDOR_HYP_UID_*_REG_{0,1,2,3} can be removed as
> you're suggesting.

Yes, I think that's the best way forward, as it improves
the existing KVM code and all future functions like it.

    Arnd

