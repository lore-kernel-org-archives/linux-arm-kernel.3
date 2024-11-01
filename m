Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A20E6F08E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 22:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ASiyIHn/3ii7xbeQI3Xm3CDe+0D7uWXjTz/CkcuvjF4=; b=zM+f/vXyaxFHIsdBkSHC/kDYGa
	Ikj0WiWjDAeUAzYqUVeYjUtPgmjOIKhzVfpZ3/70HK5q6jFP/9uu8ehvrEUI2BNHmLaHeqL0CVIny
	MxR+9XmP1LioLdSx7uiDQCWy4l1Y1xlrs2KdnwSk5oJ8WWD78tlGd4hSbHjqsIk1R3Kk1a2vjMG+f
	/dpLPO+K7DegtNQ9ER8p7lzaZcqxlRy/6Av9i/9XqqUMZjIuPnwdaLF80GGA49f3d/MF/mkxb2dOJ
	dsYzvMn0OQlIdROOZ/qF56AKPRqzg79aKkCmOeRAmJy1alIJ94HIO9GLcrNQTgQ42tgPnnN6n+uMz
	T0Sav3XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t701F-00000008SHp-1z6T;
	Fri, 01 Nov 2024 22:21:25 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6zzZ-00000008S8B-3C4U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 22:19:42 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-7ede6803585so2586708a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 15:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730499581; x=1731104381; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ASiyIHn/3ii7xbeQI3Xm3CDe+0D7uWXjTz/CkcuvjF4=;
        b=Fqv5/a9qs3ubksuuRP6Oj3wfY5XDnmKonA58JamHEHcL16w3q8NSCZRGBKfMEVpD8m
         paHAFS1cJa43UCvsDnxEFdqXlUkQOrDRPdw6rw6QZh4+fSYfIDZnHvFBitXyhkvqcpY7
         93rxUummAw34ochza+GGjDu5XglzYOLytqoyTtJx7/MvRbCuOy9eEKm/3kI/HAUg32Bh
         RTZkc1IH0IWdF5hRzOb5hDVewdlPB1hV531nlUkbkbK08UsdQywqARoA61gV3IUsIcKC
         4mnqaL2576D4sGOBOnM0uorY15defEySWqyMbRv6b8Rr3DL+69mIMLSHQ2G7AY+XE2py
         AJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730499581; x=1731104381;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ASiyIHn/3ii7xbeQI3Xm3CDe+0D7uWXjTz/CkcuvjF4=;
        b=K5bA5w+399kKZy7+RCvjYstoZefszxgywdnQV5nGQEpNiFWSrT8gold/Y6ORi+ivsg
         iLPMyCQTIdJfg+n+Cb+WocUcelBnlRD2p25r/trqK/aLox3xusTf4DEuByL67uusE2fr
         RmjZhsqvToj8ou1pcTr1krcaG3s4p7o3vDaMqHgz6U1AapqSKb6/hrtRHLiQYrtGK9mA
         VxgXfC1NzyDbAAM/BBESJqunXadJCEumBTfoflSGljDUK1roqkL2XJzYxzdRCCVbbSfu
         vS54N7FrVl847PGYtDPRa23XkPm7XB1bWVBFx4oETBLXTQYNUFMCK92eFjuNCbVUPaxE
         x/qg==
X-Forwarded-Encrypted: i=1; AJvYcCXpOywXEtDjg4rX5FNWaccsGmfRfQCAq5m+zK6J0yAFhubm6UirUEjIu9xHqOMZxONmwjoimRVc8JSWODjR7NXi@lists.infradead.org
X-Gm-Message-State: AOJu0YwFFUrS9v33wsdzaENCNgJorkkMPAQuXR5AKA+bI8IcdtKD5+gp
	TiZkoWPSZ8kpZrtUuXGN7qCDmuvf7Lc+AL3qQuloVqmqR8+9n8r3
X-Google-Smtp-Source: AGHT+IHAfJoElGQs4UKDOuFUgAvAywk67B41uHrrSM/kNHKQQAzOFjjwRyqFsY4E1MH6AuvamYfeqA==
X-Received: by 2002:a17:90b:2e42:b0:2e0:7580:6853 with SMTP id 98e67ed59e1d1-2e93e0fab5amr11494578a91.17.1730499580566;
        Fri, 01 Nov 2024 15:19:40 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e93da98448sm3599311a91.6.2024.11.01.15.19.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Nov 2024 15:19:39 -0700 (PDT)
Message-ID: <c91f8b3c-ae3f-4d35-8b7f-2fb2b7cebebd@roeck-us.net>
Date: Fri, 1 Nov 2024 15:19:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] watchdog: aspeed: Change aspeed_wdt_config struct
 name to aspeed_wdt_data
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, patrick@stwcx.xyz,
 joel@jms.id.au, andrew@codeconstruct.com.au, wim@linux-watchdog.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc: Peter.Yin@quantatw.com, Patrick_NC_Lin@wiwynn.com, Bonnie_Lo@wiwynn.com,
 DELPHINE_CHIU@wiwynn.com, bmc-sw@aspeedtech.com, chnguyen@amperecomputing.com
References: <20241101121201.2464091-1-chin-ting_kuo@aspeedtech.com>
 <20241101121201.2464091-3-chin-ting_kuo@aspeedtech.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241101121201.2464091-3-chin-ting_kuo@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_151941_843426_FB031A60 
X-CRM114-Status: UNSURE (   9.60  )
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

On 11/1/24 05:12, Chin-Ting Kuo wrote:
> aspeed_wdt_config struct is used to store some HW configuration
> information. Changing its naming to a more generic one,
> aspeed_wdt_data, in order to contain more platform specific
> inforamtion or SW callback functions.
> 
> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>

I fail to see the point of this patch. It is just unnecessary churn.
Just like drivers should not be renamed because of an extended scope
or because someone doesn't like the old name, renaming variables should
be avoided as well. Such renames just make future bug fixes (which may
need to be backported) more difficult.

Guenter


