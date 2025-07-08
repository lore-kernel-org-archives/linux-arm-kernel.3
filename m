Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C06E0C83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 10:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wW9jD4nttc2FFz4tK+x1u/l3hcsbPGY6bGVXePrYDv4=; b=K+8X6ny5734dbUMkknLFr6h/DB
	fPBbS+nzqJnu2TSkep/6m8t9AxX9jLzRzWhhHmLA5vnLM1aPy2rR8nlriS+1zHSs0wIOLEHlYUM4l
	FUB5Zjx7i7oy8kN0TiNIoXI8NYtZxMmGmHj7NGXJKQFq2pRGmrEebFjZO4KYgU1AJOB4cikPrau2y
	yHEvdVWy6QcUbM3uCbtmFsNUASsC6v9hzxINDIoLNy9TbH76ZWbaw7F8Lot72Kzl7s14owIyHu8hQ
	NUfNO2BEhGDLw2OGD1vpgYMvE8BTowiNQmBwDUy7NYxYupMR/mwT8UqCmIKcXAojXVEhg/NEIjEL9
	lQ5tTXjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ5ca-000000054nE-1oWG;
	Tue, 08 Jul 2025 10:32:20 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ5Gy-000000051sL-05no
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 10:10:01 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ae3b336e936so773311166b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 03:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751969398; x=1752574198; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wW9jD4nttc2FFz4tK+x1u/l3hcsbPGY6bGVXePrYDv4=;
        b=hBjaDGayGOZwi5dImtjIhuJVPfjZOLisHNU9DuNRPDEo3bQODfk8lsRPt2Afp73mEE
         YWabevXkdI92GhL7nv+ymm9DATGKBfZUnaAbRIdbE3GYme0dfVHnVb07HgVIJbwHX9Ee
         yofRF+KFpi+uSPlPOU1WSkrzL4DKRp4bj0CJZk3FYw85p5wu0EsW2PAgBNgEwAUfhiiI
         LBNwnWTmaNyXP51E0aRo++i6NJkW2Ecve+IHmdKNm5HWQkZU9i+C0jj9tZtJh8WrnOTa
         5q7o7UQPZaBy2cRLWkZdvDRJ4T2bajYKaQj7hab3iFUBUBaIOMwUJYKRubhzmYVX3Wh9
         Xncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751969398; x=1752574198;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wW9jD4nttc2FFz4tK+x1u/l3hcsbPGY6bGVXePrYDv4=;
        b=bk+e0+gSKavqfbhvw2FTwo3Apf191aU43zNdxY6/pHfYVKB+l8UE3eBM1YGxZWX/FA
         DvM7RtBVEFZJV6chXakTMVV4orXiE7qbte5gJP7ujN54M1yk8vTee45SZpTkEh7q3qLr
         sXxl/dMH52ONgv3RpARsJXCNlSIuB9Chw+PygRHgbW0xB/aEKcwU98dvbvJ5/phggQwi
         1hYrWRv9cJ0MbE8vp8dvv10k8azE+TNObktGCn5aS95LCIx+TaCMvbMo20DLSd2rfrDw
         Lrt7OtHhpV7W7lD55BYKKbyY0zaERzw+zipkI8YJ4wy9D7aZGbaRe++TMcBbvXCMJC3f
         3GDA==
X-Forwarded-Encrypted: i=1; AJvYcCUVr4ta0kV3Ul0NWn9YSdfemeE6LH5kxx73+jMZnmr/nn6ho6PPDCoKzrf8/ntjWG9gNzLhwxheVihhD4NjfumU@lists.infradead.org
X-Gm-Message-State: AOJu0YzR2P2xf5fJy6ReRdOxxmL8u+LAtkWOdhccBon8UmC7lO40ne2y
	sr+VV88qV8MqqqkznUIY8/LDh/pCI2wF1CIH+nIFI2BgW2j56Jy8Wk7821lWtItqaRg=
X-Gm-Gg: ASbGncsq0yB6uMnKkAjyAWE3UU4zYybpJoLaczM4Qv3ImJGDFWbNlc1/BFoEBXxoY6z
	xnuM5RZvJ5DpRK5wmnSPgUcRBPS+Ca0WzQ1u6k+7KMAdpYzqs89XJg4p/1CBKakEs467lqzMGDC
	GIZtfdUdi0aVvXpIJaXdwk7LmmkoWdvGMQFLwFTwQ1YZ6OWjUzgTFWWj6YHEBH93REq6JgEPJfB
	+JFsoW6RJlO5rnoDjvzIdy8tdz0gbm60euySjcpADOo04wjBEnq6ySTVPhO51RAAkui8Ph8kO6R
	R/c8AGz39HGJN9cd4SbmZb6r9y9gnLNfflRf00DkjZIxs/rcQYHoMLsnTt/N8LZ0c/aUwQ==
X-Google-Smtp-Source: AGHT+IFDhnpFLf+9SokY6ajJmYa0R4eHOoHCTd+GxI/yEq5DE0Ci4xD7oIth8WUim7upiSOwhgaH5Q==
X-Received: by 2002:a17:907:1c26:b0:ad8:8719:f6f3 with SMTP id a640c23a62f3a-ae3fe5c28d7mr1545563166b.22.1751969397715;
        Tue, 08 Jul 2025 03:09:57 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d931csm875767566b.10.2025.07.08.03.09.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 03:09:57 -0700 (PDT)
Message-ID: <7c8c7a25-c373-452a-9fe8-8b2d92ddd885@tuxon.dev>
Date: Tue, 8 Jul 2025 13:09:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/9] arm64: dts: renesas: rzg3s-smarc-som: Update
 dma-ranges for PCIe
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
 "mani@kernel.org" <mani@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "lizhi.hou@amd.com" <lizhi.hou@amd.com>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
 <20250704161410.3931884-8-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB113464920ECAC2C3CB89DE2D5864FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <TY3PR01MB113464920ECAC2C3CB89DE2D5864FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_031000_065632_31E1A1BE 
X-CRM114-Status: GOOD (  19.00  )
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

Hi, Biju,

On 07.07.2025 11:18, Biju Das wrote:
> Hi Claudiu,
> 
>> -----Original Message-----
>> From: Claudiu <claudiu.beznea@tuxon.dev>
>> Sent: 04 July 2025 17:14
>> Subject: [PATCH v3 7/9] arm64: dts: renesas: rzg3s-smarc-som: Update dma-ranges for PCIe
>>
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The first 128MB of memory is reserved on this board for secure area.
>> Update the PCIe dma-ranges property to reflect this.
> 
> I see R-Car PCIe dma-ranges[1] and [2] maps all possible DDR area supported by the SoC?
> Do we need to make board specific as well there?

I'm not familiar with R-Car, but if there are ranges reserved for other
purposes, I think we should reflect it in board specific device trees.

But that would have to be address though a different series as it has
nothing to do with enabling the RZ/G3S PCIe support.

Thank you,
Claudiu

> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/renesas/r8a774e1.dtsi?h=next-20250704#n2487
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/renesas/salvator-common.dtsi?h=next-20250704
> 
> Cheers,
> Biju
> 
>>
>> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v3:
>> - collected tags
>>
>> Changes in v2:
>> - none, this patch is new
>>
>>  arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-
>> smarc-som.dtsi
>> index 39845faec894..1b03820a6f02 100644
>> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
>> @@ -214,6 +214,11 @@ &sdhi2 {
>>  };
>>  #endif
>>
>> +&pcie {
>> +	/* First 128MB is reserved for secure area. */
>> +	dma-ranges = <0x42000000 0 0x48000000 0 0x48000000 0x0 0x38000000>; };
>> +
>>  &pinctrl {
>>  #if SW_CONFIG3 == SW_ON
>>  	eth0-phy-irq-hog {
>> --
>> 2.43.0
>>
> 


