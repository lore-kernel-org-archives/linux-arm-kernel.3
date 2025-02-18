Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8549C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 09:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V3uXTrr03eTBp4TQInaTHeB1lyJsdQisBIQEzz1BspM=; b=iGfCkErJLB5hEunRGh//WqYJia
	syhzKmkUHgjqKxAgpVb6EmcT7f6W6QYwoFB1KD7utXt57Ng+k+8IT4fA4T4CyBzlwUbAJmOgkdCrH
	rD5ooCqNY4fzxOu2BXRhW5ZOdTL0O11B72FUHPdgwadX+ic9FLchaC6yu9Ql7GBVvd15jzTexsKRx
	nQvPeYW7Wm9tn3x+FCDmjDVI83cnE5adg4W47MnuBrTk/rn5k/hWCpv6DOA5wiyh48YhovIcUKwUP
	bM/WFBKaNTm0e8Jr13bZEK+XryBbjifPr0bGtKRCIVNxo+1w+OmLeVAfMjbNCC/D87okr68Uiri5E
	LYyVNb6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJlJ-00000007TcY-3JD0;
	Tue, 18 Feb 2025 09:19:29 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJe4-00000007RJb-0KJG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 09:12:01 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5ded69e6134so7830286a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 01:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739869918; x=1740474718; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V3uXTrr03eTBp4TQInaTHeB1lyJsdQisBIQEzz1BspM=;
        b=bFdA1lMEkdXbk3pHq/Od+aYrFvcWhUBw5vMhwhlDPsZUj0KlD5Qd5H8Iviq3nUruWe
         32y+GEz21yR5ngLXjFyHBZmQSOMAZcHAM8POgUnMT/dbaLUC4U0LvfOfax++wp3rNJaY
         /bjGr32NXMIrr5jJm87y0Wdp9ACJvIknR6LavCrwsEB928LEvMzXZ/n4boEkuKrI90ZG
         xF5QY93rUTPY2qAeiPIf9W5i18Bs/0D/mktNVvXqX8ayygdsigXeWt9roXty8wBfmh6D
         Jorw6bXkgG3D+6ZEeIt4CIvsRMkgpJhzzGWSLGX2znJAwthZavkZpmnfLV6KvgquJfTU
         4TSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739869918; x=1740474718;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V3uXTrr03eTBp4TQInaTHeB1lyJsdQisBIQEzz1BspM=;
        b=Lh0SoZJNp77WHAFibWfrwCftSIjcdcgf8ZAUf07ERqhQ+D5RimZJ5ln+vWTJKdXAGU
         1EKY/03Ks+9nqtOePm1p9aH3WoVgpR1zakV72cSJm1gZZRdCN66gxqKWyg9NQWerzN0+
         IXZAVDiQO6/EzSE73L4BX4bzSjer2+VOHuDrFbDxlfbWeGVABmFx5N+UVIugJdWhjlUY
         5Imx+txM99XSFgupukRQ7nB+akq8qvN4u7bifgqim1/PNSi/abyUnPyEO2vQnXyFWcog
         e1GMzLTjXCdYb7SKGT3UxtGBzDMhhEPnkuUoXyndO3MFf5N8K9h2hN+QGo+ZOQzmLbqh
         jFIw==
X-Forwarded-Encrypted: i=1; AJvYcCViRr9aFzNgzWay4PA/35aK3xF5uXB2NXMfbIq3yaorLz/UPSxtMz5Wyo2u3Vgp+5lGANexdOYjxT0EseOEvFLM@lists.infradead.org
X-Gm-Message-State: AOJu0YyfDccaf8hPrrD7PIQ+mz6PAqkEEDy/Kmofncz1i0G7CgjLa3ji
	sNjMKWSuZuL/8XQzDP+2MAyxrq/h52czqTgKmLAis4KdTsZ0yioufeKCHSZsmu4=
X-Gm-Gg: ASbGnctAd+g3WQVMMgmstaO7v/cDGp8Ucyv3ESGigOwwaf8/8phtlQpJA3OSAvSdqRY
	BYawDoO3xFZHhfNzzon64m3x1Yp8J9M94dNbwWuYIY4rB4QzB22yZMArpDq81v+kPBicZAW89me
	5jEbwUKj/eQ8IykzrH1YuETR6ORCUSTDN+dy1h54NhujpBvtOSYspZQU2hX0dJDqc4gO+IYCHxA
	n7PpGLMT9XG++pptK73PYjUpxnc65yEaOttQizvqBUC4oPMFqp82hMbk+AiZ4EzepriKta1nwnL
	SxTt6ujXXltI6u1ZAAbnECU=
X-Google-Smtp-Source: AGHT+IElObB+wPJH8ll7VWsYIuWeUZ3GQukv025YddeShYC2NXJtKepo4lLlRZ3MwK7mM+8bMe+zXw==
X-Received: by 2002:a05:6402:5246:b0:5d0:cfdd:2ac1 with SMTP id 4fb4d7f45d1cf-5e036055eb7mr13524262a12.6.1739869918369;
        Tue, 18 Feb 2025 01:11:58 -0800 (PST)
Received: from [192.168.0.24] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e076048c05sm924724a12.35.2025.02.18.01.11.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 01:11:58 -0800 (PST)
Message-ID: <e925a6d7-aa71-43cf-ab84-bed65b78cbe3@linaro.org>
Date: Tue, 18 Feb 2025 11:11:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 07/10] printk: export symbols for buffer address and
 length functions
To: Sergey Senozhatsky <senozhatsky@chromium.org>,
 Christoph Hellwig <hch@infradead.org>
Cc: linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 kees@kernel.org, linux-kernel@vger.kernel.org, johannes@sipsolutions.net,
 gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, tony.luck@intel.com,
 gpiccoli@igalia.com, pmladek@suse.com, rostedt@goodmis.org,
 john.ogness@linutronix.de, quic_mojha@quicinc.com,
 linux-arm-kernel@lists.infradead.org, kernel@quicinc.com
References: <20250217101706.2104498-1-eugen.hristev@linaro.org>
 <20250217101706.2104498-8-eugen.hristev@linaro.org>
 <Z7RELnyWRLietj9b@infradead.org>
 <20250218-175733-neomutt-senozhatsky@chromium.org>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <20250218-175733-neomutt-senozhatsky@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_011200_145179_2FD9A480 
X-CRM114-Status: GOOD (  14.15  )
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



On 2/18/25 10:58, Sergey Senozhatsky wrote:
> On (25/02/18 00:26), Christoph Hellwig wrote:
>> On Mon, Feb 17, 2025 at 12:17:03PM +0200, Eugen Hristev wrote:
>>> log_buf_addr_get() and log_buf_len_get() can be reused in another module,
>>> export the symbols.
>>
>> Err, no way.
> 
> Yeah I think we've been there before [1]
> 
> [1] https://lore.kernel.org/all/20230905081902.321778-1-hch@lst.de/

Okay... in the line of the purpose of this patch series, I would like to
be able to have the dmesg ready to be retrieved out of the kernel in
case the kernel becomes unusable (due to various reasons as described in
the cover letter). However to know exactly 'where' is the buffer stored
I would need some way to point to it.
Do you have any other suggestion on how to do this ? Using the
kmsg_dump() API works only if the kernel/CPU can run code.

Thanks for looking into the patches,
Eugen

