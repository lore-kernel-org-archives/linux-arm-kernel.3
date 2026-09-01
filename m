Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7C2C624D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 18:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=soj2uFsYNX757aHImCwMM0LMVX32Pw6BHhDFsDFZfdc=; b=SzZTyS3E4Kjn0p149ITPGiF/Bs
	k1lIyxUfIX/R2vTtt9/0n1OWzxHb/hL6jEvKEoniLM1QXq+W9eIvpWmcoTO7I+NvHfkr/nwEJVht7
	ntxlPcodu+WNtTPAVEG/8SnzGVfiQmEhiQ+g9hoobiW4cFMsMa5vNeGTbX79UHliVTTFdBWWFAmXF
	slMObRMLGs2l1zvi/OnGj/GlS2x9pt7B4imqeGtcuBAg3wIxss/6C+CiMjAJZeLtOhR7RjjF7yc8a
	iY4A4qGu/VIgrzHFwpwMBYU88bsQXI5PMDVRacEfJfRkMRqc/CK5tibYbzjax/z00BjHn3Kw+KKKm
	YapRXOdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Tev-0000000D9ID-20My;
	Tue, 01 Sep 2026 18:56:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Tet-0000000D9HW-15Hq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 18:56:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F0C860207;
	Tue,  1 Sep 2026 18:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB2991F000E9;
	Tue,  1 Sep 2026 18:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788288994;
	bh=soj2uFsYNX757aHImCwMM0LMVX32Pw6BHhDFsDFZfdc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Pk5Vs0IPCvpa2mVAmhiOng2EmTWFN6zn/Q42Pc6xkIUrXSMEvSh5GJYTtz1Abl2bm
	 8TeAs8lSjBBPZelsoGeQ75FmbeH0ZsmS1SOq+N2vXnadIBXaa2C4UJqROXRfwro8we
	 Akox8XBMUdaAVZXU8LdDI2IHdbMKnGWeg4xJGncMoZyU55AVyp+62gtQgDz8J3tMus
	 0DeYFqzIvOMXFd7LpLmZnNQwwXi6NvYGi5OitGqlcfLOzFIIdwu1a4kREN58VkQ8/B
	 vzO9vEi4xYY2w1+8y5t/QR5kM1sYa1ddBqyf/lmc/fayxAr3m49w6QM6S/lpsCvTJm
	 zhLqrbATkE/ig==
Message-ID: <8348dc87-15f2-4019-9e27-744ab4a801b8@kernel.org>
Date: Tue, 1 Sep 2026 20:56:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/19] thunderbolt: Make the ring register layout
 configurable
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
 <20260830-b4-apple-soc-tbt-v1-10-44bc9348683c@kernel.org>
 <20260901085802.GC106095@black.igk.intel.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260901085802.GC106095@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 9/1/26 10:58, Mika Westerberg wrote:
> Hi,
>
> On Sun, Aug 30, 2026 at 10:19:28PM +0200, Sven Peter wrote:
>> The ring descriptor and options registers are laid out differently on
>> the Apple NHI. Describe their offsets and strides with a
>> tb_nhi_ring_layout struct that NHI drivers can override.
> This is odd because Apple is sitting in USB-IF and they are behind the
> original register layout so why they do not follow it themselves?

My guess is as good as yours but knowing Apple's culture it's probably 
separate teams not being allowed to talk to each other...

>
>> Signed-off-by: Sven Peter <sven@kernel.org>
>> ---
>>   drivers/thunderbolt/nhi.c   | 30 ++++++++++++++++++++++++------
>>   drivers/thunderbolt/nhi.h   | 18 ++++++++++++++++++
>>   include/linux/thunderbolt.h |  3 +++
>>   3 files changed, 45 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
>> index fc54ff7edfb9..3a3d334e69fd 100644
>> --- a/drivers/thunderbolt/nhi.c
>> +++ b/drivers/thunderbolt/nhi.c
>> @@ -176,19 +176,32 @@ void nhi_disable_interrupts(struct tb_nhi *nhi)
>>   
>>   /* ring helper methods */
>>   
>> +static const struct tb_nhi_ring_layout nhi_default_ring_layout = {
>> +	.tx_desc_base = REG_TX_RING_BASE,
>> +	.rx_desc_base = REG_RX_RING_BASE,
>> +	.desc_stride = 16,
>> +	.tx_options_base = REG_TX_OPTIONS_BASE,
>> +	.rx_options_base = REG_RX_OPTIONS_BASE,
>> +	.options_stride = 32,
>> +};
> I'm not fan of these to be honest.
>
> I think either adding ring_ops that includes hooks that can be overridden
> by non-standard HI or not sure if we can take advantage of regmap here?

Sure! I don't think regmap buys us anything but I think I can get away 
with just adding nhi_ring_desc_base() and nhi_ring_options_base() to the 
ops.


Sven

