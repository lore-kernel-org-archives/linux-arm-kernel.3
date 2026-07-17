Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEB9C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 00:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wOMUXoxvykC4/rWvGhc8fYAEJsaFuo0l6LI0NYyXnn8=; b=wNRN+Rh8piIXSvaU10YS7P8fle
	6XAl7qzM3C2q30iuxHlib08qlmyodhg3zUVvztxX6XWof1GAwSphGlZ2U3LCij1qka8YIDY/tAdQ0
	l1YDdjgQM2T1W4GyfM07dC3zXzfy8M9+jx+k6HPi89+K2wCvdkUoop2dKZjpBbnh97uYM97V0g4HR
	k63nyJlm02tcHa3aqu0VE10f0btVTgCpH9KVKPqihS3vvbq08JWIGpkXcfaOzjxqMYyg/uPnTbnmV
	JKVWebOk171pTZyTGGVEicxewDM6uSi6S6twITYzvWwk4NWze7hoCd2Byayl6+Fzn2+eobLqp4Liw
	ivWT+qjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkWv3-00000000s0z-401c;
	Fri, 17 Jul 2026 00:59:13 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkWv1-00000000s0d-29Jv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 00:59:12 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso4263985a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 17:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784249950; x=1784854750; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wOMUXoxvykC4/rWvGhc8fYAEJsaFuo0l6LI0NYyXnn8=;
        b=M24l0MZcMgKebtFeIOa+oOkcGeFJm4mrsMYbcGkoXucCGcGN/pPhcCY8WkyF7fzsLk
         IBCjUe2ncQXaACIV5dJTfJUKO3rD2fgkR/ZIR5aYuTR8fNUY1kbWHd3AyBVdSifdEEZ2
         XeVFkjYD+o8SnplC/cb0vfIj++32BmQeiaTXY4senzH2KU9bz3EIWcmdZ4eB5XvzYvNF
         wejgcWsEaHxDf2zwc1mnbcMdKnYUhicGhoE573IsN3wwZWks1RbSydXW5KbLZ/hs+QEV
         +7o9JO5NxpBfynTxFKqyAqQaqNE/pPom5obJ3mxrN7O/rcXnYXXtEWo5IoJuEBYUcKvs
         dIEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784249950; x=1784854750;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wOMUXoxvykC4/rWvGhc8fYAEJsaFuo0l6LI0NYyXnn8=;
        b=EQlJcNB+G7zhUGT2jOxny/03XTRw+ubRAdlWpMYbrMLfpmBUeQUZ4nN+KNLTUGSbDe
         hVLDRjbZUD/ZhTEs2q0zQpVUGN6knym/oGKTL+N0+V9P5arhxLmpPiPiqidaSQ2CNvdL
         H/zgPddKkvp2586zqPubtcI1eRhA82AXj+Z4cFY9tlLIvyF+EoxrdKFk33a/jQTDudvd
         Qo3Y9KYeYAyQxQrVcGqVBRLYtryeML6fYHk/5WKbZ3vs6SPhPYJiagHbH8mvahsacG2F
         SzXZjLc3lGP/M20WdOuBdXJN+feQWYP6a19nNpyk8G2KkxUj0CM5L1dW1CJUCQ4aMPdB
         IgtQ==
X-Forwarded-Encrypted: i=1; AHgh+RqasHSjMIV9AduDjdCRr9T0ikviWBBWXyIu2hIjTZvvABlX59A+KvWDfevDKqzltLNtcBfITXD/0K+FFMBWcB5W@lists.infradead.org
X-Gm-Message-State: AOJu0Ywn7OZwk2IamKEGBmQeYbAHB7A5RPq34U34UTRS0JlKOZ7w2Ubm
	oDy7dTndYi9oon2+LHxNwx1Jes6IlHwKfGIoJNQurMPpu67hi1O+z2tpymY5wA==
X-Gm-Gg: AfdE7cl6MdFMIlNEIV5KViWczOqxao6TDB9MW35dD141kWe/jsowPKXvnUoUbOCJmAI
	FPgDDhIG/45apGhXgDVLya2M9zjmYxVudeefB8nfngpQQH0iBMqYDWQbNrEMzsgYZPqFeS8Cg+Q
	IsaZCtc4V+eeh16cVKc6Sl8eySIjDjUg2+yDDMooZGFWDO0DlJhTB4qHzBFsbsahsiL2ctwg6RD
	bfFZFg2HcYlns55ktr1DQyD3tT+S7q924HYOHgkn8IPCjGilXNJGs/5MecdF6NJUJVJFR2ULosG
	1F6M+WoOkSnRSPeV6p39ynEGn1iEcpUBrLKGu0ky5vtqvCNbAPVLWK/zvMcWsF5+R6z7dq+ASej
	P8W6NYznhLaJYLiFCzt8nxVHya6ZsnEV8lFVeiLbhXW+ddVHcMfvsh+PAG4So2zoyip2w3sohM6
	vRnE4yhD3qxpvY8jk3IypeImYha0iJPx8h7+36LbHstroZlnT0+nxmNw==
X-Received: by 2002:a17:90b:4d09:b0:38e:2fa0:491b with SMTP id 98e67ed59e1d1-38e4b594eb3mr346658a91.31.1784249950264;
        Thu, 16 Jul 2026 17:59:10 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4aff1545sm151892a91.5.2026.07.16.17.59.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 17:59:09 -0700 (PDT)
Message-ID: <8d757505-ea93-4dd4-a374-79f143f6f949@gmail.com>
Date: Fri, 17 Jul 2026 08:59:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20260713081127.115197-1-cwweng.linux@gmail.com>
 <20260713081127.115197-2-cwweng.linux@gmail.com>
 <20260716174237.00004b79@oss.qualcomm.com>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <20260716174237.00004b79@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_175911_558319_F2B1DBB3 
X-CRM114-Status: GOOD (  20.07  )
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

Hi Jonathan,

Thank you for the review.

 > Not sure this doc helps. What are these interrupts for?
 > The driver only uses one of them so why are there 4?
 >
 > May well need interrupt-names to allow gaps in the list to
 > work but hard to tell without more information.

The hardware has four EADC interrupt outputs, ADINT0 to ADINT3. The
conversion-complete source for each interrupt can be selected through
the EADC interrupt source registers.

However, this initial driver only uses sample module 0 and routes its
end-of-conversion event to ADINT0. So the binding does not need to
describe the unused interrupt outputs at this stage.

I will simplify this in v3 and document only one interrupt entry for
ADINT0. If support for the other ADINT lines is added later, the binding
can be extended with interrupt-names at that point.

I will also drop the redundant maxItems from the interrupts property, as
reported by Rob's bot.

 > Do you need that explicitly. I think adc.yaml already brings that in.

No, it is not needed. I will drop the explicit diff-channels property
from the binding.

 > For these take a look at the description of diff-channels.
 > It states that where the pairs are hard wired you can just use reg
 > and not specify diff-channels.  Seems to apply here and will greatly
 > simplify this binding.

Yes, the differential pairs are fixed in hardware. The valid pairs are
0-4, 1-5, 2-6 and 3-7.

I will rework the channel binding to avoid diff-channels for these fixed
pairs. For fixed differential channels, reg will identify the hardware
pair. For single-ended inputs, I will use single-channel so that the
single-ended input number is explicit and not confused with a fixed
differential pair index.

That should remove the large allOf block and make the binding much
simpler.

 > What are these channels?  There is a reference to one
 > internally wired one so what are the other 3?

Channels 4 to 7 are external ADC input pins. They can be used as
single-ended inputs, and in differential mode they are the fixed negative
inputs for channels 0 to 3.

The internally wired channel is channel 8, which is the VBAT input. This
binding only describes the external ADC input pins, so I will clarify the
description to avoid confusion.

Thanks again. I will address these issues in the next revision.

Best regards,
Chi-Wen


