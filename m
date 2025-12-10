Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6710D2CE17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 08:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YFHDKd0HM/iJsOq9TaASKiK6U24DRcKk9Xsvn3+D8sY=; b=SnCYy+1JCIciATN6GCD92YSi7R
	R2t8Dx5wx00Pcl5JXtZSCfSuQbTiJQHUCa7ADkd66tNWqKx7Fnt4G9uzCgk2IoCSY5IkDFyTOU4ZA
	KsReQzZIVxHiGR+QWtb++89bhXiEOXxKecl2n9XvIQCskea1eHHu4KuJxtKUQnS26QOgm9ZwA0FuX
	vAznC488x8uJ0Y2grY2bxhV7epVQ4jolkos4RZM/IAasz4tGnhjnaXDA2D3dBxrHq8exH+q7GukAI
	cFVb5NxuplQ/3e3H3qJ2KgyyG70/mOWSeunOYVoyw/GSIRovcL6Ajq9LJLU1mqp9ll7GhL9QnJANl
	RyzA5FEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTFC1-0000000FE6U-3ORK;
	Wed, 10 Dec 2025 08:05:01 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTFBz-0000000FE5P-1K3M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 08:05:00 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-47790b080e4so38244615e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Dec 2025 00:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1765353897; x=1765958697; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YFHDKd0HM/iJsOq9TaASKiK6U24DRcKk9Xsvn3+D8sY=;
        b=eCzftfz7CP7Bxa/VVWz32Ay/GHdtTdrLwahzZC6zvmg2MQz05BPV+It476MVlEV8DK
         NrIaelsFGyfbZtGX3GwsJTRO7j1L+1fNJVjo4a5VyOMeWMCeL015MavV7RK3zoMyHaRh
         6AuNBayq2zY2RStbe025GG/+4oLrypCHWh5AUhBBj/KA6zsLq2mJvw5KCto4C02OStsN
         dXSbuZOoefev1zuAbOYbpq3ufaqwEt2Otu6SntlB5iR0cUYwQ7JvO8kmGVURbUKspUGr
         VFfRbbxNI6ysXHjvuwTl5vxlQ2DgGm1ZUtefksouxnPqKRe3+R4Vir4voy5H0ZEezuWZ
         02pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765353897; x=1765958697;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YFHDKd0HM/iJsOq9TaASKiK6U24DRcKk9Xsvn3+D8sY=;
        b=d+OwbbbqXuED7XQgY6REbKKXb8Tg+xfiFk8WdZ1iD+o5wFXxx3h7y6tl2bqW2VTLdt
         +ZYQRfm88wpy1Q8xyM3PmSmUBvFWuudsBRuLgUbbMSOqP4iKd8vDZ2953DneT4x2h98m
         W3G/eO4krs5JeyTVKTblONUMG9ZY3fKBtTLeFpuWb++YjAhM/yRDRCk38MFNd/8ymb7T
         noeRegRFxEbS3Fo7BfoYCw9QHJIPUxGtUxcevcz2RvALzPSnR4XpG9ZUJS7Mt7FOapVA
         8IN5ba4wlh9cc7wXAbImBMQZ2i6nScLqULyeXU3DoQvslKLH5EOI79lv4pUAvpvTA1qJ
         16iw==
X-Forwarded-Encrypted: i=1; AJvYcCWSy28gMjWMfjdstVsyt3pI6jaQlUfD7LbKm8CzN4jlLUGrhFvAMXrmqxT7PkJo+gTTQW5x/1AfxY2VWcUv7NU6@lists.infradead.org
X-Gm-Message-State: AOJu0YzSJ+0sSc7ByTM6wgxpjigwFUZj2odjmWRJvLUSF1598QatbqlB
	e/JxzZwFmynxusY2Wc3RJMZWGOoWY1O99h/iLoXDM6SnOSwQZ5pz/qHak1dCoktR47k=
X-Gm-Gg: ASbGncu/U1sDZa7+dH6oaO0h1CiufM5fX+16eItOQNLsCNKymwpvieRcCSEnDSl/ijh
	qLkf7WWFRPNd8Q6EqlV6pic57mLrhKrhqnc3CvuTvD+4pKZ6YkhO6dyIL2cHmjlLg4cuf+EgXRw
	1S9pIv7sWEDrMbbaPOC4aKOPwncRrpJ5/u+9ZHe57S8O7lPiuIm3hPxkmvgwTr1t3ALxL0N5Gek
	1E0Y0eJMuFOVK4Dsh63AAMpmI+zWrbYxqbMcEuQw9EH1CdXjSoDez5wndNsZfg/0wb5ModIn01J
	oEetUW6fL+NRFcKqpmP7hTjTimvTiJuQcjY37xhWgPUOBCRlnaQ62lz4bzfJ1gcJE/jSrNc+Yrg
	8FQ+9V5hSWq4Vj/H8YdjtbhYBevhX0skFs0u+ycS7rUmkvAXSD3d6pmNDdKUcfJzL0T87734Zk8
	gTw1D06JCx6N6kmJUjpTM=
X-Google-Smtp-Source: AGHT+IG44FLRAV9hhxbf3e2YxvFnrsD5CGeuIWWtUvknWdmCldfS/CTLbg3wvfoWbwbiqRYz4gOong==
X-Received: by 2002:a05:600c:3113:b0:477:7768:8da4 with SMTP id 5b1f17b1804b1-47a856249c2mr3409615e9.7.1765353897203;
        Wed, 10 Dec 2025 00:04:57 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a82d26f5asm29873605e9.5.2025.12.10.00.04.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Dec 2025 00:04:56 -0800 (PST)
Message-ID: <985eb494-7bf3-4da6-9a54-aac3ba559cca@tuxon.dev>
Date: Wed, 10 Dec 2025 10:04:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ARM: at91: Move PM init functions to .init_late
 hook
To: Rob Herring <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Russell King <linux@armlinux.org.uk>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251120-at91-probe-v2-0-8c8592f02e8e@kernel.org>
 <20251120-at91-probe-v2-2-8c8592f02e8e@kernel.org>
 <ece2d53c-3e16-4e5e-9bb9-3ed7bb362b7b@tuxon.dev>
 <CAL_JsqJ2ghfNKQPhs19F1oxJxyTsrQ47hgPwsa3hUmgbGjpi-A@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAL_JsqJ2ghfNKQPhs19F1oxJxyTsrQ47hgPwsa3hUmgbGjpi-A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_000459_530595_6A24DA6A 
X-CRM114-Status: UNSURE (   9.20  )
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

Hi, Rob,

On 12/10/25 00:39, Rob Herring wrote:
> On Sat, Nov 22, 2025 at 9:37 AM Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
>>
>> Hi, Rob,
>>
>> On 11/20/25 23:37, Rob Herring wrote:
>>> Move the AT91 PM init functions to .init_late hook to ensure driver
>>> dependencies have probed.
>>>
>>> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
>>> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>>
>> 'From: Rob Herring <robh@kernel.org>' != 'Signed-off-by: Rob Herring (Arm)
>> <robh@kernel.org>
> 
> Before I respin, any feedback on whether this series actually works or not?

I've tested it on SAMA7G5-EK and SAM9X60-EK boards and it works.

Thank you,
Claudiu

