Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 768FFC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 19:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3UVahQe1UPF0K+iokLjZpppnJFILmRHV+SLcIZYIH48=; b=P/EIlV5+u6O/bh9Qks+VwyW+gZ
	qR2Y3QjQ8KqQBuQerEWu2MQBOzmZWFUFWzGoOT2vXKtzGrc35V9BCANkA1VwsQezyEmmVOOvNgIR9
	kAd4nHkZO4JK442TEnyik86O/XwLDO0xBVxFysEj90iVSE8L6nMQ3BMWv+aAfEZIqp3t+PX+W/lVr
	WGJOgXA1Xsdg1brL1pgcwcTZNBA5sRp0pDlrEJC0pTCEzYmXMNsp144eG29cbPVAGt9/yLOWDqmhh
	lr9OUY9uiQNawuE5A0f7RcFolmTLF5KVGoAgrOHF8ABxnNFkn21yt/U3vS0QhCR/hcTSydn2uONtE
	zuG1b/qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEvU2-0000000DORz-1gKP;
	Tue, 13 May 2025 19:40:10 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEvFN-0000000DMbn-2YxF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 19:25:02 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5fcac09313cso7388169a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 12:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747164300; x=1747769100; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3UVahQe1UPF0K+iokLjZpppnJFILmRHV+SLcIZYIH48=;
        b=V0oXCQS9RGrNWouxwzGgr5Hs+660+AwWwBfo8wjEPFo0/oCK5A9GM6omwRXeaD8wEZ
         4cwhC8JpNryABzRF4VvqervpH7AUiYIshf8C+lmv5DDB3CE5lpVEonYTCSIUq12MErSr
         aUBzfW2Luev/Uk3f+WmoZ+iWolcrbByTmhtGFlDhidfE5JqsWLYj2xxuk5SYOCyGXlX3
         afUe8BlOTVjz9ZLSFpoFRG0YzDxGcLietHzMKmr/2Qh7LXEVosdWdxHOfT3JO4ciR+Sb
         C/H5jc6cvAxQoiR3zLtIRzFBhtrzifGLV572XoE0M31V730M8/BImMom6XjkYfd7I4H9
         GD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747164300; x=1747769100;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3UVahQe1UPF0K+iokLjZpppnJFILmRHV+SLcIZYIH48=;
        b=vaWz+dpwxGArf6O8rnT1RZPjObCcv7G3KdywTL/nQ8oYgAlq26WGM+Vg4pMgEtukQS
         IuzjACPb87CXUFOG14mZPj3Rv807Wk9GKI+BFSjQ8+3UqIlVUOh7xXKR8GUaZz3jzrJV
         5gWYTbueGKepM/nUVKbt4SCNm2fERiXKXz9O74YXMJXOIzi7K1z7rT5TLi87MIgl9Qur
         r1dWuMM6EIyJWUir1tL6867rN1ywMcggd3l6k8n9GW3Dh9vf32AsAP8tS0P2mJ7f7eZi
         DFEhaOxhrfR4USV0X7NSz7K36oxZURXmR27oM9DnJ5jBduUvjykqIDg4dDUS8cIMOUzG
         UV4g==
X-Forwarded-Encrypted: i=1; AJvYcCVL/9/VWkWhdKnNYJqIuBYl05F+o/LNZdEQHLEtycTNeEIG3Va2EYfe1gf7IbjnlGmd5JvDkE1x77yxlN5vg0Jv@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+ZlqR2iiREwrK5CgLn5r6C2yEgMXiu5x0/Y+iO6qWVEqH+tLx
	/CKzlcSqO6CT/usaM3xie7YU/WWHzQ26M2rfByBbC0UXJsexenz9
X-Gm-Gg: ASbGncvLp7nrewKS+t8CwttmpXg3sPJFbcKvSbYnLW274SDT/Mww4uwLFaIxhftQoAW
	WLGI/Fq6AhckWcQgBwAOqkmie/ied/6xurfkLH+53Ltq3EtWBfLsvMo5KjXDufOFO/hqYKNqnZ4
	95BV0nOZHgUGWPSmRsQR8xiAsuUUdSiwsdSyFoZWgMl8RqguS6HS1lodGPIGHKk7ziSzIcQ2ldV
	gBxS2qGkfVo+gkTYsnMQkm8ItLOWg8Pxwj0eMHzQhTa5yaCrJMtc5PGS8lpw8hd14vkoobozN+/
	aftu0xJPRDxujOION+Hyq6lIk/WGiN4KEAVYURLtfQ0cPhawyl6R1nU/PrThApOBFI5RE4FnHzi
	BcN2wy1ptNAkYnWig
X-Google-Smtp-Source: AGHT+IHlro9nmnM+A5vp7iF7ncinqOHIXxdhKiKiQNf42yzLvVSInDJfUeta/CfNghr1tiC9h00HEw==
X-Received: by 2002:a17:906:6a27:b0:ad3:f3dc:e363 with SMTP id a640c23a62f3a-ad4f749f195mr77941966b.49.1747164299542;
        Tue, 13 May 2025 12:24:59 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad21f2145d6sm785086966b.95.2025.05.13.12.24.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 12:24:59 -0700 (PDT)
Message-ID: <73bc3569-93d7-437a-9d40-0137a096f7cc@gmail.com>
Date: Tue, 13 May 2025 21:24:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] pinctrl: armada-37xx: a couple of small fixes
Content-Language: hu
To: Andrew Lunn <andrew@lunn.ch>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>
References: <20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com>
 <60ef3803-4f8b-4d9b-bef8-6cf3708af057@lunn.ch>
 <CACRpkdbqPLaBheEv1=ky1gUJ-qSsPRjR0J-UXEuhXf2Oix_EzQ@mail.gmail.com>
 <aefa5ed3-1085-4e88-b3ec-4cf9958e7e2a@gmail.com>
 <f638f5ca-a479-4ab2-a8ae-6300bbe0cb08@lunn.ch>
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <f638f5ca-a479-4ab2-a8ae-6300bbe0cb08@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_122501_654135_E3423437 
X-CRM114-Status: GOOD (  13.78  )
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

2025. 05. 13. 20:46 keltezéssel, Andrew Lunn írta:
> On Tue, May 13, 2025 at 06:51:35PM +0200, Gabor Juhos wrote:
>> 2025. 05. 13. 15:36 keltezéssel, Linus Walleij írta:
>>> On Mon, May 12, 2025 at 11:33 PM Andrew Lunn <andrew@lunn.ch> wrote:
>>>> On Mon, May 12, 2025 at 04:22:36PM +0200, Gabor Juhos wrote:
>>>>> The series contains several small patches to fix various
>>>>> issues in the pinctrl driver for Armada 3700.
>>>>
>>>> I'm not sure all these should be for stable. Some are clear bugs, but
>>>> not propagating the errors has not bothered anybody so far, a
>>>> requirement for stable.
>>>
>>> So we are at -rc6 so I'm not sending these as fixes to Torvalds
>>> right now unless they are super-critical.
>>>
>>> I will merge this for v6.16 (-rc1) and then the stable maintainers
>>> will have to decide from the point it enters mainline.
>>>
>>> Gabor: can you look over the tags? Once you have decided
>>> on stable/non-stable tags I will merge the series.
>>
>> Sure, I will send a v2. Just a question, shall I also remove the 'Fixes' tags
>> along with the 'stable' ones? If I keep those, they might land up in stable
>> trees anyway.
> 
> For the return values patches, i would drop the Fixes. It is just
> really continuing development work for the driver.

Ok, thanks!

-Gabor

