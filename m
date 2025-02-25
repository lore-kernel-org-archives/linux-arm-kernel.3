Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3527CC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tPd/d1lS+e5D1SoZ8oB+qy8yBKc1e4tlJLwqgs9YB9g=; b=ARIGJkGADsPogz3hLSZ+v48soH
	MXJA1osh6NfwjSfqXFObVTU17KWLVlmogceDJoviSIfsP85t7FJLlE5tI8UulqxQVT5AI7q+uashf
	MkvSYOJlCBCDCclEi/gVBdQCP88QYWjwemOh/SAfKg8SGhBjal6LcwOi9JahoJX6oM4mFamgEXNbv
	4HGzn6IsrBQrqoi0Mv7vksZiNZBl0kmskX190g7G+LprqGGL3/2VDGpFUXAMc660NwyG++1x7u5gw
	K8fV88crILjPR0Sjeu/O6lvk6egjgGEi1VJ9pOMmwzx4TZAepWbJbOkfw3Aedacfy/LKIzN3OFnlK
	TB/8Gp3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxxq-00000000H30-2ZqQ;
	Tue, 25 Feb 2025 16:39:22 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmvZ8-0000000HT0G-2Jq2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 14:05:43 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5e04861e7a6so10576209a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 06:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740492340; x=1741097140; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tPd/d1lS+e5D1SoZ8oB+qy8yBKc1e4tlJLwqgs9YB9g=;
        b=dDqfKW68Kp0zOIPPZVsRqwSb2QwvZMD8uJouBeGqxxOl2/E3QpJ4ZVtFLhKHwgW5qq
         MkAslGVUgkia0rzZcpMN/PoJ34Nkmr0FgcyxLtndIRzaWHFwEmEx3zpFiwyuVPuqVwUK
         FzRmhpQx0WJqBO+p4i7o5ndsGK5ek91nTo4lhbXw3S2b8qYqIsobTfsbWDxjz+q3h8PV
         1DzaZFO31gn5ysmrz8I7tyK3f4w7rw9cdnRl0Ttdmqxdtn7qDqKfw2I/RI2zKN35g5QL
         ga3D9F/lI6HwvEv3r1NEylTLFn7uiqGT4mB0tYymlBwcjktKbFnZsyRW1XIilah33uMu
         S/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740492340; x=1741097140;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tPd/d1lS+e5D1SoZ8oB+qy8yBKc1e4tlJLwqgs9YB9g=;
        b=AcIlr9N8GLKYpGbd2XlfIXdCSDFKr4OoFSoAyyDypaJIzZkpelRRkcby8tvqsuH78w
         PqvYHexQtMnIsUSt0zhlrMhJSOx203o4eM+qLOFEAIxLnQWxnV9YUAXdomBqZMrz6D08
         /o2M/y7NuA3z1+AGyCRj0APWRqFuuE/oqlHnmb6zVERS3dt8g1+W8Npkn3J5TG9IQgO8
         mA/W6jWpWbrMEgNi6ZJAUuzfhjKhdsohM3A7Ky1UvXKga12OZINOTnBo31wDcp9aPuo0
         YPoZ8lNpwcRUS+wgEj4Ife3JIHsTC01QiGlJNwzSZFiwle3wYYzGFiRUkqnTb4X+63Yn
         Ygpw==
X-Forwarded-Encrypted: i=1; AJvYcCUxTKNoUNagfHqwwAtccOBz/c1wpDiX+oJp2i6BSmJdehTxS5wqtac5uODwE677s1a/ApxO0mRlft5senyStllp@lists.infradead.org
X-Gm-Message-State: AOJu0YyusFBxMj/Hf5KNdMcBwlEsudFWjLWfALfyxAktWDaqBCeU7RUD
	Iu4TiI6Awk4qCM/iG+m4Y7kdLozIvVj8IgaNtu2Az2KKyFWQB4Wa
X-Gm-Gg: ASbGncugZU+yhsiBJX28CLyyoutc+IawkKnicSUK6VCXU5bR0EJ5jp971xVpODZEVho
	3Xe1nYpcSoEzvoiFb0NWreR46wWzkjHVUe+jSMAaW+t/vtsyRJc8CBkeOjEJ4leKLeZ3MoB5jEO
	4BMtxCoj0nSemtSmRg65dpg4U6h2oN2gNmWZyQkBXNJjCghTXm6M3UjiPe9LrinF6ME9WcS3P9m
	P8PxLcXu7g9R1IV1FBYDRjHGRa9pKWgyc1Hy3+CJY9Y4P/j3e/Pb8M3bndK00bRSL0Z6gxC77XA
	4jUnlHJp/qSW0zn3cuSW4QgRYVH61fD0VS0CezZ400yCiMjfJUA=
X-Google-Smtp-Source: AGHT+IEduCdNbL7IFjCYL/sa3Uw1eSpI/ch7S+DMg3yhWwQhhBhMD+Xp89Ze8+kev4lk/55fC5U9WQ==
X-Received: by 2002:a05:6402:1e8c:b0:5de:3478:269b with SMTP id 4fb4d7f45d1cf-5e44ba3ff2emr3170354a12.32.1740492339723;
        Tue, 25 Feb 2025 06:05:39 -0800 (PST)
Received: from [192.168.6.238] ([92.120.5.7])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e45b716aadsm1258001a12.36.2025.02.25.06.05.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 06:05:39 -0800 (PST)
Message-ID: <cd6a84cd-ff17-45df-becc-9bfc74522f73@gmail.com>
Date: Tue, 25 Feb 2025 16:14:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Content-Language: en-GB
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250221191909.31874-1-laurentiumihalcea111@gmail.com>
 <20250221191909.31874-5-laurentiumihalcea111@gmail.com>
 <Z7jahtO3bxjkMfnc@lizhi-Precision-Tower-5810>
From: Mihalcea Laurentiu <laurentiumihalcea111@gmail.com>
In-Reply-To: <Z7jahtO3bxjkMfnc@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_060542_596408_B0B8E807 
X-CRM114-Status: GOOD (  23.12  )
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


On 21.02.2025 21:56, Frank Li wrote:
> On Fri, Feb 21, 2025 at 02:19:08PM -0500, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> AIPS5 is actually AIPSTZ5 as it offers some security-related
>> configurations. Since these configurations need to be applied before
>> accessing any of the peripherals on the bus, it's better to make AIPSTZ5
>> be their parent instead of keeping AIPS5 and adding a child node for
>> AIPSTZ5. Also, because of the security configurations, the address space
>> of the bus has to be changed to that of the configuration registers.
> The orginal 0x30c0_0000..0x31200000 include 0x30df0000, why not map only
> config address part in your drivers.
>
> Frank


Any concerns/anything wrong with current approach?


I find it a bit awkward to have the whole bus address space

in the DT given that we're only interested in using the access

controller register space.


I'm fine with the approach you suggested but I don't see a

reason for using it?


>
>> Finally, since AIPSTZ5 belongs to the AUDIOMIX power domain, add the
>> missing 'power-domains' property. The domain needs to be powered on before
>> attempting to configure the security-related registers.
>>
>> The DT node name is not changed to avoid potential issues with DTs in
>> which this node is referenced.
>>
>> Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
>> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 8 +++++---
>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
>> index e0d3b8cba221..a1d9b834d2da 100644
>> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
>> @@ -1399,11 +1399,13 @@ eqos: ethernet@30bf0000 {
>>  			};
>>  		};
>>
>> -		aips5: bus@30c00000 {
>> -			compatible = "fsl,aips-bus", "simple-bus";
>> -			reg = <0x30c00000 0x400000>;
>> +		aips5: bus@30df0000 {
>> +			compatible = "fsl,imx8mp-aipstz", "simple-bus";
>> +			reg = <0x30df0000 0x10000>;
>> +			power-domains = <&pgc_audio>;
>>  			#address-cells = <1>;
>>  			#size-cells = <1>;
>> +			#access-controller-cells = <0>;
>>  			ranges;
>>
>>  			spba-bus@30c00000 {
>> --
>> 2.34.1
>>

