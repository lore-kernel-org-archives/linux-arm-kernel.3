Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2516DC4451B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 03:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1uELaWXedQ9qQGNcAq7Cw7Bv4z3LDW14NAE5K6u6YwA=; b=NxI3t0eoiRfDvMrT3cmAbsOxsX
	wTt4Q5a55FnBsPc74cO8dZG/16qoOiIchSHwoBcZmwYoqKEYVda9RRPdgsTA1PO5/wRIqT2geBXgN
	f+TeN0whgL0Q3sKoWLUBy4D3VhjPgvBJYo+60vAARj3DKmzlbDGshO4EJSawzhYGwGUXVQ3foJ1uB
	2WLDUn7Cr3NTPecoIp8ky6Xwa7MhoSQfVUmAkOY4eQCroB9MpPYepfrjmY6NcCX+o/jmZvI9qoRNN
	FuKlpfbD2v9L0ZyKK5ArigwuBXJHZZn1Sm/JPIDfQ/0w0JKwtWd+F8RuAxVzMuTy/lBP8AB0KaLBK
	fmDMlMyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wleNy-00000005jnM-1OkW;
	Mon, 20 Jul 2026 03:09:42 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wleNw-00000005jmx-2pkR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 03:09:41 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c9e0b89e228so4007323a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 20:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784516979; x=1785121779; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1uELaWXedQ9qQGNcAq7Cw7Bv4z3LDW14NAE5K6u6YwA=;
        b=DFYlYYQrVupkGXhWdCiOoxQ4q1ULIqzuzBY89nhbFGIYUdBpSB7kFyq2OfJAAi2ldM
         BnpR2dnlCAx9gDHIajkhzijkxf9t33Zgle4xMoUitGYXJ9xLLrYX7d+SDOmVm6jlzQFm
         Afwen6HzDwLgyh9Dp51ZnLf8yVniKmY0wzSPQVzC5VBUpv4ty/IOwrnOk4USQe+xjtPh
         G28diKBuH/RNYdFzaxvY+/1wsR5Uh6O0K2It4b9rCYMFstwNm7vn8dTkVR80n1xNstTy
         KCmx9/hnhi2M53pOIOkdPtINHlTE44GeatcJsGOzsq35qkagftJHq7ODKAWZ5XMiMDzY
         Ug/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784516979; x=1785121779;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1uELaWXedQ9qQGNcAq7Cw7Bv4z3LDW14NAE5K6u6YwA=;
        b=SkR71ZSRNoMx+wtdc2Tr93AXMt+uteB0k6GMo88i1BhtKwtu/9GmlVsC9EHf5WTKZa
         tTjnsAwGPGwI8tMZDY+w7wcGRa1XS1Q48EIsack0efFqd0eEVAa/jeSWmqYp+t66v8pT
         O5owBBLCwBZs8iSLwcO/4iT/NPu0TupnSd5XWNduyfl32LppAUrINH9ke2dIB7FZZD0e
         THXJiqvWEYnQVYLJdnLF5JrGhj/lkH1TFlaKQT9O5w/QHiLsXVgAJC/zL3rWwmBFX43d
         HZBNdk+Mhvm5oOaGUrQWqauTE2e8f9Rsl1kccDlnZ/iuDUwJM6EzxEGSSqI5PPQCdzYH
         dBvw==
X-Forwarded-Encrypted: i=1; AHgh+Rru5nVW2gor2yrK5um5Yh/582Kr0jyXykOCyVJXTWOtv7kVn2WgCm8C/0RRQiv9xxUeKw706hECkBmCtAVRb5y1@lists.infradead.org
X-Gm-Message-State: AOJu0YzV3KwjRwgNOf5QiPPpYWfjrOML07vFp9LtkrAXLPBqLGOYTH1Q
	XBjXn8MhjtRh6pzNZklhdLnaiTM2DjAHVmjJ+UJ97clqpfjET1Sgcnu1
X-Gm-Gg: AfdE7clXfQOTo7SEbR4vF4fTka0OXqQ/tVXq1Tc6ZuMFkXotCGXAHGba4EMpfCnp+XH
	0gBgb2M2xhjjaRwV51zpvljQZr7uONYhmcdR61x+LWnoT3czMU+nOx5ICeLPPn9TR4dPQSBTTvu
	VhB8cnoyqjBuXwWdKdpaMMPReCJccroBDOHQnPH/tgdt/Qbn123b+B4SU8cezFSfHSY0hDBmdLl
	sjQL7qi+cyd8z7vjSjHNtRME8BQovaPmn2h51+twhynqHbmifpWNaAvoXp02wJ3vKUeG/irZ3Om
	xGkLPOpgVnrIj2JOw2FNukkQ36MFVpMG5qtduURPSgOdhHvOWCZOwk7r/r9ePJJcimWPvLNt87f
	SJWoXe0ggUrl7TKzAAkFzAQgh5SqNUg5et7RinyMkra57MTmzGduM2VFTmr90rFX2PjJp1fdIt8
	YaaCH1+gTvmuHaKrn0X/ysmoG6nw8Y/UHxklQCgYK0BVXXofJUxBoiuQ==
X-Received: by 2002:a05:6a00:391f:b0:845:a435:a2eb with SMTP id d2e1a72fcca58-84c2927fc39mr13129007b3a.31.1784516978856;
        Sun, 19 Jul 2026 20:09:38 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adc7adasm4962151b3a.19.2026.07.19.20.09.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 20:09:38 -0700 (PDT)
Message-ID: <5eaff736-9271-487a-a9d2-225580ff449d@gmail.com>
Date: Mon, 20 Jul 2026 11:09:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
To: Rob Herring <robh@kernel.org>
Cc: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, jic23@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dlechner@baylibre.com,
 nuno.sa@analog.com, andy@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20260713081127.115197-1-cwweng.linux@gmail.com>
 <20260713081127.115197-2-cwweng.linux@gmail.com>
 <20260716174237.00004b79@oss.qualcomm.com>
 <8d757505-ea93-4dd4-a374-79f143f6f949@gmail.com>
 <CAL_Jsq+5N9AvzQ0cxUVY97Ad+CasR29Fan7sUuprDYjgqzWjMQ@mail.gmail.com>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <CAL_Jsq+5N9AvzQ0cxUVY97Ad+CasR29Fan7sUuprDYjgqzWjMQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_200940_721340_645B46F7 
X-CRM114-Status: GOOD (  13.38  )
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

Hi Rob,

Thank you for the clarification.

 > No, document what the h/w has, not what a driver currently uses. The
 > only exception I can think of here would be if only 1 interrupt pin is
 > usable on a given system. Then it would be just 1 interrupt with
 > interrupt-names to define which one is used.

Understood. I incorrectly based the binding on the current driver
implementation rather than the hardware resources.

MA35D1 has one EADC controller, EADC0, and all four interrupt outputs, 
ADINT0
through ADINT3, are connected to separate GIC interrupt lines.

ADINT0, ADINT1 and ADINT2 are generated from the corresponding ADIF0,
ADIF1 and ADIF2 conversion interrupt flags. ADINT3 is a shared interrupt
output and can be generated by ADIF3 or by any of the ADCMPF0 through
ADCMPF3 result-compare flags.

I will therefore keep all four interrupt entries in the v3 binding and
add interrupt-names for "adint0", "adint1", "adint2" and "adint3". The
ADINT3 description will state that it is shared by the conversion and
result-compare interrupt sources.

The initial driver will continue to request and use only "adint0", but
that implementation limitation will not restrict the hardware
description in the binding.

I will also remove the redundant maxItems property because the fixed
items list already specifies the number of interrupt entries.

Thanks,
Chi-Wen

