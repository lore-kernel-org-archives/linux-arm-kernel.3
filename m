Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62616C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 10:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WCYSiAlHYmuAWqIvVZL2TaKjPyrpu3Ki0Js5DQS4y+c=; b=rAv8QU+uKM/fm37G8dsx8yAZJt
	SjbXuWZb8Zsd3lBPgqh3UdrSAazBG2oi5N/EeHIHGLpPBNRdp/RhTOtiu0YtQ4huyteKO9NIdv4mT
	a7/JAxAQ0uJQsCLngLNmdN5ywxJerBt7q0aV742lmzIM++cQ7xJ7g9YraqRwjRa0KbE4POFO2nd1o
	6/sA0B+6UFtNL/QkCC4QwAw6rug9lgqTZxUIk58wxskUDGsQy1CcxLb6/WEsrUGpD9pHw7tH5tlJz
	1B+wPPgLjH/847OMvIV8/kIo9//mEsuyV8ZxKWegpy789dfRye3JBubrm6wvFRg13SCi6j7SNvaB7
	N8Tz5qyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txkWS-0000000Ahxs-3Pfi;
	Thu, 27 Mar 2025 10:31:40 +0000
Received: from fhigh-b4-smtp.messagingengine.com ([202.12.124.155])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txkUi-0000000AhaS-2XuS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 10:29:54 +0000
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7425D25400D3;
	Thu, 27 Mar 2025 06:29:50 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Thu, 27 Mar 2025 06:29:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1743071390;
	 x=1743157790; bh=WCYSiAlHYmuAWqIvVZL2TaKjPyrpu3Ki0Js5DQS4y+c=; b=
	Z2LPBBtwgvqY916TkNWLepTOHcGJi3/GjR2ONLaHPmEIBDXGJVgG6Ok4flCMkX1A
	fXgqMl6iOTNpx8bCdTCprFF79ZhqcL+Z2ibfZyN/nZUqa1f57/EqVsqjXPBI7bNr
	gnewlMJO5unwvk03/2xr11N1G//bZfWP22M4WgaliAohJvUE4E8/p9NsfQp717BT
	CY28j+1wa7EbM4PyYxBy1BIMdp6XlgSUjsCLS6/qq+4FQnT6r8JCpH9LmdZkhPhe
	UGa/S8GbcqPN7xBm2eir1h93URnJOOvWVOYVupsWZlx+ncXoIiim/QMcv925b5zQ
	9AYuxAP7C3Tx/IonPR0IlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743071390; x=
	1743157790; bh=WCYSiAlHYmuAWqIvVZL2TaKjPyrpu3Ki0Js5DQS4y+c=; b=q
	DyZKNeEnrpXWTsRqV8cS3EEn3CFbnRcNoREdLY8gMEgzNP8+b7DLMdThv0TBO7ci
	UjGm6K5bkdw5Ib8fYPnc02muoglW+89rGGXb4J9OWM8duk8a4J8yyNFM7BOVe30A
	Md064ZkvWKAd0thNBap7O7PJdoGNVU2GUYUSu2T8eT/LxZCvcS9v2gHZDkWN8W1K
	EQGrQtVr0X9KYDUXbLvxHaSI7aNaVYB4sfWUO0kU9F0pu6gYJj8SkSMVckHRrJ0N
	s38b4sEw9u9xYnDYqz8fziRFu4yrLuEoUPqiM9GKnPLumF2LgwXq3DcV0dKooN+e
	LAtzjQi0m/0s8r6FjxWeg==
X-ME-Sender: <xms:nSjlZ6Ntn3ZrEP__L_P38ib6QYxJPiPheSUGqKUdHVCsJ13H3sa9Vg>
    <xme:nSjlZ488nHLynJXkGSzu5noU8FbL-AErNr4d-CoAY4Y0qXm6sGI9wNxQOaFnLRM6r
    i_90HDBNUo0ix7qcMw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieekudejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    udejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtrghtrghlihhnrdhmrghrih
    hnrghssegrrhhmrdgtohhmpdhrtghpthhtohepkhgrjhgvthgrnhdrphhutghhrghlshhk
    ihesrghrmhdrtghomhdprhgtphhtthhopegtihigqdhkvghrnhgvlhdquhhpshhtrhgvrg
    hmsegtihigthgvtghhrdgtohhmpdhrtghpthhtohepfhhughgrnhhgrdguuhgrnhestghi
    gihtvggthhdrtghomhdprhgtphhtthhopehpvghtvghrrdgthhgvnhestghigihtvggthh
    drtghomhdprhgtphhtthhopehmrghrtghinhesjhhushiikhhivgifihgtiidrtghomhdr
    phhlpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikheskhgv
    rhhnvghlrdhorhhg
X-ME-Proxy: <xmx:nSjlZxSbIviS_Apya2mpp532w2c02lRAbr-qj_JHqxC14OUGrIi2ag>
    <xmx:nSjlZ6trY1HGlLIW7Yyb-Ynb8su7b6kjvnDwiiLjubZPf7WBa_gRRQ>
    <xmx:nSjlZyc--MHa5Si5SUQnXPJDhJ4brXful4daztRkuv1ppZVdsyBw6Q>
    <xmx:nSjlZ-0cZD3fZ5QAEUs4juFCcv4UNAcgDEfq52dQTbBC3yg5K3I-Vg>
    <xmx:nijlZ1vSr25BqfA7nB64LzY0gceua2vzYocA9yM9nl1JrS9yAvj4Dbso>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CE7BE2220073; Thu, 27 Mar 2025 06:29:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T24bcb56938053d3a
Date: Thu, 27 Mar 2025 11:29:19 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Peter Chen" <peter.chen@cixtech.com>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Marc Zyngier" <maz@kernel.org>,
 soc@kernel.org, "Rob Herring" <robh@kernel.org>, krzk+dt@kernel.org,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
 marcin@juszkiewicz.com.pl, kajetan.puchalski@arm.com,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Fugang . duan" <fugang.duan@cixtech.com>
Message-Id: <faa1d8e7-e882-40ea-b64d-2e139121bc38@app.fastmail.com>
In-Reply-To: <Z-Ua7MK-Kv033uDu@nchen-desktop>
References: <20250324062420.360289-1-peter.chen@cixtech.com>
 <20250324062420.360289-6-peter.chen@cixtech.com>
 <865xjxmlgl.wl-maz@kernel.org> <Z-Nz0DU441Wwj1i4@nchen-desktop>
 <861pukm9yd.wl-maz@kernel.org> <Z-Tz1moMNozx23k6@nchen-desktop>
 <e43b1a00-b221-413b-a36a-3a65e17f800f@kernel.org>
 <422deb4d-db29-48c1-b0c9-7915951df500@app.fastmail.com>
 <Z-Ua7MK-Kv033uDu@nchen-desktop>
Subject: Re: [PATCH v5 5/6] arm64: dts: cix: add initial CIX P1(SKY1) dts support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_032953_179795_BF588774 
X-CRM114-Status: GOOD (  14.44  )
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

On Thu, Mar 27, 2025, at 10:31, Peter Chen wrote:
> On 25-03-27 09:18:42, Arnd Bergmann wrote:
>> Agreed. The usual arrangement for a new SoC family is to have
>> the minimum set of drivers (uart, clk, pinctrl, regulator,
>> iommu, irqchip) along with the DT bindings and the dts files
>> in one branch and have that go through the SoC tree as part of
>> the soc/newsoc branch. It sounds like in this case we only need
>> uart and a mailbox since the rest are shared with existing
>> firmware based drivers, so this isn't even the worst case
>> but still requires some coordination between subsystem maintainers
>> to ensure that all patches have been properly reviewed before
>> I merge them.
>
> So, in this case, we should add mailbox driver support in this
> series, and once the mailbox maintainer has reviewed mailbox
> driver, all the patches could go your tree?

Yes, exactly. Just make sure you describe this in the submission
for the mailbox driver to make sure everyone understands the
plan. I don't think we've had a mailbox driver as the critical
path for a new platform before, so they would usually go through
the mailbox subsystem tree.

     Arnd

