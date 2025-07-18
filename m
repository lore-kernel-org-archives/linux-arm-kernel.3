Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23BB9C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 06:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VWiqtcrm3UpqYWicE+Qr3IVBY26YZu591zaNb17vRzc=; b=Da+sRG1NXTLZHKjCt2RLaWQT8q
	9qjLQu8rsWOhe3kUSh7G3zlcnwhspZNoE0yPihTgo8V/mX1TdflTB/gvhlH0vrtG60+8KcsVgGK1E
	HqSbOzz4LuN36B1VrrXdLuoVhGOSmlIGnoGMnuidJc6yfNDhIdVID6I0qCYiD06szZFIxP690kHiL
	fQH7A6ENV+wGKQLfkiGA2yfA4n3B70Cswhc+bNpmfjYyTr0l+Qqy+YEsVVYEoRwQITqOa9AcqJcu9
	wGhuPEkOQI8DQTEkHBHCmmWckjAIBO2qDJll8rWXWQBSATL8dJSSGYq+8yNdCKjNfVmon96/uDWHq
	wbmaIdjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uceP8-0000000Bl1q-1cbS;
	Fri, 18 Jul 2025 06:17:10 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uceMf-0000000BkqY-3NE9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 06:14:38 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6071ac68636so294745a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 23:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752819276; x=1753424076; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VWiqtcrm3UpqYWicE+Qr3IVBY26YZu591zaNb17vRzc=;
        b=RVY3wGt+JXZEQK+yLblS4JowYdpHlcnc1e+XwYjYUBXayz2/4bdC5BbhSSSOvVjETD
         tWHdHtD2BFPIpAiFp69y1q+e6Hz1BT9Uqt+WOK3bFGb+cCRbxwtDHfIVbXEBhtS5apvO
         P4tVvYQvw+UqzSfmj5XWbq9BKrNhhP3Q1KvcwxrjtYcOOqdkbefzut+P7n2pz18UzPrp
         SfaZDAbmlqtYZ+ITMyK4drS33Tp45GPvwN3RpSdzv9Tzt3FHn3O+H/tjzNjZw2vT2SAM
         /X7jTrgyWzAxEg7LfY1GjqH8mBplOhCCsp/s7SR2twFapv9TjF02zV4aD8znOKdEMnnz
         jp4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752819276; x=1753424076;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VWiqtcrm3UpqYWicE+Qr3IVBY26YZu591zaNb17vRzc=;
        b=Df7rRNd1hNXy6W2agJ5gN3O1rzOjWtCZ7qn+Aewf3AVc/rwzefkhAzMwJApj3tLlcv
         E+ddVJ/RDaphk5U5K0+RS7oUf6N58BurHNvhLh6wTwlqW+qz3PSU0O2IV6fFj6mOXHaA
         aEBWw0EIqgkGRw32J3nKUZmkULd2PAdoKr0d5sUfAHNuAL5IFHhlGz5s142qHh/z2i0A
         rWOvbWVa+SbYG5CZAb2vVPXx0f4GNHEuqMuELzueq+5cB74fUVNwCLCM4OHza89z9HCV
         M4Ev/lqFDfjF2VecFnYQ8FUVJCMgrRncBeBYcn9CbfmM3qwHHfDhq7qAXgORFf0L9GP6
         2zpw==
X-Forwarded-Encrypted: i=1; AJvYcCWA9N4857t2Oo2SdujimFwjU//pHt5VmY0odshtX8esJPYSWigGOuqH17pcQHqAJTwoJJiKmN2gvzWhsOjDd3n/@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8uGTN4qTNRz1DX7dYASbXbc0aTimmXgvYeM4h8hHEqDaiBm7b
	mU0kHsD35IRbuH9PtFcBqRV/W3oGiaXkDUe2VCHOyYYc/kQL5t/aoJIbv1l79+bunfQ=
X-Gm-Gg: ASbGncvquz6xzsfxuzWkB9Us56DgPJgTNyY63MLEUslTN9Thnofe89izD/UO7iMASG8
	kfIJ/5g9UgaE1WAZkfscw8W4ZFZhb2YwVNXfKA8ynKsFiu7t5pLHK/hhc26x6c6KCVFvrjvZvqT
	XWuGOLTmcMHH7xflokIJ+N49kUs/jQICBQtErameGSPJdq3dpDDsadeqUwyommPO36fyQ5UL03x
	s36o3UaAdjVbx+PxLDn3m3B5ofxSnV53FylqV3lrAjxKATOAL1yNSaxPyDhBdoTaIVGmrMZrdEI
	1mIWaoII2nBg5ZSvrK4bnpLDLg6u7kWMdJQGS8+duHqSfqTLY46LNbeouv7XfmmgA+6K36a9iYB
	NXK4MCZVaTkLwp8DpB9a7y5Rckqxm/OneRniqY4jpcDLCaCrK1hdp
X-Google-Smtp-Source: AGHT+IE9LoG3p8nLyIseKLpQcssOqg7w3tMU8M2AmWdPDwMRm5y5MbuuS+ZNv4TcdwiluHmo/FRJ9Q==
X-Received: by 2002:a05:6402:4019:b0:612:bd30:d320 with SMTP id 4fb4d7f45d1cf-612bd30d674mr1047426a12.6.1752819276028;
        Thu, 17 Jul 2025 23:14:36 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612c90d671bsm476342a12.73.2025.07.17.23.14.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 23:14:35 -0700 (PDT)
Message-ID: <e461e5ed-f512-4d3b-9903-8092dab7f81d@linaro.org>
Date: Fri, 18 Jul 2025 08:14:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/10] Axiado AX3000 SoC and Evaluation Board Support
To: Harshit Shah <hshah@axiado.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Jan Kotas <jank@cadence.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>,
 Michal Simek <michal.simek@amd.com>, =?UTF-8?Q?Przemys=C5=82aw_Gaj?=
 <pgaj@cadence.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Boris Brezillon <bbrezillon@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "soc@lists.linux.dev" <soc@lists.linux.dev>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
References: <20250703-axiado-ax3000-soc-and-evaluation-board-support-v6-0-cebd810e7e26@axiado.com>
 <b7322d03-2ff9-48a3-bdc6-0e95382ed83f@axiado.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <b7322d03-2ff9-48a3-bdc6-0e95382ed83f@axiado.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_231437_850715_BC2AD98A 
X-CRM114-Status: GOOD (  17.17  )
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

On 18/07/2025 01:48, Harshit Shah wrote:
> On 7/3/2025 11:20 AM, Harshit Shah wrote:
>> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
>>
>>
>> This patch series adds initial support for the Axiado AX3000 SoC and its
>> evaluation board.
>>
>> The AX3000 is a multi-core system-on-chip featuring four ARM Cortex-A53
>> cores, secure vault, hardware firewall, and AI acceleration engines. This
>> initial support enables basic bring-up of the SoC and evaluation platform
>> with CPU, timer, UART, and I3C functionality.
>>
>> The series begins by adding the "axiado" vendor prefix and compatible
>> strings for the SoC and board. It then introduces the device tree files
>> and minimal ARCH_AXIADO platform support in arm64.
>>
>> Patch breakdown:
>>    - Patch 1 add the vendor prefix entry
>>    - Patch 2 document the SoC and board bindings
>>    - Patch 3 convert cdns,gpio.txt to gpio-cdns.yaml
>>    - Patch 4 add binding for ax3000 gpio controller
>>    - Patch 5 add binding for ax3000 uart controller
>>    - Patch 6 add binding for ax3000 i3c controller
>>    - Patch 7 add Axiado SoC family
>>    - Patch 8 add device tree for the ax3000 & ax3000-evk
>>    - Patch 9 add ARCH_AXIADO in defconfig
>>    - Patch 10 update MAINTAINERS file
> 
> Hi all,
> 
> This patch series was reviewed by Krzysztof, and I am wondering if it’s 
> queued for the next merge window. Thanks in advance!

It's not, unless you received clear notice about it. Please read
maintainer soc profile how to send patches for merging.

Best regards,
Krzysztof

