Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8535DFF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 13:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F8iqGCzMLvZ/FUHTnqulEZ9CiBEz3wlFLR64nRtCLLQ=; b=HEWMB6H2WIOBkDY3IgOHva0LqT
	Dng3ZTtE7pideC6Z02KdJkIoIGRrUO+1mNjgYoUvvj2qdmBDbOtX7dZ7EyNobOt2qqz5sgp4yPYip
	NSvk+F6eW5qdm2z/564Bgpd3FpRteHEJ37ISxi9zFJFiYQdk1vBF3J+vu75xZsTqGdwOlEK/H1y3Y
	Xo9nc1qreytpFIw+kFn8eO0Zm+khmP+UF/Bpk/vFB0Xk4JK5rgNsbeCfqHjBUweFQCrvb9IxGVwhr
	lKBhk5GCCteW2xjaLESZY504JmW1XJsX5KIpnVyLPctf45ZwQBaJ6Qqoruo2hgbLzq3+JDxDkXQke
	agyV+yGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLf4-0000000GyFK-3B9V;
	Mon, 27 Apr 2026 13:06:06 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLez-0000000GyDc-1apa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 13:06:05 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-483487335c2so100229345e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 06:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777295159; x=1777899959; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F8iqGCzMLvZ/FUHTnqulEZ9CiBEz3wlFLR64nRtCLLQ=;
        b=ifbzy0ZP3e6J7JX2WCxeZYmiMXRYKdUjN23c0LHmFQV8Bp721nbL3TkaKD3shy4R1d
         uDi4maahipzY3lVfoVcHUvhFa+WL6zgNwXrvOgIzKzHzZubbrMEJl/Iw9MnUoQlJ2aCS
         BwVn0d/8uX+0I44lhIAKc3/YB0HWYVb7P20odlXwHPXuVHSZgC7Lo16mlB5Q5SBcMxWJ
         rtUgggOSciBEeqUwwiU65wcn/HYPeZDhmVZe+TwJIYHx1BSMmGIDJS7XcBgr4WrrOOdb
         NtaPUxLTdu+pMCOVy9H/ybtzpV4X0Q4fRXdPKUEhmEpo3fUxMeSgj1M7DPstnXS/bi6w
         e//Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777295159; x=1777899959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F8iqGCzMLvZ/FUHTnqulEZ9CiBEz3wlFLR64nRtCLLQ=;
        b=TZ4VlmBJxGk7ovXraudtY3BR+x2dDDzVuLRwB528iZVryrBPPilkvDQEcGcRtflmYd
         iOxiqyrra214WitaUPAl6/vgq9cUC6n1/edHWSa6TByeJG9VwK2CD19g/JdqIdELgdeb
         U2R9Xz7nAKk2/oebfoeGYdFxBnuqIhY46IP183UR/xkqiOtA8aIcexAfqR8W8HTsWgP/
         GC5jmW4+Yb6f4VXLvn7lntMc7E0QCsTK5nuyRexCmQh+IMRfEjkuY3U2Y03Y7iqDV+ZI
         r7/r2dDMFy26H5AYRnBELXSSGxEsz178M0OuT6f46uYo8pkvA+nEN3ypQYpkOCNoaV+E
         cwBw==
X-Forwarded-Encrypted: i=1; AFNElJ+5I1P/EkQCOwjtgHl5LRkCZUCbWLU6nptGVVdLwV5FQ71FvkbCPLrWZqzj8qgFQ+2a2lbqWJCdphqAbsDhjYH5@lists.infradead.org
X-Gm-Message-State: AOJu0YwYj0PRXPL9qm4N8B6Y5aqyDgETDpHfiH9FzHz2PDm5465MckAO
	uJLYD1gJLIKIZ53KsbUzREXHgMnM2BEAYGTd5ALERdODscasxYn+bIay
X-Gm-Gg: AeBDieun24xS0ZrCr/C4QGg05TvM8WJ8Wy4fsrhuMM9AqIyTfdO2lJMuq/beB46bqDV
	SgMFQZYwr5nPt8ND+Z8wOqTAxHHkNoqr6gdRRVCczPA+2G0LuH5jZ/p86uR6iwXJPgVzzP6ExcE
	eV+qmBkVoX7mATlxqZrQKdPI8VSdT98u3YEn9IrWJPj82D4KNfksncu7HvyztWqZYwDh52+XpSl
	Y22k220btsvchk3qE+tOa+5Ul72pn+9nczEDJtGy8ZnEXuhLVaF315Uwkqku32Be58qfSQNt3KS
	FZHi+8DaA/EfpzpBbjt5puIWnt+TBTAViiEtKjAIPTnnN9n3FnL90sW6ESiagVLW3bGnUVRoQRS
	YoPUCzxY+as6FsNeUO1S9IaJwDOf0z6M21juCfVdRVRF3AL1FN8rUQCRWCn4nYMbbIEYypNlfds
	uLX+kjWXeLcgp0S7jQPrJf8kq2h9OO75Goa3SHo7fDMPvkUwylk+gglJOMe8G/nWSZXQ6RshJ7W
	sQ=
X-Received: by 2002:a05:600c:3150:b0:480:3ad0:93bf with SMTP id 5b1f17b1804b1-488fb7930famr614025895e9.24.1777295159074;
        Mon, 27 Apr 2026 06:05:59 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb75ab25sm247366475e9.11.2026.04.27.06.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 06:05:58 -0700 (PDT)
Date: Mon, 27 Apr 2026 14:05:55 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ai Chao <aichao@kylinos.cn>
Cc: deller@gmx.de, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
 linux@armlinux.org.uk, dilinger@queued.net, adaplas@gmail.com,
 James.Bottomley@HansenPartnership.com, FlorianSchandinat@gmx.de,
 alchark@gmail.com, krzk@kernel.org, kees@kernel.org, rene@exactco.de,
 tzimmermann@suse.de, rongqianfeng@vivo.com, thorsten.blum@linux.dev,
 chelsyratnawat2001@gmail.com, soci@c64.rulez.org,
 gregkh@linuxfoundation.org, daniel@thingy.jp, linmq006@gmail.com,
 fourier.thomas@gmail.com, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-geode@lists.infradead.org,
 linux-parisc@vger.kernel.org
Subject: Re: [PATCH 03/35] fbdev: sisfb: Use safer strscpy() instead of
 strcpy()
Message-ID: <20260427140555.4d001050@pumpkin>
In-Reply-To: <20260427090910.1940231-1-aichao@kylinos.cn>
References: <20260427090910.1940231-1-aichao@kylinos.cn>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_060601_438442_79603284 
X-CRM114-Status: GOOD (  26.17  )
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

On Mon, 27 Apr 2026 17:09:10 +0800
Ai Chao <aichao@kylinos.cn> wrote:

> Hello David and Helge
> ...
> > > > -            strcpy(ivideo->myid, "SiS 730");
> > > > +            strscpy(ivideo->myid, "SiS 730");    
> > > 
> > > The compiler knows at build time the length of myid, and the "SIS 730" string.
> > > Using strscpy() has no benefit here either. Contrary, the code generated
> > > because of using strscpy() is probably even larger.
> > > Don't replace such code with strscpy().  
> 
> > Both should get converted to a memcpy().  
> 
> > If you increase the literal to be too long I'm pretty sure you'll
> > get a compiler warning/error from strcpy().
> > OTOH strscpy() is more likely to truncate the string (I'd need to
> > check).  
> 
> > So leaving it as strcpy() is fine - and possibly even better.
> > The header files might get changed to error strcpy() unless the compiler
> > knows the source string has a constant length and the destination is
> > big enough - but that hasn't been done yet.  
> 
> struct sis_video_info {
>     char    myid[40];
> }
> I have rewritten the code: 
> strcpy(ivideo->myid, "SiS 730-0123456789abcdefghijklmnopqrstuvwxyz0123456789");
> Used gcc version 11.4.0 (Ubuntu 11.4.0-1ubuntu1~22.04.3)
> There was no compiler warning or error. 
> The strcpy copies the entire string into myid(causing a buffer overflow),
> whereas strscpy only copies 40 characters into myid according to its size.

It depends on what is in string.h and the enabled warnings.
Testing on 'godbolt' gives an error with both gcc and clang without any
special compilation options.

The linux kernel build errors strcpy() at line 799 of fortify-string.h.
strscpy() doesn't (and really shouldn't) generate an error since it is
expected to truncate overlong strings.

Since you should (at least) test compile any patches before sending them
(even trivial ones) you ought to have things setup to have checked what
happens in a kernel build.
Ideally you should also run the code.

This really means that strcpy() is better than strscpy() for copying fixed
length strings into arrays.

	David

> 
> Thanks,
> Ai Chao
> 


