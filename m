Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A5FC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 18:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y9YporYfSyQzR9fHjG0FSGyAoboGZe4a/zGZZOFS0qU=; b=GM0cLWWRK+eyy1fDSXY8nloEjP
	PJsgVawDdpU+URJT9y1ndiJJHp0St/RVP9lN7J+MHdk6diKogrRFfEu9BNVGhv325sf+fGgm2hDo8
	uFRqO7yrC47SaavGruonQRzHYRZwwKLI4RhV2KnX7PORF2evhObVl7YYXfBnB/t6GrQLbxyVwkzqt
	nhDPzzRs7Oiijw7IN0J6LCNlAgeSUfRw8w1R+5FahYZnoIeWFMcD+rYQFohLk4XDq07X51zcWK8cr
	0PQKNWg0JNIKcmIn8jRd7Ye8SLkDS2v9/Hw3iraLPXpzofv0EN5ADfyga/8mIo0263nSskPmqWOHZ
	yyYsotXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuFcz-00000003l09-16fG;
	Mon, 17 Mar 2025 18:55:57 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuFXn-00000003k7w-48vS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 18:50:37 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3f556b90790so1326916b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 11:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1742237435; x=1742842235; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y9YporYfSyQzR9fHjG0FSGyAoboGZe4a/zGZZOFS0qU=;
        b=ThabSwf2mUhzK1l7HxThXLb7owkaAhg9XreL+cCfK3P9SBMfugrsnI7hiRDo9QTx85
         sFfXD+6GDPPMVFdX3kbAKTUOOVEEnsnuKmClJuW9pHTeXSI+4f9Pi2BFbPd4lgJ+HT+R
         mcwaTv6+r6mV+GbAOYIp2e/CYuzM7tfdqXrHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742237435; x=1742842235;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9YporYfSyQzR9fHjG0FSGyAoboGZe4a/zGZZOFS0qU=;
        b=BVVjCcYgSD9olFyNLBoZxTYYS+51j5QUbmwtQ0ttX7jBHdWq/enXb0V/uB9MgYzAx1
         7Qg4l6JmoBfSBJTBa7LbqwF8Ym9XREzMsr+aQE2T/KlGJlAYSns/PHvki2Uhyy4awr8M
         9AufFkWpag+3L5kD7OXneyPCmnBefePhPnagtah2wqn/hITit1B6LtvXS/rE5vWwAC8i
         j9qpWZ928llMPK9ERemyhwQ+KyH2uu2vGEl2n2fUQ5N6V+JEjipTqhgZXMiJIXem6wY9
         K2Sbb9Crz/nnVhYmHd+T9s0jN/62NgNVwVQqtHHQ3Auc5fyW7azxHZxJx83zZer9MCOP
         iUIA==
X-Forwarded-Encrypted: i=1; AJvYcCVmaxFQXVEk3elWlSwcoYyYNlWQ1zPPAjozUJ1s2DT+Uqz5bOkQnsvWX2NHlGAsadF2B2FgYmXm8Bzrlpqk97tj@lists.infradead.org
X-Gm-Message-State: AOJu0Ywpix3MZGxxuL+t3I2i1vAwNsLqxwYM7BsKqhq37rWjy1N9SFM7
	zCHOuUD4L2VgUR5mcbph0lIuuPjM3eYduLg3bMB/BNG6Zde7MMG9SxlJnlrozg==
X-Gm-Gg: ASbGncvCTZ//ApQ/FjY9OTJNd1cyek5rQ7Hxy5c+PptM9u/RuASFiuNkfNS1hhS9Cnf
	XeBhF/UcYPXogwngP2Au0qg1j78Wcq0irWLmOoM2QgEUgbq1f/bpCd3iCZgcnkzVPrJ8SWmdZK4
	hbtTelJKy9VCM3P34X18/w0eWZ2qdoFPSDu8zWINuFUW/8xphiQ8s2uHeYgb+hJwrfTy8tNPjzz
	FZnj6afNWmxo3yXMeOsj9QA+7Wehkk++XCBro0LHt9H15xi3Z5zEK8ivunLNZUuE3v7uuliQD3F
	aicqvL0O5ImePD+OSi00qpTAhfBkSipXwz7djaXmNoPfAf2E/w5/sG2GEQsuCB6iLVtD/BJUtj1
	1mc2LUheP
X-Google-Smtp-Source: AGHT+IGxL8qq8K6CPc1NqDH20ecuw/Yp8JNEr5ICv2xc9Jo0XclrfeIZlq6cbKg4apj7kSkvgGBfPw==
X-Received: by 2002:a05:6808:2289:b0:3fc:11a6:7433 with SMTP id 5614622812f47-3fdf0646c85mr6999830b6e.36.1742237434979;
        Mon, 17 Mar 2025 11:50:34 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3fcd452130fsm1887803b6e.14.2025.03.17.11.50.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 11:50:33 -0700 (PDT)
Message-ID: <60ee6fd4-1cc6-4d77-8359-9215e1d604c3@broadcom.com>
Date: Mon, 17 Mar 2025 11:50:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] PCI: brcmstb: make const read-only arrays static
To: Colin Ian King <colin.i.king@gmail.com>,
 Jim Quinlan <jim2101024@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-pci@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250317143456.477901-1-colin.i.king@gmail.com>
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
In-Reply-To: <20250317143456.477901-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_115036_064823_0FC04BB4 
X-CRM114-Status: UNSURE (   6.21  )
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

On 3/17/25 07:34, Colin Ian King wrote:
> Don't populate the const read-only arrays data and regs on the stack at
> run time, instead make them static.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


