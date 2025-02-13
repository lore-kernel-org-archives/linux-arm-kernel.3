Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACA4C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 01:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f3qnB+BjgvVqudxLGCEV8ahQDENtwWQvSoLgLc6HJ5w=; b=LorMRd7TK6ak7Fuy2gBZkDR+Pu
	1YBHcJsI4g8Em0xvaJEAmRdltfkR4Op1lgCqZvQ1CCnwvxSk5Jib0RzPBqQEarLjR6RwRwC1wH8q3
	S2XlDrsCylTWIOnRQn+xdST/mHNucXeIze7jYM8bUwqWoMfYPd0EdnQCkV4/qI4l0BjLBhH0x1jgh
	p8zZwflg/Ak/eYzsntWnXQRGm2Qv9aRxBbl0jQwZAx+iym8K7Mxkfa6O9jsaZjGtrG3TSd22Pm0FZ
	1/fO/aiYhWM2I9t4lW2PKN3C0JH3ITavafM52bhU0SCSooFaYEOW7ft2wROd9cXD1dEe4iN/AP34X
	wEJnJBRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiOCV-00000009Pfb-3eSA;
	Thu, 13 Feb 2025 01:39:35 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiOB4-00000009PXw-3PsX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 01:38:07 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2166db59927so554375ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 17:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739410686; x=1740015486; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3qnB+BjgvVqudxLGCEV8ahQDENtwWQvSoLgLc6HJ5w=;
        b=iRBeX1lMriimsJaXLtnhqbAiSNUaFHuBhLyIuuDKpCJiF2MCsAstSDVFw3u09AGnKe
         g9mJIBRdtUp+KJnYQwXXK97tDHmi5fZRcWIQp3DdbNOegc4g6jpoONMtKNROCeJYsDWy
         AS8fXRASwPE2jz78wxF9WSAUeiJboq81OJT5PYhnnGpCSRpIYgL5t/qdYfcE2nx5jgy7
         JqVo6zT2WfXPqAMHi1M+XwJ1W3pzfaLg5cyE4VNuxWBXZO8waYIStrqUG+/mX4A8ymVb
         7Dkk8PZBMtrauJd1hwmu2Z2EM0uguYm7ELm3YjmG2Y9e6k1dOo9+UMJ2TJhQOw9siSmX
         pN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739410686; x=1740015486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f3qnB+BjgvVqudxLGCEV8ahQDENtwWQvSoLgLc6HJ5w=;
        b=WfedKxScwGDtGd6nzClS+TVlS7Mv/lEMQL6jaCtrmN5OKYnpj+NNc7pRozLiwmZl9v
         9Xoqc8tMbliw4NBgaq35kvekSMeZwZtDgjeJ63rUuG9QpWBjAa/0gWUyoKEjMUrIpxUO
         /57Avp7wwnsUACWke8VFqyMJncbXSl0fYGdbcyq2xiZUk2Zdhe+m1QP0IrbnX459vvSf
         9qceLZMX28qgj0N1ENFsmQ4pTA9lLgDSISYXHIKmSt44IG+8RQXD2LZ4tHS4NsCXysYG
         qnoZ4bOcx3bNYvI8DgfZXQPutvrB1dnvYTlef81axIYWa/V+c+7JgsCx0eI8NdMcvKUh
         hvwg==
X-Forwarded-Encrypted: i=1; AJvYcCWUjqvepq1THMMp9iNx0H7KL5rhnGrgYqnYECx3S/ha9s6deD4HMwv7ZDnL3HRqGDubV4t+ERQHcJIwGNnWsKVR@lists.infradead.org
X-Gm-Message-State: AOJu0YygsN3pZhTBphKnbtPXl2NSfaIyVVvKRtm7TJER/w21TXlSQEAL
	Rt2lUd18/CGORY6yDj6d7//TinNGgIk+ITh3E14tlYp7kGFcWlgv6us6nGo/TkvgUFISeAPRZmp
	+hzHhOHTLEjMvDwn89PBRgYKndFLcJ4k=
X-Gm-Gg: ASbGncv9rSgf9QHw0mtqei7EpNj41pOJSNaiZ9wSDkKdOJlNWJSQR6lmEQE0z2kgph7
	DcFjSwSIpduXKh9yqYJxwqNCGZstLVww69OhrDikGRpoHpaZQhwyy+05mFX5EzaWlXj/CDysEyA
	==
X-Google-Smtp-Source: AGHT+IGNSf6rGtM/0ntuhaOil/OeR7IwjOWYFQDUAqkZMflXOFRT9qKkIxcKzWOWjZx79tkVLAIyz+1kIHTsJrDn3wI=
X-Received: by 2002:a17:903:2b0c:b0:216:32b6:cf0f with SMTP id
 d9443c01a7336-220bbb58176mr34931005ad.12.1739410685858; Wed, 12 Feb 2025
 17:38:05 -0800 (PST)
MIME-Version: 1.0
References: <20250212212556.2667-1-chenyuan0y@gmail.com> <f649fc0f8491ab666b3c10f74e3dc18da6c20f0a.camel@codeconstruct.com.au>
In-Reply-To: <f649fc0f8491ab666b3c10f74e3dc18da6c20f0a.camel@codeconstruct.com.au>
From: Chenyuan Yang <chenyuan0y@gmail.com>
Date: Wed, 12 Feb 2025 19:37:54 -0600
X-Gm-Features: AWEUYZnjQUUyxNUV0VBU760EACS8AzZdfQ6WtL9mWgDhcmj_152WjiAils2-6oI
Message-ID: <CALGdzuoeYesmdRBG_QPW_rkFcX7v=0hsDr0iX3u5extEL5qYag@mail.gmail.com>
Subject: Re: [PATCH] soc: aspeed: Add NULL pointer check in aspeed_lpc_enable_snoop()
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: joel@jms.id.au, richardcochran@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_173806_851866_83ED0B7B 
X-CRM114-Status: GOOD (  22.17  )
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

Hi Andrew,

Thanks for your prompt reply!

On Wed, Feb 12, 2025 at 6:21=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Hi Chenyuan,
>
> On Wed, 2025-02-12 at 15:25 -0600, Chenyuan Yang wrote:
> > lpc_snoop->chan[channel].miscdev.name could be NULL, thus,
> > a pointer check is added to prevent potential NULL pointer
> > dereference.
> > This is similar to the fix in commit 3027e7b15b02
> > ("ice: FiI am cx some null pointer dereference issues in ice_ptp.c").
> >
> > This issue is found by our static analysis tool.
> >
> > Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> > ---
> >  drivers/soc/aspeed/aspeed-lpc-snoop.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> > b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> > index 9ab5ba9cf1d6..376b3a910797 100644
> > --- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> > +++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> > @@ -200,6 +200,8 @@ static int aspeed_lpc_enable_snoop(struct
> > aspeed_lpc_snoop *lpc_snoop,
> >         lpc_snoop->chan[channel].miscdev.minor =3D MISC_DYNAMIC_MINOR;
> >         lpc_snoop->chan[channel].miscdev.name =3D
> >                 devm_kasprintf(dev, GFP_KERNEL, "%s%d", DEVICE_NAME,
> > channel);
> > +       if (!lpc_snoop->chan[channel].miscdev.name)
> > +               return -ENOMEM;
>
> This introduces yet another place where the driver leaks resources in
> an error path (in this case, the channel kfifo). The misc device also
> gets leaked later on. It would be nice to address those first so that
> handling this error can take the appropriate cleanup path.
>
> Andrew

It seems that the `aspeed_lpc_enable_snoop()` function originally does
not have a cleanup path. For example, if `misc_register` fails, the
function directly returns rc without performing any cleanup.
Similarly, when the `channel` has its default value, the function
simply returns -EINVAL.

Given this, I am wondering whether it would be a good idea to
introduce a cleanup path. If so, should we ensure cleanup for all
possible exit points?

Looking forward to your thoughts.

-Chenyuan

