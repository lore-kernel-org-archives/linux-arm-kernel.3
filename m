Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C31CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 10:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uxrAHwkq6N30vPdNbtUVCZGt3V13VxNE34DEWAHquig=; b=pvhUeqoSK5C05e7xVDa2sIXaR9
	kpHLuSMx19qsLbslSnpWTvwv38x58Ja9TgNunXpaDFCUeonBt+ckclxeDUjFaXxsJBrMV2odsg4D9
	ihqBZaOioI7A8/aYZWGEYeV1AoWpmGjsc+YnknAyQoc9NNG+rayVl8vD59C6W7pRTjSugp5KQduIx
	A2dnnPeT88GxtQ9BjSlC0co0l/2xoIH5BHfA/WW9RZj10i3S2gRemW4n4atDB0IOPPgcdtchJktmq
	m7MJYbfvKiglHjhJviQ+GIrdw/cf/0L97dv9s3kcugKzndg0dtvsznaeKNZA3Wu9uGo6meOELjr4f
	c+/a03jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGEHM-0000000Bc4X-0M14;
	Tue, 04 Nov 2025 10:28:44 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGEHJ-0000000Bc47-0qWB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 10:28:42 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-b98e6ff90cbso2133821a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 02:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762252120; x=1762856920; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uxrAHwkq6N30vPdNbtUVCZGt3V13VxNE34DEWAHquig=;
        b=YXWy4mACpixzz5Zi9IwXCF2urvci6/xE3RpIR5AEG593V6dXDAQwFnaDS1Dl0qaP7V
         yYONU0JX4X5e3y/7OyPGhGjvb2NqW6rV0wlO7QR2eH+OM9re7+L6lPqWK5Y2AnGUkq2F
         p8pwOKueABvDLLRBba2m+jG5F997tkfn26JqDC4+UOKiSUG6/1NADm6IvmBHGnzl9uOE
         fxH8EwiuBejArlx0Wdd27+sHUxTkLhmZnCwXMsay+RPIGQkmQHs8jMATbDBc6PrZdx9M
         rsfT0q9lfVoVuQeiMpjQVtT1TpaujBeD0koLhea4GF+lVWvDpOn/ENfRHFTVOJIJyOe1
         hQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762252120; x=1762856920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uxrAHwkq6N30vPdNbtUVCZGt3V13VxNE34DEWAHquig=;
        b=bi/3C9uKM9YX38w9w1tcswasNqa53FHp5yJyuRAoCqnS/qd5Gvs+B34nHKh5hQh2gO
         DURnB1SDw8S+tyMac8IiXtaiJEwKO3sj5gJuTTITgcM6TptP6xAUdXghJp9L7R74ffr0
         WYSpW4ftVZ90Mx0cTJX0S3Ji24qYfgiZ1o+aV/HGqkvwMQXyoJusN23vCuHu/8Jcsu0d
         1CG5PWAnYfmOpLg53vbTB214UaA6R1Jp/VxknifOjhcZ2sQ0RdniRuK3YBy1jgzaFlco
         kC2Jfdin4G+LN9O9a0taRtzMyO9TH/0h4afu52Rb8zIVpJ+9//dACzGs6vTfIwbJQkdN
         Tghg==
X-Forwarded-Encrypted: i=1; AJvYcCWwuWMgYdS2LtsPzOhy+P+RYlQ5uFM0oEfS44r8XcNUzc4UjshZ9s7Sfw7XA6FzFdKSWLB2O080oJEUoZgGXyJ5@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+zoWThMTzlq3Np95OVpcO5bh6sahnN6SM2VG6AUaJEVtmjIhE
	1Sk31CHhZWAOD7BGjwsky9aBJsc2dbZ7XHKLyQ5fCdosM+vh+BpHLICX3pYj1cb4lHYO64L4IIk
	HlZyA36VpMNLVEKAuTLnLlxr8QDQ/WlXoOae7uzk0
X-Gm-Gg: ASbGncugTNQgmAPiFGoWk1yW9ZGTVjKAoZ1q8+cH4nceZGUjfKVG9R+v7DItKquIydq
	SXGTSds0mvnEuLvo1tT6o6JYAT03OHyq626Z5lGybVgO8L7ld+xCV6rDDn8xB7anzCTdIejpwnw
	hPZ5KtTx8pT2t6GRZODN1zQFux3UHa9HPML6nhE3QauGWu7TzuOcRqP1+Ql8w9YarGtYwwcF/gd
	cZa7umqRBrozIj0dIFS0K68FfsDdNmdmCuJaWlgnCkB+VV9tROwrcavOk7ESHmb12bZMK0=
X-Google-Smtp-Source: AGHT+IFtWCITnsqCpapCWEO1jfYZL/VVdrKbyDrZUYMRozSaaP1/me7PX/YPZoiJBaJe87Ul4D28jeHU7OTgnpSDtH8=
X-Received: by 2002:a05:6a20:549d:b0:341:5d9f:8007 with SMTP id
 adf61e73a8af0-348cd21b580mr22355749637.57.1762252119315; Tue, 04 Nov 2025
 02:28:39 -0800 (PST)
MIME-Version: 1.0
References: <20251017233459.2409975-1-royluo@google.com> <20251017233459.2409975-3-royluo@google.com>
 <20251030011659.bmgdry3wwf4kgjwv@synopsys.com> <CA+zupgxPYXCqew1548uwGx7=9u0b5oCwaXfP7F=FmqMR7a5bDw@mail.gmail.com>
 <2025110128-jailhouse-situated-22b1@gregkh>
In-Reply-To: <2025110128-jailhouse-situated-22b1@gregkh>
From: Roy Luo <royluo@google.com>
Date: Tue, 4 Nov 2025 18:28:02 +0800
X-Gm-Features: AWmQ_bnRE9DIQMXPkKDyyG2DDLmVc1ZLrXHYPMXtrjkVwdpu0f_b01Bk7DLUsug
Message-ID: <CA+zupgwOx5hADbHC8LbxkcsFBfgWyssqnRgE+YXy0umZmj6XNw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Badhri Jagan Sridharan <badhri@google.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_022841_241606_DCF1BE9A 
X-CRM114-Status: GOOD (  19.89  )
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

On Sat, Nov 1, 2025 at 2:10=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Oct 31, 2025 at 05:49:28PM -0700, Roy Luo wrote:
> > > > +         dr_role !=3D DWC3_GCTL_PRTCAP_HOST) {
> > > > +             dev_warn(google->dev, "spurious pme irq %d, hibernati=
on %d, dr_role %u\n",
> > > > +                      irq, google->is_hibernation, dr_role);
> > >
> > > Should we limit this print and do we need this to be dev_warn? It may=
 be
> > > noisy wouldn't it.
> >
> > Ack, will make it WARN_ONCE in the next version.
>
> So you really want to panic your system if this happens (remember, the
> HUGE majority of Linux systems run with panic-on-warn enabled)?
>
> Please do not, handle the issue, dump a message to the log if you really
> need to, and move on, don't crash.
>
> thanks,
>
> greg k-h

Thanks for pointing this out, I overlooked the panic-on-warn scenario.
This case is actually very rare, I haven't seen this on the field and I
feel it does no harm to the system even it it were to happen, having a
debug log should still be useful if we were to debug anything specific
to this interrupt. I will make it dev_dbg.

Thanks,
Roy Luo

