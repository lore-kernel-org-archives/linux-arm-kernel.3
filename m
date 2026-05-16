Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C19CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 23:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cBfXIYldpHcgRD4I6rHdSNL+xKkkUEyUH1UQFq6ffjw=; b=wXfEvpRxLaqr7eBIBpn7IRRbbv
	GkyUf594RfaItthbCH/I24s6cCTzyTwrJbp8MrHQGl6RrYhtx1LecVqPpjemdLDRs01qWCQefYvFl
	ud0m3LwgYC6ZCiVZu45pTkiekj8lMciThEcWk+wmuBoFb8Tob7VWTLQ17QvxbnkU0SlJJC6UNyq3I
	99hzjtQHxii04MQBK7fsXPeveAZ2epFzfYtATY6d5wV+NEXDw/DPCgtlGwbOlGNdvNjmnyXmmywLa
	53b1ARjne85Yed5VcsZWV+MpQamZkd1d1WAJqHjp6ybVR0S6xLJjRQVFpO1uolS3s1xsrdJSPg03L
	sbpcDvIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOO8X-0000000BgWC-3WN1;
	Sat, 16 May 2026 23:09:37 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOO8V-0000000BgV6-1O8l
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 23:09:36 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-835386ff122so1095946b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 May 2026 16:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778972974; x=1779577774; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=cBfXIYldpHcgRD4I6rHdSNL+xKkkUEyUH1UQFq6ffjw=;
        b=bmsYSXbWTVSCuZrTZZdWIizZH2uuOY2TZBQgUp04LeG7GXa82b4da21sYTxyfp9Ly0
         cxELYur0dK5kolACxLMEAdtzyBeDeNllQ+UoFp7BKGDWVEskmR03zGhO+wbDtzV8UrDf
         JMKrLdc5bbb/HrpU5h8i9ihzHTACG/UmnNiy8Rv4iaam6Dvf1T27A9dum9qWdOKd4zjZ
         8zPutS0dP7q842NzHESFXWlU7SXPbGDpZY6mxdA6WMpbitc+1KoledZ03vNeIthReqs0
         hu4FaJMzbj98vGEBxN9DBgQQq+5jza9lEpYeV/bqg5VvHmh8Te4XJXFQ73qJMNUWwzTW
         vmJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778972974; x=1779577774;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cBfXIYldpHcgRD4I6rHdSNL+xKkkUEyUH1UQFq6ffjw=;
        b=biJhZxbML9NDPDmi1KmHP1BJqnT+iPiJQHD8KNFMgPORGIYHeFldN3LYfQr8nQy6xO
         1pm+omouwYwAv4I3l6bL1mjckJ84MR/scH1c81smutmA7WALME6zlHhVMRroED/zziJ/
         8x5L3KAHEw347n9dKppffLY0/4NAIrX7Td8i3xsrrIQGPPkyRBGQZZNBW3CwKWmmM552
         LKtuEa1OuFJ9GS95PDDS4w7j6tz45TVTa6LOwNvEMWIaZTbEph9vL+7WzhE8nZVIFu6W
         eCggXDiL7XZJloNNmQPu2cXwty2ZckRT1iDxmR8kTvn9pinv73HFOyB4Xo4yUC3aoCQn
         GaFw==
X-Forwarded-Encrypted: i=1; AFNElJ8vrknFVFpz+chYC4qpvz8owEeYbcNGBedNz7TLAv5cdY8Og+hD9IFdKZFIRnO+iHTSNfgJQbXtYnjfFOStICYt@lists.infradead.org
X-Gm-Message-State: AOJu0YwwieVyMtlelViyiRY1LsNGb9S73HJEdIfta5ca2fMbs3rp85Qq
	ktU1yFg40kVd4zW9OoCnjxRI+DlDVxEXTcOmGE9HTc028RIn/XzpNOEV
X-Gm-Gg: Acq92OExkGjDVfX2JxDV+UFiOglgBaSPGog7fbm1vaV9VDKm8OplqhOo+Jms4zwO/ls
	Ng69UYquKKFdVhwA0++CBWxnEp0FKE2C3sXKKkP+5w/Ts9qShp3rdDtSS3hfpKBXAW2I5NJWGxH
	Rt0V7i6ifkn78xzY94G3Zv0ZhonU9Yzjqx50vhpxRdqpqegkNBQK5VYnSvITuFkQ9BBWFBGCpqm
	/6ykbAl5fJisWnsEawPEjnv3Iv2tfz88RAGLrzMxAE2HTWTOi6IkPDZP/7YzessiCK/8SXTf3Ql
	Tz+sNSdSS9wzkAvFLg/YGwcIX2K7ixnBT6ZoTK2zBl6dTHBYnHdgQpqR/Qiue7Q6WlsQhlr07+y
	4111a8D8F6JzDRdMVypLCWk8cFqOOnmadwVlTwEkY4q7s2yf8cB7qxmQsv6hZkyvxlI+r0Huatu
	6yOnkctuI82vwJYGXcQB4b9VkeSu0D3tZOekgUNUyJ1WhEfVMb9bQwOMgvfehdowvhlScxAeMZ
X-Received: by 2002:a05:6a00:390f:b0:838:af72:fb2f with SMTP id d2e1a72fcca58-83f33aec2a5mr10161094b3a.6.1778972974432;
        Sat, 16 May 2026 16:09:34 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f2875f0fbsm8978388b3a.57.2026.05.16.16.09.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 May 2026 16:09:33 -0700 (PDT)
Message-ID: <76f0d9d4-b7c1-4aa4-87ab-6de26f200e4c@roeck-us.net>
Date: Sat, 16 May 2026 16:09:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] soc: bcm2835: raspberrypi-firmware: Add voltage
 domain IDs
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
 <20260516191555.17978-1-chakrabortyshubham66@gmail.com>
 <20260516191555.17978-2-chakrabortyshubham66@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260516191555.17978-2-chakrabortyshubham66@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_160935_381430_A39CC455 
X-CRM114-Status: GOOD (  14.60  )
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

On 5/16/26 12:15, Shubham Chakraborty wrote:
> Add firmware voltage domain identifiers for the Raspberry Pi
> mailbox property interface.
> 
> These IDs are used by firmware clients to query voltage rails
> through the RPI_FIRMWARE_GET_VOLTAGE property.
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ---
>   include/soc/bcm2835/raspberrypi-firmware.h | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
> index e1f87fbfe554..fd2e051ce05b 100644
> --- a/include/soc/bcm2835/raspberrypi-firmware.h
> +++ b/include/soc/bcm2835/raspberrypi-firmware.h
> @@ -156,6 +156,14 @@ enum rpi_firmware_clk_id {
>   	RPI_FIRMWARE_NUM_CLK_ID,
>   };
>   
> +enum rpi_firmware_volt_id {
> +	RPI_FIRMWARE_VOLT_ID_RESERVED = 0,

Is that needed ?

> +	RPI_FIRMWARE_VOLT_ID_CORE = 1,
> +	RPI_FIRMWARE_VOLT_ID_SDRAM_C = 2,
> +	RPI_FIRMWARE_VOLT_ID_SDRAM_I = 3,
> +	RPI_FIRMWARE_VOLT_ID_SDRAM_P = 4,

Regarding Sashiko's feedback: I don't know where it got the
information from, but a web search suggests that it has a point;
RPI_FIRMWARE_VOLT_ID_SDRAM_I and RPI_FIRMWARE_VOLT_ID_SDRAM_P appear
to be swapped. If that is not the case, please provide evidence.

Thanks,
Guenter


