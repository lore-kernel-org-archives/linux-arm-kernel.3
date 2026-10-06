Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ADC8CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 07:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uni4/TrlrriaXDkvx89QTAW+nKztkVVHOAjkaVmVW0Q=; b=JNzsQtpDIzU11pQljs/5JMX7j3
	nKhG9NGgv1ocZxAhoGOWRg7VBEuC9bMSY6k96ZrQIVqW/hFsuiPEa6CdTB/M4Abnenj1YiXGDaOdN
	wSFx4ll28iVFM/Opm/deaidpZ1s4USsaqC8iqBtHcLVFFDHjGJryhTIBfVdDhT46aoWvsjWfs6i2Y
	i4uoKsAdUUGhMB44C7eJ4tVcgsAYaPstTyCTxlBJkZrfbwMXRNq8NR6oLJXBe2ITCOC0ET0/oUlHh
	m/EvSxrENtdvseMLEh9cNPF8Pon1oWC7Qq1xoI+4bpcDNEtkE88EG0KxpmSu6Kow7bkA4eXrjSSDt
	dipGMnKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDzOH-00000000BJu-0qvr;
	Tue, 06 Oct 2026 07:15:09 +0000
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDzOE-00000000BJR-0oBE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 07:15:07 +0000
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-98c7ad684d3so988293241.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 00:15:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791270904; cv=none;
        d=google.com; s=arc-20260327;
        b=ERXhp1rUD1k/1d0yt1JXbGCB8FGPYS5GCZIyCLTt8zO6H1k/IIqouoww8ksifrmp/J
         iICisjJHTDTxixsx/oYGYIHLvJESH5EwpgmBagQOGyP0OwLzz3EMUTv5XfPmtql1qkQv
         xNPF1G6sczxVRCi0obsfENbXHONIxzr9S7UroCLrQ8X9Ts1E0BPoPPRZvSIXDIJWU1fa
         GwkQgBT/rsN3DgIxhrxuzxUUmubOWpzBrwiLOj7m6H+XQE78201+2D600LgRBtlTPt7H
         zyFRaOas9QAhDJBA8mRXJ1ARDcjyPpVYr4PfEdUqWwcnXKb4Ou+zBH9VZc75mQgNKy6c
         16BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uni4/TrlrriaXDkvx89QTAW+nKztkVVHOAjkaVmVW0Q=;
        fh=l6kgT0+P7MKZDZ87w448zZpUKbxq/uQAldaUo0wWYHQ=;
        b=bvwl0BRsDLHkklSHYF/LO3BPbREQ3lKZNIZSHW54fwtAIdm2RFCar3Qim2Q5kTNC64
         Y0MavZlmFmLLiEQuIpWjHt+ZwZQDBTKs/MIztsFvNWHk6eThphQL2Lr/nYtu6MgFXmda
         KoOJk6UYhoWiPEr0xoF9D36DNQwREWKlJoLfbo87bnnqmV4uc9a7poiDElrhgeThYWjO
         tuzs1E9pFum/Bdkqs+s9zUL9e+X5jUM8A7lE5KA9bMQBJAhIBxqpNbhkHtW1Y8jpJXuI
         Vv4RdyTHNVFVYcr8EVk/x2zPp7FteG2YYGSS5nGwdjjP6yRwy9FqQQxz8HoCmAFZFmDx
         toNA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791270904; x=1791875704; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uni4/TrlrriaXDkvx89QTAW+nKztkVVHOAjkaVmVW0Q=;
        b=QXqfdGRm//Cq0MsSGTvdsb8FW4fFQwJK33w5glaWzNtvMLZzmjJT+CIlozKR7piDV3
         LtsrFLHdl55vx2NiMPaKpwD32eE6OIi2sApNxizTH+vpn0DipcnXycT1XA/HyIEcmb8L
         eJLiQDKmMe6X4u94hpqVztYM0TnHAqP9PcWxCoyLHIUTe0aIX0rrjmmFYmP/0y29sibn
         G82QVI2q8k5R0ud4T7/L5chmmp+rIzHtnwqipGy2sbKUpaFV19KJKIWI7QgzWT8NVn4o
         4F8dHLImUwQyrh61x49lRH5CSy9/9QXHV42v1nM61qIW+3GPh+R3IyQNB8K0DMNCjPj2
         O2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791270904; x=1791875704;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uni4/TrlrriaXDkvx89QTAW+nKztkVVHOAjkaVmVW0Q=;
        b=V1ITdWGABN7jlg5kurkZRCpmpRRFaj0U9ybb33mP/38mNLiL6DVMVsUMmW1ppjauaS
         GGgWCDLFlJglhJMsLH+kZHkqAQLeWTsfskXAHzX9DXOLSmy8lOY0tt4DzBI+Cy12wEKR
         1tojIZ9ZUC7LdX0nrglXfIlWOVbYfXhqK1PnF0hP95tSHX5LuTrbU7SJrFHQNElUZqoM
         Cy7oYLLxt7oo7v4tI1xBq9R+0W/mgeNWAdAISLlbEratpsF5hQ8pi8aml8Aj6A5UOVQb
         N8YLb4K7CBlLSQs8lBQE4V8kVBmD9zSWSVE5aMAH0/QFZPxMYCUpMQViTYVjW0uPOleD
         haGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxV4LJhPW8o0f3yoGWL9lLVIGZcQ8+wC/WSjfbRQSWAGREdjMwXSUfwT9quXelAghXap5gzYZWyh7h5jEjSDnoZ@lists.infradead.org
X-Gm-Message-State: AFq9FYLw4z+2XZqZRzS0b4vTL6n74+NufTRtGAuhTGyLfdB8sNgLNag9
	QGrtQ6uBK/jh48Bj/oIPCBkBplOx4+O+inVPeBipXMLb4l4EUkNG40kEKHo/4m313yWHLf1eX17
	6TCrp45KTjQc8mNvZJ66vaZKKFgCthIA=
X-Gm-Gg: AYBFou0LD5bColRUcH19/zGtI5eDgBC7lNOlDN9I+6lqWlL3vY8fblCFt22Cy1uNtUM
	YB/frgo+wUEE0MnKWAa8E0LE7rkZes7LdE+pAVJSc1vPrNwc28m4RsfgND6yDQHcw24j3An28xU
	pEkkeNBA3kg+I+GguCuWoCCfW2K3qNry2KXHRlrIbi3FR/VSNFcKRuZeP67+dfgBqO5AQZLp7eQ
	UBP0uatUg59OBYQ8X22xgp7tByB4XqjQyZHsojuXCuiKYJu/orFnDUsvNMaNn6uVspTQ58dHXjC
	zF9uaJrmAZp5+KIP/JiNmHFeyBIJjO0t0KDmeKZ8RyhxzEnrYj4+ABIA4zzGSrl/vQHUWgf1PxM
	N7W3no2IjfF9bZuxLnL3T1e5lJc+wW6XHMBlLBN1rl4jIansXcSj+oTOirZyIwCkqhMInotyDpc
	L3qPhYo+etwSeVYHxvGlQ+sb/Pmt0ES4UXMbvLFkeTRoLH
X-Received: by 2002:a05:6102:a53:b0:7a7:198b:674b with SMTP id
 ada2fe7eead31-7c2460fb1demr3329504137.32.1791270903847; Tue, 06 Oct 2026
 00:15:03 -0700 (PDT)
MIME-Version: 1.0
References: <20261006-stmmac-irq-unwind-v2-1-194591c87460@gmail.com> <179127056620.2231598.8882282421523696709@kernel.org>
In-Reply-To: <179127056620.2231598.8882282421523696709@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 6 Oct 2026 01:14:52 -0600
X-Gm-Features: AclHuK9NHnAoxqio4ND9YA1CPQjIIsifiUFyiINUer63TXcvYLe57-mIcc0zYw8
Message-ID: <CADvTj4orth=RYtb78ND1rdiYh2yb6d+TjZt5ohK_-+1mnVpqfQ@mail.gmail.com>
Subject: Re: [PATCH net v2] net: stmmac: unwind the WoL IRQ after a safety IRQ
 request failure
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Jakub Kicinski <kuba@kernel.org>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Serge Semin <fancer.lancer@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Nicolai Buchwitz <nb@tipi-net.de>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_001506_245349_F09A6539 
X-CRM114-Status: GOOD (  21.68  )
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

On Tue, Oct 6, 2026 at 1:09=E2=80=AFAM <netdev-bot+sinfo@kernel.org> wrote:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

This was found while reviewing the error paths for the stmmac
MTU/resume recovery series.

>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.

It was reproduced in QEMU by injecting a safety IRQ request failure.
The unwind reported "Trying to free already-free IRQ" and left the
WoL handler registered.

>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

The affected path was tested in QEMU with mocked MAC/DMA hardware,
not on physical hardware with separate WoL and safety IRQs.

> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

