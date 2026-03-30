Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C6491061B20
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 21:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y/4gRi5RHE4lEQNk8r3GZP5jsAjQXbbb0ZHPhMUySrM=; b=ViKNSbkiH+gCde1YdmvgbQDIS0
	z6O0H/PkP1YVmPr2fI1XtvbuiewOfVxwSUoLlfHdhKHDAkGyGNrAjPmPFl1yy+q1PNZGxB5cq13U7
	gO5ehnO/gpCn3j7naPA0O4WGvv4W+zeSk/69+dx2le/MoTj5TdOzqvqAWeIi1GhCSATESlj3LaY0x
	OaveaTH39YcPmefFiQlUYGeqXEszJoqFe+0jyiU7zs+jkR2nIBqIOUgZK8KnldMd0Vt/k3oMXF1On
	cOOs0FicDleXeYwqZbJHOWlCSFb3UInvJ75T0wjrNJHubQ9uwIXvbisktUn2ZpcWhjvUIp5k1fBrD
	Rrgi38gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7KRh-0000000BvSt-0hXn;
	Mon, 30 Mar 2026 21:46:53 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7KRf-0000000BvSZ-16z9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 21:46:52 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-2c6f5574d3cso519144eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 14:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774907210; x=1775512010; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y/4gRi5RHE4lEQNk8r3GZP5jsAjQXbbb0ZHPhMUySrM=;
        b=V/HZTzYhJL/9IARSBkyGfZI1xdZeTE3dQSbvhQ/cI57JBzY9w0G+DPoRvLlYLMMJo0
         qwx9Bn7MHN4JujmkhqGZIBXmLKQ2Ockr/vrDewz2hAdVNhTsBVUXRtTBV6jvmOuFUhy3
         WKtbIBcPGNTEDCXgPu1n97KyUT7yRWaxygSI0/tlJS9gDKuX6usZ7E4VbCgvrG4B4vuc
         0RXxghjZGGrBLbSy+/6s1kOCEvlgv4GU21UvJMjCnguOcteDTGlyHc53B8oLANW+ByD9
         cfL9KrGPX8OOieGZjksFCB+DuebJ0t5r1St2P2SjC2uFgGRdeSG3ohBNY1HM0770Bdry
         Y8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774907210; x=1775512010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/4gRi5RHE4lEQNk8r3GZP5jsAjQXbbb0ZHPhMUySrM=;
        b=AOJ8+rBmgRnbN4nt1LLZoYcNx/2tLQFRwZqQEC5SU9StPrLmEpGxGuoie8p367jihs
         blXZtNaMZXnFply+lbuFyDDOiPmq+Mdcb59sC/A4V9LKOcf3rAgyoQvcJP48YalIEQ4Z
         8iOYz3/OxZ4v81CfmRSAyme74wnI1SFsCVs85Ko7SoRGNd0mIe/z5wNgUBkdQrEdDiPX
         xWq3B/Vp1xKbuhRIZIsZaDam4q57KZzcxkMV2zpK9DY5NFY+YdqgOZ7xcKLC4dkeu5tJ
         3PA24dY1xmBYzBTfhDbIIkfUMCtZa2yIZilJsbGAjOVkZaQXFs/DLrmUxQtrLnGWQAvx
         eDJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtBvAB065ahsOqk+hD3xWchhRGHQtcmG857sE+ULQf+7lglFUMC3ovV2aiS9fJ0Q41mVeMvkiLGoFxHh2KDeqj@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+87DboNXT4numzWZwYUmlnASW4UzTwqRNbP2eWXJYfzwFK4ZX
	zpN4sSi6Lj4mFVa7lirnUm5ZO0GccaUPsurY6L+Yzfd39XmW1I1h2cK0
X-Gm-Gg: ATEYQzwXTp7E5N/hRw2i9coAQH9TK4EQAXMJn1euO942MCCTEV34j3JY6LPP+i2lSKa
	omFUXbe23tznD5SHmrl3aPWYGFCuV1rTYSZMjMr8MwPi06KHl6ok4tQ5C0NGPNqb4urcuRhDTLQ
	VdRfdQ+uf6bB30GydikOC4niwwKt4B4aq1cic7SUC/EbkKMrmktfI5tcfamEnk1cSya4zp7xKys
	gjUqO0jzzU41c8yGUri11F6ESzOL13g9wzklhXRXAZhx2AORfTcST8Nw2j9Yrv/mC1ZuDxnoVTg
	KQV03TWApjDWkhdOhrbbCNHVEOuBvAz04Z8xjY0YwraygHDOSOGlwtv9blEF/XxLgGAbJOAi0rv
	dgpEYnkjEieJvvhclX5BDDXfmVCBb0JGX/OFh5TcqOJb0m2uouvSPx3/ivGvQ+VrXxC8nSOE+xy
	m2J0i+MBG+WHfeODXd2EhLz58piKGwubrT1rKhrhCvFgn15B2biLRDji0yXTaqxdFk
X-Received: by 2002:a05:7301:1f17:b0:2c5:d833:a507 with SMTP id 5a478bee46e88-2c7bc35b062mr700637eec.12.1774907210198;
        Mon, 30 Mar 2026 14:46:50 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:7f4e:2749:b37a:e9d5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c68b2721sm7751610eec.14.2026.03.30.14.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 14:46:49 -0700 (PDT)
Date: Mon, 30 Mar 2026 14:46:45 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>, brgl@kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v4 2/3] driver core: make software nodes available earlier
Message-ID: <acruxMNdnUlyRHiy@google.com>
References: <20260330-nokia770-gpio-swnodes-v4-0-b68592e977d0@oss.qualcomm.com>
 <20260330-nokia770-gpio-swnodes-v4-2-b68592e977d0@oss.qualcomm.com>
 <acrcDTPpXZ_5A4D8@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acrcDTPpXZ_5A4D8@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_144651_305173_560846CA 
X-CRM114-Status: GOOD (  15.84  )
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

On Mon, Mar 30, 2026 at 11:24:45PM +0300, Andy Shevchenko wrote:
> On Mon, Mar 30, 2026 at 02:40:47PM +0200, Bartosz Golaszewski wrote:
> > Software nodes are currently initialized in a function registered as
> > a postcore_initcall(). However, some devices may want to register
> > software nodes earlier than that (or also in a postcore_initcall() where
> > they're at the merci of the link order). Move the initialization to
> > driver_init() making swnode available much earlier as well as making
> > their initialization time deterministic.
> 
> ...
> 
> > -static void __exit software_node_exit(void)
> > -{
> > -	ida_destroy(&swnode_root_ids);
> > -	kset_unregister(swnode_kset);
> >  }
> > -__exitcall(software_node_exit);
> 
> 
> Why? What's wrong with the __exitcall?
> 

It's dead code. Always was, always will be.

Maybe split in a separate patch, but I sometimes feel the idea of "one
change" is taken to extreme and adds to both developer's and maintainers
burden by needing to keep track of extra patches.

Thanks.

-- 
Dmitry

