Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75387CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 18:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0qSJXIx/Az+pQiYKBZLEErDNdCpixl/qOO1S4KvmcYg=; b=PyjrDc2m0E+UKZluC3wewjRYGv
	opzbcN4NZZHzybmU+i39i+0UtKcs/N8QXxHJL42M2OaqYyjQ+smBMBVQgiWJ1YFJG85YF1nC04szG
	UWbWMGGlZIOQstDbvP8nfpBUpho1jAq4lMkfuw3cJAo7AjMZ0AdMKOqu9DwMSTMMpjSBiWsZg6THv
	nMtZS6/J2B7YL1iVMl2AZ3mM3X9P26yCu2bqgyHuE4x5LXdTjnQbGzITJ+CAvr/F+JnbCm9GbJygT
	O6LbqQhHuqDZan1yh3GO7fYwCJJBeDAtTGehlKwekQCxAXNDWufqQOqmFL4TOC8WUpY83RdJlCeMc
	w0f+fIyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uptGv-00000005Br5-0UZc;
	Sat, 23 Aug 2025 18:47:25 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upqrc-00000004zsT-3ink
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 16:13:10 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-74381df8cf1so1004211a34.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 23 Aug 2025 09:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1755965587; x=1756570387; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0qSJXIx/Az+pQiYKBZLEErDNdCpixl/qOO1S4KvmcYg=;
        b=yFCNGe2TCDxDozOsPyAnCK1JOnt1a+1ZdjEDcFEmSR3XmyQPnzDugyz1tFYq2OAJPp
         kX82RiIrkD+gK7CeHDH4MvVEFNQpabIFHnUxPOgqn9oAYvEUe2hXXpuGO2TCDCTD02H+
         e6rcHXrGustsIhfX59DTMUYcHqqTq7y+wsyd9rg/Mx2njjmQ15XwXj46EafP/3uPG0iv
         Hf+++U507SC/NPZCAdRrEJHYx40ztJBhlgkXymn62F8/bbnnKHEsrhHI2C/wEkUTwg4T
         Yick/HVzsFgxGxGIehz5hFqJj5sKlMPTQH9ts8TUf3/YbpVzvFuA8oinprkmDv3M5Ue5
         ZmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755965587; x=1756570387;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0qSJXIx/Az+pQiYKBZLEErDNdCpixl/qOO1S4KvmcYg=;
        b=oUM0VfyqxdmZhzVJSR8H1gYZNkWDIdkr4+nENGZkat9oHNdHJb0+OdHe+qU8fN37yR
         sSgbDktuOlFbQ+EDKlpn9l+Fa9bMMGfiS6AwZKhVsV6DIMnkkfIyHDY7DRptvm8ZW1pR
         oyl89TNRT5NPd0Fpx3RN0exbGCtvYhnvNfKxg/wVKPvJZFJwbvxwIcN4OlcCD8gmiQFK
         cyoJJZ5EWoxP9oj1+UljaARmj5xseEMwUkEjMbwBwCtivn506wHFvn7KyOu+GLlMwUxD
         5qrCggC4QlK1c2TL+bm4PEjIQMBZWcLmzTlOaeyi0wNZFs1DkjqRzgesj7fOIMxVJc7/
         Imsw==
X-Forwarded-Encrypted: i=1; AJvYcCXRq3SgR6LeMoFy/TLuvXr6cDGhhrQJdd2/sr2fBvR/p4DxLVp6OEDfbNx723o8ebw3Yus8fC3LE2cw3C+wewy5@lists.infradead.org
X-Gm-Message-State: AOJu0YzSYCMa7ZP9PBfNEJYDdv90jfCMPgEVqGHfh+aaB+FW1O3I3fzq
	L8ujfxc3zlriaN3Hca8gS/vVGtYRftn/HfIdhDxyYGN9Y4lMPV/Gqn0yenE5mFOu9Yk=
X-Gm-Gg: ASbGnct4mRUYoaULmE97Lmq6/6zZEPt/mQvzcBxWrUfklGhGHmmx0kUB0U0yNxJAhaM
	OjinCrdn4ym1wL+qwCr97QWD0P+H8zPjal+6Y8SSESfuUUq/P9Fv746wqLuxBhAY96pdbTR6epc
	s+W5RB8QYHvHxHiDVKlbntve13x6IkjIuhvJde+x4ZSvBEu7gCEpLCFNI4QtLx6aGMrp3cC5ewS
	fd3rq//kdM3u87sGw4i812KM/Y7dSGVNGo8eFaZouTBQ1z2KlWYVN3SfDd5nczFb5lovH5RPJKL
	QTIulgczMC0KrAqTWu/NTW33LazDLudDg3l/1sw9fEPQDwAF+mk37eYsvwwpzWrxuwTB2DUcVkz
	s+O0kGHZ5oNFf4kYoS0NB4M56jzkZK86L4AUyjJV/cIMO/NuAZ3ljaYiFeLT19PbbIEYUMXho
X-Google-Smtp-Source: AGHT+IHi+cV4E+X1M0r2JR6jBROtlJPHA685XBWxXWqnrw1xyZGt7gGfo8sipwJMU4bNKZjw4ng8ZA==
X-Received: by 2002:a05:6830:f94:b0:744:f0db:a1a1 with SMTP id 46e09a7af769-74500a8b38fmr3364972a34.29.1755965587401;
        Sat, 23 Aug 2025 09:13:07 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:4d25:af10:67ec:53d? ([2600:8803:e7e4:1d00:4d25:af10:67ec:53d])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7450e26887csm663095a34.3.2025.08.23.09.13.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Aug 2025 09:13:07 -0700 (PDT)
Message-ID: <e61c2e01-cd8d-4193-afcf-5ddaef34300e@baylibre.com>
Date: Sat, 23 Aug 2025 11:13:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] MAINTAINERS: Update xilinx-ams driver maintainers
To: Salih Erim <salih.erim@amd.com>, conall.ogriofa@amd.com, jic23@kernel.org
Cc: nuno.sa@analog.com, andy@kernel.org, michal.simek@amd.com,
 krzk@kernel.org, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250820100519.2272509-1-salih.erim@amd.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250820100519.2272509-1-salih.erim@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_091308_927424_C233665F 
X-CRM114-Status: UNSURE (   8.42  )
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

On 8/20/25 5:05 AM, Salih Erim wrote:
> Anand left AMD/Xilinx some time ago. Salih and Connall are new
> maintainers of xilinx-ams driver.
> 
> Signed-off-by: Salih Erim <salih.erim@amd.com>

Looks like you forgot to pick up all of the trailers from v1.

Also, there should be a changelog of what changed from v1 to
v2. Just rewording the commit message, I assume.



