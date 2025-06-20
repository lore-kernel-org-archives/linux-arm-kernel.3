Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C55C7115D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 10:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PwxAthPjmI1ic6P01b6IWTuo7e6HnLmqXzNXxwM6Kuo=; b=q1BeJrx88F38girvyk2qBJQ8BZ
	9nRnRcsRnPkwpBLbceGTQStao2J5hnyI6gIRBbG+t4hGSxoPUx14jCr3wNgBCWpMx6K2sQLMKNess
	uEQvFPwuXTM5X6FsyVLFdwU/NiBsn8jfq4eJYOQTeySsxtgP8gUFnrX9j+TswRa/PwngnEpgWEHvv
	SLhBEoMQ5cBvBc/TozyCMmVwO/NFxMwaJx8sjMPtr59F5aJobeIQrHk3GCTceslmgCZfI8b991FlY
	OF97x2iHpWOlek1DvshORVRNxDoB+brywfjT2C/cA6t4Aho5KunnBRy3NEgeyfC92H7l+qh/zumM1
	7u8Uj2wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZRX-0000000FPZp-2Bu0;
	Fri, 20 Jun 2025 10:57:59 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSYSk-0000000FGwD-0nyZ;
	Fri, 20 Jun 2025 09:55:11 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1750413294; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=buxEGVBXCHdiuRG7q6sV4d7yeqisQewFmfTArcPMLDMJpVhZiQuhXPN4YH3nsW4EX4A+94uzTa1+mcC9m8i2tpwyZ0YeeVOCMpH8ZmrCpMxWXo+DplH30C870y4PqeaehgSZDEaWTQUTWGuDnJDI/meJgM7KOSAXBSw4B5kIcO8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750413294; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PwxAthPjmI1ic6P01b6IWTuo7e6HnLmqXzNXxwM6Kuo=; 
	b=UjItsuDRwJWVwiC9s/iFH6yZkARBVy/bUrQwerP4Qq/Z6QProSOvgVbEpymy1IfInMue2XZhMiKIQZv1U3jzMDr5KTL8hSrsrQ2hZW9LzLdDt+YKHzhoauu4oVQYwqcm1UpxZEFPL9CMD9ujT0qy+6LwpkOj0bPjIe6Tgdf91IU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750413294;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=PwxAthPjmI1ic6P01b6IWTuo7e6HnLmqXzNXxwM6Kuo=;
	b=b/q7LDjRPLKkw0j9TTNYtSjmnIfQ0z6/o4T8vE45q5PeXmqtyVFcMk/sRT03KhRl
	tF5z2L3pGW/oYrbRtiwIKTKc4e0wmJDztFMJ3KVwtmtp9gCtQnGtnIfU22blVE1KTen
	jfna8vqrDKhd4aPBUALRvOsCv8aXhBQhrYalZeEc=
Received: by mx.zohomail.com with SMTPS id 17504132917981020.3930091890192;
	Fri, 20 Jun 2025 02:54:51 -0700 (PDT)
Message-ID: <34c871c9-3367-4b62-b2f8-11ed7d3482e5@collabora.com>
Date: Fri, 20 Jun 2025 11:54:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] dt-bindings: iommu: verisilicon: Add binding for
 VSI IOMMU
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 nicolas.dufresne@collabora.com, jgg@ziepe.ca, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com
References: <20250619131232.69208-1-benjamin.gaignard@collabora.com>
 <20250619131232.69208-3-benjamin.gaignard@collabora.com>
 <n5ddeogrpgctrljnxjfxqaz22qfnxsgm6ro7qihbjeyhd5br44@ojlzlz7gsuzb>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <n5ddeogrpgctrljnxjfxqaz22qfnxsgm6ro7qihbjeyhd5br44@ojlzlz7gsuzb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_025510_300759_755A4BD0 
X-CRM114-Status: GOOD (  13.09  )
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


Le 19/06/2025 à 16:19, Sebastian Reichel a écrit :
> Hi,
>
> On Thu, Jun 19, 2025 at 03:12:23PM +0200, Benjamin Gaignard wrote:
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: verisilicon,iommu
>> +      - const: rockchip,rk3588-iommu-1.2
> The entries should be ordered the other way around, so that the
> "generic" compatible is the fallback. Also the 1.2 version is from
> Verisilicon. It does not really make sense for Rockchip. So I
> think it should look like this:
>
> properties:
>    compatible:
>      items:
>        - const: rockchip,rk3588-av1-iommu
>        - const: verisilicon,iommu-1.2
>
> Otherwise LGTM.

Thanks I will do like that.

Regards,
Benjamin

>
> -- Sebastian
>
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: Core clock
>> +      - description: Interface clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: core
>> +      - const: iface
>> +
>> +  "#iommu-cells":
>> +    const: 0
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +  - "#iommu-cells"
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    bus {
>> +      #address-cells = <2>;
>> +      #size-cells = <2>;
>> +
>> +      iommu@fdca0000 {
>> +        compatible = "verisilicon,iommu","rockchip,rk3588-iommu-1.2";
>> +        reg = <0x0 0xfdca0000 0x0 0x600>;
>> +        interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH 0>;
>> +        clocks = <&cru ACLK_AV1>, <&cru PCLK_AV1>;
>> +        clock-names = "core", "iface";
>> +        #iommu-cells = <0>;
>> +      };
>> +    };
>> -- 
>> 2.43.0
>>

