Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A3CC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 16:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y/MdAZR4KCk5kccToHKoimBc3Y45j9tz7BCn6zhsjAk=; b=0+V2PTSsaHh9BADxqtcME0gYB5
	I0dJBdqOP4P1hhkXzuQ3EM0sJSq4keZTJELaa2UQzOqMFoLhUL7S5ERk074oeEukb7joEEArwb0fN
	7SB2OLD8RZd5prdn4WXi9DjO2BN/Aa8Q1/cmZI5CbZFw77gxTRBhSPUGLKKbBxhxRwlciyVYKQOS6
	/L6SHJd732QjD4iaehhQay0E1Su7dmJdQSpWww4vJPPIcBXlyQONX3lDeJ5Hpsrc8gVyocekFfFWM
	VhCiQrdSTifumtpp61fMX0OoDc30Q+aXU6O5WdpoynA4N4yWdHS3utk+iz3/jRhZw2TwbhimT8006
	/vRSV97w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2uVR-0000000B8i3-1iuz;
	Thu, 10 Apr 2025 16:11:57 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2tg1-0000000AzLN-3oRk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 15:18:52 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-72c172f1de1so587405a34.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 08:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744298329; x=1744903129; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y/MdAZR4KCk5kccToHKoimBc3Y45j9tz7BCn6zhsjAk=;
        b=KmCIMMOtkFPhxU96+oK17WzHjQgyXKOyT3kuCHQ1TcXYL2c2wLoMGTckRt3/c4gNA9
         PLLbzhsn48HuTJSsb/1/hW+1ksGkxo+L4+uaFtMIqCUqoqf0gm8hUCP6u5GBXQhknPRB
         bIsUo/Zt9mkkBQgQb+LPlRv32MFDf2w3U6jCnmbDz334MLUoeJE1FLDUZLv4z5oGO/hr
         OO48133s0Ws6PNea36sYoEOt3SezEqlJhVkE6m3bNEMEUW71kx19o8QMlY8+lcdL14re
         9QusS+ikFZgW40sA3jdSAXmMi9zf3X2ICJGGFvCP4JWG/iH5teQLPWaVqzP19MpdX0CK
         lJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744298329; x=1744903129;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y/MdAZR4KCk5kccToHKoimBc3Y45j9tz7BCn6zhsjAk=;
        b=fd/m2l1FmlutCCJmvxnAB6di/KEhDyglARpmYM+0R2HTrvmZoNVsjcMaqcnj6vSfMh
         hyvc3VJtkXbjUYbM5GP80pmwgI15lY+uBPJx6ZgFoG05oy2I1iqLmSrwazHPOChBjkHi
         //tBoSxirDRQKFxhn3iuuMBXCj1waZ7sORKweRbpL4Uev2zbc4duijw/0y//rTgdpEpI
         eH9hIpe+IppVOpMLGEhclitIuHQXDR1BxrUwX/zfbBl5Ll0mPVaPuAe5j47Zw/UddlFy
         bk7U1RtovQ2pMbOg6qjzLgvLkIKss6BjRARKRIvVE+xqjwjzJDklWJ51/I7Zk2pL1CP1
         eMEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIeR+ALPhXUrmo62EB3Gwe/guGaPoX3YOdOreX/vyehLb3p8E88dxwhq5PZA7zE/hgh7s7VoQ0X0rSrpM8+3j5@lists.infradead.org
X-Gm-Message-State: AOJu0YxsTXu7R3dTccm24rYLOeQxSkfXfkS3bG9Wvx876vd0D2iX/NCL
	IXPnF9Wth0ML7iLqz5kETea14hNE5ldBsPZbHZxTKVr+hyjROhJ+NHi5wvo8XMU=
X-Gm-Gg: ASbGncts+0L+pBtBUMhAxStMAdtLb+mt6ioW2fGtsHoXepcV2DCS6tIeNrlNYKXWKyy
	tp3/nk0js0aWEqbJu8fQ7FOTH2uttIZCeGuspnQRs3uGkh4TiPyWyfdNPX7rWXJeIOHIBmm8jcN
	PAFQFWW/C45d7vhSoZ4gkToahoQ6vA79d7bKvsfsWS3NlzdSuoC6zb6ldasAn9nIAPorhDP6DDj
	KDXU9+e7iVyyJLF6uhY34lqcnFW1aYOJvYwTrBC52wiIo7GtP6owJfE7QFQWCfhiB8JcSzIoBZM
	bU16cxL4B1iLBhIxPZBlHmdxXxAwpUjup22w6VasQLDgKwrT+UUJKyE/uT8LNhqW8G1dfZqdDpl
	tiA==
X-Google-Smtp-Source: AGHT+IH6rrDtVsseh9Xvuyf/noenwuLMx9zjDSedC+XBqH+zbZ7Nwdp30096w8lLRgkzXs6H3TqsGA==
X-Received: by 2002:a05:6830:3506:b0:72a:1494:481e with SMTP id 46e09a7af769-72e7cb8d73amr1644611a34.0.1744298328766;
        Thu, 10 Apr 2025 08:18:48 -0700 (PDT)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72e73d52b7asm604325a34.13.2025.04.10.08.18.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 08:18:48 -0700 (PDT)
Message-ID: <3295202e-3f4b-457d-907a-9058a9719f83@baylibre.com>
Date: Thu, 10 Apr 2025 10:18:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: davinci: remove support for da830
To: Bartosz Golaszewski <brgl@bgdev.pl>, Russell King <linux@armlinux.org.uk>
Cc: Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250407-davinci-remove-da830-v1-1-39f803dd5a14@linaro.org>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250407-davinci-remove-da830-v1-1-39f803dd5a14@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_081850_222921_C3AA087A 
X-CRM114-Status: UNSURE (   9.67  )
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

On 4/7/25 2:50 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> We no longer support any boards with the da830 SoC in mainline linux.
> Let's remove all bits and pieces related to it.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
Reviewed-by: David Lechner <dlechner@baylibre.com>


