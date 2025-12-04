Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C695D1CDCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 10:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YWndlYmmP/ziqcPNiLCxF5pZQ45lalch3dWqqxWyVdM=; b=DaiAjHx6v43B62qVMTozHVNwLU
	ixDEP4ctZ7crJNZa5eFPmupUTvakRWPsCSPYhgN6+Q2y0Ye/WoSnloYHuNhkkXzoThL9BuAL9aRdi
	AO+bf9jOcpf7SP2NiyDGTvBlJ2c6lDLaThrjazIxDWV1LGoL4AT96n+5TYDP8x4Jjg5eVg77XN5gE
	YViftGdxknVB8V/Lpf/BLwqKlE15xrnEQ+oSRa89oRD1oZfuOdUNQvUJLyuhWVtjeFj7YFOfXUbaB
	dtweOj7C6CAdkzMSAtv3fkRLqfzVK+jeJTHqdzFyJJ9tPEu5zmLdvjFQlgxq66vd3CARZf26NVx2n
	6FsoIGpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR6S6-00000007ple-0P9Y;
	Thu, 04 Dec 2025 10:20:46 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR6S2-00000007plG-3UlK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 10:20:44 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so7543925e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 02:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764843640; x=1765448440; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YWndlYmmP/ziqcPNiLCxF5pZQ45lalch3dWqqxWyVdM=;
        b=ROUI3NjllXEyuut0/V0E/QVFvcJrjc88gXmcpeOrJ+SMYhNc/2TvUxjzeMNLR7bVnF
         MmoyZ4ay79rUFnLwPn5Y63fJGfHduhfRzLf6t+OOowGtTwnad3sgiA+w/AqWZ/p6usow
         Md9kRuV67NwgmLApvGxYWvw7CZneeBYfT/TOGnJ2jwmSpwg7hC+A9sLsGyXE4Ug4h17Q
         RoHugASMwUJVyqmVge4eZoE7n1i3MLmPP1ElhSn6aEUdrsIkmpJFKs9Qfj15B377oV0O
         Xc6jDf2gS9sej+PpmyI66t31N79tfQbRLguhhqD0cDQiGV6s+0KIo6V0qMLIpKD52MVC
         nMgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764843640; x=1765448440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YWndlYmmP/ziqcPNiLCxF5pZQ45lalch3dWqqxWyVdM=;
        b=OVCIJEvxXXQyxw9rszpw7gC/Jxfi81C2kD8FvxJJ/xvQe4ab7O0naqpnfqWAh3rDHB
         pfDhp+PGXZFa8xONcjEYx+RsllB0f9mo/jju/VMrE+H00QGzK21eXEfF9xRWP+N7GFyu
         aPvl0qphRAvsuEs+8CLLc3Rw2lQH7scXPNKuveCaQIMxpu4QARqyFklvKFDRn3bYCVLj
         yZhaQ+8ynS071FHEW3g6MBLifeho2ZM+2qqwDg9BmRWmDN9eI/2WX5D3dMbhrurPi9kO
         lCxDnJrVyrodTeBMY1lIV5gHkZYV7kYmltrgW8LEM9omrnbsIPWZFWfedc+h9CMlAwx3
         gfKA==
X-Forwarded-Encrypted: i=1; AJvYcCWyeWritLRhm9NJe1zs9Qnb6mdPElYey+en6/Y1pO9cWjkX8jWgGvy0ZzYqBRLcGUbnZshr8JrVon9kdz0mQAqy@lists.infradead.org
X-Gm-Message-State: AOJu0YzpT7dff3q41kcvEDKGeuJSk9/RqrdJHbdPjK+3NT0Lz8Bz1Gl6
	o2mI4ertkfgAq68QqiOyldEjgiNSaFFDHFzJDV96Mj4n7WJTOCCbkHMg/XC7KKgI3DQ=
X-Gm-Gg: ASbGncsFln++ebRm4DDPX8WP5Ba4RYJHOYmeOUFLiv1gQSRkSFLszK5iKCOH7wshrcT
	X5mLNT6QghF4hWTTVCrmeba1+XrpFWLj/kQiWp28lRVQ5dtOBlVOsEwvTsYCiSW52tFONaSZ20q
	PnKpph7xTR6ldnV2VUlbpy/Y+n3JuU/4rOyeEdygfflmRbQkXUBpoVTok8HMjUj/G5L9vn8tOiG
	3kuSy4zagniSIOVwpXGg0SIe1YdjSVH3jhDCDaFcPQYUTxdiG3PRTSAPonHjNoh30q8rQIbScNa
	PWhe68JTbhwv5Hp+LHbG5YARPniUSe/90eCUzmWABuYuUvv81WepiNvyJv/71aQvIcbCtBYwu/k
	0D7aheXaKT9g5XnUmvzcvwyp4UsC+mNfO/Irh0LbPmDktLXJgcbxnR54iCHAy4pns3knPTIvoSw
	pnALskG7+daq0ZpA==
X-Google-Smtp-Source: AGHT+IGjXxBqCI3nHyvyKZ8gwjTRWgF1uFsxgb0njJqQCdjIbfZ8SPxmGGQrKiRSeV8F05NFAcnbCA==
X-Received: by 2002:a5d:5d86:0:b0:42b:3907:a38b with SMTP id ffacd0b85a97d-42f79855e9amr2270006f8f.44.1764843639686;
        Thu, 04 Dec 2025 02:20:39 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d2226c5sm2492488f8f.23.2025.12.04.02.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 02:20:39 -0800 (PST)
Date: Thu, 4 Dec 2025 11:20:37 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Leo Yan <leo.yan@arm.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Breno Leitao <leitao@debian.org>, linux@armlinux.org.uk,
	paulmck@kernel.org, usamaarif642@gmail.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com, rmikey@meta.com
Subject: Re: [PATCH] printk/nbcon: Restore IRQ in atomic flush after each
 emitted record
Message-ID: <aTFgdQNeKb0k4SQS@pathway.suse.cz>
References: <20251202135832.156559-1-pmladek@suse.com>
 <87o6oheywd.fsf@jogness.linutronix.de>
 <20251202162639.GD724103@e132581.arm.com>
 <87ikenyclh.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ikenyclh.fsf@jogness.linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_022043_286624_E56D6A47 
X-CRM114-Status: GOOD (  19.85  )
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

On Wed 2025-12-03 13:33:38, John Ogness wrote:
> On 2025-12-02, Leo Yan <leo.yan@arm.com> wrote:
> >> I am not really happy about all the local_irq_restore() usage. Using
> >> guard syntax would be nice here, but AFAICT there is no guard for
> >> local_irq_save()/_restore().
> >
> > Sorry for suddenly jumping in.  Wouldn't guard(irqsave)() be helpful
> > here?
> 
> Thanks, I was not aware of the irqsave variant. We would want the scoped
> version. So something like this?
> 
> $ git diff -w
> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> index 3fa403f9831f..55beb64c4f4a 100644
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -1557,6 +1557,14 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
>  	ctxt->allow_unsafe_takeover	= nbcon_allow_unsafe_takeover();
>  
>  	while (nbcon_seq_read(con) < stop_seq) {
> +		/*
> +		 * Atomic flushing does not use console driver synchronization
> +		 * (i.e. it does not hold the port lock for uart consoles).
> +		 * Therefore IRQs must be disabled to avoid being interrupted
> +		 * and then calling into a driver that will deadlock trying
> +		 * to acquire console ownership.
> +		 */
> +		scoped_guard(irqsave) {
>  			if (!nbcon_context_try_acquire(ctxt, false))
>  				return -EPERM;
>  
> @@ -1569,6 +1577,7 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
>  				return -EAGAIN;
>  
>  			nbcon_context_release(ctxt);
> +		}
>  
>  		if (!ctxt->backlog) {
>  			/* Are there reserved but not yet finalized records? */
> 

Great. Thanks for hint. I am going to send v2 with this change.

Best Regards,
Petr

