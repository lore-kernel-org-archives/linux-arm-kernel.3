Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F45DC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 07:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tYps54CSP4q1mdFjIcSj14UTUcUsKc9OKtYE+7qXw10=; b=QOvskmAA0zrCccYJ5GVJ9hRwue
	4BUG78CLnWAX+4xUXeutgLNeAtJnLHuxO7vwYxqEXOzFCFg8GBHpkxeM3KW9XoHE/mmQb24yGUn7n
	9J1I7HzlTz4kCb4ub/2e0rc0l975qOnmxhyMUS+RLFd/9xlVVyoDhWgnWKsNmyeXnT6OSBbMC99F5
	udDSf6Vc/Uy9JFVtTb50D0RilxsLJco58PSKP4L+jitpyEiRhqtsoL2Zxze6J/tsmbvd+omQSql0n
	Cb10aZgicv7hHBtmDECMaL6o7ylInt5ex6Q1ibt0O53orRG3xOLQFohtvcaOyBG99IaNueADijbQY
	YEeLTG0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnYPK-00000006ZaZ-2k7Y;
	Thu, 27 Feb 2025 07:34:10 +0000
Received: from fout-a4-smtp.messagingengine.com ([103.168.172.147])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnYNn-00000006ZU4-2Hyi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 07:32:37 +0000
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 3B9F21382F1B;
	Thu, 27 Feb 2025 02:32:32 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-11.internal (MEProxy); Thu, 27 Feb 2025 02:32:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1740641552;
	 x=1740727952; bh=tYps54CSP4q1mdFjIcSj14UTUcUsKc9OKtYE+7qXw10=; b=
	XRkCGA0QxqmXOxmFUzvyte20POOFw3l2KWZi56I5lymlKwVwTnqHIlLjNn4QIiRH
	qBgJ/ZIJzWdgqwkcC2DO5ZHYxSShwj6cTbhTkNN5EF2YOZlzzlSvImcbFIq2sxgj
	T+P2ksWTeV9WwV4Cs3cKNMtpTp0Gv6wFrQFi1Y+tJkfxOOtVGPq2ley+glgm+Zil
	oIMuJSvS6RV3+MIFOvYLjFvu/CZvbtJVN7fgBPdyCMVvXYKLNootAGttPnHiA1NQ
	/bZPrYcdxfa7Ic2CtJTIdyOP9fylQqxJ1zY5nyh3ZcvsIk9e9i6JnuyuTDqD5yLd
	YoHcGlzKRGAzKBS3ucI/xQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740641552; x=
	1740727952; bh=tYps54CSP4q1mdFjIcSj14UTUcUsKc9OKtYE+7qXw10=; b=Z
	/TAEnrnTy9agTqBRmR13xWuPBI9TkI9IJE9eRVmab9s5iUZFIAOAiuwJTCsIsjyU
	gZhAVUt2BK9CkZvnpZiaYwG3Ut0F8+fOA7CuduZ2A/XgX86QvW2znQBakVpkVkk2
	wpDGCVMJKcYwje44sTgExjNR4/0VRg76QbmVO+huRslcOWzPzD/03kT11YbFKmKZ
	N9Df4UnKXQqvGQLasjqCNHolql3h0ygkuxXn9C4dV80NwoNJZcIhUwhiHGMDZQOE
	8UoeLRBJBmyLKFYSIDXH1uG0up91Z/LAX4v2WK4er16JVb8Y0BguzeqFqyGh1ToR
	3e4S8h+wFSz5AIFUDlNFA==
X-ME-Sender: <xms:DxXAZ8JsBQ_RZ1LYX6RA02K50EUzF9JdMGcX_ZQ5b8HgMPD6bDsAfQ>
    <xme:DxXAZ8K20wsDhbG3qXZFfhsXRvp8KZIt61TY3CudNLMe7C5v7XGv5ZnwsXntxtRqf
    2-Xijyp9S1CTXuHPpY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekieekjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpedvhfdvkeeuudevfffftefgvdevfedvleehvddv
    geejvdefhedtgeegveehfeeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeel
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrg
    hssegrrhhmrdgtohhmpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehkrhiihihsiihtohhfrdhkohiilhhofihskhhisehlihhnrghrohdrohhrgh
    dprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhr
    rgguvggrugdrohhrghdprhgtphhtthhopehquhhitggpsghjohhrrghnuggvsehquhhitg
    hinhgtrdgtohhmpdhrtghpthhtohepuggrnhhishhhrghnfigrrhesthhirdgtohhmpdhr
    tghpthhtohepmhdqmhgrlhhlrgguihesthhirdgtohhmpdhrtghpthhtohepshhrkhesth
    hirdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhn
    vghlrdhorhhg
X-ME-Proxy: <xmx:DxXAZ8t0j-2FDkHU77hj7T54-yfPV4CRYy03eQS0VYtKy9rByJDD_g>
    <xmx:DxXAZ5aICgPTX8N9tIUDxWKLE6xDSI9tsiyXmhIVQ-45Zo3HGUIMPg>
    <xmx:DxXAZzawvvwTXfnkcOsCzNcQkTt_Wdcz5aslfGQ8vSKSd18xMhgOLA>
    <xmx:DxXAZ1AnMLbbvxp-eeTcvnYhpkllMEKMCHOns-eRFHZ5G_YsGONCKA>
    <xmx:EBXAZxMmAbTJSCNli44SU1q7sn_Uj7PvsLN_6FRUoofemWD6nScV4gvl>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A96982220073; Thu, 27 Feb 2025 02:32:31 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 27 Feb 2025 08:32:00 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Meghana Malladi" <m-malladi@ti.com>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>
Cc: "Bjorn Andersson" <quic_bjorande@quicinc.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 srk@ti.com, "MD Danish Anwar" <danishanwar@ti.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>
Message-Id: <d0303f33-3cde-45ca-8f25-313629bce863@app.fastmail.com>
In-Reply-To: <f1d61696-a5c0-4727-ab52-526294a2a5f9@ti.com>
References: <20240419060013.14909-1-r-gunasekaran@ti.com>
 <686f583d-6bf4-4486-b9e4-20c1e268eda6@ti.com>
 <d4954e5e-e51f-41c0-bca5-6e14b4640022@linaro.org>
 <0d33dea6-c021-4f2a-bb3f-92efd6eebd18@ti.com>
 <6081917c-9c20-48fc-baaf-7ac9a9679a72@linaro.org>
 <1982291f-4a02-4ed2-b4bf-778a2fe0ad9e@ti.com>
 <a3fc706c-3825-49fc-beea-3fea7d9c0038@linaro.org>
 <f1d61696-a5c0-4727-ab52-526294a2a5f9@ti.com>
Subject: Re: [EXTERNAL] Re: [PATCH] arm64: defconfig: Enable HSR driver
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_233236_143215_462E9774 
X-CRM114-Status: GOOD (  13.59  )
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

On Thu, Feb 27, 2025, at 06:43, Malladi, Meghana wrote:
> On 2/26/2025 5:36 PM, Krzysztof Kozlowski wrote:
>> On 26/02/2025 12:=E2=80=8A54, Malladi, Meghana wrote: > Hi Krzysztof,=
 > > On=20
>> 2/26/2025 4:=E2=80=8A18 PM, Krzysztof Kozlowski wrote: >> On 26/02/20=
25 11: 44,=20
>>=20
>> Yes, sure, but this defconfig change benefits and is sent for certain=
 TI
>> upstream boards, so it is TI upstream maintainers field. It still fits
>> the "Submitting Patches for Given SoC" in SoC maintainer profile.
>>=20
>
> Okay, I got your point now. So as long as this defconfig benefits TI=20
> SoCs, it should be sent with maintainer profile. I will keep that in=20
> mind for future patches as well. Thanks for clarifying this.

It's mainly for practical reasons: the patches I put into the soc
tree usually come from platform maintainers that I'm already working
with. They understand the process and I generally trust their
judgement of what should go into the kernel or not.

Individual contributors can still send patches to soc@lists.linux.dev
(formerly soc@kernel.org) and I will usually end up merging them, but
that means that the patch itself needs a more elaborate justification
for why it should be merged, and I end up spending a bit more time on
figuring out if I should take it.

      Arnd

