Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F36C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 15:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Avx9tdK85l3d/nVpozm+EccWjdAmRqwmN4UjN0biPaQ=; b=c3+cOvyCd1DZdXOuWMxG98wsQL
	AFAU6CUL2klG/Jz1Pjrc9JyF9Ej2P3e1GzSlKeVxJohPm5TgFzt5fbmyEb5fa0ETpsItqIdv2I4Nk
	7kskp9hyT00+Ne9ikpBV/sKOqdqBN7bhasVbYjDagb8wluvUcBnYjZsMeaUWXkzGLvzRIY4/MJZQs
	i7RJtaGJ6/z1LINx7bt2T6vXkcgKdBvIvM+Zu2rcZ7lcBNNZGwG8jSgAcwB6Ba57XB1LQIWSOWJyl
	JhXvDwGTSQlGPQDIPBZWxt3ixAwm0Vu8V5KZAa2cz1laYwH/rk7LJQg81YpFljns1B8tXW1FQH//M
	2IYAtyYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAVvo-0000000G5nZ-0EaN;
	Thu, 01 May 2025 15:34:36 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAVts-0000000G5dd-3rLR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 15:32:38 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 541FWDb4030130
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 May 2025 10:32:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746113533;
	bh=Avx9tdK85l3d/nVpozm+EccWjdAmRqwmN4UjN0biPaQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=V9jgnpewHDIsQyhE5/cdnlw/0vRRYASnMCSFBjujTDZN/d3iJKByTWOnhaF+uTO9J
	 9KVDiQnd5Vo4HuqNr8uOluLPNMR1A/+jd3gw/LKhIH1ovbRmyHb9ftN+0iOVh9n3g+
	 U/kKT0xK48cjKq1yF6vHaefbpwG9gAgkmjJhYSS4=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 541FWDY2112900
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 May 2025 10:32:13 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 May 2025 10:32:12 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 May 2025 10:32:12 -0500
Received: from [128.247.29.251] (dmz007xyy.dhcp.ti.com [128.247.29.251])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 541FWC3n116896;
	Thu, 1 May 2025 10:32:12 -0500
Message-ID: <23eeda43-a938-4c15-aee3-b1b9df217ff8@ti.com>
Date: Thu, 1 May 2025 10:32:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: tps65219/am62p kernel oops
To: Francesco Dolcini <francesco@dolcini.it>
CC: Andreas Kemnade <andreas@kemnade.info>,
        Jerome Neanne
	<jneanne@baylibre.com>, Mark Brown <broonie@kernel.org>,
        Nishanth Menon
	<nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo
	<kristo@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Kevin Hilman
	<khilman@baylibre.com>,
        Roger Quadros <rogerq@kernel.org>, Tony Lindgren
	<tony@atomide.com>,
        Liam Girdwood <lgirdwood@gmail.com>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <aBDSTxALaOc-PD7X@gaggiata.pivistrello.it>
 <20250429185240.6a7644bf@akair> <20250430080109.GA65078@francesco-nb>
 <aBH5s7p2RxLGjTQD@gaggiata.pivistrello.it>
Content-Language: en-US
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Organization: PMIC
In-Reply-To: <aBH5s7p2RxLGjTQD@gaggiata.pivistrello.it>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_083237_383991_2E168A89 
X-CRM114-Status: GOOD (  20.27  )
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

On 4/30/25 5:21 AM, Francesco Dolcini wrote:
> On Wed, Apr 30, 2025 at 10:01:14AM +0200, Francesco Dolcini wrote:
>> On Tue, Apr 29, 2025 at 06:52:40PM +0200, Andreas Kemnade wrote:
>>> Am Tue, 29 Apr 2025 15:21:19 +0200
>>> schrieb Francesco Dolcini <francesco@dolcini.it>:
>>>
>>>> Hello all,
>>>> while working on adding support in mainline for a new board based on TI
>>>> AM62P SoC I noticed the following Kernel Oops.
>>>>
>>>> This oops was reproduced running current Linux
>>>> master, 6.15.0-rc4+, ca91b9500108d4cf083a635c2e11c884d5dd20ea, but I was able
>>>> to reproduce the same with 6.14.4.
>>>>
>>> [...]
>>>> [  +0.000022] Call trace:
>>>> [  +0.000011]  regulator_notifier_call_chain+0x20/0xa4 (P)
>>>> [  +0.000018]  tps65219_regulator_irq_handler+0x34/0x80
>>> wild guessing: maybe because irqdata->rdev is not initalized in
>>> _probe()? At least I do not see where it would be initialized.
>> your wild guess seems correct, I'll send a proper patch with your
>> suggested-by after doing a couple of more tests, thanks.
> so, the bug is clear, however the fix is not an obvious one liner as I was
> wishing.
>
> we would need to add a link from each of the interrupts to the specific
> regulator. as of now such a connection is not existing in the code.
>
> I would not have the time to fix the code in the next few days, if someone is
> able to pick this up before, just let me know ...
>
> Francesco
>
I'll try out implementing and testing the solution, but will get to it early next week. Will email with any updates!


-- 
Best,
Shree Ramamoorthy
PMIC Software Engineer


