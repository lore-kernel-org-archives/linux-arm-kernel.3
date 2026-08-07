Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A5FC5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 07:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qp8n1eykcjli1ON25O/cMqkIDEqgBT+HFe8eeuMsJIk=; b=QayYqjio2KT2tproyGTq0rc1nq
	t2FgaJoCYDOLqKeRCEpwBqI8tVIxUUKc1Em/P8hbL4Sdc/Yzaua4rg3bN22ReE5ZeENnbWwk8uaT0
	87c/5d3nm13IVjI0kvFB0fAMDbNr7HNUd8+at2ZIokS+AMFpdGkEYOXWrLx75SdHEWhtqZf4lWNAi
	UB3rliCjj9HtsTUwAG1UXCPScjcT7De0of1ljptRsebS2zP+pIA2dl+lmrdl1CxrlpiyTpsVk0C+e
	u1v+p0ekEkWqcOwpIO4YGZm279ks1xv+jkecIZktdzCP0d0oO09v0higRIZnBIRPXk2bKMawCDc/M
	2G0cEPVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFEb-00000007HQZ-0SAQ;
	Fri, 07 Aug 2026 07:43:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFEZ-00000007HPT-3BKG
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Aug 2026 07:43:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Qp8n1eykcjli1ON25O/cMqkIDEqgBT+HFe8eeuMsJIk=; b=lkRXYB3mMaio6EtnBjQ0n7Bk8R
	YSGscCvbw0ZC0rZY+EpcC9olB7+CrZej6Zuymb6bTNJEB1hBrfInzaQAvbjBwRXzZoMLnvXigSwvU
	zPtyibHsmNHUOVrKCW6qj8EXhL/LxBlTHAFQEalipOLgB/U2V1dHjvCKUGRROXe7oBwS/o2pZm3d2
	bFersqDlSYA509wxs1OcgzAu1dVx9Z1c/dTb6rkq3zTuLmjKzk0hONw5FGNfGFgGrmd0gmzm1ub0J
	R9zuVAhzu7LhQbPEupxCvbte7+ObSNzfqcqoMKjd50S1dH/h1Czl/PhXojbVB7+3wj34INyYOqka1
	BlXHG2Zw==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsFEW-0000000C9PT-1ji2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 07:43:14 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4955de8797cso20637885e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 00:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1786088591; x=1786693391; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qp8n1eykcjli1ON25O/cMqkIDEqgBT+HFe8eeuMsJIk=;
        b=RyTBtQ78dpnGXmS/v06dZUmPTK5tjsyfC1PFSjbi65JokcSwA0YZmOzInlucxo6a2K
         LPfjGYcwiHoPw1LFq280wZqsaCGGQ4ooU64OIwafkNCjDXyBjxyVdw12iA38K9tyjeLN
         WAC1modtAiV2Eokpoh6/VZyBKct0ZGVljBi0Hz3Qc6uOk+bqctc6+H92FqNuScfw7ux3
         ksJ/hX/TfciLASzSjrSH8Ya97uF9mX6y++hbD9gTPlGWU5n1/+UfKcGQjdbisnlucGC0
         HHpxn6Er2RufYkxlFw8OwlTJMe6U1DZ9Ohw/UybsM8B7wd0b1K6odNxj0pDy/hauC0G3
         KoLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088591; x=1786693391;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qp8n1eykcjli1ON25O/cMqkIDEqgBT+HFe8eeuMsJIk=;
        b=aGKEN/KNaFy3xigiFU8ZpaGnKjYwX3VY4Lb0E2gHu/IWHVhQJ21eT2LFnnvciKVdvJ
         SqGPUFU6euO8c+g9WmQoUOC+HEfkc493pAEIGVC61zVt7JzK1zeJrxIRIWgSLnDiHQdR
         AdBKyEfWZBvTIvhtUki8ZenNU9WmxhwDKkHygA9s+8fbkLNGZaqD/dn3uhOwikQLY4op
         3D8QM4uw3Ii94KQO6a6HPK55cFhAe7njvVSvU+KX4x6GenGtLyYTzYwnlvYSWz+AVVJ6
         vS6E/kQd/J2VxHq2lwhSlaXBoSoJbb4wer5NY4B3251cMFxI+RzCVsCD1GeXS3wDYAGM
         jArA==
X-Forwarded-Encrypted: i=1; AHgh+RoV4en3GsPqJen/fF6/CCNBHMPSuh3hQNDI/keL3s/tUKZyig8X1+OF4Vu4h6fyvMUeB9WIqJ8lWHNcg7KolYj2@lists.infradead.org
X-Gm-Message-State: AOJu0YyIK+g9hY4GxfCaFhgp/wvD84cu9Aj7c3YWQlJlDWTAio9kDV16
	O5eAi/j/UyepZiUtbOgyYww4NngJWWSKIgNJ8/BOn9OZQ3wE+xq5AXOVUlDA8BOqyowH
X-Gm-Gg: AR+sD11c6xU2ctGO5Wz7bJ12vi97GuOUXciOZ4m9gdxCAnLKe15a1gDpJxaHyjnsq2Q
	b3KbGVdGCW5IhvYq0yD3OErnjmopkAdUqlf39kf7BXMFUNI+l+T3MNYJdJh1N3+XNyMg8rH9TuW
	3c1ibriHNiSmRn8k6CKfZHulaL1D8hhtlJbdPDlZqrFYyATDma3I/tZIc9lJpAU3+y4WBlrlSL1
	5qWVk7zUxYs6nMU4PEoy6ZetKRr4U4MTNcE5L9hPZj3W8BLg9iqC9SsJH6HNx/PSR9tWvhswqK7
	cWuMtjRWTS+RKExQe3nN9JPGWsFWCwhRGFVeGCtIumbTcAQZk0h3S6YIH+pKH/YLJWEtoHaqylO
	TNA0zR1/COc6Frb5D6MWvlQQS4EKM0gGH589p+K3mo8+agI8HVWtkbHPj+BA2QkGVa/AohezLi4
	qafh+7Bud03s3UUnxOFEWGM/KuReDjj1q54nYScI0RuGRd9jnTj0fRdz/wXI0cx4tGvRZn2hEVV
	F/rZ9XKYAiw5l8JB8wvBUgqySOZXf5n8Q==
X-Received: by 2002:a05:600c:35d1:b0:499:5e9e:1f50 with SMTP id 5b1f17b1804b1-4995e9e207dmr18816635e9.4.1786088590793;
        Fri, 07 Aug 2026 00:43:10 -0700 (PDT)
Received: from ?IPV6:2001:8a0:f59c:a900:2600:fba1:8d1e:1692? ([2001:8a0:f59c:a900:2600:fba1:8d1e:1692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e8cd0sm3174147f8f.17.2026.08.07.00.43.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 00:43:10 -0700 (PDT)
Message-ID: <20f4dad8-0ac5-4fc0-866a-38721371ba63@osyx.tech>
Date: Fri, 7 Aug 2026 08:43:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Jo=C3=A3o_Peixoto?= <jpeixoto@osyx.tech>
Subject: Re: [PATCH 3/6] dt-bindings: Add Bao I/O dispatcher driver binding
To: Krzysztof Kozlowski <krzk@kernel.org>, joaopeixoto@osyx.tech,
 linux-kernel@vger.kernel.org
Cc: ajd@linux.ibm.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
 bagasdotme@gmail.com, catalin.marinas@arm.com, conor+dt@kernel.org,
 corbet@lwn.net, dan.j.williams@intel.com, davidmcerdeira@osyx.tech,
 devicetree@vger.kernel.org, dev@kael-k.io, gregkh@linuxfoundation.org,
 haren@linux.ibm.com, heiko@sntech.de, jose@osyx.tech,
 kever.yang@rock-chips.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, maddy@linux.ibm.com, mani@kernel.org,
 nathan@kernel.org, neil.armstrong@linaro.org, palmer@dabbelt.com,
 pjw@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org,
 will@kernel.org
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-4-joaopeixoto@osyx.tech>
 <35100734-e2ea-459e-9b47-5cc62aa99b38@kernel.org>
Content-Language: en-US
In-Reply-To: <35100734-e2ea-459e-9b47-5cc62aa99b38@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_084312_566288_8770A187 
X-CRM114-Status: GOOD (  16.49  )
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


On 1/7/26 16:47, Krzysztof Kozlowski wrote:
> On 07/01/2026 17:28,joaopeixoto@osyx.tech wrote:
>> From: João Peixoto<joaopeixoto@osyx.tech>
>>
>> This patch introduces a device tree binding for the Bao I/O Dispatcher,
>> a device used in backend VMs running virtualized devices (e.g., VirtIO).
>>
>> Signed-off-by: João Peixoto<joaopeixoto@osyx.tech>
>> ---
>>   .../bindings/bao/bao,io-dispatcher.yaml       | 75 +++++++++++++++++++
>>   1 file changed, 75 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/bao/bao,io-dispatcher.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/bao/bao,io-dispatcher.yaml b/Documentation/devicetree/bindings/bao/bao,io-dispatcher.yaml
>> new file mode 100644
>> index 000000000000..8ca450e4b9d5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/bao/bao,io-dispatcher.yaml
>> @@ -0,0 +1,75 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id:http://devicetree.org/schemas/bao/bao,io-dispatcher.yaml#
>> +$schema:http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Bao I/O Dispatcher Device
> No, you don't get multiple devices per every driver.
>
> Look at gunyah or Mediatek Genio. Come back when you solve ENTIRE
> FEEDBACK given to them first. And then say how you solved that feedback
> because so far I see you only ignoring review of your LLM slop or other
> Microslop product.
>
> Best regards,
> Krzysztof
Thanks for the pointers, and sorry for the earlier churn. I looked at how
gunyah and the Mediatek Genio bindings model this and reworked the 
dispatcher
the same way: there is no longer a single node describing N devices. Each
backend device is its own node with one reg region and one interrupt:

   shmem@50000000 {
       compatible = "bao,io-dispatcher";
       reg = <0x50000000 0x01000000>;
       interrupts = <0x0 0x08 0x1>;
       bao,id = <0>;
   };

A backend guest that services several frontends instantiates several such
nodes. reg and interrupts therefore have maxItems: 1. The driver was
rewritten to match (one platform device -> one device model -> one
/dev/bao-dmX) dropping the internal N-device array, the global DM list and
the indirection ioctl.

I have also gone through the rest of the feedback on the series (the 
ipcshmem
binding, the misc-device conversion, commit messages, changelog, threading)
and addressed each item; the cover letter enumerates them. The binding 
passes
`make dt_binding_check`.

