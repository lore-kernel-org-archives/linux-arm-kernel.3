Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4EC107BCD0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 17:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fTboTofXKVygm5nRnxwX/miy1TrApwSw+e03gudE3+8=; b=aMmkNT/wb4LKmBpsX+7/DIaOR9
	uSPJZR78/7tvPFhCGqfMUYvGYbBFmB+1F6uz2wz+cNTsvsDNzSEfXYKHdxuD0N+ImL+H8FtZzZDpp
	IxlVcsQGsOeMM90fB7kR+PxLJHz7YXFPLRMcceqCPJ2dzhF7dsLPh7R1Wns9Z5TwESkPi5Umekk/j
	GMgvlGQ+TII4FL+HgSzVGaKhw9AQf4lxyqG473i5XaoFT54BMAbmh2QH4GblP35XChU0TKJI0P6nT
	Bjf1Mzf8jUhvoFZu1OxSfXw3zz2Pvn5PmmjQvnoimaZUS9NCXs2XCxpOcFW2aH+K5v5kdXiA34oVt
	UEpEMk/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w169Z-00000000kex-2rqx;
	Fri, 13 Mar 2026 17:18:25 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w169W-00000000ke7-48Bs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 17:18:24 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4fXWR04cnrz9tWs;
	Fri, 13 Mar 2026 18:18:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773422300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fTboTofXKVygm5nRnxwX/miy1TrApwSw+e03gudE3+8=;
	b=PD+9XjrwLwa2eZ6/wYYOr3/DSKoKd+m6IEomqg8yaiHgQ5VzvOTYcweyYmSQu0Dp6If0vB
	oyHqOIJ4aclyCfKtswgaxW/7H8EMtuAaRtqpBJ4R8ywEw5rxEA+XcdS9hdnBc1IJtW0til
	QDat8pNA+31D137KbdDtvTio5ox7bMV+Heo/MK7ZFOMQLDLFhVIKuVOk6ZPQmjj67dM+oU
	ZbJaf4H20jOe4v1XraAcUPi3SKKRpjaufOVTaXtmUflWNGwogrGKe+6lkjfWUGWdDKqMml
	5ZuIrjzLqfku5i7kyaoIruGXzQFilSRztvWqY5mvPGCDPxTdX1PBLnbzMD5jtg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=KTVqbxgH;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <54535d8f-71b7-4ce1-a1fb-747056f368d1@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773422298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fTboTofXKVygm5nRnxwX/miy1TrApwSw+e03gudE3+8=;
	b=KTVqbxgH9//Vpmih6wdTgyzXuQISp55136jRGb1u4oNdOnJVIWwVT/P3yPAGv6u1Uw2m9+
	UNKqpavvmaoaOIqS8GxFIAFkxsxRE6YAm5HJT8lvTmiJzi4W5l7IMtCZvrI9YpclvN/rVo
	uSvw71N4C1nE5EYjaNdOnZaZ9f8kL1uyPpwndPyA33wVGSLH7gs0I5yZqONykiG/LmLRBk
	gKWPC7U/CcF15UxAZZhzMuCAF5K64heVsL/84OzORLuzVe0ae7EE5mYE+1+FLniN4LUatu
	ZL4ztsQKZG3iLX6O+9bRrz2QRfmtCYhgJ75Fu6ReIM2LNoqBY3LJUyNwDu1Vww==
Date: Fri, 13 Mar 2026 18:18:14 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] arm64: dts: renesas: Fix PHY C22 compatible strings
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "magnus.damm" <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org>
 <TY3PR01MB11346A57519DD3EB5BB4456D38645A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <TY3PR01MB11346A57519DD3EB5BB4456D38645A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: pfh3th3m3uohh86p3bnfbfgfyxreezcd
X-MBO-RS-ID: bb76ffa5bb1c6e3e25a
X-Rspamd-Queue-Id: 4fXWR04cnrz9tWs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_101823_171683_99BACFB7 
X-CRM114-Status: GOOD (  13.55  )
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

On 3/13/26 5:52 PM, Biju Das wrote:
> Hi Marek,
> 
> Thanks for the series.
> 
>> -----Original Message-----
>> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
>> Sent: 13 March 2026 16:39
>> Subject: [PATCH 0/4] arm64: dts: renesas: Fix PHY C22 compatible strings
>>
>> Realtek RTL8211E/RTL8211F and Microchip KSZ9131 PHY schemas indicate that compatible string "ethernet-
>> phy-id001c.c91[56]"
>> and "ethernet-phy-id0022.1640" must not be followed by any other compatible string. Drop "ethernet-
>> phy-ieee802.3-c22"
>> to match the schemas.
>>
>> The KSZ9131 schema does not document "txdv-skew-psec" property.
>> Fix what is likely a copy-paste error from the "rxdv-skew-psec"
>> property, use "txen-skew-psec" property instead.
>>
>> This is compile-tested and schema validated only. I have discussed this with Biju and they could
>> perform tests on real hardware to assure no breakage. Please wait for their TB before applying.
> 
> 
> Looks like there is delay in delivering my patches. I already posted 3 patches. I will test 4/4.

Hehe, excellent timing here.

> https://patchwork.kernel.org/project/linux-renesas-soc/patch/20260313130623.297712-1-biju.das.jz@bp.renesas.com/
> https://patchwork.kernel.org/project/linux-renesas-soc/patch/20260313130920.298392-1-biju.das.jz@bp.renesas.com/
> https://patchwork.kernel.org/project/linux-renesas-soc/patch/20260313141150.406528-1-biju.das.jz@bp.renesas.com/
Thank you

