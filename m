Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA703C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 00:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UVZwS8jOvBUyjwgl3DDKvmTYA+QBde5QPL3dY7t7pMs=; b=CNHNE8vEL4ocKyiihdt4X/OJR4
	7M/8A2NSNRJHCxmhQ/hQMiOl9hxR6L9YWkfzksggso+2A1Pa37rmwgItr2RVlbmZ49P1HjkLczCg+
	6DV1iCz3QIBROkcp47XAWc/e4jJzRPkgqASAA92KP8cwdxncmJey/tQxaeqe8017LgrrryMEIltPa
	hZf96plkd/NwSIINpyTXwxX99RU1vxIXdS7ZgZPvovNoAPAyvfP4gpXzkP1bBhuAQHxrt8HcJW7pT
	ECbmVJ6hyASUvjIdxPcBGydT0SEm+4u0BrUVaDSxKjDpzRrCvhffh0FC7jpGLVw81dccpjmON4M/E
	JubRbwjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wosVX-00000006Y7p-0YPn;
	Wed, 29 Jul 2026 00:50:51 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wosVU-00000006Y7R-3LUr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 00:50:50 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-8485ef63b68so429243b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 17:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785286247; x=1785891047; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UVZwS8jOvBUyjwgl3DDKvmTYA+QBde5QPL3dY7t7pMs=;
        b=UhRvOoU5vz+ho9B6KKcCiRFPaiw/r62kns4iWvaCL3je0OE9rp9SlQ27uW9QA8RJZy
         SHmHhMeHgTPuYxsD6Dqefn50M//eeLhye6FS77602FHP2SSqyiHDz2obNpe2FAcBTZJx
         GkszpNbFg5TVyAAa0l6CjGqQWV6UfagOPgYXJi8nczGls6+77aK2+LTxigbCVwWOmkIQ
         D8964OW1T+rZfpQrzkt5lG9FkAXbPvI9ZWejB77LhVaG59c0IxU63qdEOGV9qDj/GimI
         JRki0YKElJXm3pFhL8gqe4UHKRu2OSfjVmF+23CRqVJQBBn78lE8bBuKr+/7yvvtkTzw
         sfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785286247; x=1785891047;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UVZwS8jOvBUyjwgl3DDKvmTYA+QBde5QPL3dY7t7pMs=;
        b=mmuzTP9KLmLayWcm9/cbGfUYZDvINkWnnZyN6d7+QL+Pv4RDXBrX0dVeSSfjxhplHy
         0Z196RgriM559cKv5tQZ1z/AKg+iEdqA+aXTgQ1odvRENqaC197bJ9wdsEAGYUTyoJbX
         P8piLHQk2cCtZuW8jyGf2pr8Y9F0paurTbOgjxiN8PrBxTI44oDWFXuI7syL7fzhzXyI
         k7dg/D4LGtqED/cEIlHhsi8wIL7by7qc85edjpfJOXg3chwB6WnMDlw7QlSJx4pUXjkC
         vjQW9ZWw+u5ztbA2G0Tjmub5qJBSuBX2kgKqp850371KbJkq2Ssr+3FY2P2mY7vK2ylu
         iRsw==
X-Forwarded-Encrypted: i=1; AHgh+RrGFByPqxAKRL7xDf78dEr5tzDOL622goOugLhZbBRyzmW2y7BsQCG0QF+RctTB4qOacAXA+Xwj5lu6ndIPfd+L@lists.infradead.org
X-Gm-Message-State: AOJu0YyGY+YNTEdtdSdODnXMYtcx4iE9RvbtunX95W2dKk1XTxm+TpQ7
	IgZuSXJbpqW1TkrZNwthWabBs+mW6LAl8h9hOhUI/4GtW/dI9ZzoTrg+
X-Gm-Gg: AR+sD134C/sy5aDMDLamDjkPwUaR1U43CgP+R6dINtI2D5HhxJFZZ9DC007+qkenfu5
	EouSLRkP1J72cSot7wKF0KHQi4i3icRtDnVgcoJQtYs7PzIKsGQEuC4xZC5mlSJ+wXbhk2FLt+g
	AsUBaP/+Enh6mBXJuuU/mJkPB78w9SxvjR8m+wduY8joNKmI0dHi+yFTZyYbqOAunaUZfnkaghG
	vyx9rsOUB05SRU7AtZjKdWlpZp5VQ4y6LH26rpwE23UQEkM2sfIJLkvrRlb7aqP8dildVPG1rXk
	5nzlodWn5/vfmwY6QMRwuYW28q+JfXC2Nw7BgnGGmeWWxXKUVtRdZ7mdHH9K015Loc7OcWKxstT
	gUsMOvcHSqcfPianuy4H1A5pchEFbEKMfh+z1h5PLqeBq35x0NcTO26bkx3K+Ono/UGkEyE+/8w
	DmzRSWZJQ604tE5QZK6uHlHgyyWf6AGZKodkMgm7zFuqg2+dsDowxcmizs15hzwwgAqIT0d8Zb3
	+mYnoNhRx0HNt7VXQ6BA6n6diEvCBdDy6q8ucjTyr+WVZY=
X-Received: by 2002:a05:6a00:32cf:b0:84e:1a34:2470 with SMTP id d2e1a72fcca58-84e9325c5e5mr5065072b3a.30.1785286247345;
        Tue, 28 Jul 2026 17:50:47 -0700 (PDT)
Received: from [172.19.1.48] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e9fe2153csm565718b3a.3.2026.07.28.17.50.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 17:50:46 -0700 (PDT)
Message-ID: <8c59c12a-3725-4f36-9e30-cbe0e2ef95ae@gmail.com>
Date: Wed, 29 Jul 2026 08:50:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: watchdog: Add MA35D1 Watchdog binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jacky Huang <ychuang3@nuvoton.com>,
 Shan-Chun Hung <schung@nuvoton.com>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260724091427.1689980-1-zychennvt@gmail.com>
 <20260724091427.1689980-2-zychennvt@gmail.com>
 <20260728-poetic-outstanding-salmon-6fabb3@quoll>
Content-Language: en-US
From: zychen <zychennvt@gmail.com>
In-Reply-To: <20260728-poetic-outstanding-salmon-6fabb3@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_175048_841527_A8700F10 
X-CRM114-Status: GOOD (  11.03  )
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



Krzysztof Kozlowski 於 2026/7/28 下午 07:47 寫道:
> On Fri, Jul 24, 2026 at 05:14:25PM +0800, Zi-Yu Chen wrote:
>> Add device tree binding documentation for the watchdog timer (WDT)
>> controller found on Nuvoton MA35D1 SoC.
>>
>> Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
> 
> A nit, subject: drop second/last, redundant "binding". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Best regards,
> Krzysztof
> 

Hi Krzysztof, 

Thanks for the review and the Reviewed-by tag.
I'll drop the redundant "binding" from the subject in the next revision.

Thanks,
Zi-Yu Chen

