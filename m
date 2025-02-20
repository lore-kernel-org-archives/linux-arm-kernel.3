Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9D7C021B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 05:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8osLsKSgydSwhw4gROThJbyX6R2+o/ZDIgdC95qqlFk=; b=NBiN/f4FyA9DpKzz2uxpQwyrq+
	v6xDgRJbfbTG4Qsog7RbYXGF/jU/lT7YhDixi6I+k/VVJEexvXkFnn7Xl0ZnmnN0d2FZMrinkeUuH
	+/8auYZMON7SniFSzuWeDjhf5jDLO4euIPK9L09sNzllf7+TWl9p+jO2LG+0w94wSPs3k5nr3NOUn
	VM9v8V1XUoFuHD6K4grNJ3SvkPcj83F92nM3jkRZujhOWiN0wqiMCMUDCfZE/8oCntj/8PSergijZ
	T8GPXopZ2E/MhVlsrNojOLsyC7dQLVoCTIrSu1rki1iQrQXJS3/6ty7pCvofxy8CsPqY540Z9Pki6
	RfDsd2SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkz8S-0000000Go3b-2Bis;
	Thu, 20 Feb 2025 05:30:08 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkz6w-0000000Gnt4-3aRl;
	Thu, 20 Feb 2025 05:28:36 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1740029310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8osLsKSgydSwhw4gROThJbyX6R2+o/ZDIgdC95qqlFk=;
	b=lyqQEu992K0fRqvzMMznMfHvJVxZIkARIAsYxvNOSLBpmuFAOOLYGM40lZFqE91f8jeGt5
	dYxW/14OwcULDLGcyv3qKv4JF/acKYOM3elq7XjDUeRzl5scbXtTs/CVqEdvriM4quqgoc
	xEe9CDjLsIGccr9rMg3cXQABTI6E9gnlvzy3uDIyCPL0uKEtCZ5tpqEwYa7buay0HXS1bh
	9N+HEP7PTvJ/4QpOLidlB4HtrnErluQWQ97+jHk4OM8ciA1gXT0Q7D4W6PSyQPojtfEyff
	FRHFemAaIJDtC2PFv5Xdg1mUT2QpoHhSIQs+Lgzl2BZkggHvHy4BFyq7LWYI4g==
Date: Thu, 20 Feb 2025 06:28:27 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Kever Yang <kever.yang@rock-chips.com>, heiko@sntech.de,
 linux-rockchip@lists.infradead.org, Shaohan Yao
 <shaohan.yao@rock-chips.com>, linux-pm@vger.kernel.org, Lukasz Luba
 <lukasz.luba@arm.com>, linux-kernel@vger.kernel.org, Zhang Rui
 <rui.zhang@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] thermal: rockchip: Support the rk3562 SoC in thermal
 driver
In-Reply-To: <7f17cc55-a741-4bb8-9513-0580ca6fedd3@linaro.org>
References: <20241224094015.3816301-1-kever.yang@rock-chips.com>
 <20241224094015.3816301-2-kever.yang@rock-chips.com>
 <7f17cc55-a741-4bb8-9513-0580ca6fedd3@linaro.org>
Message-ID: <b4ab86b56177a234f3738c477693e858@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_212835_069027_187EB39A 
X-CRM114-Status: GOOD (  11.30  )
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

Hello Daniel,

On 2025-02-11 10:36, Daniel Lezcano wrote:
> On 24/12/2024 10:40, Kever Yang wrote:
>> From: Shaohan Yao <shaohan.yao@rock-chips.com>
>> 
>> There are one Temperature Sensor on rk3562, channel 0 is for chip.
> 
> A bit stingy in terms of description, no ?

[snip]

>> @@ -497,6 +509,45 @@ static const struct tsadc_table 
>> rk3399_code_table[] = {
>>   	{TSADCV3_DATA_MASK, 125000},
>>   };
>>   +static const struct tsadc_table rk3562_code_table[] = {
>> +	{0, -40000},
>> +	{1419, -40000},
>> +	{1428, -35000},
>> +	{1436, -30000},
>> +	{1445, -25000},
>> +	{1453, -20000},
>> +	{1462, -15000},
>> +	{1470, -10000},
>> +	{1479, -5000},
>> +	{1487, 0},
>> +	{1496, 5000},
>> +	{1504, 10000},
>> +	{1512, 15000},
>> +	{1521, 20000},
>> +	{1529, 25000},
>> +	{1538, 30000},
>> +	{1546, 35000},
>> +	{1555, 40000},
>> +	{1563, 45000},
>> +	{1572, 50000},
>> +	{1580, 55000},
>> +	{1589, 60000},
>> +	{1598, 65000},
>> +	{1606, 70000},
>> +	{1615, 75000},
>> +	{1623, 80000},
>> +	{1632, 85000},
>> +	{1640, 90000},
>> +	{1648, 95000},
>> +	{1657, 100000},
>> +	{1666, 105000},
>> +	{1674, 110000},
>> +	{1682, 115000},
>> +	{1691, 120000},
>> +	{1699, 125000},
>> +	{TSADCV2_DATA_MASK, 125000},
>> +};
> 
> May be it is time to optimize all these tables out of the memory 
> driver?
> 
> It is the 9th table introduced.

FWIW, I'm also not a big fan of these tables, and I always feel like
"meh" when I see them.  However, I'm also not a big fan of substituting
them with some kind of formulas, because the SoC TRMs specify exactly
these tables, with some additional notes that the values may change in
future SoC revisions.  In other words, these values may even change at
some point, at least in theory.

With all that in mind, FWIW, I'd rather see these conversion tables
included verbatim in the driver code, because such an approach reduces
the possibilities for some hard-to-spot errors, allows easy, direct
correlation with the TRMs, and should make possible changes to them
in the future easier.

