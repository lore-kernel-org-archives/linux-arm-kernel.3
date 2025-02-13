Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F18C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 13:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cm7XKVhBb29N/0ZGLeQV/Hvrssux+61wOZwuTX8KNK4=; b=S+KlrFBFRfAN1i
	+bIXizzvk5C38r0bQiwed7/mr/h/pgvKg7KHsV+F1Uzk8vfs+pjTsdQCDD92AqmH1BpUSKxmBvBb5
	GALibsZY6kgBOqLIQb5QImQVGTAf3M9gDJP0tlTFKg3b44v1yCshYzhG/WTwk4IDdGUYR4wl3zKOd
	+ToUj8xsYHbBxOQoNQw4lqU3le5REmvr9BBHWJcD/QmaJjufsJHmVDulrgQzK+FXSHsyibr4qDXwR
	zQVx9oHLjtncLGXRN0GvzZlyAiPn7IbYlQ4rra6V9Xk9sKDVpNZSIkxV7MHxGU2hSX9W5JCKk88+w
	H6jxsk5iaVA5VYBE7cIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZW0-0000000BBYx-2bZz;
	Thu, 13 Feb 2025 13:44:28 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZUZ-0000000BBKc-1AsH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 13:43:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0135D440EA;
	Thu, 13 Feb 2025 13:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739454176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cm7XKVhBb29N/0ZGLeQV/Hvrssux+61wOZwuTX8KNK4=;
	b=UsNJuD4XUBmjbgOSrbOsnmXWQjngrRl3HCRZ4AFsbr040l7wQWhGBAYM7ugvSPztEr404y
	sG3AFOT35aee2kcyCcGkHVWHvDWLTMCVNE1ns8zVCQGnoWl+B0uAw9DpcqVXoo8ozUa6si
	Jc1gBNVMH0/VFFCz0Rc0+nv4h3ejj3J77wPfgd91fgRYEn0cW0GJg3vXPzj0WO6lJY+UZm
	MKNeonZzYcSWALUPCOm72eXlzDqM5xYBRM5AYeUyc7A4m5+2STYJhBFkV2mbfyCWgkViuB
	ldlZfjaFDZunxqzdFCss+IKKZ0vP6wZ8nca4IX8LtwynwYIhz4hzGXWu5iWmbg==
Message-ID: <64ec49f2-8c3b-4642-a910-32a656095c68@bootlin.com>
Date: Thu, 13 Feb 2025 14:42:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] serial: mctrl_gpio: add parameter to skip sync
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20250213-atomic_sleep_mctrl_serial_gpio-v1-1-201ee6a148ad@bootlin.com>
 <2025021347-cling-smoked-9f28@gregkh>
Content-Language: en-US
From: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
In-Reply-To: <2025021347-cling-smoked-9f28@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegieelvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvdetteektdehudelheehkeeggfejgfelveevgeevtdejudfgveetgefhtdduuedtnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrvddungdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudekpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepjhhirhhishhlrggshieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrghrugdrghgvnhhouhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepnhhitgholhgrshdrfhgvrhhrvgesmhhitghro
 hgthhhiphdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheptghlrghuughiuhdrsggviihnvggrsehtuhigohhnrdguvghvpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvg
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_054259_809712_6180AAF1 
X-CRM114-Status: GOOD (  13.86  )
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
Cc: imx@lists.linux.dev, Alexandre Belloni <alexandre.belloni@bootlin.com>, Fabio Estevam <festevam@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Jiri Slaby <jirislaby@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-stm32@st-md-mailman.stormreply.com, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-serial@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, linux-kernel@vger.kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello Greg,

On 2/13/25 10:58, Greg Kroah-Hartman wrote:
> On Thu, Feb 13, 2025 at 09:25:04AM +0100, Alexis Lothoré wrote:

[...]

>> -	mctrl_gpio_disable_ms(up->gpios);
>> +	mctrl_gpio_disable_ms(up->gpios, false);
> 
> This a bad api.
> 
> When you read this line in the driver, do you know what "false" means
> here?
> 
> Please make two functions, mctrl_gpio_disable_ms_sync() and
> mctrl_gpio_disable_ms_no_sync() which can internally just call
> mctrl_gpio_disable_ms() with the boolean, but no driver should have to
> call that at all.
> 
> That way, when you read driver code, you KNOW what is happening and you
> don't have to hunt around in a totally different C file to try to figure
> it out and loose your concentration.

Makes sense, I'll spin a v2 with a more explicit API.

Thanks,

Alexis
> 
> thanks,
> 
> greg k-h


-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

