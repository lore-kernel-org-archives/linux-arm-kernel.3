Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E54DCF258C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 09:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gK+LpoJANvwF55wwTCTYvBqZF4AfkizsKPUWssaz8k8=; b=FUTnbsgj5itJj6RlvH6C+vN3nP
	nO0yxB3JofXDwhOYsZ1TgaE7t1pyqwOE+WOcoWWVHI1BGNKEWLEpmxzNx0PM2YXsieE/w4JDYekUM
	okv85o6i0huMB7J9N+oiNyIpvFwL1R1qYSFn0L+xWh4oMY37gfMbN/yBRad0/bfYZvEKQxR/YIa80
	k8OfIxGvsIItw8kieg5aXi3aYY0zdalfLpHd8zMzbL3AofXIjSR/tlXIZu4GkF7xJ4D+OiMtu24aU
	BigLquzhqbb7Hb20GOMRLy8fYq2mvikBzwj7QVv54jidtIToCstqNr0bOgVnbsv7CsxjPLpoQv/5p
	exYf7+PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLenD-00000002tf5-2xnQ;
	Wed, 19 Nov 2025 09:48:03 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLenA-00000002tdm-3o6I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 09:48:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B03CAC11186;
	Wed, 19 Nov 2025 09:47:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E44B760720;
	Wed, 19 Nov 2025 09:47:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6C86010371A28;
	Wed, 19 Nov 2025 10:47:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763545676; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gK+LpoJANvwF55wwTCTYvBqZF4AfkizsKPUWssaz8k8=;
	b=PIPyyuj4oPsQg2Mgv/JY2ZedxflwsVFgnS6H/TLC+gMVKf8PUExM36+PzqFtY+liu+E+nu
	1DOLd7gSes3S0xROeu71i8jQJ0Tf8Hv1bh+gG51GH2NZv7O72CaChG4mJNgi+ox7cjM6tP
	ID5p+0Lc+xJKBnllhdc40aPHWPYYuaMtaWZV/BwlIMnuMC2Gwxi32fCcCFnP3T+HkPqyaU
	jQaAkKHqUelX6mWDSRmJo4k/q2xBSnJs6GjNaYMNlmt2ZPCfN8oKakeEbaWbfF6UukqtrV
	NsIHcvEdvGxFSIFTpPT7S22owaush4D+vZbViSLijAeUhtoKzmuWLhkj4mrrxQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>, Linus Walleij
 <linus.walleij@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, =?utf-8?Q?Beno?=
 =?utf-8?Q?=C3=AEt?= Monin
 <benoit.monin@bootlin.com>, =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/3] dt-bindings: mtd: physmap: Allow using
 memory-region to access memory resources
In-Reply-To: <20251117175955.GA225586-robh@kernel.org>
References: <20251117-mtd-memregion-v1-0-7b35611c79a6@bootlin.com>
 <20251117-mtd-memregion-v1-2-7b35611c79a6@bootlin.com>
 <20251117175955.GA225586-robh@kernel.org>
Date: Wed, 19 Nov 2025 10:47:52 +0100
Message-ID: <87ikf6qrp3.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_014801_120538_6266A513 
X-CRM114-Status: GOOD (  19.93  )
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

Rob Herring <robh@kernel.org> writes:

> On Mon, Nov 17, 2025 at 06:00:15PM +0100, Gregory CLEMENT wrote:
>> Enable access to memory resources not only via I/O address using reg,
>> but also through a portion of main memory using memory-region. To
>> achieve this, new compatible strings have been introduced: mtd-mem and
>> mtd-memro.
>>=20
>> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
>> ---
>>  .../devicetree/bindings/mtd/mtd-physmap.yaml       | 59 +++++++++++++++=
-------
>>  1 file changed, 40 insertions(+), 19 deletions(-)
>>=20
>> diff --git a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml b/Do=
cumentation/devicetree/bindings/mtd/mtd-physmap.yaml
>> index 1b375dee83b0c..0f75a1204b263 100644
>> --- a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
>> +++ b/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
>> @@ -13,10 +13,6 @@ description: |
>>    Flash chips (Memory Technology Devices) are often used for solid state
>>    file systems on embedded devices.
>>=20=20
>> -allOf:
>> -  - $ref: mtd.yaml#
>> -  - $ref: /schemas/memory-controllers/mc-peripheral-props.yaml#
>> -
>>  properties:
>>    compatible:
>>      oneOf:
>> @@ -61,6 +57,8 @@ properties:
>>            - jedec-flash
>>            - mtd-ram
>>            - mtd-rom
>> +          - mtd-mem
>> +          - mtd-memro
>
> I thought we had a flag for read only.

The read-only flag is set at the partition level, not the device level.

>
>>=20=20
>>    reg:
>>      description: |
>> @@ -116,6 +114,10 @@ properties:
>>      minItems: 1
>>      maxItems: 8
>>=20=20
>> +  memory-region:
>> +    items:
>> +      - description: Memory regions to map into mtd
>> +
>>    '#address-cells':
>>      const: 1
>>=20=20
>> @@ -129,21 +131,25 @@ properties:
>>=20=20
>>  required:
>>    - compatible
>> -  - reg
>> -
>> -if:
>> -  properties:
>> -    compatible:
>> -      contains:
>> -        const: cortina,gemini-flash
>> -then:
>> -  properties:
>> -    syscon:
>> -      $ref: /schemas/types.yaml#/definitions/phandle
>> -      description:
>> -        Phandle to the syscon controller
>> -  required:
>> -    - syscon
>> +
>> +allOf:
>> +  - $ref: mtd.yaml#
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - mtd-mem
>> +              - mtd-memro
>> +    then:
>> +      required:
>> +        - memory-region
>> +      properties:
>> +        addr-gpios: false
>> +    else:
>> +      $ref: /schemas/memory-controllers/mc-peripheral-props.yaml#
>> +      required:
>> +        - reg
>>=20=20
>>  unevaluatedProperties: false
>>=20=20
>> @@ -223,4 +229,19 @@ examples:
>>              reg =3D <0 0x04000000>;
>>          };
>>      };
>> +
>> +  - |
>> +    /* An example using mtd-mem */
>> +    mem_logs: mem_logs@10000800 {
>> +        reg =3D <0x1 0x0000800 0x0 0x000f800>;
>> +        no-map;
>> +    };
>> +
>> +    sram {
>
> It's really an abuse of /reserved-memory to define regions outside of=20
> what's defined in /memory nodes (or whatever defines system memory). Is=20
> that the case here with the suspicious 'sram'?
>
> If we do keep this, I'd rather just add the properties below into the=20
> /reserved-memory node itself. Devices are created for those nodes if=20
> they have 'compatible'.

The name is indeed misleading. I drew inspiration from the example
above, but the actual use case was to share data between the kernel and
bootloader, for instance. Therefore, it is truly part of the main
memory. I will modify the name accordingly.

Thanks,

Gregory

>
>
>> +        compatible =3D "mtd-mem";
>> +        memory-region =3D <&mem_log>;
>> +        bank-width =3D <4>;
>> +        device-width =3D <1>;
>> +    };
>> +
>>  ...
>>=20
>> --=20
>> 2.51.0
>>=20

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

