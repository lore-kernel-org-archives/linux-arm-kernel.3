Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67374C7114A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 06:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c2UuokW54wt9MN5F9LutaDK9n7SplSyloAPC861qwOY=; b=yM704vyQuyQV70C/24UXqMUVae
	g78mIUe55xeeqQ3IAPZUi7pFEyabyh3dNehZNOGEf9NXuGtydcZ7U9jbnH6U3E2zixyb05XnTGdRp
	isgaFE1TJku2b9REVERzh2CfDVJ7G9UKShVXWnYvXtmKFwlU2mPRPCdJdCyDhMLsKh6XZ4Is7CknT
	0Qp9MYE22Yt3D2sLcBdn0l5hHCWLb+P6Gt4Wz+YQ8jSeO+xeqpE0mr6PZiNrfWRke8iom1+6vRlhi
	Q99oTqvvlG2INtJ0XekOxSQBhDip7LFf+vNeNBKxFH93b1vP8Pt0agXYrR10jGy8zgfF/iiUc7WNW
	cSs1EPLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRPre-00000006MQb-1HFs;
	Tue, 17 Jun 2025 06:32:10 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRPhN-00000006LU9-1IfD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 06:21:34 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-606fdbd20afso10784694a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 23:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750141292; x=1750746092; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2UuokW54wt9MN5F9LutaDK9n7SplSyloAPC861qwOY=;
        b=m1IlHYaDcvdafaDh2s1UGiyfNTao9K76E2mNYSJkQzHpRseJ+WdqCAr91tBo9xThkh
         tYjQ27dihxCaSUWiA9SA+hYCZ/bjepQzJdS+hpkgq+7mfmp2nXc7tm5SlEpdbkcnZDnM
         IMS9VKCG6KNdHKtzZcLFfvl+ykj2rY66KwTiB631GvlX1GeCNnOaeF8u8Z4BcoCWegR1
         cvodu3NIQBrIK/AkHQ34fUR/u74G58PWeDt48hoeiFLjSJbg7SOY7putX7E54k7FdJtn
         QMWNY8rEUa9TzPyFNamlokAlxTA6K/6LTZdQ5qMyK7v/vNmVgoqjOFA6u5EAUT1gSkWh
         Ij6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750141292; x=1750746092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c2UuokW54wt9MN5F9LutaDK9n7SplSyloAPC861qwOY=;
        b=sZL3K9knx3j0ByZNqLGsT9urkRAFFbR0GT2s+7mlw9o4PXzoH0WTlzhHHWUDHlj2CB
         IsnSnWGL23jhmSyQB6IzI13dUAXLXfU/SBp6Hzwx+NevHFtA0l+0V5FsXXPcX8JOXwHB
         FkXUtsaolc7ZGzKskH+OihOjOYhnz47lw41Xsd0y0DB4jOasnBHPQ4ArNJ+mm8jK77nv
         zJCF49LN2wwTMkgyZ/QyGU47z3nx+ge6GOVZfB/LJRg1u4hdDYrb7j3rPacrY9PrbHfs
         4YO4xSHch+DfK430bqOx+DkZOiM2S1LARfEYlHtpgjhXb9W+e87n1+GRUqKsC9fBDBbX
         H6Qw==
X-Forwarded-Encrypted: i=1; AJvYcCVt7wmDZXHuJhrK7RURTw+mreWvsy+1AJdjRYshWPldriRovN3NhTBpvovUKIqzispp/pofhiLI+8A86VtMLuxi@lists.infradead.org
X-Gm-Message-State: AOJu0YwnS/mkPvhbn7whDW83rWJ+GJlF9VcbelFelmIaSGRlO/uUvcaS
	iRj05/GCx9LvWKK35vMZNmQqGkCAMdw5M7ZLalcwDYrJzazESnudRRe11ywrB1QP+Ere8RQYOvw
	wMTJ2seebUTduRtCJtS/ln0AFQk2jGoY=
X-Gm-Gg: ASbGnctYtxvxanjohkQit16TX4Q1dW7RSak7dXA5sLVDPbJOpAcll7+ygBJDMmDgmgS
	unWai7zweT1s4JzwOu5IpqBwYM+HJbJ78P8NtkAFRkqIgueHs3sXUpP31/LccYhGzOgJFif/92K
	XeDRVWH0e9mUOhgkPBn/Y9g2gJri718IXQS6hwr9hnrJBYJg==
X-Google-Smtp-Source: AGHT+IFxUF5g/TIcrG4AkuaDUBaR7IRIy8c6YDoy9tRWHKQs6x1nkWdxwErUu8j9zWtut0cZKCyqMnLkAV1qbEz+elY=
X-Received: by 2002:a17:907:7ea9:b0:ad4:f517:ca3 with SMTP id
 a640c23a62f3a-adfad363e27mr1181082666b.20.1750141291649; Mon, 16 Jun 2025
 23:21:31 -0700 (PDT)
MIME-Version: 1.0
References: <87o6unnscy.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o6unnscy.wl-kuninori.morimoto.gx@renesas.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 17 Jun 2025 09:20:55 +0300
X-Gm-Features: AX0GCFsM4DBs6I8-bQT5AwgsqvW0n_kRZ8mdyyR2ebF7Ill_Vb4cdq9UawHCi30
Message-ID: <CAHp75VdE-ui0YkwRw3JMZTjvCTtcwAdZfKuzEBsyFNPgwZ+-xw@mail.gmail.com>
Subject: Re: [PATCH] arm: omap2: use string choices helper
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Tony Lindgren <tony@atomide.com>, 
	Andy Shevchenko <andy@kernel.org>, Kees Cook <kees@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_232133_365926_72B660D5 
X-CRM114-Status: UNSURE (   6.58  )
X-CRM114-Notice: Please train this message.
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

On Tue, Jun 17, 2025 at 3:07=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:

Missing commit message.

> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Otherwise
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

