Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93CC6CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 09:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sT1vNBwVROLZPKVddoZIohPPUecTNY2R/P13dlzJXbI=; b=KYj34AFDIGSXfkF6ogilpVuMkw
	6FCmLRK4iRsethDgibMbjihIA/KGLWcNkWW6Obn31iCZYNjt0012VqltkqiU2M6DbgOTTxh8ybkO/
	MNjMLzj5JmcS1KLQJqPhvx+Cy1+asEQfJQrZOtqUDGUNEzjyBXA726/QAEa/QNPb1HeGH+s8X4wRZ
	xvZ7MTKoudEAnBdksbPpr+XRo48j5nGBPEzZdVu1dhZxm+PTtcmqc4d1NjO//F3L4dXNrNdAwxEff
	7GN4HCm+lN8K7lNBGqJB6mK/Gi5mxAYL84/2oq+lLfbcFgIJHOGhx/zkb8qgMRVq4a/xa4+P6dJfW
	SBiX2G5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvlb-0000000FogF-3tcP;
	Mon, 17 Nov 2025 09:43:23 +0000
Received: from fhigh-a2-smtp.messagingengine.com ([103.168.172.153])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvlZ-0000000Fofu-1S3U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 09:43:22 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id AB8FA14001D3;
	Mon, 17 Nov 2025 04:43:19 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 17 Nov 2025 04:43:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1763372599;
	 x=1763458999; bh=sT1vNBwVROLZPKVddoZIohPPUecTNY2R/P13dlzJXbI=; b=
	T0EkJgKCLIMPF806+hzXmRAcbNfdJCAILARWg4EZM3zfUKfFxdOLqpcgIcwiXOfO
	erQot5VlD2cux2/ErnW+Iv1l0l7wCQyqGQS5kuIvo4T6Gm4bUGlrsoKqk47Uotca
	E9nDWWD1KIQlF0KHgJRTA6ZWwgQBf9Q51OpxtbrPKnx94NIW/33yT58y+KTZSWrC
	K86nm98bpfBAuhFBlmr716VG14/0oVuZZkwCGPQw498/7shNMjSYpRQ7hLF7N66R
	BMBQoCOkLCd+kUYVWgYf8vmw0KMI/Cjztmjq5RpMDbQGVpXIezXjCCIRvQIpuHhL
	mQmxwOPFQqhc8FeahVF+tw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1763372599; x=
	1763458999; bh=sT1vNBwVROLZPKVddoZIohPPUecTNY2R/P13dlzJXbI=; b=q
	YUEP6bxzDTn7NmjJyBFJumNssyRd1QtWpfl+IGOcEttrH4b3TnZgECNvRF1zW2px
	FfeSi1D821IA9dGrt0mbg0zD+CjogPIihHYkM3iOi5mBVLPE7RaouVzTy7MjHe1Y
	HOnCupfVSPg1PmJdfOySY2CuUirqIwIginvXWiDJOtarpDXGWhmEE+5+HCR+iXfL
	Cwkd5htyewgMzRGwOMgGzMhdqEt6l0uCHqN90bf8/3xFEhref5atI5k8xaN2vcc+
	ex1x1Isd+J/HM36HkJoj75Cq6WRlvmzwSSv8fn5I3pupiWBcUGHkhhGiDbRwbhy6
	AWwfsDNDO0/aCtXlxMbuw==
X-ME-Sender: <xms:N-4aac2RFyGLnUqijeqQVvomJGuo2PxuLYBAqt0uglJeLGzaAuYzaw>
    <xme:N-4aaR4Wkk4LEKkpbrgFkPuY7RXosBHwr6SIRFQ1Y4FRNe_mRDo2CILmNGPDlH9eM
    JgPMTQwgWtIocecGg5aJj77D02aDMuLaq5sfcIoLvulH3wSHjNV1Ds>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvudekudefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegshhgvlhhgrggrshesghhoohhglhgvrdgtohhmpdhrtghpthhtoh
    epkhhishhhohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkfihilhgtiiihnhhs
    khhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlphhivghrrghlihhsiheskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepmhgrnhhisehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmh
    dqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohep
    uhhnihgtohhrnhgpfigrnhhgsehouhhtlhhoohhkrdgtohhmpdhrtghpthhtohepshdqvh
    gruggrphgrlhhlihesthhirdgtohhm
X-ME-Proxy: <xmx:N-4aaRyxh3Q8AJLSnX6F5evD92we4PcMxwOS-dT1AmzJTQqO4UacmA>
    <xmx:N-4aaWfYNUUD9IFnF7hWPzYPR00X20e1hiEmn-Z4V-wRVLRicp8vXg>
    <xmx:N-4aaes1uMi8oAZ3-VSieEl5QqNgqZnZIMPKuAs6SYRRxv6QTri8kQ>
    <xmx:N-4aaTBWohPtb6UOlfDQzdIsxUIZXQlJTbrVRf42yzQ-N57mnU6W3A>
    <xmx:N-4aaRep-p8ziAyI6weD5d5bkRxM78vHFBwKvGArWFGK7Qz1G5IzeFM2>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 76DBE700063; Mon, 17 Nov 2025 04:43:19 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AO4N9SNPwumV
Date: Mon, 17 Nov 2025 10:42:58 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Siddharth Vadapalli" <s-vadapalli@ti.com>
Cc: "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 "Manivannan Sadhasivam" <mani@kernel.org>, "Rob Herring" <robh@kernel.org>,
 bhelgaas@google.com, "Chen Wang" <unicorn_wang@outlook.com>,
 "Kishon Vijay Abraham I" <kishon@kernel.org>, stable@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com
Message-Id: <477b851b-56b1-497a-812a-eb0c9bfdc4d8@app.fastmail.com>
In-Reply-To: <8ac2ed36a85f854a54ee1d05599891632087869d.camel@ti.com>
References: <20251113092721.3757387-1-s-vadapalli@ti.com>
 <084b804f-2999-4f8d-8372-43cfbf0c0d28@app.fastmail.com>
 <250d2b94d5785e70530200e00c1f0f46fde4311b.camel@ti.com>
 <201b9ad1-3ebd-4992-acdd-925d2e357d22@app.fastmail.com>
 <7eaa4d917f7639913838abd4fd64ae8fe73a8cfc.camel@ti.com>
 <37f6f8ce-12b2-44ee-a94c-f21b29c98821@app.fastmail.com>
 <8ac2ed36a85f854a54ee1d05599891632087869d.camel@ti.com>
Subject: Re: [PATCH] PCI: cadence: Kconfig: change PCIE_CADENCE configs from tristate
 to bool
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_014321_458677_05AB81BC 
X-CRM114-Status: GOOD (  17.34  )
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

On Mon, Nov 17, 2025, at 10:23, Siddharth Vadapalli wrote:
> On Mon, 2025-11-17 at 10:06 +0100, Arnd Bergmann wrote:
>> On Mon, Nov 17, 2025, at 07:05, Siddharth Vadapalli wrote:
>> 
>> but you may want to split it up further to get better dead
>> code elimination and prevent similar bugs from reappearing when
>> another call gets added without this type of check.
>> 
>> If you split j721e_pcie_driver into a host and an ep driver
>> structure with their own probe/remove callbacks, you can
>> move the IS_ENABLED() check all the way into module_init()
>> function.
>
> Thank you for the suggestion :)
>
> Would it work if I send a quick fix for `cdns_pcie_host_disable` using
> IS_ENABLED in the existing driver implementation and then send the
> refactoring series later? This is to resolve the build error quickly until
> the refactoring series is ready.
>
> On the other hand, if it should be fixed the right way by refactoring, I
> will not post the temporary fix. Please let me know.

Please see if my suggestion works in practice using all the
combinations of build options, I may have missed something.
If it fixes all the build failures, merging and backporting
this first makes sense.

     Arnd

