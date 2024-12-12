Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D40FE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 09:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z5iFFc2Aa0JRZM6u0xT5JQCOgUmJrcBcm3xHoAeXrQk=; b=pTT5kmuTW0pLq73IIZ31nZyjil
	H649tRDhTM7iiCA1+mfG6hGEL0qgpuKnuYy/dha6h6L8RhH7zS3hsKIKhWpBVCCzHPhQeFEYkLfFM
	XyVIeu3a96x82RFLkCeAMKaLVTzVxJK8r/Jxi5Hp3TxMdK/S5I4G4/t1kpWT2FkXkBOzthRUmhiiF
	NUBhMea+K+B9nd8nElhqMXWAE5a0/be/P8xklORFxXE1bPZe44bCCFuwKTi9fKHyq43IpwN4SNJaW
	n7trthVD6MzOijC7GUD376i5zWHfPGv870jPECF91fELuxmpZjS8jRQw5to0K1WrqyWkwYaQFFrQn
	McE96Npw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLfj0-0000000HXcC-3rRC;
	Thu, 12 Dec 2024 09:43:14 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLfXP-0000000HVOC-1QiH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 09:31:16 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43616bf3358so384615e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 01:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733995873; x=1734600673; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=z5iFFc2Aa0JRZM6u0xT5JQCOgUmJrcBcm3xHoAeXrQk=;
        b=fF3+EwWBmMzSiR0aWr2s8epucvLa5vsj4s8xufUEEhkZAndgpHeI5LthGUoFSUjBFF
         TKOn7W9RxL+jqd3hILP01oD0PaanchAos3GX7FWOwqlYl4Yfvv7MMS4IM3opgvCX4kI7
         uk2Lvi/GDzyldzhzHeEiAxwUAffAHd0Q1VYbYq0ZuX3suhV1dBdqb1GaYRPamRxJBaba
         RM7h2M4OZvikCB3UOBxukWfbbIHs0gX89XoOl7HoODKSxMd4JaWzpQPH/9n4CjPXnuk1
         Wz0odT3gFMw/q+W7Tg/666eY0k6/mLzLJoroeyv5+o0xHHLbQMX+UWHS8kNogQCjF9OD
         B+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733995873; x=1734600673;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z5iFFc2Aa0JRZM6u0xT5JQCOgUmJrcBcm3xHoAeXrQk=;
        b=PAV4lPFRfF7dEpdJiJrIpI0NLNytBN5TR034aI0wdeeRZKjxl1Nh5+BGSyg+Lju+1V
         r0n5V+bLawkgA5T3TOTlRJ4pQ2jYinOYloMALN1A35IMPefcFgqpKt/MLXWFDZtkhDTq
         17dVlQDt1RLuzQsbk1FDEHFsxPbjDZnFukDPI7Rx1yfJVpfCAk9w5TP9sUfDUmRGHnq2
         Ie1hwuN+vYXweJHA5A0uS6ioCQXyk0RFCrHg0bGg16yvye0r4babUdLmmxrCgmmQo6f0
         XYMPLisDK9IYQFOd0HO2KbLJlNbzLGrgH/xwqtQOlwnDX91VH5knchjFvLJp8qF2Yos8
         sWVQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1nNTVwy8a5NhPiUmoZVBkpiHuYw+2Hlqcv6r6rC/FMloxCNiHR1WxWt6IwvsIqS5biy7eXnEBTWoBpmKNwVbK@lists.infradead.org
X-Gm-Message-State: AOJu0Yyoq0lXyRWP8jBQlG3izckyJWbL2XKEOWlB1gxY0ljLTwxOU4jg
	yj7udOVxWAzkgPpxTXBuYiI590Pptwc3Am1uTDmAIx4PUtfRSbai4aN6llOfKbE=
X-Gm-Gg: ASbGncs+NsuZwypRbhoHduLXNIxwp6flIZTNDA/I9wqFSDMGaUoHz576LCJTk5pxI1D
	Blr+NGuw4G/g4g/r2M5FDVmgAXQaMFhCfOtE35BJftBOThY1EsdXA8fT9XTgkAoFmn/0krPy0QV
	N7lSotvL82VMHX3RmT6LJRFWjW3osH3Ql+cTKJ2/YPr2oRwe1Kj/Ot8acI/VLP+QUT5dZGjsVWU
	RV9UL1TAxQcOu0rs/SF8rvlRDeFcrMSgycHtOTzhPS1xB5VjDzukrF1A+YwilYkUX5lMRCOP2j3
X-Google-Smtp-Source: AGHT+IEC5Dbme6GU0zsn8tf8T5BnHG+sFgiAI0kaQ8F4P6lFFOjsYVRYuWjeBx+EdEK3pJ21Mt7Bjg==
X-Received: by 2002:a5d:47cf:0:b0:385:efa2:e69c with SMTP id ffacd0b85a97d-3864ce8696cmr1831650f8f.2.1733995873344;
        Thu, 12 Dec 2024 01:31:13 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3878252d22csm3467172f8f.110.2024.12.12.01.31.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 01:31:12 -0800 (PST)
Message-ID: <9e91fd4d-8589-4403-8025-4c8ccb8e67b8@linaro.org>
Date: Thu, 12 Dec 2024 10:31:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] mfd: syscon: Fix race in device_node_get_regmap()
To: "Rob Herring (Arm)" <robh@kernel.org>, Lee Jones <lee@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Pankaj Dubey <pankaj.dubey@samsung.com>,
 Heiko Stuebner <heiko@sntech.de>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 Will McVicker <willmcvicker@google.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20241211-syscon-fixes-v1-0-b5ac8c219e96@kernel.org>
 <20241211-syscon-fixes-v1-1-b5ac8c219e96@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20241211-syscon-fixes-v1-1-b5ac8c219e96@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_013115_395446_C6E98CEB 
X-CRM114-Status: GOOD (  12.85  )
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

On 11/12/2024 21:57, Rob Herring (Arm) wrote:
> It is possible for multiple, simultaneous callers calling
> device_node_get_regmap() with the same node to fail to find an entry in
> the syscon_list. There is a period of time while the first caller is
> calling of_syscon_register() that subsequent callers also fail to find
> an entry in the syscon_list and then call of_syscon_register() a second
> time.
> 
> Fix this by keeping the lock held until after of_syscon_register()
> completes and adds the node to syscon_list. Convert the spinlock to a
> mutex as many of the functions called in of_syscon_register() may sleep.

Maybe mention the reason for conversion to mutex: lock will be now
containing non-atomic kzalloc and regmap_init_mmio, where the latter
calls clk_get and clk_prepare, which both are sleeping, I believe.

Otherwise it feels you are converting to mutex just to make code better,
which would be then a separate commit.

Everything else looks good.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

