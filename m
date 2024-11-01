Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8AEE6F063
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 14:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5pVFDp9Yc69yxhK1p5h/wUmlxxyNXM5NYYA7bPBW8vs=; b=K0KZvyrnE2gZuE60e75CGV8K25
	0hWckdYR2FBdLAe5WIcT7Sd/4S5ViRQMj9W+tivDAIHb2uwdQTi+CMejnpYl5VVycE6S59WqftyiI
	AU/saSIFvykNAIsclN9L+Y8XZkLXve/UL+5YqFha2i59rPAgR03BmcatAcbnQGZ1PCniUJxKLMv6i
	AlDMJ+uZwWlu2ffnhQg/nNQ6T0ByFbGuXC4MGsBk+Nmyp0xFRkFx/9uzl+Mx7LPzl+MUz3N/Ty/w1
	Wxj4nJ6LI/JGn359IpfLNDLnQ3MUR9t+wCE8QCP+39E18DRb6gBUyFtq6FJU9OwXIK39u3mxj5Ca0
	161bIquQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6szK-00000007Oq9-1nrH;
	Fri, 01 Nov 2024 14:50:58 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6sjv-00000007MNc-3YT0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 14:35:05 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-20b5affde14so16565105ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 07:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730471702; x=1731076502; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5pVFDp9Yc69yxhK1p5h/wUmlxxyNXM5NYYA7bPBW8vs=;
        b=LFL0FPUiPjZB1OQlwIM3NR+ccALdNtFxJp0GctF0fPL4AdZQcbv7YrL/pDQZ+7MW0c
         LmDoiNAAkwrTMP7zDwOaERnmKFtW6CXb2Azy6acf5KwPNma8UuHbotpXOeFTxzohWI8J
         icRE0daNqzKmYN0LdcinExuqVLY2an7D4eHYLhrLLP64WS/7sE9G6FoEmvIkkhLowAPa
         KzAeNjEVxyE4z0GdY1TZ/ZqTTlaqK1fE+gnrAF/krz2QwGzhN0mpqItlHLfq2ps/xLZk
         YKSnnF4KC5AD1+dwQIXJLBa2Os/Yjq1gi76gmR8lkzCe7YcXQN3mpO8ksxaqu8ATwlau
         7c8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730471702; x=1731076502;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5pVFDp9Yc69yxhK1p5h/wUmlxxyNXM5NYYA7bPBW8vs=;
        b=WLkK3E/KVxS9/ow9R1DIJbLQXojJ5FzvJW94ILecPGGD9Al1KYRKhB0QdtZ1IUUQ//
         kZ/z8IsPCdnZf+OTRzJXsk4OTqCWC3LJ5/ROpkAKYyL4VxF/1y/ozk0JueIJZbZRr9EK
         ws1yRtjdWXMNGAEUoFBVop75kegaOKBmeVZmCOjnTs1f2DI53W5ccahVTwAdWNUByQJv
         Q2FI2iW8hjV8p+CSnZJZ3fmrfDX/HaIgAHJrmDLpj+1Ey2oL+p/JVfLo8N8+Y2ll7TUB
         7RC6nwu3BKdqU83DX8yeUsxasXmyF9zYw3c0+nvx9FFia1o6ZrwZqjnt61O+xNLbjbw1
         BRFw==
X-Forwarded-Encrypted: i=1; AJvYcCVHAalFMgQwIj4UN+vUz1ptn31CKGdNZOhvY+JnkWitWDTOPZVwTDfE+2JrGzapUJglMacJmK+6NSThbuVAFzak@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+0rFwgyH9gC31i9LHXZp/PWY0A2HWAKpoqDHINJAn6v7VYo66
	QLeP48ldE4asUAnyQ4qjuT1HxOnWfsohY6z3SoPYiifhbkr3fvxm89d+LOvSi6k=
X-Google-Smtp-Source: AGHT+IHuiSC+nJyf6UEsVwUesuZOzMUK/1h8I/9z0D1Xub/LgUG9eT3uVjO+sjDT1UDFpuBCq5x4/w==
X-Received: by 2002:a17:903:22c5:b0:20c:d18c:1704 with SMTP id d9443c01a7336-210c68c6f57mr306749745ad.23.1730471701962;
        Fri, 01 Nov 2024 07:35:01 -0700 (PDT)
Received: from localhost ([97.126.177.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2110570a1dfsm22250725ad.108.2024.11.01.07.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 07:35:01 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Roger Quadros <rogerq@kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>, Robert Nelson
 <robertcnelson@gmail.com>, Colin Foster <colin.foster@in-advantage.com>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: am335x-bone-common: Increase MDIO reset
 deassert delay to 50ms
In-Reply-To: <c3c60bcb-186e-462d-aedb-ab90d52a58bd@kernel.org>
References: <9002a58daa1b2983f39815b748ee9d2f8dcc4829.1730366936.git.geert+renesas@glider.be>
 <c3c60bcb-186e-462d-aedb-ab90d52a58bd@kernel.org>
Date: Fri, 01 Nov 2024 07:35:01 -0700
Message-ID: <7h34kbowdm.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_073504_092155_6B798357 
X-CRM114-Status: GOOD (  10.83  )
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

Roger Quadros <rogerq@kernel.org> writes:

> On 31/10/2024 11:29, Geert Uytterhoeven wrote:
>> Commit b9bf5612610aa7e3 ("ARM: dts: am335x-bone-common: Increase MDIO
>> reset deassert time") already increased the MDIO reset deassert delay
>> from 6.5 to 13 ms, but this may still cause Ethernet PHY probe failures:
>>=20
>>     SMSC LAN8710/LAN8720 4a101000.mdio:00: probe with driver SMSC LAN871=
0/LAN8720 failed with error -5
>>=20
>> On BeagleBone Black Rev. C3, ETH_RESETn is controlled by an open-drain
>> AND gate.  It is pulled high by a 10K resistor, and has a 4.7=C2=B5F
>> capacitor to ground, giving an RC time constant of 47ms.  As it takes
>> 0.7RC to charge the capacitor above the threshold voltage of a CMOS
>> input (VDD/2), the delay should be at least 33ms.  Considering the
>> typical tolerance of 20% on capacitors, 40ms would be safer.  Add an
>> additional safety margin and settle for 50ms.
>>=20
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Reviewed-by: Roger Quadros <rogerq@kernel.org>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>

