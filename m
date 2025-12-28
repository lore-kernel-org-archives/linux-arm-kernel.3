Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8764E784BE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 22:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZg9FjM+LWokd594jjLvRQEX0+aDCJneaYOmC2or71k=; b=xqYeo5xHdbrK7g8O7WvUMr9zXV
	ukJBJGp408qiSw1F7vow3WqwuaDGiA2uWZNtT8EcnzVhlzbTGREID4tfwcwhIRzhf7jmVdF2RHEFz
	zZEB+RyUhjbvi6zWxwS6UgiiZKkGVLzzsUUpfpwbuCiwNS23NyCbCtWFMP5YR0emAAKpZ0WzB3KNn
	l139umTeBmoC07XAYb6l08BX9ADiQV2Fc9BlYmbYHAe2KjIx20am/+Lk20B1JbxMvuPJzjGgJ66FT
	r1CMEvWxIqAA1TGVPlFnoQBAs47JCCRWcm/f+7OXM4FianIoF4LrYZ2KW7igLGU0FV+HuLKw/OyE4
	xC1SPV1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZz8o-000000033ig-0IBE;
	Sun, 28 Dec 2025 22:21:34 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZz8m-000000033iO-1eRP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Dec 2025 22:21:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1766960488; bh=CpO1rSWzqrOyPAFxxg06leQheFevM1H2QpJi0wSDqJs=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=sBJ7fvuGIg/zQfIUn4Cz5efgPja03YYCu1+GiDuyjEGH+FZOuEUEHokd0fK979Ypr
	 Qm/Xr+6rsTJZyf+N6X/40Chug7tBsGm/AvGUWt/ClvQrdX+Zz+nzIL9mL3bGscEui6
	 3izWdiSNXGCnD21FqOKQQNpWRGp9FMNM10NQnyqSJ65x4YphK96HfUoo1Ghy6So3UJ
	 e4Z7UOYdUq65ynYWPkTak/tn3vWoscveSE5zwnsY4XbFABUVIbacmXYDsTJBf4ZTC6
	 Ad6k4zdNVTbULJevV966UtCiqdfCJsXPwTP2Zs/bbWOyGv0RxVwMMONhdkmLfF6t6D
	 BHsN6KtaQZRwA==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 981B53E90D7;
	Sun, 28 Dec 2025 22:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1766960488; bh=CpO1rSWzqrOyPAFxxg06leQheFevM1H2QpJi0wSDqJs=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=sBJ7fvuGIg/zQfIUn4Cz5efgPja03YYCu1+GiDuyjEGH+FZOuEUEHokd0fK979Ypr
	 Qm/Xr+6rsTJZyf+N6X/40Chug7tBsGm/AvGUWt/ClvQrdX+Zz+nzIL9mL3bGscEui6
	 3izWdiSNXGCnD21FqOKQQNpWRGp9FMNM10NQnyqSJ65x4YphK96HfUoo1Ghy6So3UJ
	 e4Z7UOYdUq65ynYWPkTak/tn3vWoscveSE5zwnsY4XbFABUVIbacmXYDsTJBf4ZTC6
	 Ad6k4zdNVTbULJevV966UtCiqdfCJsXPwTP2Zs/bbWOyGv0RxVwMMONhdkmLfF6t6D
	 BHsN6KtaQZRwA==
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 312F53DAF7E;
	Sun, 28 Dec 2025 22:21:28 +0000 (UTC)
Message-ID: <379f38ac-ab4a-4615-894b-e404bea4a6a1@mleia.com>
Date: Mon, 29 Dec 2025 00:21:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 0/2] ARM: dts: lpc32xx: set DMA and NAND flash
 controller properties
From: Vladimir Zapolskiy <vz@mleia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20251225203157.1414349-1-vz@mleia.com>
In-Reply-To: <20251225203157.1414349-1-vz@mleia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251228_222128_636837_195F82B6 
X-CRM114-Status: GOOD (  14.03  )
/bin/ln: failed to access 'reaver_cache/texts/20251228_222128_636837_195F82B6': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_222128_636837_195F82B6 
X-CRM114-Status: GOOD (  18.83  )
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

On 12/25/25 22:31, Vladimir Zapolskiy wrote:
> The changeset adds a numbed of necessary properties to ARM PrimeCell
> PL080 DMA controller and to SLC and MLC NAND flash controllers, and now
> it obsoletes the platform data of the controllers populated on boot.
> 
> To respect any probable users who does not update dtb on the boards,
> the platform data cannot be removed instantly, but now it's time to
> declare one year timeout for such a synchronization to be completed,
> the platform data of DMA and NAND flash controllers will be removed by
> the end of the next year.
> 
> The changeset is based on top of the previously sent changes:
> * https://lore.kernel.org/linux-arm-kernel/20251224165845.1261926-1-vz@mleia.com
> 
> Note, the changeset is marked as the resent one, it's identical to the one
> https://lore.kernel.org/linux-devicetree/20251225180230.1400420-1-vz@mleia.com/
> but now the changeset appears on the linux-arm-kernel mailing list as well.
> 
> Vladimir Zapolskiy (2):
>    ARM: dts: lpc32xx: add DMA controller properties to the device tree node
>    ARM: dts: lpc32xx: add DMA properties to NAND flash controllers
> 
>   arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 

Found a previously unapplied change, which is more comprehensive and
substitutes this series, still have to add {lli,mem}-bus-interface-ahb2
property to the DMA controller device tree node:

https://lore.kernel.org/linux-arm-kernel/20240627150046.258795-6-piotr.wojtaszczyk@timesys.com/

Will apply the one from Piotr.

-- 
Best wishes,
Vladimir

