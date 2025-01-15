Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFB6C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 08:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7VsayfsbgUkjz33UWIbO/Za5YihWzgN9JEYCylKHiN4=; b=2stHH0xb8D6FZwtj7qk14w9LFh
	d90Np5vKre/XGa3CMBDps+3bb8VfzMMRekWPub2/u4B0p7bKF2v3xShqVxdf/ePlU26po9CWAyBus
	MDd2lF4zcrootK0BkT6lEfkT6MC3GV5oNA6i8pw0iYPGhNt8jP3jQZPIQiMzrbprFuyXtFzSeIfK4
	4Fwb/xoBVNUNRYUT64PAwevLxkC0zxSoCeDZTmYGh+rLHVEmP17TWLKg3vUxjOa5Xzffdkzf/Ce0V
	9ZPNrsyG9U2p899wmaWbcvfh+00iYDvWEd8NWbtN/HDCx1EwVaCIr7lJCqPuOr1Fyf+zanV65pZBy
	IR0QsFwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXymH-0000000B5t9-1hUg;
	Wed, 15 Jan 2025 08:29:29 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXyl1-0000000B5YK-2JJ6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 08:28:13 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43618283d48so45530825e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 00:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736929689; x=1737534489; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7VsayfsbgUkjz33UWIbO/Za5YihWzgN9JEYCylKHiN4=;
        b=el4PHG4QW4KaAw0FnclRvJTMSRINCHDUoehxqkxyrbtiqgGXd0XvjvTDSg3XIZLekZ
         XD3Ei3X2TSVSezkBj0e1ZVcQbvD7HHwaV7kkWLgHEq2i+eBF5tj+YGcaToJ1PnLpcPl5
         ytRi6DgqXdMSK9bRbPvx2/iSU75ftNcPfbZoFGS2t/29zUsN7PTg9lfhL8mTXOI1CgPQ
         Ag0ltoHwjyRxhctn5efaPyAJGabNLgKgVSQhWbmhTLAQmaotZiwoA5FJVHRJ220ZktOe
         jun5M1EK7eCJkiR//FXkfaPf0blWuWBmeiPyoajm1LW66/vwedYQg3Gr1xftvTIvF3Sl
         uLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736929689; x=1737534489;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7VsayfsbgUkjz33UWIbO/Za5YihWzgN9JEYCylKHiN4=;
        b=LGcJskK5EgEShiymI6+ez/nHnw0D3sLXLw9wvtt2IAhsB28p8hrEtIhlhOmXRFsbHe
         T2WFnpaUec7ZjhTE3jwYoR7Et6yaHmaE319R+OFONMkYHbt02GT9nqtO03P2Qmq/0AkN
         bY/GOsTdC7yHqYVBGlXc4Sv5SAuX1kaTD1ZKwmip/MCRN1l6MongTbvAd1S6dZO1f7Kk
         jTUrs7cF0VelJUF3buhb4xl4GC+W5fo817hn3no1ZcwO/RYHqApvzxzwLjVru2VP7W/J
         TjSadS2tDLaIDrIwSXrFHUk3wRiIEkPz3x90PfXtMIZ4JYx47DOkBSFjG3WCH6q1QhOb
         OA/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUG4pPd7GChhrpYm+Iq+e93ZFNCudgY6Ow64/v3+jvWXH/Ax60BEjdnHiF0Yoa0CSUbirdO8f7qjaeKMOFcWEVm@lists.infradead.org
X-Gm-Message-State: AOJu0YxqguZbT+6/PvNjsLVQJaO3RSLuKlwkOj5rhcjJ9bOuri73oFhg
	RW8PVR+YHWTcmo3dnts5rWKGZEOUVGoN15y5ygUOtWeALUwvq8d9
X-Gm-Gg: ASbGncvGgwct7G7CpdHesp9RniVHavbbmp5TjvLjIfFYlj2TO+xg3j8OORFaUB2Pvhe
	9UCzf4A2ZnjKsLCtOtKF+RkYLdWWOpwQicDWE04iDkE9Axo0JylCb+Bx+j0OSvSu8Nlh4tv7RgW
	tJUCzHAsL0AkzDFqn+A82WbT12h6PwSx22eMpLgppGYTf4+/Sp//Sa2MF3c/y16FI/I5zKqMCxQ
	gpu1FAHQcg4OcVpyyUktAxWCsT/DDlWMvQh1Ljphki3lEcdNQwTUZgoZlSlvp76H1l9/jpdKsjb
	rsrEYCR3IlnFolxmq6k0HHvaHw==
X-Google-Smtp-Source: AGHT+IGL3BMYFdeGwsOc+4hVyEkEjlFrsyaDEQrSgFINthPSQpTJR9k3ryox/oDYyXaXdiw8pZ9GLg==
X-Received: by 2002:a05:600c:4f49:b0:435:194:3cdf with SMTP id 5b1f17b1804b1-436e26bd59bmr124095735e9.19.1736929689301;
        Wed, 15 Jan 2025 00:28:09 -0800 (PST)
Received: from ?IPV6:2001:861:3385:e20:6384:4cf:52c5:3194? ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74c6179sm14967605e9.22.2025.01.15.00.28.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 00:28:08 -0800 (PST)
Message-ID: <a5608ccd-e427-404c-8eb7-f189591a57e8@gmail.com>
Date: Wed, 15 Jan 2025 09:28:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ahci: st: Switch from CONFIG_PM_SLEEP guards to
 pm_sleep_ptr()
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>,
 linux-arm-kernel@lists.infradead.org, linux-ide@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250109175427.64384-1-rgallaispou@gmail.com>
 <07a7177d-7705-4eb5-a11e-02a9429ffac2@kernel.org>
 <Z4EDKUb+hO0ovV2i@x1-carbon>
 <cfecaa65-f6bc-48c1-9295-9bfe18f13db3@kernel.org>
 <261f9fac-82de-4f39-bf5c-cdfcee917588@gmail.com>
 <88fb7ad5-e2b3-498d-82d0-cdba8cf50c1b@kernel.org>
Content-Language: en-US, fr
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <88fb7ad5-e2b3-498d-82d0-cdba8cf50c1b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_002811_604521_72EBAE78 
X-CRM114-Status: UNSURE (   9.72  )
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



Le 14/01/2025 à 01:59, Damien Le Moal a écrit :
> On 1/14/25 05:28, Raphaël Gallais-Pou wrote:
>>> Do you want us to do that cleanup ? (fine with me).
>>
>> Regarding the other ata drivers, if you have the patience I can do this
>> in a few weeks.  There is other things on the stove I would like to do.
> 
> OK. We will work on this.

Sorry to change my plans,  I actually started working on this.  Is this 
okay to let me handle this ?  I will try to submit something promptly.

Thanks,
Raphaël
> 
> 


