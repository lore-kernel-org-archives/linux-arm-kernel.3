Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A283C5B555
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 14:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ePCtVwEHPRZGVKonS4M/PMlbdUQqiCFtEzUovEubhs=; b=484q+QReZNXuT0mJIvEDhZkV+P
	jsBCv6BBwdXGpuZtvl67miiF/jUFbti9W+hLP9OrgqEGzG9d6xf/spE7WG1kozPgbR0/QAS1LNGfy
	CSQd31sh5vXCAeGUUl4GzsWFRSJJ2jMxGgvvMoqmB8udg1HZSJUWtnMcFbpTiNh2wKrQ6VpCza8MA
	ZOmr1FiA2GiL4RPA02O6k1Z9og+dBVbYIjgi6KaPNuPE80+MHF/Dn8L40ZdLkcMRj18Wm423/2mQn
	tGWXbsMHGgKhz6dRAbzaiYASH/86Uaq9jQhPKhhngFLskEPYlNYOvlLVQ+1U86UvrcerXLEy5wVXg
	dLyCzigA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNXgJ-00000000Osl-0ndH;
	Fri, 06 Jun 2025 14:04:27 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNXdg-00000000OgY-0Sci
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 14:01:45 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-553543ddfc7so2236594e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Jun 2025 07:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749218501; x=1749823301; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4ePCtVwEHPRZGVKonS4M/PMlbdUQqiCFtEzUovEubhs=;
        b=AAYGdpKdqv1Q+yxjnxCsezy4SedskencITetBNZaJWCjtsXnLI40pPe5tg3OHtRRyo
         tn/Quz74p1bcfD18lJaoXXFdUACYckTYI3h2MKYRwcCbTUGq7co1tx93u9Ahe8UFWOKh
         stkX/S1QZCR6qL2lgN1yMs4ZJaHKnAYR3BKrpzGcxVR+6r49XOz/UaIbmU7jMKATQND/
         qlo2Oo0rncZlxOvb61clnEfdj+RQqkWiTZQ19KPzmd5WLhxHJc/f7MC9UpAvWdKH/uue
         zrg9fR2IJ4ghVUXSo+ndENjD/ousYuGgRF1SCneMfH09UnICD23fufIXl3kofNizZsmI
         yzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749218501; x=1749823301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ePCtVwEHPRZGVKonS4M/PMlbdUQqiCFtEzUovEubhs=;
        b=MYl1ZULPqaoBvnGZFwwAkp5G3+Ot0RqFbgzr00XkLXW9fK/SqT3xca0aRL1FUg1R/l
         a47131QprekvoMTBEu4rqEhe37WnW964xrOpQDlnJVL3WtxyX7qyQP+pcUIkQGndh9mE
         x2Ma9sU6YHibk7tGVbyij5Mrc4PxX7kWBl6ZVZackVM390nJ56BY2PR9dOncwrTN/+0Q
         vUd0ToD3T8N2zh1Ynucc3WEScV7q0WNRBawwIWDzDiW9KYzwgQZxsvEB/jpTVMdMJaRm
         Q96onyZt09TZY48uJ6fa4Q8PUkpcbwgEQTWpkNZMe5ivCYHWeaQZY3Ry1e7ZktglViSJ
         BnJw==
X-Forwarded-Encrypted: i=1; AJvYcCUJRWxZS82dzWBGqq4uiFsv7IFGVZGNXBPf/DaBA3llQnpvfeJQW8Ot2kRnkr5Bp6RVeuzhs4PL5SBcUBV+IuPd@lists.infradead.org
X-Gm-Message-State: AOJu0YyHp8a9XUj0j6502CIB6Jf9zOlLtUjD89PEr/WXRFczVYW1f33f
	qO+Ti8bdnLfrfyPE7Ekftk90mHANChNSVdYO8yaJfUz8OKZDCMRZ4atLF/8Tm7Q2ubY=
X-Gm-Gg: ASbGncus+SdM9jsnqtmghh9YYNn2yeSv0OaIdwRj23ailzJmnLvUViKfGx9qp4DiauM
	J/CR6GksNq6xb3RVTXt3zhxUMJIRiQclK8aZQyKdi75iud58l1x5wFNCkOkz3BncIOYUfzX0JO7
	BJ2TMqrVsQRAU7JAdX0EkOyAFOqXtXacTlkVlw10G2/wFq6uk//5uYbIYvwS6Q+bhScmOa6QEZK
	8g4pZWU+XkcteIwTK/+LmkH1zzUPbxn5bGvf3uEwHvD3/7Zstk9g4SDQZJRyiLIxF1mbfQcqFhL
	BE3I9tWCPg9tn2isCpxM7djgMVP8s3mSogCB/Gd1tHifczR5xzeQ+Q==
X-Google-Smtp-Source: AGHT+IHwM29hXAlfVn1/kynbfpVzyXzOWId8Hf038RYt/WmxD1MOmRXvKQf7F3Df+vqxxDdGzL3yVQ==
X-Received: by 2002:a05:6512:39c4:b0:553:65bc:4243 with SMTP id 2adb3069b0e04-55366be6eddmr1129183e87.16.1749218499894;
        Fri, 06 Jun 2025 07:01:39 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034065edsm12491225ad.185.2025.06.06.07.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 07:01:39 -0700 (PDT)
Date: Fri, 6 Jun 2025 16:01:25 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: "Toshiyuki Sato (Fujitsu)" <fj6611ie@fujitsu.com>,
	'Michael Kelley' <mhklinux@outlook.com>,
	'Ryo Takakura' <ryotkkr98@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: Problem with nbcon console and amba-pl011 serial port
Message-ID: <aEL0tZgSEhsR9qbf@pathway.suse.cz>
References: <OS7PR01MB13775FE1A20762D1EA4A38D0ED76DA@OS7PR01MB13775.jpnprd01.prod.outlook.com>
 <84y0u95e0j.fsf@jogness.linutronix.de>
 <84plfl5bf1.fsf@jogness.linutronix.de>
 <TY4PR01MB13777674C22721FCD8ACF4FCCD76CA@TY4PR01MB13777.jpnprd01.prod.outlook.com>
 <aEApOPTqbVOR35F_@pathway.suse.cz>
 <84o6v3ohdh.fsf@jogness.linutronix.de>
 <aEBNLMYVUOGzusuR@pathway.suse.cz>
 <TY4PR01MB13777CC92C858572B9C19394FD76FA@TY4PR01MB13777.jpnprd01.prod.outlook.com>
 <aEGeARVcCwqcoHb8@pathway.suse.cz>
 <84frgdcgug.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84frgdcgug.fsf@jogness.linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_070144_155349_CE9250CA 
X-CRM114-Status: GOOD (  32.21  )
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

On Fri 2025-06-06 12:25:35, John Ogness wrote:
> On 2025-06-05, Petr Mladek <pmladek@suse.com> wrote:
> > The question is if it is worth it. Is the clean up really important?
> 
> I must admit that I am not happy about encouraging the proposed solution
> so far

I am not super happy either. But let me play the devil advocate
for a bit longer ;-)

> (i.e. expecting driver authors to create special unsafe code in
> the panic situation).

The "usafe code" sounds too strong to me. The console driver is
supposed to "do nothing" and just leave when nbcon_reacquire() fails.


> It leads down the "hope and pray" path that nbcon
> was designed to fix.

My understanding is that we "hope and pray" to show the messages
on the console. And it should work because the ownership was
lost only in a safe state.

If the ownership was lost in the unsafe state then it might
be even bigger gamble to do anything in parallel.

Of course, another panic priority is to provide a crash dump
or reboot. But it hopefully should not depend on a console
driver clean up.

> What if during non-panic-CPU shutdown, we allow reacquires to succeed
> only for _direct_ acquires? The below diff shows how this could be
> implemented. Since it only supports direct acquires, it does not violate
> any state rules. And also, since it only involves the reacquire, there
> is no ugly battling for console printing between the panic and non-panic
> CPUs.

Interesting idea. I thought a lot about it, see below.


> diff --git a/include/linux/printk.h b/include/linux/printk.h
> index 5b462029d03c1..d58ebdc8170b3 100644
> --- a/include/linux/printk.h
> +++ b/include/linux/printk.h
> diff --git a/kernel/panic.c b/kernel/panic.c
> index b0b9a8bf4560d..8f572630c9f7e 100644
> --- a/kernel/panic.c
> +++ b/kernel/panic.c
> @@ -304,6 +310,8 @@ static void panic_other_cpus_shutdown(bool crash_kexec)
>  		smp_send_stop();
>  	else
>  		crash_smp_send_stop();
> +
> +	nbcon_panic_allow_reacquire_set(false);
>  }

I have two concerns here:

1. I wonder whether this is reliable enough. It seems that
   smp_send_stop() waits at least 1 sec until the CPUs
   get stopped. But is this enough on virtualized systems?

2. It might increase a risk when CPUs are stopped using NMI.
   The change would allow a non-panic CPU to reacquire the ownership
   and enter _unsafe_ section right before being stopped by NMI.


The 1st problem might be avoided by allowing the reacquire all
the time unless an "unsafe" takeover happened.

The 2nd problem is worse. But allowing the reacquire all the time
might actually help as well.

Note that the information about the "unsafe_takeover" is stored
in struct console so that we even won't need a new global
variable.


>  /**
> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> index d60596777d278..d960cb8a05558 100644
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -235,7 +235,8 @@ static void nbcon_seq_try_update(struct nbcon_context *ctxt, u64 new_seq)
>   *			the handover acquire method.
>   */
>  static int nbcon_context_try_acquire_direct(struct nbcon_context *ctxt,
> -					    struct nbcon_state *cur)
> +					    struct nbcon_state *cur,
> +					    bool ignore_other_cpu_in_panic)
>  {
>  	unsigned int cpu = smp_processor_id();
>  	struct console *con = ctxt->console;
> @@ -249,7 +250,7 @@ static int nbcon_context_try_acquire_direct(struct nbcon_context *ctxt,
>  		 * nbcon_waiter_matches(). In particular, the assumption that
>  		 * lower priorities are ignored during panic.
>  		 */
> -		if (other_cpu_in_panic())
> +		if (other_cpu_in_panic() && !ignore_other_cpu_in_panic)

If you agree with allowing the reacquire all the time then I would
rename the parameter to @is_reacquire and do something like:

	if (other_cpu_in_panic() &&
	   (!is_reacquire || cur->unsafe_takeover))

>  			return -EPERM;
>  
>  		if (ctxt->prio <= cur->prio || ctxt->prio <= cur->req_prio)
> @@ -913,7 +920,7 @@ void nbcon_reacquire_nobuf(struct nbcon_write_context *wctxt)
>  {
>  	struct nbcon_context *ctxt = &ACCESS_PRIVATE(wctxt, ctxt);
>  
> -	while (!nbcon_context_try_acquire(ctxt))
> +	while (!nbcon_context_try_acquire(ctxt, READ_ONCE(nbcon_panic_allow_reacquire)))

And here it would be:

	while (!nbcon_context_try_acquire(ctxt, true))

>  		cpu_relax();
>  
>  	nbcon_write_context_set_buf(wctxt, NULL, 0);


Summary:

I open to give this alternative approach a chance when we allow the
reacquire all the time. It might work well. And it won't require
any special "panic" handling in all console drivers.

Best Regards,
Petr

