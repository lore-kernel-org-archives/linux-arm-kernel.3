Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4ECCFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 10:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WSoUc9eXKj28dLovTJJzuv8gw1Sz+Xl88pkdspKf/1M=; b=wuK9TQLRh0QFgrI3504FHX99ZN
	sC8D8SBogUzApqEORzuMBLkLARuPVALIxBknG/no5eo5Y+c6VW1g75/GY+rl37F74ENAkHu1t71NN
	rcV5QdHr5ue/aNjFJRYcm2x2rPPEo0Opxt4jAC2BbhJKsWYJ/W2rmdOpF4fdDgYFdp98v8nxPxvJc
	Nvde1/3i4DRKHmMqELNecbJ+ag0iP50zczSI6DKNobFo1UBinzmZDXb+pHeBNhTWXFUe50+YVPv2C
	DuqYuTZKEWw8t7UO2jfM4HVqwBc1FrAqwm9eER5ccKm+hob1EUysQTvN255VKQnwws6R3GFR1idQ5
	3KwOKIQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQNiC-00000005GRO-2J3G;
	Tue, 02 Dec 2025 10:34:24 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQNi9-00000005GQW-2T0o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 10:34:22 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-477b91680f8so47611585e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 02:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764671659; x=1765276459; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WSoUc9eXKj28dLovTJJzuv8gw1Sz+Xl88pkdspKf/1M=;
        b=UKy/WICO+74hU864pQMuJbBT+VVHL4L9KiS8uAO96fyqG/oIlzr021mPKLX9BWwlx8
         MbEMllWa/9tOsW0TQSW1jXdywqVU7Eucx+289HfUyZueZnNJ+E18psvUJW1hVHFhp4A2
         nIKJVFJovAjCl9cU5ClLSc6D+FagOzpN+B5vs9QPc676okkIgukVZIN3SquIXwTsvSxI
         OZKProOFzyMtrv9wH2DzyQJNW0JhTsYu53OCoEOLEztp7ALLtTf+VV62mkpPxbf9tF5H
         Cw5h13aCska2AtKL3SKEN4Tk1uuidrpLCNbgSfY7Y2YW3Q8kQ1ta5Kqmsv9wWcnvp0Bt
         7Kpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764671659; x=1765276459;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WSoUc9eXKj28dLovTJJzuv8gw1Sz+Xl88pkdspKf/1M=;
        b=jIxDiIWqxuWv3aQUrreyCrk96LPs58e1+meJ2/AYdrqEaPjzECyVWmofAoRRAXcD5J
         yeEGI68b5MZlveIRgHXaWU+TbyyunDYAc6m+qpHAM/+JWwelfZ2uX+tIg8Pwk2RMfel2
         1MDOwP+6gfBpohAf31dpdh+WTG0Yi9oqyIQp0UaDl3gwVRIghv0hcfCFqN2MAl2CyOFZ
         YzNwqLy/7U44cIMg5NFhVGkiK8tsT3IPaXya0eWNeBrO/NzuaYftUvUMbElaN7kLJ/ua
         jCf8H4yx91q99M6HWA9RRjWAIKu6hZbtL9cIt2Z4nmFnJbAX6/Kd9mMnkBCGftRBIZhU
         OFLA==
X-Forwarded-Encrypted: i=1; AJvYcCUDpqBPjHWMEIiuXrAw4bVmW/TwyKVrYD99WPKsOgIXtSDreAMhsld3IVyNkj+DTjO7+GnnohDCkgtEkhVJsKW+@lists.infradead.org
X-Gm-Message-State: AOJu0YwAk1WXosGTsATsXr/aVGTgQQrlpSpN9oMo7s9WQ2R24kS0uvHp
	QdnoC88gIgJBXlo+Xo7nty1a4yqXt8ggYzOeYi4sjYfofg3zLLP7oIG7HHn8DjPwUrE=
X-Gm-Gg: ASbGncv19kJ5ipFhxKFmqoq7OMaohp+TFLtyIGFMzowrKzjtMuHvYYIIg7a1iMokcA+
	o5ikyRUW8Gujhqm/GifDwBVymPc7LSEK5l63+5zrtl4Qfe8Ia+sJDMD7DMEPYcPW+wsdH61OvMg
	nE2KASzshZLWMPfKigmrbRTx+Fy1D00E+DrhlUt19AQDMOmegRZfunAc5XBdNHOjp6wh+Flr3vY
	j4bUQAoQ7IPkJkJ1Q9gNh0lNnwJBsuNxgWjZGBOPNMlnbR8ik4rD5pCfRoeIK0Wf+f1UOqyIxWh
	w0d4QZpciCag/iXxcnhMqUbG/czq/oQSe4beoPAVkinnmzufl9t9IupqSYWctItvAM1N5z5qF4V
	FwI7ywSzK6jotTZINVSQt7HHyvJytpJzl66L+vUl1rmv7hLCytsysoFFXH9WKGe0Tr/0BhznZ0K
	iq+w12qdOKfHJ79g==
X-Google-Smtp-Source: AGHT+IGbpka828FERUZav1n2Fjj4tJ15j7Syx7WwdflVn1Se46VoLOy2vA2Eeq1tNjGmfsFWL8W1rA==
X-Received: by 2002:a05:600c:4591:b0:477:b642:9dbf with SMTP id 5b1f17b1804b1-477c1132adbmr410647675e9.32.1764671659029;
        Tue, 02 Dec 2025 02:34:19 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790b0e21e8sm376689015e9.15.2025.12.02.02.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 02:34:18 -0800 (PST)
Date: Tue, 2 Dec 2025 11:34:15 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Breno Leitao <leitao@debian.org>, linux@armlinux.org.uk,
	paulmck@kernel.org, usamaarif642@gmail.com, leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com, rmikey@meta.com
Subject: Re: CSD lockup during kexec due to unbounded busy-wait in
 pl011_console_write_atomic (arm64)
Message-ID: <aS7ApzJG8RPhtKh5@pathway.suse.cz>
References: <sqwajvt7utnt463tzxgwu2yctyn5m6bjwrslsnupfexeml6hkd@v6sqmpbu3vvu>
 <aSnI8UQRNICSKxAb@pathway.suse.cz>
 <87ecpefjee.fsf@jogness.linutronix.de>
 <87bjkificj.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bjkificj.fsf@jogness.linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_023421_644731_DE3599F7 
X-CRM114-Status: GOOD (  22.78  )
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

On Mon 2025-12-01 14:27:32, John Ogness wrote:
> On 2025-12-01, John Ogness <john.ogness@linutronix.de> wrote:
> >> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> >> index 3fa403f9831f..6b8becb6ecd9 100644
> >> --- a/kernel/printk/nbcon.c
> >> +++ b/kernel/printk/nbcon.c
> >> @@ -1549,6 +1549,7 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
> >>  {
> >>  	struct nbcon_write_context wctxt = { };
> >>  	struct nbcon_context *ctxt = &ACCESS_PRIVATE(&wctxt, ctxt);
> >> +	unsigned long flags;
> >>  	int err = 0;
> >>  
> >>  	ctxt->console			= con;
> >> @@ -1557,18 +1558,31 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
> >>  	ctxt->allow_unsafe_takeover	= nbcon_allow_unsafe_takeover();
> >>  
> >>  	while (nbcon_seq_read(con) < stop_seq) {
> >> -		if (!nbcon_context_try_acquire(ctxt, false))
> >> +		/*
> >> +		 * Atomic flushing does not use console driver synchronization
> >> +		 * (i.e. it does not hold the port lock for uart consoles).
> >> +		 * Therefore IRQs must be disabled to avoid being interrupted
> >> +		 * and then calling into a driver that will deadlock trying
> >> +		 * to acquire console ownership.
> >> +		 */
> >> +		local_irq_save(flags);
> >> +		if (!nbcon_context_try_acquire(ctxt, false)) {
> >> +			local_irq_restore(flags);
> >>  			return -EPERM;
> >> +		}
> >>  
> >>  		/*
> >>  		 * nbcon_emit_next_record() returns false when the console was
> >>  		 * handed over or taken over. In both cases the context is no
> >>  		 * longer valid.
> >>  		 */
> >> -		if (!nbcon_emit_next_record(&wctxt, true))
> >> +		if (!nbcon_emit_next_record(&wctxt, true)) {
> >> +			local_irq_restore(flags);
> >>  			return -EAGAIN;
> >> +		}
> >>  
> >>  		nbcon_context_release(ctxt);
> >> +		local_irq_restore(flags);
> >
> > Using local_irq_save()/_restore() here is not acceptable for PREEMPT_RT
> > because __nbcon_atomic_flush_pending_con() is also used by
> > nbcon_device_release().

Great catch! I did not think about this code path.

> After thinking about this more, this would be acceptable. If
> printk_get_console_flush_type() is reporting nbcon_atomic==true, then
> the system is in a state where latencies are irrelevant.

I agree. It might be possible to create a special variant for
the nbcon_device_release() code path. But it probably is not
worth it.

I am going to mention this in the commit message and send
it as proper patch.

Thanks a lot for review and feedback.

Best Regards,
Petr

