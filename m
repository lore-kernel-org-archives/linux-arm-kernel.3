Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42C1C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 12:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kQD9ZN86fbnOv3Py6c0GNoRIiGV/UrKy3H7tuotUIpg=; b=eWWm2RIXBnGTxc9Y3zpqcd1a5T
	Wm9sUam50pC+tfptdujZMWdcoJsm1EuM65YMtwFCYPyOWW9JcsHn1LyMJDtU59Nu9F3Qjr7P37uwu
	8D/B6KSa63RJtOWeThThVYrAusSjkWRBDA1J3vFokgNbIDu+B/sj/T+eUVUwVWqm7KeVsc/9JqXIR
	rqsrgbf16gKM9eLwnx5wimDk9OqBmDkyoeqDg40WZsiDNk4dajEtW/9WWIxhJ+vOy8k/4LHsKReNi
	chZf8bvUj2vzPwucWX4/9sCiETg7C5lchYCBL+RZX64L1rXVHaBD8h4hxZ5wS/6BSXBkuc2RDcRtI
	AEwXec+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukLuV-00000002lF8-1aMw;
	Fri, 08 Aug 2025 12:09:23 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukLFS-00000002fe8-1R1o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 11:26:59 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3b78d13bf10so2049255f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Aug 2025 04:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1754652417; x=1755257217; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kQD9ZN86fbnOv3Py6c0GNoRIiGV/UrKy3H7tuotUIpg=;
        b=Xa/3n16XBjHqmI6alHg5gLc2KxDBq0lO8cpZwjrHdwKK3C3dKjtoME4TKZ2HU9o4xU
         YzkmspsKubDU9OwPwSa5KAI/yNu+uL4RI7GRV/tipTAj42/rK24DbQEHnAOwgQGgd/8i
         GlTF06Tsd1xC3DlW4VHVI2TOsq/4nbYB+fjMExMCYXMgf21nRwz5ORhYY1837fM2zNDb
         UY7pd2QG7MGmXUX+5lrnNOKcZRuf9Ttmk4dp3LTXpnbKR7UFTg5TKsKxovoZcNawkbZT
         cF8GFE/gbCfAWDUuo2TKdC77sfoK9hm97s4SCqpZhnAwqdFFD1Ngdq3rmN5HsEDv8hFN
         VHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754652417; x=1755257217;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kQD9ZN86fbnOv3Py6c0GNoRIiGV/UrKy3H7tuotUIpg=;
        b=UGuRHDQteHrEVPxvTNito3HL9UhPP5tX7UXz9IfCbBtsST8IvkPbqS1aDL6NzCrc2l
         MB3AVxTnKPvNxzaW/I0puRvb6olUun1IZbq1nBtEcycWzm21MmC4NeiQT0fMZeSSXA8n
         5kLZyRG9lTdjoSIykpwkFN0FmKiJS/P7r4B13M94RoNTuZ1H6NRiZCbUiaoJtB2WPDYg
         b1QqV1VVV31uHizkmkK79acXL97upHUf8VR/bTI5biS+yXmKz8eAwQDL4Mahbs9nKWL+
         JaNaM53IOJFadG6nGrH2kUiECtSh3hY7TpKjf+HdeizyzFDEgJ9KOZcTXbd9QCqhOdDg
         Ov2Q==
X-Forwarded-Encrypted: i=1; AJvYcCV6gt1+oDlcAE25YEtCx52LpDHF/rqBex8LImTvm3EwGKb6q+0Xwmrd+H42Y8dFqYTrAx5XAK/xUkZD+If/8r+t@lists.infradead.org
X-Gm-Message-State: AOJu0YwXz+y+eiZ1RsGu4TKmWwGK0K+fuizJ91ApHVp1zmvgwvxLU0U3
	AaEmMXmrkwNZ1JJg+vCFamiDojqJAwH+0guA5LSfuhxDZv6TPAwX6+QdoR3B6wjVeow=
X-Gm-Gg: ASbGncsHyOZZ4pOSBomfoSBkTRFGCTLk/lRRCf2aMQtn+YO+hhUGxIVzRnQdOMDV17G
	2EO7X3UXYbn9BkFUVindocndNYCNWzBNKCSkCK36E7KYNQUd5jcDSFE7si8x7nnnsRrY3yI058z
	zk4I9ge1z0fvr+gvbCpmcFe0+KmHak6SkU6JcAjHVGyXgYzu5b9LOJWNrnhisZlcGZB/pdC0bEP
	IftfafPjLs8T3bf9UspMLXnI5mYV0UNw9dQ8D1QN/0iL7yU34BHPcp1AOl7Tl/es0Xq1vswOpZp
	S/53ZrdUermFeIB8vtziR/KEf5vxJFZfNu2xP2Ko5veoKl0W1rdgXKtCgpAOpEXFLgpmNaJbIdB
	+cmixDIMe2QoqUGSGckW/y4JT5tcWFqc=
X-Google-Smtp-Source: AGHT+IGrw6qJfbOAqNVKVNHju607OPKnyRwv/T0hcF1UsbBaa/pvlDY7WeC0PqYLDYFHFXx38VFdTg==
X-Received: by 2002:a05:6000:26c9:b0:3b7:89c2:464b with SMTP id ffacd0b85a97d-3b900b4496bmr2232459f8f.5.1754652416806;
        Fri, 08 Aug 2025 04:26:56 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c4a2187sm31150895f8f.70.2025.08.08.04.26.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 04:26:56 -0700 (PDT)
Message-ID: <0addc570-a3c6-4d7e-9cbd-06eedd2447bb@tuxon.dev>
Date: Fri, 8 Aug 2025 14:26:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/9] dt-bindings: PCI: renesas,r9a08g045s33-pcie: Add
 documentation for the PCIe IP on Renesas RZ/G3S
To: Krzysztof Kozlowski <krzk@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, catalin.marinas@arm.com,
 will@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, lizhi.hou@amd.com, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, Claudiu Beznea
 <claudiu.beznea.uj@bp.renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20250709132449.GA2193594@bhelgaas>
 <2e0d815a-774a-4e31-92f1-71e0772294c7@kernel.org>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <2e0d815a-774a-4e31-92f1-71e0772294c7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_042658_383433_04C9F252 
X-CRM114-Status: GOOD (  19.10  )
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

Hi, all,

Apologies for the late reply.


On 09.07.2025 16:43, Krzysztof Kozlowski wrote:
> On 09/07/2025 15:24, Bjorn Helgaas wrote:
>> On Wed, Jul 09, 2025 at 08:47:05AM +0200, Krzysztof Kozlowski wrote:
>>> On 08/07/2025 18:34, Bjorn Helgaas wrote:
>>>> On Fri, Jul 04, 2025 at 07:14:04PM +0300, Claudiu wrote:
>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>
>>>>> The PCIe IP available on the Renesas RZ/G3S complies with the PCI Express
>>>>> Base Specification 4.0. It is designed for root complex applications and
>>>>> features a single-lane (x1) implementation. Add documentation for it.
>>>>
>>>>> +++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml
>>>>
>>>> The "r9a08g045s33" in the filename seems oddly specific.  Does it
>>>> leave room for descendants of the current chip that will inevitably be
>>>> added in the future?  Most bindings are named with a fairly generic
>>>> family name, e.g., "fsl,layerscape", "hisilicon,kirin", "intel,
>>>> keembay", "samsung,exynos", etc.
>>>>
>>>
>>> Bindings should be named by compatible, not in a generic way, so name is
>>> correct. It can always grow with new compatibles even if name matches
>>> old one, it's not a problem.
>>
>> Ok, thanks!
>>
>> I guess that means I'm casting shade on the "r9a08g045s33" compatible.
>> I suppose it means something to somebody.
> 
> Well, I hope it matches the name of the SoC, from which the compatible
> should come :)

The r9a08g45s33 is the part number of a device from the RZ/G3S group. This
particular device from RZ/G3S group supports PCIe.

In the RZ/G3S group there are more SoC variants (each with its own part
number). Not all support PCIe. To differentiate b/w PCIe and non-PCIe
variants it has been chosen to use the full part number here.

The available RZ/G3S part numbers are listed in Table 1.1 Product Lineup at [1]

(The following steps should be followed to access the manual:
1/ Click the "User Manual" button
2/ Click "Confirm"; this will start downloading an archive
3/ Open the downloaded archive
4/ Navigate to r01uh1014ej*-rzg3s-users-manual-hardware -> Deliverables
5/ Open the file r01uh1014ej*-rzg3s.pdf)

We use a similar compatible scheme in other drivers.

Geert, I may be wrong. Please correct me otherwise, as I don't have the
full picture of this.

Maybe, the other variant would be to use "renesas,rzg3s-pcie", or maybe a
more generic one "renesas,rz-pcie" (though I think this last one is too
generic).

Geert, please let us know if you have some suggestions here with regards to
the compatible. The IP on RZ/G3S is compatible also with the one in RZ/V2H,
RZ/G3E.

Thank you,
Claudiu

[1]
https://www.renesas.com/en/products/rz-g3s?queryID=695cc067c2d89e3f271d43656ede4d12

> 
> Best regards,
> Krzysztof


