Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05052CE7B0D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 13:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Cc:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ltz8k3u8rZmtIjFXvmlVeL7Na3l8yY1CcI29CIDeBH8=; b=uiQRs7DWDWcZGj
	xNb7+T5MQgXiawDJwlS3EUHSPouo93elGQcXozpifVnqvRSmB68n0lfmaz0AUFlB/kAByU4eOfn5T
	FxHcdkevAKtSXDrAHP8hzGoJjCWEVic5+LFT14a00KYqy9eHG2qZzp8pPv7GPYtL4HE/S1ZMiY2BA
	1gTaHJnfU4Yl+Ql4guIP98E9No9KZCy7svxPudjM3WEzMscm47H4vHC3owlFAwWyo9Iav5FOoxxeJ
	H4kVdz8yooxrzZp0YyuH4TpbSeoWJC25eAoUdqGiWs8Hgl+VN3nAWYSQx9IsWj3QN8ziTDifA+Bbb
	sLt5yLGQ7/VqTaOZaOiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJuGc-0000000CIdK-0xS5;
	Fri, 14 Nov 2025 13:55:10 +0000
Received: from hedgehog.birch.relay.mailchannels.net ([23.83.209.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJuGY-0000000CIci-454b;
	Fri, 14 Nov 2025 13:55:08 +0000
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 8FC12161F68;
	Fri, 14 Nov 2025 13:55:03 +0000 (UTC)
Received: from fr-int-smtpout19.hostinger.io (trex-green-2.trex.outbound.svc.cluster.local [100.98.40.135])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 54EE0163561;
	Fri, 14 Nov 2025 13:55:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1763128503;
	b=Qq3djHHUXLtIV0KOA7zP8oAJw3dPCAlJGlUFEw6bwzxOo9dGby0E/5MGeAfis6dUmixBNt
	ZaW6gIiVuh1Mzup3daV0RFgTaIFVIxF3cY3U625eCESUw3v/K1B5rYgqg0rWnAzzbAkQ2b
	NBNArOuttj5srfJOr66rnOS3eRTC9a1KR1HlF9JG1wCsw1Cku+3RTEYIVLabUlSlkwHTmS
	4GuWhCjkjnlbkEqSvWyvZ+aflABlV4RGUWQpjya4GzlX8u41LCk+DfYNFAupdt0Jv0kPvO
	aMfsVky2pg97o96LGDMUqNAN1BXOlIZwaog4EBjxl5vQzIx8CTVTCIWB7vidug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1763128503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=Ltz8k3u8rZmtIjFXvmlVeL7Na3l8yY1CcI29CIDeBH8=;
	b=2o6typ87Ts0i6aeT4wTh4gUwo+IHN0jUaYCl7y2pTDTD7UKMZS0HoFtTwGcnXzcc/A0CuT
	RF5mPK6wzGqTyVoQne0JYNcv48HYsEin4H5sLfU7cB0nCTub1ELqcFq0qwTIR2oBJrBG17
	RIQXuqK/3zm2eE8XagGYDvxtgohZRZzyFaO4lQ6lWInXMQYgV6ahEl7zMpATL+MZMRB7Ia
	el4x6uK282H9G5Z8gyZWyCHS+bI6YihFn2+Tx6VsEIVNCUwZh2j7zgb2B78xqhf2nK/V2I
	XiP48s/ALwMO98YXMvPdl4NBNMy+duX3llbeuUWrq3Xv48fz5I0FVT0BHNlJuw==
ARC-Authentication-Results: i=1;
	rspamd-dd986fb9b-ccxbz;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Whistle-Fumbling: 5252974a637cccd2_1763128503386_793807060
X-MC-Loop-Signature: 1763128503386:147308783
X-MC-Ingress-Time: 1763128503385
Received: from fr-int-smtpout19.hostinger.io (fr-int-smtpout19.hostinger.io
 [148.222.54.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.98.40.135 (trex/7.1.3);
	Fri, 14 Nov 2025 13:55:03 +0000
Received: from [IPV6:2a04:cec0:1201:fec6:d861:b290:3e40:1173] (unknown [IPv6:2a04:cec0:1201:fec6:d861:b290:3e40:1173])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4d7JYG2YsGz1xyq;
	Fri, 14 Nov 2025 13:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1763128499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ltz8k3u8rZmtIjFXvmlVeL7Na3l8yY1CcI29CIDeBH8=;
	b=Ev0W1DzaQhLaH39wLycBBuQ74jxm2sddJyHSXF/ujEEYl8iQKsW5CMt+iJ7kTr15fH8UBI
	LsJOuJgJmAlXzSKBHYjfDLX4t5AClGaM3iihVy+BWqhdudZ1fXHfbLnI3ao/iLvJfelUYr
	HA9YEUTjY7j60fCDimnb7gwU6d6G+s2oqMIXmcPmQDp0JKDlDWo3iJwFdhKmL7zfcgxBHS
	AiTQY5i1g1r8urXZFdg30pcETtWUQ56r7mSgSr3htsjAVBqakkOc7OXQLCqU1mc2aUsI9I
	Pdnr0P638u00eMrVxUTPM7oPkYBJuuVNy8tlY3SBzwNkhFs5Z2WNcrYeyY1GLA==
Message-ID: <01b16ed0-472d-49f5-a4ad-fce03a651de8@rootcommit.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: add Tinkerboard 3 and 3S device
 tree
To: Dragan Simic <dsimic@manjaro.org>
References: <20251111172003.2324525-1-michael.opdenacker@rootcommit.com>
 <20251111172003.2324525-3-michael.opdenacker@rootcommit.com>
 <dbacc018-2631-6606-7562-27371cf45d6f@manjaro.org>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <dbacc018-2631-6606-7562-27371cf45d6f@manjaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Date: Fri, 14 Nov 2025 13:54:58 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=GbNFnhXL c=1 sm=1 tr=0 ts=691734b3 a=LRNdxPJjO8fBCW461cpSgw==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=d70CFdQeAAAA:8 a=XU-i12MY3MkkrgIIfjsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfH1NsvoHEagDFqN4Q3Nj5b3nuNkZONXrz4OXe7Xkc9XckaqoDH1DT6+bV5y6YD5x+Jk1Y9Pqkj5ncPYuO4BSvh8NP18oJKeso1utprbmAubK6eOJA2GN qXRBGYWeG9gZhswh1PaFjRSicWO6ABaLChtkGQown0d0PVlfeAveLqLFLb/A1XfjCz9ym7PDIQgDpIEwV3XhNhzgN6e9qeWqB5nSSZ1s+d1ofUmZcc2cLYZM l0m1XNm9tbr9hgELAgyi+aLm7m08Kjd8OXn3NV/7QHttYmZziW/firkgYNg1IQY2H8uoDS8132dVAS4Qa6Xd3g3Fle2GLoOJzEW6gzvhf/fHH/1/rl5iq0rV 019fR9F/YWhNDliuQ+9ewz1Q0sbY+TYUMNN7UFHJJc3Op13eNfW1r+d/WgOzcZ0/dASnIfrKKNuzNFhyF4pNKasHm4yYTWiKjH+mgsUKrjQ/KB6x3XaYAxMk RhK+ylHdjKnPIFpCVNmK2Q59VGBitvFs180CM++FzT64WiMv+xDnitlj1VEypH33XtKwZ1f50IZ/5JdBTZmxYWD87njRadEa2YOzpsV3W1kxPxoYsmDy4l+0 QQrq8sQIptJH3FFw2YambYQdSOOeIjCWtEiEnHn64hUwYkUDQ5OLC/kC+jEPNYhw8gR7I1T3RuNopXJ+N1fnjrot
X-AuthUser: michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_055507_259279_EC9B5840 
X-CRM114-Status: GOOD (  24.18  )
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

Hi Dragan,

Thanks a lot for your review and feedback!

On 11/14/25 03:26, Dragan Simic wrote:
> Hello Michael,
>
> Thanks for this patch!  Please, see some comments below.
>
> On Tuesday, November 11, 2025 18:20 CET, michael.opdenacker@rootcommit.com wrote:
>> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>>
>> Add initial device tree support for Asus Tinkerboard 3 [1] and 3S [2],
>> which are SBCs based on the Rockchip 3566 SoC.
> For consistency and because it's a proper noun, this should be
> s/Tinkerboard/Tinker Board/.

Fixed in all the patches.

>
> The board .dts/.dtb files should include "-board", i.e. these should
> be "rk3566-tinker-board-3.dtb" and "rk3566-tinker-board-3s.dtb"
> instead, because there's no real need for shortening.  These boards
> are simply named "Tinker Board", which should be preserved.

Done too. However, I used these names for consistency with what was used 
on arm(32) for the original Tinker Board:
arch/arm/boot/dts/rockchip/rk3288-tinker.dts
arch/arm/boot/dts/rockchip/rk3288-tinker-s.dts
arch/arm/boot/dts/rockchip/rk3288-tinker.dtsi

I guess it's fine to ignore what arm did right? It won't live as long as 
arm64 (I attend Arnd's talk about arm 32).

>
>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-bpi-r2-pro.dtb
>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-evb1-v10.dtb
>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-fastrhino-r66s.dtb
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3566-tinker-3.dts b/arch/arm64/boot/dts/rockchip/rk3566-tinker-3.dts
>> new file mode 100644
>> index 000000000000..938af35b9004
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/rockchip/rk3566-tinker-3.dts
>> @@ -0,0 +1,14 @@
>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>> +/*
>> + * Copyright (C) 2025 Michael Opdenacker <michael.opdenacker@rootcommit.com>
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "rk3566-tinker-3.dtsi"
> The same comment from above about the naming applies here (as well
> as in other places), so we should have "rk3566-tinker-board-3.dtsi"
> here instead.
>
>> +
>> +/ {
>> +	model = "Rockchip RK3566 Asus Tinker Board 3";
> For consistency and to avoid redundancy, the "Rockchip RK3566"
> part should be removed.


Done.

>
>> +	compatible = "asus,rk3566-tinker-3", "rockchip,rk3566";
> Actually, the compatible should be "asus,rk3566-tinker-board-3"
> instead, because there's no real need for shortening it.


No problem to do it. However, here we have a slightly bigger problem: it 
would be inconsistent with the bindings for the original Tinker Board in 
the same rockchip.yaml file:

       - description: Asus Tinker board
         items:
           - const: asus,rk3288-tinker
           - const: rockchip,rk3288

       - description: Asus Tinker board S
         items:
           - const: asus,rk3288-tinker-s
           - const: rockchip,rk3288

What do you think? The discrepancy would be quite visiible.

>> +	compatible = "asus,rk3566-tinker-3s", "asus,rk3566-tinker-3", "rockchip,rk3566";
> The compatibles should be as below instead, for the same reasons
> as already explained above.
>
>    "asus,rk3566-tinker-board-3s", "asus,rk3566-tinker-board-3", "rockchip,rk3566"

Yes, whatever is decided for the compatible strings.
>
> Though, perhaps it would be better to not include the "asus,rk3566-
> tinker-board-3" part, because I think it's pretty much redundant.


My reasoning was that Tinker Board 3S is a superset of Tinker Board 3 
(additional eMMC and headers).
If someday some code is associated to the compatible string for Tinker 
3, than Tinker 3S should use it too, right? Unless we want to have the 
possibility to ignore some Tinker3 code in Tinker 3S for some reason. 
Then, it's better indeed that 3S doesn't use the Tinker 3 compatible 
string. It seems we have more options with what you're suggesting.

What do you think?

Thanks again,
Cheers
Michael.

-- 
Michael Opdenacker
Root Commit
Embedded Linux Training and Consulting
https://rootcommit.com


