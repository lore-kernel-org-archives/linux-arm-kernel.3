Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6489110F2867
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 18:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nd4uDnLevu0tSEkSmPLwVZpLlNwGK5ZHbNTrNexbWPI=; b=EDw9wYHZnYBNJDo66kFN7LQzK9
	5ImorRQ1687MVcJqGVJU+9eRHrmZ2GALaLZh1t2dtoR6XmEINtO3MFslFME8XKn6cJ4f6euA5aqFA
	rVtoonr2NCANZmH0ePowGrPsrO3Jksv2bHH6yvHrjy7CrLclpcMZuTjCHi1jDDGwdSXhOj6jb+SZ/
	b0vQVgPqUZuDp/CsF53+wogy62oEHPmw3DeFqPWtXbGLdfWAxFLJaBWwGpmpHPE98V7AcX2CupPlC
	vwuIginIxUZewO93VnKzy8jUgA9IbnqGqHLpD50fAfNx16S6Ou3Fpc7dlQWCUknZv5ZZRMX8/l73f
	BYDyJ7Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6C84-00000007xTY-1G1z;
	Fri, 27 Mar 2026 18:41:56 +0000
Received: from meesny.iki.fi ([195.140.195.201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6C81-00000007xSi-0cbV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 18:41:54 +0000
Received: from darkstar.musicnaut.iki.fi (85-76-0-165-nat.elisa-mobile.fi [85.76.0.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4fj8cp0W99zyWr;
	Fri, 27 Mar 2026 20:41:46 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1774636909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Nd4uDnLevu0tSEkSmPLwVZpLlNwGK5ZHbNTrNexbWPI=;
	b=y+R8JQPx1CZdyXpc/Pg1KSZghb0AScXqB8cUDX0LFrgdmol7eT1O39u5F50t/7fTz1iaVj
	65HMTuFDzg8zjtqiRrGTIGy0Br5DOsyTWa4/M4oUJiI/6xelzTO13pE7lvMbK5xo1myE5J
	7HdGS1GKMzoajzFFD4v7CohixFGSVkI=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1774636909;
	b=WxuI5szQ8sU0yI1aV+gZrUYh+Dpd29NAqtLJPxivWjLmw8bkx1y37p0Ic6WUK0068sWxzS
	PbzMQQb3lRCHttJL2YHJ8RtVQvv5gIPnoz4bkBb5pYSoqaqvQKqBYKJ/gcYOvdfL/VHguW
	ug9hzVYiWutRBnXLgcj66Fyug8QD0Ds=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1774636909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Nd4uDnLevu0tSEkSmPLwVZpLlNwGK5ZHbNTrNexbWPI=;
	b=FXkMIcPmx3d4tetmZV8ueEij7WaPT5f7A8rcTtbEHDZ0NINRYAKTKDR3d9PCtBnVWt9pkP
	zrGxhwRJu8OBgJ7MuD31wpiOZ0zlXPNbQuCKVmIb6pfqH8fQ4xJnSNXS+UkNHz1WoNRSOZ
	NvrWJfUHmEZEcnHw3fUqH1soK9ucuAc=
Date: Fri, 27 Mar 2026 20:41:44 +0200
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Linux-OMAP <linux-omap@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Kevin Hilman <khilman@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [RFT PATCH v3] ARM: omap1: enable real software node lookup of
 GPIOs on Nokia 770
Message-ID: <acbPaKSLVXjiIbfU@darkstar.musicnaut.iki.fi>
References: <2fb42d16-887a-4564-8e50-c9d6db564c4e@app.fastmail.com>
 <CAMRc=McYj-D8XL_wnmTEucMrwCy1-xr7h0XYrL68soMVHL1SRA@mail.gmail.com>
 <7h1phxpzml.fsf@baylibre.com>
 <CAMRc=McosSU39SERKtjmhJdTv2cPi44PG=bYqAcfQLDX4QB0Tg@mail.gmail.com>
 <CAMRc=MeYMe1gXjiYuQJpNWchp+V1uLkuRuyO3ohQjfAcg9q3MQ@mail.gmail.com>
 <acaOlGcGQEZHQ_mJ@darkstar.musicnaut.iki.fi>
 <CAMRc=McDdK8Y7wtG8WObjD6WF-2ftKBDwKbvj=xL-NMfeV=bPQ@mail.gmail.com>
 <aca3ajb_G3gD24S7@darkstar.musicnaut.iki.fi>
 <CAMRc=McVPskF4pMQSz=hR8CkyZhoPmCU_yJFT66vgTCPJd3-Vw@mail.gmail.com>
 <CAMRc=MeUEApQuw8prxr6ku674fqORCy2=givJxLe+cUCC0PGww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeUEApQuw8prxr6ku674fqORCy2=givJxLe+cUCC0PGww@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_114153_362681_71B85111 
X-CRM114-Status: GOOD (  16.54  )
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

Hi,

On Fri, Mar 27, 2026 at 10:27:07AM -0700, Bartosz Golaszewski wrote:
> > Thanks. This makes sense. Both omap16xx_gpio_init() and
> > software_node_init() run as postcore_initcall() so if the order is not
> > right, it will fail.
> >
> > Cc'ing Andy who's a reviewer for software nodes. Andy: is there any
> > reason to run software_node_init() as a postcore initcall? It only
> > allocates the kset, can we move it to core_initcall() by any chance?
> 
> In any case, Aaro: the following should theoretically fix it:
> 
> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> index 51320837f3a9..5ba904f8a08a 100644
> --- a/drivers/base/swnode.c
> +++ b/drivers/base/swnode.c
> @@ -1134,7 +1134,7 @@ static int __init software_node_init(void)
>  		return -ENOMEM;
>  	return 0;
>  }
> -postcore_initcall(software_node_init);
> +core_initcall(software_node_init);
> 
>  static void __exit software_node_exit(void)
>  {
> 
> If you could give it a spin and let me know if it does, it would be awesome.

Yeah it helps. With that change, both OSK and 770 work with your patch.

A.

