Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00694C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 15:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=luqgKeY9BCSFP8cqU5Wk0SA2ZSLwx1JOWvC8sMgRww4=; b=goHOZOQScvBikuymVnOS+/9dbu
	lhdPPJQYVoe5usX3+JTfUWov7dtWz0LNmSCCyshSdJ+UL+P4AVAm9CN3s5YWxCajXsxTPJ0SQZS2D
	qTW31d8xdz7gphXjoOWKanUKbmjj6OfgYcA/w05/Ow9apJeBx8amX7ECyifn3GLCPpEqMy36AK2Ev
	UPlNe0435Ik4+tqHqmplLZXBU1czKD6hEzs6lqCnudUzUyqQdiavGJ/BV9YK6tbntZ387fwaWSgn8
	2RGN9deutLO2g6pAwWOKxa2Wbv7MZbCEdbVCZjHba+vMxUpcSOTLDguE6Es2LIgsM0d42R4eOA17b
	ncOrmUuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwie7-0000000A8HJ-3f6d;
	Wed, 19 Aug 2026 15:56:07 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwie5-0000000A8Gc-1pCx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 15:56:06 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-9034b6b7674so8693426d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 08:56:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787154964; cv=none;
        d=google.com; s=arc-20260327;
        b=J0rZafgnprOE4nQyjr9VVqcDUfbE4/+0TWm9QnUTWDWwId+nFjVGEBw69V5oy6ZgGJ
         N8aOSnAMZipLYQzb6CJkBWax70Y/qrwcNuB2kUXxT82qTdw9KgnF8kfAMOjY4FcFOilF
         TlClLt0ws7ClAMXSqYQARqY0oMcjhGDeiL1P8Guj+LIgtRwrxTMo1YYnSRs4sHN0qCxf
         Zd+bddPpE85p8HcW8ZbS+1U9D+Wy+sSTb5LKZOD9SCKBff2OZ8y20/AiF+TjYl3CaMIp
         Ijqn/VCElP+Pj6erMPoZtoj0EpD3aAJiSbUB8s1Hp6SA/Itj+u7yLcxnLO6iAxJmBaqN
         JAOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=luqgKeY9BCSFP8cqU5Wk0SA2ZSLwx1JOWvC8sMgRww4=;
        fh=9QqxOHGzZkekTNp7jb8KQhxgL41cRWKUrxI85DGnFLY=;
        b=siEYXRb9jpK8pyZlRjpSy97apvhUoa+YSI/EP00cujgmNXzHf316NQ9w7+ZYOz8AX0
         NznBNY8YQFhaLFyumQlLTg/WwI00yKV0lqt6sIR1bgNkpgF931g1/K/C+wINyQM+9l4m
         7V6QFjp3uOC/N0rUQteEFykZ6dZpbJ6HtvlFSL7lGDXwmANghxOU1QEjM2wFWy2+fSwl
         l+qfd0BiKPnGSnq0qr3IW+uoG6JOJUBAe4bI4tvQTtwImOZ3JTu6FM6iV93Q+jVPzrZr
         chbNow7+E9bZkfb0gfidC3EebBRSFwMMiK2FGZhDIuTie2c2xBrMy9Iooez4HNoc/h/J
         Y8wA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787154964; x=1787759764; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=luqgKeY9BCSFP8cqU5Wk0SA2ZSLwx1JOWvC8sMgRww4=;
        b=XFvjOVt0IEvB/Nur4L/+YNTcqNXLLaQbqTfqJDmvoO+RdMmDU1w0inki0LMB7PAJxj
         9MXDkEHJm1+SyK6YVh1nv/703jjxgC+XWw6wMb4eGOrJHe/NsW2APdYyZf3YlkVf/6gS
         rnWreGx1hWR8CKZQmZk8rVfRn9C2e3mml3QFgrl2ysa8hsmBCR+pBkSTQbjKz13LyFts
         PhdohO1CselrPG3Dm9xu4dzyiGbSZBLHFUgKPFanXK+7sLrmTDWQBji/opX4t9AykMwE
         FT9VrdjTm3qTw+mgDGC+dMYsvO7PaEE7+XR5xRYBiyd6o2DWuhLj7w3u8SnuMCaGv1Uc
         qNqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787154964; x=1787759764;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=luqgKeY9BCSFP8cqU5Wk0SA2ZSLwx1JOWvC8sMgRww4=;
        b=Y6Wsj53dhbPP6L1gI77Gwuep8KI3vP/dzHP0moaqIMZrB8VjuY+XG5FRC0Fbx+CE8S
         3fQY6MIuvH2UhYQr4ObKIAM/zhKPDxxiHW9nbBE56QuhTewn1BlZpYTDazRuBndP8YBY
         GdBM/dzmIGeg+Gs7M9C4UEGS9Brj6GeB/V96ybDqIx1MdwPAOAfel5xtZO0aJv+NBWXw
         scTcdrZ3YZ+FmlYx6Tmr6jtK7YJgGXOm5ZwuGwKzig/krrrMIJI8u7F/U/m3+CUKT4Xl
         cMUycsGmcQa/xEisBB6F/4bHOTlOJr0pNI+vN/jLS8oLTn0vkUXonX9B+MYfAX7Y4ZMX
         2IGg==
X-Forwarded-Encrypted: i=1; AHgh+RoWk/0pxk1Mk4EhUWvzxzkSqwuF5Ds2U7dEAG8vgtTM7iMArBddH2G0w2tOlgXdxnvcXiBrKb9rqRs+3o2jZpIR@lists.infradead.org
X-Gm-Message-State: AFuF++m4lbJRjSJ2piQDsJ3oXu8yfc/rjUTsAyntzA5d6DlLo3TxK+Gi
	H1WW+qvO/bCrDwBFQxcMz0xyQu6oLbx2JvOhVMy1FTeZYllMSBiSZcLO6ReaaLCaPoCvMpMo5By
	csik/v5jUt1fZpOPDww+Zs6l1DeNV59g=
X-Gm-Gg: AR+sD12JD/ZZOk3AQ4k1kYXyDuTmGp+rcDMQbNX3Xfn7YejiNwvTIQjew8NYwD1sALC
	UgzP7tXtTfXhR6JOOa0mMpLk8Mn7yhNNTYmZ8KaMjSZGmn0HMCGCTU91U1yZoaAH53HviZnjBR9
	V9aLXsxUeqN8AIx6NCdFASR+BXna6xDk5VfuavWn+Vd4CV4dlxPqkYqh66wCtHLxnH24aw2dYh9
	o/rWrJssmW1M/SgSW2Aec1AMvt9q13clMUAerZudbQWxeNXSzexC7L3XHAJI4SZe95BXx0M+jlU
	nu7Zy7NqTzwq8V9+SZI2a4SKKFSQtD/TO3EJuepsLA==
X-Received: by 2002:a05:6214:dc5:b0:8e7:8d53:2417 with SMTP id
 6a1803df08f44-90c5eac9942mr52592116d6.27.1787154963571; Wed, 19 Aug 2026
 08:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260813083536.970196-1-ansuelsmth@gmail.com> <20260817134727.1f76d6dd@kernel.org>
 <6a8376ef.be1895d6.92f57.c9dd@mx.google.com>
In-Reply-To: <6a8376ef.be1895d6.92f57.c9dd@mx.google.com>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Wed, 19 Aug 2026 17:55:51 +0200
X-Gm-Features: AcwNN1WR7Zj_IFCR5YdVpGhfxkJspgU8SJdxW5GIgyyCDjlcNc7jn8kiW6V-vUc
Message-ID: <CA+_ehUyRKtuCtak5XD_1LUMEmLTn4JfeSDapsAEwo304uxyVqA@mail.gmail.com>
Subject: Re: [PATCH v14 00/12] net: pcs: Introduce support for fwnode PCS
To: Jakub Kicinski <kuba@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_085605_489159_DBACF392 
X-CRM114-Status: GOOD (  24.39  )
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

Il giorno lun 17 ago 2026 alle ore 23:02 Christian Marangi
<ansuelsmth@gmail.com> ha scritto:
>
> On Mon, Aug 17, 2026 at 01:47:27PM -0700, Jakub Kicinski wrote:
> > On Thu, 13 Aug 2026 10:35:05 +0200 Christian Marangi wrote:
> > > This series introduce a most awaited feature that is correctly
> > > provide PCS with fwnode without having to use specific export symbol
> > > and additional handling of PCS in phylink.
> > >
> > > At times there were 2 different implementation (this and the one
> > > from Sean) but Sean agreed that this can be picked and used in favor
> > > of his implementation as long as his case with race condition is
> > > correctly handled.
> >
> > Coccicheck says:
> >
> >   drivers/net/phy/phylink.c:1039:31-34:
> >     ERROR: invalid reference to the index variable of the iterator on line 1028
> >
> >   drivers/net/phy/phylink.c:1364:26-29:
> >     ERROR: invalid reference to the index variable of the iterator on line 1346
> >
> >   drivers/net/phy/phylink.c:582:7-10:
> >     ERROR: invalid reference to the index variable of the iterator on line 569
> >
> > I vaguely recall that you're supposed to make a copy of the pointer,
> > not just add a "found" boolean. Dunno if it ever happened but Linus
> > was trying to make the list iterators override the pointer on exit.
>
> Oh! I wasn't aware of this intention... I have seen lots of pattern where
> the last value of the iterator was directly used (if detected valid)
>
> It's and easy fix... I can send a new revision right away if you want,
> I'm already on it fixing this in the meantime.
>

Sooo should I post a v15 with the fix? It would be great to have this for 7.3.

