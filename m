Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F77BC61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 06:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oUBe4V9KHl8iNUfcbhC82PdW9xkiw2ga+WjG1tOSQz0=; b=Z8GXLIAYgH/2vj5+RJrGJUb7Dj
	HWCeLLx9ZM8cERQewsI5+mh7mVr2D9O3NrxUXe50RV7/PLxWLigU9VvpvELVt5TUEuC7eJKZl8MaD
	1cJbss333z3z6e84BpUt+16WLg5dLQgUOTgq47jpP9POfaRNiTpEyppoxcDulpoAs8bzaGpJhJHxH
	MoiFyYMeYhLWTXUEZ+UkvX63nAevoIkhKRUwadjh86E+DUdRKVCySBq12cr52qOgEhwcFZ8OUTR4f
	zlBm0c0hkxSutMPZtn+9brVwPhQA/rRPIEz6GmSJYVsXn7c+75U4lhYDHQxOgnRSiRMcrVIasoV2T
	5PGB1Nfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1epK-0000000Dsx5-04Vx;
	Wed, 02 Sep 2026 06:52:06 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1epH-0000000DswM-2p07
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 06:52:04 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so7322175e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 23:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788331922; x=1788936722; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oUBe4V9KHl8iNUfcbhC82PdW9xkiw2ga+WjG1tOSQz0=;
        b=MS99cnPshUezBNFjr+TITTYkzXiWS8bpLyYN9gJ1/bX0Tk4TtlzDW4yzr6Wm5EfZRO
         oa3SKrRXiiK17MS5FB6Ax2DW8uzYiS07w/3TLAkpWrSkGCCWx2shf9xPrkQ5+r6ryfgB
         4CQs04d3i+kNgb2kZr22nH1CN/q/7snfISUAgbd0TzhWxooT6TeA8T+a8vxVePJlCUMw
         QanqQo9SkMTl2/hnUdp5uK7CmuATJQDXK5BMApKNiXHw2uM8K3kQXw3/Fcl7DFSo5wTw
         hnxiBinU67KVOwysVMgtVypRN2ImjmRTB2yMqAXXjCd7JrZBhju2vYmWSMydGbdHuW23
         UiJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788331922; x=1788936722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oUBe4V9KHl8iNUfcbhC82PdW9xkiw2ga+WjG1tOSQz0=;
        b=tPMHwALa/p5wZdTPj99EsqYLHeowVlWGubkHkb6CYmlnE2YGIV6Fmes1JeJcDkVr6g
         kVw9KvySQb4nRLBEoSWZf9DYKAv+MM1oJEaYP2qjzPr6aViOn1mj4SZuIyhmTiyuiF7M
         62axQ01KXPVMorCoQVu/2JKgE6BZgy3/VFSUqUu/nxvugTFOdgs4Z27fz+L55un1u++h
         YdQXs5Px3h1TAHru78d0Z6zcufDljzXoDgIW7rLOlIbSNcjOU2EnIEfj8pmw0OqDHom5
         5XTwZuS8ukq/dGawuUsau6pk0aPgoqYgRrGxDvcSt8aBuU+FSIgkwJ570zVhnM4BUwO6
         n4Bw==
X-Forwarded-Encrypted: i=1; AHgh+RrBRcVq2YthKtmNSJA6T7uEdD8HqVfyStUdOlBPODoqFvXCl1u0ZUZ0M6ZaiSfJ6xc+Bgj081ykC+LFsS7pAkAY@lists.infradead.org
X-Gm-Message-State: AFuF++k0YubiSwdWYKexBlyus16sY1cDI6l5/wrGgxbniiAJHWMNFIY+
	XRWqfEErvG8ymXZ+5dlLSN31V0IJDf+2ozxb+bCRRDEB3yQvMd06pC4h
X-Gm-Gg: AR+sD12Bg3Cjx+JJXsnKa7vcCc6t33LuKWPc8blj0ScDk9IjT0V53Kn64KzoCP5WXZs
	cGOhQ0emyYawr5fs49Q7STebll8TMyrJ9kcca5J/CHrIu5smNBmUk/iIR5mHbsVtUyGO0D/YJ6f
	kZZmQ/Oa2ObC309EDvt+LRs2l257qo8TP3IKQQyGPmHq1zRnM6sQ/Y9Lp7N9IAZExikYE4n6CzM
	kDRbQp1feJZlIHYr233b3tKu/dOlx1pWFBWD5c6qOa0wV1HGMbo9wMHnVlyCEt/Vs9ic7/5Z1sS
	oW3meMR4ow9nUEhG8vJNk3NvmDh1R6e9fOipY0TS9z6lJs71vMq7OPSf06umkeYo5HD7NLxobGV
	GCRuN+kT1AcOyfXtfIJ4/eKlhqsbn2gDdh0KJRKxKzJ6kprpnjx1pfz0LKaSh31/lfSXWqXZQmq
	UMqQgfEsmUOzdCcp9xcwJYQ9qF2LFIbisKRv2WoKBlIBhXE0TPSmcx824xh5awchdYnw==
X-Received: by 2002:a05:600c:3587:b0:49c:cee2:1697 with SMTP id 5b1f17b1804b1-49ce583bc25mr39966725e9.16.1788331921667;
        Tue, 01 Sep 2026 23:52:01 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdd73f7a4sm124677705e9.12.2026.09.01.23.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 23:52:00 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: sashiko-bot@kernel.org,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: Re: [PATCH 2/2] gpio: mmio: get the direction from pinctrl when there are no direction registers
Date: Wed,  2 Sep 2026 08:51:58 +0200
Message-ID: <20260902065158.3617522-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260902064045.60F621F000E9@smtp.kernel.org>
References: <20260902064045.60F621F000E9@smtp.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_235203_727950_32355C74 
X-CRM114-Status: GOOD (  17.05  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

> [Severity: High]
> Can assigning this callback cause a scheduling-while-atomic bug?
>
> Generic MMIO GPIO chips are initialized with gc->can_sleep set to false.
>
> When an interrupt is activated, gpiochip_lock_as_irq() executes with the
> IRQ descriptor's raw spinlock held. Since it sees the chip is non-sleeping,
> it invokes this new get_direction callback directly in atomic context:

This one is real and the most important of the three: irq_activate()
runs inside the desc->lock region of __setup_irq(), reaches
gpiochip_lock_as_irq() through gpiochip_irq_domain_activate(), and for a
!can_sleep chip that calls get_direction(), so the pinctrl mutex would be
taken with interrupts off. My test kernel had DEBUG_ATOMIC_SLEEP off, the
uncontended mutex fastpath hid it.

So the callback cannot ask pinctrl. v2 changes the approach: the chip
keeps the direction in its existing shadow (sdir, under the chip's raw
spinlock), the direction setters update it, and get_direction() only
reads the shadow. The pad is asked once, in process context, from the
request() callback: gpiolib calls request() right before it calls
get_direction() for a newly requested line, so the shadow is seeded from
PIN_CONFIG_OUTPUT_ENABLE there and the line reports what the pad says.

> [Severity: High]
> Does returning these pinctrl errors break interrupt setup for valid GPIOs?

With the shadow, get_direction() never fails: a line pinctrl cannot
answer for keeps the input default, which is exactly what gpiolib
assumed before this patch, so gpiochip_lock_as_irq() behaves as it did.

> [Severity: Medium]
> Will this early exit prevent the patch from determining the initial line state?

Yes, the initial scan in gpiochip_add_data_with_key() runs before the
pin ranges exist, so nothing can be read from pinctrl at that point.
The v2 commit message will drop that claim; what the series fixes is the
WARN and the direction reported for requested lines.

Thanks,
Mehmet

