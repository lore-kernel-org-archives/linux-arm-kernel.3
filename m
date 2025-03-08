Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40FA2C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 21:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+KV9tKviVmM2X3+Wn2rrN1rFxZjkLzC9PykDJ3S5x8=; b=TBLUB0DPCw7SnSr8Vk3nDoK+zX
	GmZF9AsTVgQtx6Pg63zD1cxkVohjHy5lL4hMTLk+QpXPUfOgZWfU0W5NPwzmnDQDk0CEzU5+jtUTp
	S+S+bkYPAPEfFBPFtvcYQ7Htvu4yNH1XZzZx5hpdvcQHQZt6xgSXlzVgyzLnaI+flJ8DzIk9dowfx
	bOY9WxfYkMNA0oxegW1QQUbsIqYW7gUN9UG6MqwyreOLiI0lpaG8yqW6scDBsuT+cymtM8NO3hqKL
	OGymwU/PVNm4PCL0KfVNlfcFoSDTsgvSpIbCkQqvOhHm8Yga03Sgm/o+0QAD8ojVavjveMuufjvLf
	pCNm2e3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tr1RS-0000000HBli-2L26;
	Sat, 08 Mar 2025 21:10:42 +0000
Received: from flow-a6-smtp.messagingengine.com ([103.168.172.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tr1Po-0000000HBes-3sMU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 21:09:02 +0000
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailflow.phl.internal (Postfix) with ESMTP id 3281A2018F1;
	Sat,  8 Mar 2025 16:09:00 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Sat, 08 Mar 2025 16:09:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1741468140;
	 x=1741475340; bh=k+KV9tKviVmM2X3+Wn2rrN1rFxZjkLzC9PykDJ3S5x8=; b=
	Nv/GxENcjbiTXX0M/0R6ZGrLyeXCXkxkr2aOaYV8bkV5CzS5a4FV6e3tiqaYopTP
	KCdgyCmDjRQlD4HYMx4ZrDAmyEwyEk8NYG9/Z/Hn8RYfAfhPx/SMIbe+IAw48qm8
	2spqL17hTDE03Nm+AAH2TCmss64eFXkteWrxEL33X8uQXJofMhhDDt6R9flV2pvB
	dqI8yMcFAPFLA2/aLSfzyhwMfKk5Awg87dTS3HoH4PnOKSEgwRxJzY73vw4o3J5b
	UZ+eSFoMtKcEkf0trJxIjrysUU/ZRPZv6TS1vRENCVHlUxgiicRwH5g73NFjmhkI
	hGovT0nQCGrLVYaWvF4Fnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1741468140; x=
	1741475340; bh=k+KV9tKviVmM2X3+Wn2rrN1rFxZjkLzC9PykDJ3S5x8=; b=e
	I5CCWFTua5Fc7wh24wgGy94EUNDorBhALYhPof+wHpXd43yI8TfqZpqnKbISITx3
	23l8jrvqes/RxrsBaFjmclqur1DZW6vyWZS3rccojFaKRkQk0Z4BwO03SSqJenux
	SCERBGpODmJWY7GmVysGWLu4pMBXR3anTPRx4BBNlDSPaczNSBANOvsA6lJSQCaa
	8DL/XFWm3/PeUhN0oP+g6YCJCMvc9yB1w+tTPbxagrMsM9mj7zG5L7dHfs74KVK/
	uc/ZLA27AUG2r/rMdQnxwzzeGNXhWP/EYJX88JyZr/AdEDUIxQVp57uUKsyTIAYK
	BM9GOfQrFUh8VzkgLvkcg==
X-ME-Sender: <xms:67HMZ9KWp6ZYUbeFsuY3l09pr50Dj-C3sup9kOX8ZswgBJI6emuGJA>
    <xme:67HMZ5L_afSSPqyVTd_Z-aahy3HFR6QTjlwC9xXNpbF98_vUtFhk2jDwNyHxNtxVQ
    NhfKPRdBce2O3xlR10>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudegheelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    gedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsphesrghlihgvnhekrdguvg
    dprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghp
    thhtohepjhhovgihrdhgohhulhihsegrrhhmrdgtohhmpdhrtghpthhtohepmhgrrhhkrd
    hruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtghpthhtohepshhuuggvvghprdhhohhllhgr
    segrrhhmrdgtohhmpdhrtghpthhtohepshhuiihukhhirdhpohhulhhoshgvsegrrhhmrd
    gtohhmpdhrtghpthhtohepsghhvghlghgrrghssehgohhoghhlvgdrtghomhdprhgtphht
    thhopeihuhiivghnghhhuhhisehhuhgrfigvihdrtghomhdprhgtphhtthhopegtohhnoh
    hrodgutheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:67HMZ1tVt3rXCzZQeGE66XMoKGj9boBkgSZbx2lOmdz7VHEQMfkFRw>
    <xmx:67HMZ-aFhtXfWkZsKg1bH24QbhtNlbIsGdltt8xDedSN0t6gkv2AlQ>
    <xmx:67HMZ0Zr3-aXmtSBqKsorxnr3ZynTyqVlYGpxf94c8rgG28VIRwAdg>
    <xmx:67HMZyAt8CCVl4VoHRCjlAysj6-YlkMjPri4pn4apoSxpNnBi2v0jA>
    <xmx:7LHMZ9haW67EhlxVxdsnGax7T6bJXPMulYE31rfpgxTnTOdc2B3HmTw6>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B040E2220072; Sat,  8 Mar 2025 16:08:59 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Sat, 08 Mar 2025 22:08:39 +0100
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
Message-Id: <d15274c2-6d61-4db3-ab0f-90591d28bc34@app.fastmail.com>
In-Reply-To: <20250307220304.247725-2-romank@linux.microsoft.com>
References: <20250307220304.247725-1-romank@linux.microsoft.com>
 <20250307220304.247725-2-romank@linux.microsoft.com>
Subject: Re: [PATCH hyperv-next v5 01/11] arm64: kvm, smccc: Introduce and use API for
 detectting hypervisor presence
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_130901_037923_59D55778 
X-CRM114-Status: UNSURE (   8.51  )
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

On Fri, Mar 7, 2025, at 23:02, Roman Kisel wrote:
> The KVM/arm64 uses SMCCC to detect hypervisor presence. That code is
> private, and it follows the SMCCC specification. Other existing and
> emerging hypervisor guest implementations can and should use that
> standard approach as well.
>
> Factor out a common infrastructure that the guests can use, update KVM
> to employ the new API. The cenrtal notion of the SMCCC method is the
> UUID of the hypervisor, and the API follows that.
>
> No functional changes. Validated with a KVM/arm64 guest.
>
> Signed-off-by: Roman Kisel <romank@linux.microsoft.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>


