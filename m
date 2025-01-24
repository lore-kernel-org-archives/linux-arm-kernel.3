Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2AE9C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 16:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tFpxP7HIUscLgyABMDBmuoWJ7K+N+2vaKQ2+P9xRFD0=; b=WTonA4zza2vODaZVULjtVHfHXB
	Np7rmijhnhM1xwcEKy0Kk4JI7yqB3Ib9F079VrnqNZw1mxSrN4oEZjUDlcOrS1leTk55j72S/XDDO
	W/CFlWXr8NJVYwqaTfdK/jSxrDtOOGqilOK4UtdPy/58lXa9aX2B4xVhN4v8Q+KgpRBJ5pNlyte4E
	ndRVFg1CvxeuEb7XTgTN1/bhSSEeQFcAv88XQGLtFVtrcgk6Ijn99dK9xars3MzMDK4LDdhmwUScz
	dcC/uqZ7wzZ8NQrS2dq3JY/J7tS9aoGuv8n4uDbt0mosccy48g7GCb60W+1yNwENh40oXQ5/4MtC1
	mV2o6vqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbMs4-0000000F9s0-3SKz;
	Fri, 24 Jan 2025 16:49:28 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbMqm-0000000F9cY-0W9C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 16:48:09 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-434f398a171so1621495e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jan 2025 08:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737737286; x=1738342086; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tFpxP7HIUscLgyABMDBmuoWJ7K+N+2vaKQ2+P9xRFD0=;
        b=pyrxoKkwA05kLc41SqvvuRdZ2KUiYEnfIoSh1HQCFSgotsxKHAJfwFHmsuGtr4Q+z1
         kx69Q+DMiuhTSI1I8cTjUpkTWvA+JLH6VNGc3iJ+OD9zzt7RcO9MVCcRQXLpyzlaMPSn
         03qIGwkd0NMhjIz5FLbtErhoHE/8aP8/1QYq+sfReKM9StHht1q4RMDqSE++0ERPddPl
         9s5jpRJpwH3XwBdM580In//Wt28WaelW/OU1/mpdbzRw2hm4+/Cs4m71Nu7wIqs+5ly1
         tyPtyGO30fJRHjKjxoWIYKjFwuPfm33xPAOVSSH87mUfxbLm8Ou++SUs8Q1nfg42GVXI
         yuMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737737286; x=1738342086;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tFpxP7HIUscLgyABMDBmuoWJ7K+N+2vaKQ2+P9xRFD0=;
        b=uyNyy3chJv7k1Wf+/EiJz2g8E6yxbd2ZCNsPr4Za49/wbVmvQM0LJWKRlc3+n+qj3U
         RewqbBgZ2a2s28D2DU7haPWM5j1JZO/IIpg6RS1ujpn4x4mtt0og7I35WYaRuUsK49VL
         Zk9TEurSpN6Mq3/3hDsmC+OHAH+0DgKrgpNH/g4QYeaELETJregd7C8yRgp/APtASMlb
         L8Rae3bUbRPPTf6zm8iXc+KUPtxc7u2vPY6PSpDHl5SGIBpWVmY+OZ5mB432Fi7xzQ5g
         JF9djCCWJg8mGST1K5xW4LQixl/r19dbhk1Bh7RJL7st7UtflugT/UhOGNJJpJ4nQiwV
         kVrw==
X-Forwarded-Encrypted: i=1; AJvYcCX7OweMD20fpzkd/xxeqjebyQCLgXXbS2qTlf1/HXqMsM0YNPX63Yau9IghBhnNx4HcNg3NV+7/4Q513614uDcm@lists.infradead.org
X-Gm-Message-State: AOJu0YyXD1EpzFdkce0pcLwx+4v1CWCofYNXnPq0Qv/1beuAgEpef0fE
	PjoKU4NmOioqbjT5OwCaqp8tj5Rwf7ec5OMlfaRih2/8ggEIBN6AQRiIqQKW7uk=
X-Gm-Gg: ASbGncsuN6psSyIAYmXNXnVisDo3vA0aHXkwiVG7VWJbPuORpkkoNv3ukWcVY6Kldx6
	fBMFmbAWyPCq3AQemCwXtgnrhy+SVU7+h+S2Sqxkj8hRqHmAg/hGKh9nqLalg58OSApxz/1E57m
	PoUvAWkTKpnzeEKFiRsBvmFcdKg10yBeYgOekU8/vC2Y3CLs2WMruq+KwgrEnsC0gCRlrugyMg5
	H2IZIaQjEVGwfxF9jRYSQYvkOmwwModYetMHpphmtuMAD40lurrAoubyum6c8OlQsGmFO7tCXvJ
	l/d/7T2yUQbNS9g0oxv9LAnD
X-Google-Smtp-Source: AGHT+IEAO067R0rz/SNoXsbJuZsB4tR7Nmi8XWJWmDM3XfZyXMg82GtcHI10EK24LYFZnMg33lT6fA==
X-Received: by 2002:a05:600c:3b9c:b0:434:a339:ec67 with SMTP id 5b1f17b1804b1-438926dc167mr109813135e9.3.1737737285939;
        Fri, 24 Jan 2025 08:48:05 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4b99dfsm32832985e9.26.2025.01.24.08.48.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 08:48:04 -0800 (PST)
Message-ID: <639b4e3a-3f68-4fba-aa33-c46dcb6fc88f@linaro.org>
Date: Fri, 24 Jan 2025 17:48:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: mfd: syscon: Add ti,am62-ddr-pmctrl
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250122-topic-am62-dt-syscon-v6-13-v1-0-515d56edc35e@baylibre.com>
 <20250122-topic-am62-dt-syscon-v6-13-v1-2-515d56edc35e@baylibre.com>
 <20250124-heavy-jaybird-of-vitality-4cbe24@krzk-bin>
 <20250124-able-beagle-of-prowess-f5eb7a@krzk-bin>
 <mocfnpebc67xegcis6tx3ekhsjcsqnvhwtipufycrtq2be4nbh@pmxhir5gmkos>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <mocfnpebc67xegcis6tx3ekhsjcsqnvhwtipufycrtq2be4nbh@pmxhir5gmkos>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_084808_168189_6BF8F65C 
X-CRM114-Status: GOOD (  23.07  )
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

On 24/01/2025 17:05, Markus Schneider-Pargmann wrote:
> Hi Krzysztof,
> 
> On Fri, Jan 24, 2025 at 09:22:54AM +0100, Krzysztof Kozlowski wrote:
>> On Fri, Jan 24, 2025 at 09:19:49AM +0100, Krzysztof Kozlowski wrote:
>>> On Wed, Jan 22, 2025 at 11:24:33AM +0100, Markus Schneider-Pargmann wrote:
>>>> Add compatible for ti,am62-ddr-pmctrl to the list. There is a DDR pmctrl
>>>> register in the wkup-conf register space of am62a and am62p. This
>>>> register controls DDR power management.
>>>>
>>>> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
>>>> ---
>>>>  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>>>>  1 file changed, 2 insertions(+)
>>>
>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> Un-acked, I missed the point that you really speak in commit msg about
>> register and you really treat one register is a device. I assumed you
>> only need that register from this device, but no. That obviously is not
>> what this device is. Device is not a single register among 10000 others.
>> IOW, You do not have 10000 devices there.
> 
> Do I understand you correctly that the whole register range of the
> wkup_conf node as seen in arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
> should be considered a single syscon device?

I don't have the datasheets (and not my task to actually check this),
but you should probably follow datasheet. I assume it describes what is
the device, more or less.

I assume entire wkup_conf is considered a device.

> 
> Unfortunately wkup_conf is modeled as a simple-bus with currently 5
> subnodes defined of which 4 of them consist of a single register. Most
> of them are syscon as well. So I think I can't change the simple-bus
> back to syscon.

Huh... Maybe TI folks will help us understand why such design was chosen.

> 
> For the DDR pmctrl, this really only consist of a single register, the
> registers surrounding this pmctrl are not related as far as I can tell.

DDR pmctrl does not fit definition of syscon then. Syscon is a
*collection* of miscellaneous registers. Most likely the entire block is
that collection and someone decided - oh but I want syscon per each
register. Awesome. And then what if someone wants two registers, but
there are spread apart and in the middle is someone else?

| ddr pmctrl 1 | something else | ddr pmctrl 2 |

Two syscons?

And what if you have three registers? What if four? You see where it is
getting at?


> 
> What do you suggest how I can solve this?

I have no clue how the device actually looks like, so tricky to give
answer, but I could imagine total node rework, calling everything
syscon+mfd. This would still be backwards compatible.

Or adding one new block covering remaining parts of the device, so at
least people stop adding 1000 new syscons per each register, because
there will be just one.

Best regards,
Krzysztof

