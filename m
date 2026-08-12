Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB04C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 11:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ey4E5gbb1zGfpxU9QFub0aU8JCEKCtqwD4Rbc0BSyts=; b=XLkhF+Si9qEZ3FPNAWQ19QfvhT
	MBuuT16lIUmlPkocyI2SM2ub+2XziYKtwAbsgMp9/xP9BvqO/Id/tXkb4TU91FWMwWAP0c7RYwVDA
	6FihexoNfBqE4zS2tmnB6zJYKp2OMsq+QAYiXQQ2BnuPJMW3U55Ctam+h7J3zKOS0GtTDT6wBdf0D
	kCeNg29Wwc+8nmrZhiO72OpoA+E2Y4bU1mbSBvTATBjaBzG6zzqBRKTO3j6x1nQJ0gbQjcvNf7T+O
	BirAsOISJEWNGnjRVN/o2NfyEiQBbHeQ0UfHPVamOBxtHty0Ms+fLk/89C9KYDx0jUPGx3/5+XwB9
	rPpNBQJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu762-0000000G3WH-2Lkf;
	Wed, 12 Aug 2026 11:26:10 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu75x-0000000G3V3-0g9t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 11:26:07 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-49557167508so6027645e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 04:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786533959; x=1787138759; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ey4E5gbb1zGfpxU9QFub0aU8JCEKCtqwD4Rbc0BSyts=;
        b=cvfZ44kjHlrHIdvOb+txWRNE3D7Jey8Ms20qCLQuaNiBaiqghlJ9VbJpGUZYWMP393
         BVQUbRN2DcpUzufpNnr6Umdd6KOY9XVMKXiM2M/ofd/wAN/uQ9i/RNQRaGuLcNb9B6sR
         aErjUIYkCQkUl2frme78mrEp2ncLrqoWb571R9g8Ocq17gVTc0JDacDjbDdFRuXrkQn5
         TYzqUVYav3+t6dbykhLsmU7oHFJiro+PIXfXN8lOhxSdJuBJ3oL/+9T4uChHxH3Rd65I
         A4tcH1PlO4qYvYOHFwBwQiAFJApsBSL0cmVXlAMZX3LFWWomzQa2PF422t2gGaR23bjx
         ku6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786533959; x=1787138759;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ey4E5gbb1zGfpxU9QFub0aU8JCEKCtqwD4Rbc0BSyts=;
        b=HoHZX3woC2m5hj3pgnu7BQbGa2TFVvraojqYuOGEmdz6rhIk9cYV6mJ7rlEZYdw3XR
         1yozfgp2/7C/iKn0V/lPpVWlOJNe9V1ynIHIj9QOKsLEcnHkcvSrQwOJlLWdK4HhC398
         Zycc0ht3TnAMwO3c0a4H2BVybBG7ofkWP0uarTfadMpFx3Q+JAUe7LHPk9y2ZqEjzJom
         THt0fapWbNmeGim87Mkba2Uq2EUhLXz8rczrljSAHJXhJumOOUVMMl300Sw2G+TaKUS4
         mfsHxJjbkpDK0srquOUxn4kP7JT48yxdskLx6agn1wVv3fDhOgrnzrU/Cqy5ofMRZx0B
         yU0A==
X-Forwarded-Encrypted: i=1; AHgh+Ro62FUpAtrximeOG65WeLjdJkNo7KLB32IyMP5/VO2lYiV6vw6hKtdH+DPtCuxkPPsr9JakdEbAkZM0HuL1r3of@lists.infradead.org
X-Gm-Message-State: AOJu0YwYGyZyYSSD4+z6p5Wx4z5ciWAcSIgqDrC9QOfncSqvbwdtIUh7
	SLY43ck/qCexvQf4WDoL6nNVAInpsavGRDbBp/3BJOsFF45VBqbrywg0
X-Gm-Gg: AR+sD11Oh0DV95v2x9/vENyBC9EgDyd53IP160NSqW6JPaZjrRI2NsO95k2BaiSUpq4
	KVj75dSB11d2bnOUREjeCFD3wnTvz3MpvRnQeClgqgJEnM+3zwlW+9MEx5135unM5EYTEpdZYR+
	SJOXmv8KTDo4YbdfbFGuqKvUSYOvkPvR5KnIra0RsrcWHrKmybLD0BuMbTIGM3UD/lGplSZVn04
	t1v+zpsuoINxvqXamelpZFcr5kU8cVjTHY7KtOshCJnbKqj7qXJArlMRFn259XG8ysLBvNvctFv
	Rv0dk3WDzcrdPDwSI2mWm14pNtccmqmFuvLRlUOvntRd9S4RVYbta0aJbftagC5+yoRnHCysufA
	JQy0q2TNECnY5mYXGkVZuJsV76l+ZwsE9t4DgvTDbOL3K7QLhNH0nONB5GGYlzOYCZatXXjR+et
	p9ETUgRWEdcOOFy04jLY50pViRQ4GmDKYSgoyIU5U5LW48/GHRauKnQVPvUaRMmdmUhaVyMgQwp
	3OCJdhBEq3INW5L+3FIcQ==
X-Received: by 2002:a05:600c:4f87:b0:499:48be:3189 with SMTP id 5b1f17b1804b1-4997bf81217mr46280755e9.0.1786533958498;
        Wed, 12 Aug 2026 04:25:58 -0700 (PDT)
Received: from [10.25.219.170] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997b238a9asm42581695e9.3.2026.08.12.04.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 04:25:58 -0700 (PDT)
Message-ID: <36260069-cd81-4744-b5fb-8467f7874851@gmail.com>
Date: Wed, 12 Aug 2026 04:25:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: remoteproc: imx_rproc: document
 optional "memory-region-names"
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 "Frank Li (OSS)" <frank.li@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Frank Li <frank.li@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 "Daniel Baluta (OSS)" <daniel.baluta@oss.nxp.com>,
 Francesco Dolcini <francesco@dolcini.it>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
 <20260730163412.1145-2-laurentiumihalcea111@gmail.com>
 <amuUbkDM60eFzvJo@lizhi-Precision-Tower-5810>
 <MRWPR04MB123301AA9F074FA2976AC36C288D52@MRWPR04MB12330.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <MRWPR04MB123301AA9F074FA2976AC36C288D52@MRWPR04MB12330.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_042605_418014_2755FABC 
X-CRM114-Status: GOOD (  18.54  )
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



On 8/3/2026 2:03 AM, Peng Fan (OSS) wrote:
>> Subject: Re: [PATCH v3 1/4] dt-bindings: remoteproc: imx_rproc:
>> document optional "memory-region-names"
>>
>> On Thu, Jul 30, 2026 at 09:34:09AM -0700, Laurentiu Mihalcea wrote:
>>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>
>>> The carveout region names are derived based on the DT node names.
>>> Because of this, the DT node names are ABI, which is not supposed to
>> happen.
>>>
>>> Fix this by documenting an additional, optional property:
>>> "memory-region-names". This way, the software will have a way to
>> build
>>> the carveout region names without relying on the DT node names.
>>
>> "After update all existing DT tree, this will be required.
>>
>>>
>>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>> ---
>>
>> Additional information to help understand why it is important.
>>
>> 1. at thread wrong use vdevbuffer insteand vdev0buffer as node name
>> https://lore.kernel.org/imx/20260705202439.3F5771F000E9@smtp.k
>> ernel.org/
>> 2. similar case happen at
>> https://lore.kernel.org/imx/20260715071741.79CA81F000E9@smtp.k
>> ernel.org/
>>
>> Suppose these problem should be detected by dt binding check instead
>> of sashkio ai.
>>
>>
>>>  .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml         | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/remoteproc/fsl,imx-
>> rproc.yaml
>>> b/Documentation/devicetree/bindings/remoteproc/fsl,imx-
>> rproc.yaml
>>> index c18f71b64889..8e3e6676a95e 100644
>>> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-
>> rproc.yaml
>>> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-
>> rproc.yaml
>>> @@ -62,6 +62,10 @@ properties:
>>>      minItems: 1
>>>      maxItems: 32
>>>
>>> +  memory-region-names:
>>> +    minItems: 1
>>> +    maxItems: 32
>>> +
>>
>> Need restrict names
>>
>>   memory-region-names:
>>     description:
>>       Names for the memory-region phandles. Each entry must be one of
>> the
>>       following recognized names. "vdev0buffer" is the shared buffer for
>>       virtio device 0, handled automatically by the rproc virtio framework.
>>       "vdev<n>ring<n>" (e.g. "vdev0vring0", "vdev0vring1") are the virtio
>>       vring buffers for device N, also managed by the virtio framework.
>>       "rsc-table" is the resource table region used to share the resource
>>       table between Linux and the remote processor when it is pre-
>> loaded in
>>       memory. All other entries are treated as generic carveout regions
>> that
>>       are mapped and made available to the remote processor.
>>     minItems: 1
>>     maxItems: 32
>>     items:
>>       anyOf:
>>         - const: rsc-table
>>         - pattern: "^vdev[0-9]+buffer$"
>>         - pattern: "^vdev[0-9]+vring[0-9]+$"
> 
> There might be other entries such as m4_reserved or m7_reserved

Then how about an additional pattern? Something like:

- pattern: "^remote-reserved[0-9]$"

I believe a board could, in theory, have more of these additional carveouts, depending on
the range of firmware provided by the vendor's BSP (or the community) for that particular board.

Still need to put this in code and test it, though.

Peng Fan, Frank Li, would this work for the NXP platforms?

Franceso, could you please let me know if this'll work for the Toradex platforms?

