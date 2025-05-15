Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38EBAC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 15:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nr0nXxmcRsw9rEQvUzs9fjSr7Uv8dGrjViFhcLGXgAw=; b=2K3Uqwgj6qFT6WIa+viXkNjINu
	LKr2XUrxH0s6mjrfxMwImbRihlGtNQm6gy/MKGoFFawPsWkhMpG3oIWv3qunogkhfjOanV0pIAl+7
	MfTGlb5tUr0LlGxSAHEr95gWs9FarzYIqubQnm8r4mZq8LyzyRbS5dQC5Gj67s2ROl9jwoPWGfe6J
	YuRJaHCQK+MO0CRsKLv4awNucS48+8/xYpa0tLGyu7uEU/yB4HhCToj4CrtrF9DtVY2oUrF8qjyTY
	dZZjFE7v6dCItkvdHC1hcEEcEFY0c1Hzk+X8vgbF1FM1iHwvmfJq2Q91CNGxe3JVg/K4V1xQUwY0i
	SXCHZC1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFaJw-000000011af-3lmO;
	Thu, 15 May 2025 15:16:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFaF1-000000010zP-0Zjr;
	Thu, 15 May 2025 15:11:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Nr0nXxmcRsw9rEQvUzs9fjSr7Uv8dGrjViFhcLGXgAw=; b=b+k1lvGk8HJWOFziRjPS4/s9O7
	qkQaXz15iHCAvkcADXJNRBShbJD9HtARmGFcyoQgkkfGeJX6QQedJN9vS47TUIL27YtbMY8TSp1Y1
	Pqp67n7kqx3oEKcIZGMwtsdETSnLxudoODtM5Q01/dV41IwkGnwbwtNQyjN+BoZQ+GC8JbbAap+g/
	88JAMWwSaULySvFJZdjpWpomB3T9m7/vRP8wN+ckq5BXUtSKzN2Jus7d77ScKkafcU2r2ePiB/7V7
	2XdtBE3kw1Qx6H/dUPtSTyR5R5xGJRfIGAkNORKO1dglsx75m9rqgU4j66BXP7HlLPrdAhtJB73zF
	KIucQZfw==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uFaEx-0000000HUpt-2s6P;
	Thu, 15 May 2025 15:11:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747321874;
	bh=X3Dg1aIIyiODeevYtcoMV/eCFObvTdGT9GPFfSk5gis=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LReNZ4m2ieD9KPscuI37q3qPeSnhXB4sbnjqzBI/3cDxVPK/OQysaTXJDNqBiJc4W
	 0BEQFt6ssqmEaErwYOisMATNcuGkLR1HPkDXBvGIYrCiLtGj2lZQafz89Gki3zGPOv
	 sXmPiJ+vun1YCBkKx+u2Uia+Gbuhrz7oMu32w8b35uqORf7m8Tt7+vHHwGA2au58vO
	 uKse1vMMbCFyWnmuCIu1BoGrV+10ijkAl8/8CxBd+87cT/m4RYFfm+yBCGA1581zwi
	 8JzZvjt3abMvkOC1ABtbPQOfj/qFfRKq5wEwdXIkjn0s2eimCNMzXyTIxglNdGxySi
	 /Dgg9YyEY0vEA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BFAF017E05F0;
	Thu, 15 May 2025 17:11:13 +0200 (CEST)
Message-ID: <cbd170a3-cbfe-4b4f-a059-efe33fed0e5d@collabora.com>
Date: Thu, 15 May 2025 17:11:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: clock: mediatek: Add #reset-cells
 property for MT8188
To: Conor Dooley <conor@kernel.org>,
 Julien Massot <julien.massot@collabora.com>
Cc: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Garmin Chang <garmin.chang@mediatek.com>,
 Friday Yang <friday.yang@mediatek.com>,
 Conor Dooley <conor.dooley@microchip.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250515-dtb-check-mt8188-v1-0-cda383cbeb4f@collabora.com>
 <20250515-dtb-check-mt8188-v1-1-cda383cbeb4f@collabora.com>
 <20250515-playpen-dislodge-80245fb8b7a9@spud>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250515-playpen-dislodge-80245fb8b7a9@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_161119_891213_609D228F 
X-CRM114-Status: GOOD (  16.38  )
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

Il 15/05/25 17:03, Conor Dooley ha scritto:
> On Thu, May 15, 2025 at 03:31:43PM +0200, Julien Massot wrote:
>> The '#reset-cells' property is required for some of the MT8188
>> clock controllers, but not listed as a valid property.
> 
> "required for some" but not marked required on those platforms.
> Why not?
> 

Yeah now that I read that for the third time, the wording is a bit incorrect.

It's not "required", some clock controllers do have reset controllers, but it
is facultative to actually use the latter.

I'm not sure if the ones that do have reset controllers inside should have the
#reset-cells property as required...

Conor, what do you think?

Cheers,
Angelo

>>
>> Fixes: 9a5cd59640ac ("dt-bindings: clock: mediatek: Add SMI LARBs reset for MT8188")
>> Signed-off-by: Julien Massot <julien.massot@collabora.com>
>> ---
>>   Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
>> index 2985c8c717d72888dd49f1f6249a9e2594d8a38d..5403242545ab12a7736ed4fbac26008aa955c724 100644
>> --- a/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
>> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
>> @@ -52,6 +52,9 @@ properties:
>>     '#clock-cells':
>>       const: 1
>>   
>> +  '#reset-cells':
>> +    const: 1
>> +
>>   required:
>>     - compatible
>>     - reg
>>
>> -- 
>> 2.49.0
>>


