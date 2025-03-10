Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7666C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 09:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TlfIZxwEH199yoeoqgqRaK5o2m1xiByl+CXP110BFB0=; b=PiNAX1jlyPqIiVeB4598fOC57E
	Bs6vVXT0JFKK4dN04YUXr3teLEbp/bHmG7l+f81V2pXgB6hslIR4Q1FbGvBIjhC+2FhfMbhuGhD58
	UoWGkxFvAvsN3CLFl+Rq5v2m98IygpL/aH58849pRE0gVqeX0u0tzdHsj74MbenSGMsDwojb33wqn
	wt8SOW0iz0lTcmCFpUhNDllOqT81gzjIpAJks2mGqoTWUfSHc4vINzzpOC8moGxocMMjdB4xfleYd
	VEt3obJyDoA8HtuxiRYM3Yq5KJmpAEMqAEoHW7JTRX87kLtnkSaajUhE1CJzwB/3QRo9uUBv5kMTp
	fSVyq64A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trZmS-000000029Ik-268w;
	Mon, 10 Mar 2025 09:50:40 +0000
Received: from fout-a1-smtp.messagingengine.com ([103.168.172.144])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trZTO-000000025eE-3vsm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 09:31:00 +0000
Received: from phl-compute-13.internal (phl-compute-13.phl.internal [10.202.2.53])
	by mailfout.phl.internal (Postfix) with ESMTP id 1D02C1382D1A;
	Mon, 10 Mar 2025 05:30:58 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-13.internal (MEProxy); Mon, 10 Mar 2025 05:30:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1741599058; x=1741685458; bh=TlfIZxwEH199yoeoqgqRaK5o2m1xiByl
	+CXP110BFB0=; b=crOe3gB2m9g9LoW1nZ9xJ4JRKWSvgMKPhyNVaRc6CqiYaLoA
	3U0pyvo9RVmrTPbjo4c/bdDRKkY5vVhKod+VE4309QlgDDHp59sRVK3mkj2vxiGd
	Y3huigyNK2yXlM4VG/znms3jSLiah/7SCNG2BNLE3tUu3xmOKg8N0mQOsnFgFmB0
	ALAP7tti1+xqy8hx4+G/Pc6QblscqXMVsOkboANEqGyS0TTFxChdeluSwazoNLXr
	HpQ7Wn7D2O7qjpHw8ul/4hh8mhRS793lDgwzUjxPA1siH74LoROmOf64Oihrtw37
	7EGJAoMm7VtYpBqelniC3TuvpZbUdRDYZDMHnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1741599058; x=
	1741685458; bh=TlfIZxwEH199yoeoqgqRaK5o2m1xiByl+CXP110BFB0=; b=u
	0EkRWlI+dB79gh3+6iouR+oWqISL8XTriiMRFPHBOE5yd+eWRSn1rNKC4EkGZ+LE
	3tH4Jd+tiWbs/jVEauBT8EQmRkfUzzclWhw+2cjDkpyBKv0fXzXxqgcI97Imyiyb
	FIzutPS72ft7kiH0QqYvsT4Vq+sCPjprAYEhVoW9DUtLlzP8VC3Fqbt46dZbw8Oj
	zxQ8ZJaBVN1MPx8eCBRS7O3CG1ma0lfqeA7p1kaIkZVCRhhTyLzBaGlt3nB4Nnc0
	YaWP9m7ZbWbsYX5DRaTK3lq6ksdletNNL/5cZ9YO64JxaCjv9HOnSQErHp8s48eE
	BUt110looaBeZ0mrc3n3Q==
X-ME-Sender: <xms:UbHOZ8wHmz67RttlxjK4vuG8ibl4ELp5ZmYqeioxIV-co8ABaWrfXg>
    <xme:UbHOZwS2CVHk_NYWZDOYQhaZTXgnQUg0mNZFku3oJ3idzN4zc6cgmUgxAP7IIGNhU
    uFEjMZOOZXCHI7D6Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudekleelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftfihrghnucghrghlkhhlihhnfdcuoehrhigrnhesthgvshhtth
    horghsthdrtghomheqnecuggftrfgrthhtvghrnhepjefhueekjeejgfduvdffheevveej
    hfdtuddthfduuddvveefjeffgfdvleefuefgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhn
    sggprhgtphhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnug
    hrvgdrphhriiihfigrrhgrsegrrhhmrdgtohhmpdhrtghpthhtohepmhhtuhhrqhhuvght
    thgvsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopeifvghnshestghsihgvrdhorh
    hgpdhrtghpthhtohepuggrnhhivghlsehffhiflhhlrdgthhdprhgtphhtthhopegrihhr
    lhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvg
    gtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkhhikhhutghhrghnleeksehgmhgrihhl
    rdgtohhmpdhrtghpthhtohepmhgrtghrohgrlhhphhgrkedvsehgmhgrihhlrdgtohhmpd
    hrtghpthhtohepshhimhhonhhsrdhphhhilhhiphhpvgesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:UbHOZ-VvunW_sPPqtlJ4BobU9ozGTaPNwI7gISNyjW605kq8rsiutg>
    <xmx:UbHOZ6jO6KL1OWVSrcVwHKnfQWL_hNjwzCti0stxgZ1la7IGZ1xd-g>
    <xmx:UbHOZ-Cx7vVhpcqtxcRLmRLEyFb62dzxk45gt33YtUBx2HWjWMk-0w>
    <xmx:UbHOZ7KY1-XU9dCC_z9ki8E0QLxUx5ETJ4qaVoMyAV2eEid6ajUrDg>
    <xmx:UrHOZ_z3lUbW02xPGs-PdXpXZY7xJAo2BujQGyYXOK-S67PqbneLl-A2>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 76AABBA006F; Mon, 10 Mar 2025 05:30:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Mon, 10 Mar 2025 22:30:36 +1300
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Andre Przywara" <andre.przywara@arm.com>
Cc: "Maxime Ripard" <mripard@kernel.org>, "Chen-Yu Tsai" <wens@csie.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Samuel Holland" <samuel@sholland.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Chris Morgan" <macroalpha82@gmail.com>,
 "Hironori KIKUCHI" <kikuchan98@gmail.com>,
 "Philippe Simons" <simons.philippe@gmail.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, "Conor Dooley" <conor.dooley@microchip.com>
Message-Id: <c8b85753-5c97-4258-a158-06a17929fad6@app.fastmail.com>
In-Reply-To: <20250224175642.170c124e@donnerap.manchester.arm.com>
References: <20250216183710.8443-3-ryan@testtoast.com>
 <20250216183710.8443-23-ryan@testtoast.com>
 <20250224175642.170c124e@donnerap.manchester.arm.com>
Subject: Re: [PATCH v7 22/27] dt-bindings: allwinner: add H616 DE33 mixer binding
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_023059_047436_75ED268D 
X-CRM114-Status: GOOD (  10.23  )
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

On Tue, 25 Feb 2025, at 6:56 AM, Andre Przywara wrote:

Apologies Andre, I came to review your comments on the TCON series and realised I had missed responding to this comment before sending v8. 

>> +      - allwinner,sun50i-h616-de33-mixer-0
>>  
>>    reg:
>> -    maxItems: 1
>> +    minItems: 1
>> +    maxItems: 3
>
> What are those three regions? I wonder if we should have reg-names here,
> to fix the order, and to document them on the way?

This would be the top, display and mixer groups for the DE333, and mixer for DE3 and earlier. Can certainly add in names for these. Is there any example elsewhere in the bindings to look at?

>> @@ -61,6 +63,23 @@ properties:
>>      required:
>>        - port@1
>>  
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          enum:
>> +            - allwinner,sun50i-h616-de33-mixer-0
>> +
>> +    then:
>> +      properties:
>> +        reg:
>> +          maxItems: 3
>
> Should we override minItems here as well? I guess any driver would need
> all three region to work?

This seems sensible, as you say it would always be 3 groups for the DE33.

Regards,

Ryan

