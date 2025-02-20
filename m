Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF30C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 18:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+zSBLBub+0DV1mL9PQvU0LTUDmWa3nJU7kZAxsIQwuY=; b=Bhsa3MmHq8XtVql8XVdxHUR4JS
	4/bLyz4oLDvJAgA6/EzM6giWrjbIDAqvx0mvsWZ2HjL3ZOQslb4dAeZLkC/HqBXfaOoHyg0lQehf9
	Kq/49LPRrGN7Seqm6Dm3ZNURJI+85ZdM9veu0i7y+N0736D7MrGVTlkPVE9Sxl2MSja1wBQY4A2Rz
	EsVno9gx2vDm3PjknmrdLl5BzfuQKkFI2mIdzXFJEG9xo0kM4w9PdPZFyP6UAeUGyCOC0ANHGu5Y6
	ZqhKtGv70QKfmP1O5HAQqozAIB+s8MyktelkDZMRRyfSLVbIsujKC5S1aCFpJ8Gx8yAbAySfI6wrb
	D5d3P7UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlBHc-00000002Mtw-2WXQ;
	Thu, 20 Feb 2025 18:28:24 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlB5A-00000002JkP-0vAj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 18:15:33 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3f3fa5699a1so618066b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 10:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1740075331; x=1740680131; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+zSBLBub+0DV1mL9PQvU0LTUDmWa3nJU7kZAxsIQwuY=;
        b=ESG0MhoOm4mQiTudpw+/xt/cMuARZ0qMJMSInfN3zkmUnNIiLFk6JwtN+JXszKn77Y
         lc3pfFjHnvwrALY2EdDsS/Lyc1IFDpTxUAQCTc7mf764vlW9/dUUXsdbCn3SBmMw14LK
         Iubik6wzi8GJBfDmcCJD1BHE+YBFoNhv+pqcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740075331; x=1740680131;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+zSBLBub+0DV1mL9PQvU0LTUDmWa3nJU7kZAxsIQwuY=;
        b=KTT5EmfLk1cFcIb+p5/lwRkWBAgdP3y+8vTfzRLQr29YlSO5Rcx7rJnUI4rSuPgxQO
         J8oivMvwZLKL9k68JREKMRMy4jQn3tO9/LNk6soBjlx32OB1fn/yHmIafSfjI0vlrYYj
         Kr1MDUtyrjgj0PW16DiUXY9H46YIkkrdLUFFFjL9MYi3VHZUf2rbHx53AKtVylcaAkz1
         ufSsG8SCUmQ7emvwqXb3UWwg+0DcUjiV97GIDgaE6YQNMP6wNqj4u68A4dvFWYUpoOvd
         Jb2hMN3/LRuFDBdb/S7F7pZrwg22K0NGifh4T30hxp1U7J/kkUkSYu8VvX9lCj8wQTGB
         5aYA==
X-Forwarded-Encrypted: i=1; AJvYcCU5gipbEAbsNh5OgilZBn9EvuCysxSwjBxs3pXgZltWKS4voiqALHVnlrTHyuO6VibznqbFNxOP92eCZ97kaIyA@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu4VkwXL3hNeyVSHC6nGfZFbUZ+HNwDACSDYhp3+2E2UixSSsn
	rMovZO+gNei0jKNWco4+b/k04M56pqJexbEckRndUo2WBJnRKkiSe+SAQFLq9A==
X-Gm-Gg: ASbGncvjBM1D49LPnVGRdwL8HsjtQOV8NkF6cZ4q/xjT0GRgGhGXt46LRUXxYgRCeZ8
	hfUUQwnTdQRljqQCwbQB59f0HrRevyUX1YFn31MZOPRLfGUpbdlUDmSJHpNnXRVw/XMYIr3g72M
	uQFt7Qjqj+xTJC1E2rmJcc+3ZtVB9rDbBJp3nBDY83jSLF3rR7i3WEDECk25Ofex4BCOd5GkgT3
	7sKesDE57SxmIUc1lnPhww0BiGmbYuOLwAFVq2QV0y96eksvXBzecJeBQ4Fu6SKZvdcYjhI2+FZ
	U9qRQZxpwwitFBSku3ibJ4i2Mj6WNtnsWJqOmd5I9wFAoRvR1FCsfl5kOAo9kQgOdQ==
X-Google-Smtp-Source: AGHT+IH2l0eRcxY3Eu6vwoauLMOYCdGbNvwLkKWPz3/PunqRtomjjR5eVSyx7rBWij/N2juPg3g7+Q==
X-Received: by 2002:a05:6808:2e92:b0:3f4:1dc8:f52e with SMTP id 5614622812f47-3f4247b2b7bmr350247b6e.30.1740075331418;
        Thu, 20 Feb 2025 10:15:31 -0800 (PST)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f3f9ce7493sm2600909b6e.45.2025.02.20.10.15.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 10:15:30 -0800 (PST)
Message-ID: <d5870fbe-0009-4960-9040-99ec35944c92@broadcom.com>
Date: Thu, 20 Feb 2025 10:15:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] PCI: brcmstb: Clarify conversion of
 irq_domain_set_info() param
To: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Cyril Brulebois <kibi@debian.org>, Stanimir Varbanov <svarbanov@suse.de>,
 bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250214173944.47506-1-james.quinlan@broadcom.com>
 <20250214173944.47506-9-james.quinlan@broadcom.com>
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
In-Reply-To: <20250214173944.47506-9-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_101532_285679_1E5E5E9A 
X-CRM114-Status: UNSURE (   7.56  )
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



On 2/14/2025 9:39 AM, Jim Quinlan wrote:
> Just make it clear to the reader that there is a conversion happening, in
> this case from an int type to an irq_hw_number_t, an unsigned long int.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


