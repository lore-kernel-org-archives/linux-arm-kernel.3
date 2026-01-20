Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B06CA5FAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 16:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SWKDkqyW8KmfpO3IzczC0y2n+YeQvtr43F4lJQkgy4M=; b=vUx3qnV88quoL00cQFp0X4lUbg
	XexmQfcQ9SOKv4uW5yN7MQIcMe19sHNvkmZpG2AperrT9Fv5jPjlE6/LciJraQ8ymJxdSVtJ8+GCU
	Wlep0LgNldE3tWYnae8urxHvgBnWqsuKpmZGh4JFTE8/7cyt+ye1rn19FZfqTwlkd8mzqo3o1xNzx
	5/Xt7I0GCpv3amswR2PlD9bdIPZl5iJhdLjACsqgrVSu3x7oNwP0rsvRLQX/52/a9kmnN2cpsZelR
	X+BQi4S3PIgFzU4lU90B/LRoIoBt3ZQdINBDolhObJojoKEic0KKG0O+1izoFNH0oEPBwO5cCmyMd
	nICnoDDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viEl8-00000004Bjp-1JCQ;
	Tue, 20 Jan 2026 16:39:14 +0000
Received: from relay2-e.mailbaby.net ([66.45.233.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viEl6-00000004Bj9-2KmF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 16:39:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbaby.net;
 q=dns/txt; s=bambino; bh=SWKDkqyW8KmfpO3IzczC0y2n+YeQvtr43F4lJQkgy4M=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=XPASdssedDRNEIDPJVTQbEjonI9H3/Zqr66oOMmmT9etfqzvQFT7CgiCb4lbdnAPvrRgAs+li
 NND8fNq19Z6sc4kuPMABvR6N4H4ZbXAA/6W1rofjwVuAy9fAGy7d0aOJiZQgpLUwNW5upyyU54E
 Fyqrixf+OTfItkkCGdkBDvo=
Received: from mb-nj-kvm1.internal (mb-nj-kvm1.internal [10.10.2.10])
 (Authenticated sender: mb25440)
 by relay2-e.mailbaby.net (MailBabyMTA) with ESMTPSA id 19bdc4626570002be1.001
 for <linux-arm-kernel@lists.infradead.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 20 Jan 2026 16:39:03 +0000
X-Zone-Loop: 3ad437f3c73d62937e41152ba2078ee49bdc2e9e78bc
ARC-Authentication-Results: i=1;	rspamdcluster1.mailbaby.net;	auth=pass
 smtp.auth=mb25440 smtp.mailfrom=git@luigi311.com
ARC-Seal: i=1; a=rsa-sha256; d=mailbaby.net; s=detka; cv=none;
 t=1768927144;
	b=vkCufa9/nImNQQhLjxf62rw8fAhFKLXb35HtR5UmSR13SdX1EUmVxYHO3pgqphSN6CiE+3
	WphKIVfO6PX9fMHPaZOR25p7v7koqz1zlz1Tm+z+fOLwZGINfvTZd0jnRHb1/mNxHt3AaW
	R1iMskkgfggvRe7wQGDoCs9m2/quOSrz/2p2YV/WMhh//VcpJ4Xkzs6AgkEWW+OGU4a0LU
	Pg4crG5ayxlGUIqNtX1U4lJwTz0k7ipfky/2FsNvMq/Gy/276SoRjumEal6DzhemVzzauS
	dCU6uonsVNMlqy7QwQJzXxteKRf6FmgIGIObuU6KjctSQeIEzSqnvHyjYPG3JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailbaby.net;	s=detka; t=1768927144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=SWKDkqyW8KmfpO3IzczC0y2n+YeQvtr43F4lJQkgy4M=;
	b=EYVVrr3crUThWKRJ0hgz9Fm2FqK504gxB/o4TfvRgC09/HmEpdp5Y4cGQK6SgPfm2wLGt9
	zbVhWBmZLeaVSxiE63UH5Wy93MEYVv0ff6KTD84cHbf3yrs3JjR8UO16mxyGjFM2vEmC8o
	eJjusdVGYDYrUHoiAlr2u8igH1CRDNEDx7fVZUv7Dbb6rmQ3Enf364mcKpPFHjol7OMwfg
	CL3Qc0k0fOqgVlQOFYvvLaXuw31o7HjGAKbqpKJIgDrqZTiAIo9cNLzOpcXtdLeZjuo0C6
	M3mRXYNjHOdxV3zU2MZRKwJicK5QSUGsUsCeuBjW+Y2Ntv5DZqqXbch4W7s3Hg==
X-MB-ID: mb25440
X-SPFOrigin: SoftFail
Feedback-ID: mb25440:19bdc4626570002be1:45.76.59.163:mbaby
X-MAILBABY-ORIGIN: NONE
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by zmta1 (ZoneMTA) with ESMTPSA id 19bdc41458e0009140.002
 for <linux-arm-kernel@lists.infradead.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 20 Jan 2026 16:33:43 +0000
X-Zone-Loop: 0b556dca26fe1fef49f2960e192b1db5f444f7336983
X-Originating-IP: [136.175.111.3]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	From:References:Cc:To:Subject:MIME-Version:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=SWKDkqyW8KmfpO3IzczC0y2n+YeQvtr43F4lJQkgy4M=; b=WwgAMc
	rRgE56fVRbNmofeg88mwIa768qT2AU2bic4rTmwYJfSOL/PgEXQVLDxrTuSdRPaQQx+0jXmAB9arZ
	motqrjfpIiRKlTxVf4BSIc20we4aC/jVODYrX+ItoyKK/GDHmqFDihIV1IZo/kWUgRoTVG7zenB4X
	nlLrY/k5QE8oBdaIUpK7Q3iw3E7ghQqmxcHfzo9OMt79ZiI2+t8AOrwH6GRpacz91L/+BnKHiMHV4
	y/qXfDWu306bfzQfvjivBiHGerWLUnL3xoun2l8yjglc1wXkzDBXNZmtvRmIgxld6vecTWwRTxePL
	jzPxszVgFs/s4tjYEhqjFZRP/S9w==;
Message-ID: <46730110-5713-4e7a-a593-29ad69432e03@luigi311.com>
Date: Tue, 20 Jan 2026 09:33:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] Fix imx258 variant on pinephone pro
To: Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Olivier Benjamin <olivier.benjamin@bootlin.com>, megi@xff.cz
References: <20260118214620.3319040-1-git@luigi311.com>
 <176890189889.310054.17634541522861042266.b4-ty@sntech.de>
Content-Language: en-US
From: Luis Garcia <git@luigi311.com>
In-Reply-To: <176890189889.310054.17634541522861042266.b4-ty@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authenticated-Id: git@luigi311.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_083912_728870_03586530 
X-CRM114-Status: GOOD (  13.02  )
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

Thank you very much for the speedy turn around. Ohh

interesting, here i was thinking i did the right thing with

the reply to with the V2. Ill keep that in mind for the

future but considering how far and few my contributions

upstream are i hope i dont forget by then lol.


On 1/20/26 02:39, Heiko Stuebner wrote:
> On Sun, 18 Jan 2026 14:46:19 -0700, Luis Garcia wrote:
>> imx258 had the driver updated a while back and it introduced
>> two variants, the imx258 and imx258-pdaf. The pinephone pro
>> is using the pdaf variant so this switches it to the correct
>> variant and eliminates the pdaf pixels from the sensor output
>> resulting in a much cleaner image.
>>
>> Luis Garcia (1):
>>    arm64: dts: rockchip: Fix imx258 variant on pinephone pro
>>
>> [...]
> Applied, thanks!
>
> [1/1] arm64: dts: rockchip: Fix imx258 variant on pinephone pro
>        commit: 6742b998166485558ccb0e89b5d5fd93c1aae3ca
>
> In the future, please don't send v2 patches as replies to the
> previous version and instead start a new thread.
>
> Next versions as replies, does sometimes confusing tooling.
>
>
> Best regards,

