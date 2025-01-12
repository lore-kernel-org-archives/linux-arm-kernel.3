Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06ACBE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 15:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x3gG01/m+hJWTLZKxo2fthJ4fy1cfFaLbH+CW5D3uW8=; b=GEk5lw/uiQDE4Gw/vFPjptjzxe
	+OZWP/GqUJe3tfQm1RrBaU7EFZS+nSfB1NY4Xqaj4GUcxbnnXNptBq2NKOv8SuW8tVAXwZk3l3ME9
	oaObpbgPKrYeCrE+ppunDXXTzVjdiYbKvLZt+NzSvbbMYdFy1I1enNdj8FjMvbmbLKqziAy7uJd02
	tWrt6dB5fm8ugX6j1MFFYhsf4kz+q62ejxyRiHpRnUlGdkddDCwc8H9RWs2Ckej0vFWgpOY/nPX5F
	QnbrFLDrKg0uAbSsLJ030bujPKo0cgNoZt2reWdOpkBGyJEJrI70hShP6p+ubhf/whREvYQA4+hRv
	R/bPMH9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWzmq-00000002x9y-1lWA;
	Sun, 12 Jan 2025 15:22:00 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWzla-00000002x38-1SUp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 15:20:43 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2156e078563so50492285ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jan 2025 07:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736695241; x=1737300041; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=x3gG01/m+hJWTLZKxo2fthJ4fy1cfFaLbH+CW5D3uW8=;
        b=F3cAF2eUD6m2EJPBdHGBkPFX8I1vx0lvig2Rr31U/vK0zu5MsZvh3UIiewUvsLux8f
         SvmdleRfJlgvghld/OGrQwhKHgpT0OaOKVaqnUZXmpY5BXcio8K/tYKoWS7g+FkjiouR
         IlTyHr7312579fYJdroSC4pehlw24Ohrp2Nir7LhBQbgdgsEqAswoqXv4cFK3YPnVdJC
         oFSvZHhHk1sIc+Jeq5wLGmaRTxsZYD8FJZ+3ylqJ5ilsSSiO51bNMTKuUIKx+vsGcXMX
         r6cxRW1yOk4igE6Ec2cxg7VMxNYQlrzrYEAz/luw7hMfjWbNWZ8A0y0mXq6eZ1oOuCY7
         KMeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736695241; x=1737300041;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x3gG01/m+hJWTLZKxo2fthJ4fy1cfFaLbH+CW5D3uW8=;
        b=HqkhxKnOwisgHaKXMze6D+PpGmUfG7CM7Ynng+oyT26w/mCh+pTCNAGRWijCA3Fwil
         dNjMbhxaBLrrtMvSBJzVWZPqoo9/ocOIM1cSbL5Kfj7aaqb+h9olZz3Ep00mcL281gI+
         crggQnakcgAvAXI89v0WIhiPJwaehsRYuqb+WHbGN0DoTBjE+JfenhGbEcNMKXGqbLfv
         cQ5Ml2Cay+OJ/5DgvEvkdbeymtbCOLsHwVPwkv16lkTmNLqI3oU1p5V/FgsjlFNkmqgC
         QZQ7fLVbPomrb/Luj9Q7MDY4pstDPBsge06Zks1cX7HCvUzr987yJ/O/2akkAt6ZPyk8
         4Lcw==
X-Forwarded-Encrypted: i=1; AJvYcCXJX1a4AD0iZuqLP9VY3RmyeHE1AI4U3PIzz83f3nj+07jdNlVxFA5NVA81RqvZyNnGePHhlEodX74URa+TroRX@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/uds10oL+7F/Xt4JWo5BfUoIW+n++UD5H67pCimsehR2oU+5u
	CZYLFrmEAm5RQhs7jbUujIscm8RgKzFvhyRsAXFF+7su+FFxhi1f
X-Gm-Gg: ASbGncv3vuEA8SAUv1DP4BKy0F7ih/Q/FM7aBE3LL4LDYrKDiGFPATNqE76gJmHkkY2
	INPbQ8mpXAkpkg4YTcA6ptdwBn/+OvMC0jPOfmZnVQi+Os81kEeKMsf66hZkzTMTEZOmtOKKjfz
	qJYror6aMbzXmoFaAEOjLHaULRyjY45z2lqvUmNxRnBXfApmsOAqwIX4iX6UT9rtQMLEMWHAcv1
	LZFHeZVOiJrPtm618lDfIIy4q4pEbKfn1JFpX82R+C7EAl664DSAAH8gjtVpqgNNOeGPewkOv4N
	tiPdu+c5d/t3rw7xZVimpoAb30QByg==
X-Google-Smtp-Source: AGHT+IF/FozhO9qZ95zF/Im7xp4vonQs2+URIZ8u5K1tRqaZZL12OaAezyRemQnpRDUXRoKN1pKXxw==
X-Received: by 2002:a05:6a20:12c6:b0:1db:ef68:e505 with SMTP id adf61e73a8af0-1e88d10e95amr29265607637.20.1736695241213;
        Sun, 12 Jan 2025 07:20:41 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d406a980esm4412502b3a.180.2025.01.12.07.20.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jan 2025 07:20:40 -0800 (PST)
Message-ID: <42008fe4-8046-424c-9f12-e95a0471928d@roeck-us.net>
Date: Sun, 12 Jan 2025 07:20:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/1] watchdog: aspeed: Update bootstatus handling
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, patrick@stwcx.xyz,
 andrew@codeconstruct.com.au, wim@linux-watchdog.org, joel@jms.id.au,
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: Peter.Yin@quantatw.com, Patrick_NC_Lin@wiwynn.com, BMC-SW@aspeedtech.com,
 chnguyen@amperecomputing.com, aaron_lee@aspeedtech.com
References: <20250112081204.263216-1-chin-ting_kuo@aspeedtech.com>
 <20250112081204.263216-2-chin-ting_kuo@aspeedtech.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250112081204.263216-2-chin-ting_kuo@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_072042_391774_636016A8 
X-CRM114-Status: GOOD (  11.42  )
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

On 1/12/25 00:12, Chin-Ting Kuo wrote:
> The boot status in the watchdog device struct is updated during
> controller probe stage. Application layer can get the boot status
> through the command, cat /sys/class/watchdog/watchdogX/bootstatus.
> The bootstatus can be,
> WDIOF_CARDRESET => the system is reset by WDT SoC reset.
> Others          => other reset events, e.g., power on reset.
> 
> On ASPEED platform, the boot status is recorded in the SCU registers.
> - AST2400: Only a bit represents for any WDT reset.
> - AST2500/AST2600: The reset triggered by different WDT controllers
>                     can be distinguished by different SCU bits.
> 
> Besides, on AST2400 and AST2500, since alternating boot event is
> triggered by WDT SoC reset, it is classified as WDIOF_CARDRESET.
> 
> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


