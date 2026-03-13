Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89ACA106FD9D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 08:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hAFGGUj97wUgKBI4E0D3p+1miO3lf4NeLxQAlqvBWVs=; b=O3LPewaaVwABJnfeVBKdDBRDP1
	ML/nI1rxzHHctpBvqqzmCvZdtfJNlh27mg8p1bUoJu0KynsyN3KXjG5vyxBKF4b+4k6AnlczgM1uU
	wgUMdWaV+Ip56Rr8fHfwEbMwD5Onb8gdLTIp6u1w2QPDqu9FBqbXhoqKsxhJBissJCb2qSyJxIveI
	P/qngfK1hJFeCFN7VOocEWQk8yRtNempY+n9xAV71YrRtdw5Jz1uHehXID403OuJnXUogCggRmtiQ
	BI+SvYACXNzt+Dvh0TA+E61WzWZmfb+ySTOUdiBfRr9p119dH+4E2zHLe01TlgGnJ7ufrL80RNCUx
	IRynidwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xpL-0000000HEu7-3Cfe;
	Fri, 13 Mar 2026 08:24:59 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xpJ-0000000HEtF-1l2d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 08:24:59 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so16139505e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 01:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773390294; x=1773995094; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hAFGGUj97wUgKBI4E0D3p+1miO3lf4NeLxQAlqvBWVs=;
        b=K36JRda9TFUrSy5ZPb/buYwFwEZV5469mtjH3XbX85Oij+iCIMTavf0vqFzhBslsar
         1pIJ278JC40LnJL9VByZkb/X6k87Th1pZmgneH5EgC3I+LqBZ/mvu7h7afo9VIRzyHE/
         4qzTBUQfvVOZG+5bZDW1sbe9rnE22eZR34/uPWYbo4I+ulR2Vw8Fx0Y2o31gslhKJ+OV
         VlFyr/OWjOrFj8AU3hCmHZbCxAXPL+wTKaJTo3GtPc0HhON9ebxmZA7kXAD9qbnDi9Ln
         qIMtESynXXjmQ9Twp0Ci8xAvQfc4hs7p+R/cZ90OnbX2MsmpfvqRqF+kvqVs52SiKlzl
         ipWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773390294; x=1773995094;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hAFGGUj97wUgKBI4E0D3p+1miO3lf4NeLxQAlqvBWVs=;
        b=Gl1CzqUjKdja8/CRlsPBMLq0arn5/QIfLrklzZYzc7X5dimp/vet9KSRS6TLpnrXa8
         b/SOMnodMubRe4dC58iKfOq1zSDJTjRTmXaKpMReGZ8TAvHe2mQwcPJSoazWXQd2kK5a
         F+FBTv7GEqO7RIbxA5YOfbhfhjDxQn3ZiIrzPfoGFnJkGiGP5rZDE/nPpYkrEUzobcxj
         Mt36xPcXSiOc3fwThKwr1WgaFuCRz0qvAfESAFjMFVIsLUq+QvOnbkt5tR7ok7twlzc/
         m/+eKfSCvFM2UASxJJyA6bEvkLH+15J2svXTESTuq1pRYyIG4bd/6MDVSBvTJfDdL5rm
         OqeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwPw3AshlnNnJ9NOE/VLRfAhxIF0kIxd6o5qcMFCYfRsk2hxVafDujvI7xil7UzLJaruyXozjfBm1yZuoXnXPR@lists.infradead.org
X-Gm-Message-State: AOJu0YyRR69ckg6Cs3MIm4GWvbSdVXogGuZk5TLjzE766UoqwIkM2+v7
	dG/sHoyceaWRFDAlbQNJWU/ybzzc8sncZqdNYuh/oiFneOLQOfcs5SnI
X-Gm-Gg: ATEYQzxKxGd4dDXZ5M/DRR1E8FkvnMXSP9lUdaBER6i/zkVkVSED2ZbGcqwbQV5dZXD
	yPhAnjmTP8LuSL40RXd3ltOprgFQpjdBsdU0eufMLohriUwXcmHrlE8OjfVchzRjIiETQYpJJzL
	2VbggIcmMAbnn67dSUIIJL6GHYE3/vVYRjWoJKKIsjSY1DKRirhxmKVSmK6UOKcuG5Zl/+sKhsn
	48aCXrco2SxRuOW5D74j64VVm3Sl+5MY6q69xx8Y9pkXTD9QQuxilkMNE+LSAq8W2lZm0ByQmLO
	zEsUd4h6+5gFl4gNLkRXf+hKYwQuK45PZlHPVTi5r1oDBp9fag1RKxB778rElPBgHPzVfnaza+j
	6KdzXZBx2imct0jNhgfh5YgoxOWaWRH+eAvq4mqaG0R6XPbYLcygxRCdV325iT01cKyxVLCDALx
	DXEesWNY7K2r/9ZW215ifkE0N2MwuWxh+c64n+k/PIIn71q7Brdi4mYZyFtmPh5XsrJz7AnrXRx
	K83Z5Y6DWeRriKVYAD1tQtTYvX2ts1ki/TNdEH/0zgxWPUg9E/HjGrf93WXFsH8SMJr1Q==
X-Received: by 2002:a05:600c:3492:b0:483:c3f3:1dad with SMTP id 5b1f17b1804b1-48556713589mr34343685e9.34.1773390294105;
        Fri, 13 Mar 2026 01:24:54 -0700 (PDT)
Received: from ?IPV6:2a01:cb08:91f5:5e00:f7a6:cd23:3f76:a7e? (2a01cb0891f55e00f7a6cd233f760a7e.ipv6.abo.wanadoo.fr. [2a01:cb08:91f5:5e00:f7a6:cd23:3f76:a7e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b65fd3dsm194645545e9.10.2026.03.13.01.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 01:24:53 -0700 (PDT)
Message-ID: <7d1c36ba-2699-4b33-8343-8e0c74fcfe59@gmail.com>
Date: Fri, 13 Mar 2026 09:24:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/3] Register the STM32MP25 RCC driver as an access
 controller.
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
References: <20260210-b4-rcc-upstream-v9-0-17ca1db7613f@gmail.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
In-Reply-To: <20260210-b4-rcc-upstream-v9-0-17ca1db7613f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_012457_488609_227251DD 
X-CRM114-Status: GOOD (  18.33  )
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

Hello,

On 2/10/26 8:32 PM, Clément Le Goffic wrote:
> The STM32MP25 RCC peripheral as an access controller is allowed to know
> whether the clocks are secured or not.
> The STM32MP25 RCC peripheral knows about the clock secure configuration
> of all non RIF-aware peripheral.
> In parallel all the RIF-aware peripheral configuration information
> are known by the RIFSC peripheral which is already an access
> controller.
> 
> Changes in v9:
> - Rebase on v6.19.0
> - Add Gabriel Fernandez's Reviewed-by
> - Link to v8: https://lore.kernel.org/r/20250924-b4-rcc-upstream-v8-0-b32d46f71a38@gmail.com
> 
> Changes in v8:
> - Use uppercase for peripheral name in commit message
> - Add the '#access-controller-cells' property to the RCC in
>    stm32mp231.dtsi
> - Link to v7: https://lore.kernel.org/r/20250922-b4-rcc-upstream-v7-0-2dfc4e018f40@gmail.com
> 
> The v7 is a subset of the v6 and other prior versions, split to simplify
> the review and merging process.
> 
> Changes in v7:
> - None
> - Link to v6: https://lore.kernel.org/all/20250909-b4-ddrperfm-upstream-v6-2-ce082cc801b5@gmail.com/
> 
> Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
> ---
> Clément Le Goffic (3):
>        dt-bindings: stm32: stm32mp25: add `#access-controller-cells` property
>        clk: stm32mp25: add firewall grant_access ops
>        arm64: dts: st: set RCC as an access-controller
> 
>   .../bindings/clock/st,stm32mp25-rcc.yaml           |  7 ++++
>   arch/arm64/boot/dts/st/stm32mp231.dtsi             |  1 +
>   arch/arm64/boot/dts/st/stm32mp251.dtsi             |  1 +
>   drivers/clk/stm32/clk-stm32mp25.c                  | 40 +++++++++++++++++++++-
>   4 files changed, 48 insertions(+), 1 deletion(-)
> ---
> base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
> change-id: 20250916-b4-rcc-upstream-8a8ea3af6a0d
> prerequisite-change-id: 20250916-b4-firewall-upstream-dfe8588a21f8:v8
> prerequisite-patch-id: e4a708d9c6df5725c9598fbd2169636e4e7dc46b
> 
> Best regards,
> --
> Clément Le Goffic <legoffic.clement@gmail.com>
> 

Everything seems fine here, does anyone is able to take it ?

Best regards,
Clément

