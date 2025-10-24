Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA47CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 14:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JU+wnuo2Z/1XtZ6g63nPnwv0VWCw8ghGKwTmMdWFqpg=; b=RG/7wZixDwZoH97ExC88xxkZti
	qE6L0UDEw5fX/UDsOgRoJ7EObFM0bCDfooKU9Xw1OW5/X41vXlmHi63tWfd4dMMGbgZiVsaUTWdUT
	P7hIMnRz5w5wBenbgqQTqP8xq/8vk8rNF99Su4Wmaw2Z1TsQaAPXdGND3QQa0BcAu9JkvTu1/KMM4
	KReBRvxnReL680TAqJWPF8HTF6rqHw6d/VAu+HuKmRqqOMGmVot5X38BHSuEPgPx7j5oPgXPWA61r
	DJ22cL2U5C5JImYryy445Ib5+vILQGVjAWBQjGi5hTQ0YHJQF0PIqWOEsIz7Rjb58E+G1YFFzYLLf
	nnVcxq2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCJ4e-00000009hVl-2aDa;
	Fri, 24 Oct 2025 14:47:24 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCJ4c-00000009hUQ-29E1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 14:47:23 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-4270491e9easo1602696f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 07:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761317241; x=1761922041; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JU+wnuo2Z/1XtZ6g63nPnwv0VWCw8ghGKwTmMdWFqpg=;
        b=UvSky8xDQrQvkOuQ19bRryibQcuZtF9FFmn65yfaQZiIWv7FggceOuPQbQTYzNnE3W
         IYT3SZ+jBulRzPaETjcTx3bxQyxPy/BJ8gPAXlqFImJ5hrR0rrKXQK5nBlPbLNw0vK2v
         rF0xeaPI2CQFClo58rncpqJ5NRykcETYbM+nmWdfo76uJCtEtgHyFT6lwMi3EITVrva+
         clEig3Jb9ysX93VkXwOSI7KPdsdm2vObBpekZgLYA5VQGLBwSmu6skGD/g4ZP/kvhE/H
         T1a8SIp2SUSgQ941rFOyN/sgkOpODpkCIiUDXEgQ1RLErkA+0Z5joo3XmRZ49gsXj2XP
         56cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761317241; x=1761922041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JU+wnuo2Z/1XtZ6g63nPnwv0VWCw8ghGKwTmMdWFqpg=;
        b=UbGDQ/PDS7K5AgjBfC2Ok45ecUY9QGqtHC2f3rcysFhY4J6fnbbSQ5yDqO2i9VFHXU
         8ZU4+i9lMAzHL20vyGY8CB5ik7y2nd9+dm/u9tMfHfZAh6PqLkhAnOhYJzfaC90wU+oh
         juAOBC7NHnjHslzUZfw6SI0o+7ULzmSlc93sX9id1vIKd/7H6WBbVa1hM5jaBFQ6rbZg
         tEGY0u/kk8rOx5jy4EJLOAB/yNwOIQAE8vaxXvT2/XDZ5HGC1y04cQSN4ChcDiAbpdAv
         QS2qeoOgWmSE+fBAWHRHqQ80m1GcL6gA4vcHWSRTvZVAOEEvq9FaPUma8pJ0T5ILOUht
         TV0A==
X-Forwarded-Encrypted: i=1; AJvYcCVrGKuaFdN5StjTWIgUPRZQhvo3B9nKvk54ykniVq1df3O5nYOj2MTiEoWCb5vwmCe5GDqHGpLQdSF3HxcAM56g@lists.infradead.org
X-Gm-Message-State: AOJu0Yz31T/7U9MN0UvREhsm139LtNm8mHnDg/uGBVEaAn6AneZdPqRU
	RkWy3J4tvAxBmiRL4cHo+xhOYDk4K68yZgZfAmByjTljel9ycWprlZEH0tEagA==
X-Gm-Gg: ASbGncstu/XekBnyx3twNPyiE7swUrjdJsmoq7Io7BTp/lKoTkKu+qKzzgUXy5AL7nS
	WAlzsp3x1CEGjt7BLulY6YoL0B1X4DuCt9seXug6/vE2xCujLi8QRY/WrL5gUJ75qOZAjUaUMP2
	9oroZT3kbAy/oCThtky8zRRlPItPFsCz1ZySSGdLKjb0FER5Ktd7NWQqOmmu4ZNT5EcwpQk3txK
	CZXbSXWTMolgow5L3i7pEyb3jY6H1HV9BHHZ5B3HgiSPlGfhKk4N77tBwZOMWNNsFVYY9ikYB6Y
	c8JypXVpxDWM0EdygK/4WxmmphFkNpVjSHHO5oAuTArS0NL4183DQF8nw4tM7xv85BDgcoJJsTh
	WLweh6CWXAz/bZrX1AHvw0Aad4k8sfTSGbVZAO/I0GiU6D/dPOXbaXgffq41Ydvk/8GfSLN8lPU
	suk6iCq650XO/aCJANqT9Wrzrv2zLh4lCfrBQ35+K00zdyurUl/W5k
X-Google-Smtp-Source: AGHT+IHTEaO13+9fHR05oni62pNnB6SFZLHntJBdSUcQjV2Scfibpu0XNA7qJvhSpMY2WZf1fNFglQ==
X-Received: by 2002:a5d:584f:0:b0:428:52d8:9680 with SMTP id ffacd0b85a97d-42852d89820mr8617704f8f.18.1761317240510;
        Fri, 24 Oct 2025 07:47:20 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429932cbbb0sm514747f8f.35.2025.10.24.07.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 07:47:19 -0700 (PDT)
Date: Fri, 24 Oct 2025 15:47:15 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, alex@ghiti.fr,
 aou@eecs.berkeley.edu, axboe@kernel.dk, bp@alien8.de, brauner@kernel.org,
 catalin.marinas@arm.com, christophe.leroy@csgroup.eu,
 dave.hansen@linux.intel.com, edumazet@google.com, hpa@zytor.com,
 kuni1840@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mingo@redhat.com,
 mpe@ellerman.id.au, npiggin@gmail.com, palmer@dabbelt.com, pjw@kernel.org,
 tglx@linutronix.de, torvalds@linux-foundation.org, will@kernel.org,
 x86@kernel.org
Subject: Re: [PATCH v1 2/2] epoll: Use __user_write_access_begin() and
 unsafe_put_user() in epoll_put_uevent().
Message-ID: <20251024154715.577258ef@pumpkin>
In-Reply-To: <ea7552f1-842c-4bb8-b19e-0410bf18c305@intel.com>
References: <0bfa4895-727b-407b-90d2-7d54b9bd4910@intel.com>
	<20251024051653.66329-1-kuniyu@google.com>
	<ea7552f1-842c-4bb8-b19e-0410bf18c305@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_074722_569788_D7C4B657 
X-CRM114-Status: GOOD (  23.49  )
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

On Fri, 24 Oct 2025 07:05:50 -0700
Dave Hansen <dave.hansen@intel.com> wrote:

> On 10/23/25 22:16, Kuniyuki Iwashima wrote:
> >> This makes me nervous. The access_ok() check is quite a distance away.
> >> I'd kinda want to see some performance numbers before doing this. Is
> >> removing a single access_ok() even measurable?  
> > I noticed I made a typo in commit message, s/tcp_rr/udp_rr/.
> > 
> > epoll_put_uevent() can be called multiple times in a single
> > epoll_wait(), and we can see 1.7% more pps on UDP even when
> > 1 thread has 1000 sockets only:
> > 
> > server: $ udp_rr --nolog -6 -F 1000 -T 1 -l 3600
> > client: $ udp_rr --nolog -6 -F 1000 -T 256 -l 3600 -c -H $SERVER
> > server: $ nstat > /dev/null; sleep 10; nstat | grep -i udp
> > 
> > Without patch (2 stac/clac):
> > Udp6InDatagrams                 2205209            0.0
> > 
> > With patch (1 stac/clac):
> > Udp6InDatagrams                 2242602            0.0  
> 
> I'm totally with you about removing a stac/clac:
> 
> 	https://lore.kernel.org/lkml/20250228203722.CAEB63AC@davehans-spike.ostc.intel.com/
> 
> The thing I'm worried about is having the access_ok() so distant
> from the unsafe_put_user(). I'm wondering if this:
> 
> -	__user_write_access_begin(uevent, sizeof(*uevent));
> +	if (!user_write_access_begin(uevent, sizeof(*uevent))
> +		return NULL;
> 	unsafe_put_user(revents, &uevent->events, efault);
> 	unsafe_put_user(data, &uevent->data, efault);
> 	user_access_end();
> 
> is measurably slower than what was in your series. If it is
> not measurably slower, then the series gets simpler because it
> does not need to refactor user_write_access_begin(). It also ends
> up more obviously correct because the access check is closer to
> the unsafe_put_user() calls.
> 
> Also, the extra access_ok() is *much* cheaper than stac/clac.

access_ok() does contain a conditional branch
- just waiting for the misprediction penalty (say 20 clocks).
OTOH you shouldn't get that more that twice for the loop.

I'm pretty sure access_ok() itself contains an lfence - needed for reads.
But that ought to be absent from user_write_access_begin().

The 'masked' version uses alu operations (on x86-64) and don't need
lfence (or anything else) and don't contain a mispredictable branch.
They should be faster than the above - unless the code has serious
register pressure and too much gets spilled to stack.

The timings may also depend on the cpu you are using.
I'm sure I remember some of the very recent ones having much faster
stac/clac and/or lfence.

	David

> 


