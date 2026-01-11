Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED551D25030
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 04:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6aSQimWPEMhTKsPYUy1vj9/5sPSG4zuP/FMO33v30Ew=; b=V8UIOf4tYZwylR5Yymhlq7h9Dn
	RRrO0XyD7Arz1iSDMi1r9nbzA+zzYlGAV0b/Socq+7BzDuynHxDmDCHhF0uH1oPTliE0p19BZaRDt
	L9ZktIxLEGAKahtrO/nHm56DPd3vOMiIFGFnYIw3S5Lw1Wj6JZ8VU8Dt9x0rxPCxbDXZTgIKwUq5e
	+9jzWxO9anOYOf83cQSvrxZ3U+th0RSV9s67ayVPQ8+NwlwHC6xT6+Gfq1sE+RGRqXix5nqP4OTmC
	eLv3q8O+Z6jla+enKpVwKQzD0tlIEG2RznqXkQ5t+FUuoyxPLdD+KJhXKQYbl90gOH158rKr6ZZk0
	ThX770hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veme0-00000003rWJ-1BZj;
	Sun, 11 Jan 2026 04:01:36 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vemdx-00000003rVw-1swE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 04:01:35 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-34abc7da414so3093736a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Jan 2026 20:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768104092; x=1768708892; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6aSQimWPEMhTKsPYUy1vj9/5sPSG4zuP/FMO33v30Ew=;
        b=A9jmpTjE2b5zZDE5WQC90UL/mlTKJ87uKU9KVdrJiNXABFvRivT8z07RldNxFkm27/
         gfuX3OSjGkS0++9WnKe7Hb1b1Q/423YvcpeeQMcxxDJ33kaWAikd9023kOUYemHlyn/M
         sSUROPRUk5Ah3pLab9HBLzQITaQQ+RNMddNp1ua64VOdi6l1F+8lGaKs4M7/uhVSrdHe
         zvxYomc1hAkhYWciOM8/mcuQMm4SEUSi9Uv7Qy2RChYbKt7JPlTANT59t+tPXHIMcA5K
         +Gk/0A0wogHjZcuE8sI3xoSUUUuG91uhAmXljE5KiAGNNS7G6i4Yc7fXSgCB/bHIeazJ
         HVwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768104092; x=1768708892;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6aSQimWPEMhTKsPYUy1vj9/5sPSG4zuP/FMO33v30Ew=;
        b=EIDOJ6dGvDaLB35pmyhrm1PPueaw021tERhgnpTbXqE7KzPHDI4GJcIrBb4ZjbCKje
         yX6tgun5P4oAjhNto9hNE/etp6Ouu0j++NoKQAqKUSuniSxr1A3FXi5r/ef7oe6Vx8Xn
         mvtuIojQHkyQp3xUJe0x8ypnW3IT5EvBXnwtTvGakx7WyZK4KFL51NrqD6t+HDNcNTEu
         fK+AxNnt/byVriGU/fkH2RHmaCVbW2VDPOG1pNQplOat7mEEZdqKzFZJSTly1Y9jQA+Z
         7SR+vJA7kBaDUMXYdOXGuUU593+6FyFYiK78Y59M+gqsjIXF6jOZ3uq3JauJ18Q8nOwn
         BiEg==
X-Forwarded-Encrypted: i=1; AJvYcCVZQ75yqT3oVLTc6SVxLDqEvn+Hxc5aIriK5bYDa6ZBEMyiWO/ffWH5/XGLxmWqk2sFQC/rNCsa0pciUn+6jM1C@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7yxgb/egOEqvGG0Rtl/RM1mxviDuQ4Yui4BzLGNn3IfIVmirK
	3bsst++rGQ8Ehe4iCdpeHZk6vGYMn7dMT+OqznhBvglyELb4B+CW1g2U
X-Gm-Gg: AY/fxX5cVZ446HXlcivZzs1chOR73yPjaya6IzCtzT76tdidRWcEpO1z9tOGYCUJJKO
	qzpR4i4CrtKQoNxaLe0RfOw9Y8yZjIM6ogYZyQnz6deoafI+Ashq1C6vRNmigp/R5xTJYEmD8Pp
	LvXMhE+LHppTBPA4cCpKkKTyjWMGl3L/mzFEBeqUVgOrBqtkGqU4DbTo/UT1JNPAaE3+mFiLDbY
	HGpyaQgnjH+wO5LivKoLu+KvfPg4kYKzJLxocBEg6CgGfDEJQcBTJE8CvkOm/5tEwoGFHy8cBfR
	Fkgl5LQUiYtsVlarRIHapqmsTL4g+3IrnjIR6DpcI11HSweQlMb/YU3mbuXeUx6IukKHalP6AkI
	ZCq9ehCEA0G6esecjvDA1uGZsV4zbKCa8Ox6cqVuDjsOlk6LDX/rI93S26KCJj+2qF92k0leqFZ
	meQdaG
X-Google-Smtp-Source: AGHT+IGPybPvZupy/FYihDwzQNc/n+V1kR/RRvYwaA6/FcFDZUxpWNk2e4gufz92hDuNfXzVOvBWtg==
X-Received: by 2002:a05:6a20:a128:b0:35f:68d:430e with SMTP id adf61e73a8af0-3898f8f45bemr12792422637.9.1768104091706;
        Sat, 10 Jan 2026 20:01:31 -0800 (PST)
Received: from [0.0.0.0] ([8.222.167.232])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc96ca7a9sm13871167a12.25.2026.01.10.20.01.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jan 2026 20:01:31 -0800 (PST)
Message-ID: <0d54ddca-9270-40a5-aa82-d8a7b65027ff@gmail.com>
Date: Sat, 10 Jan 2026 20:05:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: ethernet: eswin: add clock sampling
 control
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
Cc: lizhi2@eswincomputing.com, devicetree@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 netdev@vger.kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 ningyu@eswincomputing.com, linmin@eswincomputing.com,
 pinkesh.vaghela@einfochips.com, weishangjuan@eswincomputing.com
References: <20260109080601.1262-1-lizhi2@eswincomputing.com>
 <20260109080859.1285-1-lizhi2@eswincomputing.com>
 <00b7b42f-2f9d-402a-82f0-21641ea894a1@lunn.ch>
 <aWKZvEW7rKFFwZLG@shell.armlinux.org.uk>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <aWKZvEW7rKFFwZLG@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_200133_500836_9A4D764F 
X-CRM114-Status: GOOD (  24.97  )
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

On 1/10/26 10:26, Russell King (Oracle) wrote:
> On Fri, Jan 09, 2026 at 07:27:54PM +0100, Andrew Lunn wrote:
>>>     rx-internal-delay-ps:
>>> -    enum: [0, 200, 600, 1200, 1600, 1800, 2000, 2200, 2400]
>>> +    enum: [0, 20, 60, 100, 200, 400, 800, 1600, 2400]
>>>   
>>>     tx-internal-delay-ps:
>>> -    enum: [0, 200, 600, 1200, 1600, 1800, 2000, 2200, 2400]
>>> +    enum: [0, 20, 60, 100, 200, 400, 800, 1600, 2400]
>>
>> You need to add some text to the Changelog to indicate why this is
>> safe to do, and will not cause any regressions for DT blobs already in
>> use. Backwards compatibility is very important and needs to be
>> addressed.
>>
>>> +  eswin,rx-clk-invert:
>>> +    description:
>>> +      Invert the receive clock sampling polarity at the MAC input.
>>> +      This property may be used to compensate for SoC-specific
>>> +      receive clock to data skew and help ensure correct RX data
>>> +      sampling at high speed.
>>> +    type: boolean
>>
>> This does not make too much sense to me. The RGMII standard indicates
>> sampling happens on both edges of the clock. The rising edge is for
>> the lower 4 bits, the falling edge for the upper 4 bits. Flipping the
>> polarity would only swap the nibbles around.
> 
> I'm going to ask a rather pertinent question. Why do we have this
> eswin stuff in the kernel tree?
> 
> I've just been looking to see whether I can understand more about this,
> and although I've discovered the TRM is available for the EIC7700:
> 
> https://github.com/eswincomputing/EIC7700X-SoC-Technical-Reference-Manual/releases
> 
> that isn't particularly helpful on its own.
> 
> There doesn't appear to be any device tree source files that describe
> the hardware. The DT bindings that I can find seem to describe only
> ethernet and USB. describe the ethernet and USB, and maybe sdhci.
> 
> I was looking for something that would lead me to what this
> eswin,hsp-sp-csr thing is, but that doesn't seem to exist in our
> DT binding documentation, nor does greping for "hsp.sp.csr" in
> arch/*/boot/dts find anything.
> 
> So, we can't know what this "hsp" thing is to even know where to look
> in the 80MiB of PDF documentation.
> 

HSP -> High-Speed Peripheral. eswin,hsp-sp-csr is mentioned in

Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
Documentation/devicetree/bindings/usb/eswin,eic7700-usb.yaml

 From ESWIN's vendor/testing kernel tree:

hsp_sp_csr: hsp-sp-top-csr@0x50440000 {
   compatible = "syscon";
   #size-cells = <2>;
   reg = <0x0 0x50440000 0x0 0x2000>;
};

Apparently it's just a register block that controls varies behaviors of
high speed peripherals. I'm not sure if DT bindings mandates it, but it's
undocumented in the TRM. Perhaps ESWIN should properly document it going
forward? Also, I think ESWIN needs to check-in the sdhci/eth/usb device-
tree components ASAP, so folks can test it.

Bo

