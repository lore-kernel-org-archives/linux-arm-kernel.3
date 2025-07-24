Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA97DC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 20:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OR/k+Yb5/r+lek9vOADsYQwcNg5wzPpkQDsX2OIgMug=; b=i7RBT/6PXPuSSSXqH4Jma+84xs
	tVgspJRrndYpanBu7FsBstrqBpeXBgM0K20aFGyaJtt2PiLR9AbyREr+m5DSQb2GJccoI61gwhwjB
	bGJ1T/xx2HukuYEFJCfKTmoJ6rIJ2Fa1B8jeSBKzadRQa0Q1bfkaJfcfQQ3Hi+Ki9U/WxIt1Ixd2+
	F3A1oZVmh5EsP5U+B+PllnHAS65rxun7uwZ+pj+rMVCpVfCHU17/nECiOoCTDUOe4qMmmx0p6r6Ke
	d7zStjyW4Iaoq5WW/5RumLReBTQ+LL9j+Lasem6JUiH53TR+SxjLBYE6u5bIjOuYbfTEpZyfulTuM
	vl7XBudg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf2Nw-00000008NIt-20j0;
	Thu, 24 Jul 2025 20:17:48 +0000
Received: from fout-b8-smtp.messagingengine.com ([202.12.124.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf2LU-00000008ND4-35Aj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 20:15:18 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 27A4B1D000A2;
	Thu, 24 Jul 2025 16:15:14 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Thu, 24 Jul 2025 16:15:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1753388114;
	 x=1753474514; bh=OR/k+Yb5/r+lek9vOADsYQwcNg5wzPpkQDsX2OIgMug=; b=
	ZlY1OZZp1b8Am586wXCOEfdW2AMcU7RcaT8sqpqT/8k4I92gu9q29SFgAXek1YCI
	4t9lQd40irk7COhFF6j/wy4BQdvpnChmOGGpD3iY2AX0mHlGyYvLfkY5qrAHd7TQ
	pINY9m91E/QXKSfYSRm9Fvi5uLXhFdfJvUMGQY0A8TXgjSUpiVxxikgBK3OVb/Lb
	PpjHPbgueaBdNeZD4Kbz91lSDdr+oAC9Hvadip18Ky/sGdYkAGtqtEQF65o1yG2q
	/u2SX0mYksDyaTRF2eiVZbdsOAmyqVQSkI7hlgnlDgUeNEU4nhG6zYWyVp1xRTuw
	VCniGz2DS+T2Zpe+RWbz+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1753388114; x=
	1753474514; bh=OR/k+Yb5/r+lek9vOADsYQwcNg5wzPpkQDsX2OIgMug=; b=Q
	RARHRsLa9Q+F+YeBtWudr1ydchv20onMQrg5MhoL0jaxVs0zxSQ1UH/v2HCyeFNY
	tD4i1JWpRrsoMixcCZQI4U8F/RWWZQxlrlv8ynX3i/nVvRjzGyc1hvoq303Dn4rO
	2FWsJ8T4aSfVaUYXdmA4MO8ncLQPP69ZhyuT0KDtGxRyH2fOpdu49jff5kAjOdZd
	8nVkbjjxpzutn9Qiopw7pb4JUDnTCMJdHJXRWltPqvpIpWv+GJRIcniateNi7SZV
	d1sP+GLmYf7ePjT3nHFtZmH0kto3FXWoh9cNpofsosKEf+G0SHzla8l4EBMRvycu
	EH3VMlp1Hz8MwgE8ZT2aQ==
X-ME-Sender: <xms:UJSCaOangYblKHm5ynnjJOt1ay2WymQaTZ-VQYUJu0L2EvA90icNSQ>
    <xme:UJSCaBY9C0ZQXEsnPSSK3sz361EaevX1R1Z_KXOky0D1nzwmypH4ZFM6OSPU84SOf
    04D4bpiyXvkEwvpAi4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdekudehkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeefvddpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepshhouhhvihhkrdgthhgrkhhrrghvrghrthihsegrrhhmrdgtohhmpd
    hrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphht
    thhopehmrghrkhdrrhhuthhlrghnugesrghrmhdrtghomhdprhgtphhtthhopehsuhguvg
    gvphdrhhholhhlrgesrghrmhdrtghomhdprhgtphhtthhopehflhhorhhirghnrdhfrghi
    nhgvlhhlihessghrohgruggtohhmrdgtohhmpdhrtghpthhtoheptghrohhsqdhqtghomh
    dqughtshdqfigrthgthhgvrhhssegthhhrohhmihhumhdrohhrghdprhgtphhtthhopehs
    figsohihugestghhrhhomhhiuhhmrdhorhhgpdhrtghpthhtoheprghnuggvrhhsshhonh
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdr
    ohhrgh
X-ME-Proxy: <xmx:UZSCaMMiZQ4fS5eS8s8LhsXGhClbgu0BBCTSD1NuQAbp2T1hWLkLkg>
    <xmx:UZSCaBO39i3g2v3x-jpW7zxNP6nStKVvZPZd0tx1gckkeph-MmADVQ>
    <xmx:UZSCaAaGml08Mw1vFyLbi1FVUpmcKbo92XMVghSLpgXXn4UDp7IUhQ>
    <xmx:UZSCaHi_mnvn8evzpZz9E8zfCDqn3tuGfCtKU3oshSFP2zK45w7R9g>
    <xmx:UZSCaPTRtEP979cArFofVMHt7EqkBdz57-r1d96uDYhDiQn-DpkLgqOs>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DD1DA700065; Thu, 24 Jul 2025 16:15:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T8f78d0e2b9c43c44
Date: Thu, 24 Jul 2025 22:14:52 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>,
 "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>,
 "Bjorn Andersson" <andersson@kernel.org>,
 "Sebastian Reichel" <sre@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Sudeep Holla" <sudeep.holla@arm.com>,
 "Souvik Chakravarty" <Souvik.Chakravarty@arm.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Andy Yan" <andy.yan@rock-chips.com>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>,
 cros-qcom-dts-watchers@chromium.org, "Vinod Koul" <vkoul@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>
Cc: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>,
 "Stephen Boyd" <swboyd@chromium.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, "Elliot Berman" <quic_eberman@quicinc.com>,
 "Srinivas Kandagatla" <srini@kernel.org>,
 "Elliot Berman" <elliot.berman@oss.qualcomm.com>,
 "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>
Message-Id: <fd153e95-b06d-47f9-b079-566908c20df2@app.fastmail.com>
In-Reply-To: <58eb8f0e-a029-cb7f-e63a-9eac6a6444df@oss.qualcomm.com>
References: <20250721-arm-psci-system_reset2-vendor-reboots-v12-0-87bac3ec422e@oss.qualcomm.com>
 <beb26682-d2e4-40e6-89ac-87f18c0401d0@broadcom.com>
 <56599da9-0200-72b5-012e-942a1fc954b2@oss.qualcomm.com>
 <a1d3264f-a46a-42c4-b518-a66c8e0b70b4@kernel.org>
 <f4725f3f-1b45-ebd2-aaf4-4f986a44eb8e@oss.qualcomm.com>
 <36f62026-9517-42bd-8f9a-92f39fcdc136@app.fastmail.com>
 <58eb8f0e-a029-cb7f-e63a-9eac6a6444df@oss.qualcomm.com>
Subject: Re: [PATCH v12 0/8] Implement vendor resets for PSCI SYSTEM_RESET2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_131517_165123_86C3B13C 
X-CRM114-Status: GOOD (  21.14  )
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

On Thu, Jul 24, 2025, at 20:21, Shivendra Pratap wrote:
> On 7/24/2025 8:13 PM, Arnd Bergmann wrote:
>> On Thu, Jul 24, 2025, at 16:04, Shivendra Pratap wrote:
>> How about using the reboot driver name as the identifier in sysfs
>> instead of the compatible string? That would make it independent of
>> devicetree.
> In current patch, psci driver registers to reboot-mode using a device-tree
> node. So reboot-mode does not has a driver name for psci's reboot registration.
> its like -  reboot_mode_register(reboot, <struct device_node *np>)
>
> Now when we want to use the registering reboot driver's name for sysfs,
> either we- 
> 1, Pass an explicit name from psci driver(say "psci") while registering
> to reboot-mode.
> or
> 2. Create a virtual device in psci driver with name say "psci" and then
> register for reboot-mode.
>
> which one is preferred? suggestions? 

I would pick 1, to decouple the namespace from the device and to
keep it simpler.

>> I had a related idea to provide some namespacing on the actual
>> reboot syscall parameter, as we have two (or more) orthogonal
>> concepts here, when there is more than one reboot driver and
>> drivers support multiple modes.
>> 
>> E.g. you could use
>> 
>>     syscall(__NR_reboot, LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2, 
>>             LINUX_REBOOT_CMD_RESTART2, "watchdog");
>> 
>> vs
>> 
>>     syscall(__NR_reboot, LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2, 
>>             LINUX_REBOOT_CMD_RESTART2, "psci");
>> 
>> to pick one of the drivers, or
>> 
>>     syscall(__NR_reboot, LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2, 
>>             LINUX_REBOOT_CMD_RESTART2, "bootloader");
>> 
>>     syscall(__NR_reboot, LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2, 
>>             LINUX_REBOOT_CMD_RESTART2, "recovery");
>> 
>> to ask for a reboot from any driver that supports a mode, or
>> combine the two and ask a specific mode in a specific driver like
>> 
>>     syscall(__NR_reboot, LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2, 
>>             LINUX_REBOOT_CMD_RESTART2, "psci:bootloader");
> This will introduce an additional feature in the reboot-mode driver.
> If a colon is present in the command like "<driver name>:bootloader",
> Call the "<driver name>" specific writes only. 
> We want to add this feature? 

I think this will require a little more rework in the reboot
infrastructure, and I did not mean for you to do it now, we
can always decide to do this as a follow-up, but I brought it
up because the way we pick the namespace will limit our options
later.

      Arnd

