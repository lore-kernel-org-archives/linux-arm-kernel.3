Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE88D7977D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 15:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dVDUraBCahPU+SZAz6Hk9ua2W/itIqCdoSUr1zPU1VM=; b=TVAr0giVM3Y1vIIA1pnoKQs8h9
	9Mi1IAbrFoGuXXFvB5nWRCjSsmPEUeQW9wkfgmswWCIPo4huRl1Dn3LJGeVEuiHIuQPqtpLsXkrka
	uZ2bS2WXwwDqm/WQ6Z7RWCBT4BIm9EQ3T842cPgyr5sN3zA5FqnRaqe47WVLt4/5MwnyHMVxHtxQZ
	yl2LqI1zUryMeYYuXl5gZM3jzp3yB+KxlOqbQJy+ngajBVGOQRJa6on8v+aXZjcXLaRqcVATQnDwi
	DwT2RvWNVWt1M3z07wK/WRNl4aCqzhH09HM9bPKH+41zH1asK1o/lN2rTBA6fb0eT45Zd7mfv28pF
	Z+Vl2MIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmDFz-00000002lzG-1qBt;
	Sat, 31 Jan 2026 15:51:31 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmDFw-00000002lyv-316H
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 15:51:31 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso27572265e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 07:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769874686; x=1770479486; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dVDUraBCahPU+SZAz6Hk9ua2W/itIqCdoSUr1zPU1VM=;
        b=Sgft9AeDK00Ov+AI998CirYI4jcc1Gt1mxN6bZffoGNKN8UEheU78HK/ADymRAOJoo
         iqtXdhEWbvqc3gA0geISdweYeeBFGQmwwNw+08yyKA3DlP/TolcgvsN012uij2TKSZfm
         UcqrWFbjnpuuzouuFfnnnzlMDDG9P3n+V0f3f1rrPX6ycU8pE2Gpe5SrtJsy0Lxqb8pr
         qsyYQcZOF8vlMB6aPN3N9LLb5QLqIE/xW62NRjOjcPgGejZBsL5u9NKSS5e4t3H33m0B
         oUn/BUtFGiLRB7yC8kqAEt+DoTDfJBfuvx7qTL4C5V612SlYYMht6kimCTaVOd53JUQY
         Q6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769874686; x=1770479486;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dVDUraBCahPU+SZAz6Hk9ua2W/itIqCdoSUr1zPU1VM=;
        b=w+7aKm2QVhdHl5rpNSvo/AEtdkavHRQZg00rx6fImiyrgARlmX/k3u/Who5Tl9ksKT
         oiWMAUyZFTpAijH9US8WJkcoKmD1G8Yj2o6JktWqtALEuLA5Q0GXYrDaQbXN6QSiiSHi
         SADdI7TQ8dhFPBYQptDyPVzCdIyRWao6mFV7GNqJhH93ZIrp4fJ4xQ3japqG3hxH1d0o
         wqdB5a/sehA8WDXmvTSZ6ZOKccAlnSjImEwV465NW8F9uAZshMQhMnFGZdmQyGYvHqk2
         YQeOj+mTQDpIlSz8IRC/o5sNvElYwj53w/IKABeYU0JgP1Rj1+BBymUWmlBEcxNgX2i9
         7mFA==
X-Forwarded-Encrypted: i=1; AJvYcCX1kpCCfZLvoYtYB1pY62ELeGf5Gm5iRNTk1HVrU5e6NzsA6xiTx/w95ib0m6vLns0Dg187lVXsJ9FosiqNNWRJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzG4TaRWdh7RoA6fo4VtPBdDhiFsLcYcsLJiDpuGNaZTBx7CMLE
	mScreYSKSbCRzX+IBIRqkQnDjDZucbPs7eDQULycpB/51xcp07szwGv1fkvHz3HlnH8=
X-Gm-Gg: AZuq6aIaklam7xQeYwyqTpGNrQjY+QVbhtdSciDlK75H4qSXTmoqyzMZAjApKrfZHY4
	VigeyOl89nv+lxjQMx2N/vLQ5cbYa5bkVcoFsAH3dTHq/oCF2497sDlhDSx4iVZuBeqAlmeZ286
	fx99tsaL/STsIJwFK89HIEWAj5V5HY2rVOTyE/7VNHdS46dAbnzaLpT/Ru3xD9Qk9o0lWFboMTw
	DLXCHhP8tthKEa/3QhvVLLxDEqZlLllkCaOVIVBZbKA1/Blr+tNMS6uAjdyzxrJkD7RzTk83CwJ
	v9niDoehhk3BW3T8BZgVe+n5L5jLUNo8AfkBSF8efZydaaHrDPbgGYn2vkEXW07LZPGf+dFtJLb
	6yo5PFJUHRRt06G9F9lrNYxLzmsUDyfKKqAg0lRCVnjaob2zvq63NWyXQLLM59YdLzuuyd47Vaj
	CJ3WWM3VQwMcYibs52Mw==
X-Received: by 2002:a05:600c:3b85:b0:46f:a2ba:581f with SMTP id 5b1f17b1804b1-482db49b0b4mr84546485e9.16.1769874686453;
        Sat, 31 Jan 2026 07:51:26 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482dbd3953esm56113895e9.4.2026.01.31.07.51.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 07:51:25 -0800 (PST)
Message-ID: <b9de4cf4-c4b8-4f5e-9cd7-16991bda439b@tuxon.dev>
Date: Sat, 31 Jan 2026 17:51:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/19] dt-bindings: nvmem: microchip-otpc: Add required
 clocks
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120154502.1280938-1-ada@thorsis.com>
 <20260120154502.1280938-3-ada@thorsis.com>
 <f406abde-c7d1-4ed6-b7dd-5336956bc795@tuxon.dev>
Content-Language: en-US
In-Reply-To: <f406abde-c7d1-4ed6-b7dd-5336956bc795@tuxon.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_075128_804272_A31CCB11 
X-CRM114-Status: GOOD (  19.88  )
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



On 1/31/26 17:47, Claudiu Beznea wrote:
> 
> 
> On 1/20/26 17:44, Alexander Dahl wrote:
>> The OTPC requires both the peripheral clock through PMC and the main RC
>> oscillator.  Seemed to work without explicitly enabling those clocks on
>> sama7g5 before, but did not on sam9x60.
>>
>> Older datasheets were not clear and explicit about this, but recent are,
>> e.g. SAMA7G5 series datasheet (DS60001765B),
>> section 30.4.1 Power Management:
>>
>>> The OTPC is clocked through the Power Management Controller (PMC).
>>> The user must power on the main RC oscillator and enable the
>>> peripheral clock of the OTPC prior to reading or writing the OTP
>>> memory.
> 
> As this was not mentioned in the previous datasheet versions, the current driver 
> don't handle those clocks, and it probably worked as the clocks were enabled by 
> bootloaders, I think the clocks should be marked as required and this patch to 
> be propagated as a fix along with fixes on driver and device trees.

Ah, wait, you can't propagate it as a fix as you don't have the necessary clocks 
exported in device tree in the older kernels. And you are just handling it in 
this series.

> 
> I'll let DT binding maintainers for the final decision on this.
> 
>>
>> Link: https://lore.kernel.org/linux-clk/ec34efc2-2051-4b8a- 
>> b5d8-6e2fd5e08c28@microchip.com/T/#u
> 
> Why this link here?
> 
>> Signed-off-by: Alexander Dahl <ada@thorsis.com>
>> ---
>>
>> Notes:
>>      v3:
>>      - Removed clock-names (led to confusion, and not used by the driver anyways)
>>      - Removed redundant example
>>      v2:
>>      - new patch, not present in v1
>>
>>   .../devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5- 
>> otpc.yaml b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
>> index 9a7aaf64eef32..847dfb67c6b72 100644
>> --- a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
>> +++ b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
>> @@ -29,6 +29,11 @@ properties:
>>     reg:
>>       maxItems: 1
>> +  clocks:
>> +    items:
>> +      - description: main rc oscillator
>> +      - description: otpc peripheral clock
>> +
>>   required:
>>     - compatible
>>     - reg
>> @@ -37,6 +42,8 @@ unevaluatedProperties: false
>>   examples:
>>     - |
>> +    #include <dt-bindings/clock/at91.h>
>> +    #include <dt-bindings/clock/microchip,sama7g5-pmc.h>
>>       #include <dt-bindings/nvmem/microchip,sama7g5-otpc.h>
>>       otpc: efuse@e8c00000 {
>> @@ -44,6 +51,7 @@ examples:
>>           reg = <0xe8c00000 0xec>;
>>           #address-cells = <1>;
>>           #size-cells = <1>;
>> +        clocks = <&pmc PMC_TYPE_CORE SAMA7G5_PMC_MAIN_RC>, <&pmc 
>> PMC_TYPE_PERIPHERAL 67>;
>>           temperature_calib: calib@1 {
>>               reg = <OTP_PKT(1) 76>;
> 


