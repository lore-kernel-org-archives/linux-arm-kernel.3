Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB15CD59F43
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 15:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ti7UsIKyZqf2Hot2MVTOlKId95dgb1Zot1pr3BqVVw=; b=ZqZ3ofGtoATCCXaRMcESft3YqA
	8xkpPDUCe7opG2MwtXJFjpjf4aUrpNoOQYRj8zAUkAhvUGvQIdgPFu0CFvQlpQFiOm4lJdWShfZCV
	vC1iQkdRJgFJDxNswJAwG2FE1DiQL5JS3JzHqzpuOCdjRzE2PNmWsoqpzTvjMvezX33+Jnuj9eVpZ
	R1qnDS8SM+dIW0lEBPiLYqPT5vV5LBGvdh84t6mi6Nr5G2eUiwOUZkpr0V+5qbDEGZ5a4QzBTOktl
	+WN+O7oTd0hjT+Y1WHrnoFg9pqapXy9rLkBW/N3zgt5zburFuBjOAwoyQ3SYIlblta9G9Y7hubLnE
	uXsDVmUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8iCg-00000003s5p-185z;
	Wed, 06 Nov 2024 15:44:18 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8iAv-00000003rZm-28Ec
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 15:42:30 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-37d473c4bb6so6101597f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 07:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730907747; x=1731512547; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/ti7UsIKyZqf2Hot2MVTOlKId95dgb1Zot1pr3BqVVw=;
        b=gjY1DH8qI0u5AewcBAz7FM2ZwL6nbnIc59ALML+MtB1W9TRf7rPl2GtzLSBChGSgHE
         jPSkVHf0YPllvlcxGRnzEPR/UNmzWh1giinYozrlrLzOcj/7Na0Rtpx3FJXorZabHbP6
         cwFL1Vr70L3l496dPtdRXWbb0Jvig5ulry/AFZMnaMd/B/6o+FpPelcgKdhJje9ePAY8
         LHIWOfdlY0r/gwh3+O2Vwmp/2HPPEEb8alLzssxVh2rNPM1M5L93/6dkspQG7GeUd8Jz
         61QQFSEviRIpMMlUusaYvjP9VVS+DiRC7RXDy6ai3JY263453FtUhcwwB4X3zZwata9B
         DAKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730907747; x=1731512547;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ti7UsIKyZqf2Hot2MVTOlKId95dgb1Zot1pr3BqVVw=;
        b=cD5YGp4+/VWt5EE3ZoRftjm2CVu2eizWM6a92Q+EHeQCkfzisUB+4tMtPEVOo4/OsL
         jQ1T7Il2IQEbxS7cgQlSz0cXsaYObyqdOdi9gXB777cAKlb0ysINGZeGmxUMYK/LlYLD
         DAJmBazs+0ZbM9R33lGZxjVz2QHMFZFiGVXkoPzV5/JNyHF8gMNX8tLE529Tf8phL0yu
         Jfo1faNZi9U6IXyYd4OTlOk/nNV0X0JePOcbLBqyG8jhUABZG81aD85P9ZnS7/pN2AT1
         Add0czAfBhzm6HZYgWycMkrsFqASG26AKz0zxii1eHWuLCN4R5qtI33WwlCpOKHLDR2G
         nUjQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5zfNyUjtj8pE40OXF6e/Sq8EOn2iEyY7NZWrCEYb41y2Waj8/BlVVyL/TrZf4qSINhD7LEX5ATJLOmPOq7M2Q@lists.infradead.org
X-Gm-Message-State: AOJu0YzJ/+VFMIYj5I66U5MhsIHFP4/V85XwXpqD2+USMSFx6cZpqbyi
	BHj/C9NYkYFvcy1u6lj+jZKhi8HnxVhpUUiUIhKvYMZX4Re+C1pq31uib5Y0tpE=
X-Google-Smtp-Source: AGHT+IHL/9OFC3B7xauZzAm3FztTY/x82hTX3rnLuRwwJLNiavrv7/WtChDCcQs0E4+aSR2o60E95Q==
X-Received: by 2002:a05:6000:156e:b0:37d:61aa:67de with SMTP id ffacd0b85a97d-381c7ac3be6mr20806701f8f.42.1730907746813;
        Wed, 06 Nov 2024 07:42:26 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa6eb5fesm28133095e9.41.2024.11.06.07.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 07:42:26 -0800 (PST)
Date: Wed, 6 Nov 2024 16:42:23 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Esben Haabendal <esben@geanix.com>, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Stefan Wahren <wahrenst@gmx.net>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	Ronald Wahl <ronald.wahl@raritan.com>, Udit Kumar <u-kumar1@ti.com>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Rengarajan S <rengarajan.s@microchip.com>,
	Lino Sanfilippo <l.sanfilippo@kunbus.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH tty-next v3 4/6] serial: 8250: Specify console context
 for rs485_start/stop_tx
Message-ID: <ZyuOX4VVbfAFhMfV@pathway.suse.cz>
References: <20241025105728.602310-1-john.ogness@linutronix.de>
 <20241025105728.602310-5-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025105728.602310-5-john.ogness@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_074229_554709_C458749D 
X-CRM114-Status: GOOD (  21.68  )
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

On Fri 2024-10-25 13:03:26, John Ogness wrote:
> For RS485 mode, if SER_RS485_RX_DURING_TX is not available, the
> console write callback needs to enable/disable TX. It does this
> by calling the rs485_start/stop_tx() callbacks. However, these
> callbacks will disable/enable interrupts, which is a problem
> for console write, as it must be responsible for
> disabling/enabling interrupts.

It is not clear to me what exactly is the problem. Is the main
problem calling pm_runtime*() API because it uses extra locks
and can cause deadlocks? Or is it more complicated?

IMHO, it would deserve some explanation.

> Add an argument @in_con to the rs485_start/stop_tx() callbacks
> to specify if they are being called from console write. If so,
> the callbacks will not handle interrupt disabling/enabling.
> 
> For all call sites other than console write, there is no
> functional change.
> 
> Signed-off-by: John Ogness <john.ogness@linutronix.de>

It looks like the code does what the description says. And honestly,
I do not have any idea how to improve the naming. I would keep
it as is after reading John's answers in the thread.

IMHO, one thing which makes things comlicated is that
serial8250_em485_start_tx() and serial8250_em485_stop_tx()
are not completely reversible operations. Especially,
the change done by __serial8250_stop_rx_mask_dr() is
not reverted in serial8250_em485_stop_tx(). It makes
things look tricky. But I think that it is beyond the scope
of this patchset to do anything about it.

Just 2 my cents.

Best Regaards,
Petr

