Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10562D44172
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 15:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dlci+2BKdigoipxB8Vb8O10YHCpzCE4DRKacOckTZAU=; b=5E/x4lGV8OGJN0UmHMJFBXLCqB
	ThrMYlm+mmQVDUH97p2I/uoZfgy9E1Zo8cYYvOcwfIXH/CowPOMdzdDFZWv4GkoXKIHfihFKiEvTT
	aovINRB9JPVW2askdHwxdv11+6hqH/SNk+V3qZZje2NMZlSzLb/0knqeD1Zp3b4/vbCX8b0oUjFtj
	j+VRkIG+izcqPURh2bi6vDzXOlTa+kowmMBJJd7PdOZLlTn7JuqeYGK44g4hnycrQ4RNiJRsLzOub
	yF5nIElF7ky0d0gtxCyplSoW0kGhJmsvwmYvRNXEvGgfU61zJb2xzj5OdoWr0fCMsuu5R634LiLDC
	82YVGwnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDQ7a-0000000Cr06-0omt;
	Tue, 19 Nov 2024 15:26:30 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDQ6d-0000000Cqre-39We
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 15:25:32 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2e56750bb0dso2367529a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Nov 2024 07:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732029930; x=1732634730; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlci+2BKdigoipxB8Vb8O10YHCpzCE4DRKacOckTZAU=;
        b=U5RQXfP4KfRG7CRtsenJDdvOjpmJaKxIMDmb8/amrM27hv9yDjOfMCIhJIgW7bo3N+
         e8//Ara0uY7Mh5vXiGulp4UxaD8Z+Z/LdJJ10Brke5Wgn3XsSy1fSpAVrpAW6lRZHf2k
         uIxGcuE1WyiHXySZ3By57GfkV6TZcgJdG7hpKwjMzz7RqSDt0GATQe+1i2igcnUNCs3p
         ujaPiJ5ymqOghzjamZCW/YmrheIBKZo603ZRzGgaWfQz6rXKXnLe5Xzf9pO5vraDYEOC
         /yLqVittaJbO5uG8FCZdYxsffWhmkdB0viRVju3wPMzxudPL8+GFZzcAln6d5voXwlQ4
         4IHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732029930; x=1732634730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dlci+2BKdigoipxB8Vb8O10YHCpzCE4DRKacOckTZAU=;
        b=Whl9TXzS3SpMQeFglNFfT3aiLbU+cBZMbhhYZRSsppudWSZWFjHwubJzUp2ED9Dp+J
         xSlh6fVKqPhoPtpJG85LujbtTeNh1xI6VcvBIA2xt3PvPAv69X0o7xtUrJIjBuBi89QL
         aC0zy5Z7RBfOwhRkipoyTT07ZNkSGV8h3MCIJ+v3uimGEU2WjkY8e0YIDs9v4qt/aTXg
         sD18mmfCVY4cpuDnZrXI4JAdnJ2ayEOBoMqslJgk3CmsuI5ro5tErBaZkOO+/r0Omeg7
         gfn0O16OGYoIY3lbzjpO9aogh7rtltfejbhcv4B+0eaZVhS6olZWwxy30HhlTYv6zniy
         ZxOw==
X-Forwarded-Encrypted: i=1; AJvYcCVJC2Mfb4tD1GcWq9H/tXsIDw/ELA02R2v0KIMvZD7Byr80jOU6ihWxEyo3e+j8tIwNvjfbCgYoXqhB/kqv0Lsl@lists.infradead.org
X-Gm-Message-State: AOJu0YxH3qxegMJ/4ZN2jKKSbok0kLb+B4MPr/C22F/U2A+EkzNCr0h1
	OLWmUJ9YxrRU1Ci/V5FpF9xG2w33tTtjaujLCH4Kw7lo0S04cBQexLxom3WFUevQ0kBpC4TMF7S
	wvTqKU4oQ3ZoSzcVnK3aGjCHxFNU=
X-Google-Smtp-Source: AGHT+IE7/1v+nPPImVoZLSJAIkad+M/ZIXkCwHk4Aqn15nIJP6zl1vdILO2DJvmdjbejL4ELnTacW/VVIHzDh0f9LoI=
X-Received: by 2002:a17:90b:3ecb:b0:2ea:5823:c153 with SMTP id
 98e67ed59e1d1-2ea5823c73dmr11754596a91.19.1732029930342; Tue, 19 Nov 2024
 07:25:30 -0800 (PST)
MIME-Version: 1.0
References: <20241119130726.2761726-1-daniel.baluta@nxp.com> <Zzyn+i4khAqWBSjS@lizhi-Precision-Tower-5810>
In-Reply-To: <Zzyn+i4khAqWBSjS@lizhi-Precision-Tower-5810>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 19 Nov 2024 17:26:35 +0200
Message-ID: <CAEnQRZAG4Piw6NfQC7Yyc5-d2ymfq3YeL=FpV5_hNt26AzRhjQ@mail.gmail.com>
Subject: Re: [RFC PATCH] soc: imx: Add AHB to IP Bridge configuration driver
To: Frank Li <Frank.li@nxp.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
	robh@kernel.org, krzk+dt@kernel.org, kernel@pengutronix.de, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, aisheng.dong@nxp.com, peng.fan@nxp.com, 
	iuliana.prodan@nxp.com, laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_072531_788144_B83C90F5 
X-CRM114-Status: GOOD (  20.14  )
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

On Tue, Nov 19, 2024 at 5:00=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Tue, Nov 19, 2024 at 03:07:26PM +0200, Daniel Baluta wrote:
> > This is a RFC patch in order to allow AHB to IP Bridge (AIPSTZ)
> > configuration to be restored after a suspend/resume operation.
> >
> > This is particularly useful for aips5 bus where the aipstz
> > configuration is lost at suspend.
> >
> > In order to configure aipstz bridge we register a platform driver
> > that will set default configuration permission at probe.
> >
> > Because AIPS configuration is lost at suspend/resume time we register
> > a power notifier callback that will take care of re-initializing the
> > configuration at resume.
>
> why not use suspend/resume callback? what's happen if devices under AIPS
> suspend/resume before AIPS resume function.

We are attaching to AIPS power domain. So any device that will resume
will have first to power up the domain which in turn will configure the bri=
dge.

So with this it doesn't really matter the suspend/resume order
becasuse the notifier
that will configure the bridge is already register.

But I wonder if there could be a problem if a device goes
suspend/resume before the bridge
probe function gets a chance to be called.

> supposed
>         bridge@30df0000 {
>                 ...
>                 some child node {
>                 }
>
>                 so child node's devies suspend/resume will after bidged's
> suspend resume.
>
>         }

