Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9600CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 21:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mOo3qFkbufbHKgm/0F6bZDuICwPe3kT9r1r8xOxSOns=; b=sGaCPJXy+XhbhqSVRz1CrlVIpx
	A3KTyYQtmROsl0KwhXZ49oaCcHoNNBwha0uGyxlvL0+oh7uiVHBMDKEW+VLcr2JRIdWrqvEF0xx7Q
	U6tpsbKn+/tEQBu17Ew8IRjeeup0e/5qh1zs50ThY8rWxX0CsdW25IPDOaCgDmeSlyLjnLH8E+ykU
	Lj36TcQ2URsE6ZnKNwdrWVEXCAsRTn+uXjAhKXnzxRXbOD6zmDgm02jB5och2Bf2QcUbm+lahEd1R
	Ychsm36cx6ipO4RPIl73qlHgWEtN3LTCuwvDICeF/KVdYr3TUbCO2uPverpYYu2XHLaMFtVCzEBib
	5yvhj0Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5t7w-00000000sKd-2MzR;
	Mon, 06 Oct 2025 21:52:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5t7v-00000000sKX-00KP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 21:52:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 032CF61188;
	Mon,  6 Oct 2025 21:52:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6D15C4CEF5;
	Mon,  6 Oct 2025 21:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759787533;
	bh=/IUG+40uZFRvQzJPeoV/VrSw+bnfl+PWRnxqENQAWNw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VRR/V6J8hplpp5KWwR3ee4ChrEL9pTCiqGSitqsv6BZbpvWxb5XtcKD6C99dF2/WW
	 +rLhe53Du32Z1XhS2hw9+SRtujl+YytnYf6GVdcgZEfBwO03eTZZxewnsyfkVQ2UhT
	 M+sIOrmzyHoJ1Fdaw+R05hAmD0bToLqT8gy1zlMzxEg9sVC5FWkrtpDan5D+AdT8op
	 UvNqXYTBIBWEic6Lnbm2/82m2owoNlfDGCzFgyAWYx/PHJ5ZfXcCW1L2WKmm6pxswk
	 QU6i8UY8n0VppiURDxhbyvmse3/Bbgi1S8rhdYN/fLBwGSdTgktdvtZqOlqTSi/z41
	 ZVvhHaZMPrUHA==
Message-ID: <6fe16d18-b2e3-4a33-b03a-a30561dabbbf@kernel.org>
Date: Mon, 6 Oct 2025 22:52:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>,
 Mika Westerberg <westeri@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andy@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <hyzzrjn7jzo3tt3oyg7azijouawe3zopfjzq6zfhoo6e6z2m4t@ssl5vl4g557e>
 <zk4ea5cibrkp4vttuy4evrqybf76b3nop5lnyck4ws4nyf2yc4@ghj2eyswsoow>
 <CAMRc=MdWmO4wvX6zpzN0-LZF1pF5Y2=sS8fBwr=CKMGWHg+shA@mail.gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <CAMRc=MdWmO4wvX6zpzN0-LZF1pF5Y2=sS8fBwr=CKMGWHg+shA@mail.gmail.com>
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



On 10/6/25 5:10 PM, Bartosz Golaszewski wrote:
> On Mon, Oct 6, 2025 at 5:43 PM Manivannan Sadhasivam <mani@kernel.org> wrote:
>>
>> On Wed, Sep 24, 2025 at 11:25:12AM -0700, Dmitry Torokhov wrote:
>>> Hi Bartosz,
>>>
>>>>
>>>> The practical use-case for this are the powerdown GPIOs shared by
>>>> speakers on Qualcomm db845c platform, however I have also extensively
>>>> tested it using gpio-virtuser on arm64 qemu with various DT
>>>> configurations.
>>>
>>> How is this different from the existing gpio-backed regulator/supply?
>>> IMO GPIOs are naturally exclusive-use resources (in cases when you need
>>> to control them, not simply read their state), and when there is a need
>>> to share them there are more appropriate abstractions that are built on
>>> top of GPIOs...
>>>
>>
>> Not always... For something like shared reset line, consumers request the line
>> as GPIO and expect gpiolib to do resource manangement.
>>
> 
> They could use the reset API and it would implicitly create a virtual
> device that requests the reset GPIO and controls its enable count.
> Except that some devices also do a specific reset sequence with delays
> etc. That would require some additional logic in reset-gpio.
That should be a platform specific reset controller driver.

> 
> Bart


