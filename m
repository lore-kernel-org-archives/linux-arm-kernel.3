Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8F3C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 14:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bP6Mi+TCFYvRv9eQrxJhAmd4okSErfMO0PNQOu+BxFA=; b=4KNNUpB8zH8Z4Ds3a55CVTU1ZT
	aXgyYBfa/drcd+8K28zpkf5FEc1A1Z88sFz7Z3KvLLmtjlfmpCMmHOECk0FbAEAOfExJf4VIs/9S+
	3MQnI6quoOeraJ1cHkf+EczOWJJ5Igkiu2k+WVQENPftqGDkZSFF5KAG/0LQJ+fYa+NY7wreypQTi
	BQdMrK8KPhJvD/8F0b/qII7VlV5lBbugYuApF9rudKQk/dxYZrVZfNoNM/7j7iW40jOvSGeBS65Sl
	sozv3jjNvkCdQfXE1nvMdPRQlC7+NGAhlMJ/3tNX+bkqAvgHnHKD48xJeVMXQxmGRi5O2B0RuX5V0
	jiuE4bqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNBCt-0000000Fj4b-1OMb;
	Thu, 05 Jun 2025 14:04:35 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNAp8-0000000Fftd-31dY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 13:40:03 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so11323775e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 06:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749130800; x=1749735600; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bP6Mi+TCFYvRv9eQrxJhAmd4okSErfMO0PNQOu+BxFA=;
        b=FTIhRNj3HfQP2Xy9FpXkFNPLyMxSEXITjZGHiPNcKBY9OgKHYZmsMC+jW7aOxya2Ta
         M/w0/UG3ATkBuFOM25rv80qG9/ybXQICxnSxq5Z4IfL1O73urSKYljCZ6sZbKrKAB2Fc
         T9hJWnAiG4yIXVTYdFbK1Wg3GyJZEYFGkO745KwiFTMw+cdp5OP7qv6MGmeSVcVIWdMN
         084HJnd64L/Yyk33/3wV6Sn9Zf1fEKvCf+rm+NEUdCg+/XUb/xhd/24T1WjvW3nxciQq
         5g3riuTT1oHGmvmrtx7g0OYMsvtxmnwInYL04Qg4EwBh+C4DciSzY3OwgXa8IFfnFdoS
         elKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749130800; x=1749735600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bP6Mi+TCFYvRv9eQrxJhAmd4okSErfMO0PNQOu+BxFA=;
        b=U4ROsIhLrC4/9PHC6aFGqtABM2L/IeuHab2ZQUyWq1lb6uNSMrZ7BqdFkQJmn1Uc4y
         NOu5adN4Ge9yOGOyL4LVfQd8mSb79wAmJ1sz7+Qk0N7WU/vF+lLq3MmDxubKIffGH+Ir
         xFFgNhIc/4CrXpWW1/6tj32uxZz3+ZWPJQIzknLpEYPW7WDACzqAkkqjLZG6aLIRS4m7
         ywqiOZIr8b9nMPmoaXrmIxGjxBPrMMQOnhLaP+pYnN1eOYmqU+8ai1HVvHBs/l9FjMVL
         hQWRTYF4nHXuZ1PIheLKwl03Tf6TRcpR3oBqBfw9PxzjnRUw7yGIrRXa/PjCueSrTVFo
         glNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJyNAJABBHPaCQS1Qsggjht5NjStNiRtII4PYCRhkvZEwIFmhTO0hSvuPDIgan4+v3rDdFiZU95k/VQFEw7gWv@lists.infradead.org
X-Gm-Message-State: AOJu0YzMt/ZGidGYmG669POv/d29K56OPH1AHlZ3MAvhwEUOmPrUXo+Z
	Ugv6FM066hZLZtSPLzKruI0k+C7QlBlxl2NofGGsrwZGfDD94idPMv9pRWYre7mR7A4=
X-Gm-Gg: ASbGncufYNhgAeDOIOQHt89ofc2PVY4Y9VeH0fxq0sTlCAWIkVV1XAlvc4QWlVV/Stj
	RfWJuRhC/e6bUxcEgamvOxrJ9X8g/rO9CJjOhuJe3aLY8Mod9koexsKqHgv9ycNvCURuD/BgnNd
	rlb5sSmYVcf3LtM880+JQv8Ic2bwE69CKC6Q9OVWpnnAugQw/ytMgl1qZRmza+ETCHVc1/4RUTX
	z8vQz0UoCDZGFaImNOrLstSj7TGYa4OiO1QWMEaYLy8lH5gHZrgDIz6oIMwTkHCShyyxu/qwHgu
	WxnIG4jO6UXVK/DMWzvH9Cvt0aRcUkmnEi9BQJO25xdvbt1FlyeeQg==
X-Google-Smtp-Source: AGHT+IF2c7EYFNH2h0X+wzdkc9uuWQqPvDA2Db1Nws8D8+Y3I4ZjFHdE9Ad1uXCt0IcsZXEKXBgWxg==
X-Received: by 2002:a05:6000:26d2:b0:3a4:fc37:70f5 with SMTP id ffacd0b85a97d-3a51d97663dmr5364280f8f.58.1749130800462;
        Thu, 05 Jun 2025 06:40:00 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bc8b26sm119087735ad.9.2025.06.05.06.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 06:39:59 -0700 (PDT)
Date: Thu, 5 Jun 2025 15:39:44 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Toshiyuki Sato (Fujitsu)" <fj6611ie@fujitsu.com>
Cc: John Ogness <john.ogness@linutronix.de>,
	'Michael Kelley' <mhklinux@outlook.com>,
	'Ryo Takakura' <ryotkkr98@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: Problem with nbcon console and amba-pl011 serial port
Message-ID: <aEGeARVcCwqcoHb8@pathway.suse.cz>
References: <SN6PR02MB4157A4C5E8CB219A75263A17D46DA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <OS7PR01MB13775FE1A20762D1EA4A38D0ED76DA@OS7PR01MB13775.jpnprd01.prod.outlook.com>
 <84y0u95e0j.fsf@jogness.linutronix.de>
 <84plfl5bf1.fsf@jogness.linutronix.de>
 <TY4PR01MB13777674C22721FCD8ACF4FCCD76CA@TY4PR01MB13777.jpnprd01.prod.outlook.com>
 <aEApOPTqbVOR35F_@pathway.suse.cz>
 <84o6v3ohdh.fsf@jogness.linutronix.de>
 <aEBNLMYVUOGzusuR@pathway.suse.cz>
 <TY4PR01MB13777CC92C858572B9C19394FD76FA@TY4PR01MB13777.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY4PR01MB13777CC92C858572B9C19394FD76FA@TY4PR01MB13777.jpnprd01.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_064002_768341_31BCC655 
X-CRM114-Status: GOOD (  42.66  )
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

On Thu 2025-06-05 05:27:56, Toshiyuki Sato (Fujitsu) wrote:
> Hi John and Petr,
> 
> > On Wed 2025-06-04 13:56:34, John Ogness wrote:
> > > On 2025-06-04, Petr Mladek <pmladek@suse.com> wrote:
> > > > On Wed 2025-06-04 04:11:10, Toshiyuki Sato (Fujitsu) wrote:
> > > >> > On 2025-06-03, John Ogness <john.ogness@linutronix.de> wrote:
> > > >> > > On 2025-06-03, "Toshiyuki Sato (Fujitsu)" <fj6611ie@fujitsu.com> wrote:
> > > >> > >>> 4. pr_emerg() has a high logging level, and it effectively steals the console
> > > >> > >>> from the "pr/ttyAMA0" task, which I believe is intentional in the nbcon
> > > >> > design.
> > > >> > >>> Down in pl011_console_write_thread(), the "pr/ttyAMA0" task is doing
> > > >> > >>> nbcon_enter_unsafe() and nbcon_exit_unsafe() around each character
> > > >> > >>> that it outputs.  When pr_emerg() steals the console, nbcon_exit_unsafe()
> > > >> > >>> returns 0, so the "for" loop exits. pl011_console_write_thread() then
> > > >> > >>> enters a busy "while" loop waiting to reclaim the console. It's doing this
> > > >> > >>> busy "while" loop with interrupts disabled, and because of the panic,
> > > >> > >>> it never succeeds.
> > > >
> > > > I am a bit surprised that it never succeeds. The panic CPU takes over
> > > > the ownership but it releases it when the messages are flushed. And
> > > > the original owner should be able to reacquire it in this case.
> > >
> > > The problem is that other_cpu_in_panic() will return true forever, which
> > > will cause _all_ acquires to fail forever. Originally we did allow
> > > non-panic to take over again after panic releases ownership. But IIRC we
> > > removed that capability because it allowed us to reduce a lot of
> > > complexity. And now nbcon_waiter_matches() relies on "Lower priorities
> > > are ignored during panic() until reboot."
> > 
> > Great catch! I forgot it. And it explains everything.
> > 
> > It would be nice to mention this in the commit message or
> > in the comment above nbcon_reacquire_nobuf().
> > 
> > My updated prosal of the comment is:
> > 
> >  * Return:	True when the context reacquired the owner ship. The caller
> >  *		might try entering the unsafe state and restore the original
> >  *		console device setting. It must not access the output buffer
> >  *		anymore.
> >  *
> >  *		False when another CPU is in panic(). nbcon_try_acquire()
> >  *		would never succeed and the infinite loop would	prevent
> >  *		stopping this CPU on architectures without proper NMI.
> >  *		The caller should bail out immediately without
> >  *		touching the console device or the output buffer.
> > 
> > Best Regards,
> > Petr
> 
> Thank you for your comments and suggestions.
> 
> After consideration, 
> I believe that there is no problem with forcibly terminating the process when 
> nbcon_reacquire_nobuf returns false at the pl011 driver level, 
> as in the test patch.
> 
> It feels a bit harsh that a thread which started processing before the panic
> and then transferred ownership to an atomic operation isn't allowed to perform
> cleanup during panic handling or the grace period before the CPU halts.
> 
> I would like to hear your opinion on this.
> If nbcon_reacquire_nobuf() could acquire ownership even after the panic, 
> then driver-side modifications might not be necessary. 
> (The responsibility to complete the process without hindering the panic process
> would still remain.)
> 
> Would it be difficult to make an exception to the rule,
>   "Lower priorities are ignored during panic() until reboot,"
> depending on the situation?

Good question.

The following two problems came to my mind:

1. As John, pointed out, the fact that non-panic CPUs are not
   able to acquire the context allowed to simplify the implementation.

   I think that it is primary about nbcon_waiter_matches(),
   nbcon_owner_matches(), and the related logic. It was documented by
   the commit 8c9dab2c55ad7 ("printk: nbcon: Clarify rules of
   the owner/waiter matching").

   But it seems that nbcon_owner_matches() is safe even without the rule.
   The race is prevented either by disabling interrupts and preemption
   or by taking device_lock().

   The rule prevents a race in nbcon_waiter_matches(). But it seems
   that in the worst case, more CPUs might end up busy waiting.
   And it would be acceptable during panic().

   So, this need not be a big problem in the end.


2. If we allowed non-panic() CPUs to acquire the ownership, it would
   increase the risk that the panic CPU will not be able to
   flush the messages.

   But maybe, the problem is only when the architecture supports
   proper NMI and non-panic CPUs might be stopped anywhere.

   It should be less problem on architectures without proper NMI
   where the non-panic CPU could not be stopped in the problematic
   situation.

   So, maybe, we could relax the rule on architectures without
   proper NMI.


The question is if it is worth it. Is the clean up really important?

Note that the clean up will never be guaranteed on architectures with
a proper NMI. They would stop the non-panic CPUs, including the printk
kthread, anywhere.

And I guess that the console devices will be initialized after the
reboot anyway.

Best Regards,
Petr

