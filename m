Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A40CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 06:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T5YDiEkzPVJahns0xgVaPE73pzUnza4kSuXdfoKusdI=; b=ZeYRVC2aayjFgbr1fpUbBIoyE4
	PrJUF/TzpnyiLwGydllgqsZJ9U7L4PtWknoF3SZhXUJuXiBHnzVXGlasnkIzXBdESkIW8Z+TPxnOe
	VoN6HTeOrNjKPmjVChEFFi4HEUYHU6+91lg05cdkxD35u6omO29bVZcQ9sknb2TlM25Vq7fCYNHfH
	XGakVSNP4OB5m8NCyFteFQMMJzJCyjM0bKGE7pPsLdUvRpkUEkCDfWHzQqciFYd/niY4eX8kajwg+
	rUamMrP6re4R0xO+96RxTHV0zhwJv8vzKztZJKEHMCLDZHiQw3ynBC7TzXD5KOJfydF46U9Cheo9D
	vOmVdqsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCWox-0000000Aj3z-1GDw;
	Fri, 02 Oct 2026 06:32:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCWov-0000000Aj3c-1SGJ
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 02 Oct 2026 06:32:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=T5YDiEkzPVJahns0xgVaPE73pzUnza4kSuXdfoKusdI=; b=jrlNqjNJe6clRLcSDxr04Mg94x
	ZvyVl5ddpEvd7TBGzy3nHRqTG3uBsThZZhIquN2ECbT+hqdsUr8GQgAHWN+H5i+eSKgY/r6AFlvU0
	Es21BIDk2MDju0TufiXnnFPggVJdXPmkrnliT98rN/Lhe1fIoDVIrw9NiZmyPFbTUbDtSJpov9jV/
	Aqc7cDj8nWWhgJqIjxihXefttmQM+Ar3evEpso1U18koTYhalyFpxnr2DPYId4qyFnSUKR/qp+FcZ
	xsnz5FbWWgE/Dotu8r7bGgQYcsez84nF4rAxcZJG2J/ShSdi++wrNzjstL9XXzc0qYPIRfMD+24U0
	FJi12Heg==;
Received: from cp2.siel.si ([46.19.12.180])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCWoq-00000005dKr-15tE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 06:32:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=T5YDiEkzPVJahns0xgVaPE73pzUnza4kSuXdfoKusdI=; b=CO3+TmylPLELsu6FKCQ9kEQ7qV
	1ULyQy2ZQ4BMwUbWHfFbM4Ym5kZ6LrTVQH5HaKnSOHD7P6mXZe44zLci45gRQz7ZvuHIoMRmnSBSy
	RFMRvKehOfGsOQIkgJPDxRKukF7J2GHhnrVLpBwBC77367LskiU79DkxJUIxo9ErjpkL+e5swdUYt
	Se6lzubuVxiBxaduTY+DPKmmZS7YH+Oyx/o5HkEpvfxtZBmB4lOXUS390HXpDdRB+WgXJYL14GU9W
	sXbYTHlZbxnQHEnIFYdG4SnJeT2d+ziiD+CPoK5FZwiEjH9XoL63VPDimlgcoDeSuHJN112g+ywzZ
	FOO4dbOA==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:43744 helo=[192.168.69.116])
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xCWoa-00000002lbS-0alD;
	Fri, 02 Oct 2026 08:32:16 +0200
Message-ID: <ce32d95f-8a78-486c-966a-2ea0a686bcd6@norik.com>
Date: Fri, 2 Oct 2026 08:32:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] ARM: dts: imx6: phycore-som: PMIC and PHY fixes
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, upstream@lists.phytec.de
References: <20261001070947.1815279-1-primoz.fiser@norik.com>
 <ar5y_StTTBYDeck3@SMW015318>
Content-Language: en-US
From: Primoz Fiser <primoz.fiser@norik.com>
Autocrypt: addr=primoz.fiser@norik.com; keydata=
 xjMEZrROOxYJKwYBBAHaRw8BAQdAADVOb5tiLVTUAC9nu/FUl4gj/+4fDLqbc3mk0Vz8riTN
 JVByaW1veiBGaXNlciA8cHJpbW96LmZpc2VyQG5vcmlrLmNvbT7CiQQTFggAMRYhBK2YFSAH
 ExsBZLCwJGoLbQEHbnBPBQJmtE47AhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQagttAQducE+T
 gAD+K4fKlIuvH75fAFwGYG/HT3F9mN64majvqJqvp3gTB9YBAL12gu+cm11m9JMyOyN0l6Os
 jStsQFghPkzBSDWSDN0NzjgEZrROPBIKKwYBBAGXVQEFAQEHQP2xtEOhbgA+rfzvvcFkV1zK
 6ym3/c/OUQObCp50BocdAwEIB8J4BBgWCAAgFiEErZgVIAcTGwFksLAkagttAQducE8FAma0
 TjwCGwwACgkQagttAQducE8ucAD9F1sXtQD4iA7Qu+SwNUAp/9x7Cqr37CSb2p6hbRmPJP8B
 AMYR91JYlFmOJ+ScPhQ8/MgFO+V6pa7K2ebk5xYqsCgA
Organization: Norik systems d.o.o.
In-Reply-To: <ar5y_StTTBYDeck3@SMW015318>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_073233_393481_CA54F696 
X-CRM114-Status: GOOD (  12.69  )
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

Hi Frank,

On 10/1/26 16:49, Frank Li wrote:
> On Thu, Oct 01, 2026 at 09:09:44AM +0200, Primoz Fiser wrote:
>> A few small fixes for the PHYTEC phyCORE-i.MX6 SOM:
>>
>> - Pin the DA9062 PMIC watchdog to /dev/watchdog0 (1/4).
>> - Raise the PMIC's SOC/ARM buck ceiling to 1.5V, needed once the
>>   1.2GHz OPP tier ([1]] requests 1.3V for VDD_ARM and the anatop
>>   LDO's 125mV dropout is added on top (2/4).
>> - Add phy-reset-duration to fec node for more robust reset pulse (3/4)
>>
>> [1] https://lore.kernel.org/all/20260923070505.494949-1-primoz.fiser@norik.com/
>>
>> Link to v1: https://lore.kernel.org/all/20260930102532.2262700-1-primoz.fiser@norik.com/
>>
>> Changes in v2:
>> - Drop patch #3 from v1 (converting to reset-gpios) due to potential
>>   backwards compatibility as suggested by Frank
>> - Convert patch #4 from v1 to patch #3 in v2 (use phy-reset-duration)
> 
> What branch do you work on? I can't apply.

This series depends on series [1] patch #4.

BR,
Primoz

[1]
https://lore.kernel.org/all/20260924065044.368341-1-primoz.fiser@norik.com/



> 
> Frank
> 
>>
>> Primoz Fiser (3):
>>   ARM: dts: imx6: phycore-som: Set PMIC watchdog alias as default
>>   ARM: dts: imx6: phycore-som: Increase PMIC max SOC and ARM voltage
>>   ARM: dts: imx6: phycore-som: Add phy-reset-duration
>>
>>  arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi | 8 +++++---
>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> --
>> 2.34.1
>>
>>

-- 
Primoz Fiser
phone: +386-41-390-545
email: primoz.fiser@norik.com
--
Norik systems d.o.o.
Your embedded software partner
Slovenia, EU
phone: +386-41-540-545
email: info@norik.com


