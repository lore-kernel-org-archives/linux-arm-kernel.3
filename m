Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84884D711C8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 22:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5vuIwrlfsuMjA+ArT+sGvLRH4JONxdjqmumQ0lvasns=; b=XQp8UVaPQww9QcjltHjRJtTMi2
	wUR2AIJVF5ohdiEupS0LWUCnpI0ItbMP6lgBo4ZmX6dRunmDZ21I0JiXDOV4kkgpoQ5P+N+Z8zZe/
	IQ9yt2p1Na62m2IktPBh46htlw9UVBWnCLpHTvNhlH9ugTpRXwv8ljnyLcE1nCAASt4kwocgDuFKa
	ownVbWApe2la7TQK7QmnqEQWcwGklgftwQS7slbDhF401yZoy6d7xSPTqICxl9UExzNN9hzs6qgCj
	S77LF+501UKIYAqKGvYcGrl4SyRjY0Wj2tDIlLBuGw5lxuwiIbxVV3tF68iwHrD0FnEuuqc09UsUv
	qV4BRhwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWMRy-00000009GbB-2mqn;
	Thu, 18 Dec 2025 22:26:22 +0000
Received: from fhigh-a2-smtp.messagingengine.com ([103.168.172.153])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWMRv-00000009Gah-3XFu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 22:26:21 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id ED39C1400083;
	Thu, 18 Dec 2025 17:26:17 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 18 Dec 2025 17:26:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsdio.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1766096777;
	 x=1766183177; bh=5vuIwrlfsuMjA+ArT+sGvLRH4JONxdjqmumQ0lvasns=; b=
	LAfWwuNpXY3C5lzzlrGbl+u+MB0r9A9UD+m29IOxHs910+C3Nh9wJU8fRDvsO1s4
	hqYKq6vuuQCQV8fgWkXesEc+NyI6kzABjVINw3UTFCN/AAouNhbhyp0t4a1EobZd
	msK4ZJeUHfexvH6F5CidgntcKvffabFJ7CmuX6Sir4xegDP6NIb7xSFokhQ9lo0U
	PjWMUfSE8wZbXUM2ay204FU4BTOQWOI99PxxsCzLc13lEtjcukPCtNgNr4gZtM11
	1F/xaGqW18L+kH3w9jOG4snRE8V+hRTnvfJATLwMXLDSEXHknav2FGqGaLfkoB1J
	LkQXY4ua/awAClhWisWQsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766096777; x=
	1766183177; bh=5vuIwrlfsuMjA+ArT+sGvLRH4JONxdjqmumQ0lvasns=; b=D
	8KpQmX8+LJrvAvmBhY0vlBY0U4DUNws4f60fN4KTq5E0JA4edmz6lJmg8vlvLrZY
	dGkCm/mRXmGG4CEdTBzh7HFcaIw24zc2jNinZhjTNOmc6EWSIVn/6K4e4CVLVmXZ
	ZwT/Pii77NxRs3AGtEvd2vJJQlmCPbTIp+E0752ZMT4Esua2es7z4OUVODzYTVqH
	CvrBGX8nM0cAVlUMq4C1njLvPJYyGy8Pjn4i9Ae9SeuXTjYLFcz67n+797rOvBVm
	KVif7FiZ/Q9AO/4EAFpWY98ni/H+qvkGCWM6HtZxL9Y/U8PRpMXAZEJrDXm1wIAF
	Vsk8Ak584PJpylJQgbc0Q==
X-ME-Sender: <xms:iH9EaSjs0r_Hr6QzNZ5XtYZveLLRtqOpwY69EDLkAbdpfzaQE2CNvQ>
    <xme:iH9EaSm8-C_QZCVcdQL5y1--oLM5Zs1ABboYTd5T-RofZRgLCqYvwizcKsnsJABLo
    BsvXUjTc03PjdhQEF6f8FqTc8xEsb1pbAnAnT2ybrQVmf0mFORh6cSC>
X-ME-Received: <xmr:iH9EaeaGPMzFfvOx6oddACuNs1lmN7F-EX-mw8zRgocK9D8mBuDpQfzTxnu7LsZankJj9aI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegieeivdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptfgvsggvtggt
    rgcuvehrrghnuceorhgvsggvtggtrgessghsughiohdrtghomheqnecuggftrfgrthhtvg
    hrnheplefhgeevleehieeuveduudfguedtieetteevhffgfffhhffhveffueegtdegkeek
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhgvsg
    gvtggtrgessghsughiohdrtghomhdpnhgspghrtghpthhtohepudefpdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopehkrhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghupdhrtghpthhtoheprghnughrvgif
    segtohguvggtohhnshhtrhhutghtrdgtohhmrdgruhdprhgtphhtthhopehtrghnrdhsih
    gvfigvrhhtsehhvghtiihnvghrrdgtohhmpdhrtghpthhtohepuggvvhhitggvthhrvggv
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkh
    gvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:iH9EadyT4GekbfEVwMCEa95li0Wv9vjD610Hw1NmWL5vj3vGqL6NiA>
    <xmx:iH9EadYtAlmM4kujKL0fOfXNfCk6jTqKvf8kRLlmfsY6MIlRYfhyuQ>
    <xmx:iH9EaezcmDfqJ2xKGgV5BRzzgJ2BfRVygoLcHpGUgeh-rnk6kJ4Jlg>
    <xmx:iH9EaWG46ABbTf4u40GaWM4XINTHk1J7Do6B2_1ls00nXRK9joclfw>
    <xmx:iX9EaaSf-ARUTKFu2UbbNeAfwMNb_2yH0GUkE-PVxhlMsJawuuprZahw>
Feedback-ID: i5b994698:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Dec 2025 17:26:15 -0500 (EST)
Message-ID: <b28d5c56-59ee-4723-b953-cca6629ef63f@bsdio.com>
Date: Thu, 18 Dec 2025 15:26:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] dt-bindings: arm: aspeed: add ASRock Rack ALTRAD8
 board
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Tan Siewert <tan.siewert@hetzner.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Cc: Billy Tsai <billy_tsai@aspeedtech.com>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20251218161816.38155-1-rebecca@bsdio.com>
 <20251218161816.38155-2-rebecca@bsdio.com>
 <5aa36c56-798a-40cc-b0b8-be3f7c92136f@kernel.org>
 <4eff8506-8049-46e9-997e-a41edff32bbc@bsdio.com>
 <d215c5dd-b402-4cd2-b4c6-48358b5b2491@kernel.org>
From: Rebecca Cran <rebecca@bsdio.com>
Content-Language: en-US
In-Reply-To: <d215c5dd-b402-4cd2-b4c6-48358b5b2491@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_142620_411527_7D05A435 
X-CRM114-Status: UNSURE (   6.30  )
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

On 12/18/25 12:31, Krzysztof Kozlowski wrote:
> This does not test anything from the binding.
>
> Please don't add fake tests... Building instructions are not testing.

Sorry. In that case I don't know how to test the bindings.


-- 
Rebecca Cran



