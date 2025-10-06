Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B63BCAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 21:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s6eTDANOKzYaDbCM/Tul/+8oaMhQembSLIYZ+qsNhrc=; b=nixSVXC6Tk1q6rgJ3wmch9oW11
	0kuD4e4SaBI97o0wLQ6CnQWkb8mjAcb8XY4ASuWtm95k8DqJsDHLVo1JdAOSLC/eff+4pLcozWVol
	GcXAgoadFkbgVB3duTw+3XasGTY5aqnE1RhOy8dQNdquH0zfKyJjvZKmIn40xqxZ2IX9Crn9zFkt3
	WvosMFJ5QtclTWVjCkcgwFI9ytl8eKDoTHd+eYuH3VsWA0Wfuo64xhS6oODS0rkSdVPXLyIdQGIXZ
	XYT4kW1Thmxf9H6IWv+akWWKIaoXsvdP59PBupXgHEM24GzySR/zMBKDU7wHwDZTlxuZIpy1zu7wB
	Vg+5vXeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5tAn-00000000shx-2PST;
	Mon, 06 Oct 2025 21:55:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5tAl-00000000shB-2Wr0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 21:55:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0766061194;
	Mon,  6 Oct 2025 21:55:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C649C4CEF9;
	Mon,  6 Oct 2025 21:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759787710;
	bh=2aJnYVaGf8XUqQHTpB1VtEpe3tVyvm1Pn5nKvnx2EKI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sDCMggo7LWAQ4bGGtpFw4mVsQnmJ8vYPGTBLFLD08OlFnkZ5rQvP8L7bOBcsCjeu1
	 15MuEbCjbb/Ga3sQWrglz38c/riM+jyd6Iz/dNYD2DWgqF6f9mHNpuuNZE0LtcWbEi
	 pgQ+20XL+LbqmKMBE5nLoUcnMFoYPsZ23MuOghofJ0wSyQDRs5jvm0mi73Z5jItlWG
	 7u7abns/YhJzb9tB8844XHa6iXFxM2hbsPxuYjJzJfVduuOuDZQ/+g3Yy2VzCYvPc1
	 iWldpKvf8ET82qOTJddDsXKtquQZ7yJ/dHAtGgWvvtthetXt1XADT4Xy+2CaEHA3dB
	 nPzn4bwaSM6yw==
Message-ID: <80347dcf-419b-489e-9b0e-d901fbacc71a@kernel.org>
Date: Mon, 6 Oct 2025 22:55:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Srinivas Kandagatla <srini@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andy@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <0b402bba-0399-4f93-873e-890a78570ff7@kernel.org>
 <CAMRc=MfwEHGV-HZQURR3JNg1HatAeWO17qbRmkWUXTSBWj5jSg@mail.gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <CAMRc=MfwEHGV-HZQURR3JNg1HatAeWO17qbRmkWUXTSBWj5jSg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 10/6/25 12:55 PM, Bartosz Golaszewski wrote:
> On Sat, Oct 4, 2025 at 3:32 PM Srinivas Kandagatla <srini@kernel.org> wrote:
>> On 9/24/25 3:51 PM, Bartosz Golaszewski wrote:
>>> Here's a functional RFC for improving the handling of shared GPIOs in
>>> linux.
>>>
>>> Problem statement: GPIOs are implemented as a strictly exclusive
>>> resource in the kernel but there are lots of platforms on which single
>>> pin is shared by multiple devices which don't communicate so need some
>>> way of properly sharing access to a GPIO. What we have now is the
>>> GPIOD_FLAGS_BIT_NONEXCLUSIVE flag which was introduced as a hack and
>>> doesn't do any locking or arbitration of access - it literally just hand
>>> the same GPIO descriptor to all interested users.
>>
>> Isn't the main issue here is about not using a correct framework around
>> to the gpios that driver uses. ex: the codec usecase that you are
>> refering in this is using gpio to reset the line, instead of using a
>> proper gpio-reset control. same with some of the gpio-muxes. the problem
>> is fixed once such direct users of gpio are move their correct frameworks.
>>
> 
> If they were called "reset-gpios" then we could (and should) use
> Krzysztof's reset-gpio driver here, but we have many cases where
> that's not the case and the names (and implied functions) are
Yes, these codec drivers are due to be moved to use reset-gpios.

--srini
> arbitrary. In the case addressed in this series, the GPIOs are called
> "powerdown". The second big user of nonexclusive GPIOs are fixed
> regulators where the line isn't called "reset" either. There are also
> various other uses sprinkled all over the kernel for which no good
> abstraction exists or can even be designed in a generic way.
> 
>> Am not sure adding a abstraction with-in gpio framework is right
>> solution, But I do agree that NONEXCLUSIVE flags should disappear and
>> users that are using this should be moved to correct frameworks where
>> they belong.
>>
> 
> I'm open to suggestions but DT maintainers have not been particularly
> fond of creating "virtual" devices to accommodate driver
> implementations.
> 
> Bartosz


