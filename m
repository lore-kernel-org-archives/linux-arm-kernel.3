Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B223D2E9F0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 14:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vk7EpzfGfPR2h43Jxy6eKjqYO5erQJD7ssxhdgS79TI=; b=KrZjf6HLWGq9rB/Fx7b4nKc2Wy
	e32f1rIwHFldFwLtUD7hZq4ow2QNKVRy5WSvE1lFESdnU7ekCKzLyJhLKx0nWqQSXa/TvHcI//xia
	BZ2DNfZei5dUHDIveCbXE1MmMMssv+ophAFdJ7V/7MhzLXz1CF9Wt20Ba8zTWCvHEbp8C9adgyLw4
	9dT7Ard79YvgTQ90UdJTrIt2cvNSefaq7Blo2ee8krdstWF/jwEvjdLYZapveU1a7ZpEzj6LTmVk+
	iWYj6kikP8Py/8u3Ldaz/LeEOU4uW70gIFrbH3rUaSr8ehUWe3hk0QjG7icgHue69A12+fUkZhdzI
	kx7Iw+sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAVj3-00000000Mwr-0Nwa;
	Mon, 11 Nov 2024 14:49:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAVhF-00000000Mjn-3oZj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 14:47:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A9491CE0;
	Mon, 11 Nov 2024 06:47:44 -0800 (PST)
Received: from [10.57.79.116] (unknown [10.57.79.116])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C84D03F66E;
	Mon, 11 Nov 2024 06:47:12 -0800 (PST)
Message-ID: <a4168463-98e3-4048-bb38-ffc96983766f@arm.com>
Date: Mon, 11 Nov 2024 14:47:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwtracing: Switch back to struct
 platform_driver::remove()
Content-Language: en-GB
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20241111110922.334610-2-u.kleine-koenig@baylibre.com>
 <87h68duaez.fsf@ubik.fi.intel.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <87h68duaez.fsf@ubik.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_064718_015712_55B6C470 
X-CRM114-Status: GOOD (  19.32  )
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

Hi

On 11/11/2024 14:12, Alexander Shishkin wrote:
> Uwe Kleine-König <u.kleine-koenig@baylibre.com> writes:
> 
>> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
>> return void") .remove() is (again) the right callback to implement for
>> platform drivers.
>>
>> Convert all platform drivers below drivers/hwtracing to use .remove(),
>> with the eventual goal to drop struct platform_driver::remove_new(). As
>> .remove() and .remove_new() have the same prototypes, conversion is done
>> by just changing the structure member name in the driver initializer.
>>
>> Also adapt some whitespace to make indention consistent.
>>
>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> 
> Acked-by: Alexander Shishkin <alexander.shishkin@linux.intel.com>
> 
>> ---
>> Hello,
>>
>> I did a single patch for all of drivers/hwtracing. While I usually
>> prefer to do one logical change per patch, this seems to be
>> overengineering here as the individual changes are really trivial and
>> shouldn't be much in the way for stable backports. But I'll happily
>> split the patch if you prefer it split. Maybe split for coresight vs.
>> intel_th? Also if you object the indentation stuff, I can rework that.
> 
> I'm fine with it as is.
> 
>> This is based on today's next, if conflicts arise when you apply it at
>> some later time and don't want to resolve them, feel free to just drop
>> the changes to the conflicting files. I'll notice and followup at a
>> later time then. Or ask me for a fixed resend. (Having said that, I
>> recommend b4 am -3 + git am -3 which should resolve most conflicts just
>> fine.)
> 
> Does anybody want to pick this up or should I? I'm fine either way, but
> if there are any conflicts they won't be from my end of things, so it
> might make sense to take it via the coresight path.

I am happy to take them via coresight tree and queue them for v6.14

Suzuki

> 
> Thanks,
> --
> Alex


