Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F18EC982FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 20:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iU7NnvOJ9a9r9qIwFHpAEXlxad5Cnya/UDxG8mCUJcE=; b=AywEMvgbDvK39tffnO/zA/tNkR
	NuZpOChlgvVaNJfq3CGEVBH02aT6d6XOwYSTGCupp/E/egJp+PBolgDwnU0AGVtz8MA3UZ+ZFZRW1
	Yy5avtZvILH8R96Le20gmSOQOSNmg85DZsKTfQV0fqLocH2mcXvJ61qykc+nGDqZIisJ+5OJulS+J
	o/wMsIcOyz/hgrLK9KMwC7WVCwam8CzZf7Qs7nqYG/JdNYwVMLE2z4Xni8rpxoK4Yb8ouxBzFGRjQ
	LrkJe36r9qObQflvxRmdP/nHycMH7DApaLERRNWE6WyQYD8ciLfGsixEUTyKrDLWsuKMl/QtqXbz1
	l95kuZqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgqGD-0000000EnJr-0EiT;
	Fri, 16 Jan 2026 20:17:33 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgqGA-0000000EnJV-3sQU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 20:17:32 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-29f30233d8aso16920455ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 12:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1768594650; x=1769199450; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iU7NnvOJ9a9r9qIwFHpAEXlxad5Cnya/UDxG8mCUJcE=;
        b=gj5OMosR3LDV0RTSBV5RvIsxvg7XzgC+MUcNfizzWojdg/DZpSBdaS9+mie8jdYP7q
         nhps4I9KyaGKW14KAdOMxNqI+Uok6nEMJxYwE7LHCr3T0iI5GHXrh0puH5v93nc4/yeA
         VMIyHhorr+9i1I4H8H9XpZjKGc+lLUCTMks2rcd65fJjuoty+T8niwmYCYulIDYcfhSx
         5ADdajYTej1KxYTV2BJ7z7F7OqSFyfE/RVbm2lSmnwdUKaWdJwq3yD5AoA39RAFOHIWd
         qAnPf2Oq0ObigPFlaeRo5ehqCwnxS2CaIt2iP00vhhTPBnpdXsqyZa02tJG199XAPX0E
         hAmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768594650; x=1769199450;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iU7NnvOJ9a9r9qIwFHpAEXlxad5Cnya/UDxG8mCUJcE=;
        b=JsLAm5niacHfXO249QyoErd3mJVHb3G8YHncevekoZqrtvj4oinXRlbIVaiT/sw0L3
         m7b6tPH1KPXeNYLnB/qIqK3pn8FO8d46ACSOiFafBWjr84lRb1NRh9qqxu8c8ayUx6E6
         sdkxmihUg8ZDmNnf0n8KWo3ThB7e64/xP9eDIO5NrIPeXlwKz57XpqtP8eN/ZVYpAVn+
         u2pT2VSwe6dAmoDBFkO4VfzHpMD24rAOst3kjtmiInS1LEC7QO4+tXZN0cNHTx+y8z3j
         ZV3K1aukyDXHGQlt74wG9riyCKVECghKngLIOK3XM5KIhI5gyeqOn1fyjnY9hkLkiNRL
         RZXg==
X-Forwarded-Encrypted: i=1; AJvYcCV1aiB8RAMzRn+UbxN+3Y8MCtjAAseegyB68ewyxS63uUQqC6k4UH70cbFTYSi+JDcCmKyuhRO26IehpRFOfA60@lists.infradead.org
X-Gm-Message-State: AOJu0YyPBT8hWndSiYOXT/YhAAkoOzT4D0AjLamD1HsVT3JDLiJANrCx
	j/fB27WsMCUNle7m/MP/8Ywm+IFLo3MDH7xi8IB0/VJC/lM0eeZLJNIuhXWZp1U1VVY=
X-Gm-Gg: AY/fxX6BPiFcqGKmeZBrr6dFFTW+YqG7Wpu6Rq4aW9e91iUpgs7Gcn3z4rZVsGP5MuO
	i6QOISqAZ4ooNQUjjhBPiP35reESGDqIoq7GRCV7kFZ0dMmdrsFauYWtBxYgq91HChHMT5qKVk7
	PvEGQYZg4qluFuoMpIZGth3SQexiZxLVndKuqe86iSlMUdn8hBM9tkmiqQiyM//Q5VCiZ/ejGiN
	T/v2ljZBYn8hUcFrNyzcgYHsJgZD4AW132WRB1jjI73B9DjzJZfCe0xIbCVxMMzFP3uVXXzpnr8
	EQXOEOf2rOcr/x9u4XGbP1eLy189OzCINH+APmu4IKu2zh9xwjkI4iQBHixO2ssAurYXj9gn8vk
	BAGh6YVFS1smlOoeh7M7d6oTFmwJLTqDcXFS/LUtU4Ry+PSTQvfmOh1cy/ZJMU5tYiTXBBTT1LV
	gFidKsNyr4j+M/wydhci6TBjmC2cAZ5D7Xcw7kCHeG+Fr96x/KZ5FBWUGo4P+M/ISotmx/Q2y8c
	x2NWevA+A==
X-Received: by 2002:a17:902:ccc8:b0:2a0:8360:3a74 with SMTP id d9443c01a7336-2a7189713fdmr32122585ad.51.1768594649704;
        Fri, 16 Jan 2026 12:17:29 -0800 (PST)
Received: from smtpclient.apple (c-24-16-26-157.hsd1.wa.comcast.net. [24.16.26.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190e785fsm28043905ad.41.2026.01.16.12.17.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 16 Jan 2026 12:17:29 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH] spi: xilinx: use device property accessors.
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
In-Reply-To: <608a92f1-9403-45c8-b4bf-085f85876aad@lunn.ch>
Date: Fri, 16 Jan 2026 12:17:18 -0800
Cc: Mark Brown <broonie@kernel.org>,
 Michal Simek <michal.simek@amd.com>,
 linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <E82DCAA8-720D-45F5-ABDD-289A06FE7CE5@nexthop.ai>
References: <20260115003328.26095-1-abdurrahman@nexthop.ai>
 <12f527c6-7728-4512-a4f1-08c778627ea8@lunn.ch>
 <87C51F3B-7770-4BFA-8BBC-5E83A71920E1@nexthop.ai>
 <608a92f1-9403-45c8-b4bf-085f85876aad@lunn.ch>
To: Andrew Lunn <andrew@lunn.ch>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_121730_987235_24E2A68A 
X-CRM114-Status: GOOD (  16.07  )
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



> On Jan 16, 2026, at 12:11=E2=80=AFPM, Andrew Lunn <andrew@lunn.ch> =
wrote:
>=20
> On Fri, Jan 16, 2026 at 12:00:35PM -0800, Abdurrahman Hussain wrote:
>>=20
>>=20
>>> On Jan 16, 2026, at 7:23=E2=80=AFAM, Andrew Lunn <andrew@lunn.ch> =
wrote:
>>>=20
>>> On Thu, Jan 15, 2026 at 12:33:28AM +0000, Abdurrahman Hussain wrote:
>>>> This makes the driver work on non-OF platforms.
>>>> Also, make irq optional, since the driver can already work in
>>>> polling mode.
>>>=20
>>> Are you saying ACPI cannot describe interrupts?
>>>=20
>>>   Andrew
>>=20
>=20
>> It can. We have enabled the interrupts through ACPI on Xilinx I2C
>> block and it works great.  For the SPI block we currently have an
>> issue with our FPGA. Luckily the driver works just fine in the
>> polling mode. By just making the interrupts optional makes the same
>> driver usable on a wider range of hardware platforms, with or
>> without the interrupts.
>=20
> It would be good to split this change into two patches, one making the
> interrupt optional, and one swapping to device_foo calls. They are
> logically different changes. And the commit message can then explain
> you are doing this so the driver works with hardware with broken
> interrupts.
>=20
> Actually, you need three patches, you need to change the DT binding,
> spi-xilinx.yaml, since currently interrupts are required, not
> optional.
>=20
>       Andrew

Sounds good! I will split this change into three patches and re-submit.

Thanks for your review, Andrew!

Regards,
Abdurrahman=

