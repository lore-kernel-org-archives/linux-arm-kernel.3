Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6501FD5C0C8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 14:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MDA/YnPw1q979OydzNA3RQek3PwG3C1LVM/KL/xZqYg=; b=yiM8QNSwgEmnWn3Dz6W4ZHd/pR
	k3f8TYha6VVl2auJENLPfa3MnNevi9qyEMiIx4Rn78mmkdxkGoD3F/uVEkimH1jXeWD5ZzKPE6jlW
	sH+2ET4QeCx3yh9p5apohvvv91VLWA3j+lZp4FLVxbg1P1npFd0rA630uoDDqKu3ffeO7zHzsS+Db
	Wm61pJ0bZpDRFW08NZgApF5cV6FabCUB5CGNR9TRWaEpszT4XGyaG9qnaHTPCECNVWmBRsRrl8mnD
	69XJI8I0C/ymq4arxytT2Bi5j2OvGIjoOLyscyB8fWot5A6KhPgjr4yfkdaePIzIXywDkvHwoN9tc
	V34j9qPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Q6u-0000000AsQn-2jYA;
	Fri, 08 Nov 2024 14:37:16 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Pee-0000000AnUi-0Ggt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 14:08:05 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-20e6981ca77so25648995ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 06:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731074883; x=1731679683; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=MDA/YnPw1q979OydzNA3RQek3PwG3C1LVM/KL/xZqYg=;
        b=C6Ib0T+SdgpgVxmQQfxszjA3g0eKgxhqk2JhhhwtXascjAL74BEPVS/RsN2Rq6kbLr
         6wP6BBm3o3bg8uxCEcou3fK+Z42oyjpfS9U63/xoSorcvEp7Li4AXJdlMuRGoFl6JYZl
         XlE0rimf/erSPSLAD/M5dZaWqyjVVujcKfBmrjOvbhxcjg5C8C3l/X2geRQyYIx3fgPh
         b9v0DfPQYLNZaOxbVfuA5vLJdreNCr8yrplV9iziFx6AoKhzmARYS9JsSwXTnG7QMA20
         gh4gOGU5yFgnNU/x1OiJzOaUVecbOes8OThuSxq5FO1FvgEhO0zzrBuquRKwrrJ7WgS1
         I+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731074883; x=1731679683;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDA/YnPw1q979OydzNA3RQek3PwG3C1LVM/KL/xZqYg=;
        b=f2d1q0emicMzOfjrALZ+9LBx/XD49plrRVCyKPYAJjDEc49ukGzLDghvuFq3X0hUIS
         FDBKMKsrtU+dl2gyDxhrSgz2glh+rvL/VMT7snWxgFeNim89aKe4+flCI22FyBbhgQZl
         ZO6b7yuzPArhQDa6JHESdblZf/oWBGApz7Ca9H3CB5O85NG1eRmEbIkhCNpTyGb3jqQB
         hkeJtlUTVRCpP+ZQdRBfetGDLTFnBai5HXxlXG1GCW+eKdRGQ51RSxXG20G+AhbQcJTh
         k9ARPrpCKWP9EjbNKSdty4LFssZngTFX05JubdYd8yNqAof6Tvd0XvVESuvlG+4chBRJ
         vHrw==
X-Forwarded-Encrypted: i=1; AJvYcCU0q5RUhu4CkLghwfAKE0AjLxKDt4iDXoyy6MRlwaBwbIkaMEJMoEtu2nX3mW1ZGlGAIAIDaq/Ku0QxGUFkEgQf@lists.infradead.org
X-Gm-Message-State: AOJu0YyWwgIv9K7XOMx6Wq37twogK3BokWJWWIx7urc7MOzlX13a80Ij
	f/2w778vWz9Lz/3DPw3LIyTUgfRwcIYH+Qa8Bv32eaub7jRtLRjt
X-Google-Smtp-Source: AGHT+IFgkItELd0W01lweMUWk3BaIPKK/cfRmmwUw4c5FH32ummS1mrI9WYYmto2+9cJdiXsPPWbrw==
X-Received: by 2002:a17:902:c942:b0:211:a6d:85dd with SMTP id d9443c01a7336-211835d9930mr35684205ad.47.1731074882693;
        Fri, 08 Nov 2024 06:08:02 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f5cab66sm3454618a12.33.2024.11.08.06.08.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 06:08:01 -0800 (PST)
Message-ID: <9a1e64ef-81d9-48b0-b871-ce4ff792eae4@roeck-us.net>
Date: Fri, 8 Nov 2024 06:07:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] watchdog: aspeed: Update bootstatus handling
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Patrick Williams <patrick@stwcx.xyz>,
 "wim@linux-watchdog.org" <wim@linux-watchdog.org>
Cc: "joel@jms.id.au" <joel@jms.id.au>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 "Peter.Yin@quantatw.com" <Peter.Yin@quantatw.com>,
 "Patrick_NC_Lin@wiwynn.com" <Patrick_NC_Lin@wiwynn.com>,
 "Bonnie_Lo@wiwynn.com" <Bonnie_Lo@wiwynn.com>,
 "DELPHINE_CHIU@wiwynn.com" <DELPHINE_CHIU@wiwynn.com>,
 BMC-SW <BMC-SW@aspeedtech.com>,
 "chnguyen@amperecomputing.com" <chnguyen@amperecomputing.com>
References: <20241101121201.2464091-1-chin-ting_kuo@aspeedtech.com>
 <20241101121201.2464091-2-chin-ting_kuo@aspeedtech.com>
 <ZyUcIIb1dtoNhX00@heinlein.vulture-banana.ts.net>
 <a0faca9a6ec7f4acdfa2f29b4ffb94b5392aea6b.camel@codeconstruct.com.au>
 <TYZPR06MB5203053A004676F51322DECFB25C2@TYZPR06MB5203.apcprd06.prod.outlook.com>
 <ed77d57facaaef0be796b4c6a742dc7bf3bff479.camel@codeconstruct.com.au>
 <TYZPR06MB52039B02B6D3053355F30489B25D2@TYZPR06MB5203.apcprd06.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <TYZPR06MB52039B02B6D3053355F30489B25D2@TYZPR06MB5203.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_060804_139588_15499196 
X-CRM114-Status: GOOD (  11.18  )
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

On 11/7/24 21:42, Chin-Ting Kuo wrote:

> But now, I think it will be better to add a patch for creating a new
> reset reason, e.g., WDIOF_REBOOT or WDIOF_RESTART, in watchdog.h
> of uapi. Can I include this change, creating a new reset reason, in
> this patch series? Or, should I create an extra new patch series for
> this purpose?
> 

This is a UAPI change. That is a major change. It needs to be discussed
separately, on its own, and can not be sneaked in like this.

Guenter


