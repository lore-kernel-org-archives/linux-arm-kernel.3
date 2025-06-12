Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127DBC71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 20:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7HWklvJfKy7JIO8DgRBbmTBlL/1LchC6bmvGtj26N2M=; b=IYYvC9rXULveDxUSCx4kt13RXC
	l+WIHChTDynJtr0L/ZZGHFC3emEumF/nk9XGV9WU3AU27w4OWZsbPW9ymCmxKJjemUeTXu2WUfw4E
	VCzExBu82skN+K5HOWeVGfftSWHfqC5aKL/T/jgFE9NBiLJKhG+8zijrcbkIhypbQAxN28K7AxoB3
	7IXeuWQv/EFBB1TGZLAlNoxXMiSFAmRqVSRSciWTjdjt5933zVdQbW7EaYo7QbsobveYNpDwBA6bN
	nySV30M4SBUnL2FYu7+8ihPJqLll24l6+MxsdCqLYeG9D0gvJGCkQgc9iZEnWpWPHpZufVHr2kdxJ
	WyeT8eiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPoiX-0000000EW0Z-3Lsg;
	Thu, 12 Jun 2025 20:40:09 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPogI-0000000EVhD-2feo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 20:37:52 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-748764d8540so1354024b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 13:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749760670; x=1750365470; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7HWklvJfKy7JIO8DgRBbmTBlL/1LchC6bmvGtj26N2M=;
        b=WdpabZR0tibVYQWyS1UQtPnhDpc/KbhAZc48N/28uS7T3EVkll7jgSX06bVvFesD7y
         ylaHzAzP2RWxyAntK9J2DVTRm3WA85TQ8fJ3988CsXsniiSVMcsxDpzC1zriXKy+72c4
         DFMYrajydBUhwhsRSb1TU+QlpEJ3bM1Qeam1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749760670; x=1750365470;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7HWklvJfKy7JIO8DgRBbmTBlL/1LchC6bmvGtj26N2M=;
        b=SycadRqlRkJkw9n2w7LAXtcOlQPIBFYHGelWknktAbOy2StXZme03KIL4AB8SoVzG1
         KiB2NYT8jxYPPVOLaGGSYMfCREZUqUZIdq2DRj4bHEaXGPmf9IaWsPDz6Arqa4VNtEgT
         +rhU6qKWyAqSJNkrT4HWhM5otH7IV+BylfbgQVyOoakmO8NkWnt2mZjJYu+FHrMVfdIJ
         8aPU3mPTNEncbNR8abBSobevpSOVjxaNwta/9G+vZVxiDWOiAcbYpLEzoAtab28w3/n/
         CFp+DdjntYhHcpWf3AINdKdrkhpbekS8TLHplYTyF0lsiSOiGUYzORW3tyCSZXKOCiCB
         deHA==
X-Forwarded-Encrypted: i=1; AJvYcCUe314CgRk8oQND4w73D2ZtztRj89doUYOG+PvLunNAzsqfg65oQ+YQuByMWg2pgG6qPKEU4W65vIFwb09gNpj5@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+VPQXh5SP3rgy2NYgANo8FMcSBRuvRUVmXLAmcXGtw/LQcRIW
	wkcZsXX95bS5dvL6pguN7P9p/KSO1dpIkZRgGT/fbUL4eCqkNLSnZb2Dvv1YrY45Mw==
X-Gm-Gg: ASbGncsVd3xlbCiqRIYM9WWokpFqR6ugkTtc8CJMPZnUw6A0crN0Wb27aNSuJhwnw9s
	HaJe2S2OXNoIGCjTzxWDqV2GVygYTBrbE44Vp21FRxTO6O9P8HZy+RsnMPmVNqviIgsY4Fdkfnw
	W/oiR/8A4gG/wQveITfXN7y0PQJHkHnXA9lvQ8nQYwSL+rOneBkeTCHOPU7nfAuJhC3cTUmjyry
	0GHPcEJh9XaX2IgtvVzH4FNPEC1vC/WyT5ElbGEHtn3qhnR0abDHJ1zTvoqg6YE3yxMo/LLK5Bm
	LBTaqfZeZq5X4wR2TlX69dTBPP89/g1Ea0NvJEOw4bOh8tuzLl0e9iW2qKtTq4ki0+Z2Rawvf6P
	yIWTzgctxBsaLWYQicz40f5PrdQ==
X-Google-Smtp-Source: AGHT+IEVcVYG19AKfNaCIbnScw72eqDzUbGwGRCRwGuLcyoKLwoOFWNS0WrxzkDzZbCoZAXbB3hpwQ==
X-Received: by 2002:a05:6a00:2307:b0:742:a91d:b2f5 with SMTP id d2e1a72fcca58-7488f6facebmr786242b3a.13.1749760669874;
        Thu, 12 Jun 2025 13:37:49 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d252esm154388b3a.163.2025.06.12.13.37.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 13:37:49 -0700 (PDT)
Message-ID: <0d957a78-0eb4-4474-a251-50994e1a88cb@broadcom.com>
Date: Thu, 12 Jun 2025 13:37:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] PCI: brcmstb: Enable Broadcom Cable Modem SoCs
To: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250609221710.10315-1-james.quinlan@broadcom.com>
 <20250609221710.10315-4-james.quinlan@broadcom.com>
Content-Language: en-US
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
In-Reply-To: <20250609221710.10315-4-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_133750_682117_5D9C50E5 
X-CRM114-Status: GOOD (  11.05  )
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

On 6/9/25 15:17, Jim Quinlan wrote:
> Broadcom's Cable Modem (CM) group also uses this PCIe driver
> as it shares the PCIe HW core with the STB group.
> 
> Make the modifications to enable the CM SoCs.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> ---

[snip]

> @@ -1354,7 +1417,10 @@ static int brcm_pcie_start_link(struct brcm_pcie *pcie)
>   
>   	brcm_config_clkreq(pcie);
>   
> -	if (pcie->ssc) {
> +	if (IS_CM_SOC(pcie->cfg->soc_base)) {
> +		/* This driver does configure SSC for CM chips */

Nit: does not configure SSC for CM chips. With that fixed:

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

-- 
Florian

