Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E11BEE57C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 23:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z9334s5hAbULqn6m+Gcf17fV9B6uuLr/aNZcFaMAYCY=; b=Tmx9nNQC31sbKNfX8CXpUyfsp1
	C/VxDEh67Jo2ntcOseGEubOzK2fpfTGFlNUoFxyTTaNq9HE3ZpvSHbo9C/VbhXzivOMlxhStlnULx
	e1nYvimg/fMI23vr6N3pKoaTtkP3ADqP3WopxMaqQVcUvSWVKh1X9F5KK0osG+p4OJeGSYiizEQ9B
	Qi60sdDDCD0nPb3382tRm2WT1WnBuIcTkyv/oKrgLAV7gnGs07GwEnnZxxQwO8JFKnmXAqROB9NX6
	mw4aQ3jrKNnpYO89Mkyz9NAlNpdrzOdnUlGHCMljvPBgB249F1AssK+v28JCRHZwjWvqTicaEYpKu
	kUg3AjFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vajGA-00000005RwG-296L;
	Tue, 30 Dec 2025 23:36:14 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vajG8-00000005Ru9-12kF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 23:36:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1767137768; bh=fRbNyr2cuRipwrLi8FVp7melLLkMjoIZA13ghnT0lS8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sMi7S4cKutKVX/HnKgs8r+o63CntnvognGZ5p1Um4zhoI7xXB6za5k1FWWfO2aD5o
	 HT7Z9Gip4Qd9f8KPmAcD8xHjvnTvImNtISAUsjqhdOH+xOyYS9TJ/Jqc+l96R63RtN
	 PxWBbyBot3UXTxrLZLYitjTo3DJaBdJ0XKKBNlH4kMCc6bWYO/K7zQfx06Ieak4ut0
	 0k90B4qlINbi2FxAPyn34tR9gbAGx/LMVFdWKQuxGg3WB9bOAtWK5GtivPP2FlbWUG
	 2DN7mpEm5fXaMIzkhWD7pwOx0NVm0lDV/AD0mvUc7H/xDfqYxZiAiPkr5S/uwDEz1s
	 Y86kuLCx27FtQ==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id BD7103E956D;
	Tue, 30 Dec 2025 23:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1767137768; bh=fRbNyr2cuRipwrLi8FVp7melLLkMjoIZA13ghnT0lS8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sMi7S4cKutKVX/HnKgs8r+o63CntnvognGZ5p1Um4zhoI7xXB6za5k1FWWfO2aD5o
	 HT7Z9Gip4Qd9f8KPmAcD8xHjvnTvImNtISAUsjqhdOH+xOyYS9TJ/Jqc+l96R63RtN
	 PxWBbyBot3UXTxrLZLYitjTo3DJaBdJ0XKKBNlH4kMCc6bWYO/K7zQfx06Ieak4ut0
	 0k90B4qlINbi2FxAPyn34tR9gbAGx/LMVFdWKQuxGg3WB9bOAtWK5GtivPP2FlbWUG
	 2DN7mpEm5fXaMIzkhWD7pwOx0NVm0lDV/AD0mvUc7H/xDfqYxZiAiPkr5S/uwDEz1s
	 Y86kuLCx27FtQ==
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 369463E9491;
	Tue, 30 Dec 2025 23:36:08 +0000 (UTC)
Message-ID: <9bb897bd-a7b1-442b-8931-dac9826de2c9@mleia.com>
Date: Wed, 31 Dec 2025 01:36:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm: dts: lpc32xx: add clocks property to Motor
 Control PWM device tree node
To: Rob Herring <robh@kernel.org>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20251228224907.1729627-1-vz@mleia.com>
 <20251228224907.1729627-3-vz@mleia.com>
 <20251230175933.GA864856-robh@kernel.org>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20251230175933.GA864856-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251230_233608_792516_4FCC31B4 
X-CRM114-Status: GOOD (  16.24  )
/bin/ln: failed to access 'reaver_cache/texts/20251230_233608_792516_4FCC31B4': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_233608_792516_4FCC31B4 
X-CRM114-Status: GOOD (  16.77  )
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

On 12/30/25 19:59, Rob Herring wrote:
> On Mon, Dec 29, 2025 at 12:49:07AM +0200, Vladimir Zapolskiy wrote:
>> Motor Control PWM depends on its own supply clock, the clock gate control
>> is present in TIMCLK_CTRL1 register.
> 
> You say it is required, so does that mean this hasn't ever worked? Or it
> happened to work because something else turned on the clock?

There is no upstream driver for this particular PWM controller, I'm about to
submit one though, and so far I've completed my review of its dt properties.

>>
> 
> Fixes tag?

It'd make sense, however as I've said above formally there is no fixed
runtime bug, if the scope is limited to the upstream only.

Fixes: b7d41c937ed7 ("ARM: LPC32xx: Add the motor PWM to base dts file")

>> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
>> ---
>>   arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
>> index 39af48470ed5..abd401fda94e 100644
>> --- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
>> +++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
>> @@ -304,6 +304,7 @@ i2c2: i2c@400a8000 {
>>   			mpwm: pwm@400e8000 {
>>   				compatible = "nxp,lpc3220-motor-pwm";
>>   				reg = <0x400e8000 0x78>;
>> +				clocks = <&clk LPC32XX_CLK_MCPWM>;
>>   				#pwm-cells = <3>;
>>   				status = "disabled";
>>   			};
>> -- 
>> 2.43.0
>>

-- 
Best wishes,
Vladimir

