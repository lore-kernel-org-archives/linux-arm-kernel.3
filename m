Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A584C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 18:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R2NIJYlZXUCPFvz62oOBC7RgnkUtxPH/uiLdx+Eefzw=; b=CcpUr21/pCCnNldgGQoLE22uQl
	6RWMG1tfOy2MOKw24Kl56yNifHg46lE72lXriD9L7iTfzhIE1tv0AzOEs7Wi+eLhtgR0lC2Gw7ClT
	SZRKuzXlza1OEULxmWLqPoT2TcOFKSUX+9hB3qucSoe3v2EXKSUnrh0jXoZx04x7XU/lvJ/h7tCW/
	/fXOiAePoYuGfGNk11+PrzK/Y9vlO5P+y1+0SkytDe32FntrbACZTiQqDcyCdwJOYUSDNnjDOh4DI
	7ZgIvUbaPKKst0sVkvH84PegCkqI2f62XYwT4ObHEWpRNYagNTu2GtqBA7ng9rU+QRWZegCBWVqOk
	QCZesr0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uREa4-00000005Dio-2vOP;
	Mon, 16 Jun 2025 18:29:16 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRCLr-00000004xMX-2hW1;
	Mon, 16 Jun 2025 16:06:28 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1750089974; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=e3GNWk/WbTMBevIRzVxs0X0CrdY0pRAyPGz6jfHOmRORUsjwLA1tl83Tcg69Gdmjm6LtbNDMWkmzWPXstgPN13BL4cUCzalmADCecyqghzLvTPu7xIp5Zte6CJ7oUCnJXZEHBgK41h40PJKyFeuACrxbSi+mpnczIfdnz4rfot8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750089974; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=R2NIJYlZXUCPFvz62oOBC7RgnkUtxPH/uiLdx+Eefzw=; 
	b=LPTH8d3DUcfCDo7jV04mDGb73PcRIZcqmB6HWL3b3Fwmaro5ZWuxr+RCxr3Gh3EofXC1PFLsCGqgykkco3tglMzjHesUsHPyai1hut15i1TFpPYezmbnoImx6TieTKuB6c2a9oBwESWEKNux8OyIhLTWlIF7v0/BhzqbDVUirqs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750089973;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=R2NIJYlZXUCPFvz62oOBC7RgnkUtxPH/uiLdx+Eefzw=;
	b=Cxej/lQUz2GTaTy62PcnOSfRvxKBanXxW0lGKW0AFWDQ7U+qDpLJSKzl0sFtrdA7
	IlPkQnAXxZZRvNLvs2aFKNCn7ht/En6XoDdo+4KiSUwcNsn0YeE3BwU1TiJVG+uovHv
	FdY7IkjAhFOlAV0AndUjZn8f5RMcY2IxVzacAGQM=
Received: by mx.zohomail.com with SMTPS id 1750089971949421.80620542117106;
	Mon, 16 Jun 2025 09:06:11 -0700 (PDT)
Message-ID: <163a05ac-b0de-4345-8489-dbf858326908@collabora.com>
Date: Mon, 16 Jun 2025 18:06:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: iommu: verisilicon: Add binding for VSI
 IOMMU
To: Conor Dooley <conor@kernel.org>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 nicolas.dufresne@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
 kernel@collabora.com
References: <20250616145607.116639-1-benjamin.gaignard@collabora.com>
 <20250616145607.116639-3-benjamin.gaignard@collabora.com>
 <20250616-winter-strict-db98f85db22d@spud>
 <5c971c09-c398-40a3-9ed5-ec38b6645e1d@collabora.com>
 <20250616-contempt-remix-5af2b7281cbd@spud>
 <2d251d7c-7906-4a66-9791-7f71e7a4b54d@collabora.com>
 <20250616-capped-rehab-6e7fd24d23ae@spud>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20250616-capped-rehab-6e7fd24d23ae@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_090627_730615_405E7A98 
X-CRM114-Status: GOOD (  16.72  )
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


Le 16/06/2025 à 17:58, Conor Dooley a écrit :
> On Mon, Jun 16, 2025 at 05:50:50PM +0200, Benjamin Gaignard wrote:
>> Le 16/06/2025 à 17:42, Conor Dooley a écrit :
>>> On Mon, Jun 16, 2025 at 05:30:44PM +0200, Benjamin Gaignard wrote:
>>>> Le 16/06/2025 à 17:14, Conor Dooley a écrit :
>>>>> On Mon, Jun 16, 2025 at 04:55:50PM +0200, Benjamin Gaignard wrote:
>>>>>> Add a device tree binding for the Verisilicon (VSI) IOMMU. This IOMMU sits
>>>>>> in front of hardware encoder and decoder blocks on SoCs using Verisilicon IP,
>>>>>> such as the Rockchip RK3588.
>>>>>>
>>>>>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>>>>>> ---
>>>>>>     .../bindings/iommu/verisilicon,iommu.yaml     | 71 +++++++++++++++++++
>>>>>>     1 file changed, 71 insertions(+)
>>>>>>     create mode 100644 Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml b/Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml
>>>>>> new file mode 100644
>>>>>> index 000000000000..acef855fc61d
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml
>>>>>> @@ -0,0 +1,71 @@
>>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>>> +%YAML 1.2
>>>>>> +---
>>>>>> +$id: http://devicetree.org/schemas/iommu/verisilicon,iommu.yaml#
>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>> +
>>>>>> +title: Verisilicon IOMMU
>>>>>> +
>>>>>> +maintainers:
>>>>>> +  - Benjamin Gaignard <benjamin.gaignard@collabora.com>
>>>>>> +
>>>>>> +description: |+
>>>>>> +  A Versilicon iommu translates io virtual addresses to physical addresses for
>>>>>> +  its associated video decoder.
>>>>>> +
>>>>>> +properties:
>>>>>> +  compatible:
>>>>>> +    oneOf:
>>>>>> +      - items:
>>>>>> +          - const: verisilicon,iommu
>>>>> You're missing a soc-specific compatible at the very least here, but is
>>>>> there really no versioning on the IP at all? I'd be surprised if
>>>>> verisilicon only produced exactly one version of an iommu IP.
>>>> I only aware this version of the iommu for the moment.
>>> "for the moment", yeah. Is there any information that could be used to
>>> version this available?
>> The hardware block isn't documented in the TRM so I don't know if there is a version
>> field or something like that.
>>
>>>> Does adding verisilicon,rk3588-iommu sound good for you ?
>>> It'd be "rockchip,rk3588-iommu", but sure.
>> "rockchip,rk3588-iommu" is already use for other MMUs in rk3588.
> "rockchip,rk3588-video-iommu" then? Instances of an IP in an SoC get a
> specific compatible with the SoC vendor's prefix, so having verisilicon
> there isn't suitable unless they made the SoC.

Other hardware video codecs have a different IOMMU so I will suggest
"rockchip,rk3588-av1-iommu" which is specific to this video hardware block.


