Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1238AC5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 03:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QEU+pp4CCJstwvmXVbRVK0utyTpf3g/1fbsNABHVlac=; b=SCYxEi0kcK90hTufOJKKQtfhgK
	17z0tBRPUU+e47Agt49Qx2R6+h2hFXYnmxi7aA8fpHvCuIhVFimejfbCMoMeTRgdxPDxPqA6Rmg1O
	7wfDo2I4FthAjLCOdcVerILFljFdTYPHO/YParwLf+Z+ZDK5xXuiNn7TuX7Bm1DIytbrVrNfGYLwM
	sv2f3x+8Thg9qJYkU8VcLlWZiM2EMMKtSnkOwxjlTY1a3WrTUx1eh7UPqkZClcAFl+KyGwvzjZqdx
	/Z3ZizL/xHSdUrO2AlKoc+LkFseLZQ/YoAvOTAmcNaVTltJNWG/FlwamERYXfgbeNH8zGJhh25t10
	SHPZATjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtH9s-0000000Ayos-05D1;
	Mon, 10 Aug 2026 03:58:40 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtH9p-0000000Ayo9-1c4F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 03:58:38 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so1186527a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 20:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786334316; x=1786939116; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QEU+pp4CCJstwvmXVbRVK0utyTpf3g/1fbsNABHVlac=;
        b=HJOf07Nryeo6lmyqXXiJO2yBrK4rJBg18deppl7OUWpBxdAdWpps9ojVwhM2yA0w7Y
         0Eco2/7EGFLofT7C1KP6p2/vTmGmd4vVfL6Vd8hzYkCDOrsXvcYzdvvGqk5NefuxAm70
         smVuS9NlzJTJf4LHrxjxX+Ld6ak+WNNXxfS/1uxoVTw9fVZAmdc0D77I/jiOu0+Dj+dP
         Yx8nRlasceHgpzy7epL3iTswlfup2315wzcQ/rTYTP2GHLPqhnI2iWOn2IDodJZ9MFxg
         6bAQ+oUO0EENjMLAY/8TXcbXfDzD8UUjGTFyR8H/aLclnZBfYQZUS3bUkRSRJ3bJbFOC
         u6jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786334316; x=1786939116;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QEU+pp4CCJstwvmXVbRVK0utyTpf3g/1fbsNABHVlac=;
        b=YgPy6j8lwX+Z4LevxoVYuBOwDDw3NxXQnPpOLyE732eEfNzaA7QKA/Jwtw7iPLPvkG
         gh4XritjVx4fB9G9HCo629POfjCs+3880a964RibafiNYbhLhxhPQ41Nh3cGKq/Ac7V3
         bRIL0qu4g2clVf/nPsW68vn4YUHzgDubFDDbWGnRxKHn1f0GiTJKIWSwScxu4lxpiBBl
         GnxpCs1eSkUha3qJC1H+y9eXgae/my4wblKG3vWl/3EFnNkJPrwk3ueB35/1a685DeJY
         06jN0FMnOHjb30YmiKEBCPWctuX0nHxkmAYtubTD0w/P8O7QIxHxHo/fjGifvsZY9BO6
         /DKg==
X-Forwarded-Encrypted: i=1; AHgh+RopM0V7/BenHzVrasMUEwpwctgfR6XeXcIUkmKKWkUr5O5GItENiorRAhlX+OuhHse9rnUdFeLuXtIv3N84RoOt@lists.infradead.org
X-Gm-Message-State: AOJu0YyNMyywyYvGmeY+il1M46arxPhcMjYVxu6QXB9PKMGeFCurVnfr
	zA1eT+EotlnI2I/UvM1U7nTU6tDguszSsJu7J9h4Tmemzyqgp7rlhY+k
X-Gm-Gg: AR+sD111lH2wNfMV7SWTxR/n0PyrCYUQLqLPCZTe1sX5A9Z+pG/PQosbhCUL2PhN4y4
	JyI2/AXOrMpxcHcbFDCLhU7Swr5jlLrCKS4MUM49IhOBpuGXwABAxidqHjoqrxEvvMHVM8zIioc
	UK3ycamf74S8amRN8UgYpsNugWRPp2SMbxLJhwJu7RMBATLp5w3l76xv9Y16YHFO6QzntO6hPHn
	07KojLjQ1krgp/FGZHLVeiaDDiPvsBSF2YQkjO3vzsBzBwx8tVrCz1vj8BJIdqSIKpzvRfZ00M6
	RrzMqyAwd5hIcUSROZJMt7fuOsFk8xvxiPTzRRRbXk6Y9iUsB6xQ5xPDPkOFDSkOsP8U7EsJpX+
	p9/OcLC7WkxZ/p7OwmerYqDV3WEt8qsracqHDJqOsOR2zBeLx73UI7+iH/wVopG2asGUSIBtJDH
	hUG5nvVJXvB/9o1VHDBGY3UqPfk1hJYCBcioGpMmyoedKV8g2nc1TEqahbOAbMxlNn/RTjQVufV
	alBJWr+eDySUJE/Ivwoa7V/vE7qtwZBF6h6Hg9iWa1TwcjarQ==
X-Received: by 2002:a17:90b:5244:b0:38e:9eb2:9d43 with SMTP id 98e67ed59e1d1-3903c5b685bmr38481045a91.16.1786334316290;
        Sun, 09 Aug 2026 20:58:36 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bebde353sm41638500eec.23.2026.08.09.20.58.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 20:58:35 -0700 (PDT)
Message-ID: <3a9b7b85-e6f8-429a-91df-f674479dee58@roeck-us.net>
Date: Sun, 9 Aug 2026 20:58:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] watchdog: aspeed: Propagate errors from optional IRQ
 lookup
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20260807081652.38692-1-phucduc.bui@gmail.com>
 <20260807081652.38692-4-phucduc.bui@gmail.com>
 <1f26fc28-da13-4ca3-990f-676b53d23630@roeck-us.net>
 <CAABR9nFy=GD4afdDxzsbp31Sq=smGVFf+HvqsrJKh_FjqdUrJA@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAABR9nFy=GD4afdDxzsbp31Sq=smGVFf+HvqsrJKh_FjqdUrJA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_205837_436539_5BB8933B 
X-CRM114-Status: GOOD (  14.37  )
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

On 8/9/26 19:38, Bui Duc Phuc wrote:
> Hi Guenter,
> 
> Thank you for your review.
> 
>>> +             if (irq < 0 && irq != -ENXIO)
>>> +                     return irq;
>>>                if (irq > 0) {
>>
>> This if () is no longer needed.
>>
> 
> If we remove the if (irq > 0) check, irq can be -ENXIO and would be
> passed to devm_request_irq().
> I see that the irq argument of devm_request_irq() is an unsigned int.
> Would it be safe to pass -ENXIO to it in this case?
> 
No, sorry, I was wrong.

Guenter


