Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BA6D5B154
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 21:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CY+XwZ0fuc1pJBzr3ZbrtC3qPygvT+6N7jxEZ8PMcdI=; b=RwVhz8MMAMOpEZKbUxguDGt7kP
	HsXorwfBDzMWetQSIVtv375fSoXZrAFY/5h18+XqxwEyWyT4HQ1GgYC9qo1Ns9VGKAR97mU8ARHgQ
	Zaqg0eZ9faTSNZuKzoArJ8PTNlk9u6EKXrs4leQXWu/fZMMuSCH7OcXJqNZgYx8ku8tbJrf0c6RWM
	+hwn3JscU42P9k5og4I1F1bis/MRecxvfDNZkIgHtbawLpvNdbY4zso4q/H48qIxAzSvv5t8hUsJH
	DK2WeiRd7OsYGo6o/NDMe0vKJBXZzM9qYZHDf98WF2QIE0amlGVQuG4Rp1MmDYX/Wv1khlaFiOsTT
	4IQtTp/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5XIN-0000000CKlq-4ATR;
	Mon, 28 Oct 2024 21:29:04 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Wbb-0000000CELC-0LOi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 20:44:52 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1730148280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CY+XwZ0fuc1pJBzr3ZbrtC3qPygvT+6N7jxEZ8PMcdI=;
	b=V4msOG75IkYLOHuvX3IjHDPHm/gxy4ZUnk0PDBO8WsGVwRNG0V3ymYOSNTwnkjqkg02iRH
	zA0RtCZwy9wwafaGfqKwnI/d+o1keEyBbYQS5k3q9iNnp3zzLB/9g0HvCd1YZpyOLX9qVE
	YHMg0moOoeDHs9MrGBLMBmrLn3t3UKairICOMRfmWE10lwkQT18Ma7ChZORbYgT4lo7OJt
	rxp9UV/5Z3v3xW4LV/y0c7vmb/rB+d6sBpj9PkGVyL8NCjMPO1vauLAMJAOaTCcoRlfbLf
	NfZuGHCgrPppLYL8OgVJB+q9FtNP46+UerKpV0ISmjaSsZgh6LBYZdHT76YIHQ==
Date: Mon, 28 Oct 2024 21:44:37 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Aren Moynihan <aren@peacevolution.org>, Jonathan Cameron
 <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Kaustabh
 Chakraborty <kauschluss@disroot.org>, =?UTF-8?Q?Barnab=C3=A1s_Cz=C3=A9?=
 =?UTF-8?Q?m=C3=A1n?= <trabarni@gmail.com>, Ondrej Jirman <megi@xff.cz>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 3/6] iio: light: stk3310: Implement vdd and leda
 supplies
In-Reply-To: <Zx-h7QUnCKwtu8iC@smile.fi.intel.com>
References: <20241028142000.1058149-1-aren@peacevolution.org>
 <20241028142000.1058149-4-aren@peacevolution.org>
 <Zx-h7QUnCKwtu8iC@smile.fi.intel.com>
Message-ID: <98dd3fbf970559de8b7559da312e22fc@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_134451_313511_1328365D 
X-CRM114-Status: GOOD (  16.46  )
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

Hello Aren,

On 2024-10-28 15:38, Andy Shevchenko wrote:
> On Mon, Oct 28, 2024 at 10:19:57AM -0400, Aren Moynihan wrote:
>> The vdd and leda supplies must be powered on for the chip to function
>> and can be powered off during system suspend.
>> 
>> Co-developed-by: Ondrej Jirman <megi@xff.cz>
> 
> Missing SoB. Please, read Submitting Patches documentation for 
> understanding
> what has to be done here.
> 
>> Signed-off-by: Aren Moynihan <aren@peacevolution.org>
> 
> ...
> 
>> Notes:
>>     I'm not sure what the proper way to handle attribution for this 
>> patch
>>     is. It was origionally based on a patch by Ondrej Jirman[1], but I 
>> have
>>     rewritten a large portion if it. I have included a Co-developed-by 
>> tag
>>     to indicate this, but haven't sent him this patch, so I'm not sure 
>> what
>>     to do about a Signed-off-by.
> 
> Ah, seems you already aware of this issue. So, either drop 
> Co-developed-by
> (and if you wish you may give a credit in a free form inside commit 
> message)
> or make sure you get his SoB tag.

Perhaps the best and also easiest solution would be to provide an
Originally-by tag for Ondrej, because that's what it is.  The patch
was written originally by Ondrej, but you've changed many parts of
the patch while upstreaming it.

