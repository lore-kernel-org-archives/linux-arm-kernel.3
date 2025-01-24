Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2D2C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 06:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JeN5L2YEWJnNE+LNbwNgDchuAps1f8wGg5gZvbxuxxw=; b=xWWdd+LQ+DpythCFOe9ElO2b25
	KDW0hehFm4UYDH4o2P2zAxS8DjrVB6Kd7oI6GXezPb08R5m486cSkmEsLovAIaHuhN1GtQaUeb1m5
	KSQKDYEX+zQmjTbgnnoprbaYotBW8TfpwYDlbrqoUpR+aMVEafyJrsL1VE3hiFnzZ18/VAWsgou0e
	oMaxnmf7Ysn58vm3OY6I7TVaKdQoTWOGI++s07lA4REoMFwve0Qw2qAtC3CvQpR34VDqAMafQh+zr
	vhwn/13/Ea0YCX7uOQXjCxP9e6owNqwmOeRMHiBTJi6/Z+v8FKYkcErh/whJshx8+AxFnZDAULKGy
	atdAhcSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbDCd-0000000E0a7-3TYT;
	Fri, 24 Jan 2025 06:30:03 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbDBI-0000000E0Sf-2Mr2;
	Fri, 24 Jan 2025 06:28:41 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2165448243fso37368935ad.1;
        Thu, 23 Jan 2025 22:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737700119; x=1738304919; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JeN5L2YEWJnNE+LNbwNgDchuAps1f8wGg5gZvbxuxxw=;
        b=XjQ4xSttT6TDP3qcN+yY5e8+xdmRvICMlsIs2eNF9uXSMET0IzsKqh63o5XfAoWfQt
         /2cP63xdq0n4TOfhByDG1RFW1pCYVB5jZR5c2JQZUVQfZgeDDnBW1bjh0A2oSu5nsZ95
         3EdKW5eVykZB5gQoopju1ZJw7fxKaMfxXniCRH487Myb784lE4aEtHSfgBWmM3NdgYHb
         Mf7Vb8H7Po1eLxZMZjEPcHIKxxpyDhCq1EToCbz58b/9UDFIICnww4/elCMyDgZV+vs4
         1iJ0Slw+uZCujBKP9A9o1bKjG7Rg1wGGBmMDbVsE7NuWtneK3RGfpR6JtWRnnka/IKZR
         kYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737700119; x=1738304919;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JeN5L2YEWJnNE+LNbwNgDchuAps1f8wGg5gZvbxuxxw=;
        b=aJl/pxxN3ByIeKV5DyP2VN7JK0hMDW7VzMktxSUV+XyIvgyrMDi9P+I/QTNp1v72cv
         r36Q1cpx8gxyr63VPoR8JJYqWXFyPsSnvsqnB7QXU1e2gelJfDBp9XdkdvFV7zWvhMWB
         mCLrrGF5Yvl3HEdCEw/q42IHPoLbekkWf9x0gVcRR3fVOMHCu3l0pXHlY3qMdnmKiZm8
         lQ85kiATGA2ygIuhHh/vg+3V8nQwgsfZpFNATrUQCfNraZ+pricV3rijifbDjHota2cP
         vNUFUa4Tpg1e2bAbWzLWMY/FvfFUzFsbour/iORTHeNSIZVouKdoi0oRsFuhSGaEvt2N
         CFCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHvefKcUkpvXg9zFvLFQLjifWm2OEmR8QtN+HA3mOTgfZ1zHQKu4RPFsiOIbPo04szgxWX5TMYbbIRKCNcok8=@lists.infradead.org, AJvYcCVGjKsocDo/Mw4IL8pIKOx0E60Pu8r/0t5Sl/75oYWdvA6YEpxS9rdn5bpQoaubnyw4fhfikyBp4iB9k8fo4t9q@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi9+lV/cTy0rzYKr2khiVcZb8IlMrjymyrYGZG+ldY7F0BFYHS
	60ulDcbdJjJba/Rba9nO8s63/Av4WnOMe8GK462ofA3pzhjtlR3T
X-Gm-Gg: ASbGncskR2Qxzq1LA+vZKnH/D2vLZMEKCl/j4aOCcl56e3IPDKzt6nDjZXnmXU/Ukv9
	5pW/xdV3+I/4+0KMtqFNuGqnlEWyz0ahcVveh9ejY/W/Wmti2xyn9gjUEejkpckfx3Y9rDbTWml
	+EasUK2A/EW6mLXaRdIEI4u2N3xO+7hfCNKvuGqk8l+IuYNEkAKvhIEmn0kwnrGSoYv5VjUgSrU
	rYPpDV9XcTy5gCwaHld1JyH8coUZ+nHpsnFZHSdKiKaaQTbKdgUox0PkMrzAElq4BoDaCU8kel+
	B5GggxI9iFzWUtJX2z29lfLP/KgFbOhQFDansk03z5VVtg==
X-Google-Smtp-Source: AGHT+IHY/D+A068yAUx/g7x+kFr63Bnlf+rIa04USNxKmK/2NSr0XdbeFHP/urcYPUPpXZvoC5hi8Q==
X-Received: by 2002:a17:903:2312:b0:216:69ca:770b with SMTP id d9443c01a7336-21c3550eaacmr474494645ad.12.1737700118732;
        Thu, 23 Jan 2025 22:28:38 -0800 (PST)
Received: from ?IPV6:2408:8362:245d:56a8:bc4b:53ff:fead:2724? ([2401:b60:5:867d:3631:b7db:c3f4:aae2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da4141dacsm8967865ad.133.2025.01.23.22.28.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 22:28:38 -0800 (PST)
Message-ID: <98387508-10de-4c2e-80ad-05d0d86b7006@gmail.com>
Date: Fri, 24 Jan 2025 14:28:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: change eth phy mode to rgmii-id for
 orangepi r1 plus lts
From: Tianling Shen <cnsztl@gmail.com>
To: Dragan Simic <dsimic@manjaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Peter Geis <pgwipeout@gmail.com>
References: <20250119091154.1110762-1-cnsztl@gmail.com>
 <ce15f141688c4c537ac3307b6fbed283@manjaro.org>
 <59893a67-18c7-4ab3-9b2a-5a17091d4b6c@gmail.com>
 <dffd06a341b58e9689f578c3456cc11d@manjaro.org>
 <65f4e27f-3dc4-4eaf-be4d-265ce0325ade@gmail.com>
In-Reply-To: <65f4e27f-3dc4-4eaf-be4d-265ce0325ade@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_222840_615182_6452DC28 
X-CRM114-Status: GOOD (  20.90  )
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

On 2025/1/19 23:48, Tianling Shen wrote:
> On 2025/1/19 19:36, Dragan Simic wrote:
>> On 2025-01-19 12:15, Tianling Shen wrote:
>>> On 2025/1/19 17:54, Dragan Simic wrote:
>>>> Thanks for the patch.  Please, see a comment below.
>>>>
>>>> On 2025-01-19 10:11, Tianling Shen wrote:
>>>>> In general the delay should be added by the PHY instead of the MAC,
>>>>> and this improves network stability on some boards which seem to
>>>>> need different delay.
>>>>>
>>>>> Fixes: 387b3bbac5ea ("arm64: dts: rockchip: Add Xunlong OrangePi R1 
>>>>> Plus LTS")
>>>>> Cc: stable@vger.kernel.org # 6.6+
>>>>> Signed-off-by: Tianling Shen <cnsztl@gmail.com>
>>>>> ---
>>>>>  arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dts | 3 +--
>>>>>  arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dts     | 1 +
>>>>>  arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi    | 1 -
>>>>>  3 files changed, 2 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git
>>>>> a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dts
>>>>> b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dts
>>>>> index 67c246ad8b8c..ec2ce894da1f 100644
>>>>> --- a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dts
>>>>> +++ b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dts
>>>>> @@ -17,8 +17,7 @@ / {
>>>>>
>>>>>  &gmac2io {
>>>>>      phy-handle = <&yt8531c>;
>>>>> -    tx_delay = <0x19>;
>>>>> -    rx_delay = <0x05>;
>>>>> +    phy-mode = "rgmii-id";
>>>>
>>>> Shouldn't the "tx_delay" and "rx_delay" DT parameters be converted
>>>> into the "tx-internal-delay-ps" and "rx-internal-delay-ps" parameters,
>>>> respectively, so the Motorcomm PHY driver can pick them up and
>>>> actually configure the internal PHY delays?
>>>
>>> The documentation[1] says "{t,r}x-internal-delay-ps" default to 1950
>>> and that value already works fine on my board.
>>>
>>> 1. https://www.kernel.org/doc/Documentation/devicetree/bindings/net/ 
>>> motorcomm%2Cyt8xxx.yaml
>>
>> I see, but those values differ from the values found in the
>> "tx_delay" and "rx_delay" DT parameters, so I think this patch
>> should be tested with at least one more Orange Pi R1 Plus LTS
>> board, to make sure it's all still fine.
> 
> This patch has been tested on 2 boards, and we will do more tests in 
> next week.
> 

Managed to test on another board and looks so far so good.
(Working network connection, no packet drop)

Thanks,
Tianling.

> Thanks,
> Tianling.
> 
>>
>>>>
>>>>>      status = "okay";
>>>>>
>>>>>      mdio {
>>>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dts
>>>>> b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dts
>>>>> index 324a8e951f7e..846b931e16d2 100644
>>>>> --- a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dts
>>>>> +++ b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dts
>>>>> @@ -15,6 +15,7 @@ / {
>>>>>
>>>>>  &gmac2io {
>>>>>      phy-handle = <&rtl8211e>;
>>>>> +    phy-mode = "rgmii";
>>>>>      tx_delay = <0x24>;
>>>>>      rx_delay = <0x18>;
>>>>>      status = "okay";
>>>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi
>>>>> b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi
>>>>> index 4f193704e5dc..09508e324a28 100644
>>>>> --- a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi
>>>>> +++ b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi
>>>>> @@ -109,7 +109,6 @@ &gmac2io {
>>>>>      assigned-clocks = <&cru SCLK_MAC2IO>, <&cru SCLK_MAC2IO_EXT>;
>>>>>      assigned-clock-parents = <&gmac_clk>, <&gmac_clk>;
>>>>>      clock_in_out = "input";
>>>>> -    phy-mode = "rgmii";
>>>>>      phy-supply = <&vcc_io>;
>>>>>      pinctrl-0 = <&rgmiim1_pins>;
>>>>>      pinctrl-names = "default";
> 


