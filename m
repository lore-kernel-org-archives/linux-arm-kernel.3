Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5DAD46C08
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 22:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IIAgO8QkRYmg4NNs702q5Q7Jg79m8gPvL1WevdqMxmo=; b=vQXXjtLCRvQi8M8qlNyFRfwQd4
	TMz0FR5vfU2BGJpLIsQRWOOhjyT0mF/GDBRJpmPDahseg+yt+TnB97lXekN5eRQSKDRkd10Kh/CDj
	5nD6ma5vatf18x0zMmF61TShbgyu1t4xO7W7l5qMqR8MRypKJF3UlQE/rQuFQ7HooShwfx+e0tIb/
	Cd+E39WPMW2Tv2nslenXkKdn86v/kkmUP09A7tfkrc58vfwT+JueTUm/Sx5HE6gH+ktaOMmUuvUJk
	BmiH9L9vNAX8Ez4YXuuj63d466txw1x2Xx3xTKINFeS6JKmZen8NIuIC5vRa2cPq+FTctpSnpIbsO
	e+Q0pnzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlE0Z-0000000Gt4t-2pNH;
	Wed, 28 Jan 2026 22:27:31 +0000
Received: from mail-yw1-x1164.google.com ([2607:f8b0:4864:20::1164])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlE0W-0000000Gt4Z-3Be9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 22:27:30 +0000
Received: by mail-yw1-x1164.google.com with SMTP id 00721157ae682-794719afcd4so3671927b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 14:27:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769639246; x=1770244046;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IIAgO8QkRYmg4NNs702q5Q7Jg79m8gPvL1WevdqMxmo=;
        b=JykXk/eOjGMTMIVmhdUc1+yA/kRVN4evSRqJ3drLgt/YrojD/FjbiT0cGXlouorZHi
         m/2lzFzBeZ5oxgxTnFyMPJPOsvarvSGh3XqLD09PDQMSCevp0/YdeFffYzgwzD5SX/i/
         CaUzDad+HM4TfYL1ZNfeJHwXUUzmERQxQykv2anWRUv8k+B7dO864HQEErOXI57MJRj0
         TiBMVqOUFyDiBCHOL5ji8HY4vKjtg4Fq+RsVZp8wfRzYuxKxhPYishASM7QiTj2Nrj/0
         76CYRSs6HNoPAHylpom/hGaLkig8BjKRyuqbiqo+osarbDUJzBH5FYqOwigRXGpzKzMG
         ECqQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8GmiDKR3vFtpK/KiiuJYjzQBPF/tmMiiXF2LtHH8zeGcMweZVwo+PNCNkKf7n1zVWSNhOPha9XdzAPm+feUEi@lists.infradead.org
X-Gm-Message-State: AOJu0Yzqe/5/ZxEfuwTKWa+iKANoOr0JGCW36HpYVDgJJTntsF1FVE/e
	MnfQOJ7Glz/kfhr+xKHg61lRQC9FGboucrabXcMk982Ik6TOFkRbbpULO6pUfedxmcfXApzJmp2
	tf4TIXpCJKVCPPYQmVSWNrwI3luCL0NwS3VgvyaiKsfTPgh0czrS4TVsu1fQ516h0XeGChdVlhA
	SV4UOq9nmKJrqzsw7qiLtQyAzu/0iv/JSnNxJyQlHtRQp3sf2EP1Q9cS01ceOqFccM8GjHmB74C
	AI5wyDRtzgXhaUwuUOlcRvwvufdy6gRCo0=
X-Gm-Gg: AZuq6aKueYREIDKkvCTCrEORVQJFZpJTsyf4M5dGm3fFoJijYYDHGdTRYJCzU0oDMsL
	Y9ySAAYw6Vf7tQVBhipPQZllOs9xHu4KirOXlZEqnfUIqne2i/DOtuilqT3vddiLA9VB2Lrm4gj
	dmbuIeR21JHkvcpF5XHMijPlbQtjlCa05fGxd0hGPsJgFbaGcxib0sOcNUF2JkVyTMyHsPqZ7ar
	fUK5DYaNSgtycEsVpH8aoxwElgBwxxURPA7yNQFUon9Tk91bkNtXN/MuiHUNU9efY+fouipzlIB
	UG7Ijr9ocvU/kP5e6aOE7d0qlb3iVGxW8gH9W2I3R3oMY4qNvpPHYc56+cx1sboo+3qQ8uNyAlI
	kv5LzOcaAGO4rYAWZhuOqyhPFB76hKIa3Fl+VXZGsYAYZVX7mSvC5t0CCBeqMT8OIYJnbrT/Eis
	DA99LychLYPX03lgXwUXswmRckYRTgFyvi1HH3ZxhAYwBwBeMTLg==
X-Received: by 2002:a05:690e:1685:b0:642:84a:7ba4 with SMTP id 956f58d0204a3-6498fc94a7emr5059865d50.85.1769639246638;
        Wed, 28 Jan 2026 14:27:26 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-20.dlp.protect.broadcom.com. [144.49.247.20])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-649960850absm308700d50.4.2026.01.28.14.27.26
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Jan 2026 14:27:26 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-66109baed42so1007768eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 14:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1769639246; x=1770244046; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IIAgO8QkRYmg4NNs702q5Q7Jg79m8gPvL1WevdqMxmo=;
        b=bvJG7DgMmA2Sax6/oqK1kF1efofE+QypIqJrTkHXGhgwulviVc7acHDHL684u9f6G1
         d2xbI4PPZ8gBjzTizdIfrCMctd4PvxoJUnG6Usb2njBwCeQDETNGxSDnzb5jd5WVjOkM
         pQnWTmkevEi8NSiqsdxTLIycf4wpzlO3LByQQ=
X-Forwarded-Encrypted: i=1; AJvYcCVfE8gjquTrwV+JRGFXLINeM5cPrIa26MDbE9hVp47BiglV8iCpSIk6Rsaiy3MUgcc9yPDmfxxaFS/qHMG9/Xk3@lists.infradead.org
X-Received: by 2002:a05:6820:810:b0:657:64ce:b40f with SMTP id 006d021491bc7-662f202a4f9mr3874935eaf.4.1769639245708;
        Wed, 28 Jan 2026 14:27:25 -0800 (PST)
X-Received: by 2002:a05:6820:810:b0:657:64ce:b40f with SMTP id 006d021491bc7-662f202a4f9mr3874921eaf.4.1769639245274;
        Wed, 28 Jan 2026 14:27:25 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-662f996216asm2174258eaf.6.2026.01.28.14.27.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 14:27:24 -0800 (PST)
Message-ID: <eeb09ca3-bc8c-4747-a6f5-29f15335c149@broadcom.com>
Date: Wed, 28 Jan 2026 14:27:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: broadcom: bcm2712: Add V3D device node
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stefan Wahren <wahrenst@gmx.net>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel-dev@igalia.com
References: <20260114120610.82531-1-mcanal@igalia.com>
 <224913c8-52a6-4b3f-a375-e1b4fcc0c142@igalia.com>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <224913c8-52a6-4b3f-a375-e1b4fcc0c142@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_142728_854245_A122E6D8 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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

On 1/28/26 02:39, Maíra Canal wrote:
> Hi Florian,
> 
> Just a quick ping on this patch. Did you get a chance to review it?

Your patch is based upon linux-next rather than the Broadcom SoC tree, 
the devicetree-arm64/fixes branch is not merged into 
devicetree-arm64/next at the moment, therefore 
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi does not exist in 
that branch.

Give me a few days to figure out how to best deal with that.
-- 
Florian

