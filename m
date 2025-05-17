Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90ED8C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 May 2025 14:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7IOuaMKyisyS5R2HhVv9ZQaXuplreFhDZhUHiUevSKA=; b=l+VgosRPIWYcCpHrrDMN/Rf2xM
	zGDOx4UEqeSDiw7114xmKHvfJLkPOklb4rWGMOeQi0QQpp1iLgv27TpoNUhWUCpoxPd20RVBFetaK
	bA+8J89+3pB+Kswm0z4LTnhMGhazG/4HT5JhzTD7C1wSyrGVwD52zSm3hdb5LkeX8lKxqORQBbdxZ
	2rNACsQwrFY6sVJOY+kz7K/KgnzWmdJUT2WC8ow4TyvSE6HLv5wicyq32yGV2BPTl5AzgFupMjrwq
	Vhqmp4pJqqzG1i7nT418EkMNlxAUjDQL9MBm2GfqV+gHLXDgHSrKAhfSsMi7BbBCXu/ctCRwAsfSO
	X7Vg4reA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGIC7-00000005nnS-36ad;
	Sat, 17 May 2025 14:07:19 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGIA7-00000005nZS-3PKc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 May 2025 14:05:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1747490714; bh=XC2yvQ/phwdwbNpoDCMdIp7eMzYCWnTFY+wKPxwsz/g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LLM8RqC3m5ulNp8y/PthQxJaBFjWQQ2BoAxPfcxM2mKbYo7Iaann7PCMZFFVdQ7gF
	 8FOahPWY0DdHJe6oLKVJPa9s6onLRh3oMEO2dhSAB1hXbLf4T3AW6Y6ql/wAVOODmF
	 qUvQWW2lTGb88mY3rpqXurjFbiYx2FsZvITC6XXtwq37RmK2pw5qOEVSNJ3t90hWxg
	 Hey41SYCPPm66bZ35lKSX/+1zRT5n9Xjr3GGnICR0MVQYjbVjIxrMQigBbwtWGGht5
	 Gr2UFVJqlKzXNfYjuLGEJ6NrCRhuwTTXmHNV3HNf8S0sSffd+krGkND2QxTPsmlKSM
	 ywszKUSPkfTTA==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 914B23BAD92;
	Sat, 17 May 2025 14:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1747490714; bh=XC2yvQ/phwdwbNpoDCMdIp7eMzYCWnTFY+wKPxwsz/g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LLM8RqC3m5ulNp8y/PthQxJaBFjWQQ2BoAxPfcxM2mKbYo7Iaann7PCMZFFVdQ7gF
	 8FOahPWY0DdHJe6oLKVJPa9s6onLRh3oMEO2dhSAB1hXbLf4T3AW6Y6ql/wAVOODmF
	 qUvQWW2lTGb88mY3rpqXurjFbiYx2FsZvITC6XXtwq37RmK2pw5qOEVSNJ3t90hWxg
	 Hey41SYCPPm66bZ35lKSX/+1zRT5n9Xjr3GGnICR0MVQYjbVjIxrMQigBbwtWGGht5
	 Gr2UFVJqlKzXNfYjuLGEJ6NrCRhuwTTXmHNV3HNf8S0sSffd+krGkND2QxTPsmlKSM
	 ywszKUSPkfTTA==
Message-ID: <38a9a30a-6dc2-4006-8f99-55c2f6562ffb@mleia.com>
Date: Sat, 17 May 2025 17:05:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: lpc32xx: Add #pwm-cells property to the two SoC
 PWMs
Content-Language: ru-RU
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Arnd Bergmann <arnd@arndb.de>
Cc: Purva Yeshi <purvayeshi550@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
References: <20250403104915.251303-2-u.kleine-koenig@baylibre.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20250403104915.251303-2-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250517_140514_616630_160D82ED 
X-CRM114-Status: UNSURE (   7.46  )
X-CRM114-Notice: Please train this message. 
/bin/ln: failed to access 'reaver_cache/texts/20250517_140514_616630_160D82ED': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250517_140514_616630_160D82ED 
X-CRM114-Status: GOOD (  11.06  )
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

On 4/3/25 13:49, Uwe Kleine-König wrote:
> If these PWMs are to be used, a #pwm-cells property is necessary. The
> right location for that is in the SoC's dtsi file to not make
> machine.dts files repeat the value for each usage. Currently the
> machines based on nxp/lpc/lpc32xx.dtsi don't make use of the PWMs, so
> there are no properties to drop there.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

Arnd, it would be great, if the change is picked up by you.

Thank you so much!

--
Best wishes,
Vladimir

