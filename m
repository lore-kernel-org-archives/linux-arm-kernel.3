Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DF6C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 14:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2bgojeFeUpvXitpM/OgDxaX8mLFSNcZ2WBsJ3E6rjeI=; b=f6HHIDNV26+PUrmO6zVDqCgly+
	lA7m3xIoTNR+edarRBwxQpqvKIJUfodwv9ZK/kiOmgE+oKa/GVkecy8vueYIjVwbl2zpWJyrv/qNb
	VepcVAX4Woe2TiU5v7EaAj+DWnJs57Ci+6N8zRRHVZFOivH3Y7zxeR9zNCrFbpFR/sVmlxBEWIDjA
	EYw49i45PULPdOXiFNzzIrhGzKVDAiiikTRauTqPPNe5RYJuIpD0EA5siPqnwLQbXYfTzByQYFV/1
	Y/KilVLRuIup4RUCR/R0Qhkkp5T1oWAei4ChdEDquQmH9CSBNjUHYrYZ4qi+vLU4jmSXoQllx+U9K
	n5J+wVIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4J2j-0000000Buv3-3Wv8;
	Wed, 09 Sep 2026 14:12:53 +0000
Received: from mail-pl1-f179.google.com ([209.85.214.179])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4J2h-0000000BuuK-1u6T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 14:12:52 +0000
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ceab75934dso56973095ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 07:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788963170; x=1789567970; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2bgojeFeUpvXitpM/OgDxaX8mLFSNcZ2WBsJ3E6rjeI=;
        b=Zhd0NtTEy2nu0KF1rnYApillxwEjENRykXx7iRwiCqWCcEEbKcWJUfZZgQpSX9BG/U
         yYn32hEkaZ9zitlIRtw9XyBgC59y8CDwoyGaXIwAscfRLGmjOYnNEmhUmPY8IdZNZymc
         0980YXx5f7odTiWRPuXAVwma8EZA/UJj1I/cTPK9vreA+5GanKXURtJlbtdbk9lrMcMX
         MMeLQOyJsEVj6QV0ysGlwl3M8K0lx8fGssnGju0hZ4GmikTC29t8zaSbSy7ug8YzIgVF
         ei7xi4QHk15zktEIz6orjkk130GTzVZ35Ka0l3d/atirxDze/KfWmZ86Lc1mDHTnrfEp
         YkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963170; x=1789567970;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2bgojeFeUpvXitpM/OgDxaX8mLFSNcZ2WBsJ3E6rjeI=;
        b=JyaPKIuJrxsdnyV8uQ5aZX4Yy0f24Qlv59P0KkHWwCU2TPaGe4xaOQtz5JnoCH85/Z
         gLDKHMolanL5W+naFujLQ4tLK6HUD63JoXktBcDD9rES6FvIWOkojnt6Tx5mGWSMTw40
         hbC/lOR7IRlE9JVVXDh1wqDBlLWC8IyLcS/bWrglK1itq2FHlDxXLLhcAdCGVrBNGPmR
         yRvQJZL72QaeHoGYIwSz5jAJomXbIut8coIrBAbPvfsWngxI8WDXPFDXJKLjdpLcc9EK
         1Wk7oQcmK+TWMyoIBtfD2pvX50BfychHMUPNVstNmTSjTGZDZRaRM97/Mmcu8IdX2HdH
         zlOg==
X-Forwarded-Encrypted: i=1; AKwUvBz4Ld1r6IrqWMfGAFgvaKIc5tNBUuQeYvSMMelgJda/GBp54lFkF7MAzBwRlOB53CJNMsDHic6KPXFROhliX+3m@lists.infradead.org
X-Gm-Message-State: AFuF++laYS0ErAJlMsvyrXJQX89TIeK310mPaj/Rle+VU1x6cQhuBsdO
	19nuZtael+6Dd08HsURTZEujsevYXSuscm2mCWuxcYvf0PYVO9ug3BW8
X-Gm-Gg: AYBFou3ePKgwPWGmAhVr9iROEjQYIGT7jqjDU6nTHPBW+y3W8QaEk8VlW82mnDDzlQ0
	/emrty0teviepybPIXPrrkMnaUMz/K+muLcPxoZMe/u5eDZLof28UjhU2SJnYrCdAbHEeYYLuLf
	ezoBGWctAAABTryRKGulga/0FrDSoTiGU2JbyY47F/xi5VOLRbEca7rEovOxN1mIarV9Je1I2gJ
	TcPv19bkMUAUCjxpaXobHvnxB/oBaCLmcgsYslLkqcLqTJT9B3Kv5SslbDXCeprZhV9EM0zKOBi
	Qg945pXmhjxArpeh8E+NfN81K9Zt+mFR/NNQvF3c3CKbIhdCexbEPJNfAxGqK5D0q56nUkUF8SZ
	XrsLdK46+jtLfui2UAH+XdmRZpmpNm6ghWoI3zZVrSnfEA9L+g5p73RlUZq+hYTyr1yR5+uyQb4
	YsgpgBpekVqoVJz6fZXcX1gIFqT7dTpN9YBf41poHMMOKWqWPuQrHfV+ObRe/DQi55iMJHlYSXH
	snqHErQYDKa993xBdQk/TYIDwIB4ja1NECSdsg5LD3USUSb
X-Received: by 2002:a17:902:8203:b0:2d8:d4d0:792c with SMTP id d9443c01a7336-2db1287779cmr388670795ad.16.1788963170238;
        Wed, 09 Sep 2026 07:12:50 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae7637sm74597655ad.79.2026.09.09.07.12.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 07:12:49 -0700 (PDT)
Message-ID: <43a1bbe0-0012-44b1-ab0d-0dea1136869a@roeck-us.net>
Date: Wed, 9 Sep 2026 07:12:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/14] mfd: remove unused wm8350 driver
To: Arnd Bergmann <arnd@kernel.org>, Lee Jones <lee@kernel.org>,
 mfd@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>, linux-hwmon@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <20260909132153.1596191-1-arnd@kernel.org>
 <20260909132153.1596191-12-arnd@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260909132153.1596191-12-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_071251_498848_63D2AA76 
X-CRM114-Status: GOOD (  14.06  )
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

On 9/9/26 06:21, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This driver was used on the i.MX31 ADS reference board from Freescale
> and the smdk6410 reference board from Samsung. Both used platform_data
> based driver probing and are now gone from the kernel.
> 
> Since probing with devicetree has never been supported by wm8350,
> it is clear that nothing can use the driver on an upstream kernel,
> and it is unlikely that anyone is still interested in a devicetree
> conversion, so remove it.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Guenter Roeck <linux@roeck-us.net>


