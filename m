Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83907CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 04:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y2QRGst729/DWiP4I9nqZ3Qxmv8ECUfQin2YGfwodis=; b=V3CsMfnlw7AHt1uJdLqvgS0/w6
	9vyVLB82qPFAopH4HyKEbeLshuW9RBu66Lw1k4hM3489GK+wvMc314MQk5WhQ53ceEWxe3UlSe3N7
	IBWKfgz+LYvTrABYdszyeiyTXy8cExhV/MBLRODrL8FMRE0Vt21sLj2AlK36QsYeVAGgqBwebGexc
	QAgpImUhm4CamekfxfJeqx4otw15qxk3lAio8J2r9Rm+63Imj0UNwxrOYi8eB1hOM7l7P2AAL49lu
	JnBfg1X/pL5LU9RxMPVclcpshNoRlvvCsGIyaABPR+WhCxGOZXNZ9rZ5aEYY3JqYj3K+vNB6NIGlL
	6IRplrtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4ArK-00000009aar-367B;
	Thu, 02 Oct 2025 04:24:02 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4ArH-00000009aaU-2t9U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 04:24:00 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-27d3540a43fso5075845ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 21:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759379039; x=1759983839; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y2QRGst729/DWiP4I9nqZ3Qxmv8ECUfQin2YGfwodis=;
        b=O+QuagXeORLwuo6UYyfu/mGZeJPYPs/v22FE6Y7cGs+A3YuVlHWAHkKxY5TXz8iUv8
         sTMKUvj66a/y/jGu9mSLlHGYEEKuVpZjn4E4PywWNzB79oOSRt+Uwi0tojAenyRMQgn4
         1sBgZFhvP4FdfMh5A6eVzq5IQ7khV9cKEgzh39am3mHGj+foFmPCnw/JN3h1a0Kj0Ssu
         KFQBjI7gC1fextz5l8PBadurVgkP5okhwpQsnM9xCrs3WEqt7Pn8UDtnw3jvz7xrZCL4
         iy0GsWzDjRVFyFR0pevxFtSxWSF18LD4krHbmfghNJx1ijVeDdItUHVbYuffscT4V/iC
         TtkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759379039; x=1759983839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y2QRGst729/DWiP4I9nqZ3Qxmv8ECUfQin2YGfwodis=;
        b=dZcQdV2tf7nhqlfy2QYs+8qhAqZbjonFs3pUPLBC17BUeGLd8cCLj6wr3XZgzhSpQb
         BnWgO6/bcq9SncX2Ovav9sSFTLmjFQRpbK9itOFIhA0+bHvGjZUufJ3q5xqUx/CwxXW5
         5bZUl3uj0lgTrYmwbf2OgpbaFLlO8IRPBzWKN4Pncd4g0+b8vpeD+tHPj2En2YPb3wRC
         hFUAFHfXtNrNbitZ2pmRQY6gSviuFpprgSyUVASdPPivy+Ujnu1ptcSifpp5QTxYYqoJ
         pr+08i4+qpjnR3wTMtz3dZzi/c/3HwqKa71U2CrFL+Z2WuN81dmnFHBe4qiRtXkMWcLU
         8iRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfS65cW3Ftu6ML7IRjq4Wr+h6Xb9/1nD8B6ZWTt+/OOdNGLlw6kO6kdzZgDj/HW7/cN+oitlLdA/+yqPBvBkMB@lists.infradead.org
X-Gm-Message-State: AOJu0YxDLYsOVU5UwXO0IGa0DynbMkZrNK5rbqK0IlpgRLRI7x3ICEos
	kAl7d9OiU/oPKgZoCIwWvX0ddtmZQPZk9oVTRPqLlc8N5nMPE69Etl9FJZNpqro/hTaKBYM/1uk
	NACcGcW64lmH/c2M6Z6k3iDjHOoFELLY=
X-Gm-Gg: ASbGncscQkieZy6CJVwO+v6sgVNHq/1SEQ8BiIVhYnILavsqHLMsM3YHUiPAEe2FBv0
	R4zfHXQbDVQUS+rgMunP6aOdVSFJgmo9q/5ZIL2KVZdTFtO0IDCuFSlWy88/JBfPnGCgEi8eiv5
	mc+qbe9rM6pEL+mBzGXpEw16gYQWkyQ8eS5H98sLx8yuo7D9Hg+uuiUfPrYPV4jIHMSxw/l9uPv
	Uz0GHbGsUGHmS4m19/m18X/y4D7v7Ya
X-Google-Smtp-Source: AGHT+IHgkuju9CUwpPT0WwGqt9+xSzAjEsWxHRza/bmAnljDvo45aLWn/1dVAmMuO1OQzeCs6YLRY6uoy1Dxbms4f2k=
X-Received: by 2002:a17:903:3c2d:b0:269:8072:5bda with SMTP id
 d9443c01a7336-28e7f45aa2cmr81883465ad.54.1759379038825; Wed, 01 Oct 2025
 21:23:58 -0700 (PDT)
MIME-Version: 1.0
References: <20251001-yv5_add_dts-v3-0-54190fbc0785@gmail.com>
 <20251001-yv5_add_dts-v3-1-54190fbc0785@gmail.com> <20251001-bonding-surging-af8cd0d09e07@spud>
In-Reply-To: <20251001-bonding-surging-af8cd0d09e07@spud>
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Thu, 2 Oct 2025 12:23:47 +0800
X-Gm-Features: AS18NWCewZBOJ3_bvPqMIiAefrcZiLRdaKPOQ3p104CWc2zI58_oYaZj_KaxEko
Message-ID: <CABh9gBcKt1zqvMQ=390HESPR5KrA42jaMFj9Ca4qmeS0d0ToAw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: aspeed: add Meta Yosemite5 board
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Amithash Prasasd <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, 
	Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_212359_759167_CC3D7FAB 
X-CRM114-Status: GOOD (  18.62  )
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

On Thu, Oct 2, 2025 at 2:33=E2=80=AFAM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Wed, Oct 01, 2025 at 04:47:50PM +0800, Kevin Tung wrote:
> > Document the new compatibles used on Meta Yosemite5.
> >
> > Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
>
> You've repeatedly ignored my ack, so I assume you don't want it.
> Maybe you want a nak instead?
>

Apologies for ignoring your ack repeatedly, that was not intentional.
I truly value your review and will make sure to include it. Would you
suggest that I send a v4 to pick it up, or is it fine to carry it
forward in the next revision?
Thank you again for taking the time to review my patches.

Kevin
> > ---
> >  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b=
/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> > index 456dbf7b5ec8f4442be815284e1ad085287dc443..6f2b12f96bd6ce31b4175e1=
09a78d931dffdfe28 100644
> > --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> > +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> > @@ -89,6 +89,7 @@ properties:
> >                - facebook,minerva-cmc
> >                - facebook,santabarbara-bmc
> >                - facebook,yosemite4-bmc
> > +              - facebook,yosemite5-bmc
> >                - ibm,blueridge-bmc
> >                - ibm,everest-bmc
> >                - ibm,fuji-bmc
> >
> > --
> > 2.51.0
> >

