Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A174FCD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 10:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uBeImg1GeZ73aPo+Du634svjdTCaD/BADcPkIYViljc=; b=20v+b/+zr2GPUJwwhjLJdzjvu0
	B+ES5hJz4l5xPhieGEZWIRupil4d0/KJWyaPH1fI8ZIIJ91MSfH+43xw3lI0pKa5IN6qNfG8Z9NTJ
	XZtZV6d6lkMMmJPw/008b0BdE1ny+vqkbEC5q6ArEwb5QZZoIv+NpxPx+3BnhjVFVk4mw4IBGa8JX
	4zmH/DGwTiB8qcZ64oRCGLCEzieBcygdf3l12vW6pF7MfmnNgo/hAA3u/xDKUpnnJ1fDnYDHmTwrM
	PK1JaRpsNJFDVzblwNE4SQ4Bq6hdhLmfYvthhiVUWXLUTJl7gfpzEMvIzd2Dmi0NaeYbGGbei3ykH
	gwYAbO7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQc0-0000000FYwm-0w76;
	Tue, 16 Jun 2026 10:01:40 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQby-0000000FYvy-1SvZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 10:01:39 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-307263ad0cbso6705897eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 03:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781604097; x=1782208897; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uBeImg1GeZ73aPo+Du634svjdTCaD/BADcPkIYViljc=;
        b=ly+Y+7emgKZZckT5F3CuvJQsv54TXjMXa9kPJnGbv5V1pj7ixigu5a0DN/n6UNK8+O
         oNgxVhYa+sbitr5SVl0sijn7cFJT8WxHXtNkNpxL+M1G/Vjuj7igl62L9Onh1kysu18y
         +faEki/FHyTI64HTEVui1UlYF4eZDcz4VOf8ENevpAYQTZPPy1pSCA717sxWbcegWc/h
         oJhzkzKyhEyT+6e/2HmbiddrsKlAEe5CMS9OSfIF61CktrDmeibDvIKjNiW5jlpNdzij
         8oI76n+Q07WqcGWMhaKcuTn4/Su3aI1xvUsTlNtZcxJYpY3LNlBxyoGLsWyDbxyHWbAK
         bi7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781604097; x=1782208897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uBeImg1GeZ73aPo+Du634svjdTCaD/BADcPkIYViljc=;
        b=rOHjUQsk9ISdBMsdJbwNLsWBuxPbsU/u1VDuH6XnQqCljpiMPvtOB4DtvZVkhv1xNO
         Dg1pZ0jrh8lVJXY+Vs+BxB5+J5pUMmUaFcG9fkFtU6raIsWuGMMpR2Nm9IVzvkRVpRJz
         TNeYIXJAxJOa9DcZTTjOfytzBF4vafkF/OVsjM6n9Kxa0jR276i9NS8wpyqsh6PasziW
         YRcL62Ok0sojVPrRacJ5FG60l/gmm/10POl4ZjTGmoIirvrUxfAiRIvVpvjd4LWcw5IT
         rEN3Mo+1tc/tlFDSBi91ZwXvAUX5rSbXAXjKj4h2atsViu3S4EBfASskBv72uMf+UQjo
         aC+w==
X-Forwarded-Encrypted: i=1; AFNElJ8qa7P5sMroKdZVFhAnIj1+s1GMtnCgNS+uXt6+nYRKeoxH8CtLG7yF1D7yZWGYXcZJ07CBO0foPq4Fa15LtIG+@lists.infradead.org
X-Gm-Message-State: AOJu0Yz16i9lz8wPV86xr3rF1p4bxdKwl/Fm3suq8U8jNymH9PJW15FR
	fYSCRX8pWJuQvc3x+24p1liVFtY7Lr/ilDDiZVkDx4B1vSns2nuXPsBu
X-Gm-Gg: Acq92OGoXUDRzA0a1T8xc2iGkQQJcqj5alREEmT/SMLdTdEYD35ri6/McAAVRHND81C
	UBh7NbB6kST01DOLKvakVc5ZYFgggEmdPLd0/b2Uf9mAW+fwNr4OS42XqWmTy2FfJgeUUPhUj+s
	rDpU8O2GnSuwWvatwnJ7RQswA/9X8aqXzR8/7gLTrmtvsEU06u0rpYrlBGBiU7atuq49JDVH/UU
	WaraVgaPO/6F9qcyzqN4Sj1TrnvL9ixugZ7f216RBQYI5JlVXi5fz3jF9JXXTgJxAqNoJ9Dw8GW
	43tMpjnNdfGBzUnsxdIT4OgsxTaeOjKShW1PpksPriJTw3YSeyvdJXN8mry4UaKl05W+Q7wj0WI
	d+8G8XCjkDvz24J6IR5M8jknQzbqShEocMMR5DBA5HeRysjOPU0wBCAV0/kj+aRpCCb7k3TZ+VG
	9RWAwyTMC769RzXMndaTRWfPUKn/CowUYjPQ3JlUNiutBRJghXHkzDvU4A6+X0lfz6lxZ+adFBH
	VdQ
X-Received: by 2002:a05:7300:6144:b0:307:e4fa:894b with SMTP id 5a478bee46e88-3093685d5b2mr8915809eec.8.1781604096865;
        Tue, 16 Jun 2026 03:01:36 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5fefecsm18456036eec.13.2026.06.16.03.01.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 03:01:35 -0700 (PDT)
Message-ID: <07761947-12a2-4ee0-9fc2-60511c40398e@gmail.com>
Date: Tue, 16 Jun 2026 18:01:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for
 dual-port OTG support
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Hui-Ping Chen <hpchen0nvt@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Joey Lu <yclu4@nuvoton.com>, Jacky Huang <ychuang3@nuvoton.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-phy@lists.infradead.org,
 Shan-Chun Hung <schung@nuvoton.com>
References: <20260615054911.48821-1-a0987203069@gmail.com>
 <20260615054911.48821-2-a0987203069@gmail.com>
 <178153082322.1456470.14205688450934768854.robh@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <178153082322.1456470.14205688450934768854.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_030138_403317_67A7BBD7 
X-CRM114-Status: GOOD (  20.71  )
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


On 6/15/2026 9:40 PM, Rob Herring (Arm) wrote:
> On Mon, 15 Jun 2026 13:49:09 +0800, Joey Lu wrote:
>> The MA35D1 has two USB PHY ports managed by the same hardware block:
>>
>>    - PHY0 (index 0): OTG port shared between the DWC2 gadget controller
>>      and EHCI0/OHCI0 host controllers.  A hardware mux follows the USB
>>      ID pin automatically.
>>
>>    - PHY1 (index 1): dedicated host-only port for EHCI1/OHCI1.
>>
>> Extend the existing binding to cover both ports:
>>
>>    - The PHY node is now a child of the system-management syscon node
>>      with a reg property.  The nuvoton,sys phandle and clocks
>>      properties are removed; the driver derives the regmap from its
>>      parent, and clock gating is owned by each individual USB controller.
>>
>>    - #phy-cells changes from 0 to 1: the cell selects the PHY port.
>>
>>    - Two optional board-tuning properties are added: nuvoton,rcalcode
>>      for per-port resistor trim and nuvoton,oc-active-high for
>>      over-current polarity.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   .../bindings/phy/nuvoton,ma35d1-usb2-phy.yaml | 62 ++++++++++++++-----
>>   1 file changed, 48 insertions(+), 14 deletions(-)
>>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.example.dtb: system-management@40460000 (nuvoton,ma35d1-reset): '#address-cells', '#size-cells', 'usb-phy@60' do not match any of the regexes: '^pinctrl-[0-9]+$'
> 	from schema $id: http://devicetree.org/schemas/reset/nuvoton,ma35d1-reset.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.example.dtb: system-management@40460000 (nuvoton,ma35d1-reset): compatible: ['nuvoton,ma35d1-reset', 'syscon', 'simple-mfd'] is too long
> 	from schema $id: http://devicetree.org/schemas/reset/nuvoton,ma35d1-reset.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.example.dtb: system-management@40460000 (nuvoton,ma35d1-reset): reg: [[0, 1078329344], [0, 512]] is too long
> 	from schema $id: http://devicetree.org/schemas/reset/nuvoton,ma35d1-reset.yaml
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.kernel.org/project/devicetree/patch/20260615054911.48821-2-a0987203069@gmail.com
>
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
I will fix it.

