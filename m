Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 196FBC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 13:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4krNLYqTu5PwEOLh0tYgHTp5VBnZZoifiHQYwqKpyGI=; b=w1zXJpRiKi7KtblKbwuTpRfVOt
	HeNqxAxkOPimlvSi8bpn+D7E23LsDp3qymeU1rfZgl0/wupxW+icWIvEgTMi41H8i8+0HaC5hHt8b
	45PMr7xref+B/+yXKX8Tt0TUK50ypEBae997MO/r0BW+pcXWvWR8Ds3tQKlul33dLkDpO8zFLk/Yc
	5EvXE7hFfgkVwFKbayrKHZXCAU65UXauaE9ntHCljg2uj5ZcYvFwmc6PQShmH8LzVKj/de0gX+YAb
	GpUdFW5nqd0/w/Jy64dVlMl06rdGeecCyj9u/We/Bs9G9YBK/n7C5J1Zv5j8k3Wfu+4esbpKgWhhF
	crbo++Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMoPy-0000000DUDR-3mVz;
	Wed, 04 Jun 2025 13:44:34 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMoNs-0000000DU5g-3Ow7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 13:42:25 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a36e090102so3983534f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 06:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749044543; x=1749649343; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4krNLYqTu5PwEOLh0tYgHTp5VBnZZoifiHQYwqKpyGI=;
        b=dbDB6U0UTBUSm23fWH3KJe9rw7hvlxiFFc56huXiOJz0XzB51qElbDVLHbYkOlNXQK
         mkYNoIt1dR30U1MQveoGba6faxsMGC94cd/Hai4RDE+X7U8icICWCCDbioq1V1fWE0TN
         m4k5h4JP5yZZ9640K4S6kbPE1gBhh65P5rzIriRo6l4y3pnPwYVeMCH9yONIiHu5G1a8
         gQb6OqvjbAnK70HVJLNYCQdqqrYI3+I0nF6lXzsEMB0U8SKvn5jAH75O3T9gbAD8t1dB
         yNNQfmEUkJv3xycfqOBH0pYMIxz+mNwA4a8Hm6ojGdiubbRc6qaJm6qEG9jZVMeyH7aw
         717A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749044543; x=1749649343;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4krNLYqTu5PwEOLh0tYgHTp5VBnZZoifiHQYwqKpyGI=;
        b=Amsrv2QaUuAIPircqu7Js/7jrnl3g/nvSIXWWxiGy5hLagmfKffJ86y36mOqnzeZ8e
         1B6ZL/mJhuW6j+xEsmbWETh7mAz6j7QbKEVmKlS/Ozr402/2SjYTpj4x0gumXR2mdQju
         sWsKMw/4zo+3bC8LsXfhD4qs+ApGhMVhvrVy0nLT8AuTg5ZlgANrXyKyf/i5JgBoBUV9
         sMszaiRyCSS+XGGx7dLwYF5s2JLFYCYVb8NwREWpdorly6K4gKTJP9OI76Xtfl351wEd
         vRSVsviBVUPgCRCX5UBzGqixqc9SeiFP7/K6KlmCleG0gsl68hv/8yPhyntxiUAp4XKH
         SDbw==
X-Forwarded-Encrypted: i=1; AJvYcCXXOP/g2qWROeWTo6VRcyX1mvkHzTdg3SZVXCKaDw0w7yYnAKgGRQUSsWNqPI9TnGPuMzFSRdyP6Qh6E5dCdhfF@lists.infradead.org
X-Gm-Message-State: AOJu0YyXVkANyz58m/bM8/qLmBHH7v04wWTFKn7i9j2KMmC4pv8rKoEC
	beMJZ/I/IKtENcWdJlPqQ/sOLpgL5Cl8uzF+vrCIbAiH6DZ0iekrwa5o4KyPthxVZx4=
X-Gm-Gg: ASbGncvwRTCwVhpRur6cVeT7GsCy5bbjlPF6CIoImAY9lFVUujbqB1qXEKTudp98a0W
	OLBPrtoWiXd3NY0hqvccmjwGrgcoTC9U8zem7NA3+pcg5NqR01MaM0u8uuGIJ5lvQGM0LRf4Bd0
	IjHzmxVcl7kYhFg3CeBxYVhNtAq3tjb2zlxRWafGHI3NRCKr/8pYp8sm6roM4es2BwD39Thtk5t
	eeXUVzbpWtM7BtKbfJr5JmoptDyDAUJ1kW1zt3+YwX6u5uTomVXE4wAAwkzheEx5YW8tzHMBXzx
	XhSFSZitnNvicNPmh71ftzciZxiH6C6pjcofwyJdN1Kc0OHlCwwYSw==
X-Google-Smtp-Source: AGHT+IFBf1ks7FvkIM9/KgiSH1Nm0ceyhd9C2E9/xug+Okpyo/jMkoHYpfHI27ynqCD67VSiZ+dtUg==
X-Received: by 2002:a5d:588d:0:b0:3a4:f7dc:8a62 with SMTP id ffacd0b85a97d-3a51db2deedmr2311080f8f.0.1749044543082;
        Wed, 04 Jun 2025 06:42:23 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e32feecsm8910312a91.47.2025.06.04.06.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 06:42:22 -0700 (PDT)
Date: Wed, 4 Jun 2025 15:42:04 +0200
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
Message-ID: <aEBNLMYVUOGzusuR@pathway.suse.cz>
References: <SN6PR02MB4157A4C5E8CB219A75263A17D46DA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <OS7PR01MB13775FE1A20762D1EA4A38D0ED76DA@OS7PR01MB13775.jpnprd01.prod.outlook.com>
 <84y0u95e0j.fsf@jogness.linutronix.de>
 <84plfl5bf1.fsf@jogness.linutronix.de>
 <TY4PR01MB13777674C22721FCD8ACF4FCCD76CA@TY4PR01MB13777.jpnprd01.prod.outlook.com>
 <aEApOPTqbVOR35F_@pathway.suse.cz>
 <84o6v3ohdh.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84o6v3ohdh.fsf@jogness.linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_064224_849183_A1B23011 
X-CRM114-Status: GOOD (  23.74  )
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

On Wed 2025-06-04 13:56:34, John Ogness wrote:
> On 2025-06-04, Petr Mladek <pmladek@suse.com> wrote:
> > On Wed 2025-06-04 04:11:10, Toshiyuki Sato (Fujitsu) wrote:
> >> > On 2025-06-03, John Ogness <john.ogness@linutronix.de> wrote:
> >> > > On 2025-06-03, "Toshiyuki Sato (Fujitsu)" <fj6611ie@fujitsu.com> wrote:
> >> > >>> 4. pr_emerg() has a high logging level, and it effectively steals the console
> >> > >>> from the "pr/ttyAMA0" task, which I believe is intentional in the nbcon
> >> > design.
> >> > >>> Down in pl011_console_write_thread(), the "pr/ttyAMA0" task is doing
> >> > >>> nbcon_enter_unsafe() and nbcon_exit_unsafe() around each character
> >> > >>> that it outputs.  When pr_emerg() steals the console, nbcon_exit_unsafe()
> >> > >>> returns 0, so the "for" loop exits. pl011_console_write_thread() then
> >> > >>> enters a busy "while" loop waiting to reclaim the console. It's doing this
> >> > >>> busy "while" loop with interrupts disabled, and because of the panic,
> >> > >>> it never succeeds.
> >
> > I am a bit surprised that it never succeeds. The panic CPU takes over
> > the ownership but it releases it when the messages are flushed. And
> > the original owner should be able to reacquire it in this case.
> 
> The problem is that other_cpu_in_panic() will return true forever, which
> will cause _all_ acquires to fail forever. Originally we did allow
> non-panic to take over again after panic releases ownership. But IIRC we
> removed that capability because it allowed us to reduce a lot of
> complexity. And now nbcon_waiter_matches() relies on "Lower priorities
> are ignored during panic() until reboot."

Great catch! I forgot it. And it explains everything.

It would be nice to mention this in the commit message or
in the comment above nbcon_reacquire_nobuf().

My updated prosal of the comment is:

 * Return:	True when the context reacquired the owner ship. The caller
 *		might try entering the unsafe state and restore the original
 *		console device setting. It must not access the output buffer
 *		anymore.
 *
 *		False when another CPU is in panic(). nbcon_try_acquire()
 *		would never succeed and the infinite loop would	prevent
 *		stopping this CPU on architectures without proper NMI.
 *		The caller should bail out immediately without
 *		touching the console device or the output buffer.

Best Regards,
Petr

