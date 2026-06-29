Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B72C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 15:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mKC86SBllWMC5DazOx7jxMwvHWS3vvb7786WkQz0OjY=; b=1B3yCHCdUMobxKcjMsviQf6MQN
	nYptz4HSt+UXcoqCthhON0p4huwHc2mykRRVr5XMvmXWbRTF16BMFLu/Nd0ORogz75ztd97APRzDP
	5KtC/W+4jx7tGclanrzIFxYkQeSzz6hUY/o2CW3hklifoHiO46nL9WwADFMX7yFacXP1C9AglN4Kj
	KP7RXOe6GIuY+brwqFpDAKgEfJrSQMbxVHuuXA1HrRsibjV7eFULasc7aGS1TPnAm/1v3rntIebYY
	OomkV+jYZ7qbe+vIRrL37hkRhoO1ju79eSF8bC/yggUROO4PhIsNR1TbaP2LxQP14c1z63M8PDlag
	QInuzi5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDXG-0000000F0Qj-2VBx;
	Mon, 29 Jun 2026 15:04:34 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDXD-0000000F0Ou-2Gn9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 15:04:33 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-69ed219d3ecso2865318eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 08:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782745470; x=1783350270; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mKC86SBllWMC5DazOx7jxMwvHWS3vvb7786WkQz0OjY=;
        b=fWpaD04j4nv9uV4ZUqHEdSBCH0zy91+gZYLAj5U2ThJjHNbYaaO5pyZWTnY3suXfqP
         kU3LlixNNWqS61VWVtJy3MkJbpcbt8YAz79q0tD8H+QF58jiB6WN3lbvty2yRwnVxU5p
         +ZDdK3fvAhfLuybC059X57XXAVzozfTCv06EkZ6PNQ9/A8qFhzIa470ZsQ+kJdG8+Kw3
         DLsHYsUDrKQyUstxfQ4l4h8pDbEsrQQyzjGedz+KAVPJ809FVDH75bWAuOpXVX/gbJVX
         LcNnBt1z47ZVzNQiMpF7jGxsU/vsIhsN3jJwahQ3kmitoId0rsTp/864MwHLWj5T/9Tx
         mMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782745470; x=1783350270;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mKC86SBllWMC5DazOx7jxMwvHWS3vvb7786WkQz0OjY=;
        b=XXpYYL2bpEjzK6bBgrwGlEaAnbnzLkkH6X04aTAagHKxcCGtWojgTixZ1qpGboFnft
         mXL/1Xu07ibwC3FgzysBU100MUaTfoTKAZDfP7VEWyl+LeSllaBdXX823OIDUAHpZVXs
         1/gXOCOcI7TIWqzgpstBz6hC4LvEuyRjPM32+6+SFFExI54zdKizqZbZECtFlVFzRXVb
         /E3+cwdwkMOYSDdkIaU0jr7x+6wi0fG+ZoLP80RFiOkK7HjFFsXkmci2Eh+z4Tn3GQ8n
         1cGQUTFbitMJiwO/XTSDu6gpkuLWEON2X6dDGIhDpgdrUknrNy/c40h/q6K/AsczyOsX
         QvBw==
X-Forwarded-Encrypted: i=1; AFNElJ/1NoyAeoAc8SxoqmQ0RfrZ6quWXUJJN3LwH4oj9bdAhMcq40xYmX8TaMm7zClGIp+MgyBv/M1rS9fYUIvXF0DE@lists.infradead.org
X-Gm-Message-State: AOJu0YwLFcXPwTGBQdeT79ZK2Ip8Ip4xexJZapBE4UgZlIf0nax7tMQx
	d0i1oavmJIIyG8c76cNLBTUJG1P+cqGBym+etpHG360WICWTGTCUdjlGePX8rk8Pjkk=
X-Gm-Gg: AfdE7ck2woPrJb/GzfJnP3++H4IeDTPmjmZ1hxbiEn0j/6WT4bk+lV2E3THn2ed/uJF
	ZH4VIeDLzVjixKFfVSBCz7SazV7Yz5IwCa2dSjslUn++WxdhFEsYLTwI59Z/xNXXirSWzf7HyBb
	KOLhmrwYgfHpFGc0JcW6Z2LunH94alhS/k0nKXWJ6eP3CWh+nvjkaZd2YikgbQeA9CMNis8Jj4T
	wg2EMDRnDDVjfcTReyaO6NGwZQFqrXbmIxiS8g+Swn9pSzr+Fz8rywXYu3lE/JKsox9bx+gL0Py
	F7n6f8143Kbp0Vc9nuQNr5ikdx5rLQhl7C779z4fUbJEUAXa7CgovjIK8bWXaSzhAvMRUTgReWh
	TBsAFzgVBMrVtFlEXtSBoKJUUln0APz6g/tGf2nzC5+QyUBB/9sjW4HQkZW3sXUzaVeyn4ykOIt
	MwXcYboeDre+bDFIELMVaXAe986FxJkdpY8dFL03KdFbTqyHu8Rlha6pgRV3t9bxrT0kmedhAZi
	g==
X-Received: by 2002:a05:6820:55d0:20b0:6a1:82f5:b009 with SMTP id 006d021491bc7-6a18910d066mr33242eaf.13.1782745470465;
        Mon, 29 Jun 2026 08:04:30 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:3533:aa22:9a69:df1c? ([2600:8803:e7e4:500:3533:aa22:9a69:df1c])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-448db92c113sm26526fac.4.2026.06.29.08.04.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 08:04:29 -0700 (PDT)
Message-ID: <2f01a3a0-3698-41e6-8fee-1d2e1629726c@baylibre.com>
Date: Mon, 29 Jun 2026 10:04:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
To: Chi-Wen Weng <cwweng.linux@gmail.com>, jic23@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: nuno.sa@analog.com, andy@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20260625110638.38438-1-cwweng.linux@gmail.com>
 <20260625110638.38438-2-cwweng.linux@gmail.com>
 <40485b4e-6585-42a1-9b84-3019328574c5@baylibre.com>
 <7e96cc1a-eb60-4eeb-937d-64e83bc35279@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <7e96cc1a-eb60-4eeb-937d-64e83bc35279@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_080431_591557_2073168C 
X-CRM114-Status: GOOD (  21.37  )
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

On 6/29/26 2:11 AM, Chi-Wen Weng wrote:


>> Should there be a dmas property? Datasheet says it supports PDMA transfer.
> 
> The hardware does support PDMA, but DMA support is intentionally not
> included in this initial upstream version. The initial driver will only
> support interrupt-driven direct raw reads, and the MA35D1 PDMA provider
> is not upstream yet.
> 
> I would prefer to leave dmas/dma-names out of the initial binding and
> add them later together with DMA support. Please let me know if you
> would prefer optional DMA properties to be described now.

We always want the devicetree to be as complete as possible even
if the drier doesn't use all of the information.

So for trivial/well-known bindings like dmas, we should be able to
add it now.

> 
>> I assume 8 is for the internal batter voltage channel? Often, we don't
>> include fixed internal channels like this in the devicetree since they
>> are always the same and don't depend on external wiring.
> 
> Correct. Channels 0 to 7 are the external ADC input pins, while channel
> 8 is the internal VBAT input. I will limit the DT child channel nodes to
> external channels 0 to 7.
> 
> If VBAT support is added later, it can be exposed by the driver as a
> fixed internal channel rather than being described by devicetree.
> 
>> adc.yaml already specifies minItems and maxItems, so we don't need to
>> repeat it.
> 
> Since I plan to simplify v2 and drop differential channel support from
> the initial submission, I will remove diff-channels from the initial
> binding.

Same reasoning as above, we want the binding to be as complete as
possible, so we should not omit diff-channels since we know what
the bindings should look like already.

> 
> Differential input support can be added later once the fixed hardware
> pair constraints and signed output handling are implemented in the
> driver.
> 

