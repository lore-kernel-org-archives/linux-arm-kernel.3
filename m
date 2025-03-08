Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 985F1C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 21:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6cJwbVoDRAeuF6ka+Poa5zkvDE5zFIAQzAGXRQkSJc=; b=AR4zjjVVxFLV0tzxKpKXIYdxpA
	REXiHLWPqXbPAdIhepgclPnttvMnv6EsnHtLDFXQ0LUAXTFWhXJzmrMDMqBLHXyDr1uJpYLVmQH6J
	zdDq59M5j7/6R91hGDBVYDtN7rwlxn9hxDmJ0bWyKemun/bkoksyogutQ4MI+LDxBdLnaXL4hE5AE
	t0gVgc0CiJX5yK+MLcijdpP76mLGVW38jPJ7TWzJDywI13/qw0HsF0k64eY4XvbkyM6gpSnhLiXd/
	jj5rMZxkzLa6t9tuClK8sz5XAmctm2elwafcmFcKWteVU4joF4289/wRBf7WP31y1m1V30MfG49gz
	tGoRO+Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tr1UF-0000000HC5M-1ZM0;
	Sat, 08 Mar 2025 21:13:35 +0000
Received: from flow-a6-smtp.messagingengine.com ([103.168.172.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tr1Sd-0000000HBql-0gkS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 21:11:56 +0000
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailflow.phl.internal (Postfix) with ESMTP id 5993620160A;
	Sat,  8 Mar 2025 16:11:54 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Sat, 08 Mar 2025 16:11:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1741468314;
	 x=1741475514; bh=C6cJwbVoDRAeuF6ka+Poa5zkvDE5zFIAQzAGXRQkSJc=; b=
	LMSLDj/6zCFJ3UvyQ1/MypoE1FqzZAjNGpopT2+pL1QmJaKkUV1WihocrQswxNKX
	zDJO8+UYV/7e2VYvlPckk22mlFoRrOfywd3NTpdgmgp3yf5ilBeS7s21bqLOD9N3
	z8mnx/ufAe1MCtibKBNzXU3AvqsAgQFWLNZOEyWEKCdS8fcvfXBLhNptNCOZTbiy
	wlD0hctNLDfawhtRater4q3VUgxv0ROg4aw1mQIUJrjR/XgolGWLcyVCVFPKETNo
	DBkEnpDwJ7oG9Oa/gHEzeVI5d8k6EO3M8oMj9UxIlH/8REhmUxj8hk2EAJpPZp5l
	RhhPUesHZshdO/EYMV8EWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1741468314; x=
	1741475514; bh=C6cJwbVoDRAeuF6ka+Poa5zkvDE5zFIAQzAGXRQkSJc=; b=j
	VdHKRZuf3U4fb9uunzGPvL6CNmqhjPYTe3rsKqtNKhaY/pZrp2IINPNJY2JWuXZd
	RY33BATElzY53tfeQxSBqLuTqbpJLnWv5wbK4rVeRDL2HUp6G+xE/MnoH24Q4she
	Zw0xya7sNy+jy6xa23YkFrJIsewKyZBbM3oBg/sVYzVbSE7jucsBibWRVn8HVC9B
	6ncXJ7c/BSSn5NFlw7sn4dwhZ2KZKrDp5xBFbLvYp9676I8hKrUapubErrnML8Eu
	MHXEkU/mAZ+wflm9hMCWuppvIcWS53HsHXjuw99qvf2QyEr8Tbk2JmNRd6xt1Nj+
	hp2dFCv/g0gkhZrCq7VHA==
X-ME-Sender: <xms:mbLMZ596wPb40_JXIyPtfloWsKkqrCL8QDEm8QgWDvunyGq4pGVH9w>
    <xme:mbLMZ9srqTK0BZFWCgSX-KfGSfBS4jByBYE1PxpJSKF8z3zNBeVNfOE6Li8LAWsyN
    mt5f5VASQmltaFYOjE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudegheelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    gedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsphesrghlihgvnhekrdguvg
    dprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghp
    thhtohepjhhovgihrdhgohhulhihsegrrhhmrdgtohhmpdhrtghpthhtohepmhgrrhhkrd
    hruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtghpthhtohepshhuuggvvghprdhhohhllhgr
    segrrhhmrdgtohhmpdhrtghpthhtohepshhuiihukhhirdhpohhulhhoshgvsegrrhhmrd
    gtohhmpdhrtghpthhtohepsghhvghlghgrrghssehgohhoghhlvgdrtghomhdprhgtphht
    thhopeihuhiivghnghhhuhhisehhuhgrfigvihdrtghomhdprhgtphhtthhopegtohhnoh
    hrodgutheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:mbLMZ3DGst5K0ncB2CMgLSb0fFckv9GtAIwLMQFO9xM_fVSk6CPhoQ>
    <xmx:mbLMZ9eJisR2lNOiGIPKNcjrOHGDl2yZroJ90LxetiT4_8C6ww40aA>
    <xmx:mbLMZ-OeS-fHGEYgpwJpark3S_3tUdUzYdgXahPvkpqbMH8mPMmfbA>
    <xmx:mbLMZ_k0HUBm-OqkJPuCwRYt895o1R20ovOBLNSpi-Sk8TXTbjUGww>
    <xmx:mrLMZ2VW74UQPiuOOyAuXJ1EzqtujuTLZeYILoa5kZL7Oq9jb1T0XPOr>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id EE4422220072; Sat,  8 Mar 2025 16:11:52 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Sat, 08 Mar 2025 22:11:32 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Roman Kisel" <romank@linux.microsoft.com>, bhelgaas@google.com,
 "Borislav Petkov" <bp@alien8.de>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Dexuan Cui" <decui@microsoft.com>,
 "Haiyang Zhang" <haiyangz@microsoft.com>,
 "H. Peter Anvin" <hpa@zytor.com>, "Joey Gouly" <joey.gouly@arm.com>,
 krzk+dt@kernel.org, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, "Len Brown" <lenb@kernel.org>,
 "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org>,
 "Mark Rutland" <mark.rutland@arm.com>, "Marc Zyngier" <maz@kernel.org>,
 "Ingo Molnar" <mingo@redhat.com>,
 "Oliver Upton" <oliver.upton@linux.dev>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 "Rob Herring" <robh@kernel.org>, ssengar@linux.microsoft.com,
 "Sudeep Holla" <sudeep.holla@arm.com>,
 "Suzuki K Poulose" <suzuki.poulose@arm.com>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Wei Liu" <wei.liu@kernel.org>,
 "Will Deacon" <will@kernel.org>, "Zenghui Yu" <yuzenghui@huawei.com>,
 devicetree@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-acpi@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, x86@kernel.org
Cc: apais@microsoft.com, benhill@microsoft.com, bperkins@microsoft.com,
 sunilmut@microsoft.com
Message-Id: <29bb5b7a-b31f-4b32-92c6-e2588a0f965a@app.fastmail.com>
In-Reply-To: <20250307220304.247725-9-romank@linux.microsoft.com>
References: <20250307220304.247725-1-romank@linux.microsoft.com>
 <20250307220304.247725-9-romank@linux.microsoft.com>
Subject: Re: [PATCH hyperv-next v5 08/11] Drivers: hv: vmbus: Get the IRQ number from
 DeviceTree
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_131155_282538_820A9A0B 
X-CRM114-Status: UNSURE (   6.81  )
X-CRM114-Notice: Please train this message.
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

On Fri, Mar 7, 2025, at 23:03, Roman Kisel wrote:
> 
> +static int __maybe_unused vmbus_set_irq(struct platform_device *pdev)

Instead of the __maybe_unused annotation here

> 
> +#ifndef HYPERVISOR_CALLBACK_VECTOR
> +	ret = vmbus_set_irq(pdev);
> +	if (ret)
> +		return ret;
> +#endif
> +

you can use 

       if (!__is_defined(HYPERVISOR_CALLBACK_VECTOR))
                  ret = vmbus_set_irq(pdev);

and make it a little more readable.

    Arnd

