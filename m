Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE25C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 13:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aK5RkAHQrhrmbMgDmli1jYjYYGO7nTlMC7kAqH+maLI=; b=xZORbM7sN+IsdVJd/Q6zi6ALov
	2u7s/1xCeQFzwkGWUXdgMXuywvJ60f7ZWH95/ImKTr1BmiCfog2jbV0MHOOZpH0ANWlFYCkrgpmSh
	Sn4smL+Axli6GERa8kPwj6exFKKWU74bQ59pOEpHSyS5DdzMgKVOeTgQnaTwMEks7XX+hQv83nMTs
	RJ3nXHvm9DrWFRMJ7/QHqrtSWf48Es74F3m74lUp9s1rXQn67z3HM+5q23cl/mopVRt9affsZlzfz
	73HatA6wFaf4x1zpeR8aNU/qkdtrVzecMWl77ks3G0hLAeCeBtpeTkQ4BFiEqTA9jVHj74TgPa2gR
	yiwN+cMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3v9-00000005kbF-3dSu;
	Tue, 24 Jun 2025 13:42:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3db-00000005haV-0fHi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 13:24:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750771473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aK5RkAHQrhrmbMgDmli1jYjYYGO7nTlMC7kAqH+maLI=;
	b=elPmPNa8qUY/rQWff6eQw9fVoW1T+iLrXbmOTFvu3Rt86pAylfJf/sYfMvG00ydpMJZsj+
	4eoMKtOF5QUQsMGiZJltqTKF4SN/FTashuBiLgrjFyqh/P/W6CUoD7ob1PRUzl2V+agnJC
	WApxmqKWOUFg9B7b+LYenbIPE2OHIJY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-7t78uroLPIesoON88Qmawg-1; Tue, 24 Jun 2025 09:24:31 -0400
X-MC-Unique: 7t78uroLPIesoON88Qmawg-1
X-Mimecast-MFC-AGG-ID: 7t78uroLPIesoON88Qmawg_1750771471
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4fabcafecso234844f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:24:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771470; x=1751376270;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aK5RkAHQrhrmbMgDmli1jYjYYGO7nTlMC7kAqH+maLI=;
        b=qOGuyElflN94IECSgj9LutTx+pYCuKppKGIeXlybAMrHvqvgx+TfeAdIIEUO2w+lPG
         msMzU+8ELripln5MYK7OsPwl7WMpwGOXhWUzVmTiX+D/eAMT6t9M+gtaSTs3UcDi8DH7
         odaIjpSj5XdMPZSxYnpLSmzaZZ2b8VK6HgZkoGPz7Av6Dy1C3n23MXgE1s6prOYFFt6S
         arZHq4j7DpR4fg9I3wMYXnbuXOSC70Mv42GddJy651uvgnR20AMFvUsqXnh7DwcGmUC/
         BMVDI8ZOOyV3Ww+haiAs1Gylhz5ApYLRlEJGgzwQwRj+UwNzMRn91fQgfMQSlIZojAfG
         2xpg==
X-Forwarded-Encrypted: i=1; AJvYcCWIVNJpCMGt7Vg3p8OBHOnoM0Elcf9Pdx/AMcmB0yfPZn+DUjpbtHqjxhAFAY+Z1rKpa7n9KIkY9YjFDE0NLsGs@lists.infradead.org
X-Gm-Message-State: AOJu0YzjTv/T6GFDYzKt8Y6SD+vEMbZDGnxpg2ESerP64cegvVT/TYo8
	BOx2YsVbs1PlwDVQ3yoW0aZzHxh2Z29+QrlGPYBfPVEQzghG1DpZcUS1Kf61L+ZYaVm0zH3Cz2O
	qI0hq+lI8H28D4MmDi6v+11VjNUMmn7sdjKJOLNkXg9itl3xTAOrMO6luX2LAQkhuCXAch0Rgku
	uE
X-Gm-Gg: ASbGncv0uk5vNKqZQ7EMU3mBB6DQotFy2Qz6/U/3ZUmkqB88qYADKCTZJGgto+eg7VA
	8Yr0GT8awK49E+RfTuOwFOZHdSQyYf65JfVl0UW1L2j0wRSJz+LSrcdLdfMQpUMf81vrnf1EInb
	obsdrezuq39uWjP/9rnU6FQFqajsjjuuSy6Ht8KRsLcWSHbIWNltCkYg7DXkVt4qm4BT+1jFDqA
	0w0Yp5IvgqUP8AMt8JnlrfiflxXF3pP/HelBSLgj0t4dZBn8RaxuVB9qmsezHDEOyVJrFdHt7qe
	u6G3CqB1MXW5dfq83+PBKWCGsr5LyQ==
X-Received: by 2002:a05:6000:2c0f:b0:3a4:d0dc:184d with SMTP id ffacd0b85a97d-3a6d12da029mr13966782f8f.27.1750771470460;
        Tue, 24 Jun 2025 06:24:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiFZlAyuiksuIl1Yo2GNzHDQQeq8cn/28qYo/og94VXjH6d5Y5X9A9bCgyxSiJRdNpJZsF4Q==
X-Received: by 2002:a05:6000:2c0f:b0:3a4:d0dc:184d with SMTP id ffacd0b85a97d-3a6d12da029mr13966735f8f.27.1750771469988;
        Tue, 24 Jun 2025 06:24:29 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2445:d510::f39? ([2a0d:3344:2445:d510::f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80f2274sm1927739f8f.48.2025.06.24.06.24.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 06:24:29 -0700 (PDT)
Message-ID: <b31793de-e34f-438c-aa37-d68f3cb42b80@redhat.com>
Date: Tue, 24 Jun 2025 15:24:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v13 04/11] net: mtip: The L2 switch driver for imx287
To: Lukasz Majewski <lukma@denx.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Stefan Wahren <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>
References: <20250622093756.2895000-1-lukma@denx.de>
 <20250622093756.2895000-5-lukma@denx.de>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250622093756.2895000-5-lukma@denx.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ji3mOu3x1ray6Pz9LER8v3phrTkXGUzoQUMO5VLlsAQ_1750771471
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_062435_290622_57F12BBC 
X-CRM114-Status: GOOD (  11.14  )
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

On 6/22/25 11:37 AM, Lukasz Majewski wrote:
> +static void mtip_aging_timer(struct timer_list *t)
> +{
> +	struct switch_enet_private *fep = timer_container_of(fep, t,
> +							     timer_aging);
> +
> +	fep->curr_time = mtip_timeincrement(fep->curr_time);
> +
> +	mod_timer(&fep->timer_aging,
> +		  jiffies + msecs_to_jiffies(LEARNING_AGING_INTERVAL));
> +}

It's unclear to me why you decided to maintain this function and timer
while you could/should have used a macro around jiffies instead.

[...]
> +static int mtip_sw_learning(void *arg)
> +{
> +	struct switch_enet_private *fep = arg;
> +
> +	while (!kthread_should_stop()) {
> +		set_current_state(TASK_INTERRUPTIBLE);
> +		/* check learning record valid */
> +		mtip_atable_dynamicms_learn_migration(fep, fep->curr_time,
> +						      NULL, NULL);
> +		schedule_timeout(HZ / 100);
> +	}
> +
> +	return 0;
> +}

Why are you using a full blown kernel thread here? Here a timer could
possibly make more sense. Why are checking the table every 10ms, while
the learning intervall is 100ms? I guess you could/should align the
frequency here with such interval.

Side note: I think you should move the buffer management to a later
patch: this one is still IMHO too big.

/P


