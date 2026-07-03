Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31531C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 16:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dq50xUh9vnokWwn/2MgFrw6Bt3+wGtcUaeVmHV+z9uw=; b=yH3/0v3PeEwsPs4Xaip6Ec32bn
	Wh+cdXlSfTNMV0vjy/FPi4qA1JLyWNlQtvFdwA/nOg9ozaCI2l41YWMM6sCQB8goAtJm0O8TXqAmC
	A2xLUz1CrbG7uQcIr5ZUVT6pIyq31XGGFCemiO4iLCxvila2Uq6zw4+hYFHIl7rcF5LwT6jMA+A6d
	6Wnn63PfUq+InS55KNjNVo/bKl5t7dAU5GUts+dybgTuToefqE2Z/01rzWEGk9sb75qkTk/NaRjY6
	fC0CbK0zBuGH5+spYwoeASJEYmrmsOVS46n/+SebotW/MfDnnMACgKdWPM+hr8pTPClOTco+rB1VV
	1DVvevGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfgur-00000007Yti-42Kw;
	Fri, 03 Jul 2026 16:39:01 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfguo-00000007Ysx-2QYo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 16:39:00 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so6668465e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 09:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783096737; x=1783701537; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Dq50xUh9vnokWwn/2MgFrw6Bt3+wGtcUaeVmHV+z9uw=;
        b=hhl7JWS1pnmErZoewkJPCTVeMjCXDuMZB1c/MhIzLlf1wzhsj1lsvZzTfclzIsTsW9
         DxMA+HHmx/j0SB4hGY0Z1jh/5VQMlFlplgmed0rewhrv43EdleIgc/Q3ZfwJ11VGk9Nn
         dqSOpWDWierGXYXUwyQme+i50dWdXaYEER6AWDruwVvRZGB7h62rPkGwkOFx3VVMcuPG
         aRRzs5XMO9+mrF3ODPxtmD76PVjOhwGUvfInvI0wTZxKknpqeydxlOwJsouC5TPvJZHT
         tLIm6torFofqLdY7JZIq1Ig4HueJgPZTVu5YOhi/tp+77Ntlam+D/2nS/M4UvpOZ78Ww
         303Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783096737; x=1783701537;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dq50xUh9vnokWwn/2MgFrw6Bt3+wGtcUaeVmHV+z9uw=;
        b=b1zIl9DZ3KtSluU6IkbpQ+Pz7iPyejGT5jadYhNuzzBrN41XaLgoTkVKVdPHsY+wIQ
         4p8HI+3pdoK56QDc+nex0anWmzUrAXvEQCqBYUJv+rz8NC3JKdiDwo1iOajAg8fjXgbP
         It3CmZxoHPyKiT5K79ulsGgpQeqMSzc9W7rsvyBhZOIo1gsyT124eK/fahFRD9/oz9Wp
         Jd93TMCYMD2mOvOXrlF61xtGSrLQ1+AOeCV5VffGLFF2YzqWrAl+Ox9sBhu+3sEffZUT
         4JPCzKliHchu3JqMp5h4i1RwWb4XhQxMaFDgiVZo89UaHHYSvceRJmb/3HDO2kY7VBcj
         bnzQ==
X-Forwarded-Encrypted: i=1; AFNElJ/l6vfXHQxf7TapQo9Tf1ugKBvV+ayLtWJSB/VMBpddhbByHA38dKkZIIHWuRmPnXHBzME1OPe9K390WzmgF8PS@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy3qZVk+lOJOn10C8DmP5CKD8KYiAflU2bPVSwXCPjCyT+rC+8
	FuKZiMoh9w7UaQaECAg+FQc0aZAJQRbyNL0ZjNb9vtAX2YWmjcMN9/u9
X-Gm-Gg: AfdE7cnA3sEWmfSZBuXYeWG3o2wj97pKuT6MAfmDSSu0UFZfd1DxHTKzQ4JeYGyxtoC
	uWQlxGOT0GAQGeSRaA1zTjssLCg0sVO2wHlkIjYPq7KM1hZE4TqgTITnm0Sc/AGvNbdESLoFAtP
	qOjLoeC8FqNbbeCGSMMLIYtvZbs5/Ni2Iu0YPQkk/bu0MudUP3tAO5A1Z+YhsU2gVvXwKqAPQeo
	Ri3hXOcQs8OtfQ4ZcWvYpEj3kBK7E7NovDldZcwud9N6zs4L7TNbDoMneHrb+rtslhCYr69ItOa
	ubmKi5HyuziTsyj0Zb+VTYssUEDpS7b/cMAZFK4A9KmLWKBOu2+1PPbCpTvk1eZWrMz+jj0euUj
	D4//xGR9NbrictuIzV3jMa974D1vGbjc/bZ0Mwh9KmenVYe/TQmCfVS7vqHgLj2UvHjcVlzcgPg
	fYlWn6/QPb++40g5JjU6iu98WXR9gjtKIB7sDu6a0QU9on2RRlXR7KP55+F7D9YNgyP7rmKhjAe
	pz3S//A
X-Received: by 2002:a05:600c:8105:b0:493:aaa2:f034 with SMTP id 5b1f17b1804b1-493d11f6cfamr400035e9.26.1783096736053;
        Fri, 03 Jul 2026 09:38:56 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce040b4sm82259395e9.10.2026.07.03.09.38.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 09:38:55 -0700 (PDT)
Message-ID: <c4c658e5-9c67-4e19-aeab-39d98aa71f45@gmail.com>
Date: Fri, 3 Jul 2026 17:38:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] pwm: rp1: Add RP1 PWM controller driver
To: Andrea della Porta <andrea.porta@suse.com>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Naushir Patuck <naush@raspberrypi.com>,
 Stanimir Varbanov <svarbanov@suse.de>, mbrugger@suse.com
References: <cover.1780670224.git.andrea.porta@suse.com>
 <f8dd46a553351adaf9d29fbba9f98e803b672fe7.1780670224.git.andrea.porta@suse.com>
 <0b6a7f41-b753-48dc-b46e-77aaf0e999f4@gmail.com> <ai-dNlC1_nbQTy5Z@monoceros>
 <6babbdea-fa93-4cd7-8198-5cd3accc34cc@gmail.com>
 <akfNrGoa0bitVSu9@apocalypse>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <akfNrGoa0bitVSu9@apocalypse>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_093858_613823_E334D604 
X-CRM114-Status: UNSURE (   9.24  )
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

Hi Andrea,

On 7/3/26 15:56, Andrea della Porta wrote:
> Honestly I don't have a strong opinion on that, but documenting is basically
> the same than just selecting the option (well with the addition of the #), so
> not really a difference. If there's no major concern about that I also wouuld
> prefer to expicitly declare teh selecion of REGMAP_MMIO. 

My preference seems to be unpopular, so I've adjusted my reviews.

- Julian Braha

