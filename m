Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB86CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 05:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w25KogIBywA1a93/rf1RBOgU5z4hh07df7N09bLqYmU=; b=IyVE0Ys4w0I6tR3EIxRTyzdaSC
	q6n/wDrMc9y7MLHjug1GHXvwsJ+RkKlBtYUwg1owoDm0iCZANjOPjl76QKdY75Gi9rZNZIZOm5vPQ
	CJpTk7eL8YB+pNvaO98+U70dDkC8TqtN+bCXmxgMPuWRTa3ifPRK9fo33kxjM5FneygDPhNvC0sVq
	NvEtP2Id3AOz+PqqQ35r+B838QTPWfk+UPaQu/6r8hgOp5evD94ndAaU2+WzvIHBhJzEFVDGmNeFg
	TSb7pkbpf9vzDFRnp/kbGdl5TfdPWaP7/uNwX9MpLvkVNxpr7GlQgZXmZ+6QGAvcqncCI8NlrhAmr
	aJghR1Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPwFi-00000006lO2-0C9w;
	Thu, 21 May 2026 05:47:26 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPwFf-00000006lNa-0vm2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 05:47:24 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-8c921396e37so59960136d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 22:47:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779342441; cv=none;
        d=google.com; s=arc-20240605;
        b=lW5/eflVJTqEEX1KFQthWh3hGQ5XgSqt5sdDsAjjKGkri+pctHRLZ8jzFDsHCh92AD
         8MVRIBvBBvGRL4oYsBry6ujTH+tPQ9msYsOHJBzgIw+aFr/2QZjemSZuzoKpKxT5zQ87
         PKeusRd/fFFMIuSFQa4S6sq5Mgqd6o094f+kwl5GNOaOWQqMz2yiAv+Cpr25yB4tSMda
         uDxSKkoSP/Pr/RsAKQj4Qyay9PEAdbkSfjIFpFXHnYhzXSC50jQG9NnsxoJqZBMVpvXj
         DXE63N4fGEvDh6nYZo7hAQz+amHDMzn3d/d/ylCPGY5G6EMryJKUoNASCIn+xTk2CTX7
         5WXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w25KogIBywA1a93/rf1RBOgU5z4hh07df7N09bLqYmU=;
        fh=qKqMt81K+UkQokgHqjwmOxfXIptiRxF0DVQUh9w3ZgA=;
        b=P7b6Ip6HvtSH1dITBK0IH8h+mM23HEcyOVG63KmU9qT4t+u93VUD/zslPkXuslVLj4
         PNN4oeC3xuni0LMX5OdEEf1PSIuu55FtXrxib0XhuK9RSEZhvvIPz8fARF54Cfy4pH2F
         WofCh2cmTFheBwz80FCUuXxUiJOnRNK596N/hF2UHv17b8UYR2IlvlZ63qd+ykY5h+PS
         YchY5TwDperTb9HMyBBftn4+eH3kVtyouWtH7DrzbBtRDem0t+RJBJQWcMrvUICpxC2q
         ByWKo/7ZusLTnNzW4Iu5EfA+IiHp+UrC0WE5ygXMNAjxDitGrcQQhepG30iX4OxlZEcy
         hrlQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779342441; x=1779947241; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w25KogIBywA1a93/rf1RBOgU5z4hh07df7N09bLqYmU=;
        b=fw6bBEKw6fP87j8ysqmP5nlOJF0Zaf8evI1e4pYdckC/tcg89/nvUi4hUSgKDZsu0q
         NFJ4C34YE+Br/x74C3sh+nw9O+0nSABq1g4dN4pRuNj8beVzBLvlM9wXloVJxJ/GEvj3
         BNTFh3Cfgx53OJDpDooYpqTFETviR0f+OA8URsVAJ/NHeKKG/uIjPEYACT6F1AB6zNQG
         mnfDThKZPnpsQBiNcL8587lu4bKooC03Qsjwl+VdWJ/sliqKIYbiTqyqnY/EVolbMMLB
         s89f5hB/3vIykYOwAzn4VPxJ9OmI0T6h9DY+EhX7gHGZsR8xHmVuJM26fN0nUHeJD3Qk
         woSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779342441; x=1779947241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w25KogIBywA1a93/rf1RBOgU5z4hh07df7N09bLqYmU=;
        b=czeZphVYrBKJt9RLoQmFl5UV9bYatLZasw053OFrnnVYFYoD7yjJIsA2blT6UIOONY
         emlLyvciCtCh8P4nH6jA78EB2m4SkASShZAX+2xQjdDNkvxToHAm5w2pNeY+0nGwQMf+
         i2gFPCQ+PzeYoXpj3QcffRmpDjMyULXsObv/8agy0aiBFXricg1mj3ik1MQOAVhk/rjL
         BD40E+rwa6EBDVMSa+0KxBr/YG4h72igo4s8UzDeJe7RMqfe4q8qR0xEYqvehcYJSRZ2
         pXUk2jyXaN6KcM2yO17wxmLY2+RRQWCuFTxK1Zb3ftSG4XUxY0dEoLUE0WZkZMVdf60f
         SLJw==
X-Forwarded-Encrypted: i=1; AFNElJ+yyun2FHJYxPOE/Lm7GrPqMSDsG7+qVVm9Yzu53SyBKFLcm5h2iT4ZJ1KVOJ+TlnUinzKlZ3ldmYBWRoEb+3Ys@lists.infradead.org
X-Gm-Message-State: AOJu0YycuwSS7iIkneO3CZZ79aRYCka3Ot7Ku7/96Nzw3DiQInN041TM
	rqJEhGwChpY4fq4WO6z86hstNuAWtUuOGt3s294o4hO77vRh1EiOZmQF2BaglFkNi5iGtC+aUhK
	vaT+wEOdAlS6ZVtXZe7NN76aWh4Jimm4=
X-Gm-Gg: Acq92OGTszQiv1/e5xoz6N1RQlATpzRwYeGjISAfYBpOok6ibEJ9W4GXnmS/XYdCuj/
	lcMBsGoucKI9gbhQO/PTHC7cNEo79FGRB2WkvMX9E3JqFf53RTHYcMIZwhuGTn6Q+o2UVLA8y94
	bM91UHfQqK6L20lfsXmKQ4gksr0mCC78Rolhq1f/wLQxitqxQEg/tu81ZNFQlSBaEs7Lbqty2gz
	b7OStEMvyCVGAabNAVgDhTeYfM4BCNOxIlA0K5yvGza3WdMwqfe96fV0LDNM0eNbnjM5Ef5lCKa
	1W7MAV+aaRbvypRTtwhzykZvxox9p/mbcI/vM3vMn/YXhby8XQ==
X-Received: by 2002:a05:6214:4589:b0:8ac:b1ad:3a24 with SMTP id
 6a1803df08f44-8cc6e369142mr24275146d6.27.1779342441405; Wed, 20 May 2026
 22:47:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260509193928.19030-1-manishbaing2789@gmail.com> <agnY16I4sYAdRd9T@monoceros>
In-Reply-To: <agnY16I4sYAdRd9T@monoceros>
From: Manish Baing <manishbaing2789@gmail.com>
Date: Thu, 21 May 2026 11:17:10 +0530
X-Gm-Features: AVHnY4KAzV-NI5cDZgO-6QHQZfraoFlbvvmbGV2Hd6qkCVQ1Ph4LlYmyO8Rq1VQ
Message-ID: <CAJvdc_enTOF=+1rumSz4FD5T1ME0fnJ+SVC+jMuOTMxzyx8P1Q@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: mfd: st,stmpe: fix PWM schema and drop
 legacy binding
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: lee@kernel.org, linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_224723_267369_3C38D368 
X-CRM114-Status: GOOD (  20.81  )
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

Hi Uwe,
> If the patch was split into two, each touching just one of the files,
> there would be no need for merge coordination. Also logically it's two
> patches. Would you mind splitting?

That makes perfect sense. I will split this into a two-patch series
(one for the MFD YAML fix and one for the PWM TXT deletion) and submit
it shortly as v4.
Thanks for the feedback!

Thanks and Regards,
Manish


On Sun, May 17, 2026 at 8:35=E2=80=AFPM Uwe Kleine-K=C3=B6nig <ukleinek@ker=
nel.org> wrote:
>
> Hello,
>
> On Sat, May 09, 2026 at 07:39:28PM +0000, Manish Baing wrote:
> > The st,stmpe-pwm binding is already covered by the MFD schema in
> > Documentation/devicetree/bindings/mfd/st,stmpe.yaml. However, the
> > PWM subnode was missing a 'required' properties block. This allowed
> > Device Tree nodes to pass validation even if the 'compatible'
> > string was omitted. This omission could lead to probe failures
> > at runtime.
> >
> > Fix the schema by adding the missing 'required' block and
> > remove the obsolete and redundant text binding file.
> >
> > Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
> > ---
> > Changes in v3:
> > - Added 'required' properties to the pwm subnode in st,stmpe.yaml
> >   to close a validation gap identified by the Sashiko.
> > - Updated commit message and description to reflect MFD subsystem chang=
es.
> >
> > Changes in v2:
> >  - Droppped the TXT file instead of converting to YAML, as the
> >    functionality is already covered by st,stmpe.yaml.
> >
> >  .../devicetree/bindings/mfd/st,stmpe.yaml      |  4 ++++
> >  .../devicetree/bindings/pwm/st,stmpe-pwm.txt   | 18 ------------------
>
> If the patch was split into two, each touching just one of the files,
> there would be no need for merge coordination. Also logically it's two
> patches. Would you mind splitting?
>
> Best regards
> Uwe

