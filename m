Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38090D46BED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 01:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tZZ3hgFQthdJ/PkZwh8GwZaL+bSGuAAwWD0RqtfIF70=; b=xQNIti99bUc3JaarZg6IXFG8d4
	0Ac8C/1wwzMVu6EH3jWtsKpkkadcE8dq+HcvGHWq/habAQEbCiu9fAYGrBc7tqAVUuY9svWLQ67R/
	E4x3PLPDaaNz60HyJ2z81eBrmPTFkXgP3DdzvzQtja1MImbjk7w690npC6AQUhgCby4YMkbXGuAcz
	DHKbPda/7VrdXtk6lTSx3MpMQOjq7JAM52P5jd8aQCdLpcUA/QQaWqweCY4jJREM0a2Hg+bsZNyFG
	clfRzEEAfwhz67MX1m9d/2nSPIMsUGQUMVVZt2eCSRFt+hVun5uIgVZTlaLHlRhnyIMKOoLSatlv2
	5KduYv5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlGcS-0000000H28k-0lLm;
	Thu, 29 Jan 2026 01:14:48 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlGcP-0000000H27x-0xJU;
	Thu, 29 Jan 2026 01:14:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769649282;
	bh=gtoH8iXkfDnDeWMhk7HbyeV4YG1OQmXsw/axrAJnNUM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hpzwVGm5nAyhlPywmD3XFVwVUogkLuoq48Zc5VZNyJhl8cZhXnwCda79We5iUXX/4
	 zXCN1Z+sRzfV9twaA6swkac5NV5rkpRWG7lXF7/Ki9FAZSu+chuwxorlX7532prfeu
	 VAJm1Q35aVWjUJONWd+Q6I2DqrFdA9K5w6DEuH/K5EVCBXTchz4V5smnfKoeOzMke1
	 FoSmjgdXjcglOjVfAdLGRnENVLRg4aTObNzUQPrPZAv8e03rV2DuKIOe0KKudhP99P
	 1AmoKo00CMkzgjAV4tnJmqa7LA5t1VbgnFdAMQPRPLfNgF3Vf9+kbWoLpTY8bSjbR/
	 OE39XhQAcKF3g==
Received: from [192.168.1.90] (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 33FCB17E01E7;
	Thu, 29 Jan 2026 02:14:42 +0100 (CET)
Message-ID: <c9f51c59-c972-420e-89da-f42ab5a843c0@collabora.com>
Date: Thu, 29 Jan 2026 03:14:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] uapi: Provide DIV_ROUND_CLOSEST()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Robert Mader <robert.mader@collabora.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Diederik de Haas <diederik@cknow-tech.com>
References: <20260127-rk3588-bgcolor-v5-0-b25aa8613211@collabora.com>
 <20260127-rk3588-bgcolor-v5-1-b25aa8613211@collabora.com>
 <baf075b2370a13cddd597a3d421b5f39290d87a4@intel.com>
 <aXjNyHaJDHoCPRJO@smile.fi.intel.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <aXjNyHaJDHoCPRJO@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_171445_450160_00AB59B1 
X-CRM114-Status: GOOD (  28.21  )
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

Hi Andy,

On 1/27/26 4:38 PM, Andy Shevchenko wrote:
> On Tue, Jan 27, 2026 at 03:58:13PM +0200, Jani Nikula wrote:
>> On Tue, 27 Jan 2026, Cristian Ciocaltea <cristian.ciocaltea@collabora.com> wrote:
>>> Currently DIV_ROUND_CLOSEST() is only available for the kernel via
>>> include/linux/math.h.
>>>
>>> Expose it to userland as well by adding __KERNEL_DIV_ROUND_CLOSEST() as
>>> a common definition in uapi.
>>>
>>> Additionally, ensure it allows building ISO C applications by switching
>>> from the 'typeof' GNU extension to the ISO-friendly __typeof__.
>>
>> I am not convinced that it's a good idea to make the implementation of
>> kernel DIV_ROUND_CLOSEST() part of the kernel UAPI, which is what this
>> change effectively does.
>>
>> I'd at least like to get an ack from Andy Shevchenko first (Cc'd).
> 
> Thanks for Cc'ing me!
> 
> So, the history of the DIV_ROUND_UP() to appear in UAPI is a response to
> the ethtool change that missed the fact that this was a kernel internal macro.
> Giving a precedent there is no technical issues to add DIV_ROUND_CLOSEST()
> to UAPI as proposed. Main question here is: Does DRM headers in question
> (that are going to use it) really need this?
> 
> Interestingly that DRM also started using __KERNEL_DIV_ROUND_UP() in UAPI
> at some point, which kinda makes an argument for allowing the other one.
> 
> Also fun fact: this series plead for a new macro for division while ignoring
> existing (UAPI) macros for masks and bits.

Yeah, I initially planned to make use of those, but gave up after realizing the
FIELD_{PREP|GET} were not exposed. I reconsidered my position now that you
mentioned it. :-)

> 
> 0xffffU is effectively __GENMASK(15, 0). (And if you change the code, avoid
> using variables inside GENMASK() macros, it may generate an awful code, the
> GENMASK($HI, $LO) << foo is preferred over GENMASK(foo + $DELTA, foo) case.
> GENMASK(foo - 1, 0) OTOH is fine, however be always careful against overflows
> with left shifts, as BIT(foo) - 1 may not work for foo == 32, while GENMASK()
> may not work for foo == 0).

Thanks for the heads up!

> 
> So, I have no objections for either choice
> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> ...
> 
> But if you go that direction, please, fix up the style.
> 
>>> +/*
>>> + * Divide positive or negative dividend by positive or negative divisor
>>> + * and round to closest integer. Result is undefined for negative
>>> + * divisors if the dividend variable type is unsigned and for negative
>>> + * dividends if the divisor variable type is unsigned.
>>> + */
>>> +#define __KERNEL_DIV_ROUND_CLOSEST(x, divisor)(		\
>>> +{							\
> 
> Use ({ on this line together...
> 
>>> +	__typeof__(x) __x = x;				\
>>> +	__typeof__(divisor) __d = divisor;		\
> 
> + blank line here.
> 
>>> +	(((__typeof__(x))-1) > 0 ||			\
>>> +	 ((__typeof__(divisor))-1) > 0 ||		\
>>> +	 (((__x) > 0) == ((__d) > 0))) ?		\
>>> +		(((__x) + ((__d) / 2)) / (__d)) :	\
>>> +		(((__x) - ((__d) / 2)) / (__d));	\
>>> +}							\
>>> +)
> 
> ...as here join }) to be a single line.
> 
> + blank line.
> 
>>>  #endif /* _UAPI_LINUX_CONST_H */


Thanks for the review! I've addressed all your comments (hopefully) in v6:

https://lore.kernel.org/all/20260129-rk3588-bgcolor-v6-0-c15f755a4055@collabora.com/

Regards,
Cristian


