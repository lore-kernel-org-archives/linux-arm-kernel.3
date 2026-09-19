Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781F9C982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 13:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uq+PPxMiRAqhAbb6KLB+BVIaIHgARkrWQhfVObJDBT4=; b=FEnQDUVCPYBreCGMAMTAFDrlb5
	FgAc10v+p02x01aG4ut7Z9C0n3nu0QFKNLgBGnUp5ZPaLFNMxqVZB2WW6x8d7ge3PQCkqOiUWDeuS
	WibXeGiHLnvSKJcjr+mjeVePki+eBLEqchw0nl2YMZsp0bKJVG/5TCslzVHZLCKduMT0ZLUK09Q6p
	InZhC6+hBWLGEES4r5HycogiC2xsyO4AHLtvYAdWgNrkaA9CHYbEgBh169QkQAmuPpzr5s19ho0y8
	jp56irAn35ZNGgRlNsa6jS3lf8ukkC6pADdrr7E8oeIcaLY9s/rVuaw85aHp4D+W+FyWJtxUwiX1O
	9vlDmLyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7v4o-0000000GJdZ-1YhQ;
	Sat, 19 Sep 2026 13:25:58 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7v4l-0000000GJdC-3ZaG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 13:25:56 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-48449f62b93so536028f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 06:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1789824354; x=1790429154; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uq+PPxMiRAqhAbb6KLB+BVIaIHgARkrWQhfVObJDBT4=;
        b=L71sxupxap2mWg0P6T7vkdkK3GMGAMxgJ9mblgmxXagetxkm9Y7q/DSm/ijfQmvth6
         kIFduEUn8hh/b7JGnuzU8CqCHvtXYmramIEf3r8407X0DpfOaQY3/p0lZX+5jYY3IEpT
         R4JdCQWZRsuC/wlyr4+xItekEZmHNCMX1GuJS30Bi+r2QppRkg+FP5nORdw+inXYA1Bn
         3ojJ4+eEkT1jmiFx9NNaKEKSczjXU9pIytimAEFlVuXY862Rd4XtynmWyXnHWSlFZ6IT
         g3i8cHsDA31UsqRQD8/h3B/a4I/c35sGTZ+ZQAvmqLs+eFDgDfdMwqwUyFpvLG1zRsbN
         esug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789824354; x=1790429154;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uq+PPxMiRAqhAbb6KLB+BVIaIHgARkrWQhfVObJDBT4=;
        b=WRuElvGOFFoljoysTpoIHdy9eLmH85V4NNzA+kHykoRmMmiszyv3L2DRcF+BtO9/OS
         HWWVEwFAFab0Hmq6Kqq7lBGMsxMu22yYEo5Tt5y++It0YHGxZ+xKppFs1/9drxveAWdx
         S+tGenbPnvV5fV4HQ/ftH7FkNf8Jv28I54JaGgZbNlGr+LW7z/r/UkB3Yl7P3U/NamF5
         K9nBc2tvm8tBT2DGb0TEY6hp3tgFaisjEU6CEW5HxLXsUb7trya0JnuWXYe5MjiBUGwG
         qDYN6AUwM0/sRKmLMUMgtNpA/ueJ/1CvFwMsrqg9OQ9+AEdEbfcqdzeHxM2nVRqosO32
         fMwg==
X-Forwarded-Encrypted: i=1; AKwUvBwv3UxYqwmhUlUB7Zp5oG9K1Mar9tuC0vXfXHZV3XeKOlyct2OkLKaU4/hwqgzvsc0fxsHdhNxUJpWDIN6ewjWh@lists.infradead.org
X-Gm-Message-State: AFuF++nICk6PpZeDfOWYGWlB7WOrBIn97TEHQFMTjfpnU1IasJZSj6zj
	WmplOlxwx4gB+HftaSjRgOpn4nP0PUim0fFLVQ131b95FipTzhUIIXsl0xlUs8CnlM4=
X-Gm-Gg: AYBFou1d+jt3ubriReuuqe0XaG0XtxladjKLfQ3/CE4N2k36gCY+kysIxVwvwOp+X3S
	aZ5QCCJgNegv/uqRyJY9geH8Ate4E1bwrhrr66Sm17Fg7Y/5Gp4beAUYwtB3JTMM2Y9kUcU9VxC
	7iIP2n86e6iCscc/DC3uVGFdI845rMGy8ynEowbMH2ZeYD4f8pkNFVK0EjH5LuWrVkD7UwTLolh
	+6J6IUgyKk9d1QNnQMrjUZODyrpii7iZF49eO+ABPOdSvu/vBmib4IKRAoG9XV/14/W/rGymlLd
	LOoo02LXpxQ0GW5gwxfGfjoNCTeM979t9WEsOhbIpI+AI1Gsqqx1kNGyNomo9d5nlQ9elEhUhRc
	YIhl/Qy3RMnaUtFJNIF6JjmBl5A0/CmNgev7DioB2/WMTvZhsw0en8PWZjyDmmG2Ninuo7IjriA
	svT+oZ9wQlJNOWbEURRWp5AQPFB/OTIyPuHjgNjhjH1h1UuV0bxDsuQUXo3nMxeQ93FbBs+sJ1i
	ac8Um6+6PUfW1lDRInGyyELTMVYjBwkptCZIMjA5ewvZrilmlmMHPHH
X-Received: by 2002:a05:6000:41cb:b0:486:fed6:d7e with SMTP id ffacd0b85a97d-4871db11bbfmr9104336f8f.22.1789824354231;
        Sat, 19 Sep 2026 06:25:54 -0700 (PDT)
Received: from ?IPV6:2a02:2f05:1204:e000:2cf7:c250:64a9:ae77? ([2a02:2f05:1204:e000:2cf7:c250:64a9:ae77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724460898sm6712256f8f.9.2026.09.19.06.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 06:25:53 -0700 (PDT)
Message-ID: <e854d8f8-a010-430d-bd29-03726fa6faad@tuxon.dev>
Date: Sat, 19 Sep 2026 16:25:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/17] ARM: dts: microchip: sama7d65: Add ADC node
To: Varshini Rajendran <varshini.rajendran@microchip.com>,
 ehristev@kernel.org, jic23@kernel.org, dlechner@baylibre.com,
 nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, srini@kernel.org, marcelo.schmitt@analog.com,
 radu.sabau@analog.com, joshua.crofts1@gmail.com, jorge.marques@analog.com,
 Jonathan.Santos@analog.com, jishnu.prakash@oss.qualcomm.com,
 antoniu.miclaus@analog.com, duje@dujemihanovic.xyz,
 mazziesaccount@gmail.com, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260806074024.531259-1-varshini.rajendran@microchip.com>
 <20260806074024.531259-13-varshini.rajendran@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260806074024.531259-13-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_062555_898378_1FA66543 
X-CRM114-Status: UNSURE (   7.90  )
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



On 8/6/26 10:40, Varshini Rajendran wrote:
> Add node for the ADC controller in sama7d65 SoC. Add the vddout25 fixed
> regulator node which provides the 2.5V reference voltage for the ADC.
> 
> Signed-off-by: Varshini Rajendran<varshini.rajendran@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

