Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D08EC01BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 10:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ab56nxYJ6oFO4EIr5BBI/ZlXkH/IEQRPiOy/1Ule1ME=; b=xjjKbAoD+HJ9yR3ddWf0keFq0Q
	ILCmvGTAQlqpQASVZbnYZO7bu7r5uPST8uwt/9UXgMZT/aZe3pHK8hVo9Pvuhy6Jhqjvrm4wZBhld
	G7VyeRdf6QGPNyBKB3a7/+hdClt8u0/rUR2vlzQc1Z/vbru7rQhZFgbjcWK704zuoPV9v32QwAQ2/
	o3pZoL3SLnOWXsXsSRSWftK6PZCPHoRKnkVT62AWs0wPftzTpB650t6z385q+v6dmT5eHfsqrQYw7
	2zkPERY2QIv1+svL4ZGwgDt8kMeBoqOJrzXJLH2S8yYEZgOlxjE1Dngcltv9YdwGk8Fo+rU2GbvqJ
	+gpvpsYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cic-0000000GXG1-2cLp;
	Mon, 23 Mar 2026 10:41:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cib-0000000GXFs-2hiS
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Mar 2026 10:41:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ab56nxYJ6oFO4EIr5BBI/ZlXkH/IEQRPiOy/1Ule1ME=; b=DyY6jzhhx2d1E4NuCU86jKbrEW
	WpVB1/3RH2WkgNccRgJLHib6pXIE6wF27r1wsJURCEl+HOsta63zJYWysnZ/lh405SXzhkpfK6YEA
	XTW4Wx+KKjM/9DTKVNzJ6nNsoK4nR3KQDtbxNqVE/wvYKsGJvgRIlgUSXKN+P8mcT8sKsZdtjJzEj
	u4oxN4d8sDDPanURjvS/9F9bsKehkJ7L9tGUFDRCa5H7Sx4B0QXjjMi6i3BHvr92gCOA7h+xvg1gK
	DkjhWFEXmhnQQYez4C7Hi0IpMR5YP6rMIo7g3I11cOW2EHZ/waqrE98Yt4mfiNK8ciFb5e4+6sYO7
	HERfeMMQ==;
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ciX-00000001Fzx-3l2j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 10:41:08 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b97e6e48b24so21601066b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 03:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1774262463; x=1774867263; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ab56nxYJ6oFO4EIr5BBI/ZlXkH/IEQRPiOy/1Ule1ME=;
        b=iqckmqLJmXVcfilth0d0QYxmSiUMwyBNkNpvTUYgmC1gUNDz7C/dKiRjDP3LpmV/f3
         AYHSiq1mllsQxEc32UenrPW7/8TVJVSj6IuHAYkzny1PcUGVnfdH3KDj52/oWc2CkoP9
         ssQWNwcWnERMO4+3OiW/azId0ZQJeizKMzjI4g3ST+W3cDZwiompslC6r+7g//QEOBu0
         BXTPy1WoGSsyxIFj5Q4R20Tn7Tvv1ujxiv6rr1I9RsSzCNkZhGZby0z0RPWglgFzLfFc
         6FyrgWl4WdHzg0lE8OOnu2qYnG86NjaPSQ3k4Fvw06gBshCiGQ38GhFsUDOuQ55s2Ege
         dgrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774262463; x=1774867263;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ab56nxYJ6oFO4EIr5BBI/ZlXkH/IEQRPiOy/1Ule1ME=;
        b=fMX2Tkxa1x4OuA85f3uGl7wwoKC2l/6a0VkFtjsQ6BcwVZFPwm4k38ChmW+bbTdc91
         hBd3fBtTUiVeF4QO0x0hzXcvPZS8MFhoSJ2NWToZoy7ukPYNAlERVTaNyWeG5Dd/WsL0
         D7f3lKjH3sMFl4sSyi5Ww4z+8tCnQjV5hzk0Yl+b2rSOGBQmsIHM4E/L9+VLvWWnvq8P
         bdEESOVLI+hVhSBIm1zYLUI5I2gqJPXAtIXT95aqCgRuor2/dbFtXHw5NYs+VZGQ9akA
         dAsNhhFaHBRX4lDFbkj1F8Ammo66Mo70nj0SM8w4RQgMIDW2J6sXnGXjf1UCV9AWoxkX
         Gt6g==
X-Gm-Message-State: AOJu0Yx9z/QEZfDsWvJQW5IJegQAAiGkIKodRXtksxjj8Efe4NtK5ZZT
	k0EJHYoCy33uUPW/HiPmytVF85lJoiHGpaBiKvn7o3Y5yHgKBRDa2PGdUUZqrsEQbeo=
X-Gm-Gg: ATEYQzw9Z3XlRLwVeElAKVqIslnnXmEZMb0WqFZC1CzrMhoGefC9kktbawH2qOmi6xq
	5dhCidZG8t7OeBKU8cXrilxtmbCx9zqg+wpWDYrzOkKvedIDBD4DZKEonkZWW/2yzVYp6gp6RJq
	W4/thm/B9JOvZHBBUkrZvPcLLdGmEmpkS7GMq4bFv6bpWCkZQNbVaciOttl9NLrk70Q+8cUQ6Tt
	0UL9moc3UqC0HixV3QSHBKl3vm47v+gZHgVZ8yUOorHcxlqyVQTZewO62eH/Y0I8ikU1JflOS56
	hlm4DAM0jQLTMQBm/NjhrnslKxkSORNgJ4TXiSIjhFNDjqlxerMeoLntL0+y0VqqsM9oloB8DZg
	2hBKFkhwZ0DodAteuh5b609iukpIwxCunXKoza6IgXFS5V/0eU/D5g4OLdUxwnDKc3WNeZi9hG4
	QbdtWse/A0JA83kULSwDwXLK0F1y7PaB8=
X-Received: by 2002:a17:907:7fa3:b0:b98:4799:e6de with SMTP id a640c23a62f3a-b984799e8afmr633936266b.48.1774262462984;
        Mon, 23 Mar 2026 03:41:02 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.216])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f440f2sm473267466b.5.2026.03.23.03.41.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:41:02 -0700 (PDT)
Message-ID: <962e1094-49f7-4696-91f8-2dadb8686bd4@tuxon.dev>
Date: Mon, 23 Mar 2026 12:41:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: microchip: sama7d65: add Cortex-A7 PMU node
To: Mihai Sain <mihai.sain@microchip.com>, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260126131035.6964-2-mihai.sain@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260126131035.6964-2-mihai.sain@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_104106_261363_B8D53922 
X-CRM114-Status: GOOD (  14.85  )
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

Hi, Mihai,

On 1/26/26 15:10, Mihai Sain wrote:
> Add the Performance Monitoring Unit (PMU) node with the appropriate
> compatible string, interrupt line, and affinity so that perf and other
> PMU‑based tooling can function correctly on this SoC.
> 
> [root@SAMA7D65 ~]$ dmesg | grep -i pmu
> [    1.487869] hw-perfevents: enabled with armv7_cortex_a7 PMU driver, 5 (8000000f) counters available
> 
> [root@SAMA7D65 ~]$ perf list hw
> List of pre-defined events (to be used in -e or -M):
> 
> branch-instructions OR branches                    [Hardware event]
> branch-misses                                      [Hardware event]
> bus-cycles                                         [Hardware event]
> cache-misses                                       [Hardware event]
> cache-references                                   [Hardware event]
> cpu-cycles OR cycles                               [Hardware event]
> instructions                                       [Hardware event]
> 
> Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
> ---
>   arch/arm/boot/dts/microchip/sama7d65.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> index 868045c650a7..1e1ca4f93969 100644
> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> @@ -45,6 +45,12 @@ L2: l2-cache {
>   		};
>   	};
>   
> +	pmu {
> +		compatible = "arm,cortex-a7-pmu";
> +		interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-affinity = <&cpu0>;

According to the documentation [1] interrupt-affinity is not needed here. Could 
you please check?

[1] 
https://elixir.bootlin.com/linux/v7.0-rc4/source/Documentation/devicetree/bindings/arm/pmu.yaml#L107

Thank you,
Claudiu

