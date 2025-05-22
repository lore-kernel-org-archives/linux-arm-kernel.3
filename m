Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2093C54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 10:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xVWtyDUgJnh0geO6pSrHxWvzURu7bA5K2oBZ3UTDjCI=; b=RreSoOp/7O27+mdSXtVtyygHF/
	6o6QS52p+q+pWNqmf89/iQkzCm6JjOefNdq7pTQgYTCTgLYxN4iCxEFKwseFLz+Z7MNKWgrmG4qXb
	bx9O3wME5Nhl4CPjSubEDCq+C0luOxa1VzP22Uvz6IJ5EFPNGq6yKsMIs8GYQik21rhNzhb38Wcbp
	R+c5K/4v5u/HTzEEuTjFl8eAbaOZMs6eb08U4SuZ5QqV7kuEbYJ9zC/kgzEvV9XhenQUf+Gt059XL
	52pAuJf8ORisUX7uV/jPRYXfwKx0hUYkARPbzpCkyC52H0fQMjOJ3LvjmdhBNfhAUMZWckJyx35oZ
	cxqDkvMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI3JN-00000000jUc-1oBr;
	Thu, 22 May 2025 10:38:05 +0000
Received: from fout-b1-smtp.messagingengine.com ([202.12.124.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI3HH-00000000iw8-0VfK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 10:35:57 +0000
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id EF3EF114027B;
	Thu, 22 May 2025 06:35:50 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-04.internal (MEProxy); Thu, 22 May 2025 06:35:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1747910150; x=1747996550; bh=xVWtyDUgJnh0geO6pSrHxWvzURu7bA5K
	2oBZ3UTDjCI=; b=d14xGV3SXRmTMfztLAPZ6NvlVMWpTzQg84FTQQkGXBsqstyA
	mzo7DDnNErbeE0VRKhPZzRjBObcAqqJQHCcwGqCPATVeV0WAjIAeQeu5uxnm063Q
	FBGio/gg4hKcf3TFVBsEu9UXXG3Lg+3aAkQxmx6DfAVs0d+aXkQ/HCOlB8LLkWb3
	hVoyj6hFs5sc+4yEr/v/sQjmqxAZPUg3O1hhkDG06LDzKt1JX8e7/WzFsYyeZzkS
	4xen2/CkWfc5YZW2/yLmHYxIpyFudWEoA7+sg3+C+MmDEqk9OZWKPuuBr0OXS6zP
	I/tdK5Iw6ZYshdlnMqNoWESXSgyYWtovJBFFfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1747910150; x=
	1747996550; bh=xVWtyDUgJnh0geO6pSrHxWvzURu7bA5K2oBZ3UTDjCI=; b=A
	+NNQzCXr/vB9MXDJ4H/QCT+zaG8lFXTw7UrGv0BBjXzmg7tSMxqdgawo9CfOUot8
	hPZgoKyYbQQ4ZI6zlVcdZ0Bs4Hw21CsTShvA7PjBdS6LhODzPLdsMPfssE0NLB1d
	EIY4GnLwb1DRuioNF8ci7+OFj0ANHi4wngIkIkbTvOu1O521fSNVG7cUpCWHPtJd
	rwMDhAO6qfqzefEDsDOJsaiI8aqTWozVtf6IuLnf946n9hSzyq9cCA5mY9o28zEL
	a0Lo36PKKdJJR3rezt4NLcNds+SQbBpcqZVWKaU1RU8/3hd9Rc4UMQfPu6ldaRtN
	7v8KqiuE1oiSdhpNNlAuw==
X-ME-Sender: <xms:Bf4uaBi41Gee8Y9TlEBhsmvEafo5eksg2aItR-vQ1a_8bgfaCGgDtg>
    <xme:Bf4uaGAODiEgqY9HurCCQgzc4z0_TOG40yIXuYAeILWg4Mt9nQZbC6c4xEmlimPAz
    IgX0eIAzpkjBUeE4qw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdehjeegucdltddurdegfedvrddttd
    dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgf
    nhhsuhgsshgtrhhisggvpdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttd
    enucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgj
    fhfutgfgsehtjeertdertddtnecuhfhrohhmpedfufhvvghnucfrvghtvghrfdcuoehsvh
    gvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrfgrthhtvghrnhepleefteeugedu
    udeuudeuhfefheegveekueefffdvffektdffffelveffvddvueffnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhvvghnsehsvhgvnhhpvght
    vghrrdguvghvpdhnsggprhgtphhtthhopeduledpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtoheprhhmkhdokhgvrhhnvghlsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghp
    thhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopehnvggrlhesghhomhhprg
    druggvvhdprhgtphhtthhopehjsehjrghnnhgruhdrnhgvthdprhgtphhtthhopegtohhn
    ohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtoheplhgvvgeskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepmhgriieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlh
    drohhrgh
X-ME-Proxy: <xmx:Bf4uaBG3xisiHfp8Ns3UFfK35HUVkqQ4fftw2wGZ_djGpmn8EmNOLA>
    <xmx:Bf4uaGSkpPIN-s6ylvzAY_1LoKUzJpOFKPC4W0kv2SJM6RPwCQdycw>
    <xmx:Bf4uaOyaP7zzsEsoQB5O6NYGBzt3mtywoRRTr-qgqkofrFwdsjOWDg>
    <xmx:Bf4uaM6au0aOxZia-xzKu2U-ig7fjblF7bJc2UYVlmgz2ov4NYTP8Q>
    <xmx:Bv4uaGTUG2WZ2-PYLm2-qorCxLXAhBfBIXRVe25pI1T9ATDnT4NodPSA>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 961FF1060060; Thu, 22 May 2025 06:35:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T3582cb9b01beb853
Date: Thu, 22 May 2025 12:35:29 +0200
From: "Sven Peter" <sven@svenpeter.dev>
To: "Lee Jones" <lee@kernel.org>
Cc: "Janne Grunau" <j@jannau.net>, "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
 "Neal Gompa" <neal@gompa.dev>, "Hector Martin" <marcan@marcan.st>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Sebastian Reichel" <sre@kernel.org>,
 "Marc Zyngier" <maz@kernel.org>, "Russell King" <rmk+kernel@armlinux.org.uk>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
Message-Id: <c9c2779e-dfa4-4e64-9b16-7558bb2563fd@app.fastmail.com>
In-Reply-To: <20250522085906.GA1199143@google.com>
References: <20250515-smc-6-15-v6-0-c47b1ef4b0ae@svenpeter.dev>
 <20250515-smc-6-15-v6-5-c47b1ef4b0ae@svenpeter.dev>
 <20250522085906.GA1199143@google.com>
Subject: Re: [PATCH v6 05/10] mfd: Add Apple Silicon System Management Controller
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_033555_716268_E16EB2F5 
X-CRM114-Status: GOOD (  17.15  )
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

Hi,


On Thu, May 22, 2025, at 10:59, Lee Jones wrote:
> On Thu, 15 May 2025, Sven Peter via B4 Relay wrote:
>
>> From: Sven Peter <sven@svenpeter.dev>
>> 
>> The System Management Controller (SMC) on Apple Silicon machines is a
>> piece of hardware that exposes various functionalities such as
>> temperature sensors, voltage/power meters, shutdown/reboot handling,
>> GPIOs and more.
>> 
>> Communication happens via a shared mailbox using the RTKit protocol
>> which is also used for other co-processors. The SMC protocol then allows
>> reading and writing many different keys which implement the various
>> features. The MFD core device handles this protocol and exposes it
>> to the sub-devices.
>> 
>> Some of the sub-devices are potentially also useful on pre-M1 Apple
>> machines and support for SMCs on these machines can be added at a later
>> time.
>> 
>> Co-developed-by: Hector Martin <marcan@marcan.st>
>> Signed-off-by: Hector Martin <marcan@marcan.st>
>> Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
>> Reviewed-by: Neal Gompa <neal@gompa.dev>
>> Signed-off-by: Sven Peter <sven@svenpeter.dev>
>> ---
>>  MAINTAINERS                |   2 +
>>  drivers/mfd/Kconfig        |  18 ++
>>  drivers/mfd/Makefile       |   1 +
>>  drivers/mfd/macsmc.c       | 498 +++++++++++++++++++++++++++++++++++++++++++++
>>  include/linux/mfd/macsmc.h | 279 +++++++++++++++++++++++++
>>  5 files changed, 798 insertions(+)
>
> Arghhh, so close!
>
> [...]
>
>> +static struct platform_driver apple_smc_driver = {
>> +	.driver = {
>> +		.name = "mfd-macsmc",
>
> Drop the 'mfd-' part please.

Ack.

>
>> +		.of_match_table = apple_smc_of_match,
>> +	},
>> +	.probe = apple_smc_probe,
>> +};
>> +module_platform_driver(apple_smc_driver);
>> +
>> +MODULE_AUTHOR("Hector Martin <marcan@marcan.st>");
>> +MODULE_AUTHOR("Sven Peter <sven@svenpeter.dev>");
>> +MODULE_LICENSE("Dual MIT/GPL");
>> +MODULE_DESCRIPTION("Apple SMC driver");
>
> I plan to apply this set after the merge-window.
>
> What else are you waiting on?

The only thing missing is a review/ack from the power/reset maintainers.
I will send v7 after the merge window rebased on -rc1 then.


Thanks,


Sven

