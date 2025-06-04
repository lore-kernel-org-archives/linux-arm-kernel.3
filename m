Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BB9C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 11:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fo/dL6h3Yr2vVYWODP4+BLrzuTaAimU3j5bsgQKsn4o=; b=sWOhsssU8iIg2LHjZWikiDE2Gy
	2/DlMuyMOgPvn35pZRYrVuWubnRmxqBOUoQNmxpb7qJgJuuMY4TqT92GNJGvrMWtqqUw2NLpxrpDI
	UR+8wHPE8PQx/u8B0jEtYJNapCv09oddWHaTJUivyn4AJBLIbI1V5ULP+sn453UA99e1QHfN7cchM
	ruj3GVywamzm4xRkM1JYI8yGL6ufA3p0+lumfYn2ozht8CLU8zrxZnmOR7/BEDJPajTZB6HYTPBHi
	hieST8HwD2oZDAeH/A02A68MbkQLrUySLJawXXlHPY1+E2mRu5b1pQIo5N2ZsycgBcOe6iIGPWZth
	N2VXwnaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMm1V-0000000DBbi-3alZ;
	Wed, 04 Jun 2025 11:11:09 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMlzQ-0000000DBST-3uYh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 11:09:02 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so77705495e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 04:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749035338; x=1749640138; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fo/dL6h3Yr2vVYWODP4+BLrzuTaAimU3j5bsgQKsn4o=;
        b=YCdqlUmUIePcUaJV/MwJLHOCw/6L3XOETSmnEFJpJ/jTmNUF/vzjHzCapg5HRIQJ0t
         iUtP9Y0MchvrWHqAOJJ8ORC/MptyenOGHN403ICGXUIRTKclW6I9Y0H92ARhESEd9/j3
         gCDxZ5rs9WBysR2hA1JTiRaoIvtyLXeObML0msbQNMXAKuERKNBr1GBxPryxmGXhVNzq
         JM/qCFaYqOSM/kAtcDDeGBn14WHGhsoCM3hQwaV+lg1zUeDDzYBYeZtNhaoVomyz9JZQ
         8FK7A6Ys3UZDV2waCH6aSLeea4z6y26E7O54iWiKgu/+yhsf+EVwz4d94zH7Xf2Ymbpr
         GqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749035338; x=1749640138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fo/dL6h3Yr2vVYWODP4+BLrzuTaAimU3j5bsgQKsn4o=;
        b=wC3/YZmSDXAO6y2V136VRXnxSj8IdnYMLCy9RjC7sYSYWUDNRovECyJyrBQc63b87v
         GFDSaq9XOQDtuoVcPs7vDFD6YWKQiU4yyNKxzNAeSo55TdVU3d4T0QjrSLS04fzZjODX
         Zb7/XQs7JeF9rWKmBko4jLvDpWU6tzelqH0BWotw3VYyL/N1G4JOmcF4KN1NMbeAmigc
         diTLYnhcVRlZJpv/p/F24KRfyMztqDb+xWTYxNVx/qdCUdcAIMiXdOkilXkk21Nw4+U5
         rghSm6TVgzJZZmcIzLcfDWOM4cT3kHB/9U80MtNjhuhGwM6fDbVzUP7/D69PAn6bPqAR
         oqCg==
X-Forwarded-Encrypted: i=1; AJvYcCVUXvgDz2/EWO1NwmLx48zX/7Ds30P3h6T8Rw6/O1FffYpj51Ut6ewsR449pUuImf7VeL/NskadiZXQcPwEH7k2@lists.infradead.org
X-Gm-Message-State: AOJu0YziG5ttnvly6AZX76/7HGvqb0XZEBJCr6iMHatywKRh6Yj2IShC
	jt1bhXwIfF9p9D/bC6hG5IhXNGikgD3R1Rvq7QLHrWKxU9oLoBIUOWezLZ/8jrHrItM=
X-Gm-Gg: ASbGnctPnPxMXBKM1Ux3cHzOGVDEhXaRGHgbryEKCxjtCURJ779hZKRBj8AX7UQPWua
	8mp1j7foKcVlQm0oEfFQMQz+pNWOkAhsl51UzKH31sbtM8dZYSNYn7Hq4SXJWkL6TueEdiWWv3O
	Xrf6dq/774ftRcMwQJuTv6Xx4Ov64zpnKeoEmQQLV7+F+muIAGJvWzmLRU/5aU6r2lwGCHyGzT1
	uoZ1IGwLOrr7FT4CgKfDzF0tg+Qv1RhFkStQWMxrSlT8kpUdFVNPnpd8ddLUUJOrv4FKNTbuvpY
	xpNAk7LYCUAHQm8TNZso5/+a39W/XYVC4vs+EttiQMR09N2eWRcwUQ==
X-Google-Smtp-Source: AGHT+IGzwTw0APJOBCPXYsgbi3L8T2cF37ouY+tpV3tVwkWBF2/qFMnNgv0OYaykSm6L6gQBiWeTzQ==
X-Received: by 2002:a05:6000:430a:b0:3a3:7593:81a1 with SMTP id ffacd0b85a97d-3a51d967d6emr1755178f8f.43.1749035338282;
        Wed, 04 Jun 2025 04:08:58 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd3506sm101742875ad.156.2025.06.04.04.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 04:08:57 -0700 (PDT)
Date: Wed, 4 Jun 2025 13:08:40 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Toshiyuki Sato (Fujitsu)" <fj6611ie@fujitsu.com>
Cc: 'Michael Kelley' <mhklinux@outlook.com>,
	'John Ogness' <john.ogness@linutronix.de>,
	'Ryo Takakura' <ryotkkr98@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: Problem with nbcon console and amba-pl011 serial port
Message-ID: <aEApOPTqbVOR35F_@pathway.suse.cz>
References: <SN6PR02MB4157A4C5E8CB219A75263A17D46DA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <OS7PR01MB13775FE1A20762D1EA4A38D0ED76DA@OS7PR01MB13775.jpnprd01.prod.outlook.com>
 <84y0u95e0j.fsf@jogness.linutronix.de>
 <84plfl5bf1.fsf@jogness.linutronix.de>
 <TY4PR01MB13777674C22721FCD8ACF4FCCD76CA@TY4PR01MB13777.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY4PR01MB13777674C22721FCD8ACF4FCCD76CA@TY4PR01MB13777.jpnprd01.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_040900_980526_85564A79 
X-CRM114-Status: GOOD (  38.71  )
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

On Wed 2025-06-04 04:11:10, Toshiyuki Sato (Fujitsu) wrote:
> > On 2025-06-03, John Ogness <john.ogness@linutronix.de> wrote:
> > > On 2025-06-03, "Toshiyuki Sato (Fujitsu)" <fj6611ie@fujitsu.com> wrote:
> > >>> 4. pr_emerg() has a high logging level, and it effectively steals the console
> > >>> from the "pr/ttyAMA0" task, which I believe is intentional in the nbcon
> > design.
> > >>> Down in pl011_console_write_thread(), the "pr/ttyAMA0" task is doing
> > >>> nbcon_enter_unsafe() and nbcon_exit_unsafe() around each character
> > >>> that it outputs.  When pr_emerg() steals the console, nbcon_exit_unsafe()
> > >>> returns 0, so the "for" loop exits. pl011_console_write_thread() then
> > >>> enters a busy "while" loop waiting to reclaim the console. It's doing this
> > >>> busy "while" loop with interrupts disabled, and because of the panic,
> > >>> it never succeeds.

I am a bit surprised that it never succeeds. The panic CPU takes over
the ownership but it releases it when the messages are flushed. And
the original owner should be able to reacquire it in this case.

But maybe, this does not work well on virtualized systems when the
virtualized CPUs do not run at the same time.

> > >>> Whatever CPU is running "pr/ttyAMA0" is effectively
> > >>> stuck at this point.
> > >>>
> > >>> 5. Meanwhile panic() continues, calling panic_other_cpus_shutdown(). On
> > >>> ARM64, other CPUs are stopped by sending them an IPI. Each CPU receives
> > >>> the IPI and calls the PSCI function to stop itself. But the CPU running
> > >>> "pr/ttyAMA0" is looping forever with interrupts disabled, so it never
> > >>> processes the IPI and it never stops. ARM64 doesn't have a true NMI that
> > >>> can override the looping with interrupts disabled, so there's no way to
> > >>> stop that CPU.
> > >>>
> > >>> 6. The failure to stop the "pr/ttyAMA0" CPU then causes downstream
> > >>> problems, such as when loading and running a kdump kernel.

Thanks a lot for this great analyze. It makes sense. It must have been
hard to put all the pieces together.

> > >
> > > [...]
> > >

> This is a proposed fix to force termination by returning false from
> nbcon_reacquire_nobuf when a panic occurs within pl011_console_write_thread.
>  (I believe this is similar to what John suggested in his previous reply.)
> 
> While I couldn't reproduce the issue using sysrq-trigger in my environment
>  (It seemed that the panic was being executed before the thread processing),
> I did observe nbcon_reacquire_nobuf failing to complete when injecting an
> NMI (SError) during pl011_console_write_thread. 
> Applying this fix seems to have resolved the "SMP: failed to stop secondary
> CPUs" issue.
> 
> This patch is for test.
> Modifications to imx and other drivers, as well as adding __must_check, 
> will likely be required.
> 
> diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
> index 11d650975..c3a2b22e6 100644
> --- a/drivers/tty/serial/amba-pl011.c
> +++ b/drivers/tty/serial/amba-pl011.c
> @@ -2577,8 +2577,10 @@ pl011_console_write_thread(struct console *co, struct nbcon_write_context *wctxt
>  		}
>  	}
>  
> -	while (!nbcon_enter_unsafe(wctxt))
> -		nbcon_reacquire_nobuf(wctxt);
> +	while (!nbcon_enter_unsafe(wctxt)) {
> +		if (!nbcon_reacquire_nobuf(wctxt))
> +			return;
> +	}
>  
>  	while ((pl011_read(uap, REG_FR) ^ uap->vendor->inv_fr) & uap->vendor->fr_busy)
>  		cpu_relax();
> diff --git a/include/linux/console.h b/include/linux/console.h
> index 8f10d0a85..ae278b875 100644
> --- a/include/linux/console.h
> +++ b/include/linux/console.h
> @@ -604,14 +604,14 @@ extern void nbcon_cpu_emergency_exit(void);
>  extern bool nbcon_can_proceed(struct nbcon_write_context *wctxt);
>  extern bool nbcon_enter_unsafe(struct nbcon_write_context *wctxt);
>  extern bool nbcon_exit_unsafe(struct nbcon_write_context *wctxt);
> -extern void nbcon_reacquire_nobuf(struct nbcon_write_context *wctxt);
> +extern bool nbcon_reacquire_nobuf(struct nbcon_write_context *wctxt);
>  #else
>  static inline void nbcon_cpu_emergency_enter(void) { }
>  static inline void nbcon_cpu_emergency_exit(void) { }
>  static inline bool nbcon_can_proceed(struct nbcon_write_context *wctxt) { return false; }
>  static inline bool nbcon_enter_unsafe(struct nbcon_write_context *wctxt) { return false; }
>  static inline bool nbcon_exit_unsafe(struct nbcon_write_context *wctxt) { return false; }
> -static inline void nbcon_reacquire_nobuf(struct nbcon_write_context *wctxt) { }
> +static inline bool nbcon_reacquire_nobuf(struct nbcon_write_context *wctxt) { }
>  #endif
>  
>  extern int console_set_on_cmdline;
> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> index fd12efcc4..ec016bb24 100644
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -909,14 +909,18 @@ EXPORT_SYMBOL_GPL(nbcon_exit_unsafe);
>   * output buffer because that has been lost. This function cannot be used to
>   * resume printing.
>   */

Please, add a comment explaining the new return value. Something
like:

 * Return:	True when the context reacquired the owner ship. The caller
 *		might try entering the unsafe state and restore the original
 *		console device setting. It just must not access the output
 *		buffer anymore.
 *
 *		False when another CPU is in panic() and a busy waiting for
 *		the ownership is not safe. It might prevent stopping this
 *		CPU and create further complications, especially on virtualized
 *		systems without proper NMI. The caller should bail out
 *		immediately without touching the console device or
 *		the output buffer.

It is very long. But I think that a good explanation might safe people
troubles in the future.

> -void nbcon_reacquire_nobuf(struct nbcon_write_context *wctxt)
> +bool nbcon_reacquire_nobuf(struct nbcon_write_context *wctxt)
>  {
>  	struct nbcon_context *ctxt = &ACCESS_PRIVATE(wctxt, ctxt);
>  
> -	while (!nbcon_context_try_acquire(ctxt))
> +	while (!nbcon_context_try_acquire(ctxt)) {
>  		cpu_relax();
> +		if (other_cpu_in_panic())
> +			return false;
> +	}
>  
>  	nbcon_write_context_set_buf(wctxt, NULL, 0);

It would make sense to set the NULL buffer even when returning "false".

> +	return true;
>  }
>  EXPORT_SYMBOL_GPL(nbcon_reacquire_nobuf);

