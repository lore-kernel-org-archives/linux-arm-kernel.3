Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2255CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 12:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQNURhsm7+otyKWxbaJyu299VPuCIPdmcaTYfoL8RWc=; b=ie2dpD1e7Hd3crwzTaGwdDAzgL
	xulmZAGjVsKK97Hmc7X4BVSI9Na9ZoaNJ/G7F51sNuHFoZmeKP0NaIErJrKcRXuEISh0R+XNnNEnJ
	PWNTKdh7amUu7WiW+Q0cjo9TbnObn5WcxtgK6DLqMeBkx5IZW4Q37rXr0y981HlM3KMQTm85bwfAt
	ndr991gnv46c622e6nbPmcTNBAJmAUsdOsFBpDv+NGjtNc6T4xp9C1Bxl/RXpTQq8N4Gog9fUH+LL
	QkaQV3BSoy4B7PKI/xBRbUYzs9EwcSh0AywYYDiYsoEVdqH4/7TzoFQj2xSzDCalaHoVgaXoLxu+J
	y1DZAnhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGG6U-0000000Bmdx-2jmV;
	Tue, 04 Nov 2025 12:25:38 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGG6R-0000000Bmdb-2Aw7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 12:25:36 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4d172g3pLNz9tR4;
	Tue,  4 Nov 2025 13:25:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762259131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OQNURhsm7+otyKWxbaJyu299VPuCIPdmcaTYfoL8RWc=;
	b=g+G8rnjd9PTtirRXTlc2fbxyKmgglE9u3/DSyal2w6a915fKI1Yhgq3iB5Uq40EToF951K
	8Oo8QVLegZc+0xUuVzu+DHmly43QVnQr5j8JkEWamhr9X3x+sCdRnsw3BEieThBGlXU2Sy
	ogVSMdhwBTR2cZLPbvPAK4KNIW5aeeVg4JefTsTSGomCChG+sUp5fPWvvCMrgBwxQAfD2R
	gfW8PdB5aJ1mPoon96BFTdSSp5FQHOIQex6igesKl+jg7XR1EsZBTfe16Tt6vsTJakV7g7
	+OdCagH67R7XDuzP6VakeWB8jGjoT+gjFcrvYEJayM/WVvvnMvJjsFMixxEPVQ==
Message-ID: <1353f904-aa15-4e24-9e43-7b91185bba17@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762259129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OQNURhsm7+otyKWxbaJyu299VPuCIPdmcaTYfoL8RWc=;
	b=BqWrGpiHMXDX7WMtb2foX5OjYRO809BJEiC8EP+awuR7sKqdSZsZAGTm2UIFe4+AXYWsiP
	vSvyaTtaOZIoQ+tazkYd2bUdzlEG5hGJV4thzV8MxAR9UutQObInfREd6VLd2F1f5OLkEO
	Sg51sFLu+PFp5PalM8i9OxzdIFqTXFyREnVfvo4BX489TWhA78q2ASHWYu7bosAMw7pCeX
	cOxX5mWIQYkfVyC7lqAYnLmPdb6RjalZc3w7wqRtORFo7+IZwRX9ZgJDybLjBDIseeoLZ/
	dAYiAAWDuHSRz5ojQSg9y1YJZ9sy7oMxQgUqkQmfXg71Mj9T93bpiGtC1VnVRw==
Date: Tue, 4 Nov 2025 13:00:38 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: gpu: img,powervr-rogue: Document GE7800
 GPU in Renesas R-Car M3-N
To: Matt Coster <Matt.Coster@imgtec.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20251103200800.173440-1-marek.vasut+renesas@mailbox.org>
 <10e39887-02b2-41bd-9ed1-f54481a3578c@imgtec.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <10e39887-02b2-41bd-9ed1-f54481a3578c@imgtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: fi8weceksjtk1u8hozc8d9rra6f6bbax
X-MBO-RS-ID: bcb4be923019a510140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_042535_710074_9A69FC66 
X-CRM114-Status: GOOD (  11.51  )
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

On 11/4/25 12:52 PM, Matt Coster wrote:

Hello Matt,

>> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>> @@ -19,6 +19,10 @@ properties:
>>                 - renesas,r8a77961-gpu
>>             - const: img,img-gx6250
>>             - const: img,img-rogue
>> +      - items:
>> +          - const: renesas,r8a77965-gpu
>> +          - const: img,img-ge7800
>> +          - const: img,img-rogue
>>         - items:
>>             - enum:
>>                 - ti,am62-gpu
>> @@ -105,6 +109,7 @@ allOf:
>>           compatible:
>>             contains:
>>               enum:
>> +              - img,img-ge7800
>>                 - img,img-gx6250
> 
> Can you put these in the same order they're declared above? The way I
> read it, the order is img,xxx in generational order followed by
> soc-specific entries in alphabetical order (which is why we have
> img,img-gx6250 before img,img-bxs-4-64 below).

In this enum, the entries are (should be) sorted alphabetically .

Do you want to sort them generationally instead ?

>>                 - thead,th1520-gpu
>>       then:
>> @@ -134,6 +139,7 @@ allOf:
>>           compatible:
>>             contains:
>>               enum:
>> +              - img,img-ge7800
>>                 - img,img-gx6250
> 
> Same again, otherwise lgtm.
Please see above.

