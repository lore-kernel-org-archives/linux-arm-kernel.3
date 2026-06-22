Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7C7CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 13:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XkaEWxUJkCuHp/17+ud4oWXJ3qqAKnltzqopfMTtFIs=; b=4Nrwa907qaA3fChbhWg+nuU+Os
	RSRd2JGZqcoeRmxECLep+M0e9cgDq9OFkhEeznigvFapWa8OFT3La2dO7m+gBgNtx8emVltzXg7oq
	SbBIcyD2SMClyOrdPR+IwbBcis1wcLMPT6bdeeztPpYy+cS5tNK8E24vCjoJaBzOgpYeWMzgC659i
	c4cHe6sOk5rNXOxVprQR3qxfvMYTbaVx7ejQ/e1l3vgPLni5gYKDgpnYaPymxnqHY4hWRnVTA9Z6G
	d+27UQk2UP2aHMQPlcEMvGck+1NDRg+6sHCf1ysRqU+XjIYgvoiTZCaKHBoS1JPbph8cKSwgJ1fiv
	6C8qmRqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbeRP-000000050GD-0W3M;
	Mon, 22 Jun 2026 13:11:55 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbeRM-000000050Ea-10NY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 13:11:53 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-66077e888b2so4125546d50.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Jun 2026 06:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782133911; x=1782738711; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XkaEWxUJkCuHp/17+ud4oWXJ3qqAKnltzqopfMTtFIs=;
        b=JbtEBP5BWeNKUdRxKo/6qpPKqHyA1vWYOMclRc/kkaIGRtStwawsWKPKQ4g/Eg1lTQ
         QmYdTfI88yEC/TYji98nrIhjHtwPMc7oMWXHh2kGEup92oAVEycNjRuYZs5iQ/PXH7I+
         83Yg6oCqmoK26TOD6u7aVqGmpY5r+ih2QfdJ4EXf6TFtukrWEQ+JJnbwdvVUUUtMG58W
         XUiioHgLwYNUvbNIPqnRltXg6duV3SMDztArK4j/SfbDyhdJxYfGdCjYlOtREY0gQusa
         96fMXO/A1Rt42Qn5IoYmkEOiZWO7yyzzidfYG7mxjYXIf0QZAQ4m8dB2SN60x/eDvwWK
         cRDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782133911; x=1782738711;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XkaEWxUJkCuHp/17+ud4oWXJ3qqAKnltzqopfMTtFIs=;
        b=VF09kjZsCZpaf5vlP59zRo0eS96kKhCKQ32TGHq6OSSQd63ypriwPwAajKVitfcpEO
         eYyJPIdkI5HvMxptIcOXC1tuCvL2ZKxNMAr8JrXaO82JN+7B3hKV2rlNCt9cOmi3k5eQ
         uyRckHH2wtZrGI3B16/Pb3/HV28VL/ZHaU44arR39T27DvCAOg8uqaYBKPV10SZ4Kht4
         ZSgsS/RpsWKGX7RvwB7nrIHXnkZqyIl9GAWYooUhA1u6HqHv/1/E6B56GjjDrJhyMzDw
         YUDgKz12mMKhOBZlMPzZeJ1OLnYrbT+kYTfZ5CZjhgHmuKh0haxqkx2eO8Lw2rGv2sBP
         bxPg==
X-Forwarded-Encrypted: i=1; AHgh+Ros9pqEQ8w1JoxjSassCK6JKpHtp6o5LreqrWJLFtJYGTlu4UnCaQwFhEmTQZWbr0WgaSDABPZfU8LqGxbG9NLH@lists.infradead.org
X-Gm-Message-State: AOJu0YxWANZXEE4q/gSPFJzEIY4UlA9aget6RWte6Jrt+f5VmEW8CKkV
	dIMy+sE7/dCl0lQV0z4/m0OpGxXYaV4rSmAZ/v1xpe2W28/Xv4ZCNM0X
X-Gm-Gg: AfdE7ckCP00nUWd8A9qEBvJo5kraYRqng1TiYxbetxRh2XPIL2lUlQI1PZjy7LdOIRB
	gf3hLhZbcxHxDNtxdj56WjXSC8d5jBb4nvMVZi9CysK0nq/rCyudyz8jjcD8MbmxH+DB8Qx58Me
	xw1VR6VdjFxRtCYRyUs/nCd4HSIX3IkoBOUtCc8iJoeDIRdMmlm0WDowvzei3mUdWLZ2kbS3nry
	BPrV0BYuK7FiDr7iI1Dc1Vg4w+NkXizo8K5t5+Y++Ox1NYTFCgWvJb+K8CG8XPmXtM5D7uLD7p5
	fX9tvT2PraWcpJJAU9R28iotDKklScWDoAx0b4eR/gWrMJZc0x9yJabv2g24ooHolMIfKNdrZ4t
	Mm9W56kKmsVXTLFEnQGDUEk/jNaykctOTbJv4xb15zca3PGFxmRmZ6JQyJbAoqOlwpYnnDXjjDX
	yFFj2Rm9k=
X-Received: by 2002:a05:690e:120c:b0:660:54e4:5dd1 with SMTP id 956f58d0204a3-6630333ac1bmr11505521d50.44.1782133910591;
        Mon, 22 Jun 2026 06:11:50 -0700 (PDT)
Received: from localhost ([38.101.158.131])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66314ac3f96sm3600882d50.1.2026.06.22.06.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 06:11:50 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
X-Google-Original-From: Yury Norov <ynorov@nvidia.com>
Date: Mon, 22 Jun 2026 09:11:49 -0400
To: Steven Rostedt <rostedt@kernel.org>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	John Ogness <john.ogness@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Julia Lawall <julia.lawall@inria.fr>,
	Yury Norov <yury.norov@gmail.com>, linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-rdma@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-nfs@vger.kernel.org, kvm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 0/2] tracing: Move trace_printk.h out of kernel.h
Message-ID: <ajk0lT9P0SeuD94j@yury>
References: <20260621093430.264983361@kernel.org>
 <dbb5915e-6587-4de9-87f3-76bea5024da8@kernel.org>
 <20260622090826.20efadb3@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622090826.20efadb3@fedora>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_061152_299581_CB67D359 
X-CRM114-Status: GOOD (  18.36  )
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

On Mon, Jun 22, 2026 at 09:08:26AM -0400, Steven Rostedt wrote:
> On Mon, 22 Jun 2026 10:05:13 +0200
> "Christophe Leroy (CS GROUP)" <chleroy@kernel.org> wrote:
> 
> > > There's been complaints about trace_printk() being defined in kernel.h as it
> > > can increase the compilation time. As it is only used by some developers for
> > > debugging purposes, it should not be in kernel.h causing lots of wasted CPU
> > > cycles for those that do not ever care about it.  
> > 
> > Do we have a measurement of the increased compilation time ?
> 
> I believe Yury does.

I re-run compilation is a more strict environment, and the difference
is negligible.

