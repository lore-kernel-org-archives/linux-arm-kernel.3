Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CEBBC98314
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 06:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yM9Je+YRpF14AiZXmjVF0d/iThCOAo3W//vQVXt0asA=; b=yqXKHvkjJ8btBL8SjyLHANTwK4
	Gw+nyv76rmdOXrXwoJXbA26hHjfpZ4pqNdBSsN0+eQq4q7jc6i88wCx+mZorBKITa4Fd7gTwPAAIM
	71lvUqleBcCv46O6O/UU7bwAvKRa0q2RhIxg150jIRkzN4HW5XBwIcXdgR3n4RWsz/bD9GBaZs4TM
	PsGQROKe2hQVvmsvvFV6rycATHwHajYY0cl3qy7LgXXtXXl5NYUTDlHHBti3p2hyCm8arKxBSnUIM
	azvoxNfGQKbHZJjMkXsMqBPALmwzlPlgizeQ1gbpy1VQcWIqUWtDcHRGNlgJjRG4g+y9GrY1BCkpE
	jJLnybhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dFo-0000000ABLl-1Dqb;
	Thu, 24 Sep 2026 06:48:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dFm-0000000ABLJ-2dQm
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Sep 2026 06:48:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=yM9Je+YRpF14AiZXmjVF0d/iThCOAo3W//vQVXt0asA=; b=CkDwKtJkAea1Zog1CsCFBHFsHD
	7a0mX1thtSmg27jacaXT0wcRXiUlSUHRhKVvWpFS44pYdT+ec5XmvJxiVL7RmdP6uDYDdIvjJJc5F
	EX/Eb29dSL6yoasWxDGHwIvC2OLwXoDPgnLxLPocPYLNjroe6nLlnsxxcAOWxGR9w5YqCZhM/0rU4
	wnzMCBOJKST8MVK2Fk5lebwgw/Zeo2MKYw+ay+Zy3doKuOLzI3V+GJaKDfYtQjjKT7ZP41lHYaaNY
	qysHR6qrok5ubPRJ7rco+cWRYcoKUntOpAUiIWg+A9tpb0E5lqccMiSDuJtKqhH6P9negWVOQqjwD
	eEuXjMOw==;
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9dFg-0000000Fc52-02Te
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 06:48:21 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2db1ca069c8so8960325ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 23:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790232493; x=1790837293; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yM9Je+YRpF14AiZXmjVF0d/iThCOAo3W//vQVXt0asA=;
        b=lGujpwF6v7GQkQSSGavaaFL7nnMtp8z3XbNZnl/XUsf+UyFt4oOB/Wq3McJkfXqZxr
         zEf5PKgy32gsB8yLbY2jfgfqlrmrBcO3YjODwbeVFOfFBPoaBCo5o+ej/hAmmQqYiFPx
         KgFABYLtNVzRMOSUwWqJIzr2wjweZmYkYYKI+I/NHo+DsTjM01gbsWMJK60TqfnVFBep
         oG5I4uUk5zMKL31W/xEMyQDsUIxVyyviMzocf6axWYG1RoJgBMthJZo8y9zBy54+Ixl0
         N2KoHcOJZd3ik4AnYwZbRIDjS6LpHjM9Hx+FiPkvwNC8KY86xJgqtj0pBFjoi9FqZ02V
         jifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790232493; x=1790837293;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yM9Je+YRpF14AiZXmjVF0d/iThCOAo3W//vQVXt0asA=;
        b=PCWKt98K2wsfLCLvNwfg4gYjriwKrlhmJ7BYUC3CowSW6q3IZ94+wIvS0qgcl0l2Ec
         nfCw6ptDJpABmyWhL8ZZyIXDRN4QZo2e/Bz5+jt2MsE/i7/J3GDQHnyCiafODIgsu8vN
         rtvNGh5YmgvozuXscavfrX+QCr/IDdNmQxdjoi7lHfF611/pa3q84Uc/L5dsctg0cgNb
         6fNW2XEQO++nQ2MSWGznBVBNCNPUfWEk4ONy6l7SwXVxUzghVVDo+JrxAiLkbsapeWCX
         spSTt0VGwb/xwJxKv65ojVtz3PuBdfgSzRovrsjjQl3yhbXfxYH8WtDudhZwA96aHtV8
         JkEg==
X-Forwarded-Encrypted: i=1; AKwUvBwdIRo5AFq0bqfkrk7gmoeGUg122X/T6NdRPMLXrZwB1F0D3FKNgRKsHv6KJa3ERTsNMnmNmrrkMZ6uyWeUeJfh@lists.infradead.org
X-Gm-Message-State: AFuF++lNCyIzy4iOal9mlv+PtdHlnGcoSJGEJH5hjpnsnmcwbyno7yBy
	8yknjm5rl2LKQAEM0HzWHxCTSHrMtngTh+J8V8KgFfnB18TabtyIgonz
X-Gm-Gg: AYBFou0+7nErzdAliRqIfM/PGk/HUbKItZnHP6ugy7JHHb9SeplBepXvhec5ZAU8oQS
	cJWfs18YRHEnuZfXSUZKpJEF/oQws710mWhgnINN3JPoKCKg5pnbexkOVVRLcQY8/IjovVL4Prc
	QWgl1Bkt0j0mywDOOnBPWWNpBT87f3crZJL/f6iOaOLyi3e6/F95/PO22feaV5Tgbl8He/8RNu1
	JAeqmK1oQmeDfSPNvxCyavEnapLA0yXLxs7dLexBUlEesJYb249a/fJLq/FwhuRyT4q/YrtXc0d
	eH1aTAUpxBtOfTdxNsvVk43lHrngbEDeJr3NVo1wIY/lj1okrmt35EOjCtb2iaujhIbyaM0a80+
	Kk6336DuJuus6UVcj4Tfqn0PcKCeyOEnWZPIX3RDXLSh64Doe0oanxtE1r1E782osqdfd5Fu1vw
	OI4chJ7GDRul3ncrMNZPQy/nykOti1svxAcxG2dWEYQCSVG9PSsbWJTMYyeiefSqJJXEW6i/MRo
	Tvv1+CzvZR51LexCw2TuuY/txBWV3JZxjIjL1tuRoLZBLzz2RZ5J06c0fYeMU0tyA==
X-Received: by 2002:a17:903:2f4b:b0:2df:448a:e016 with SMTP id d9443c01a7336-2df7dc1e167mr13424515ad.34.1790232493096;
        Wed, 23 Sep 2026 23:48:13 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5c7d82sm21463085ad.46.2026.09.23.23.48.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 23:48:12 -0700 (PDT)
Message-ID: <0e6fb86c-e995-4ef1-b08b-44a5e8be93f9@gmail.com>
Date: Thu, 24 Sep 2026 14:48:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: nuvoton: ma35d1: add USB controllers
 and dual-port PHY node
To: Jacky Huang <ychuang570808@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Jacky Huang
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Hui-Ping Chen <hpchen0nvt@gmail.com>, Joey Lu <yclu4@nuvoton.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260914031859.385224-1-a0987203069@gmail.com>
 <20260914031859.385224-3-a0987203069@gmail.com>
 <2d07e535-3029-41d0-9dcf-8772f7330434@gmail.com>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <2d07e535-3029-41d0-9dcf-8772f7330434@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_074818_139127_A5824786 
X-CRM114-Status: GOOD (  17.96  )
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


Jacky Huang 於 2026/9/19 下午 01:49 寫道:
>> Add the USB subsystem nodes for the MA35D1 SoC and boards:
>>
>>    - usb_phy: standalone PHY node with #phy-cells = <1>, covering both
>>      the OTG port (PHY0, index 0) and the host-only port (PHY1, index 
>> 1).
>>      Uses nuvoton,sys phandle and HUSBH0_GATE clock per the binding.
>>
>>    - usb (DWC2 gadget, USB0): phys = <&usb_phy 0>, dr_mode = peripheral.
>>    - ehci0/ohci0 (USB0 host): phys = <&usb_phy 0>, companion pairing.
>>    - ehci1/ohci1 (USB1 host): phys = <&usb_phy 1>.
>>
>> Board files (ma35d1-som-256m.dts, ma35d1-iot-512m.dts) add pinctrl for
>> VBUSVLD, PWREN and OVC signals and enable all USB nodes.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 36 ++++++++++
>>   .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 36 ++++++++++
>>   arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 65 +++++++++++++++++++
>>   3 files changed, 137 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts 
>> b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
>> index 78534d613486..0a068abda6e0 100644
>> --- a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
>> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
>> @@ -97,6 +97,16 @@ pinctrl_uart14: uart14-pins {
>>                          power-source = <1>;
>>                  };
>>          };
>> +
>> +       hsusb {
>> +               pinctrl_hsusb: hsusb-pins {
>> +                       nuvoton,pins = <5 15 1>, /* VBUSVLD */
>> +                                      <11 12 9>, /* PWREN */
>> +                                      <11 13 9>; /* OVC */
>> +                       bias-disable;
>> +                       power-source = <1>;
>> +               };
>> +       };
>>   };
>>
>
> The outer pinctrl group node name does not match the MA35D1 pinctrl 
> binding. dt-validate reports:
>
>   'hsusb' does not match any of the regexes: '-grp$',
>   '^gpio@[0-9a-f]+$', '^pinctrl-[0-9]+$'
>
> Please rename it to "hsusb-grp" in both ma35d1-iot-512m.dts and 
> ma35d1-som-256m.dts.
>
> I tested this change locally. Both affected DTBs build and validate 
> cleanly after the rename.
>
>
> Best regards,
> Jacky Huang
Agreed, hsusb doesn't match the pinctrl node-name regex. I'll rename it 
to hsusb-grp in both
ma35d1-iot-512m.dts and ma35d1-som-256m.dts in the next revision.

Thanks.

