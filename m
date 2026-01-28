Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81FF3D46BFB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 20:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nyG9XnYLeISwRA7B4JLi56GwJxWa3JvnSDbYLTj3mag=; b=KzIID9r/soc5nCU0UWxlt5xwSx
	+vEBEe+eDHSLXrIduqNQArSA7+G/YaURfd7AoYGTl9rb+Pu4wBUVVz5wBPxP6aAR0aqn0wTU/HeiN
	hQ/mBQT8mmkhuJCWbZmmlAxUc1YBzdQ+54FHul2NmII84j3k+wNyEjD/Uf2HIcxTkLXQQI2WKLpnF
	xza6jzfWndUotHfNM7brK+QpYqD8pACmUeE8IIj0lh4jKkH6EtgYKzIA7BhPXQgG/fWGFdAhZHg70
	8JaKRX2C9e6gfWh8dSGV1YQejNSYr6hIPdT/YZIUtUaDXo9fmthluw1fC/GsrjFq6w5QQ/56P861T
	04WJ6i1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlC62-0000000GjoE-3xGw;
	Wed, 28 Jan 2026 20:25:02 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlC5z-0000000GjnV-2zuB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 20:25:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1769631892; bh=TLdJZat0NqHxM6cAaIaO03kfgfUH8hhW+XaWOdcNM/I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QwJqePQnpoyfxiYfPX59X/nUITxCuJRj/q2+l43J8XXedWaeNGSQxMOPb8Xlev59Y
	 odYQEEo5H5N1Em2cdwyHlkxmPmUCdYYeqw4dm6BQWCXpV0vbAJTJHoCWq9ndEum7my
	 0QC13Z1wMXA1G7h2YOgVGP7KqmBpePs8Jr2Qpre+roNPTRCJ0+InoBHg3vpiCnWrl1
	 AlUD+Dw5j84RiVdm69zr+7C8wVkokNqu0cSlYAJD4jYcax0NfCXlPSHbpMbi4H4MiO
	 r8Ik+9lstFFz0WCYRaYJ7t2x6WBi9gNPylTWUaUcXX68/CHg/VfMmvtdLEZSPlwjWR
	 0SZE8B+U9BmNQ==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 925903F025D;
	Wed, 28 Jan 2026 20:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1769631892; bh=TLdJZat0NqHxM6cAaIaO03kfgfUH8hhW+XaWOdcNM/I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QwJqePQnpoyfxiYfPX59X/nUITxCuJRj/q2+l43J8XXedWaeNGSQxMOPb8Xlev59Y
	 odYQEEo5H5N1Em2cdwyHlkxmPmUCdYYeqw4dm6BQWCXpV0vbAJTJHoCWq9ndEum7my
	 0QC13Z1wMXA1G7h2YOgVGP7KqmBpePs8Jr2Qpre+roNPTRCJ0+InoBHg3vpiCnWrl1
	 AlUD+Dw5j84RiVdm69zr+7C8wVkokNqu0cSlYAJD4jYcax0NfCXlPSHbpMbi4H4MiO
	 r8Ik+9lstFFz0WCYRaYJ7t2x6WBi9gNPylTWUaUcXX68/CHg/VfMmvtdLEZSPlwjWR
	 0SZE8B+U9BmNQ==
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 0E9A03EF50D;
	Wed, 28 Jan 2026 20:24:51 +0000 (UTC)
Message-ID: <f213bdb9-7104-495f-97fe-8190af3ec577@mleia.com>
Date: Wed, 28 Jan 2026 22:24:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND v2 1/1] dt-bindings: arm: lpc: add missed lpc43xx board
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/LPC32XX SOC SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
References: <20251015184846.2509016-1-Frank.Li@nxp.com>
 <b75b30d4-e33e-4620-bc37-56b36612364c@mleia.com>
 <aXppf+3Nm7zsYaWE@lizhi-Precision-Tower-5810>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <aXppf+3Nm7zsYaWE@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20260128_202452_620815_0EA6268C 
X-CRM114-Status: GOOD (  14.46  )
/bin/ln: failed to access 'reaver_cache/texts/20260128_202452_620815_0EA6268C': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_202452_620815_0EA6268C 
X-CRM114-Status: GOOD (  15.74  )
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

On 1/28/26 21:54, Frank Li wrote:
> On Wed, Oct 15, 2025 at 10:48:47PM +0300, Vladimir Zapolskiy wrote:
>> Hi Frank,
>>
>> On 10/15/25 21:48, Frank Li wrote:
>>> Add missed legancy lpc43xx board compatible string to fix below CHECK_DTB
>>> warnings:
>>> arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: /: failed to match any schema with compatible: ['ciaa,lpc4337', 'nxp,lpc4337', 'nxp,lpc4350']
>>>
>>> Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>>
>> I'll take it for v6.19, thank you.
>>
>> If you have any other changes in the queue, please feel free to send them also.
> 
> Vladimir Zapolskiy:
> 
> 	look like you missed this patch.
> 

You are right about it. I consider it's pretty late to send another PR
including this change, and thus it will be postponed, I'm sorry for it.

-- 
Best wishes,
Vladimir

>>> ---
>>> Resend
>>> - colloect R-b tags.
>>>
>>> change in v2
>>> - move to nxp lpc32xx.yaml
>>> - fix ea,lpc4357-developers-kit include lpc4337
>>> ---
>>>    .../devicetree/bindings/arm/nxp/lpc32xx.yaml  | 22 +++++++++++++++++++
>>>    1 file changed, 22 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml b/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml
>>> index 6b7f5e6f99cfb..1e290f16a7a50 100644
>>> --- a/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml
>>> @@ -22,5 +22,27 @@ properties:
>>>                  - phytec,phy3250
>>>              - const: nxp,lpc3250
>>> +      - items:
>>> +          - enum:
>>> +              - ea,lpc4357-developers-kit
>>> +          - const: nxp,lpc4357
>>> +          - const: nxp,lpc4350
>>> +
>>> +      - items:
>>> +          - enum:
>>> +              - ciaa,lpc4337
>>> +          - const: nxp,lpc4337
>>> +          - const: nxp,lpc4350
>>> +
>>> +      - items:
>>> +          - enum:
>>> +              - hitex,lpc4350-eval-board
>>> +          - const: nxp,lpc4350
>>> +
>>> +      - items:
>>> +          - enum:
>>> +              - myir,myd-lpc4357
>>> +          - const: nxp,lpc4357
>>> +
>>>    additionalProperties: true
>>>    ...
>>
>> --
>> Best wishes,
>> Vladimir


