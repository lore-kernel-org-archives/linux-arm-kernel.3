Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F1ECAC59F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 22:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u4T4Y+htEHk0Kb10DGACvmH0TTe+99pyaFvj37z6/wg=; b=hnf5fYFpvgxDbDuMGa74oMdQSB
	5z6tlLRSNh3i/C33LGEENw4cl/gdLj45rxI1cnzOyNqQf4IxJ5EwySBAtDF2k8dgWfNrUDaR6mZ3E
	JOiCkKZ0WN/Ik70mEmHPtxnvtjXJNU9jwtTcDiNMjlCzZH722to6128GWNT/zJJE1sVYjjNtQg2Cl
	VCAiUnX+PUQuYNrpvE8+4EfNzpfHt8o6/XK3Rc3Oo5yV3MYlK+Ma4yBG77EVY2aDQRMV6oEymdexr
	xLMBoYiahT1vDv9RgNrfrdn0cbKLfMXsGzzy8RsZPX9acUeR9osui9qDl0AuTwVVl0bJ/ZP+1/dzE
	RKuBmgsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz0JC-0000000F96m-3rZL;
	Wed, 17 Sep 2025 22:07:26 +0000
Received: from fout-a6-smtp.messagingengine.com ([103.168.172.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz0JA-0000000F94y-1Sij
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 22:07:25 +0000
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id 906BCEC0294;
	Wed, 17 Sep 2025 18:07:22 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Wed, 17 Sep 2025 18:07:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsdio.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1758146842;
	 x=1758233242; bh=u4T4Y+htEHk0Kb10DGACvmH0TTe+99pyaFvj37z6/wg=; b=
	GnyFuQsEKF2IuQGMNvo9BwlxBb5jX4kHD4votbFAGjxKrwFfUSJYmllYV85P4h1l
	V/OhdskoOYAmG21Kb1jc4Ge/6d6Mg5br3YN0qVpnl/E1FWPn4lT0BI/jzUixCm5C
	METW3z+BDaHm8wBRGQjmf19Kzlx+RHS/abGnksvprQUjlPfC6BYtoc0SABNby/oG
	2HBbGqcBelDRDUhRIEDnMmDG0VvFrCtS4d+WyvNYeKQE3T3PqrRxSTuuF0U7wgKv
	eKVJG/SJTf/zEWJ/zeGQ1n3JBLn9e+xysydgW1iRtYWVU/lYZiUs9IrZW8S6oApq
	LCmEVrMRJcj/9tIEK4IdSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758146842; x=
	1758233242; bh=u4T4Y+htEHk0Kb10DGACvmH0TTe+99pyaFvj37z6/wg=; b=c
	jS6Tyca1YI5+/Ml5n6Zv44XcnJH277ch3KUi3J50S5ENRl8WcyxcfncfQuGr++Ng
	7TO2Eem7GT8rrINW1FKZG9a76GOcEsD49YYjZfFyyMBFga8+1x2rbz6SkiIP4w6P
	qyjKryn/uHVRnqBg4cG5L4TQUa8+4vcnTjBie+yUQhRUU+HNiDeHS95xJDYROQcT
	GojHS1uSWwt8KWmnhb7CjyMBor/mm/pHA//xQnXKvT+JF/xC6hnE556nZnUta1xJ
	oqZSdd2bvOtSnB6DASJBON63q7vZRjIHUzwwylyg2r7qHDh5874QrlpR/93eu1kB
	2OhJyYH8/yzVxMTjqvf2g==
X-ME-Sender: <xms:GTHLaGRU6ie16DyxXOMBGRfYaBIMGtHrauOk4RN2ZDARaZAmi-SlPA>
    <xme:GTHLaK_hktpwucTvYO0UAfF97ZtlaX3lLYKIBSUvOQ8ey6zPvk502-C7Hn6DsuHTA
    S3pvvrbsBtTkXHx-u8>
X-ME-Received: <xmr:GTHLaGi80pOI6MFvlMGJhY5aPagZ7LFfEz52-29coRxXpLqHPb-DPwqUVkZlh5XTJMTZTopY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeggeeitdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptfgvsggvtggt
    rgcuvehrrghnuceorhgvsggvtggtrgessghsughiohdrtghomheqnecuggftrfgrthhtvg
    hrnhephfekvdekvdfhtddvteehueeuleetjefhieehjeeuhfdtuddtvdeguddtkeevlefh
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhgvsg
    gvtggtrgessghsughiohdrtghomhdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhope
    hrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehjohgvlhesjhhmshdrihgurdgruhdprhgtphhtthhopegrnhgurhgvfies
    tghouggvtghonhhsthhruhgtthdrtghomhdrrghupdhrtghpthhtohepuggvvhhitggvth
    hrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghr
    mhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqrghsphgvvggusehlihhsthhsrdhoiihlrggsshdrohhrgh
X-ME-Proxy: <xmx:GTHLaLbhMO5zUH2oImyWNfvzJgSsabXu2pBe4O5jyXtJ7UtD9hHCMQ>
    <xmx:GTHLaL_bD3CujM01bn6a3OGstVlhe6WxadDNXZLBkNo9Ch9Ds0_iHg>
    <xmx:GTHLaNPAzHLJZsafqLU0_TGdG_0WOka9ID7cbuQAWiEqw_jiRG9KOw>
    <xmx:GTHLaIF97r2dpKj9SqD4afZIHb2zHr9-7xF5L3kPSZPXu_oCZQloVw>
    <xmx:GjHLaFSh6Lpz6c87qmzXNVP0KiwxTrDNvyQnzyWfhDSsquPoxCQcR6nf>
Feedback-ID: i5b994698:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Sep 2025 18:07:20 -0400 (EDT)
Message-ID: <93193358-9818-4c63-bd55-9b910631e2a9@bsdio.com>
Date: Wed, 17 Sep 2025 16:07:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: add device tree for ASRock Rack
 ALTRAD8 BMC
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20250917180428.810751-1-rebecca@bsdio.com>
 <20250917180428.810751-3-rebecca@bsdio.com>
 <8b5625a5-56bf-49bc-b4cf-82c60460db65@lunn.ch>
Content-Language: en-US
From: Rebecca Cran <rebecca@bsdio.com>
In-Reply-To: <8b5625a5-56bf-49bc-b4cf-82c60460db65@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_150724_793328_2D56A6D9 
X-CRM114-Status: UNSURE (   6.99  )
X-CRM114-Notice: Please train this message.
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

On 9/17/25 15:04, Andrew Lunn wrote:
> I see you did not manage to get phy-handle to work.

No, I didn't. I added a printk and it said the addr is 0, but adding the 
phy node with a reg value of 0 doesn't work.


-- 

Rebecca Cran


