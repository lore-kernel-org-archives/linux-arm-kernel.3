Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDFDCC6B0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 14:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fy4hww/bwmxQbL1BwdmGfWhDcfwRm+UBIieq6CF5cl4=; b=RHc8E4w/yzjnWNCErpig/YYZd8
	IF/+n6aUeRA/YzZFGoHtplBL4YZTTiSa7GLtzxImUDUVetn/mvJcu/TZY3knvyfOT0cboBZAJmN23
	8JFl9r9LDTc7tppuADaCSsws8+ZBLRcMxQz2Lgpjwh3WbiR/iFteMcx+eaDHG8KDj8PPm21L6xNNR
	WtYm4NFbMRPnWaDAQaiO88A7gdHqBOv3Yx5nrvWgGTFkaTg9O8RZzyyeigfN3FtRcgFTutUAbJ1+S
	DzKkToYi261CI+SlSdEz8irlJWuPkMIlJ6CmoexhtsPJ8xqLxFDnKHCCIINfSjZSqe7PECFqZ37Mn
	fgPtVAZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGddw-0000000D8iT-0r8A;
	Tue, 13 Oct 2026 14:38:16 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdds-0000000D8fz-0can
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 14:38:15 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so24482985e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 07:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791902290; x=1792507090; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fy4hww/bwmxQbL1BwdmGfWhDcfwRm+UBIieq6CF5cl4=;
        b=eqNgN5sqIjNIy97nAZAg+9aP7PJpiKNfVXAEVwl1se1YqxkmlK2WTn+DrlLpz5hT2+
         roa7UXivEj+3AJcXZV7RlypT/94ooxlC6DYt/W6eeke7eIXRkpB5Hx8sKHEYIoPhGkMo
         ng5Mf5cKxo2/FjKL11syZGX7wC54yA6IVU5aDnQ81iYaEy5nqsgXg4D9sPPZIP8/SYYC
         rbQxbT/2WwVG0slxlB/usXUB+tF6qWmF6n/+x/Y7n5v32AR4g18jhAypMcn8inUCKSBm
         VfRwUfIx4lJARJk/muLXJQo03SyfAZbpj7K2cdwYnIBqYar7FccBVBxAniGEXLOvwHAR
         7KEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791902290; x=1792507090;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fy4hww/bwmxQbL1BwdmGfWhDcfwRm+UBIieq6CF5cl4=;
        b=NDsFY9WqAz4/S6MKsGytX6nXpqn/6pgehWm/ixIEtE7wL3DEg/7G6vC8zfWiwtzxWM
         d6tonFDxx+Z5YYHctS2xDu4tAOChNzT1mwgiN10vMwc764p4o1APMY57TnAe8Ir9H3Zn
         DAhghoXu8iNrqjGjN/FcswQkpxUGp2LqOnlNG4Ba6udFeSMJQtnTT1BBl2FewRkvMnSg
         epW5Q3EojO4h2AdA/8yPUAHiNznJIrvvv/IAF28kOrTcFQnMfg32b30a1AJGyX0a7pCv
         9FBuGc/cEYfqlNBV5ed3PsvFjl3VPq1fCYYr5So7dcsaNd6/j/Kh7M1JJ3RdbWH1O3mi
         jR9Q==
X-Forwarded-Encrypted: i=1; AKwUvBz9On7eF3SwHlVwVuRcHMSHJwrXIJIDdK8rSBQRxP6VbamYcQHvwImgIBzt0em0edgUN3Abm8pwj+Oh8BpG6t2c@lists.infradead.org
X-Gm-Message-State: AFq9FYKZhMywD4GjpJCuZ3w7ZNQQYIGVPGZzkzxuVPQltiXfTOfGdt6T
	ep1vIatB6XVmuIxEjhWI8t+7AbLJ9FvFBHjU1tiLtxbjPpIB+2Roqvpa88vYOhwF8R4=
X-Gm-Gg: AYBFou2lFwcNdkAna0dtJ4wGHMB1y/DWk+acUvPlIhfnOCxvAzUmPzOxevNVtQAYcSA
	5JeyjC8RLyrjfya7WLKL1mpwmaa2BObP2oZp7vbrYMaJW4X9RxW4HvEMgs+7ltKAPGqkQbqdxsn
	KbqXmgjvSoYg+o63IJcingUZ0/hGhi/nzHJ+H1ABSJSrr+bav3oTkd1sp/RFzOGl5mgN0wd5FVk
	/IePvh68VJuU5GMHMNAmRiTiVMQoJ9xlk1B2O7YOO4M4kXbAgrvcQOIyRAr8TXRNASvOEA5eFEQ
	k3AA3YzEi1Z4mQ6sI5kice5KLbON+7+H9AXeSbBKfVlJQUEebBLhrIluoSGfIpWGo+uB8X5RONf
	HALIQINs1je+7OfxY6WcnNDrGOrKQnKZWa+t7OVofoAacoXmt1IE0kPfYKqCmsVXDnXoYkcFZKc
	uZ+eAlX/FN2lnSqv5Fq/XwNkS+DUHvMKC0O4r8ewz7YjK9aSbABXADuszTIdQktdIoFQTT7+Fj9
	0vgaTem
X-Received: by 2002:a05:600c:310b:b0:4a1:813f:2a5b with SMTP id 5b1f17b1804b1-4a18e4a9da8mr235341925e9.14.1791902290063;
        Tue, 13 Oct 2026 07:38:10 -0700 (PDT)
Received: from [10.11.12.111] ([79.115.63.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19c8244edsm198277585e9.2.2026.10.13.07.38.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 07:38:09 -0700 (PDT)
Message-ID: <4576292d-2c3c-47db-8422-9f9e730cfecc@linaro.org>
Date: Tue, 13 Oct 2026 17:38:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] thermal: samsung: Add support for Google GS101 TMU
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
 <8142519a-0062-4f0f-b978-980e049f99c1@oss.qualcomm.com>
 <fe159792-c58a-46a9-950b-6c21d2172601@linaro.org>
 <04a1331f-1375-471e-a674-87039aeb0328@oss.qualcomm.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <04a1331f-1375-471e-a674-87039aeb0328@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_073812_237765_783860D7 
X-CRM114-Status: GOOD (  15.02  )
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



On 10/13/26 5:31 PM, Daniel Lezcano wrote:
> On 10/13/26 16:26, Tudor Ambarus wrote:
>>
>>
>> On 10/13/26 4:33 PM, Daniel Lezcano wrote:
>>> Hi Tudor,
>>
>> Hi!
>>
>>>
>>> I noticed I picked up your series without notifying you
>>>
>>> However, I did not pay attention but picked also the dts files.
>>>
>>> Shall I drop them ? (AFAICS there is one comment) and let you handle them separately ?
>>>
>>
>> Yes, please. dts and defconfig patches shall go via the Samsung SoC tree.
>>
>> About the driver itself, I was about to send a v9, where I addressed
>> some issues sashiko spotted. Do you prefer to drop everything and wait
>> for my v9? Otherwise I can do incremental patches.
> Well the v8 is in my tree since a while now and I'm about to send a PR. The patches can be dropped but the v9 will have to wait for the next release. If you want this v8 in, it depends on the sashiko report. Is it minor or major ?

They are minor corner-case races (an interrupt firing midway through
system suspend after runtime PM is force-suspended, and module unload
racing with a concurrent sysfs temperature read), plus a few small
cleanups (adding `select REGMAP_MMIO`, implementing `.change_mode()`,
and renaming the driver from "gs-tmu" to "exynos-acpm-tmu").

None of them affect normal operation, so please keep patches 1-3
(dt-bindings, driver, MAINTAINERS) for your PR and just drop patches 4
and 5 (dts and defconfig). I will send incremental patches on top to
address those items.

Thanks!
ta

