Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5061C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 04:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lTFy5RM7kse8CAnreFw3LhsSXH2A6ONRbsuB1B52vAo=; b=omBlAqAVvVnA19OMB4apANTkDE
	VSOwCCQF8KuzAQ19ZzBHhz6KU2DpHkiiGVi9Zf+UMCiD1f14EyFY3nkmYyKUEtL61zeFV5/6FmKs9
	4o3QfCAmdn+rMUPOtZN1jjYlYDSsczlxiUmylQjVJIu0Px9gVSvqlvvZnr5navmXSnTrsZMnBSWqs
	y1XJYmFfpgATwrHgl5RDqGj6x6YxeuRXn7bP2bUmiT4BigTZd/w2obmBpVXUwB8YbCfQxcIopUmr+
	8Zbf3tuYdCpLn6VgiQ8NYyIHXrOWks+MqgeZIYDQZ56rDQGIN110qfalxnFekSOJsMe0MG48WI4zh
	0+TaXfYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wePz0-0000000FltD-3VBk;
	Tue, 30 Jun 2026 04:22:02 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wePyr-0000000Flso-13tg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 04:22:01 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8478fe07f65so754968b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 21:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782793312; x=1783398112; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lTFy5RM7kse8CAnreFw3LhsSXH2A6ONRbsuB1B52vAo=;
        b=dpAU22D9JYoPNsetzQInT8U+1+hbqksdyMxCMzFxYjhb/icnrppkDS95vGoH+Lf6Gy
         TvmYzcirs4rIueaNBScFmXHUjC2ZKM3XI3zdVSKy4jUGqM9AlD+cHrMbXxR+7YiHetnn
         v5tJ12G6U4ia+EFQn6s1IeL3ZxRk61D92UlscKI03Sr8njPve+r4d8nTh4xQGGF9CarD
         e8JGjteK4m0QyNWuk/LYMJd0qj/JOOjHc8ztL/Qd9yMVGnj/QEq/wErUX7dqdrhi9l2r
         aGsdgsXKHihOkAVcIuYtM9rnH3H4j9yaOJrwTWFdL3qw6vsoaYa4p2YZNOGzXUXxf2iP
         iBUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782793312; x=1783398112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lTFy5RM7kse8CAnreFw3LhsSXH2A6ONRbsuB1B52vAo=;
        b=VdkKCcHTRPw1OHzmDgwmSKl6SWjROQnIX6CXVPTvasebiqvb2WPLFTx1oTdhNQOU0Z
         3I0w7QJnm61S1VOS/I0dwbd2wObh0KHuZY8LGX7BSmylKPtrF9uc0F2XYPHOBnMnsKx7
         Skv8KMFO8KfpD7Lw7oJDET3LjPLK5KbZpJL4XElSouRnId+HiHYgEVvQ/QatIA0gHPPo
         pQ8wMqizBbqszKhBuNqa96x3VQZkDrGtXlkE+Y0oX5nC3YWnOVMY3LJgSHLAwBBwdyyE
         OYnpUAfwFv80hjjEo3nivXXTCirkEIaRRvr25CXesGKtkMi9uyGpLO5REArLbj43cEiF
         uuIw==
X-Forwarded-Encrypted: i=1; AHgh+Ro07eAahAC3qE7fBV+t+B6Ug9e2UZaYUwjT/IvWM12N+gurmVd1X913ww1dVTUOLKy5VdS1UkjO/aNvh0gM2L60@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4RRyzvIaL5KdQc50VA3ZIi+2Kl53o1VrwJMltPYRRIwsd4hB7
	4kWb9KpiNgCCzdPKWU/Yo+SJj1P22roIfonIA1nHN1o8UOlaT7+cMz82
X-Gm-Gg: AfdE7ckD8BfuIPgGxvIth6E6FqhV0l+yeMQIQq6q90IKYhwJt7VA1uM3F6Kd5EPF3ci
	r5jN7GbcrgLdDbvuOzu4B69/1/T5lciah/YP4dr+yKJlSqfBhshznlKu0w6x8Wn3d1nCr3TFzyX
	DejZ4M5o1emqCoc4Eoj52cTWUzW1iaymAuM0gjWCmpfU1U1lCPj/3vGTWXqO2J5zeZVY8VNamr+
	cIflxqIcPmCs2tBf5GSKOgTswbCi7ElqiCAx6VMXZvG/lgxwF3RK20WawlC5nEfSx8k8PFHeFuR
	t66c11AFrpujnMrlnKtk2ll7ajbym+KmCt4GMpYvTL0twmZyFF5Z4x8mX2CiDQ5aLWHzsYI2CDp
	f6933/zBm+mhoVIpHKJTKqH/OJASb91dDCZmI2/U73j5XWz176gScDfZctM+Ty9AgXxaDYZYO0M
	YLTpta9CZVUb/uKyqjCAFRpDbGjQp8tBmGcRXAv/OVyWGcLC405biBuUkNi8Zknf9/
X-Received: by 2002:a05:6a00:b481:b0:845:e97d:447e with SMTP id d2e1a72fcca58-8479f109a34mr1696830b3a.26.1782793311792;
        Mon, 29 Jun 2026 21:21:51 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8479ff8c781sm950012b3a.9.2026.06.29.21.21.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 21:21:50 -0700 (PDT)
Message-ID: <5c788984-1bf7-422d-a808-e05112615966@gmail.com>
Date: Tue, 30 Jun 2026 12:21:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
To: David Lechner <dlechner@baylibre.com>, jic23@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: nuno.sa@analog.com, andy@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20260625110638.38438-1-cwweng.linux@gmail.com>
 <20260625110638.38438-2-cwweng.linux@gmail.com>
 <40485b4e-6585-42a1-9b84-3019328574c5@baylibre.com>
 <7e96cc1a-eb60-4eeb-937d-64e83bc35279@gmail.com>
 <2f01a3a0-3698-41e6-8fee-1d2e1629726c@baylibre.com>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <2f01a3a0-3698-41e6-8fee-1d2e1629726c@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_212153_323473_B8DE893D 
X-CRM114-Status: GOOD (  17.09  )
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

Hi David,

Thanks for the clarification.

 > We always want the devicetree to be as complete as possible even
 > if the drier doesn't use all of the information.
 >
 > So for trivial/well-known bindings like dmas, we should be able to
 > add it now.

Understood. I will add optional DMA properties in v2.

The hardware supports PDMA for EADC transfers, so I will describe it in
the binding even though the initial driver does not use DMA yet.

I plan to add:

   dmas:
     maxItems: 1

   dma-names:
     const: rx

These properties will not be required.

 > Same reasoning as above, we want the binding to be as complete as
 > possible, so we should not omit diff-channels since we know what
 > the bindings should look like already.

Understood. I will keep diff-channels in the binding.

I will still limit the DT child channel nodes to the external ADC input
channels 0 to 7, since channel 8 is the fixed internal VBAT input and
does not describe board wiring.

For differential inputs, I will keep diff-channels in the channel child
node schema and restrict it to valid external ADC input channels. I will
also check the hardware-supported differential pair constraints and
encode them in the schema if the hardware only supports fixed pairs.

For v2, I will update the binding to:
- allow up to four interrupt entries for ADINT0 to ADINT3,
- add optional vref-supply,
- add optional dmas and dma-names,
- keep diff-channels,
- limit DT child channel nodes to external channels 0 to 7,
- keep the internal VBAT channel out of the DT child nodes.

Thanks,
Chi-Wen


