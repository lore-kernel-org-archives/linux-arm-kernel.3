Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1664DC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 16:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8idUtLLebZkZiwySpCodlAhE9dZe3P+VXk1B2OGGqzg=; b=qddyOReSfBvLMzBeaeYbZMDh4v
	iN8GPtDeE17okNn9lunE9mhwWZLw2PtzSJeG0Lz2DMU/KkZQ+/+5mF5+WRV01cU4Y45ZdhbuLxr0a
	sfTPkyStcMuJ0CItY53As9JPzgMAJ5Cm+yB39wEAvl/IS3fgEMW0C9AqVKv52DFJlvy+RC+omsbZD
	Znxc5Yedo70IJZgqcf/J8PbnUS+vu9xB5GrKZCu2Gtd0jaLBPECYqRq2a/1VxNl1P3lpwI5gKOtK8
	U3dPbOyYywKnjZg/ZtoNUmDXebpv7qKQibtqIkz6H35mQYx8O5KtEsvzupA5frm0pVjMC/a2sDK1z
	ah2OcQzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCKlG-0000000CbiM-15Br;
	Tue, 06 May 2025 16:03:14 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHSk-0000000BvcA-2kEE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 12:31:55 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-af52a624283so4765978a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 05:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746534713; x=1747139513; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=8idUtLLebZkZiwySpCodlAhE9dZe3P+VXk1B2OGGqzg=;
        b=O6UeLcQZkFTBrkSblCDdiNF0HjgSRAbS19J7pHpW5NNhmbUd3I6x7sqQlZco6MwELC
         lcTXEvP7CZTGv4kFLiXh4y2h3nhYbSEXbvxzd6nCmgCxh3hrR3oDpEKLlxD9UGmnBLP7
         Ctvg47M2PVoLGQTcrBCJf6mbybX2Gc8V0O623YLGAHO2SD9Ci4IgJEUhQZergdMz2jv3
         nKwfwHF2+hQsW/xP3sUM1af0cPfdRenrbwuNItgrYycBTOkNP/gpxwsLD0GZ/RcBXaK2
         VXLWAbg9MVfIOY1maiT/6LH11475qpaApAY0IxNKib7rY4Iq5y/y+XMcKSc8j+AVLn9Y
         +bXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746534713; x=1747139513;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8idUtLLebZkZiwySpCodlAhE9dZe3P+VXk1B2OGGqzg=;
        b=K+vL7A+NSnNYdm08htC0kph48rp79OY+ksFnCpEzc6sWAGgbEq5j1D6+bAASd9nXGo
         hTcID9HhdQ8yIxhiL+7AoyMM3lZY5sjzl2/NVGobBLPrJdm82xjUmhXeoOHVwhtSHxSE
         uQ63Y5aihlnsibgGIsFdyVF5aDcIpNjz3pQlOMvwkPP3bzGofARGdY0GR+WCILSrSK/H
         aeCbn3zeAHjxtMHf918InpwQUZNDoPVwU4ARlDq5PVlbghKPWkbNzh5b9L0Xo7kZzqfi
         KRd5xOAwv1JWU7OHSX/a5O5qCDJ7su+uXexpR3Y5RHC30hCLT8D3tzgViUKT01MJgfmK
         +DJw==
X-Forwarded-Encrypted: i=1; AJvYcCW66d7WGz4xfGx+iqqefdvATH/avjZYXy5UFVWXbgGU4EbMPmdtloIkU7oyMygPjcP6KrqD6Ka9aR7h7JhxjcbZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwX7TnI4RgC2MMlUEnOvLcjYyxydDDyTOwTrWmi48dNwVd3A08Z
	a+6mOqyJ59Th1W3qGvHfi9y9h+Wf/RkZyd8a43sWNOoYNOpR9b4J
X-Gm-Gg: ASbGncuprrsSESEkqUAfk30yzQnH+gnpk7P2kuEHSymMNQa5i7YZFPqnnOUTmo/HRfT
	hWmxVAgiPOjlJTFPHdvGPyv8RCAzqfx6hxUZdnNsZgVCpH+SiWprr/s7JcjHO7n+JJGhPcVStNI
	TCBJfIrqRWF6RBvEMQsOTbCyumCcGPggLxhy838D+cir0P9AGkhXdLoINRJrvqmSXtaMOxGn+l2
	c4K5jDpzTN9SZrUS4ut91kEYwAmY5VzlnvpNN0EVKkoSGTOS2q+PToIuAAqgiTs6LJTI1B+fMmb
	gTivJxc/7pyloHuMSu8GEEUuLjf05zhjlPUxUzYXOnafCraVKZ3pM+NkBt3QxIZUNBNAiJfqzXJ
	6GvLZACArLgwaZQ==
X-Google-Smtp-Source: AGHT+IF1Bb1rptBpuPdUkW2OAkIn4AZYn07KmyxeIsJrvEXJzqjsDaqivcRJcoWPQV5mBelNcvBxvw==
X-Received: by 2002:a17:90b:2552:b0:308:2945:3842 with SMTP id 98e67ed59e1d1-30a7bb0ab62mr4671711a91.15.1746534712352;
        Tue, 06 May 2025 05:31:52 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4747719dsm11060910a91.19.2025.05.06.05.31.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 05:31:51 -0700 (PDT)
Message-ID: <7027fc8c-80d7-4d52-bf94-ad282d66e729@roeck-us.net>
Date: Tue, 6 May 2025 05:31:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: apple: set max_hw_heartbeat_ms instead of
 max_timeout
To: Florian Klink <flokli@flokli.de>, Sven Peter <sven@svenpeter.dev>,
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250506120111.5041-1-flokli@flokli.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250506120111.5041-1-flokli@flokli.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_053154_694556_46548A85 
X-CRM114-Status: UNSURE (   8.55  )
X-CRM114-Notice: Please train this message.
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

On 5/6/25 05:01, Florian Klink wrote:
> The hardware only supports timeouts slightly below 3mins, but by using
> max_hw_heartbeat_ms we can let the kernel take care of supporting larger
> timeouts than that requested from userspace.
> 
> Signed-off-by: Florian Klink <flokli@flokli.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


