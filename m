Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A06FECEACF9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 00:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UcjbInA0psQ6pcmlO9SmFzKg8J2MfBvUl1exvv5uWJU=; b=kpFtCZ7Ry8Ko39UcmynSlgVIQE
	8Kh9DXb8Mf2uH/+aNnHKIxTfaq41c2xWTK3Fo8PXuTJElNS7PeSMi2tVfaD/gbW6nAaiM0JRZ+4k8
	/xx0n9AjqCQd9Z6c1FtTRdwO04ADcGAVk9I5xHXucbCuFAPwV3cfjh4vT9yRMuvhFqA8Fd6GQ1bHd
	Hw1zmtNEIjMGlEHK0QN/9z1meoD7grUJ0/Q39JqAjB4/hR8xcw4vsX9JD6WiaUZrAY5uSu7vxUO9Y
	Kyam4jLpw1hB+iVVDIi30IQMTdzi09P9u4vS+9qrhw5B+5bGL4xxK0hcM+8dInO92pZuKaD5d8cPL
	CecOw0ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK3xf-0000000DGRk-04yv;
	Sat, 15 Nov 2025 00:16:15 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK3xY-0000000DGR6-2Aro
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 00:16:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1763165765; bh=U3Vdu/lF1NOoptVfbcwB+PehQp1h+KtWDf1t6cJ2e+4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X+55deDZLoypUbDpIedjmcAHsL/d/z7aadsLHsHez+sMSuE6u0RpPhbdnUA9jEWvk
	 hdqcqT412weiG7qMZSCuZwbiJLgER0sqJFb9jWHyCaLdgFLByAetnKMr4BcLRMgkTB
	 3axPu9zIi2ado43HQ2ppXo5Yt6CS/Vazq2mgNMG1crsQBGt9UMSU6gek15fCNBG2C2
	 ZsIsAjcre0pNVHTmkv4R6AA0AAtqf3ualrrw1ddqsQnlxx9NXTosjGQhFlQLKYbkHY
	 ijSfmZNVoNhdrYolgIJwbKfeJNc82CiKcGitRGz2GIidK5z3cpbEbhCAYK3dzbskU1
	 wOayMIIzhN+7g==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 26F363E101C;
	Sat, 15 Nov 2025 00:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1763165765; bh=U3Vdu/lF1NOoptVfbcwB+PehQp1h+KtWDf1t6cJ2e+4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X+55deDZLoypUbDpIedjmcAHsL/d/z7aadsLHsHez+sMSuE6u0RpPhbdnUA9jEWvk
	 hdqcqT412weiG7qMZSCuZwbiJLgER0sqJFb9jWHyCaLdgFLByAetnKMr4BcLRMgkTB
	 3axPu9zIi2ado43HQ2ppXo5Yt6CS/Vazq2mgNMG1crsQBGt9UMSU6gek15fCNBG2C2
	 ZsIsAjcre0pNVHTmkv4R6AA0AAtqf3ualrrw1ddqsQnlxx9NXTosjGQhFlQLKYbkHY
	 ijSfmZNVoNhdrYolgIJwbKfeJNc82CiKcGitRGz2GIidK5z3cpbEbhCAYK3dzbskU1
	 wOayMIIzhN+7g==
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 951E83E16D7;
	Sat, 15 Nov 2025 00:16:04 +0000 (UTC)
Message-ID: <37edb265-90ff-43cf-bfeb-3371f12c78a8@mleia.com>
Date: Sat, 15 Nov 2025 02:16:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] ARM: dts: lpc3250-phy3250: add at25 required
 properties
To: Frank Li <Frank.Li@nxp.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "moderated list:ARM/LPC32XX SOC SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20251114174712.1206027-1-Frank.Li@nxp.com>
 <20251114174712.1206027-3-Frank.Li@nxp.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20251114174712.1206027-3-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251115_001605_176339_239D3181 
X-CRM114-Status: GOOD (  14.20  )
/bin/ln: failed to access 'reaver_cache/texts/20251115_001605_176339_239D3181': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_001605_176339_239D3181 
X-CRM114-Status: GOOD (  16.35  )
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

Hi Frank.

On 11/14/25 19:47, Frank Li wrote:
> Add at25 required properties (size, address-width and pagesize), which
> duplicate deprecated properties.
> 
> Fix below CHECK_DTB warning:
>    arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: at25@0 (atmel,at25): 'pagesize' is a required property
>    arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: at25@0 (atmel,at25): $nodename: 'anyOf' conditional failed, one must be fixed:
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - move node name change to new patch
> ---
>   arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts b/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts
> index 21a6d0bca1e8a..732d590f6cfdf 100644
> --- a/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts
> +++ b/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts
> @@ -216,6 +216,10 @@ eeprom: at25@0 {
>   		at25,byte-len = <0x8000>;
>   		at25,addr-mode = <2>;
>   		at25,page-size = <64>;
> +
> +		size = <0x8000>;
> +		address-width = <16>;
> +		pagesize = <64>;
>   	};
>   };
>   

I see that I was imprecise in my ask, please replace (remove) the deprecated
properties with the new ones added. There is no reason to keep both, forward
compatibility should not be supported.

Sorry for any caused confusion.

-- 
Best wishes,
Vladimir

