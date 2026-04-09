Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1169CEA3C55
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 12:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bNUR+AEM+0xI0nm5DHe+rKxaeNx6oASLbxq9t2PiLlQ=; b=NHk6J7U5a2YpWP+Up31Id9xMxe
	jsXXUB3KGskBff4rkwWHF37YjQnb47TLCKxCHRIaDk3mZmJf3ARoZ+xCtJ9u3mrDHP+CrYRWG+1Ik
	kuMylfh57SzBgodPqknEH1OhDhY/8hpSkuXX7Mtwi9zzlBPmm+fcmbBP0BHeJVf06ErkI8dxmP5MY
	fc7Ukf8Z9SbK5pfg1Tsp0/G5k87PJs6aMPCvRSaYXb04cmwzVS40XaKbcNlOVVIaP8Sieu+8GZrpq
	+rOkPRCUleYsmulVDK0sRn78jXqOsVRIpBTa262xWyCxhR7VnPFR8MPCicFhyc3prbv/lOeIQVZKD
	hSRO94wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAoPb-0000000AN1u-3ICd;
	Thu, 09 Apr 2026 12:23:07 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAoPZ-0000000AN1X-2EAw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 12:23:06 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4889e045bc6so8649575e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 05:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775737383; x=1776342183; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bNUR+AEM+0xI0nm5DHe+rKxaeNx6oASLbxq9t2PiLlQ=;
        b=ckC4PnmxXwp6SOZCUnhaRbSNBCawsz6bBmVgewd/s+QAgfKfZRtSKBzruSP37yxWeZ
         TM89NmmTwqUn4YMT6LPc2SvVo3iAhrX90e64GQt/xyKXmGI0HFgOpaRPwGq32Y/oLej1
         hEcEEIez0VMckwxqZtNhQU8eOTAqlhy4v7b99co10RdTmXgAvNhnZUXLzSBJelhGXXOV
         h/LBLM7LNfbBWFBR2KLLKUO6I9Qi0UPkN61AxKrZnuTibQzz96clWSD3kJ0eJrJsbNwe
         qcRB3a1TMaCbF/52a1MPK5IeOdxjuKW56cMnCxAWxcRijJ1gGGwIZ6ACB5SStfcHdhGH
         KbYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775737383; x=1776342183;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bNUR+AEM+0xI0nm5DHe+rKxaeNx6oASLbxq9t2PiLlQ=;
        b=SGAeaHyEv/TpkkKY8CosEmnSOu0/JMnqJJFYAUIuSYNrRMN4ZjYAYjhduyuMI3cl11
         /P+96c6d25enoCTLYgMjj35Y/fPb8uEsDvSQW+usfHl2CbwrEqQatWtojkm+d7w6L17L
         h9L7jNVPA7TtmnenssxaABFrgJ9JIxREfetF/hvE2f3L+2FJKXBQK3orGI+5tC4dVtia
         B3kaQ1an7k9+OXiW3Jqlc2U8RTg6lh8Dcgad9ja6QxYfebsC50aE2rYp1HcJjJwHALSO
         05FGgr251wJjKzE6nZv3gNOiBLCB52DU6Hi6EmgKRUF2WFTz50/cJypdTPAQLZaeYUyK
         AwAQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2Y+dtzaRfif0g3xYpHCOHm2ghRVYDfIfCmmhdKVJxJUQjMnR/FFaqwQ6rT+TcC0G5aclilltesYdiBrFXgOdq@lists.infradead.org
X-Gm-Message-State: AOJu0YzTpcR9ExzVyIo1IQEMVf0RIDFy9ffv37WmYAunSSUY+Fcm7ISR
	x1vgko56S6qGVwdhf007XGZlqBtGBYNwtXw8tAoqTa/cBcBy91uQEk2syYvQj5ZtMu0=
X-Gm-Gg: AeBDievBnkt0J00Qrk4pafIHbR6lGMF/NhAS3w9jAwU9PYuVeaSFcsze+BfeMjuiYKR
	gqGMxdMsoDABRFaTb4xUg+HTm+hzbBnfHlDVh4mJyQyJkjNFOUvL5FwQY92zItG+ezUkXlukYio
	U1fNcBNF8uJE9n6FqB0tETPus94IsQM2hhx/WtRB643j2RCKfD6Q5dkdvNoYs2n+M990eB4agY8
	jTBNCixGTnWmyncqGdgf/epQwTreY2VWTzpnNmftoy+oHJwG1WGLztKlk+UcFVtuSkk2AZ91wmk
	W15ADXivpqtTdMLxBrVimTQTnw8Ztb3vm5RVRk9hwpUnRIdZCjpVf1w2qXkt3HyCuO0oXeWbtkE
	azTrhqQG7Fv32CEMNsZy1/9BPKw1T0+5Lop9jZyHq2jFkmeMzH5hGB3xl8zJGmebqtVFsi6ubva
	9CsvXrSjIeP1ZoweUL1PFoNrH5Y1ihXxU1cGf9J25ItQ==
X-Received: by 2002:a05:600c:1554:b0:488:a639:b787 with SMTP id 5b1f17b1804b1-488ccfb7907mr47873215e9.11.1775737383421;
        Thu, 09 Apr 2026 05:23:03 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488cd21b604sm69928745e9.10.2026.04.09.05.23.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 05:23:03 -0700 (PDT)
Message-ID: <63087cad-a8d1-4ff0-870a-6e1a738ff8b8@linaro.org>
Date: Thu, 9 Apr 2026 15:22:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] thermal: samsung: Add support for Google GS101 TMU
To: Alexey Klimov <alexey.klimov@linaro.org>, daniel.lezcano@kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org
References: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>
 <DHNUUPQPD5DR.18P18VV0LNTI8@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DHNUUPQPD5DR.18P18VV0LNTI8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_052305_611635_86366024 
X-CRM114-Status: GOOD (  18.35  )
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



On 4/8/26 5:49 PM, Alexey Klimov wrote:
> On Mon Jan 19, 2026 at 12:08 PM GMT, Tudor Ambarus wrote:
>> Add support for the Thermal Management Unit (TMU) on the Google GS101
>> SoC.
>>
>> The GS101 TMU implementation utilizes a hybrid architecture where
>> management is shared between the kernel and the Alive Clock and
>> Power Manager (ACPM) firmware.
> 
> Do you plan to update or work on this series? If, by some reason,

I'd like to resubmit, but I got derailed by other tasks.

> this series is postphoned I can rebase it and re-send, for example.
> IIRC it needs a clean rebase as a minimial change.
> 

No, it's more than that. When I talked with Daniel about this driver, he
suggested I shall really focus on using the .set_trips callback instead of
.set_trip_temp. I'm not sure if it's possible given the static nature of
the ACPM interface. So it needs a bit of investigation, which I couldn't
do lately.

If we can go initially with .set_trip_temp and then come up with an iterative
patch about .set_trips, I can of course respin, it takes me just a few
minutes to rebase and test. But it's Daniel to decide.

Oh, and the device tree needs a little update on the trip points, but other
than that, we're good to go.

Cheers,
ta

