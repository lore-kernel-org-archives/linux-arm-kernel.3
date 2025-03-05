Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FC9C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 23:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z790mvGquNClk9am635QsUgs00BtBeIllezzp9bIdnk=; b=cLQn2h2H2aVPYb96J1ApCegGkE
	7h3VeeQbnMA225MMkGzaS08XbtzprXL2joqhzUb0P6ChhHnMzzsuxQMgkhAf36razqzdR3Mksy309
	QrSRUqHZgBb9Mkt2vG+Mxd0cECfbJUZ/GJcQcWuLXOSPIgjEnRP7kNuKYHeb5Q22MP6M0RW8Au/uK
	z2JTxYT3reKKXHrtKs2WP65LbJZwYHTtvPO5+BouRN0wOGunMyqtoF0JmYXu/uRG76GaGclqNGLHQ
	9c5y3x5l7/PXuMiB1ZQhDoADcZesJVsrHMOSwkXWx7a2fz6IOHvmN9lFNlKEijdmTnekGWX57a5RQ
	z5l4M/UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpxo5-00000009Zfx-2H66;
	Wed, 05 Mar 2025 23:05:41 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpxmT-00000009ZBb-27JJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 23:04:02 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2239f8646f6so86922625ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 15:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741215841; x=1741820641; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Z790mvGquNClk9am635QsUgs00BtBeIllezzp9bIdnk=;
        b=LKZfePqgS1tt1BwQKmWjga72Fm3NH6lgbxQVaa1aqm7dVjsJh7QDuQzbcUiDsamUGZ
         Ug8RR1zxcwcH5baiBPDdD76kY40Id96+pMlrJWq1DtH8ZWCtscjZ569HTEwpRJGxBgPI
         /RvaQYFrcz67+0ffeG1pvxeOjqZE45zOXc6/PHXqKB4/0csShCUlIkm7RrW2tYcT0PMg
         83zDkNbr99PAI/kzBSNwgAU4HyF2m3RC+4RrBsR9k+cAHjOl5fd1352jIbNUp5uyzb/+
         lYkA4WUgiy/F05psnEvIf/hFKJCSWfF2OfeLBW1yP6EutWpRNDOA8p5C1EBkWyoTLVF0
         dDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741215841; x=1741820641;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z790mvGquNClk9am635QsUgs00BtBeIllezzp9bIdnk=;
        b=Q/5ziIjmUjjL/nCveMtxPMG+puBWqNpZCrR2nyQ68d7za8C3z1rrqrnGyfQLNhf+ki
         gt5E31EPYtckpnaJDy09U2hPGMQTGA2ZcVvQ8fnnXoVLYtobup26TK5XRvEE72C8l2Ij
         fnluF5j8Cu4V+KVnbmZ97TYuS2R6qotND/aOgFwLeoaRp/qxAN5FwxqpNn3/SAeL1Dvo
         fQoNTbj3dm3kYe0Lsan4TesrJPHx6EAoh0eevmDe0/ey0QxE0Z3RS0JNyM1T5ULNltMU
         ddSeulh6THf35fNugRU6o0qm5qfB8By/c9PmWKT+aD3XNsDBqyiwu5h3E7yVwmGxrljl
         WUDQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0ZrUa5510MW+dl5mq8Cw53Y80mtow42fi3zb2R2YHV4f+X0Kbg9Rq35tHKn/q0+RCdbCTp5vlTxBFSeKMgUdc@lists.infradead.org
X-Gm-Message-State: AOJu0YzTQkEcwy6l70ekf7Y71FdEudt3dQEg4t724AX4jJaaD+4njF7c
	eEUh4hQriweNpOyoqqe9JA+BQLrsq7aOWElNx39/BlXBTxLGYq2h
X-Gm-Gg: ASbGncuDnb7ne06xKY3GWHxYvROYZjEOfcSSbibViy0WJeK24Yu1htGbNo1eOOzVVdX
	qoAS7opZ4DTD9gzDPkxbLZDFl+R4CJBEX/9u1isyhe1i2Bod+MsP/u3GBnDErMI7gMFB+WUuMAY
	V2e5+ZSTVBbPSrEpJF+j7ajB1D1x1pnIiAWefW0n3rgNg+13gGTHjtWG/74ixfIcutnmg1+mZqB
	HbxWlqluznh1SBMmBrknHtKh1OOEmsgq4bJjH5jHOC2fmcO1pl/M6+a4jn2Vo69fsxKa2958U39
	ZOXTkcMU+AVT08U3gOcUUS87VxVy59fjq8qUk/BrC4QmgSYMwPVj8Ik4HpWC8bGgirNXClV7+r7
	EMXzXzp+iWqh+F5u4yg==
X-Google-Smtp-Source: AGHT+IGJ8wMSqYZlSJ4sp1Cb8aQxAnqhxcIrS7MZKZh23f2DOaW2c7kOg1mKVHzfXB47vtWWZXhcIQ==
X-Received: by 2002:a05:6a00:1397:b0:732:5164:3cc with SMTP id d2e1a72fcca58-73682c8bebamr6106502b3a.19.1741215840704;
        Wed, 05 Mar 2025 15:04:00 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7364b4eff66sm7432847b3a.83.2025.03.05.15.03.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 15:04:00 -0800 (PST)
Message-ID: <35c97316-1e40-45ed-93b0-7e4f7dbce56d@roeck-us.net>
Date: Wed, 5 Mar 2025 15:03:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] watchdog: Add a new flag WDIOF_STOP_MAYSLEEP
To: George Cherian <george.cherian@marvell.com>, wim@linux-watchdog.org,
 jwerner@chromium.org, evanbenn@chromium.org, kabel@kernel.org,
 krzk@kernel.org, mazziesaccount@gmail.com, thomas.richard@bootlin.com,
 lma@chromium.org, bleung@chromium.org, support.opensource@diasemi.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, andy@kernel.org, paul@crapouillou.net,
 alexander.usyskin@intel.com, andreas.werner@men.de, daniel@thingy.jp,
 romain.perier@gmail.com, avifishman70@gmail.com, tmaimon77@gmail.com,
 tali.perry1@gmail.com, venture@google.com, yuenn@google.com,
 benjaminfair@google.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
 mwalle@kernel.org, xingyu.wu@starfivetech.com, ziv.xu@starfivetech.com,
 hayashi.kunihiko@socionext.com, mhiramat@kernel.org
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-mips@vger.kernel.org, openbmc@lists.ozlabs.org,
 linuxppc-dev@lists.ozlabs.org, patches@opensource.cirrus.com
References: <20250305101025.2279951-1-george.cherian@marvell.com>
 <20250305101025.2279951-2-george.cherian@marvell.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250305101025.2279951-2-george.cherian@marvell.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_150401_552924_A809F02C 
X-CRM114-Status: GOOD (  13.18  )
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

On 3/5/25 02:10, George Cherian wrote:
> A new option flag is added to watchdog_info. This helps the watchdog
> core to check whether stop functions would sleep or not.
> The option flags of individual drivers are also updated accordingly.
> 
> Signed-off-by: George Cherian <george.cherian@marvell.com>
> ---
>   drivers/watchdog/advantech_ec_wdt.c | 3 ++-
>   drivers/watchdog/arm_smc_wdt.c      | 3 ++-
>   drivers/watchdog/armada_37xx_wdt.c  | 2 +-


... and many more. Sorry, I didn't expect that this would touch
that many drivers. My bad.

Let's do the opposite instead: Introduce WDIOF_STOP_NOSLEEP,
and let drivers opt in instead of opting out.

I still have to look into the other feedback. I think someone
suggested to introduce a callback instead, which would stop the
watchdog at runtime if needed (especially during kdump).
That may be a better solution than having a module parameter.

Either case, please separate driver patches from the patches
introducing the new flag. Since the flag is opt-in, that should
be ok - drivers supporting it can be modified over time.

Thanks,
Guenter


