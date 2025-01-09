Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E5FE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 13:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QqXsToV0HiRvEsZnF5hoveg3aYzeGpkKlIECOe2VD8g=; b=M6AKvtqGEwIgyzgDp+FUKQXm1z
	V5FANTOvroFuX6Ljf61NBnMkU+ZX1xTSonSX8eg3F6UqcprtvuHqefgHnQCof8c5e9dKqtKO8eEu8
	Uwqaad3IeQxm6xWm/z2vDSWgAyRRjMczxbYXKWXYALzTkFB+9jU11/zcUKm9f/DEWrhTxUXo37Dxd
	h6Nh/Urf425ax61R9mP6/BsI44GuVQ3EA1L6mHyiHKNcBbIXzgcqeac6CzvWdPlBZqE0dmWEK906O
	OQzrP2v1pKt1zd3MD5vOPqBGiu8VXV2irvRxiPRzm7BxWZc1ISNpG6gQP7X7YrPQC5yfxFFiORIuq
	I9/OjEGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVsz3-0000000C7qt-00y2;
	Thu, 09 Jan 2025 13:54:01 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVswY-0000000C7O3-1SBY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 13:51:28 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4362f61757fso9925715e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 05:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1736430684; x=1737035484; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QqXsToV0HiRvEsZnF5hoveg3aYzeGpkKlIECOe2VD8g=;
        b=NH6YY+FuLGOyYuodobs5KL4yK49BPTREbdOog3J2230qmCx6zZn+xEExWuKUTFeF86
         RYLaosLfXZwl5QDEQiPKAN7Fncy3Pix3iEc2XLzQ+Cp7gVgxLFd+Izc5pyXGu3gcz9eN
         ag0n0a6OagZG0Y63/AGkqCUrvugNoOTqtl7DM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736430684; x=1737035484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QqXsToV0HiRvEsZnF5hoveg3aYzeGpkKlIECOe2VD8g=;
        b=YALjNdqAmtaXnZCpa4BsdRP2g3J34N7bpCxvfTK2ezynzeznOKmJSInFujFyUb9q1B
         8mS9tbOlKuEsMK00SViybU6pWkf5vyQzH2dtrKM/83/j8Wrc4fiQeHZ38AXNBg1b5lAj
         GC03EsBRgZAK49lkVEnX/XOGBOldFRBZTwc3zKsO/hml3HBRT9pFzEI7su7dILqlItjm
         tkDaYzvY4t5hUI3k6w4eNAKkje74I2va7leCB6XyHuLr05OlZnE8soBmxno3jlUX1J/C
         919CzOmTdLF6eQotVdbsSge/DsG4W6f1hlcenSXyXS8bklSmLDcjeyA/sOKsiHWsMioK
         FgZw==
X-Forwarded-Encrypted: i=1; AJvYcCXhp4ZIJVClpH01zOpbn7mUL8Mp+hcswsVauXIdyGgkQkYexhHwg+US+MWxwgItkrDoF3aofxm8dZLGhVmoDJeP@lists.infradead.org
X-Gm-Message-State: AOJu0YxJq71Ah5m3IvRhE4eLq+x/9zC2lCk6JFBJWH+z8Z5V1Q9CVoK3
	2eMzhSmVje03/D9k/S5NUDKnas3qcdEv115Rtd4MK/x3gdPkUm4ZBva6x3WeKhc=
X-Gm-Gg: ASbGncviAkMg+9Ty7wuU3nIydHHmn927TX+gV+G2sboC18kkttnNGwvrVQOr3d09ZpS
	sUCWofEfY06uLpoyf8MShLgi6Gh8u9WjItKuad2RVwxLdQiftttpvd1gOsQAvq9GrkEdKsRWnbI
	jVRnWSuMYxA/9k9VkjnKlhgGLmStRmauu5BDe+KNZKCSEFBQl3tRCL17+E4vL2rc9sFMJ3QaCKE
	jm4xTmdPLt/UK7fS0AMhV6xwhtA0NL4sGOWrgk5+HVHlK+iItbYtcoanAZZrTh/9hX2tJFDaHNq
	lTaL79nZpxqlUfgLpucpLWM+a8/ePl4XjMXBsnsLmNi6fgvvLryZ36+4iixGTRDjiTHJn+UbPVL
	gccqqVqtpeWxGaw/K
X-Google-Smtp-Source: AGHT+IGCwLti8xz/uAXqjvFyEfZu8OW3NVEiOzPgOAaQKlMAAsxOUKHoSy2tGbVe3mXX1vMem7j5oQ==
X-Received: by 2002:a05:600c:1d1f:b0:434:f99e:a5b5 with SMTP id 5b1f17b1804b1-436e271cf4amr47062045e9.28.1736430684252;
        Thu, 09 Jan 2025 05:51:24 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f? (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2dc0f69sm55525035e9.13.2025.01.09.05.51.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 05:51:23 -0800 (PST)
Message-ID: <8ff7ca4f-227d-40c5-867d-497e03bef72a@smile.fr>
Date: Thu, 9 Jan 2025 14:51:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: ti: k3-j721e-beagleboneai64: Enable
 ACSPCIE output for PCIe1
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org, kristo@kernel.org, vigneshr@ti.com, nm@ti.com, afd@ti.com,
 Romain Naour <romain.naour@skf.com>
References: <20250109102627.1366753-1-romain.naour@smile.fr>
 <20250109102627.1366753-2-romain.naour@smile.fr>
 <eu5xmihnffmqas2x2ioleuzzvyfbffl5eqlwuqfe4mh6qa2rzy@7mmuxsbkmz4o>
Content-Language: en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <eu5xmihnffmqas2x2ioleuzzvyfbffl5eqlwuqfe4mh6qa2rzy@7mmuxsbkmz4o>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_055126_768967_1FE24BE2 
X-CRM114-Status: GOOD (  17.77  )
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

Hello Siddharth, All,

Le 09/01/2025 à 12:49, Siddharth Vadapalli a écrit :
> On Thu, Jan 09, 2025 at 11:26:27AM +0100, Romain Naour wrote:
> 
> Hello Romain,
> 
>> From: Romain Naour <romain.naour@skf.com>
>>
>> Unlike the SK-TDA4VM (k3-j721e-sk) board, there is no clock generator
>> (CDCI6214RGET) on the BeagleBone AI-64 (k3-j721e-beagleboneai64) to
>> provide PCIe refclk signal to PCIe Endponts. So the ACSPCIE module must
>> provide refclk through PCIe_REFCLK pins.
>>
>> Use the new "ti,syscon-acspcie-proxy-ctrl" property to enable ACSPCIE
>> module's PAD IO Buffers.
>>
>> Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
>> Signed-off-by: Romain Naour <romain.naour@skf.com>
>> ---
>> With this patch, we can remove "HACK: Sierra: Drive clock out" patch
>> applied on vendor kernel for BeagleBone AI-64:
>> https://openbeagle.org/beagleboard/linux/-/commit/ad65d7ef675966cdbc5d75f2bd545fad1914ba9b
> 
> [trimmed]
> 
>> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
>> index af3d730154ac..32a232a90100 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
>> @@ -5,6 +5,7 @@
>>   * Copyright (C) 2016-2024 Texas Instruments Incorporated - https://www.ti.com/
>>   */
>>  #include <dt-bindings/phy/phy.h>
>> +#include <dt-bindings/phy/phy-cadence.h>
>>  #include <dt-bindings/phy/phy-ti.h>
>>  #include <dt-bindings/mux/mux.h>
>>  
>> @@ -82,6 +83,11 @@ ehrpwm_tbclk: clock-controller@4140 {
>>  			reg = <0x4140 0x18>;
>>  			#clock-cells = <1>;
>>  		};
>> +
>> +		acspcie0_proxy_ctrl: syscon@18090 {
>> +			compatible = "ti,j721e-acspcie-proxy-ctrl", "syscon";
>> +			reg = <0x18090 0x4>;
> 
> 0x_0011_8090 is probably *not* the "PROXY" register i.e. it could be
> locked with the help of "CTRLMMR_LOCK0_KICK0" and "CTRLMMR_LOCK0_KICK1"
> registers, in which case the CTRL_MMR region needs to be unlocked to write
> to that register. On J784S4, that happens to be true, which is why the
> proxy register 0x_0011_a090 was used at [0]. Please test with 0x_0011_a090
> which is the "PROXY" register on J721E as well, i.e. it can be written to
> unconditionally.
> 
> [0]:
> https://lore.kernel.org/r/20240930111505.3101047-1-s-vadapalli@ti.com/

Thanks for the review!

Actually the Proxy0 vs Proxy1 choice is not really clear for me. We have two
proxy to reach the same register:

  CTRLMMR_ACSPCIE0_CTRL Register (Proxy0 Offset = 18090h; Proxy1 Offset = 1A090h)

From my testing both addresses works (maybe since my SoC is a general purpose one).

When and why Proxy1 must be used?

Otherwise I'm fine to use  0x_0011_a090.

Best regards,
Romain


> 
> [trimmed]
> 
> Regards,
> Siddharth.


