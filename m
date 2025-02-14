Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CBDC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 08:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H6Gp9DB5WCSEcuQCJqQrEsWpuCn5jqk72qwNA/OoRvo=; b=a6r8enVD2a7+pMpTaaTGhEyCzH
	GBXxVOlVDssyZcyISvjpBWRXem2t6mmoox8Kmb0JV9MBRtdZpx4qiiSd1+UM3Af36PSSowKdEWt/P
	WWX//UQBWn6pTdR1B8a6bem30EVwLvzZRB8n2dEVdZZqYPjgWtiBgFOhSQ6iN0FNUFc1VlHC8koHI
	sNBJvcXH1ySsF07SiKfazW9kq5pNnnk5x96mDkHOzJxDdrdA1sZ9LbNKsBtGRNUM7nrr4qSKjI8Lg
	P24mnC1X1uzM32yVHMDdT9hzCED4pC1K2bsofux4tPg4nbwcu7oS7jSW/7YrSIvHWIHos837QI0Ye
	SUv3j+og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiqn3-0000000E427-1k6z;
	Fri, 14 Feb 2025 08:11:13 +0000
Received: from fhigh-b8-smtp.messagingengine.com ([202.12.124.159])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiqiF-0000000E3M5-2Tm7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 08:06:17 +0000
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 20CBE2540178;
	Fri, 14 Feb 2025 03:06:13 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-11.internal (MEProxy); Fri, 14 Feb 2025 03:06:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1739520372;
	 x=1739606772; bh=H6Gp9DB5WCSEcuQCJqQrEsWpuCn5jqk72qwNA/OoRvo=; b=
	THxQzU9iQfDw3CE2kEloob98WRdDJsA4gxfya+6oLzgcMF2JDy87H5cRz9zjwARo
	WY5qC2W+FBP4JVx8rV0XhIDqg6oFweRIiWgPsyPbEQbEByuXyalL8kLP5TBb6/ud
	NrBct4aYr2L1sIIHUdSkYYO1tvEnitpqKvjiHEzKYaqK0F8iupKn2EiV7RPCvxZM
	bsX8gU5MdR+jfgYN2ILFS/W2LFqVM+OBIKojS62zv/4RBuDHcm1QB9NDPWvt7mu/
	j+4kuJP/CPDx3ndOvEJKB/K/7i9WvyFnEQYjkXBBUCF6uJLT4zbJPJR+2hY2PE0a
	2oYi+vsDQFwAbKUSUL05Eg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739520372; x=
	1739606772; bh=H6Gp9DB5WCSEcuQCJqQrEsWpuCn5jqk72qwNA/OoRvo=; b=v
	EKJI7qqv8tayGGKpzZBvYNDtRiipJJkcNGcKSP+EhQ8wsdY6ty7uUU6Qt1i1bETK
	BcI8jB7a8WASkkqZ6jNqNelEzr41mhxXqpFa8z8yctr7LSEq93T8SuMve8vwZ+Ac
	IDBGUOA2d66MqAAcZugQZGWvl+XhW3spqQUwReM8hqwJ+6Vm4v4Zaet/EAiz9Yiv
	cytTwPN5JubeangvEE7VADU/MGof0L1H2U9GOXytP2/rqaxDOzvjvyLAyWgvZJ1d
	wVnCAH4q3vPy3wFsshMhUCAjItMy2sU60bXTbH4W35t/EQDGQA5HxuAnx/ns+ZxD
	pVfjGssMtwk9K0WoHhNpw==
X-ME-Sender: <xms:c_muZwX48Lh_xZs2IU6bDL1rdB8LT6oqGgZpRonlo5sen0HwCImyrg>
    <xme:c_muZ0k0AICaX-vC6XxNAIoV9pAWxQHAk2o5A5KRC8GL6hhilhZHSDgbk4Wv1nc_h
    WwZzXS2D0O38pPVky0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegleduvdcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:c_muZ0YxvCcRRznY5PEZ-WHP6YYtLBt-g5JzyS9xw7eTUTGJhFFLZA>
    <xmx:c_muZ_VK0WT4H887Nvd27xHDQFNSj_V4PN6uNmtAA-vcr1KKc8zk5Q>
    <xmx:c_muZ6nMlMLgiBiw9alU1wkGeocCf93h0y1G4R7Re8HKnpAIzgPaxQ>
    <xmx:c_muZ0eW7UPUpepsHE6P-gBngPmgv84dTpielAQWIbSQ-6F_CWdLRg>
    <xmx:dPmuZ6uhMhdzt-6CWdxmXjq8IYXRxbmmHE-3PCv20PutEwrLhkeSiX2S>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C5C902220072; Fri, 14 Feb 2025 03:06:11 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 14 Feb 2025 09:05:50 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Roman Kisel" <romank@linux.microsoft.com>, bhelgaas@google.com,
 "Borislav Petkov" <bp@alien8.de>,
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
Cc: benhill@microsoft.com, bperkins@microsoft.com, sunilmut@microsoft.com
Message-Id: <97887849-faa8-429b-862b-daf6faf89481@app.fastmail.com>
In-Reply-To: <593c22ca-6544-423d-84ee-7a06c6b8b5b9@linux.microsoft.com>
References: <20250212014321.1108840-1-romank@linux.microsoft.com>
 <20250212014321.1108840-2-romank@linux.microsoft.com>
 <1b14e3de-4d3e-420c-819c-31ffb2d448bd@app.fastmail.com>
 <593c22ca-6544-423d-84ee-7a06c6b8b5b9@linux.microsoft.com>
Subject: Re: [PATCH hyperv-next v4 1/6] arm64: hyperv: Use SMCCC to detect hypervisor
 presence
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_000616_495573_A14EF807 
X-CRM114-Status: GOOD (  17.65  )
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

On Fri, Feb 14, 2025, at 00:23, Roman Kisel wrote:
> On 2/11/2025 10:54 PM, Arnd Bergmann wrote:

> index a74600d9f2d7..86f75f44895f 100644
> --- a/drivers/firmware/smccc/smccc.c
> +++ b/drivers/firmware/smccc/smccc.c
> @@ -67,6 +67,30 @@ s32 arm_smccc_get_soc_id_revision(void)
>   }
>   EXPORT_SYMBOL_GPL(arm_smccc_get_soc_id_revision);
>
> +bool arm_smccc_hyp_present(const uuid_t *hyp_uuid)

The interface looks good to me.

> +{
> +	struct arm_smccc_res res = {};
> +	struct {
> +		u32 dwords[4]
> +	} __packed res_uuid;

The structure definition here looks odd because of the
unexplained __packed attribute and the nonstandard byteorder.

The normal uuid_t is defined as an array of 16 bytes,
so if you try to represent it in 32-bit words you need to
decide between __le32 and __be32 representation.

> +	if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_HVC)
> +		return false;
> +	arm_smccc_1_1_hvc(ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID, &res);
> +	if (res.a0 == SMCCC_RET_NOT_SUPPORTED)
> +		return false;
> +
> +	res_uuid.dwords[0] = res.a0;
> +	res_uuid.dwords[1] = res.a1;
> +	res_uuid.dwords[2] = res.a2;
> +	res_uuid.dwords[3] = res.a3;
> +
> +	return uuid_equal((uuid_t *)&res_uuid, hyp_uuid);

The SMCCC standard defines the four words to be little-endian,
so in order to compare them against a uuid byte array, you'd
need to declare the array as __le32 and swap the result
members with cpu_to_le32().

Alternatively you could pass the four u32 values into the
function in place of the uuid.

Since the callers have the same endianess confusion, your
implementation ends up working correctly even on big-endian,
but I find it harder to follow when you call uuid_equal() on
something that is not the actual uuid_t value.

> +
> +#define ARM_SMCCC_HYP_PRESENT(HYP) 								\
> +	({															\
> +		const u32 uuid_as_dwords[4] = {							\
> +			ARM_SMCCC_VENDOR_HYP_UID_ ## HYP ## _REG_0,			\
> +			ARM_SMCCC_VENDOR_HYP_UID_ ## HYP ## _REG_1,			\

I don't think using a macro is helpful here, it just makes
it impossible to grep for ARM_SMCCC_VENDOR_HYP_UID_* values when
reading the source.

I would suggest moving the UUID values into a variable next
to the caller like

#define ARM_SMCCC_VENDOR_HYP_UID_KVM \
    UUID_INIT(0x28b46fb6, 0x2ec5, 0x11e9, 0xa9, 0xca, 0x4b, 0x56, 0x4d, 0x00, 0x3a, 0x74)

and then just pass that into arm_smccc_hyp_present(). (please
double-check the endianess of the definition here, I probably
got it wrong myself).

     Arnd

