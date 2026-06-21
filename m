Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD796CD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 12:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WU+6TPSMrQeQnOmPDKoUDmLIYSzXbxEWNqGQFFhaaZU=; b=QqqW0X3D9ngc8ZLNiDnE/Rmreb
	57SWhyBgL9VjC07tFlycVFgC6/4vqPYShTSDyjc0qsplxq6PXkDNQ0VEl47uge3sy7XPNgup3CDru
	ip3wU+sVe3jhCVZt41hrtk0DdnZkg/R7VSHBPkNboLAaSwxhoTAuljlhFxW2UGyceM8xe0RaHDpfY
	vXM+kHIRvT9YCeCUyhOBrHBFYlCb3U6gsAh87WWffvRvSB7nGWWEnvB2DfIuzqYW8OvmR4O1QQ+8f
	RuCv2wRNaef3dw+9h6BxbujnyIC+N+Kw+CphEy5IoMihvOxFduH3R+V9oOSopwxQVavF8WmHDcJCx
	D9lDCGew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbHi6-00000003wKL-33w4;
	Sun, 21 Jun 2026 12:55:38 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbHi4-00000003wJz-3BcH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Jun 2026 12:55:37 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-4629051c9d1so2433818f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Jun 2026 05:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782046534; x=1782651334; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WU+6TPSMrQeQnOmPDKoUDmLIYSzXbxEWNqGQFFhaaZU=;
        b=FP0WSBhxWyhKao1lB+4kjFKEBIjmV8Lm2rPIVD66LeFGoDoF8nRUq8XV9rli89XVkG
         KHBfW8pnW1t7yqxlp6bOc4+o793E9d9OWx17YXZuSopNjrV5q4ebqMCK5u6hXFJIS1p2
         DYHg8TyG44dpUNmsUDoJPxTfPSat+QpeY08BXFRKoOv1RImav1hEzBhGPIlAghgjkThb
         P+sYyh0IvswuNlTrDPUAPVvI323Q+82mNpUuL2fxYnuMJ9Md6BKQ9EyJ7PNCJRso/WD0
         hchA+TfWKBt5FyUIWBum3NCUygHbX7T4x7WfUUl1kNmXYdP4ZNNcyAu0L1T6eM0UWgDN
         CX0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782046534; x=1782651334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WU+6TPSMrQeQnOmPDKoUDmLIYSzXbxEWNqGQFFhaaZU=;
        b=n2qidVurb7IPdfLoE+0L9+0waswyN828b506sYIRn7gbLxeeVwzehfPnYgS/QTceDh
         BMzp2Mnojh+BRPuJRdB/kQTaB2t9MWnQmk8z5z9h0F/i6CaPJB+t88zSHFq4k56T8VuG
         zCPjxSlMQxag+Y/PHJZPkzpqcc1fAwwdzW/RWXpMwIh3VyBzs956X519szK6resvNqAN
         CYApypoRzZ2fwDD0uEQY2RSwSSBf3s1v5Icou84zg5Fzs5KWBkoJEq5R2XJeCBPd5883
         dmQiqQeehdWsxSrwQSiFfJe3mnMxEjMBSRKvkzuCBihgehBkBzeoDXYUNsHDc0xQ+aQo
         MKPw==
X-Forwarded-Encrypted: i=1; AFNElJ85ooN7Vzm4DG2zb8oWE9RSKoXYBcL5TwR7dbwDPPq5PT20pn3/BKPnXNTntuQWfl69iA0uBdvOrHg2u/MMjZ8D@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9tcTNAFXzohgJF4WgQhPaHC6Lb6hURRBuw4Rf4pMmf4gpHdCe
	B5K4LCyMFRqkUvYCIUe0vKzPTebmLn6tZ5A+5XU/ihpkoSso0dApEp4D
X-Gm-Gg: AfdE7cnKppFvkQ5HgHAnmitFppbyTZNYdSEN8pD93pK6ei1zwwUdaKUJz+aj3l0ZkLn
	NdIh17uknkr9FOkBrJC1FmmOn7fDa9Y6grAPnM+HEzGwmZbOuFHbJ6szvmmAPozo5Tv8we7h3yB
	vkuJtOUObz8ZdwOQSqrIteZFwQNNwJEyQF6P55Y3GRa0EkJQDuFZPyV9rVFLfldzHmLVWS/7hNC
	pZ8Ddf7XBbDTcKwyAbmAMcpQBcHhLr3rQPiAEa9f2byzHhb2P9GLgKh1tp9DME0eLqZHY6BBD6m
	E7n4b9rs0iReBHw/sGMKimEeFLVu8/TMaodv+NskRqHqbKkQlO325WA5r7E+lCRW1xkSTwCMvAt
	NQODgc14B0TuVadYOGF9P6HgnRyU6yx3WzpFvzZRlGs+SjFC5tY8vWXp8x3tzV0fljGol8GFOaU
	7MoNcxs4E61rHk7dBcY8wYYdnR6VI8jI74dMG0y3M2me/VTWqooA==
X-Received: by 2002:a05:600c:e547:20b0:48f:d5b8:5b07 with SMTP id 5b1f17b1804b1-49240e81b22mr113459545e9.20.1782046534244;
        Sun, 21 Jun 2026 05:55:34 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49249238900sm129230375e9.4.2026.06.21.05.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 05:55:33 -0700 (PDT)
Date: Sun, 21 Jun 2026 13:55:31 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Steven Rostedt <rostedt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Andrew Morton
 <akpm@linux-foundation.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, John Ogness <john.ogness@linutronix.de>, Peter
 Zijlstra <peterz@infradead.org>, Julia Lawall <julia.lawall@inria.fr>, Yury
 Norov <yury.norov@gmail.com>, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-rdma@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-nfs@vger.kernel.org, kvm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/2] tracing: Add CONFIG_TRACE_PRINTK_DEBUGGING to clean
 up kernel.h
Message-ID: <20260621135531.243375d9@pumpkin>
In-Reply-To: <87ik7cmcb7.ffs@fw13>
References: <20260621093430.264983361@kernel.org>
	<20260621093811.168514984@kernel.org>
	<87ik7cmcb7.ffs@fw13>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_055536_822923_41A36DBC 
X-CRM114-Status: GOOD (  20.02  )
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

On Sun, 21 Jun 2026 12:13:00 +0200
Thomas Gleixner <tglx@kernel.org> wrote:

> On Sun, Jun 21 2026 at 05:34, Steven Rostedt wrote:
> > Instead of having trace_printk.h included in kernel.h, create a config
> > TRACE_PRINTK_DEBUGGING that when set will update the CFLAGS in the
> > Makefile to allow developers to add trace_printk() without the need to add
> > the include for it. Having it included in the Makefile keeps it from being
> > in the dependency chain and it will not waste extra CPU cycles for those
> > building the kernel without using trace_printk.  
> 
> IOW, you make it worse just because.
> 
> With the header being separate I add the three trace_printk()s and the
> include to the source file I'm investigating. The recompile will build
> exactly this source file.
> 
> Having to enable the config knob will result in a full kernel rebuild
> for no value.

Indeed...
Isn't trace_printk() just an extern?
Having it defined somewhere isn't going to make any difference to build times.

	David
 

> 
> Seriously?
> 
> Thanks,
> 
>         tglx
> 
> 
> 


