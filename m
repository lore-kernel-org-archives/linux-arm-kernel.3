Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1ADBC55175
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 10:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SRLHab5JHv6y5OVWGBkvI4XT8NjkDIUMOmG3BXMSKXc=; b=A1YZ9+eDtPYz3dX3mmyCRZqOC/
	Ij9m4qz0omlxqhFs63V/8yX/0xf4d4X6/UQ/thM4qRFDpriLADv90b++YvXhTEBgZKfOZZMopEpcE
	GW47/407VRrE5oCn0xoEp4CIIT4JCrNLavND2IjzRsD1MwWt9UNNGvNTEWtHItwMz6ls0s5rKXTMX
	D0C+jU1u/1opNara8aLk8jX8ayYDmpyMR+IDY8klsMRr9vOTNEqYESDdle71Ab12A3oqLdHmtnhU8
	cPueDG3ldiwy2J335SKQI6UQ+sEPrNy7GNWWWQWa2L2DrYQFkQgrYczkBs8sju4RjPPXXQbF35LAT
	OuDMEIeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq6qt-0000000EAXv-2E7q;
	Sat, 01 Aug 2026 10:21:59 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq6qr-0000000EAWi-1j2w
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 10:21:58 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-8f18d92172aso19377636d6.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 03:21:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785579716; cv=none;
        d=google.com; s=arc-20260327;
        b=obtXbVjqpz63DOp5ifEek0alsCSsuo+vcWHG8KBdSbsioHXzFVTPB+sARj30EETZqv
         Zoe3pmSg9GnJAAm4QrwfxxAM2l/2yXZVisjd5hzj1oR7FFoH44xAKgNoayeyE40B15hh
         i1qE6bYdU8LWS93sjca2y3/p5t19nLjgJMfgSwiwaQ2YiaM4dZFhRfnsPAnyEJGbIf9v
         5vRyWPmfvqNMKUs+IoPZjdjWZFYq7u3/qlAsQ7JOT/+ZedPkqmJumapWRrUkhwXk0ycq
         2kkTWEOvBvWCmIfS9/LLCrt0XAcFfSMzZO90DPom3VJigO9bNh7tvvi3G+w2jtG8I24V
         Br1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SRLHab5JHv6y5OVWGBkvI4XT8NjkDIUMOmG3BXMSKXc=;
        fh=ucm4BtxKH3LGwRyb74zM+KN2WI/Y36WNEIaMaQYWBPk=;
        b=KntQz8pey7p2iN1N783yi+thLzBEnALk2X7ehOKfv4mwbmicJPLDh/xF8PXjKkIvaQ
         Yz2v6bj+k1hvc4ZRNWB1/1dpEhyKxoBWXaLdxSBWlCJqcnbgoa8xnQa1nOm4Hru5ZtyC
         5JDX1tuyvRt7YLHR09Iy+iuuit1uG3irJCHrdntirGZGFZiFgpNCdOlqjiQZzqbTD1w+
         e71bOnzapovkWz39cy+4h69UrFlujfUfQpZqAoIDhyKSq962JBSu+AzHG6yyLN+caVvD
         +IrDaQBKPV/qy0mszjUeWwdwvccgS6vXJsXaIihZntp1BJ6mXQse/EbDcLEhR3ARSZXb
         KNAA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785579716; x=1786184516; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SRLHab5JHv6y5OVWGBkvI4XT8NjkDIUMOmG3BXMSKXc=;
        b=o3KAB6WFRfNvSd6D01oRM5sKjr+WpbHqi3+BLWWzf8Wmof9FFKKf8K2McPBWeX8kQf
         lvr5tFUQX1KsIsY+WZlSw15pS1C1VphgaW8+XMUA0YkSHZeWRkonL0AXZqEg+6KQMOSW
         UdtsiEaFwfeI/GiFmJictgrgiX8Yyosw55uC/5uwxJp1yMcYxStmNbYRm/UvOp07Vwdn
         DdQEQ50ls4fYDcSxCDfBWAVS2KWIVg0fkt2WdF++k+oHh9DeoHp5QllE695OQvf1BFS5
         NaDfiJ8jXIGVmSaNc4W62Zs9gCxrsQnjMvNOEQRbu2owu3gosxFGc9mL0ADgBPqM2nC6
         x1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785579716; x=1786184516;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SRLHab5JHv6y5OVWGBkvI4XT8NjkDIUMOmG3BXMSKXc=;
        b=ar+jiBtoUqWEaxFfc7rkJ9mHUh7FtsQJm674ElsOOj8yxPMtg/ScxezXYpVpgoRg4B
         Dmp/I2oOrkHvdmsL8iLIWLEz+WDxxxORw+uzerjnI6nIyYj53JridC+Df59Vqm9Bm7li
         vQnk/5kQsqoxImlx5jXHLrIYzEQFCeDcXqQrJeUEag8NWSMnHPYnQ+Yf7LwpUwpOEKZg
         KQd80PGxHSIl0yqkhe+ID6mxwNwYZzQyZkferrEPwCseLzjoleQJPlEyISS/t/g2XMYO
         2gWFhv1o6Cs8oODindHpBXcg0IR0NsxeYvQ47Zd3rxEWpXI9do9MefoPC0FrTdCeZcmG
         jp2Q==
X-Forwarded-Encrypted: i=1; AHgh+RogL8Sl+htKMQg5jtLjrgjyPzNY0fvVnt2qg0lWM7cwynXh+BXYVHGmhoTnavMHS2DMQZQK2L1ZoUMfFIFeEeCe@lists.infradead.org
X-Gm-Message-State: AOJu0YyJ/RAEXpXAGN6qLZmurbZD+K/3vqcrJwvRQZhbXbzZ52hYfeHP
	IuYl9AYKUlkRu3U44Jt7vfdFbfiAwbhbQsITq/TAG18PGaoknE6gEyYDLuTeAngrThltfI7ca9v
	M4JsxAwskcvUZIqBQZTCp+5jHV+6AfZQ=
X-Gm-Gg: AR+sD12nZk5bQtBCCoWTCgrxqZOsAWg6X7SR/D0XPhN50ASWVjD+s/PDEc7szv6qSad
	a+KF0YMb6LszgfhqEsaFxrvKDE74BE3usbNFtjmAjGK18IyR4TtEDLoSQ+LG+fpCvJwRJzHlU/F
	rxBcfhE7UG0kRqhMjSLthd05DW9FA/WjpI3NEw72VE6LT/rNSuQAj0boJ0FwYbYSszeo/NujzrQ
	FV5KZslHkDFALMz/8WXjdj3TAoWZQJDF9qrV0P3qfJX3n+kbAsohKUxAwWR9/OZZZ7b8lATNP3d
	+fwHZBbGlUssDDTjMnDjgqA2w8HhzdlTGTD0FsorURCLb5yciaE62MZyqgOLt8KGbLToxHyzqj4
	Rj4k3fKa69zMFTD7gM20J7QKxBbjpxZG7e0eJCHH2gqxFaqC8c0E+8SklrULp5IeV0O4vnaNIqg
	LevzFKZGBoypzlCZ2FFxpJfi17Vpie54FZb1PPUP0e/5wEMPI/J8c=
X-Received: by 2002:a05:6214:21cc:b0:8e0:7d6a:480d with SMTP id
 6a1803df08f44-9084963fd1bmr61334226d6.20.1785579715978; Sat, 01 Aug 2026
 03:21:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250924085712.1040284-1-pbrobinson@gmail.com>
 <37220187-7369-4b20-8e00-0846ee0ee6fd@broadcom.com> <CALeDE9MfhU+hL-d1vruhCzN5vvb9LsR8YwDPOR1XmpLcygLbLQ@mail.gmail.com>
 <d27d0ad7-687a-46f4-b6c6-f34f3232f1c3@broadcom.com>
In-Reply-To: <d27d0ad7-687a-46f4-b6c6-f34f3232f1c3@broadcom.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Sat, 1 Aug 2026 11:21:44 +0100
X-Gm-Features: AUfX_mzDprPWyjzafLFHPRoNUXXUuAWXNY0wf_WYB9j4gWDemmLGUrxrU_ekU6Y
Message-ID: <CALeDE9PH5BcoqwPhEcEf21u-_Tn72A0D9BuVM0xVQFjCHNyaHA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: broadcom: bcm2712: adjust display status
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
	Phil Elwell <phil@raspberrypi.com>, Andrea della Porta <andrea.porta@suse.com>, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_032157_460335_B63815C1 
X-CRM114-Status: GOOD (  14.21  )
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

On Fri, 31 Jul 2026 at 21:44, Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> On 7/31/26 11:51, Peter Robinson wrote:
> > Hey Florian,
> >
> > Not sure what happened to this, you said it was applied almost a year
> > ago but now I dig I don't see it upstream.
> >
> > Was there a problem, or did it just fall through the cracks? Should I resend it?
>
> Looks like it fell through the cracks during a rebase, sorry about that.
> Would you mind resending it since it no longer applies cleanly? Thanks!

No issues, new rev on it's way.

Thanks,
Peter

